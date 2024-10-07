//
// import 'package:flutter/material.dart';
//
// import 'crop_image.dart';
//
// class DraggableCorner2 extends StatelessWidget {
//   final Alignment alignment;
//   final double thickness;
//   final ImageCropperResizerState parent;
//
//   const DraggableCorner2({required this.alignment, required this.thickness, required this.parent, Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     double top = _pos().dy;
//     double left = _pos().dx;
//     return Positioned(
//       top: _pos().dy,
//       left: _pos().dx,
//       child: Draggable(
//         feedback:Container(
//           color: Colors.yellow.withOpacity(.1),
//           width: thickness,
//           height: thickness,
//         ),
//         child: Container(
//           color: Colors.orange.withOpacity(.4),
//           width: thickness,
//           height: thickness,
//         ),
//         onDragUpdate: (DragUpdateDetails dud) {
//           Rect rect = parent.uncroppedRect;
//           if (alignment == Alignment.topLeft) {
//             var deltaX = (rect.left + dud.delta.dx < thickness) ? 0 : dud.delta.dx;
//             rect = Rect.fromLTWH(
//               rect.left + deltaX,
//               rect.top,
//               rect.width - deltaX,
//               rect.height,
//             );
//             var deltaY = (rect.top + dud.delta.dy < thickness) ? 0 : dud.delta.dy;
//             parent.uncroppedRect = Rect.fromLTWH(
//               rect.left,
//               rect.top + deltaY,
//               rect.width,
//               rect.height - deltaY,
//             );
//           } else if (alignment == Alignment.topRight) {
//             var deltaY = (rect.top + dud.delta.dy < thickness) ? 0 : dud.delta.dy;
//             rect = Rect.fromLTWH(
//               rect.left,
//               rect.top + deltaY,
//               rect.width,
//               rect.height - deltaY,
//             );
//             var deltaX = (left + dud.delta.dx > parent.widget.calloutSize.width - thickness) ? 0 : dud.delta.dx;
//             parent.uncroppedRect = Rect.fromLTWH(
//               rect.left,
//               rect.top,
//               rect.width + deltaX,
//               rect.height,
//             );
//           } else if (alignment == Alignment.bottomLeft) {
//             var deltaX = (rect.left + dud.delta.dx < thickness) ? 0 : dud.delta.dx;
//             rect = Rect.fromLTWH(
//               rect.left + deltaX,
//               rect.top,
//               rect.width - deltaX,
//               rect.height,
//             );
//             var deltaY = (top + dud.delta.dy > parent.widget.calloutSize.height - thickness) ? 0 : dud.delta.dy;
//             parent.uncroppedRect = Rect.fromLTWH(
//               rect.left,
//               rect.top,
//               rect.width,
//               rect.height + deltaY,
//             );
//           } else if (alignment == Alignment.bottomRight) {
//             var deltaX = (left + dud.delta.dx > parent.widget.calloutSize.width - thickness) ? 0 : dud.delta.dx;
//             rect = Rect.fromLTWH(
//               rect.left,
//               rect.top,
//               rect.width + deltaX,
//               rect.height,
//             );
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
//   Offset _pos() {
//     if (alignment == Alignment.topLeft) {
//       return parent.uncroppedRect.topLeft.translate(-thickness, -thickness);
//     } else if (alignment == Alignment.topRight) {
//       return parent.uncroppedRect.topRight.translate(0, -thickness);
//     } else if (alignment == Alignment.bottomLeft) {
//       return parent.uncroppedRect.bottomLeft.translate(-thickness, 0);
//     } else if (alignment == Alignment.bottomRight) {
//       return parent.uncroppedRect.bottomRight.translate(0, 0);
//     } else {
//       throw ('Corner _pos() unexpected alignment!');
//     }
//   }
// }
