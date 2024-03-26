// import 'package:dart_mappable/dart_mappable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_content/flutter_content.dart';
// import 'package:flutter_content/src/target_config/content/snippet_editor/directory_tree_node_widget.dart';
// import 'package:flutter_content/src/target_config/content/snippet_editor/fs_directory_tree_node_widget.dart';
// import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';
//
// part 'fs_directory_node.mapper.dart';
//
// @MappableClass()
// class FSDirectoryNode extends MC with FSDirectoryNodeMappable {
//   String name;
//
//   FSDirectoryNode({
//     this.name = "missing dir name !",
//     required super.children,
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
//   @override
//   String toSource(BuildContext context) => "";
//
//   @override
//   Widget toWidget(BuildContext context, STreeNode? parentNode) {
//     return const Icon(Icons.ac_unit);
//
//     // TreeController<Node> treeC = FlutterContent().capiBloc.state.directoryTreeCMap[ss!.widget.sName] = TreeController<Node>(
//     SnippetTreeController treeC = SnippetTreeController(
//       roots: [this],
//       childrenProvider: (STreeNode node) {
//         if (node is FileNode) {
//           return [];
//         }
//         if (node is FSDirectoryNode) {
//           return node.children;
//         }
//         // unexpected
//         return [];
//       },
//       parentProvider: (STreeNode node) => node.parent as STreeNode?,
//     );
//     int nodeCount = treeC.countNodesInTree(this);
//     // treeC.expand(this);
//     treeC.expandCascading([this]);
//     setParent(parentNode);
//     possiblyHighlightSelectedNode();
//     return Container(
//       key: createNodeGK(),
//       width: 800,
//       height: nodeCount * 60,
//       padding: const EdgeInsets.all(10),
//       child: TreeView<STreeNode>(
//         // physics: const NeverScrollableScrollPhysics(),
//         treeController: treeC,
//         shrinkWrap: true,
//         // filter or all
//         nodeBuilder: (BuildContext context, TreeEntry<STreeNode> entry) {
//           return TreeIndentation(
//             guide: const IndentGuide.connectingLines(
//                 // indent: 40.0,
//                 ),
//             entry: entry,
//             child: FSDirectoryTreeNodeWidget(
//               treeController: treeC,
//               entry: entry,
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   ListView immediateChildrenOnly(SnippetBloC snippetBloc, BuildContext context) {
//     return ListView(
//       shrinkWrap: true,
//       children: super.children.map((childNode) {
//         return childNode is FSDirectoryNode
//             ? Row(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Icon(Icons.folder, size: 28, color: Colors.amber),
//                   Text(childNode.name),
//                 ],
//               )
//             : (childNode as FileNode).toWidget(context, this);
//       }).toList(),
//     );
//   }
//
//   @override
//   String toString() => FLUTTER_TYPE;
//
//   @override
//   Widget? logoSrc() => null;
//
//   static const String FLUTTER_TYPE = "FSDirectory";
// }
