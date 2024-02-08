// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_content/flutter_content.dart';
// import 'package:flutter_content/src/bloc/capi_bloc.dart';
// import 'package:flutter_content/src/bloc/capi_event.dart';
// import 'package:flutter_content/src/bloc/capi_state.dart';
//
// enum AddAction { addChild, wrapWith, addSiblingBefore, addSiblingAfter }
//
// void removeNodePropertiesCallout() => Callout.removeOverlay("NodeAddersAndProperties".hashCode);
//
// // void hideNodeMenuCallout() => Useful.om.hide("NodeMenu".hashCode);
// //
// // void unhideNodeMenuCallout() => Useful.om.unhide("NodeMenu".hashCode);
// //
// // void refreshNodeMenuCallout() => Callout.refreshOverlay("NodeMenu".hashCode, () {});
//
// void showNodeAddersAndPropertiesCallout({
//   required BuildContext context,
//   required STreeNode selectedNode,
//   required STreeNode? selectionParentNode,
//   required TargetKeyFunc nodeGK,
//   ScrollController? ancestorHScrollController,
//   ScrollController? ancestorVScrollController,
// }) async {
//   CAPIBloc bloc = FlutterContent().capiBloc;
//
//   // Text _menuItemText(String nodeTypeName) => Text(nodeTypeName.substring(0, nodeTypeName.length - 4));
//
//   Widget possibleAddButtons = Container(
//     width: 200,
//     height: 80,
//     margin: const EdgeInsets.all(10),
//     child: Stack(
//       children: [
//         Align(
//           alignment: Alignment.center,
//           child: Container(
//             margin: const EdgeInsets.all(1),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               border: Border.all(color: Colors.grey, width: 3),
//               borderRadius: const BorderRadius.all(Radius.circular(30)),
//             ),
//           ),
//         ),
//         if (selectedNode is! InlineSpanNode && selectedNode is! SnippetNode && selectedNode is! FileNode)
//           Align(
//             alignment: Alignment.topLeft,
//             child: _iconButton(state: bloc.state, context:context, action: AddAction.wrapWith, tooltip: 'Wrap with...'),
//           ),
//         if (selectionParentNode is MultiChildNode || selectionParentNode is TextSpanNode)
//           Align(
//             alignment: Alignment.topCenter,
//             child: _iconButton(state: bloc.state, context:context, action: AddAction.addSiblingBefore, tooltip: 'Insert sibling before...'),
//           ),
//         if (selectionParentNode is MultiChildNode || selectionParentNode is TextSpanNode)
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: _iconButton(state: bloc.state, context:context, action: AddAction.addSiblingAfter, tooltip: 'Insert sibling after...'),
//           ),
//         if ((selectedNode is SnippetNode && selectedNode.child == null) ||
//             // || (selectedNode is! ChildlessNode && !entry.hasChildren))
//             // (selectedNode is RichTextNode && selectedNode.text == null) ||
//             (selectedNode is SingleChildNode && selectedNode.child == null) ||
//             (selectedNode is MultiChildNode || selectedNode is TextSpanNode))
//           Align(
//             alignment: Alignment.bottomRight,
//             child: _iconButton(state: bloc.state, context:context, action: AddAction.addChild, tooltip: 'Add child...'),
//           ),
//         Align(
//           alignment: Alignment.center,
//           child: Text(
//             displayedNodeName(state:bloc.state),
//             style: Theme.of(context).textTheme.labelSmall?.copyWith(
//                   color: Colors.black,
//                   fontStyle: selectedNode is MultiChildNode && selectedNode.children.isEmpty ? FontStyle.italic : FontStyle.normal,
//                   // fontWeight: FlutterContent().capiBloc.aNodeIsSelected ? FontWeight.bold : FontWeight.normal,
//                 ),
//             textScaleFactor: 1.8,
//           ),
//         ),
//       ],
//     ),
//   );
//
//   // // calc optimal alignment for callout
//   // Rect? r = findGlobalRect(STreeNode.selectionGK);
//   // Alignment? tA;
//   // if (r != null) {
//   //   tA = Useful.calcTargetAlignmentWholeScreen(
//   //     r,
//   //     selectedNode.nodeAddersAndPropertiesCalloutSize.width,
//   //     selectedNode.nodeAddersAndPropertiesCalloutSize.height,
//   //   );
//   // }
//
//   Callout(
//     feature: "NodeAddersAndProperties".hashCode,
//     targetGKF: nodeGK,
//     // initialCalloutPos: initialCalloutPos,
//     initialTargetAlignment: Alignment.center,
//     initialCalloutAlignment: Alignment.center,
//     contents: () => BlocBuilder<CAPIBloc, CAPIState>(
//       builder: (context, state) {
//         return Scaffold(
//           backgroundColor: Colors.white,
//           resizeToAvoidBottomInset: false,
//           appBar: PreferredSize(
//             preferredSize: const Size.fromHeight(50.0), // here the desired height
//             child: AppBar(
//               backgroundColor: Colors.purpleAccent.withOpacity(.5),
//               title: const Text('properties'),
//               actions: [
//                 IconButton(
//                   style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white24)),
//                   icon: const Icon(
//                     Icons.close,
//                     color: Colors.black,
//                   ),
//                   onPressed: () {
//                     // possibly update selectedNode
//                     removeNodePropertiesCallout();
//                   },
//                 ),
//               ],
//             ),
//           ),
//           body: SizedBox(
//             width: selectedNode.nodeAddersAndPropertiesCalloutSize.width,
//             height: selectedNode.nodeAddersAndPropertiesCalloutSize.height,
//             child: Builder(builder: (context) {
//               print("ListView newSize: ${selectedNode.nodeAddersAndPropertiesCalloutSize}");
//               return ListView(
//                 children: [
//                   //
//                   possibleAddButtons,
//                   //
//                   selectedNode.treeView(nodeGK, Theme.of(context)),
//                   //
//                   // if (selectedNode
//                   //     .nodePropertyEditors(context)
//                   //     .isEmpty)
//                   //   Center(child: Useful.coloredText('No properties', color:Colors.white))
//                   // else
//                   //   ...selectedNode.nodePropertyEditors(context)
//                 ],
//               );
//             }),
//           ),
//         );
//       },
//     ),
//     width: selectedNode.nodeAddersAndPropertiesCalloutSize.width,
//     height: selectedNode.nodeAddersAndPropertiesCalloutSize.height,
//     resizeableH: true,
//     resizeableV: true,
//     onResize: (newSize) {
//       print("resized: ${newSize.toString()}");
//       Callout? callout = Useful.om.findCallout("NodeAddersAndProperties".hashCode);
//       // STreeNode.setNodeAddersAndPropertiesCalloutSize(selectedNode.runtimeType, newSize);
//       if (callout != null) {
//         callout.width = newSize.width;
//         callout.height = newSize.height;
//         Callout.refreshOverlay("NodeAddersAndProperties".hashCode, () {});
//       }
//     },
//     // barrierOpacity: .25,
//     arrowType: ArrowType.NO_CONNECTOR,
//     color: Colors.purpleAccent,
//     roundedCorners: 16,
//     // onBarrierTappedF: () async {
//     //   removeNodeMenuCallout();
//     // },
//   ).show();
//
// }
//
// Widget possibleAddButtons({required CAPIState state, required BuildContext context}) => Container(
//   width: 200,
//   height: 80,
//   margin: const EdgeInsets.all(10),
//   child: Stack(
//     children: [
//       Align(
//         alignment: Alignment.center,
//         child: Container(
//           margin: const EdgeInsets.all(1),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             border: Border.all(color: Colors.grey, width: 3),
//             borderRadius: const BorderRadius.all(Radius.circular(30)),
//           ),
//         ),
//       ),
//       if (state.selectedNode is! InlineSpanNode && state.selectedNode is! SnippetNode && state.selectedNode is! FileNode)
//         Align(
//           alignment: Alignment.topLeft,
//           child: _iconButton(state: state, context:context, action: AddAction.wrapWith, tooltip: 'Wrap with...'),
//         ),
//       if (state.selectedNodeParent is MultiChildNode || state.selectedNodeParent is TextSpanNode)
//         Align(
//           alignment: Alignment.topCenter,
//           child: _iconButton(state: state, context:context, action: AddAction.addSiblingBefore, tooltip: 'Insert sibling before...'),
//         ),
//       if (state.selectedNodeParent is MultiChildNode || state.selectedNodeParent is TextSpanNode)
//         Align(
//           alignment: Alignment.bottomCenter,
//           child: _iconButton(state: state, context:context, action: AddAction.addSiblingAfter, tooltip: 'Insert sibling after...'),
//         ),
//       if ((state.selectedNode is SnippetNode && (state.selectedNode as SnippetNode).child == null) ||
//           // || (selectedNode is! ChildlessNode && !entry.hasChildren))
//           // (selectedNode is RichTextNode && selectedNode.text == null) ||
//           (state.selectedNode is SingleChildNode && (state.selectedNode as SingleChildNode).child == null) ||
//           (state.selectedNode is MultiChildNode || state.selectedNode is TextSpanNode))
//         Align(
//           alignment: Alignment.bottomRight,
//           child: _iconButton(state: state, context:context, action: AddAction.addChild, tooltip: 'Add child...'),
//         ),
//       Align(
//         alignment: Alignment.center,
//         child: Text(
//           displayedNodeName(state:state),
//           style: Theme.of(context).textTheme.labelSmall?.copyWith(
//             color: Colors.black,
//             fontStyle: state.selectedNode is MultiChildNode && (state.selectedNode as MultiChildNode).children.isEmpty ? FontStyle.italic : FontStyle.normal,
//             // fontWeight: FlutterContent().capiBloc.aNodeIsSelected ? FontWeight.bold : FontWeight.normal,
//           ),
//           textScaleFactor: 1.8,
//         ),
//       ),
//     ],
//   ),
// );
//
// Widget _iconButton({required CAPIState state, required BuildContext context, required AddAction action, tooltip, key}) => MenuAnchor(
//   menuChildren: [
//     // menu heading
//     Container(
//       margin: const EdgeInsets.all(10),
//       width: 200,
//       height: 40,
//       child: Center(
//         child: Useful.purpleText('${action.name}...'),
//       ),
//     ),
//     //
//     if (action == AddAction.wrapWith)
//       ...state.selectedNode!.wrapWithCandidates(
//         context,
//         state.selectedNodeParent,
//             (type) {
//           FlutterContent().capiBloc.add(CAPIEvent.wrapWith(selectedNode: state.selectedNode!, type: type));
//           removeNodePropertiesCallout();
//         },
//       ).toList(),
//     if (action == AddAction.addSiblingBefore)
//       ...state.selectedNode!.siblingCandidates(
//         context,
//         state.selectedNodeParent,
//         action,
//             (type) {
//           FlutterContent().capiBloc.add(CAPIEvent.addSiblingBefore(selectedNode: state.selectedNode!, type: type));
//           removeNodePropertiesCallout();
//         },
//       ).toList(),
//     if (action == AddAction.addSiblingAfter)
//       ...state.selectedNode!.siblingCandidates(
//         context,
//         state.selectedNodeParent,
//         action,
//             (type) {
//           FlutterContent().capiBloc.add(CAPIEvent.addSiblingAfter(selectedNode: state.selectedNode!, type: type));
//           removeNodePropertiesCallout();
//         },
//       ).toList(),
//     if (action == AddAction.addChild)
//       ...state.selectedNode!.childCandidates(
//         context,
//         state.selectedNodeParent,
//         action,
//             (type) {
//           FlutterContent().capiBloc.add(CAPIEvent.addChild(selectedNode: state.selectedNode!, type: type));
//           removeNodePropertiesCallout();
//         },
//       ).toList(),
//   ],
//   builder: (BuildContext context, MenuController controller, Widget? child) {
//     return IconButton(
//       key: key,
//       onPressed: () {
//         if (controller.isOpen) {
//           controller.close();
//         } else {
//           controller.open();
//         }
//       },
//       icon: const Icon(Icons.add),
//       visualDensity: VisualDensity.compact,
//       style: ButtonStyle(
//         backgroundColor: MaterialStatePropertyAll(Colors.white.withOpacity(.9)),
//         padding: const MaterialStatePropertyAll(EdgeInsets.zero),
//       ),
//       padding: EdgeInsets.zero,
//       tooltip: tooltip,
//     );
//   },
// );
//
// String displayedNodeName({required CAPIState state}) =>
//     state.selectedNode is SnippetNode && (state.selectedNode as SnippetNode).name.isNotEmpty
//     ? (state.selectedNode as SnippetNode).name
//     : state.selectedNode is DirectoryNode && (state.selectedNode as DirectoryNode).name.isNotEmpty
//     ? (state.selectedNode as DirectoryNode).name
//     : state.selectedNode is FileNode && (state.selectedNode as FileNode).name.isNotEmpty
//     ? (state.selectedNode as FileNode).name
//     : state.selectedNode!.toString();
