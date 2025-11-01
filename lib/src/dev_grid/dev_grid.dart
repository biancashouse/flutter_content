import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A widget that overlays a child widget with a Figma-like grid for layout debugging.
class DevGrid extends StatefulWidget {
  /// The child widget (e.g., MaterialApp or Scaffold) to overlay with guides.
  final Widget child;

  /// Whether to show the layout guides (default: true in debug mode, false otherwise).
  final bool showGuides;

  /// Spacing between horizontal lines in pixels (default: 8.0, ignored if preset or rowCount is set).
  final double horizontalSpacing;

  /// Spacing between vertical lines in pixels (default: 8.0, ignored if preset or columnCount is set).
  final double verticalSpacing;

  /// Color of the guide lines (default: red with 10% opacity).
  final Color lineColor;

  /// Thickness of the guide lines in pixels (default: 1.0).
  final double lineThickness;

  /// Optional number of columns for vertical guides (if null, uses verticalSpacing).
  final int? columnCount;

  /// Optional number of rows for horizontal guides (if null, uses horizontalSpacing).
  final int? rowCount;

  /// Optional key combination to toggle guides (default: Ctrl+G).
  final LogicalKeySet? toggleKeySet;

  /// Predefined grid preset (e.g., figma8pt, bootstrap12). Overrides spacing and counts.
  final GridPreset? preset;

  /// Whether to show safe area boundaries (default: false).
  final bool showSafeArea;

  /// Margin width for guide lines in pixels (default: 16.0).
  final double marginWidth;

  /// Whether to show ruler markings along edges (default: false).
  final bool showRuler;

  /// List of breakpoint widths to display (e.g., [600, 1200] for mobile/tablet/desktop).
  final List<double>? breakpoints;

  /// Whether to restrict grid visibility to debug mode only (default: true).
  final bool debugOnly;

  const DevGrid({
    super.key,
    required this.child,
    this.showGuides = kDebugMode,
    this.horizontalSpacing = 8.0,
    this.verticalSpacing = 8.0,
    this.lineColor = const Color(0x1AFF0000), // Red with 10% opacity
    this.lineThickness = 1.0,
    this.columnCount,
    this.rowCount,
    this.toggleKeySet,
    this.preset,
    this.showSafeArea = false,
    this.marginWidth = 16.0,
    this.showRuler = false,
    this.breakpoints,
    this.debugOnly = true,
  });

  @override
  DevGridState createState() => DevGridState();
}

enum GridPreset { figma8pt, bootstrap12, material16 }

class DevGridState extends State<DevGrid> {
  late bool _showGuides;
  late FocusNode _focusNode;

  // Dynamic grid properties that can be controlled via keyboard
  late double _currentHorizontalSpacing;
  late double _currentVerticalSpacing;
  late GridPreset? _currentPreset;
  late Color _currentLineColor;

