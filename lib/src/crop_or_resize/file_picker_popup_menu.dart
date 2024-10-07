// import 'dart:typed_data';
// import 'dart:ui' as ui;
//
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_callouts/flutter_callouts.dart';import 'package:flutter_content/flutter_content.dart';
//
//
// class FilePickerPopupMenu extends StatefulWidget {
//   final FlowchartM flowchart;
//   final int? stepId;
//   final CommentM? comment;
//
//   const FilePickerPopupMenu(this.flowchart,
//       {this.stepId, this.comment, Key? key})
//       : super(key: key);
//
//   @override
//   FilePickerPopupMenuState createState() => FilePickerPopupMenuState();
// }
//
// class FilePickerPopupMenuState extends State<FilePickerPopupMenu>
//     with SingleTickerProviderStateMixin {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       child: IntrinsicWidth(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             fco.gap(50),
//             ...getMenuItems(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   List<Widget> getMenuItems() {
//     List<Widget> menuItems = [];
//
//     menuItems.add(
//         // GALLERY
//         Container(
//       width: double.infinity,
//       decoration: BoxDecoration(border: Border.all(color: Colors.black54)),
//       child: TextButton.icon(
//         onPressed: () async {
//           pickImage(FileType.image, widget.flowchart,
//               stepId: widget.stepId, comment: widget.comment, mounted: mounted);
//         },
//         label: fco.text16('pick from the image gallery'),
//         icon: Icon(
//           Icons.image,
//           size: 28,
//           color: Colors.purpleAccent,
//         ),
//         style: TextButton.styleFrom(
//           backgroundColor: Colors.white,
//           disabledForegroundColor: Colors.grey,
//         ),
//       ),
//     ));
//
//     menuItems.add(
//         // GALLERY
//         Container(
//       width: double.infinity,
//       decoration: BoxDecoration(border: Border.all(color: Colors.black54)),
//       child: TextButton.icon(
//         onPressed: () async {
//           pickImage(FileType.any, widget.flowchart,
//               stepId: widget.stepId, comment: widget.comment, mounted: mounted);
//         },
//         label: fco.text16('pick from the file system'),
//         icon: Icon(
//           Icons.folder,
//           size: 28,
//           color: Colors.teal,
//         ),
//         style: TextButton.styleFrom(
//           backgroundColor: Colors.white,
//           disabledForegroundColor: Colors.grey,
//         ),
//       ),
//     ));
//
//     return menuItems
//         .map((Widget mi) => Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: mi,
//             ))
//         .toList();
//   }
//
//   static Future<void> pickImage(FileType fType, final FlowchartM flowchart,
//       {final int? stepId,
//       final CommentM? comment,
//       bool mounted = false}) async {
//     fco.showCircularProgressIndicator(true, reason: 'Picking a Comment Image');
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       allowMultiple: false,
//       type: fType,
//       withData: true,
//     );
//     fco.showCircularProgressIndicator(false, reason: 'Picking a Comment Image');
//     fco.showCircularProgressIndicator(true, reason: 'Picked a Comment Image');
//     if (result != null && result.files.isNotEmpty && mounted) {
//       PlatformFile file = result.files.first;
//       Uint8List? pickedFileBytes = file.bytes;
//       if (pickedFileBytes != null && pickedFileBytes.lengthInBytes > 0) {
//         ui.Image img = await bytesToUiImage(file.bytes!);
//         fco.logi(
//             'actual size (${img.width} v ${img.height}) storage: ${file.bytes?.toList().length} bytes');
//         // _bytes = await compressImage(file.bytes!, min(512,img.width.toDouble()), .85);
//         // ui.Image compressedImg = await bytesToUiImage(_bytes!);
//         // fco.logi('scaled down size (${compressedImg.width} v ${compressedImg.height}) storage: ${_bytes?.toList().length} bytes');
//         // FlowchartM cleanClone = widget.flowchart.cleanClone();
//         // if (widget.comment != null) {
//         //   widget.flowchart.editingPageState?.editorBloc.add(EditorEvent.commentImageChanged(newBytes: file.bytes, stepId: widget.stepId!, skipUndoCreation: true));
//         // } else {
//         //   widget.flowchart.editingPageState?.editorBloc.add(EditorEvent.flowchartImageChanged(newBytes: file.bytes, skipUndoCreation: true));
//         // }
//         disabledForegroundColor:
//         fco.dismissAll();
//         // setState(() {});
//         // imm. show the editor
//         if (img.width > flowchart.paperW * .85) {
//           Future.delayed(Duration(seconds: 2), () async {
//             CalloutHelper.showTextToast(
//                 FeatureEnum.Callout_Toast_ImageWiderThanPaper.name,
//                 "Image too wide for the paper size. Resize or crop...",
//                 backgroundColor: Colors.green,
//                 textColor: Colors.yellow,
//                 secs: 3,
//                 gravity: Alignment.topCenter);
//           });
//           await Future.delayed(Duration.zero, () async {
//             if (comment != null) {
//               await CommentsPanel.zoomOrCropImage(
//                 pickedFileBytes,
//                 flowchart.editingPageState!.context,
//                 flowchart,
//                 comment: comment,
//                 stepId: stepId,
//                 justPicked: true,
//               );
//             } else {
//               await CommentsPanel.zoomOrCropImage(
//                 pickedFileBytes,
//                 flowchart.editingPageState!.context,
//                 flowchart,
//                 justPicked: true,
//               );
//             }
//           });
//         }
//       }
//     }
//     fco.showCircularProgressIndicator(false, reason: 'Picked a Comment Image');
//   }
// }
