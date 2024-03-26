// import 'package:dart_mappable/dart_mappable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_content/flutter_content.dart';
// import 'package:flutter_content/src/snippet/fs_folder_node.dart';
// import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';
//
// part 'fs_folder_node.mapper.dart';
//
// @MappableClass()
// class FSFolderNode extends CL with FSFolderNodeMappable {
//   FSFolderNode();
//
//   @override
//   List<PTreeNode> createPropertiesList(BuildContext context) => [];
//   @override
//   String toSource(BuildContext context) => "";
//
//   @override
//   Widget toWidget(BuildContext context, STreeNode? parentNode) {
//     if (FC().rootFSNode == null) return Icon(Icons.warning, color: Colors.red,);
//
//     FSFolderNode rootNode = FC().rootFSNode!;
//     TreeController<FSFolderNode> treeC = TreeController<FSFolderNode>(
//       roots: [rootNode],
//       childrenProvider: (FSFolderNode node) => node.children,
//       parentProvider: (FSFolderNode node) => node.parent as FSFolderNode?,
//     );
//     treeC.expandCascading([rootNode]);
//     // setParent(parentNode);
//     possiblyHighlightSelectedNode();
//     return Container(
//       key: createNodeGK(),
//       width: 600,
//       height: 600,
//       padding: const EdgeInsets.all(10),
//       child: TreeView<FSFolderNode>(
//           // physics: const NeverScrollableScrollPhysics(),
//           treeController: treeC,
//           shrinkWrap: true,
//           nodeBuilder: (BuildContext context, TreeEntry<FSFolderNode> entry) {
//             return TreeIndentation(
//               guide: const IndentGuide.connectingLines(
//                   // indent: 40.0,
//                   ),
//               entry: entry,
//               child: ElevatedButton(
//                 onPressed: () {},
//                 child: Text(entry.node.ref.name),
//               ),
//             );
//           }),
//     );
//   }
//
//   @override
//   String toString() => FLUTTER_TYPE;
//
//   @override
//   Widget? logoSrc() => null;
//
//   static const String FLUTTER_TYPE = "Firebase Storage";
// }
