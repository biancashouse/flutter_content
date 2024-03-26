// import 'package:flutter/material.dart';
// import 'package:flutter_content/flutter_content.dart';
// import 'package:flutter_content/src/bloc/snippet_event.dart';
// import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';
//
// class FSDirectoryTreeNodeWidget extends StatelessWidget {
//   final SnippetTreeController treeController;
//   final TreeEntry<STreeNode> entry;
//   final ScrollController? ancestorHScrollController;
//   final ScrollController? ancestorVScrollController;
//
//   const FSDirectoryTreeNodeWidget({
//     super.key,
//     required this.treeController,
//     required this.entry,
//     this.ancestorHScrollController,
//     this.ancestorVScrollController,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     if (entry.node is! FSDirectoryNode) {
//       return const Tooltip(message: 'Expected a tree node of type: FSDirectoryNode !',
//         child: Icon(Icons.warning, color: Colors.red),
//       );
//     }
//
//     FSDirectoryNode dirNode = entry.node as FSDirectoryNode;
//     FSBucketNode? parentBucketNode =
//         dirNode.findNearestAncestor<FSBucketNode>();
//     if (parentBucketNode == null) {
//       return const Tooltip(message: 'Cannot find ancestor tree node of type: FSBucketNode !',
//         child: Icon(Icons.warning, color: Colors.red),
//       );
//     }
//
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         _name(context, parentBucketNode),
//         if (entry.hasChildren)
//           ExpandIcon(
//             key: GlobalKey(), //GlobalObjectKey(widget.entry.node),
//             color: Colors.grey,
//             isExpanded: entry.isExpanded,
//             padding: EdgeInsets.zero,
//             onPressed: (_) {
//               if (entry.isExpanded) {
//                 treeController.toggleExpansion(entry.node);
//               } else {
//                 // instead of expanding current node, do a cascading expand
//                 treeController.expandCascading([entry.node]);
//               }
//             },
//           ),
//       ],
//     );
//   }
//
//   Widget _name(context, FSBucketNode bucketNode) {
//     return GestureDetector(
//       onTap: () {
//         // expand or collapse
//         if (!entry.isExpanded) {
//           treeController.expandCascading([entry.node]);
//         }
//         // select directory or file node
//         treeController.rootNode(entry);
//       },
//       child: entry.node is FSDirectoryNode
//           ? Row(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Icon(Icons.folder,
//                     size: 28,
//                     color: (entry.node as FSDirectoryNode).children.isNotEmpty
//                         ? Colors.amber
//                         : Colors.amber.withOpacity(.5)),
//                 TextButton(
//                   onPressed: () {
//                       FC()
//                           .snippetBeingEdited
//                           ?.add(SnippetEvent.selectedFSDirectoryOrNode(
//                             bucket: bucketNode,
//                             selectedNode: entry.node,
//                           ));
//                   },
//                   child: _text(),
//                 ),
//               ],
//             )
//           : InkWell(
//               onTap: () {
//                 FC().snippetBeingEdited?.add(
//                     SnippetEvent.selectedFSDirectoryOrNode(
//                         bucket: bucketNode, selectedNode: entry.node));
//               },
//               child: (entry.node as FileNode).toWidget(context, entry.node),
//             ),
//     );
//   }
//
//   Widget _text() {
//     String displayedNodeName = entry.node is SnippetRootNode &&
//             (entry.node as SnippetRootNode).name.isNotEmpty
//         ? (entry.node as SnippetRootNode).name
//         : entry.node is FSDirectoryNode &&
//                 (entry.node as FSDirectoryNode).name.isNotEmpty
//             ? (entry.node as FSDirectoryNode).name
//             : entry.node is FSDirectoryNode &&
//                     (entry.node as FSDirectoryNode).name.isEmpty
//                 ? 'directory name ?'
//                 : entry.node is FileNode &&
//                         (entry.node as FileNode).name.isEmpty
//                     ? 'file name ?'
//                     : entry.node is FileNode &&
//                             (entry.node as FileNode).src.isEmpty
//                         ? 'src ?'
//                         : entry.node is FileNode
//                             ? (entry.node as FileNode).name
//                             : entry.node.toString();
//
//     // TreeEntry<Node>? parentEntry = widget.entry.parent;
//     // String dirName = (treeController.rootNode(entry) as FSDirectoryNode).name;
//     return Useful.coloredText(displayedNodeName, color: Colors.blue);
//   }
// }
