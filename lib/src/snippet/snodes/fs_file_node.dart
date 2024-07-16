// import 'package:dart_mappable/dart_mappable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_content/flutter_content.dart';
//
// part 'fs_file_node.mapper.dart';
//
// // get googleDocsIconSrc => FCO.asset('lib/assets/images/google-icons/docs.png');
// //
// // get googleSheetsIconSrc => FCO.asset('lib/assets/images/google-icons/sheets.png');
// //
// // get googleSlidesIconSrc => FCO.asset('lib/assets/images/google-icons/slides.png');
// //
// // get googleFormsIconSrc => FCO.asset('lib/assets/images/google-icons/forms.png');
//
// @MappableClass()
// class FSFileNode extends CL with FSFileNodeMappable {
//   String name;
//
//   FSFileNode({
//     required this.name,
//   });
//
//   @override
//   List<PTreeNode> createPropertiesList(BuildContext context) => [
//         StringPropertyValueNode(
//           snode: this,
//           name: 'name',
//           stringValue: name,
//           onStringChange: (newValue) => refreshWithUpdate(() => name = newValue),
//           calloutButtonSize: const Size(280, 70),
//           calloutSize: const Size(280, 70),
//         ),
//       ];
//
//   // @override
//   // List<Widget> nodePropertyEditors(BuildContext context, {bool allowButtonCallouts = false}) => [
//   //       NodePropertyButtonText(
//   //           label: "name",
//   //           text: name,
//   //           calloutSize: const Size(600, 200),
//   //           onChangeF: (s) {
//   //             name = s;
//   //             bloc.add(const CAPIEvent.forceRefresh());
//   //           }),
//   //       const SizedBox(height: 10),
//   //       NodePropertyButtonText(
//   //           label: "src",
//   //           text: src,
//   //           calloutSize: const Size(600, 200),
//   //           onChangeF: (s) {
//   //             src = s;
//   //             bloc.add(const CAPIEvent.forceRefresh());
//   //           }),
//   //     ];
//
//   @override
//   Widget toWidget(BuildContext context, STreeNode? parentNode) {
//     setParent(parentNode);  // propagating parents down from root
//     possiblyHighlightSelectedNode();
//     return SizedBox(
//             key: createNodeGK(),      width: 200,
//       height: 30,
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Gap(10),
//           FCO.coloredText(name.isEmpty ? 'filename?' : name, color: Colors.blue),
//           Gap(10),
//           driveFileIcon('firebase storage ref'),
//         ],
//       ),
//     );
//   }
//
//   // Widget _getFSFileIcon() {
//   //   if (src.contains('https://docs.google.com/document/')) return Image.asset(googleDocsIconSrc, height: 24);
//   //   if (src.contains('https://docs.google.com/spreadsheets/')) return Image.asset(googleSheetsIconSrc, height: 24);
//   //   if (src.contains('https://docs.google.com/presentation/')) return Image.asset(googleSlidesIconSrc, height: 24);
//   //   if (src.contains('https://docs.google.com/forms/')) return Image.asset(googleSlidesIconSrc, height: 24);
//   //   return const Offstage(); //Icon(Icons.question_mark, color: Colors.red);
//   // }
//
//   @override
//   String toSource(BuildContext context) => "";
//
//   // @override
//   // List<Widget> wrapWithCandidates(final BuildContext context, final STreeNode? parentNode, ValueChanged<Type> onPressed) {
//   //   List<Type> candidateTypes = [DirectoryNode];
//   //   return toMenuItems(context, nodeTypeCandidates: candidateTypes, onPressedF: onPressed);
//   // }
//   //
//   // @override
//   // List<Widget> siblingCandidates(final BuildContext context, final STreeNode? parentNode, AddAction action, ValueChanged<Type> onPressed) {
//   //   List<Type> candidateTypes = [DirectoryNode, FSFileNode];
//   //   return toMenuItems(context, nodeTypeCandidates: candidateTypes, onPressedF: onPressed);
//   // }
//
//   @override
//   String toString() => FLUTTER_TYPE;
//
//   @override
//   Widget? logoSrc() => null;
//
//   static const String FLUTTER_TYPE = "FSFile";
// }
