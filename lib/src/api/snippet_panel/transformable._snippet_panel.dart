// // ignore_for_file: camel_case_types
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_content/flutter_content.dart';
// import 'package:flutter_content/src/bloc/capi_state.dart';
//
// class TransformableSnippetPanel extends StatefulWidget {
//   final String panelName;
//   final String snippetName;
//   final SnippetTemplate? fromTemplate;
//   final Map<String, void Function(BuildContext)>? handlers;
//   final bool allowButtonCallouts;
//   final bool justPlaying;
//
//   // final Icon? icon;
//   // final Color? iconColor;
//   // final double? iconSize;
//   // final VoidCallback? onPressed;
//   // final VoidCallback? onLongPress;
//   final ScrollController? ancestorHScrollController;
//   final ScrollController? ancestorVScrollController;
//
//   TransformableSnippetPanel({
//     required this.panelName,
//     required this.snippetName,
//     this.fromTemplate,
//     this.handlers,
//     this.allowButtonCallouts = true,
//     this.justPlaying = true,
//     // this.onPressed,
//     // this.onLongPress,
//     // this.icon,
//     // this.iconColor,
//     // this.iconSize,
//     this.ancestorHScrollController,
//     this.ancestorVScrollController,
//     super.key,
//   }) {
//     handlers?.forEach((key, value) {
//       FC().registerHandler(key, value);
//       debugPrint("registered handler '$key'");
//     });
//   }
//
//   static TransformableSnippetPanelState? of(BuildContext context) =>
//       context.findAncestorStateOfType<TransformableSnippetPanelState>();
//
//   @override
//   State<TransformableSnippetPanel> createState() =>
//       TransformableSnippetPanelState();
//
//   // static SnippetNode getRootNode(SnippetName snippetName) {
//   //   SnippetNode? sNode = FlutterContent().capiBloc.state.rootNode(snippetName);
//   //   if (sNode == null) {
//   //     // debugPrint("sNode is null");
//   //     sNode = SnippetNode(name: snippetName, child: PlaceholderNode());
//   //     // Snippet.reg(widget.onPressed, widget.onLongPress);
//   //     FlutterContent().capiBloc.add(CAPIEvent.createdSnippet(
//   //       newNode: sNode,
//   //     ));
//   //   }
//   //   return sNode;
//   // }
//
//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties.add(StringProperty('sName', snippetName, defaultValue: ''));
//   }
// }
//
// class TransformableSnippetPanelState extends State<TransformableSnippetPanel>
//     with TickerProviderStateMixin {
//   // late String snippetNameToUse;
//   TabController?
//       tabC; // used when a TabBar and TabBarView are used in a snippet's Scaffold
//   GlobalKey? tabBarGK;
//   late List<int> prevTabQ;
//   bool?
//       backBtnPressed; // allow the listener to know when to skip adding index back onto Q after a back btn
//   final prevTabQSize = ValueNotifier<int>(0);
//   late SnippetRootNode snippetRoot;
//
//   ZoomerState? get parentTSState =>
//       Zoomer.of(context);
//
//   // if root already exists, return it.
//   // If not, and a template name supplied, create a named copy of that template.
//   // If not, just create a snippet that comprises a PlaceholderNode.
//   SnippetRootNode getOrCreateSnippetFromTemplate() {
//     SnippetRootNode? snippetRootNode =
//         FC().rootNodeOfNamedSnippet(widget.snippetName);
//     // possibly create new root snippet, which will have a scaffold, appbar and a tabbar for a main menu
//     if (snippetRootNode == null && widget.fromTemplate != null) {
//       snippetRootNode =
//           SnippetPanel.getTemplate(widget.fromTemplate!);
//     } else {
//       snippetRootNode ??=
//           SnippetRootNode(name: widget.snippetName, child: PlaceholderNode())
//               .cloneSnippet();
//     }
//     snippetRootNode.name = widget.snippetName;
//     FC().snippetsMap[widget.snippetName] = snippetRootNode;
//     // FlutterContent().capiBloc.add(CAPIEvent.createdSnippet(newSnippetNode: rootNode));
//
//     return snippetRootNode;
//   }
//
//   // int countTabs() {
//   //   SnippetRootNode? rootNode = FlutterContent().capiBloc.state.rootNode("root");
//   //   if (rootNode == null) return 0;
//   //   TabBarNode? tabBarNode = FlutterContent().capiBloc.state.snippetBeingEdited?.treeC.findNodeTypeInTree(rootNode, TabBarNode) as TabBarNode?;
//   //   return tabBarNode?.children.length ?? 0;
//   // }
//
//   void createTabController(int numTabs) {
//     tabC?.dispose();
//     tabC = TabController(vsync: this, length: numTabs);
//
//     // tabC!.addListener(() {
//     //   setState(() {
//     //     _tabQ.clear();
//     //     tabC?.animateTo(tabC?.index??0);
//     //   });
//     // });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//
//     debugPrint('*** SnippetPanel() ***');
//
//     // register snippet? with panel
//     FC().snippetPlacementMap[widget.panelName] = widget.snippetName;
//
//     // in case no entry found in panel map nor a snippet name supplied, use/create a default snippet for this panel.
//     snippetRoot = getOrCreateSnippetFromTemplate();
//
//     prevTabQ = [];
//
//     Useful.afterNextBuildDo(() {
//       if (tabC != null) {
//         Useful.afterMsDelayDo(1000, () {
//           tabC!.addListener(() {
//             if (!(tabC?.indexIsChanging ?? true)) {
//               if (tabBarGK != null) {
//                 TabBarNode? tbNode =
//                     FC().gkSTreeNodeMap[tabBarGK] as TabBarNode?;
//                 if (tbNode != null && !(backBtnPressed ?? false)) {
//                   prevTabQ.add(tbNode.selection ?? 0);
//                   tbNode.selection = tabC!.index;
//                   prevTabQSize.value = prevTabQ.length;
//                   debugPrint(
//                       "tab pressed: ${tabC!.index}, Q: ${prevTabQ.toString()}");
//                 } else {
//                   tbNode?.selection = tabC!.index;
//                   backBtnPressed = false;
//                 }
//               }
//             }
//           });
//           debugPrint("*** start listening to tab controller");
//         });
//       }
//     });
//   }
//
//   void resetTabQandC() {
//     prevTabQ = [];
//     if (tabBarGK != null) {
//       TabBarNode? tbNode = FC().gkSTreeNodeMap[tabBarGK] as TabBarNode?;
//       tbNode?.selection = 0;
//       tabC?.index = 0;
//     }
//   }
//
//   // @override
//   // void didChangeDependencies() {
//   //   Useful.instance.initWithContext(context, force: true);
//   //   super.didChangeDependencies();
//   // }
//
//   // Widget _pencilIconButton(BuildContext ctx) => Positioned(
//   //       top: 2,
//   //       right: 2,
//   //       child: Container(
//   //         width: 20,
//   //         height: 20,
//   //         color: Colors.white.withOpacity(.5),
//   //         child: Center(
//   //           child: IconButton(
//   //             onPressed: () {
//   //               if (FlutterContent().capiBloc.state.snippetsBeingEdited.isEmpty) {
//   //                 //   Node.unhighlightSelectedNode();
//   //                 //   //FlutterContent().capiBloc.add(CAPIEvent.hideSnippetTree(save: true));
//   //                 //   if (Callout.anyPresent([widget.sName.hashCode])) {
//   //                 //     removeSnippetTreeCallout(widget.sName);
//   //                 //   }
//   //                 // } else {
//   //                 hideAllSingleTargetBtns();
//   //                 // FlutterContent().capiBloc.add(const CAPIEvent.hideAllTargetGroupBtns());
//   //                 // FlutterContent().capiBloc.add(const CAPIEvent.hideTargetGroupsExcept());
//   //                 FlutterContent().capiBloc.add(CAPIEvent.pushSnippetTree(snippetBloc: snippetBloc));
//   //                 //possibly show snippet tree in a callout
//   //                 // showSnippetTreeCallout(
//   //                 //   // context: context,
//   //                 //   snippetName: widget.sName,
//   //                 //   targetGKF: () => snippetPanelGK,
//   //                 //   onChangedF: () {},
//   //                 //   allowButtonCallouts: widget.allowButtonCallouts,
//   //                 // );
//   //                 CalloutState? state = Callout.of(ctx);
//   //                 state?.toggle();
//   //               }
//   //             },
//   //             padding: EdgeInsets.zero,
//   //             icon: FlutterContent().capiBloc.state.hideSnippetPencilIcons
//   //                 ? const Offstage()
//   //                 : Tooltip(
//   //                     message: widget.sName,
//   //                     child: const Icon(
//   //                       Icons.edit,
//   //                       color: Colors.purpleAccent,
//   //                       size: 20,
//   //                     ),
//   //                   ),
//   //           ),
//   //         ),
//   //       ),
//   //     );
//
//   // static CalloutConfig snippetTreeCalloutConfig(SnippetBloC snippetBloc) {
//   //   double width() {
//   //     // if (root?.child == null) return 190;
//   //     double w = min(FlutterContent().capiBloc.state.snippetTreeCalloutW ?? 400, 600);
//   //     return w > 0 ? w : 400;
//   //   }
//   //
//   //   double height() {
//   //     // if (root?.child == null) return 60;
//   //     // int numNodes = root != null ? bloc.state.snippetTreeC.countNodesInTree(root) : 0;
//   //     // double h = numNodes == 0 ? min(bloc.state.snippetTreeCalloutH ?? 400, 600) : numNodes * 60;
//   //     double h = min(FlutterContent().capiBloc.state.snippetTreeCalloutH ?? 400, Useful.scrH - 50);
//   //     return h > 0 ? h : 400;
//   //   }
//   //
//   //   return CalloutConfig(
//   //     feature: snippetBloc.rootNode?.name ?? "snippet name ?!",
//   //     // frameTarget: true,
//   //     // barrier: CalloutBarrier(
//   //     //   opacity: .1,
//   //     //   // closeOnTapped: false,
//   //     //   // hideOnTapped: true,
//   //     // ),
//   //     // onDismissedF: () {
//   //     //   CAPIState.snippetStateMap[snippetBloc.snippetName] = snippetBloc.state;
//   //     //   STreeNode.unhighlightSelectedNode();
//   //     //   Callout.dismiss('selected-panel-border-overlay');
//   //     //   FlutterContent().capiBloc.add(const CAPIEvent.unhideAllTargetGroups());
//   //     //   FlutterContent().capiBloc.add(const CAPIEvent.popSnippetBloc());
//   //     //   // removeNodePropertiesCallout();
//   //     //   Callout.dismiss(TREENODE_MENU_CALLOUT);
//   //     //   MaterialAppWrapper.showAllPinkSnippetOverlays();
//   //     //   if (snippetBloc.state.canUndo()) {
//   //     //     FlutterContent().capiBloc.add(const CAPIEvent.saveModel());
//   //     //   }
//   //     // },
//   //     // onHiddenF: () {
//   //     //   STreeNode.unhighlightSelectedNode();
//   //     //   FlutterContent().capiBloc.add(const CAPIEvent.unhideAllTargetGroups());
//   //     //   Callout.dismiss(TREENODE_MENU_CALLOUT);
//   //     //   MaterialAppWrapper.showAllPinkSnippetOverlays();
//   //     //   if (snippetBloc.state.canUndo()) {
//   //     //     FlutterContent().capiBloc.add(const CAPIEvent.saveModel());
//   //     //   }
//   //     // },
//   //     suppliedCalloutW: width(),
//   //     suppliedCalloutH: height(),
//   //     //calloutH ?? 500,
//   //     // barrierOpacity: .1,
//   //     // arrowType: ArrowType.POINTY,
//   //     // color: Colors.purpleAccent.shade100,
//   //     roundedCorners: 16,
//   //     // initialCalloutPos: bloc.state.snippetTreeCalloutInitialPos,
//   //     finalSeparation: 40,
//   //     // onBarrierTappedF: () async {
//   //     //   // also check whether any snippet change
//   //     //   var newSnippetMap = CAPIBloc.getSnippetJsonsFromTree(bloc.state.snippetTreeC);
//   //     //   bool changeOccurred = true || !mapEquals(originalSnippetMap, newSnippetMap) || originalClipboardJson != bloc.state.jsonClipboard;
//   //     //   bloc.add(CAPIEvent.hideSnippetTree(save: changeOccurred));
//   //     //   removeSnippetTreeCallout(snippetName);
//   //     //   onClosedF.call();
//   //     // },
//   //     // draggable: false,
//   //     dragHandleHeight: 40,
//   //     resizeableH: true,
//   //     resizeableV: true,
//   //     onResize: (newSize) {
//   //       //TODO - fix
//   //       // bloc.add(CAPIEvent.changedSnippetTreeCalloutSize(newW: newSize.width, newH: newSize.height));
//   //     },
//   //     onDragStartedF: () {
//   //       snippetBloc.state.selectedNode?.hidePropertiesWhileDragging = true;
//   //     },
//   //     onDragEndedF: (_) {
//   //       snippetBloc.state.selectedNode?.hidePropertiesWhileDragging = false;
//   //     },
//   //   );
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     // panel name is always supplied, but snippet name can be omitted,
//     // in which case a default snippet name is used: Snippet[pName].
//     // But first, see if there's an entry in the placement map, in which case we use that snippet name.
//     // if (FC().snippetPlacementMap.containsKey(widget.panelName)) {
//     //   snippetNameToUse = FC().snippetPlacementMap[widget.panelName]!;
//     // }
//
//     debugPrint("build snippet ${widget.panelName}");
//
//     // TODO no BloC when user not able to edit ?
//     return Zoomer(
//       child: BlocBuilder<CAPIBloC, CAPIState>(
//         key: FC().panelGkMap[widget.panelName] =
//             GlobalKey(debugLabel: 'Panel[${widget.panelName}]'),
//         // buildWhen: (previous, current) => current.snippetBeingEdited?.snippetName == widget.sName,
//         builder: (innerContext, state) {
//           debugPrint(
//               "BloC build panel:snippet ${widget.panelName}:${widget.snippetName}");
//           try {
//             return snippetRoot.toWidget(innerContext, null);
//           } catch (e) {
//             debugPrint('snippetRoot.toWidget() failed!');
//             return Material(
//               textStyle: const TextStyle(fontFamily: 'monospace', fontSize: 12),
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//                     const Icon(Icons.error, color: Colors.redAccent),
//                     hspacer(10),
//                     Useful.coloredText(e.toString()),
//                   ],
//                 ),
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
//
// //   @override
// //   Widget build2(BuildContext context) {
// //     return FutureBuilder<Widget?>(
// //       future: snippetWidgetFuture,
// //       builder: (context, snapshot) => snapshot.connectionState != ConnectionState.done
// //           ? const Placeholder(
// //               fallbackWidth: 595,
// //               fallbackHeight: 842,
// //             )
// // //      Offstage() //const CircularProgressIndicator(backgroundColor: Colors.purpleAccent)
// //           : snapshot.hasData
// //               ? NotificationListener<SizeChangedLayoutNotification>(
// //                   onNotification: (SizeChangedLayoutNotification notification) {
// //                     // debugPrint("Snippet SizeChangedLayoutNotification - ${widget.sName}");
// //                     return true;
// //                   },
// //                   child: SizeChangedLayoutNotifier(
// //                     child: BlocBuilder<CAPIBloc, CAPIState>(builder: (context, state) {
// //                       // either get snippet node from treeC, or create it now
// //                       Widget snippetW = snapshot.data ?? const Icon(Icons.report_problem, color: Colors.red);
// //                       return Stack(
// //                         children: [
// //                           ConstrainedBox(
// //                             constraints: const BoxConstraints(
// //                               minWidth: 40,
// //                               minHeight: 40,
// //                             ),
// //                             child: Container(
// //                               decoration: BoxDecoration(
// //                                 border: Border.all(width: 1, color: Colors.purpleAccent, style: BorderStyle.solid),
// //                               ),
// //                               child: snippetW,
// //                             ),
// //                           ),
// //                           if (kDebugMode) _pencilIconButton(),
// //                         ],
// //                       );
// //                     }),
// //                   ),
// //                 )
// //               : const Icon(Icons.report_problem, color: Colors.red),
// //     );
// //   }