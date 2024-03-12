// import 'package:flutter/material.dart';
// import 'package:flutter_content/flutter_content.dart';
// import 'package:flutter_content/src/bloc/capi_bloc.dart';
// import 'package:flutter_content/src/bloc/capi_event.dart';
// import 'package:flutter_content/src/flutter_fancy_tree_view/tree_controller.dart';

// import 'package:flutter_content/src/flutter_fancy_tree_view/tree_view.dart';
// import 'package:flutter_content/src/snippet/pnode_widget.dart';
//
// void removePropertiesTreeCallout() => Callout.removeOverlay("properties-tree".hashCode);
//
// void hidePropertiesTreeCallout() => Useful.om.hide("properties-tree".hashCode);
//
// void unhidePropertiesTreeCallout() => Useful.om.unhide("properties-tree".hashCode);
//
// void refreshPropertiesTreeCallout() => Callout.refreshOverlay("properties-tree".hashCode, () {});
//
// void showPropertiesTreeCallout({
//   required SnippetNode snode,
//   required BuildContext context,
//   required VoidCallback onChangedF,
//   bool allowButtonCallouts = false,
// }) async {
//   CAPIBloc bloc = FlutterContent().capiBloc;
//
//   Callout(
//     // context: context,
//     feature: "properties-tree".hashCode,
//     // initialCalloutPos: initialCalloutPos,
//     contents: () => Scaffold(
//       backgroundColor: Colors.black12,
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         backgroundColor: Colors.purpleAccent,
//         title: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4),
//           decoration: BoxDecoration(
//             color: Colors.black,
//             border: Border.all(color: Colors.grey, width: 1),
//             borderRadius: const BorderRadius.all(Radius.circular(30)),
//           ),
//           child: Useful.coloredText(bloc.state.selectedNode!.toString(), fontSize: 16.0, color: Colors.white),
//         ),
//         actions: [
//           IconButton(
//             style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white24)),
//             icon: Icon(
//               Icons.undo,
//               color: Colors.black.withOpacity(bloc.state.canUndo(snode.name) ? 1.0 : .1),
//             ),
//             onPressed: () {
//               if (bloc.state.canUndo(snode.name)) bloc.add(CAPIEvent.undo(name: snode.name));
//               Useful.afterNextBuildDo(() {
//                 // TODO treeC!.expandCascading([rootNode]);
//               });
//             },
//           ),
//           hspacer(16),
//           IconButton(
//             style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white24)),
//             icon: Icon(
//               Icons.redo,
//               color: Colors.black.withOpacity(bloc.state.canRedo(snode.name) ? 1.0 : .1),
//             ),
//             onPressed: () {
//               if (bloc.state.canRedo(snode.name)) bloc.add(CAPIEvent.redo(name: snode.name));
//               Useful.afterNextBuildDo(() {
//                 // TODO treeC?.expandCascading([rootNode]);
//               });
//             },
//           ),
//           hspacer(16),
//           IconButton(
//             style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white24)),
//             icon: const Icon(
//               Icons.close,
//               color: Colors.black,
//             ),
//             onPressed: () {
//               removePropertiesTreeCallout();
//             },
//           ),
//         ],
//       ),
//       body: GestureDetector(
//         onTap: () {
//           debugPrint("clear selection");
//           bloc.add(const CAPIEvent.clearNodeSelection());
//           Callout.removeOverlay(SELECTED_NODE_BORDER_CALLOUT);
//           Callout.removeOverlay("TreeNodeMenu".hashCode);
//           Callout.removeOverlay("NodeAddersAndProperties".hashCode);
//           // Useful.afterNextBuildDo(() {
//           //   refreshPropertiesTreeCallout(snippetName);
//           // });
//         },
//         child: Padding(
//           padding: const EdgeInsets.all(10),
//           child: PropertiesTree(snode:snode, rootNodes: snode.properties(themeData: Theme.of(context))),
//         ),
//       ),
//     ),
//     width: 300,
//     height: 400,
//     color: Colors.purpleAccent,
//     roundedCorners: 16,
//     resizeableH: true,
//     resizeableV: true,
//   ).show();
// }
//
// class PropertiesTree extends StatefulWidget {
//   final STreeNode? snode;
//   final List<PTreeNode> rootNodes;
//
//   // final VoidCallback onChangedF;
//   // final VoidCallback onExpiredF;
//   final bool allowButtonCallouts;
//
//   const PropertiesTree({
//     this.snode,
//     required this.rootNodes,
//     // required this.onChangedF,
//     // required this.onExpiredF,
//     this.allowButtonCallouts = false,
//     super.key,
//   });
//
//   @override
//   State<PropertiesTree> createState() => _PropertiesTreeState();
// }
//
// class _PropertiesTreeState extends State<PropertiesTree> {
//   late TreeController<Node> propertyTreeC;
//
//   Iterable<Node> _propertyTreeChildrenProvider(Node node) {
//     if (node is PropertyGroup) {
//       return node.children;
//     }
//
//     // unexpected
//     return [];
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     propertyTreeC = TreeController<Node>(roots: widget.rootNodes, childrenProvider: _propertyTreeChildrenProvider);
//     //propertyTreeC.expandCascading(propertyTreeC.roots);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return (widget.rootNodes.isNotEmpty)
//     ? TreeView<Node>(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       treeController: propertyTreeC,
//       // filter or all
//       nodeBuilder: (BuildContext context, TreeEntry<Node> entry) {
//         // if (root?.child != null) return Offstage();
//         // debugPrint("rebuilding entry: ${entry.node.runtimeType.toString()} expanded: ${entry.isExpanded}");
//         return TreeIndentation(
//           guide: const IndentGuide.connectingLines(
//             color: Colors.blueAccent,
//             indent: 40.0,
//           ),
//           entry: entry,
//           child: PTreeNodeWidget(treeC: propertyTreeC, entry: entry),
//         );
//       },
//     )
//     : Padding(
//       padding: const EdgeInsets.all(18.0),
//       child: Useful.coloredText('${widget.snode?.toString() ?? ""} has no properties.', color: Colors.purpleAccent),
//     );
//   }
// }
