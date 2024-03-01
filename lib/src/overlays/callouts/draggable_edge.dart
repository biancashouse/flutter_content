import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

Timer? _debounce;

class DraggableEdge_OP extends StatelessWidget {
  final Side side;
  final double thickness;
  final CalloutConfig parent;
  final Color color;

  const DraggableEdge_OP({required this.side, required this.thickness, required this.parent, required this.color, super.key});

  Axis axis() {
    switch (side) {
      case Side.TOP:
      case Side.BOTTOM:
        return Axis.vertical;
      case Side.LEFT:
      case Side.RIGHT:
        return Axis.horizontal;
    }
  }

  IconData iconData() {
    switch (side) {
      case Side.TOP:
        return Icons.arrow_drop_down;
      case Side.BOTTOM:
        return Icons.arrow_drop_up;
      case Side.LEFT:
        return Icons.arrow_right;
      case Side.RIGHT:
        return Icons.arrow_left;
    }
  }

  @override
  Widget build(BuildContext context) {
    double top = _topLeft().dy;
    double left = _topLeft().dx;
    return Positioned(
      top: top,
      left: left,
      child: Listener(
        onPointerMove: (PointerMoveEvent event) {
          double newTop = event.position.dy;
          double newLeft = event.position.dx;
          // print("new pos: ${newLeft},${newTop}");
          var deltaX = event.delta.dx;
          var deltaY = event.delta.dy;
          if (side == Side.LEFT) {
            if (deltaX < 0 || parent.calloutW! + deltaX >= (parent.minWidth ?? 30)) {
              parent.left = newLeft;
              parent.calloutW = parent.calloutW! - deltaX;
            }
          } else if (side == Side.TOP) {
            if (deltaY < 0 || parent.calloutH! + deltaY >= (parent.minHeight ?? 30)) {
              parent.top = newTop;
              parent.calloutH = parent.calloutH! - deltaY;
            }
          } else if (side == Side.RIGHT) {
            if (parent.calloutW! + deltaX < (parent.minWidth ?? 30)) {
              parent.calloutW = parent.minWidth ?? 30;
            } else {
              parent.calloutW = parent.calloutW! + deltaX;
            }
          } else if (side == Side.BOTTOM) {
            if (parent.calloutH! + deltaY < (parent.minHeight ?? 30)) {
              parent.calloutH = parent.minHeight ?? 30;
            } else {
              parent.calloutH = parent.calloutH! + deltaY;
            }
          }
          // parent.calloutSize = Size(parent.calloutW, parent.calloutH);
          // print('new height: ${parent.calloutH}');
          parent.movedOrResizedNotifier?.value++;
          parent.rebuild(() {
            if (_debounce?.isActive ?? false) _debounce?.cancel();
            // Set up a new debounce timer
            _debounce = Timer(const Duration(milliseconds: 200), () async {
              parent.onResize?.call(Size(parent.calloutW!, parent.calloutH!));
            });
          });
        },
        child: Container(
          color: color,
          width: _width(),
          height: _height(),
        ),
      ),
    );
  }

  Offset _topLeft() {
    Rect calloutRect = Rect.fromLTWH(parent.left!, parent.top!, parent.calloutW!, parent.calloutH!);
    if (side == Side.LEFT) {
      return (calloutRect.topLeft.translate(-thickness, 0));
    } else if (side == Side.RIGHT) {
      return (calloutRect.topRight.translate(0, 0));
    } else if (side == Side.TOP) {
      return (calloutRect.topLeft.translate(0, -thickness));
    } else {
      return (calloutRect.bottomLeft.translate(0, 0));
    }
  }

  double _width() {
    if (side == Side.LEFT || side == Side.RIGHT) {
      return thickness;
    } else {
      return parent.calloutW!;
    }
  }

  double _height() {
    if (side == Side.TOP || side == Side.BOTTOM) {
      return thickness;
    } else {
      return parent.calloutH!;
    }
  }
}
