// import 'package:dart_mappable/dart_mappable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_content/flutter_content.dart';
//
// part 'snippet_ref_node.mapper.dart';
//
// @MappableClass()
// class SnippetRefNode extends CL with SnippetRefNodeMappable {
//   String snippetName;
//
//   SnippetRefNode({
//     required this.snippetName,
//   });
//
//   @override
//   List<PTreeNode> createPropertiesList(BuildContext context) => [
//         StringPropertyValueNode(
//           snode: this,
//           name: 'snippetName',
//           stringValue: snippetName,
//           onStringChange: (newValue) =>
//               refreshWithUpdate(() => snippetName = newValue),
//           calloutButtonSize: const Size(280, 70),
//           calloutSize: const Size(280, 140),
//         ),
//       ];
//
//   // @override
//   // List<Widget> nodePropertyEditors(BuildContext context, {bool allowButtonCallouts = false}) => [
//   //       NodePropertyButtonText(
//   //           label: "snippet name",
//   //           text: snippetName,
//   //           calloutButtonSize: const Size(600, 200),
//   //           calloutSize: const Size(600, 200),
//   //           onChangeF: (s) {
//   //             snippetName = s;
//   //             bloc.add(const CAPIEvent.forceRefresh());
//   //           }),
//   //     ];
//
//   @override
//   Widget toWidget(BuildContext context, STreeNode? parentNode) {
//     setParent(parentNode);
//     try {
//       var rootNode = FC().rootNodeOfEditingSnippet(snippetName);
//       return Padding(
//           padding: const EdgeInsets.all(6),
//           child: rootNode?.toWidget(context, this) ??
//               Useful.coloredText('${toString()} failed to render !'));
//     } catch (e) {
//       debugPrint('cannot render $FLUTTER_TYPE!');
//     }
//     return const Icon(Icons.error, color: Colors.blue);
//   }
//
//   @override
//   String toSource(BuildContext context) {
//     return '''SnippetRef($snippetName)''';
//   }
//
//   @override
//   String toString() => 'Snippet $snippetName';
//
//   @override
//   Widget? logoSrc() => Row(children: [
//         const Icon(Icons.link),
//         hspacer(6),
//       ]);
//
//   static const String FLUTTER_TYPE = "Snippet...";
// }
