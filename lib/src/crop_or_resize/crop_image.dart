// import 'dart:async';
// import 'dart:math';
// import 'dart:typed_data';
// import 'dart:ui' as ui;
//
// import 'package:flutter/material.dart';
// 
// import 'package:flutter_content/flutter_content.dart';
// import 'package:image/image.dart' as im;
//
// import 'draggable_corner2.dart';
// import 'draggable_edge2.dart';
//
// typedef CroppedOrZoomedF = void Function(Uint8List?);
//
// const CANVAS_PADDING = 0.0;
// const EDGE_THICKNESS = 30.0;
// const MIN_VISIBLE_WIDTH = 60.0;
// const MIN_VISIBLE_HEIGHT = 60.0;
//
// mixin ImageCaptureMixin {
//   Future<void> zoomOrCropImage(
//     final Uint8List originalImage,
// // TOD remove context arg ?
//     final BuildContext context, {
//     final int? stepId,
//     required bool justPicked,
//     required Size calloutSize,
//   }) async {
//     Uint8List? newImageBytes;
//     ui.Image canvasImage = await bytesToUiImage(originalImage);
//     // centre callout
//     Offset calloutPos = Offset(
//       (fco.scrW - calloutSize.width) / 2,
//       (fco.scrH - calloutSize.height) / 2,
//     );
//     fco.showOverlay(
//       calloutConfig: CalloutConfig(
//         cId: 'cropper',
//         initialCalloutPos: calloutPos,
//         barrier: CalloutBarrier(
//           opacity: .75,
//         ),
//         arrowType: ArrowType.NONE,
//         // onBarrierTappedF: () => fco.logi('barrier tapped'),
//         initialCalloutW: calloutSize.width,
//         initialCalloutH: calloutSize.height,
//         draggable: false,
//         modal: true,
//         fillColor: Colors.black,
//         onDismissedF: () {
//           App
//               .add(EditorEvent.flowchartImageChanged(newBytes: originalImage));
//         },
//         onTickedF: (s) {
//           flowchart.editingPageState?.editorBloc
//               .add(EditorEvent.flowchartImageChanged(newBytes: newImageBytes));
//         },
//       ),
//       calloutContent: ImageCropperResizer(
//         calloutSize: calloutSize,
//         image: canvasImage,
//         justPicked: justPicked,
//         paperW: calloutSize.width,
//         changedF: (Uint8List? newBytes) {
//           newImageBytes = newBytes;
//         },
//         warningToastFeature: "ImageWiderThanPaper",
//       ),
//     );
//   }
//
//   Future<ui.Image> bytesToUiImage(Uint8List bytes) async {
//     ui.Codec codec = await ui.instantiateImageCodec(bytes);
//     ui.FrameInfo fi = await codec.getNextFrame();
//     return fi.image;
//   }
//
//   Future<Uint8List> uiImageToBytes(ui.Image image) async {
//     var byteData = await (image.toByteData(format: ui.ImageByteFormat.png)
//         as FutureOr<ByteData>);
//     return byteData.buffer.asUint8List();
//   }
//
//   Future<Uint8List> possiblyScaleImageDownTo(
//       Uint8List bytes, double maxWidth) async {
//     ui.Image image = await bytesToUiImage(bytes);
//
//     if (image.width <= maxWidth) return bytes;
//
//     var pictureRecorder = ui.PictureRecorder();
//     var canvas = Canvas(pictureRecorder);
//     Rect src =
//         Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble());
//     Rect dst = src;
//     double _scale = maxWidth / image.width;
//     canvas.scale(_scale, _scale);
//     canvas.drawImage(image, Offset.zero, Paint());
//     canvas.drawImageRect(image, src, dst, Paint());
//     var pic = pictureRecorder.endRecording();
//     ui.Image scaledImage = await pic.toImage(image.width, image.height);
//     return uiImageToBytes(scaledImage);
//   }
//
// // https://stackoverflow.com/questions/46515679/flutter-firebase-compression-before-upload-image
//   Future<Uint8List> compressImage(
//       Uint8List bytes, double newWidth, jpgQuality) async {
//     Uint8List? result;
//     im.Image? image = im.decodeImage(bytes);
//     if (image != null) {
//       im.Image smallerImage = im.copyResize(image,
//           width: newWidth
//               .floor()); // choose the size here, it will maintain aspect ratio
//       List<int> smallerImageIntList = im.encodeJpg(smallerImage, quality: 85);
//       result = Uint8List.fromList(smallerImageIntList);
//       return result;
//     }
//     return Uint8List(0);
//   }
// }
//
// class ImageCropperResizer extends StatefulWidget {
//   final Size calloutSize;
//   final ui.Image image;
//   final bool justPicked;
//   final double paperW;
//   final CroppedOrZoomedF changedF;
//   final Feature warningToastFeature;
//
//   const ImageCropperResizer({
//     required this.calloutSize,
//     required this.image,
//     required this.justPicked,
//     required this.paperW,
//     required this.changedF,
//     required this.warningToastFeature,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   ImageCropperResizerState createState() => ImageCropperResizerState();
// }
//
// class ImageCropperResizerState extends State<ImageCropperResizer>
//     with SingleTickerProviderStateMixin {
//   Animation<double>? zoomAnimation;
//   Animation<Offset>? translationAnimation;
//   AnimationController? controller;
//
//   Offset panOffset = Offset(EDGE_THICKNESS, EDGE_THICKNESS);
//   late double zoom = 1.0;
//   double prevScale = 1.0;
//   late Rect uncroppedRect;
//
//   ui.Image? image;
//
//   refresh(f) => setState(f);
//
//   double _visibleCropW() {
//     // var imgW = image!.width.toDouble();
//     var cropW =
//         widget.calloutSize.width - CANVAS_PADDING * 2 - EDGE_THICKNESS * 2;
//     return min(image!.width.toDouble(), cropW);
//   }
//
//   double _visibleCropH() => min(image!.height.toDouble(),
//       widget.calloutSize.height - CANVAS_PADDING * 2 - EDGE_THICKNESS * 2);
//
//   @override
//   void initState() {
//     image = widget.image;
//     //relative to canvas rect
//     uncroppedRect = Rect.fromLTWH(
//       EDGE_THICKNESS,
//       EDGE_THICKNESS,
//       _visibleCropW(),
//       _visibleCropH(),
//     );
//
//     if (image != null &&
//         (image!.width > widget.calloutSize.width ||
//             image!.height > widget.calloutSize.height)) {
//       // start with a zoom s.t. user can see it's a much bigger picture
//       if (image != null) {
//         if (image!.width > image!.height) {
//           zoom = widget.calloutSize.width / image!.width;
//         } else {
//           zoom = widget.calloutSize.height / image!.height;
//         }
//       }
//
//       // will animate zoom from full size to calc 1000 px zoom
//       Tween<double> zoomTween = Tween(begin: 1.0, end: zoom);
//       Tween<Offset> offsetTween = Tween(
//           begin: Offset.zero,
//           end: Offset(-zoom * (image!.width - widget.calloutSize.width) / 2,
//               -zoom * (image!.height - widget.calloutSize.height) / 2));
//
//       controller = AnimationController(
//           duration: const Duration(milliseconds: 1000), vsync: this);
//
//       zoomAnimation = zoomTween.animate(controller!)
//         ..addListener(() {
//           setState(() {
//             zoom = zoomAnimation!.value;
//           });
//         });
//
//       translationAnimation = offsetTween.animate(controller!)
//         ..addListener(() {
//           // setState(() {
//           //   panOffset = translationAnimation!.value;
//           // });
//         });
//
//       // ..addStatusListener((status) {
//       //   if (status == AnimationStatus.completed) {
//       //     fco.logi("status is completed");
//       //   } else if (status == AnimationStatus.dismissed) {
//       //     fco.logi("status is dismissed");
//       //   } else if (status == AnimationStatus.forward) {
//       //     fco.logi("status is forward");
//       //   } else if (status == AnimationStatus.reverse) {
//       //     fco.logi("status is reverse");
//       //   }
//       // });
//       controller!.forward();
//     }
//     //  fco.afterNextBuildDo(() {
//     // });
//
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) => Center(
//         child: Stack(
//           children: [
//             Container(
//                 color: Colors.white.withOpacity(.25),
//                 child: GestureDetector(
//                     child: Listener(
//                   onPointerMove: (PointerMoveEvent event) {
//                     // if (panOffset.dx > 0) panOffset = Offset(0.0, panOffset.dy);
//                     // if (panOffset.dy > 0) panOffset = Offset(panOffset.dx, 0.0);
//                     setState(() {
//                       panOffset =
//                           panOffset.translate(event.delta.dx, event.delta.dy);
//                       //fco.logi('${panOffset.dx}, ${panOffset.dy}');
//                     });
//                   },
//                   child: image != null
//                       ? Padding(
//                           padding: const EdgeInsets.all(CANVAS_PADDING),
//                           child: CustomPaint(
//                             painter: ImagePainter(this),
//                             size: widget.calloutSize,
//                           ),
//                         )
//                       : Offstage(),
//                 ))),
//             DraggableCorner2(
//                 alignment: Alignment.topLeft,
//                 thickness: EDGE_THICKNESS,
//                 parent: this),
//             DraggableCorner2(
//                 alignment: Alignment.topRight,
//                 thickness: EDGE_THICKNESS,
//                 parent: this),
//             DraggableCorner2(
//                 alignment: Alignment.bottomLeft,
//                 thickness: EDGE_THICKNESS,
//                 parent: this),
//             DraggableCorner2(
//                 alignment: Alignment.bottomRight,
//                 thickness: EDGE_THICKNESS,
//                 parent: this),
//             DraggableEdge2(
//                 side: Side.TOP, thickness: EDGE_THICKNESS, parent: this),
//             DraggableEdge2(
//                 side: Side.LEFT, thickness: EDGE_THICKNESS, parent: this),
//             DraggableEdge2(
//                 side: Side.BOTTOM, thickness: EDGE_THICKNESS, parent: this),
//             DraggableEdge2(
//                 side: Side.RIGHT, thickness: EDGE_THICKNESS, parent: this),
//             Positioned(
//                 top: 5,
//                 right: 10,
//                 child: Row(
//                   children: [
//                     ElevatedButton.icon(
//                       style: ButtonStyle(
//                           padding: WidgetStateProperty.all<EdgeInsets>(
//                               EdgeInsets.all(8))),
//                       onPressed: () async {
//                         await _saveEdit();
//                         fco.removeParentCallout(context);
//                       },
//                       icon: Icon(
//                         Icons.check,
//                         size: 32,
//                         color: Colors.lime,
//                       ),
//                       label: Offstage(),
//                     ),
//                     fco.gap(10),
//                     ElevatedButton.icon(
//                       style: ButtonStyle(
//                           padding: WidgetStateProperty.all<EdgeInsets>(
//                               EdgeInsets.all(8))),
//                       onPressed: () async {
//                         fco.removeParentCallout(context);
//                       },
//                       icon: Icon(
//                         Icons.close,
//                         size: 32,
//                         color: Colors.red,
//                       ),
//                       label: Offstage(),
//                     ),
//                   ],
//                 )),
//             Positioned(
//                 bottom: 5,
//                 left: 10,
//                 child: Row(
//                   children: [
//                     // fco.gap(10),
//                     // ElevatedButton(
//                     //   child: Text(
//                     //     'change image...',
//                     //     style: TextStyle(fontSize: 18),
//                     //   ),
//                     //   onPressed: () async {
//                     //     FilePickerResult? result = await FilePicker.platform.pickFiles(
//                     //       allowMultiple: false,
//                     //       type: FileType.image,
//                     //       withData: true,
//                     //     );
//                     //     if (result != null && result.files.isNotEmpty && mounted) {
//                     //       PlatformFile file = result.files.first;
//                     //       image = await bytesToUiImage(file.bytes!);
//                     //       fco.logi('actual size (${image!.width} v ${image!.height}) storage: ${file.bytes?.toList().length} bytes');
//                     //       // _bytes = await compressImage(file.bytes!, min(512,img.width.toDouble()), .85);
//                     //       // ui.Image compressedImg = await bytesToUiImage(_bytes!);
//                     //       // fco.logi('scaled down size (${compressedImg.width} v ${compressedImg.height}) storage: ${_bytes?.toList().length} bytes');
//                     //       // EditorBloc.of(context).add(CommentImageChanged(
//                     //       //   widget.flowchart,
//                     //       //   widget.stepId,
//                     //       //   file.bytes,
//                     //       // ));
//                     //
//                     //       if (image != null) {
//                     //         if (image!.width > image!.height)
//                     //           zoom = 1000 / image!.width;
//                     //         else
//                     //           zoom = 1000 / image!.height;
//                     //       }
//                     //
//                     //       // will animate zoom from full size to calc 1000 px zoom
//                     //       Tween<double> zoomTween = Tween(begin: 1.0, end: zoom);
//                     //
//                     //       animation = zoomTween.animate(controller)
//                     //         ..addListener(() {
//                     //           setState(() {
//                     //             zoom = animation.value;
//                     //           });
//                     //         });
//                     //       controller.forward();
//                     //
//                     //     }
//                     //   },
//                     // ),
//                     fco.gap(10),
//                     ElevatedButton(
//                       onPressed: () {
//                         setState(() {
//                           // panOffset = Offset.zero;
//                           zoom = 1.0; //topEdge.width / _img.width;
//                           uncroppedRect = Rect.fromLTWH(
//                             uncroppedRect.left,
//                             uncroppedRect.top,
//                             _visibleCropW(),
//                             _visibleCropH(),
//                           );
//                         });
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                             border: Border.all(color: Colors.white)),
//                         padding: EdgeInsets.all(2.0),
//                         child: Text(
//                           '100%',
//                           style: TextStyle(fontSize: 18),
//                         ),
//                       ),
//                     ),
//                     fco.gap(10),
//                     ElevatedButton.icon(
//                       style: ButtonStyle(
//                           padding: WidgetStateProperty.all<EdgeInsets>(
//                               EdgeInsets.all(8))),
//                       onPressed: () {
//                         setState(() {
//                           zoom += .05;
//                           // uncroppedRect = Rect.fromLTWH(
//                           //   uncroppedRect.left,
//                           //   uncroppedRect.top,
//                           //   _visibleCropW(),
//                           //   _visibleCropH(),
//                           // );
//                         });
//                       },
//                       icon: Icon(
//                         Icons.zoom_in,
//                         size: 30,
//                       ),
//                       label: Offstage(),
//                     ),
//                     fco.gap(10),
//                     ElevatedButton.icon(
//                       style: ButtonStyle(
//                           padding: WidgetStateProperty.all<EdgeInsets>(
//                               EdgeInsets.all(8))),
//                       onPressed: () {
//                         setState(() {
//                           zoom -= .05;
//                           // uncroppedRect = Rect.fromLTWH(
//                           //   uncroppedRect.left,
//                           //   uncroppedRect.top,
//                           //   _visibleCropW(),
//                           //   _visibleCropH(),
//                           // );
//                         });
//                       },
//                       icon: Icon(
//                         Icons.zoom_out,
//                         size: 30,
//                       ),
//                       label: Offstage(),
//                     ),
//                   ],
//                 )),
//             Positioned(
//               top: 5,
//               left: 10,
//               child: Row(
//                 children: [
//                   Text('${(image?.width) ?? 0} x ${(image?.height) ?? 0}',
//                       style: TextStyle(
//                           color: Colors.yellow, fontWeight: FontWeight.bold)),
//                   fco.gap(10),
//                   Text('zoom: ${zoom.toStringAsFixed(2)}',
//                       style: TextStyle(
//                           color: Colors.yellow, fontWeight: FontWeight.bold)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       );
//
//   Future _saveEdit() async {
//     if (image != null) {
//       fco.showCircularProgressIndicator(true,
//           reason: 'Cropped/Zoomed a Comment Image');
//       try {
//         // do the crop
//         var pictureRecorder = ui.PictureRecorder();
//         var canvas = Canvas(pictureRecorder);
//         //var paint = Paint();
//         // paint.isAntiAlias = true;
//         //canvas.clipRect(Rect.fromLTWH(leftEdge.left, topEdge.top, topEdge.width, leftEdge.height));
//         canvas.translate(panOffset.dx, panOffset.dy);
//         canvas.translate(-uncroppedRect.left, -uncroppedRect.top);
//         canvas.scale(zoom, zoom);
//         canvas.drawPaint(Paint()..color = Color.fromARGB(255, 255, 255, 255));
//         canvas.drawImage(image!, Offset.zero, Paint());
//         //canvas.drawImageRect(_img!, uncroppedRect, uncroppedRect, paint);
//         var pic = pictureRecorder.endRecording();
//         ui.Image img = await pic.toImage(
//             uncroppedRect.width.floor(), uncroppedRect.height.floor());
//         ByteData? byteData =
//             await img.toByteData(format: ui.ImageByteFormat.png);
//         Uint8List imgBytes = byteData!.buffer.asUint8List();
//
//         // ensure image is small - BUT only if panned by > 5px and image still not totally in crop rect
//         if (panOffset.dx.abs() > 5 ||
//             panOffset.dy.abs() > 5 ||
//             image!.width * zoom > uncroppedRect.width ||
//             image!.height * zoom > uncroppedRect.height) {
//           var compressedImageBytes = await fco.compressImage(imgBytes,
//               min(widget.paperW, img.width.toDouble()), .85 /*quality*/);
//           ui.Image compressedImg =
//               await fco.bytesToUiImage(compressedImageBytes);
//           fco.logi(
//               'scaled down size (${compressedImg.width} v ${compressedImg.height}) storage: ${compressedImageBytes.toList().length} bytes');
//           widget.changedF.call(compressedImageBytes.buffer.asUint8List());
//           // if (widget.stepId != null) {
//           // widget.comment!.imageBytes = ;
//           // widget.comment!.imageSize = widget.comment!.imageBytes?.lengthInBytes;
//           // } else {
//           // widget.flowchart.imageBytes = compressedImageBytes.buffer.asUint8List();
//           // widget.flowchart.imageSize = widget.flowchart.imageBytes?.lengthInBytes;
//           // }
//         }
//       } catch (e) {
//         fco.logi('save crop failed!');
//       }
//       fco.logi('hiding progress bar...');
//       fco.showCircularProgressIndicator(false,
//           reason: 'Cropped/Zoomed an Image');
//       fco.logi('hid progress bar');
//     } else {
//       widget.changedF.call(null);
//     }
//   }
//
// // Future<void> _saveScreenShot(ui.Image img) async {
// //   var byteData = await img.toByteData(format: ui.ImageByteFormat.png);
// //   var buffer = byteData!.buffer.asUint8List();
// //   // TODO replace comment image
// // }
// }
//
// class ImagePainter extends CustomPainter {
//   final ImageCropperResizerState parent;
//
//   ImagePainter(this.parent);
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     Size calloutSize = size;
//     // double ratio = size.width / image.width;
//     canvas.save();
//     // draw image cropped to callout with transparency to indicate cropped parts
//     RadialGradient gradient = RadialGradient(
//       center: Alignment.center, // near the top right
//       radius: calloutSize.width > calloutSize.height
//           ? calloutSize.width / 2
//           : calloutSize.height / 2,
//       colors: <Color>[
//         Color(Colors.black.value), // yellow sun
//         Color(Colors.yellow.value), // blue sky
//       ],
//       //stops: <double>[0.5, 0.75],
//     );
//     /* Paint croppedPaint = */
//     Paint()
//       ..shader = gradient.createShader(
//           Rect.fromLTWH(0, 0, calloutSize.width, calloutSize.height))
//       // ..style = PaintingStyle.fill
//       ..color = Colors.red.withOpacity(.25);
//     canvas.clipRect(Rect.fromLTWH(0, 0, calloutSize.width, calloutSize.height));
//     canvas.translate(parent.panOffset.dx, parent.panOffset.dy);
//     double zoom = parent.zoom;
//     // fco.logi('zoom: $zoom');
//     canvas.scale(zoom, zoom);
//     canvas.drawImage(parent.widget.image, Offset.zero,
//         Paint()..color = Color.fromARGB(128, 0, 0, 0));
//     canvas.drawPaint(Paint()..color = Color.fromARGB(64, 0, 0, 0));
//     //canvas.drawPaint(croppedPaint);
//     canvas.restore();
//     canvas.save();
//     // draw uncropped rectangle with no transparency
//     canvas.clipRect(parent.uncroppedRect);
//     canvas.translate(parent.panOffset.dx, parent.panOffset.dy);
//     canvas.scale(zoom, zoom);
//     canvas.drawImage(parent.image!, Offset.zero, Paint());
//     canvas.restore();
//     canvas.drawRect(
//         parent.uncroppedRect,
//         Paint()
//           ..style = PaintingStyle.stroke
//           ..strokeWidth = 5
//           ..color = Colors.yellowAccent);
//     // canvas.restore();
//   }
//
//   @override
//   bool shouldRepaint(ImagePainter oldDelegate) {
//     return true;
//   }
// }
