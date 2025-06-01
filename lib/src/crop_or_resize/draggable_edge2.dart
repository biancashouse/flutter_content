// import 'package:flutter/material.dart';
// 
//
// import 'crop_image.dart';
//
//
// class DraggableEdge2 extends StatelessWidget {
//   final Side side;
//   final double thickness;
//   final ImageCropperResizerState parent;
//
//   const DraggableEdge2({required this.side, required this.thickness, required this.parent, Key? key}) : super(key: key);
//
//   Axis axis() {
//     switch (side) {
//       case Side.TOP:
//       case Side.BOTTOM:
//         return Axis.vertical;
//       case Side.LEFT:
//       case Side.RIGHT:
//         return Axis.horizontal;
//     }
//   }
//
//   IconData iconData() {
//     switch (side) {
//       case Side.TOP:
//         return Icons.arrow_drop_down;
//       case Side.BOTTOM:
//         return Icons.arrow_drop_up;
//       case Side.LEFT:
//         return Icons.arrow_right;
//       case Side.RIGHT:
//         return Icons.arrow_left;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double top = _topLeft().dy;
//     double left = _topLeft().dx;
//     return Positioned(
//       top: top,
//       left: left,
//       child: Draggable(
//         axis: axis(),
//         feedback: Container(
//           color: Colors.yellow.withValues(alpha:.1),
//           width: _width(),
//           height: _height(),
//           child: Icon(
//             iconData(),
//             size: 32,
//           ),
//         ),
//         child: Container(
//           color: Colors.orange.withValues(alpha:.4),
//           width: _width(),
//           height: _height(),
//           child: Icon(
//             iconData(),
//             size: 32,
//           ),
//         ),
//         onDragUpdate: (DragUpdateDetails dud) {
//           Rect rect = parent.uncroppedRect;
//           if (side == Side.LEFT) {
//             var deltaX = (rect.left + dud.delta.dx < thickness) ? 0 : dud.delta.dx;
//             parent.uncroppedRect = Rect.fromLTWH(
//               rect.left + deltaX,
//               rect.top,
//               rect.width - deltaX,
//               rect.height,
//             );
//           }
//           if (side == Side.TOP) {
//             var deltaY = (rect.top + dud.delta.dy < thickness) ? 0 : dud.delta.dy;
//             parent.uncroppedRect = Rect.fromLTWH(
//               rect.left,
//               rect.top + deltaY,
//               rect.width,
//               rect.height - deltaY,
//             );
//           } else if (side == Side.RIGHT) {
//             var deltaX = (left + dud.delta.dx > parent.widget.calloutSize.width - thickness) ? 0 : dud.delta.dx;
//             parent.uncroppedRect = Rect.fromLTWH(
//               rect.left,
//               rect.top,
//               rect.width + deltaX,
//               rect.height,
//             );
//           }
//           if (side == Side.BOTTOM) {
//             var deltaY = (top + dud.delta.dy > parent.widget.calloutSize.height - thickness) ? 0 : dud.delta.dy;
//             parent.uncroppedRect = Rect.fromLTWH(
//               rect.left,
//               rect.top,
//               rect.width,
//               rect.height + deltaY,
//             );
//           }
//           parent.refresh(() {});
//         },
//       ),
//     );
//   }
//
//   Offset _topLeft() {
//     if (side == Side.LEFT) {
//       return (parent.uncroppedRect.topLeft.translate(-thickness, 0));
//     } else if (side == Side.RIGHT) {
//       return (parent.uncroppedRect.topRight.translate(0, 0));
//     } else if (side == Side.TOP) {
//       return (parent.uncroppedRect.topLeft.translate(0, -thickness));
//     } else {
//       return (parent.uncroppedRect.bottomLeft.translate(0, 0));
//     }
//   }
//
//   double _width() {
//     if (side == Side.LEFT || side == Side.RIGHT) {
//       return thickness;
//     } else {
//       return parent.uncroppedRect.width;
//     }
//   }
//
//   double _height() {
//     if (side == Side.TOP || side == Side.BOTTOM) {
//       return thickness;
//     } else {
//       return parent.uncroppedRect.height;
//     }
//   }
// }
