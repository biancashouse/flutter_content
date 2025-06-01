// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_content/flutter_content.dart';
// import 'package:flutter_content/src/api/snippet_panel/snippet_properties_tree_view.dart';
// import 'package:flutter_content/src/api/snippet_panel/snippet_tree_pane.dart';
// import 'package:flutter_content/src/api/snippet_panel/versions_menu_anchor.dart';
// import 'package:flutter_content/src/bloc/snippet_being_edited.dart';
// import 'package:flutter_content/src/snippet/snodes/upto6colors.dart';
// import 'package:go_router/go_router.dart';
// import 'package:multi_split_view/multi_split_view.dart';
//
// class CalloutContentEditablePage extends StatefulWidget {
//   final (TargetModel, String) tcAndFrom;
//
//   const CalloutContentEditablePage({
//     required this.tcAndFrom,
//     required super.key, // provides access to state later - see initState and fco.pageGKs
//   });
//
//   static void refreshSelectedNodeWidgetBorderOverlay(scName) {
//     fco.dismiss(PINK_OVERLAY_NON_TAPPABLE);
//     FlutterContentApp.selectedNode
//         ?.showNodeWidgetOverlay(scName: scName, followScroll: false);
//   }
//
//   static void removeAllNodeWidgetOverlays() {
//     // fco.logger.i('removeAllNodeWidgetOverlays - start');
//     for (GlobalKey nodeWidgetGK in fco.nodesByGK.keys) {
//       fco.dismiss('${nodeWidgetGK.hashCode}-pink-overlay');
//     }
//     // fco.logger.i('removeAllNodeWidgetOverlays - ended');
//     fco.showingNodeBoundaryOverlays = false;
//   }
//
//   // allow a page widget to find its parent EditablePage
//   static CalloutContentEditablePageState? of(BuildContext context) =>
//       context.mounted
//           ? context.findAncestorStateOfType<CalloutContentEditablePageState>()
//           : null;
//
//   static String? scName(context) => of(context)?.namedSC?.name;
//
//   // static ScrollController? ancestorSc(BuildContext context, Axis? axis) {
//   //   ScrollableState? scrollableState = Scrollable.maybeOf(context, axis: axis);
//   //   return scrollableState?.widget.controller;
//   // }
//
//   @override
//   State<CalloutContentEditablePage> createState() =>
//       CalloutContentEditablePageState();
// }
//
// class CalloutContentEditablePageState
//     extends State<CalloutContentEditablePage> {
//   late MultiSplitViewController msvC;
//   late NamedScrollController? namedSC;
//
//   SnippetBeingEdited? get snippetBeingEdited =>
//       FlutterContentApp.snippetBeingEdited;
//
//   SNode? get selectedNode => FlutterContentApp.selectedNode;
//
//   TargetModel get tc => widget.tcAndFrom.$1;
//
//   String get from => widget.tcAndFrom.$2;
//
//   bool isFABVisible = true; // Tracks FAB visibility
//   Offset? fabPosition;
//
//   late SnippetPanel snippet;
//
//   @override
//   void initState() {
//     super.initState();
//
//     msvC = MultiSplitViewController();
//     namedSC = NamedScrollController(tc.contentCId, Axis.vertical);
//
//     // fco.pageGKs[widget.routePath] = widget.key as GlobalKey;
//     fco.currentEditablePagePath = tc.contentCId;
//
//     snippet = SnippetPanel.fromSnippet(
//       panelName: tc.contentCId, // never used
//       snippetName: tc.contentCId,
//       scName: null,
//     );
//
//     fco.afterNextBuildDo(() {
//       setState(() {
//         fabPosition = Offset(fco.scrW - 90, 10); // Initial position of the FAB
//
//         // auto-tap triangle
//         fco.inEditMode.value = true;
//         SnippetPanelState.showSnippetNodeWidgetOverlays(context, null);
//       });
//     });
//   }
//
//   // ScrollControllerName? scName(ctx) => EditablePage.name(ctx);
//   //
//   // NamedScrollController? sC(ctx) => scName(ctx) != null
//   //   ? NamedScrollController(scName(ctx)!, Axis.vertical)
//   //   : null;
//
//   @override
//   void dispose() {
//     if (!mounted) return;
//     namedSC?.dispose(); // Dispose of the ScrollController
//     super.dispose();
//   }
//
//   @override
//   void didChangeDependencies() {
//     /// initialize the Callouts API with the root context
//     fco.initWithContext(context);
//     super.didChangeDependencies();
//   }
//
//   // Widget snippet() => SnippetPanel.fromSnippet(
//   //       panelName: tc.contentCId, // never used
//   //       snippetName: tc.contentCId,
//   //       scName: null,
//   //     );
//
//   Widget _calloutContent() {
//     return Scaffold(
//       appBar: AppBar(
//         leading: FlutterContentApp.snippetBeingEdited == null
//             ? IconButton(
//                 onPressed: () {
//                   context.go('$from');
//                 },
//                 icon: Icon(Icons.arrow_back))
//             : const Offstage(),
//         title: FlutterContentApp.snippetBeingEdited == null
//             ? const Text('Back to Hotspot Editor')
//             : const Offstage(),
//       ),
//       body: Stack(
//         children: [
//           Align(
//             alignment: Alignment.center,
//             child: Hero(
//               tag: 'callout-content',
//               child: Container(
//                 width: tc.calloutWidth,
//                 height: tc.calloutHeight,
//                 decoration: tc.calloutDecorationShape.toDecoration(
//                   upTo6FillColors: UpTo6Colors(color1: tc.calloutFillColor),
//                   borderRadius: tc.calloutBorderRadius,
//                   thickness: tc.calloutBorderThickness,
//                   starPoints: tc.starPoints,
//                 ),
//
//                 // decoration: ShapeDecoration(
//                 //   shape: outlinedBorderGroup!.outlinedBorderType!.toFlutterWidget(nodeSide: outlinedBorderGroup?.side, nodeRadius: borderRadius),
//                 //   color: fillColor1Value != null ? Color(fillColor1Value!) : null,
//                 // ),
//                 //width: cc._calloutW,
//                 //height: cc._calloutH,
//                 child: snippet,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CAPIBloC, CAPIState>(
//         // buildWhen: (previous, current) {
//         //   bool  nodeChanged = current.snippetBeingEdited != previous.snippetBeingEdited;
//         //   bool selectionChanged = current.snippetBeingEdited?.selectedNode !=
//         //       previous.snippetBeingEdited?.selectedNode;
//         //   return true || nodeChanged || selectionChanged;
//         // },
//         builder: (context, state) {
//       // fco.logger.i('editable page build() -----------------------------------');
//       bool showNodeTree() => snippetBeingEdited != null;
//       bool showPropertiesTree() =>
//           showNodeTree() && selectedNode?.pTreeC != null;
//
//       // set up areas
//       List<Area> areas = [];
//       if (showNodeTree()) {
//         areas.add(
//           Area(
//             builder: (ctx, area) => _snodeTree(),
//             flex: 1,
//           ),
//         );
//       }
//       areas.add(Area(
//         builder: (ctx, area) {
//           return _pageContentArea();
//         },
//         flex: 2,
//       ));
//
//       msvC.areas = areas;
//
//       var msvt = MultiSplitViewTheme(
//         data: MultiSplitViewThemeData(
//           dividerThickness: 24,
//           dividerPainter: DividerPainters.grooved1(
//             backgroundColor: Colors.purple,
//             color: Colors.indigo[100]!,
//             highlightedColor: Colors.indigo[900]!,
//           ),
//         ),
//         child: MultiSplitView(
//           controller: msvC,
//           axis: Axis.horizontal,
//           initialAreas: areas,
//           onDividerDragStart: (_) {
//             EditablePage.removeAllNodeWidgetOverlays();
//           },
//           onDividerDragEnd: (_) {
//             fco.afterMsDelayDo(500, () {
//               FlutterContentApp.snippetBeingEdited?.selectedNode
//                   ?.showNodeWidgetOverlay(
//                       scName: tc.contentCId, followScroll: true);
//             });
//           },
//         ),
//       );
//
//       return Center(
//         child: Row(
//           mainAxisSize: MainAxisSize.max,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Expanded(child: msvt),
//             if (showPropertiesTree())
//               Container(
//                 width: 330,
//                 color: Colors.purpleAccent[100],
//                 child: _propertiesTree(),
//               )
//           ],
//         ),
//       );
//     });
//   }
//
//   Widget _pageContentArea() {
//     // FCO.initWithContext(context);
//
//     GlobalKey zoomerGk = GlobalKey();
//
//     bool aSnippetIsBeingEdited = FlutterContentApp.snippetBeingEdited != null;
//
//     Widget builtWidget = NotificationListener<SizeChangedLayoutNotification>(
//       onNotification: (SizeChangedLayoutNotification notification) {
//         // fco.logger.i("FlutterContentApp SizeChangedLayoutNotification}");
//         fco.dismissAll(exceptFeatures: ["FAB"]);
//         fco.afterMsDelayDo(300, () {
//           // FCO.refreshMQ(context);
//           if (fco.showingNodeBoundaryOverlays ?? false) {
//             EditablePage.removeAllNodeWidgetOverlays();
//             // show a barrier for any parts of page not being edited
//             showAllNodeWidgetOverlays();
//             fco.afterNextBuildDo(() {});
//           }
//         });
//         return true;
//       },
//       child: SizeChangedLayoutNotifier(
//         child: GestureDetector(
//           onTap: () {
//             // exitEditMode();
//             fco.inEditMode.value = false;
//             fco.inEditModeForSnippetName = null;
//           },
//           child: _calloutContent(),
//           // ),
//         ),
//       ),
//     );
//
//     return fco.isAndroid
//         ? fco.androidAwareBuild(context, builtWidget)
//         : builtWidget;
//   }
//
//   // Widget _content(Widget child) => Container(
//   //   decoration: cc.decorationShape.toDecoration(
//   //     fillColorValues: ColorValues(color1Value: cc.fillColor?.value),
//   //     borderColorValues:
//   //     ColorValues(color1Value: cc.borderColor?.value),
//   //     borderRadius: cc.borderRadius,
//   //     thickness: cc.borderThickness,
//   //     starPoints: cc.starPoints,
//   //   ),
//   //
//   //   // decoration: ShapeDecoration(
//   //   //   shape: outlinedBorderGroup!.outlinedBorderType!.toFlutterWidget(nodeSide: outlinedBorderGroup?.side, nodeRadius: borderRadius),
//   //   //   color: fillColor1Value != null ? Color(fillColor1Value!) : null,
//   //   // ),
//   //   //width: cc._calloutW,
//   //   //height: cc._calloutH,
//   //   child: Material(
//   //     type: cc.elevation > 0
//   //         ? MaterialType.canvas
//   //         : MaterialType.transparency,
//   //     color: cc.fillColor,
//   //     elevation: cc.elevation,
//   //     shape: RoundedRectangleBorder(
//   //       // Optional: customize border shape
//   //       borderRadius: BorderRadius.circular(cc.borderRadius),
//   //     ),
//   //     // cc.elevation,
//   //     child: FocusableActionDetector(
//   //       focusNode: calloutConfig.focusNode,
//   //       autofocus: true,
//   //       child: Stack(
//   //         children: <Widget>[
//   //           Align(
//   //             alignment: AlignmentEnum.topLeft,
//   //             child: cc.showGotitButton
//   //                 ? Flex(
//   //               direction: cc.gotitAxis ?? Axis.horizontal,
//   //               mainAxisSize: MainAxisSize.max,
//   //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //               crossAxisAlignment: CrossAxisAlignment.start,
//   //               children: [
//   //                 Expanded(
//   //                   child: calloutContent(cc),
//   //                 ),
//   //                 if (cc.gotitAxis != null && !cc.showcpi)
//   //                   cc._gotitButton(),
//   //                 if (cc.showcpi) cc._cpi(),
//   //               ],
//   //             )
//   //                 : calloutContent(cc),
//   //           ),
//   //           if (cc.showCloseButton) cc._closeButton(),
//   //         ],
//   //       ),
//   //     ),
//   //   ),
//   // );
//
//   Widget _snodeTree() {
//     SNode? rootNode = snippetBeingEdited?.treeC.roots.first.rootNodeOfSnippet();
//     if (rootNode is SnippetRootNode) {
//       SnippetName snippetName = rootNode.name;
//       SnippetInfoModel? snippetInfo =
//           SnippetInfoModel.cachedSnippet(snippetName);
//       if (snippetInfo != null) {
//         String title =
//             FlutterContentApp.snippetBeingEdited?.getRootNode().name ??
//                 'snippet name?';
//         //snippetBeingEdited?.treeC.rebuild();
//         return GestureDetector(
//           onTap: () {
//             FlutterContentApp.capiBloc.add(CAPIEvent.clearNodeSelection());
//             fco.dismiss(PINK_OVERLAY_NON_TAPPABLE);
//             fco.hide("floating-clipboard");
//           },
//           child: Column(
//             children: [
//               Container(
//                 color: Colors.purple,
//                 child: Row(
//                   mainAxisSize: MainAxisSize.max,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Spacer(),
//                     // Tooltip(
//                     //   message:
//                     //       'snippet: $title, versionId: ${snippetInfo.editingVersionId}'
//                     //       '${snippetInfo.editingVersionId != snippetInfo.publishedVersionId ? "\n\nSnippet name in RED indicates that this "
//                     //           "\nversion is not the PUBLISHED version" : ""}',
//                     //   child: Padding(
//                     //     padding: const EdgeInsets.only(left: 10.0),
//                     //     child: Container(
//                     //       margin: EdgeInsets.zero,
//                     //       padding: const EdgeInsets.symmetric(
//                     //           horizontal: 8, vertical: 4),
//                     //       decoration: BoxDecoration(
//                     //         color: Colors.black,
//                     //         borderRadius: BorderRadius.all(Radius.circular(30)),
//                     //       ),
//                     //       alignment: Alignment.center,
//                     //       child: Material(
//                     //         color: Colors.transparent,
//                     //         child: fco.coloredText(
//                     //           title,
//                     //           fontSize: 14.0,
//                     //           color: snippetInfo.editingVersionId !=
//                     //                   snippetInfo.publishedVersionId
//                     //               ? Colors.red
//                     //               : Colors.grey,
//                     //         ),
//                     //       ),
//                     //     ),
//                     //   ),
//                     // ),
//                     Row(
//                       children: [
//                         IconButton(
//                           hoverColor: Colors.white30,
//                           onPressed: () async {
//                             CAPIState capiState = FlutterContentApp.capiState;
//                             if (!snippetInfo.isFirstVersion()) {
//                               VersionId? prevId =
//                                   snippetInfo.previousVersionId();
//                               revertToVersion(prevId, snippetInfo, capiState);
//                             }
//                           },
//                           icon: Icon(Icons.undo,
//                               color: !snippetInfo
//                                       .isFirstVersion() //|| FlutterContentApp.capiBloc.canUndo
//                                   ? Colors.white
//                                   : Colors.white54),
//                           tooltip: 'previous version',
//                         ),
//                         IconButton(
//                           hoverColor: Colors.white30,
//                           onPressed: () {
//                             CAPIState capiState = FlutterContentApp.capiState;
//                             if (!snippetInfo.isLatestVersion()) {
//                               VersionId? nextId = snippetInfo.nextVersionId();
//                               revertToVersion(nextId, snippetInfo, capiState);
//                             }
//                           },
//                           icon: Icon(Icons.redo,
//                               color: !snippetInfo
//                                       .isLatestVersion() //|| FlutterContentApp.capiBloc.canRedo
//                                   ? Colors.white
//                                   : Colors.white54),
//                           tooltip: 'next version',
//                         ),
//                         IconButton(
//                           hoverColor: Colors.white30,
//                           onPressed: () async {},
//                           icon: VersionsMenuAnchor(snippetInfo: snippetInfo),
//                           tooltip: 'version...',
//                         ),
//                         IconButton(
//                           onPressed: () {
//                             SNode.unhighlightSelectedNode();
//                             var pinkOverlayFeature = PINK_OVERLAY_NON_TAPPABLE;
//                             fco.dismiss(pinkOverlayFeature);
//                             // fco.dismissAll(exceptFeatures: [CalloutConfigToolbar.CID]);
//                             fco.unhide(CalloutConfigToolbar.CID);
//                             fco.hideClipboard();
//                             fco.inEditMode.value = false;
//                             fco.inEditModeForSnippetName = null;
//                             FlutterContentApp.capiBloc
//                                 .add(const CAPIEvent.popSnippetEditor());
//                             // fco.afterNextBuildDo(() {
//                             //   NamedScrollController.restoreOffset(scName);
//                             // });
//                           },
//                           icon: Icon(Icons.close),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 // child: Offstage()
//                 child: SnippetTreePane(snippetInfo, tc.contentCId),
//               ),
//             ],
//           ),
//         );
//       }
//       return const Offstage();
//     } else {
//       return const Offstage();
//     }
//   }
//
//   Widget _propertiesTree() {
//     bool showingProperties = FlutterContentApp.aNodeIsSelected;
//     ScrollController? propertiesPaneSC = selectedNode?.propertiesPaneSC();
//     PNodeTreeController? pTreeC = selectedNode?.pTreeC(context, {});
//     pTreeC!.collapseAll();
//     return !showingProperties || propertiesPaneSC == null
//         ? const Offstage()
//         : Container(
//             color: Colors.blue[50],
//             child: ListView(
//               controller: selectedNode!.propertiesPaneSC(),
//               shrinkWrap: true,
//               children: [
//                 // icon buttons
//                 // ExpansionTile(
//                 //   title: fco.coloredText('widget actions',
//                 //       color: Colors.white54,
//                 //       fontSize: 14),
//                 //   backgroundColor: Colors.black,
//                 //   collapsedBackgroundColor: Colors.black,
//                 //   onExpansionChanged: (bool isExpanded) =>
//                 //       fco.showingNodeButtons = isExpanded,
//                 //   initiallyExpanded:
//                 //       fco.showingNodeButtons,
//                 //   children: [nodeButtons(context, scName)],
//                 // ),
//                 // NODE PROPERTIES TREE
//                 Material(
//                   color: Colors.blue[50],
//                   child:
//                       PropertiesTreeView(treeC: pTreeC, sNode: selectedNode!),
//                 ),
//                 if (pTreeC.roots.length < 2)
//                   Material(
//                     // color: Colors.purpleAccent[50],
//                     child: fco.coloredText(
//                         ' (${selectedNode.toString()} has no properties)',
//                         color: Colors.black87),
//                   )
//                 // Container(color: Colors.purpleAccent[100], width: double.infinity, height: 1000),
//               ],
//             ),
//           );
//   }
//
//   // void showCutoutOverlay({
//   //   ScrollControllerName? scName,
//   // }) {
//   //   fco.dismiss(CUTOUT_OVERLAY_NON_TAPPABLE);
//   //   Rect? r = nodeWidgetGK?.globalPaintBounds(
//   //     skipWidthConstraintWarning: true,
//   //     skipHeightConstraintWarning: true,
//   //   );
//   //   if (r != null) {
//   //     Rect borderRect = r; //_borderRect(r);
//   //     CalloutConfig cc = _cc(
//   //       cId: CUTOUT_OVERLAY_NON_TAPPABLE,
//   //       borderRect: borderRect,
//   //       scName: scName,
//   //     );
//   //     Widget cutout = CustomPaint(foregroundPainter: CutoutPainter(cutoutRect:
//   //     Rect.fromLTWH(0, 0, cc.calloutW!, cc.calloutH!)
//   //     ));
//   //     fco.showOverlay(
//   //       ensureLowestOverlay: true,
//   //       calloutContent: cutout,
//   //       calloutConfig: cc,
//   //       targetGkF: () => nodeWidgetGK,
//   //     );
//   //   }
//   // }
//
//   // only called with MaterialAppWrapper context
//   void showAllNodeWidgetOverlays() {
//     // fco.logger.i('showAllNodeWidgetOverlays...');
//     // if currently configuring a target, only show for the current target's snippet
//     // bool configuringATarget = fco.anyPresent([CalloutConfigToolbar.CALLOUT_CONFIG_TOOLBAR]);
//
//     void traverseAndMeasure(BuildContext el, bool overlayWithABarrier) {
//       // fco.logger.i('traverseAndMeasure(${el.toString()})');
//
//       if ((fco.nodesByGK.containsKey(el.widget.key))) {
//         // || (el.widget.key != null && gkSTreeNodeMap[el.widget.key]?.rootNodeOfSnippet() == FCO.targetSnippetBeingConfigured)) {
//         GlobalKey gk = el.widget.key as GlobalKey;
//         SNode? node = fco.nodesByGK[gk];
//         // fco.logger.i("traverseAndMeasure: ${node.toString()}");
//         if (node != null && node.canShowTappableNodeWidgetOverlay) {
//           // if (node.rootNodeOfSnippet() == FCO.targetSnippetBeingConfigured) {
//           // fco.logger.i("targetSnippetBeingConfigured: ${node.toString()}");
//           // }
//           // fco.logger.i('Rect? r = gk.globalPaintBounds...');
// // measure node
//           Rect? r = gk.globalPaintBounds(
//               skipWidthConstraintWarning: true,
//               skipHeightConstraintWarning: true);
//           // if (node is PlaceholderNode) {
//           //   fco.logger.i('PlaceholderNode');
//           // }
//           if (r != null) {
//             // node.measuredRect = Rect.fromLTWH(r.left, r.top, r.width, r.height);
//             r = fco.restrictRectToScreen(r);
//             // fco.logger.i("========>  r restricted to ${r.toString()}");
//             // fco.logger.i('${node.runtimeType.toString()} - size: (${r != null ? r.size.toString() : ""})');
//             // node.setParent(parent);
//             // parent = node;
//             // fco.logger.i('_showNodeWidgetOverlay...');
//             // removeAllNodeWidgetOverlays();
//             // pass possible ancestor scrollcontroller to overlay
//             node.showTappableNodeWidgetOverlay(
//               whiteBarrier: overlayWithABarrier,
//               scName: tc.contentCId,
//             );
//           }
//         }
//       }
//       el.visitChildElements((innerEl) {
//         traverseAndMeasure(innerEl, false);
//       });
//     }
//
//     var pageContext = context;
//     traverseAndMeasure(pageContext, true);
//     fco.showingNodeBoundaryOverlays = true;
//     // fco.logger.i('traverseAndMeasure(context) finished.');
//   }
//
//   static final String cid_EditorPassword = "editor-password";
//
//   void editorPasswordDialog() {
//     fco.registerKeystrokeHandler(cid_EditorPassword, (KeyEvent event) {
//       final key = event.logicalKey.keyLabel;
//
//       // if (event is KeyDownEvent) {
//       //   print("Key down: $key");
//       // } else if (event is KeyUpEvent) {
//       //   print("Key up: $key");
//       // } else if (event is KeyRepeatEvent) {
//       //   print("Key repeat: $key");
//       // }
//
//       if (event.logicalKey == LogicalKeyboardKey.escape) {
//         fco.dismiss(cid_EditorPassword);
//       }
//
//       return false;
//     });
//     fco.showOverlay(
//       calloutContent: Column(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           fco.purpleText("Editor Access", fontSize: 24, family: 'Merriweather'),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             width: 240,
//             height: 100,
//             child: StringEditor_T(
//               inputType: String,
//               prompt: () => 'password',
//               originalS: '',
//               onTextChangedF: (String s) async {
//                 if (kDebugMode && s != " ") return;
//                 if (!kDebugMode && fco.editorPasswords.indexOf(s) == -1) {
//                   return;
//                 }
//                 // if (!kDebugMode && !(fco.editorPasswords.contains(s))) return;
//                 fco.dismiss(cid_EditorPassword);
//                 fco.setCanEditContent(true);
//                 // await FC.loadLatestSnippetMap();
//                 // FlutterContentApp.capiBloc.add(const CAPIEvent.hideAllTargetGroupsAndBtns());
//                 // fco.afterNextBuildDo(() {
//                 //   FC()
//                 //       .capiBloc
//                 //       .add(const CAPIEvent.unhideAllTargetGroupsAndBtns());
//                 //   showDevToolsFAB();
//                 // });
//                 // fco.dismiss("editor-password");
//                 FlutterContentApp.capiBloc.add(
//                     const CAPIEvent.forceRefresh(onlyTargetsWrappers: true));
//               },
//               onEscapedF: (_) {
//                 fco.dismiss(cid_EditorPassword);
//               },
//               dontAutoFocus: false,
//               isPassword: true,
//               onEditingCompleteF: (s) {
//                 // if (s == "lakebeachocean") {
//                 //   FCO.om.remove("TrainerPassword".hashCode);
//                 //   setState(() {
//                 //     HydratedBloc.storage.write("trainerIsSignedIn", true);
//                 //   });
//                 // }
//               },
//             ),
//           ),
//         ],
//       ),
//       calloutConfig: CalloutConfigModel(
//           cId: cid_EditorPassword,
//           // initialTargetAlignment: AlignmentEnum.bottomLeft,
//           // initialCalloutAlignment: AlignmentEnum.topRight,
//           // finalSeparation: 200,
//           barrier: CalloutBarrierConfig(
//             opacity: .5,
//             onTappedF: () async {
//               fco.dismiss(cid_EditorPassword);
//             },
//           ),
//           initialCalloutW: 240,
//           initialCalloutH: 150,
//           borderRadius: 12,
//           // arrowType: ArrowTypeEnum.THIN_REVERSED,
//           fillColor: ColorModel.fromColor(Colors.white),
//           scrollControllerName: tc.contentCId,
//           onDismissedF: () {
//             fco.removeKeystrokeHandler(cid_EditorPassword);
//           }),
//       // targetGkF: ()=> fco.authIconGK,
//     );
//   }
//
//   static final String cid_UserSandboxPageName = "user-sandbox-page-name";
//
//   // void userSandboxPageNameDialog() {
//   //   fco.registerKeystrokeHandler(cid_UserSandboxPageName, (KeyEvent event) {
//   //     if (event.logicalKey == LogicalKeyboardKey.escape) {
//   //       fco.dismiss(cid_UserSandboxPageName);
//   //     }
//   //     return false;
//   //   });
//   //   fco.showOverlay(
//   //     calloutContent: Column(
//   //       mainAxisSize: MainAxisSize.max,
//   //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   //       crossAxisAlignment: CrossAxisAlignment.center,
//   //       children: [
//   //         fco.purpleText('Create your own editable Page',
//   //             fontSize: 24, family: 'Merriweather'),
//   //         Container(
//   //           padding: const EdgeInsets.symmetric(horizontal: 12),
//   //           width: 480,
//   //           height: 100,
//   //           child: StringEditor_T(
//   //             inputType: String,
//   //             prompt: () => 'Page name',
//   //             originalS: '',
//   //             onTextChangedF: (String s) async {},
//   //             onEscapedF: (_) {
//   //               fco.dismiss(cid_UserSandboxPageName);
//   //             },
//   //             dontAutoFocus: false,
//   //             onEditingCompleteF: (s) async {
//   //               String pageName = s.replaceAll(' ', '-').toLowerCase();
//   //               pageName = pageName.startsWith('/') ? pageName : '/$pageName';
//   //               // add to appInfo
//   //               if (!fco.appInfo.sandboxPageNames.contains(pageName)) {
//   //                 // jsArray issue
//   //                 List<String> newList = fco.appInfo.sandboxPageNames.toList();
//   //                 newList.add(pageName);
//   //                 fco.appInfo.sandboxPageNames = newList;
//   //                 await fco.modelRepo.saveAppInfo();
//   //               }
//   //               if (context.mounted) {
//   //                 context.go(pageName);
//   //               }
//   //               return;
//   //               fco.dismiss(cid_UserSandboxPageName);
//   //               if (!fco.appInfo.sandboxPageNames.contains(pageName)) {
//   //                 // jsArray issue
//   //                 List<String> newList = fco.appInfo.sandboxPageNames.toList();
//   //                 newList.add(pageName);
//   //                 fco.appInfo.sandboxPageNames = newList;
//   //                 await fco.modelRepo.saveAppInfo();
//   //
//   //                 final rootNode = SnippetTemplateEnum.empty.clone()
//   //                   ..name = pageName;
//   //                 SnippetRootNode
//   //                     .loadSnippetFromCacheOrFromFBOrCreateFromTemplate(
//   //                   snippetName: pageName,
//   //                   snippetRootNode: rootNode,
//   //                 ).then((_) {
//   //                   fco.afterNextBuildDo(() {
//   //                     // SnippetInfoModel.snippetInfoCache;
//   //                     //fco.router.push(pageName);
//   //                     // router.go('/');
//   //                     // TODO - tell user to visit /#/ + pageName
//   //                   });
//   //                 });
//   //               } else {
//   //                 FlutterContentApp.capiBloc.add(
//   //                     const CAPIEvent.forceRefresh(onlyTargetsWrappers: true));
//   //                 context.replace(pageName);
//   //               }
//   //             },
//   //           ),
//   //         ),
//   //       ],
//   //     ),
//   //     calloutConfig: CalloutConfigModel(
//   //         cId: cid_UserSandboxPageName,
//   //         // initialTargetAlignment: AlignmentEnum.bottomLeft,
//   //         // initialCalloutAlignment: AlignmentEnum.topRight,
//   //         // finalSeparation: 200,
//   //         barrier: CalloutBarrierConfig(
//   //           opacity: .5,
//   //           onTappedF: () async {
//   //             fco.dismiss(cid_UserSandboxPageName);
//   //           },
//   //         ),
//   //         initialCalloutW: 500,
//   //         initialCalloutH: 180,
//   //         borderRadius: 12,
//   //         // arrowType: ArrowTypeEnum.THIN_REVERSED,
//   //         fillColor: Colors.white,
//   //         scrollControllerName: tc.contentCId,
//   //         onDismissedF: () {
//   //           fco.removeKeystrokeHandler(cid_UserSandboxPageName);
//   //         }),
//   //     // targetGkF: ()=> fco.authIconGK,
//   //   );
//   // }
//
//   // if not signed in, shows a pencil icon leading to a dropdown,
//   // otherwise, shows a list of routes user can navigate to
//   // Widget authDD({Color pencilIconColor = Colors.white}) =>
//   //     StatefulBuilder(builder: (context, StateSetter setState) {
//   //       return ValueListenableBuilder<bool>(
//   //         valueListenable: fco.authenticated,
//   //         builder: (context, value, child) {
//   //           if (!fco.authenticated.isTrue) {
//   //             final dropdownItems = <DropdownMenuItem<String>>[];
//   //             dropdownItems.add(DropdownMenuItem<String>(
//   //               value: 'sign-in as a Content Editor',
//   //               child: TextButton(
//   //                 onPressed: ()=>EditablePage.of(context)?.editorPasswordDialog(),
//   //                 child: Text('sign in as a Content editor',),
//   //             ));
//   //             dropdownItems.add(DropdownMenuItem<String>(
//   //               value: 'create a Sandbox page',
//   //               child: TextButton(
//   //                 onPressed: () {
//   //                 },
//   //                 child: Text('create our own (sandbox) page',),
//   //               ),
//   //             ));
//   //             return DropdownButton<String>(
//   //               items: dropdownItems,
//   //               underline: Offstage(),
//   //               icon: Icon(
//   //                 Icons.edit,
//   //                 color: Colors.black,
//   //                 size: 24,
//   //               ),
//   //               onChanged: (_) {},
//   //             );
//   //           } else {
//   //             var pages = fco.pageList;
//   //             final dropdownItems = <DropdownMenuItem<String>>[];
//   //             dropdownItems.add(DropdownMenuItem<String>(
//   //               value: 'sign-out',
//   //               child: _signOutBtn(),
//   //             ));
//   //             for (String pagePath in pages) {
//   //               // skip currentPath
//   //               final String currentPath =
//   //               GoRouterState.of(context).uri.toString();
//   //               if (pagePath != currentPath) {
//   //                 dropdownItems.add(DropdownMenuItem<String>(
//   //                   value: pagePath,
//   //                   child: _pageNavBtn(context, pagePath, setState),
//   //                 ));
//   //               }
//   //             }
//   //             final dd = DropdownButton<String>(
//   //               items: dropdownItems,
//   //               underline: Offstage(),
//   //               icon: Icon(
//   //                 Icons.more_vert,
//   //                 color: Colors.red,
//   //                 size: 24,
//   //               ),
//   //               onChanged: (_) {},
//   //             );
//   //             return dd;
//   //           }
//   //         },
//   //       );
//   //     });
//
//   void revertToVersion(
//       VersionId? versionId, SnippetInfoModel snippetInfo, CAPIState state) {
//     if (versionId == null) return;
//     FlutterContentApp.capiBloc.add(
//       CAPIEvent.revertSnippet(
//         snippetName: snippetInfo.name,
//         versionId: fco.removeNonNumeric(versionId),
//       ),
//     );
//     fco.afterNextBuildDo(() async {
//       // current snippet version will now be changed to prevId
//       fco.logger.i('reverted to previous version.');
//       SNode.unhighlightSelectedNode();
//       // var currPageState = fco.currentPageState;
//       // currPageState?.unhideFAB();
//       fco.dismiss(PINK_OVERLAY_NON_TAPPABLE);
//       fco.dismiss(CalloutConfigToolbar.CID);
//       fco.hideClipboard();
//       // exitEditModeF();
//       // FlutterContentApp.capiBloc
//       //     .add(const CAPIEvent.popSnippetEditor());
//       // fco.dismiss(snippetName, skipOnDismiss: true);
//       final revertedVersion = snippetInfo.currentVersionFromCache();
//       if (revertedVersion != null) {
//         final newTreeC = SnippetTreeController(
//           roots: [revertedVersion],
//           childrenProvider: Node.snippetTreeChildrenProvider,
//           parentProvider: Node.snippetTreeParentProvider,
//         );
//
//         newTreeC.roots.first.validateTree();
//         newTreeC.expand(revertedVersion);
//         newTreeC.rebuild();
//
//         snippetBeingEdited!
//           ..setRootNode(revertedVersion)
//           ..selectedNode = revertedVersion.child
//           ..showProperties = false
//           ..treeC = newTreeC;
//
//         fco.refreshAll();
//       }
//       return;
//     });
//   }
// }
