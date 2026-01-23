// import 'dart:convert';
// import 'dart:math';
//
// import 'package:flutter/material.dart';
//
// import 'package:flutter_content/flutter_content.dart';
// import 'package:flutter_content/src/snippet/snodes/quill/widgets/quill_editor_with_toolbar.dart';
// import 'package:flutter_quill/flutter_quill.dart';
//
// void showQuillEditorOverlay({
//   required QuillTextNode quillTextNode,
//   required ValueChanged<String> onChangeF,
// }) {
//   final QuillController controller = QuillController.basic();
//   controller.document = Document.fromJson(
//     jsonDecode(quillTextNode.deltaJsonString),
//   );
//
//   CalloutConfig teCC = CalloutConfig(
//     cId: 'quill-te',
//
//     // containsTextField: true,
//     barrier: CalloutBarrierConfig(
//       opacity: .25,
//       onTappedF: () {
//         onChangeF(jsonEncode(controller.document.toDelta().toJson()));
//         controller.dispose();
//         fco.dismiss('quill-te');
//       },
//     ),
//     decorationFillColors: ColorOrGradient.color(Colors.purpleAccent),
//     targetPointerType: TargetPointerType.none(),
//     initialCalloutW: min(1024, fco.scrW * .8),
//     initialCalloutH: fco.scrH * .8,
//     onDismissedF: () {
//       print('wtf');
//     },
//     onAcceptedF: () {},
//     resizeableH: true,
//     resizeableV: true,
//     onResizeF: (Size newSize) {},
//     onDragF: (Offset newOffset) {},
//     draggable: false,
//   );
//
//   Widget calloutContent = QuillEditorWithToolbar(
//     quillTextNode: quillTextNode,
//     onChangeF: onChangeF,
//     controller: controller,
//     focusNode: FocusNode(),
//   );
//
//   fco.dismissAll();
//   fco.showOverlay(
//     calloutConfig: teCC,
//     calloutContent: calloutContent,
//     // targetGkF: () => propertyBtnGK,
//   );
// }