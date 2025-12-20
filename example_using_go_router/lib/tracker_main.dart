import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MouseTrackerScreen(),
    );
  }
}

class MouseTrackerScreen extends StatefulWidget {
  const MouseTrackerScreen({super.key});

  @override
  State<MouseTrackerScreen> createState() => _MouseTrackerScreenState();
}

class _MouseTrackerScreenState extends State<MouseTrackerScreen> {
  final _overlayController = OverlayPortalController();
  final GlobalKey _targetKey = GlobalKey();
  Offset _globalPosition = Offset.zero;
  Offset _localPosition = Offset.zero;
  Size _widgetSize = Size.zero;

  void _updateOverlay(PointerEvent details) {
    setState(() {
      _globalPosition = details.position;
      _localPosition = details.localPosition;
    });

    // Get the size and global position of the target widget
    final RenderBox? renderBox = _targetKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      _widgetSize = renderBox.size;
      // Note: renderBox.localToGlobal(Offset.zero) would give the widget's global start position
    }

    if (!_overlayController.isShowing) {
      _overlayController.show();
    }
  }

  void _hideOverlay(PointerEvent details) {
    if (_overlayController.isShowing) {
      _overlayController.hide();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mouse Position Overlay')),
      body: Center(
        child: MouseRegion(
          onHover: _updateOverlay,
          onExit: _hideOverlay,
          child: OverlayPortal(
            controller: _overlayController,
            overlayChildBuilder: (context) {
              // Position the overlay near the cursor
              return Positioned(
                left: _globalPosition.dx + 10, // Offset to prevent covering the cursor
                top: _globalPosition.dy + 10,
                child: Material(
                  elevation: 4.0,
                  borderRadius: BorderRadius.circular(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Global Pos: (${_globalPosition.dx.fmt()}, ${_globalPosition.dy.fmt()})\n'
                          'Local Pos: (${_localPosition.dx.fmt()}, ${_localPosition.dy.fmt()})\n'
                          'Widget Size: (${_widgetSize.width.fmt()}x${_widgetSize.height.fmt()})',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              );
            },
            child: Container(
              key: _targetKey, // Assign the GlobalKey here
              width: 300,
              height: 200,
              color: Colors.blueAccent,
              alignment: Alignment.center,
              child: const Text('Hover over me', style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
          ),
        ),
      ),
    );
  }
}

// Extension to format double to 2 decimal places for cleaner display
extension on double {
  String fmt() => toStringAsFixed(2);
}