  @override
  void initState() {
    super.initState();
    _showGuides = widget.debugOnly
        ? kDebugMode && widget.showGuides
        : widget.showGuides;

    // Initialize dynamic properties
    _currentHorizontalSpacing = widget.horizontalSpacing;
    _currentVerticalSpacing = widget.verticalSpacing;
    _currentPreset = widget.preset;
    _currentLineColor = widget.lineColor;

    _focusNode = FocusNode();
    // Request focus for keyboard events
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void didUpdateWidget(DevGrid oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.showGuides != oldWidget.showGuides ||
        widget.debugOnly != oldWidget.debugOnly) {
      setState(() {
        _showGuides = widget.debugOnly
            ? kDebugMode && widget.showGuides
            : widget.showGuides;
      });
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: _focusNode,
      onKeyEvent: (node, event) {
        if (event is KeyDownEvent) {
          final pressedKeys = HardwareKeyboard.instance.logicalKeysPressed;

          // Toggle grid visibility (Ctrl+G or default)
          if (widget.toggleKeySet != null) {
            final requiredKeys = widget.toggleKeySet!.keys;
            if (pressedKeys.length == requiredKeys.length &&
                requiredKeys.every((key) => pressedKeys.contains(key))) {
              setState(() {
                _showGuides = !_showGuides;
              });
              return KeyEventResult.handled;
            }
          }

          // Enhanced keyboard controls
          if (_showGuides) {
            final isCtrlPressed = pressedKeys.contains(LogicalKeyboardKey.control) ||
                pressedKeys.contains(LogicalKeyboardKey.controlLeft) ||
                pressedKeys.contains(LogicalKeyboardKey.controlRight);
            final isShiftPressed = pressedKeys.contains(LogicalKeyboardKey.shift) ||
                pressedKeys.contains(LogicalKeyboardKey.shiftLeft) ||
                pressedKeys.contains(LogicalKeyboardKey.shiftRight);

            // Spacing controls (+ and - keys)
            if (event.logicalKey == LogicalKeyboardKey.equal && isShiftPressed) { // + key
              setState(() {
                if (isCtrlPressed) {
                  _currentVerticalSpacing = (_currentVerticalSpacing + 1).clamp(1.0, 100.0);
                } else {
                  _currentHorizontalSpacing = (_currentHorizontalSpacing + 1).clamp(1.0, 100.0);
                }
              });
              return KeyEventResult.handled;
            }
            if (event.logicalKey == LogicalKeyboardKey.minus) { // - key
              setState(() {
                if (isCtrlPressed) {
                  _currentVerticalSpacing = (_currentVerticalSpacing - 1).clamp(1.0, 100.0);
                } else {
                  _currentHorizontalSpacing = (_currentHorizontalSpacing - 1).clamp(1.0, 100.0);
                }
              });
              return KeyEventResult.handled;
            }

            // Arrow keys for fine-tuning spacing
            if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
              setState(() {
                _currentVerticalSpacing = (_currentVerticalSpacing - 0.5).clamp(1.0, 100.0);
              });
              return KeyEventResult.handled;
            }
            if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
              setState(() {
                _currentVerticalSpacing = (_currentVerticalSpacing + 0.5).clamp(1.0, 100.0);
              });
              return KeyEventResult.handled;
            }
            if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
              setState(() {
                _currentHorizontalSpacing = (_currentHorizontalSpacing - 0.5).clamp(1.0, 100.0);
              });
              return KeyEventResult.handled;
            }
            if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
              setState(() {
                _currentHorizontalSpacing = (_currentHorizontalSpacing + 0.5).clamp(1.0, 100.0);
              });
              return KeyEventResult.handled;
            }

            // Preset switching (1, 2, 3, 0 keys)
            if (event.logicalKey == LogicalKeyboardKey.digit1) {
              setState(() {
                _currentPreset = GridPreset.figma8pt;
              });
              return KeyEventResult.handled;
            }
            if (event.logicalKey == LogicalKeyboardKey.digit2) {
              setState(() {
                _currentPreset = GridPreset.bootstrap12;
              });
              return KeyEventResult.handled;
            }
            if (event.logicalKey == LogicalKeyboardKey.digit3) {
              setState(() {
                _currentPreset = GridPreset.material16;
              });
              return KeyEventResult.handled;
            }
            if (event.logicalKey == LogicalKeyboardKey.digit0) {
              setState(() {
                _currentPreset = null; // Custom grid
              });
              return KeyEventResult.handled;
            }

            // Reset to defaults (R key)
            if (event.logicalKey == LogicalKeyboardKey.keyR) {
              setState(() {
                _currentHorizontalSpacing = widget.horizontalSpacing;
                _currentVerticalSpacing = widget.verticalSpacing;
                _currentPreset = widget.preset;
                _currentLineColor = widget.lineColor;
              });
              return KeyEventResult.handled;
            }
          }
        }
        return KeyEventResult.ignored;
      },
      child: Stack(
        children: [
          // Child widget (e.g., MaterialApp or Scaffold)
          widget.child,
          // Grid overlay
          if (_showGuides)
            IgnorePointer(
              child: CustomPaint(
                painter: LayoutGuidePainter(
                  horizontalSpacing: _currentHorizontalSpacing,
                  verticalSpacing: _currentVerticalSpacing,
                  lineColor: _currentLineColor,
                  lineThickness: widget.lineThickness,
                  columnCount: widget.columnCount,
                  rowCount: widget.rowCount,
                  preset: _currentPreset,
                  showSafeArea: widget.showSafeArea,
                  marginWidth: widget.marginWidth,
                  showRuler: widget.showRuler,
                  breakpoints: widget.breakpoints,
                  context: context,
                ),
                size: Size.infinite,
              ),
            ),
        ],
      ),
    );
  }
}

class LayoutGuidePainter extends CustomPainter {
  final double horizontalSpacing;
  final double verticalSpacing;
  final Color lineColor;
  final double lineThickness;
  final int? columnCount;
  final int? rowCount;
  final GridPreset? preset;
  final bool showSafeArea;
  final double marginWidth;
  final bool showRuler;
  final List<double>? breakpoints;
  final BuildContext context;

