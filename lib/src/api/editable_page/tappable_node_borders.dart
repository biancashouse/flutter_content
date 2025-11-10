import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart'; // For SNode

// The data needed for each drawn border
class NodeRenderData {
  final SNode node;
  final Rect rect;

  NodeRenderData({required this.node, required this.rect});
}

/// Here's the strategy:
///
/// 1. Single Overlay Widget: Place one CustomPaint widget on top of the
/// entire snippet preview. This widget will be responsible for drawing all
/// the borders and handling all the taps.
///
/// 2. Gather Geometry: After every build (or scroll), walk the widget tree
/// of the live preview. For every widget you want to be selectable, get
/// its global position and size using its GlobalKey and the globalPaintBounds
/// extension you're already familiar with.
///
/// 3. Draw the Borders: Pass this list of Rect objects to your CustomPaint
/// widget. In its CustomPainter, loop through the list and draw a dotted
/// border for each Rect. This is incredibly fast as it's a single paint
/// operation, not dozens of widgets.4.Handle Taps Centrally: Wrap the
/// CustomPaint in a GestureDetector. When the user taps the screen, the
/// onTapDown callback gives you a global Offset. You then check this tap
/// position against your list of Rects to see which "border" was tapped.
class TappableNodeBorders extends StatelessWidget {
  final List<NodeRenderData> renderData;
  final Function(SNode tappedNode) onNodeTapped;

  const TappableNodeBorders({
    required this.renderData,
    required this.onNodeTapped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // This allows scroll gestures to pass through
        IgnorePointer(
          child: CustomPaint(
            size: Size.infinite,
            painter: _BordersPainter(renderData: renderData),
          ),
        ),
        // This gesture detector is ONLY for taps
        GestureDetector(
          onTapDown: (details) {
            // Find which node was tapped
            final tapPosition = details.globalPosition;
            for (var data in renderData.reversed) {
              // Reverse to check top-most first
               if (data.rect.contains(tapPosition)) {
                onNodeTapped(data.node);
                return; // Stop after finding the first one
              }
            }
          },
          // Make the detector transparent to allow scrolling behind it
          behavior: HitTestBehavior.translucent,
        ),
      ],
    );
  }
}

class _BordersPainter extends CustomPainter {
  final List<NodeRenderData> renderData;
  final Color color;
  final double strokeWidth;
  final double dashLength;
  final double dashSpace;

  _BordersPainter({
    required this.renderData,
    this.color = Colors.black,
    this.strokeWidth = 2.0,
    this.dashLength = 5.0,
    this.dashSpace = 5.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    for (final data in renderData) {
      // Simple dotted line effect
      _drawDottedRect(canvas, data.rect, paint);
    }
  }

  // Helper to draw a dotted rectangle
  void _drawDottedRect(Canvas canvas, Rect rect, Paint paint) {
    _drawDashedLine(
      canvas,
      paint,
      Offset(rect.left, rect.top),
      Offset(rect.right, rect.top),
      dashLength,
      dashSpace,
    );

    // Draw right dotted line
    _drawDashedLine(
      canvas,
      paint,
      Offset(rect.right, rect.top),
      Offset(rect.right, rect.bottom),
      dashLength,
      dashSpace,
    );

    // Draw bottom dotted line
    _drawDashedLine(
      canvas,
      paint,
      Offset(rect.right, rect.bottom),
      Offset(rect.left, rect.bottom),
      dashLength,
      dashSpace,
    );

    // Draw left dotted line
    _drawDashedLine(
      canvas,
      paint,
      Offset(rect.left, rect.bottom),
      Offset(rect.left, rect.top),
      dashLength,
      dashSpace,
    );
  }

  void _drawDashedLine(
    Canvas canvas,
    Paint paint,
    Offset p1,
    Offset p2,
    double dashLength,
    double dashSpace,
  ) {
    final Path path = Path();
    double currentLength = 0.0;
    final double totalLength = (p2 - p1).distance;
    final Vector2 direction = Vector2(
      p2.dx - p1.dx,
      p2.dy - p1.dy,
    ).normalized();

    while (currentLength < totalLength) {
      path.moveTo(
        p1.dx + direction.x * currentLength,
        p1.dy + direction.y * currentLength,
      );
      currentLength += dashLength;
      if (currentLength > totalLength) {
        currentLength = totalLength;
      }
      path.lineTo(
        p1.dx + direction.x * currentLength,
        p1.dy + direction.y * currentLength,
      );
      currentLength += dashSpace;
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _BordersPainter oldDelegate) {
    // Repaint only if the list of rectangles has changed
    return oldDelegate.renderData != renderData;
  }
}

// Helper class for vector operations (can be replaced by a math library if desired)
class Vector2 {
  final double x;
  final double y;

  Vector2(this.x, this.y);

  Vector2 normalized() {
    final double length = this.length;
    return Vector2(x / length, y / length);
  }

  double get length => (x * x + y * y).sqrt();
}

extension on double {
  double sqrt() => math.sqrt(this);
}