  LayoutGuidePainter({
    required this.horizontalSpacing,
    required this.verticalSpacing,
    required this.lineColor,
    required this.lineThickness,
    this.columnCount,
    this.rowCount,
    this.preset,
    this.showSafeArea = false,
    this.marginWidth = 16.0,
    this.showRuler = false,
    this.breakpoints,
    required this.context,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = lineColor
      ..strokeWidth = lineThickness
      ..style = PaintingStyle.stroke;

    // Apply preset configurations
    double vSpacing = verticalSpacing;
    double hSpacing = horizontalSpacing;
    int? cols = columnCount;
    int? rows = rowCount;

    if (preset != null) {
      switch (preset) {
        case GridPreset.figma8pt:
          vSpacing = 8.0;
          hSpacing = 8.0;
          cols = null;
          rows = null;
          break;
        case GridPreset.bootstrap12:
          cols = 12;
          rows = null;
          vSpacing = size.width / 12;
          hSpacing = 8.0;
          break;
        case GridPreset.material16:
          vSpacing = 16.0;
          hSpacing = 16.0;
          cols = null;
          rows = null;
          break;
        case null:
          throw UnimplementedError();
      }
    }

    // Draw vertical grid lines
    final double effectiveVSpacing = cols != null
        ? size.width / cols
        : vSpacing;
    for (double x = 0; x <= size.width; x += effectiveVSpacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    // Draw horizontal grid lines
    final double effectiveHSpacing = rows != null
        ? size.height / rows
        : hSpacing;
    for (double y = 0; y <= size.height; y += effectiveHSpacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }

    // Draw safe area and margin guides
    if (showSafeArea || marginWidth > 0) {
      final safeArea = MediaQuery.of(context).padding;
      final safeAreaPaint = Paint()
        ..color = lineColor.withValues(alpha: (lineColor.a * 1.5).clamp(0.0, 1.0))
        ..strokeWidth = lineThickness * 1.5
        ..style = PaintingStyle.stroke;

      // Safe area
      if (showSafeArea) {
        canvas.drawRect(
          Rect.fromLTRB(
            safeArea.left,
            safeArea.top,
            size.width - safeArea.right,
            size.height - safeArea.bottom,
          ),
          safeAreaPaint,
        );
      }

      // Margin guides
      if (marginWidth > 0) {
        canvas.drawRect(
          Rect.fromLTRB(
            marginWidth,
            marginWidth,
            size.width - marginWidth,
            size.height - marginWidth,
          ),
          safeAreaPaint,
        );
      }
    }

    // Draw ruler markings
    if (showRuler) {
      final textPainter = TextPainter(textDirection: TextDirection.ltr);
      final textStyle = TextStyle(
        color: lineColor.withValues(alpha: (lineColor.a * 0.8).clamp(0.0, 1.0)),
        fontSize: 10,
      );

      // Top ruler (x-axis)
      for (double x = 0; x <= size.width; x += effectiveVSpacing) {
        textPainter.text = TextSpan(
          text: x.round().toString(),
          style: textStyle,
        );
        textPainter.layout();
        textPainter.paint(canvas, Offset(x - textPainter.width / 2, 2));
      }

      // Left ruler (y-axis)
      for (double y = 0; y <= size.height; y += effectiveHSpacing) {
        textPainter.text = TextSpan(
          text: y.round().toString(),
          style: textStyle,
        );
        textPainter.layout();
        textPainter.paint(canvas, Offset(2, y - textPainter.height / 2));
      }
    }

    // Draw breakpoint lines
    if (breakpoints != null && breakpoints!.isNotEmpty) {
      final bpPaint = Paint()
        ..color = Colors.blue.withAlpha(127) // 0.5 * 255
        ..strokeWidth = lineThickness * 2
        ..style = PaintingStyle.stroke;
      for (var bp in breakpoints!) {
        if (bp <= size.width) {
          canvas.drawLine(Offset(bp, 0), Offset(bp, size.height), bpPaint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant LayoutGuidePainter oldDelegate) {
    return oldDelegate.horizontalSpacing != horizontalSpacing ||
        oldDelegate.verticalSpacing != verticalSpacing ||
        oldDelegate.lineColor != lineColor ||
        oldDelegate.lineThickness != lineThickness ||
        oldDelegate.columnCount != columnCount ||
        oldDelegate.rowCount != rowCount ||
        oldDelegate.preset != preset ||
        oldDelegate.showSafeArea != showSafeArea ||
        oldDelegate.marginWidth != marginWidth ||
        oldDelegate.showRuler != showRuler ||
        oldDelegate.breakpoints != breakpoints;
  }
}
