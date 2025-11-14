import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/api/editable_page/snippet_properties_tree_view.dart';
import 'package:flutter_content/src/api/editable_page/snippet_tree_view.dart';
import 'package:flutter_content/src/api/editable_page/versions_menu_anchor.dart';
import 'package:flutter_content/src/api/editable_page/tappable_node_borders.dart';
import 'package:flutter_content/src/snippet/snode_widget.dart';

import 'package:go_router/go_router.dart';
import 'package:multi_split_view/multi_split_view.dart';

class EditablePage extends StatefulWidget {
  final RoutePath routePath;
  final Widget child;

  // final bool provideNamedScrollController;

  const EditablePage({
    required this.routePath,
    required this.child,
    // this.provideNamedScrollController = false,
    // this.dontShowLockIcon = false,
    required super.key, // provides access to state later - see initState and fco.pageGKs
  });

  // allow a page widget to find its parent EditablePage
  static EditablePageState? of(BuildContext context) =>
      context.mounted
          ? context.findAncestorStateOfType<EditablePageState>()
          : null;

  static NamedScrollController? maybeScrollController(BuildContext context) =>
      of(context)?.namedSC;

  static String? maybeScrollControllerName(BuildContext context) =>
      maybeScrollController(context)?.name;

  // static ScrollController? ancestorSc(BuildContext context, Axis? axis) {
  //   ScrollableState? scrollableState = Scrollable.maybeOf(context, axis: axis);
  //   return scrollableState?.widget.controller;
  // }

  @override
  State<EditablePage> createState() => EditablePageState();
}

/// every EditablePage creates a ScrollController (not necc used)
class EditablePageState extends State<EditablePage> {
  late MultiSplitViewController msvC;
  late NamedScrollController namedSC;

  // late ScrollController treeViewScrollController;
  final kDividerThickness = 20.0;
  double sNodeTreeAreaMaxWidth = 0; // LayoutBuilder will update it
  double pNodeTreeAreaMaxWidth = 0; // LayoutBuilder will update it
  List<NodeRenderData> borderRects = [];
  bool _needsToPopulateRects = false;
  GlobalKey zoomerGk = GlobalKey();
  Debouncer debouncer = Debouncer(delayMs: 5);

  @override
  void initState() {
    print("EditablePage initState (${widget.routePath})");
    super.initState();

    msvC = MultiSplitViewController();
    namedSC = NamedScrollController(
      widget.routePath,
      Axis.vertical,
      keepScrollOffset: true,
    );
    // treeViewScrollController = ScrollController();

    // fco.pageGKs[widget.routePath] = widget.key as GlobalKey;
    fco.currentEditablePagePath = widget.routePath;

    // fco.afterNextBuildDo(() {
    //   setState(() {
    //     fabPosition = Offset(fco.scrW - 90, 10); // Initial position of the FAB
    //   });
    // });
  }

  @override
  void dispose() {
    if (!mounted) return;
    namedSC.dispose(); // Dispose of the ScrollController
    super.dispose();
  }

  // also allow for a selected node
  void _populateNodeBorderRects(CAPIBloC bloc) {
    if (bloc.state.activeSnippetName == null) return;
    List<SNode> nodes = [];
    SnippetRootNode? rootNode;
    // not yet editing, show all widget borderRects
    SnippetInfoModel? snippetInfo = SnippetInfoModel.cachedSnippetInfo(
      bloc.state.activeSnippetName!,
    );
    rootNode = snippetInfo?.currentVersionFromCache();
    // traverse node
    borderRects.clear();
    if (rootNode != null) {
      nodes = rootNode.findDescendantNodes();
      // print('found ${nodes.length} nodes in snippet $snippetName');
      for (SNode node in nodes) {
        Rect? borderRect = node.calcBorderRect();
        if (borderRect != null) {
          borderRects.add(NodeRenderData(node: node, rect: borderRect));
        }
      }
    }
    // print('populateNodeBorderRects measured ${borderRects.length} nodes.');
    // for (NodeRenderData data in borderRects) {
    //   print('rect: ${data.rect}');
    // }
  }

  @override
  Widget build(BuildContext context) {
    // print('build - borderRects: ${borderRects.length}');
    return BlocConsumer<CAPIBloC, CAPIState>(
      // only run the listener when in select widget mode or...
      listenWhen: (prev, curr) {
        // Listen only when the active snippet mode changes
        return prev.activeSnippetName != curr.activeSnippetName ||
            prev.snippetBeingEdited?.selectedNode !=
                curr.snippetBeingEdited?.selectedNode;
      },
      listener: (lcontext, state) {
        if (state.activeSnippetName != null &&
            state.snippetBeingEdited == null) {
          // just entered snippetNodeSelection mode
          print('listener: setting _needsToPopulateRects to true');
          // Set the flag. Don't schedule any callbacks here.
          _needsToPopulateRects = true;
        } else if (state.snippetBeingEdited?.selectedNode != null) {
          // update selection widget overlay
          // skip if currently editing a markdown, quill, or uml
          if (fco.anyPresent(['quill-te', 'uml-te', 'markdown-te'])) return;
          fco.dismissAll();
          fco.afterNextBuildDo(() {
            _needsToPopulateRects = true;
          });
        }
      },
      // only rebuild page when entering or exiting snippet editor (msv)
      buildWhen: (previous, current) {
        if (_needsToPopulateRects) {
          // // Clear old rects when snippet changes
          // if (previous.activeSnippetName != null) {
          //   borderRects.clear();
          // }
          return true;
        }
        if (previous.activeSnippetName != current.activeSnippetName)
          return true;
        if (previous.snippetBeingEdited != current.snippetBeingEdited)
          return true;
        if (previous.snippetBeingEdited?.selectedNode !=
            current.snippetBeingEdited?.selectedNode) {
          print('new node selection');
          return true;
        }
        if (previous.isSignedIn != current.isSignedIn) return true;
        if (current.onlyTargetsWrappers) return false;
         return false;
      },
      // bool selectWidgetModeChanged =
      //     previous.snippetNameShowingTappableOverlaysFor !=
      //     current.snippetNameShowingTappableOverlaysFor;
      // if (selectWidgetModeChanged) {
      //   nodeBorderRects = [];
      //   if (current.snippetNameShowingTappableOverlaysFor != null) {
      //     // create a dotted rect positioned abs over each node found
      //     // in the snippet's tree
      //     if (fco.inSelectWidgetMode) {
      //       String? snippetName =
      //           fco.capiBloc.state.snippetNameShowingTappableOverlaysFor;
      //       if (snippetName != null) {
      //         var snippetInfo = SnippetInfoModel.cachedSnippetInfo(
      //           snippetName,
      //         );
      //         var snippetChild = snippetInfo
      //             ?.currentVersionFromCache()
      //             ?.child;
      //         // print('root node for tappable overlays is a ${snippetChild.toString()}');
      //         if (!fco.anyPresent(['quill-te', 'uml-te', 'markdown-te'])) {
      //           BuildContext? ctx =
      //               snippetChild?.nodeWidgetGK?.currentContext;
      //           // print('currentContext is $ctx');
      //           if (ctx != null) {
      //             ctx.showSnippetNodeWidgetTappableBorderRects(
      //               namedSC.name,
      //               nodeBorderRects,
      //               NamedScrollController.hScrollOffset(namedSC.name),
      //               NamedScrollController.vScrollOffset(namedSC.name),
      //             );
      //           }
      //         }
      //       }
      //     }
      //   }
      //
      // },
      builder: (BuildContext context, CAPIState state) {
        print('builder');
        final bloc = context.read<CAPIBloC>();

        Widget
        builtWidget = NotificationListener<SizeChangedLayoutNotification>(
          onNotification: (SizeChangedLayoutNotification notification) {
            // fco.afterMsDelayDo(300, () {
            //   fco.dismissAll();
            //   // bloc.add(CAPIEvent.updateTappableRects());
            // });
            // This notification fires after the child has been laid out.
            // if (_needsToPopulateRects) {
            //   print('SizeChangedLayoutNotification: Populating rects now.');
            //   // Use a post-frame callback to avoid modifying state during build notification.
            //   WidgetsBinding.instance.addPostFrameCallback((_) {
            //     if (mounted) {
            //       _populateNodeBorderRects(context);
            //       setState(() {}); // Trigger rebuild to show the new borders
            //     }
            //   });
            //   _needsToPopulateRects = false; // We've done it, reset the flag.
            // }
            return true;
          },
          child: SizeChangedLayoutNotifier(
            child: GestureDetector(
              onTap: () {
                if (bloc.showTappableBorderRects()) {
                  bloc.add(CAPIEvent.exitNodeSelectionMode());
                }
              },
              child: Material(
                child: bloc.aSnippetIsBeingEdited()
                    ? _msv()
                    : _snippetWidgetStack(bloc),
              ),
            ),
          ),
        );

        return fco.isAndroid
            ? fco.androidAwareBuild(context, builtWidget)
            : builtWidget;
      },
    );
  }

  void _tappedToEditSnippetAndSelectNode(SNode node) {
    SnippetRootNode? rootNode = node.rootNodeOfSnippet();
    if (rootNode == null) return;
    SnippetName? snippetName = rootNode.name;
    // maybe a page snippet, so check name in appInfo: maybe prefix with /
    // var names = fco.appInfo.snippetNames;
    if (fco.appInfo.snippetNames.contains('/$snippetName')) {
      snippetName = '/$snippetName';
    }

    if (SnippetRootNode.isHotspotCalloutContent(snippetName)) {
      final cc = fco
          .findOE(snippetName)
          ?.calloutConfig;
      cc?.rebuild(() {
        cc
          ..barrier = null
          ..targetPointerType = TargetPointerType.none();
      });
    }

    pushThenShowNamedSnippetWithNodeSelected(rootNode, node, scName: namedSC.name);
  }

  void pushThenShowNamedSnippetWithNodeSelected(SnippetRootNode rootNode,
      SNode selectedNode, {
        TargetModel? targetBeingConfigured,
        ScrollControllerName? scName,
      }) {
    if (rootNode.child?.nodeWidgetGK?.currentContext == null) {
      fco.showToast(
        msg: "This node is not visible right now",
        bgColor: Colors.white,
        textColor: Colors.red,
        removeAfterMs: 5000,
      );
      return;
    }

    context.read<CAPIBloC>().add(
      CAPIEvent.pushSnippetEditor(
        rootNode: rootNode,
        selectedNode: selectedNode,
      ),
    );
    fco.afterNextBuildDo(() {
      if (fco.snippetBeingEdited != null) {
        if (!fco.appInfo.clipboardIsEmpty) {
          fco.appInfo.showFloatingClipboard();
        }
        fco.hide(CalloutConfigToolbar.CID);
      }

      // point out the selected node widget
      SNodeWidget.pointOutSelectedNode(scName);

      // // point out the selected node in the snippet tree
      // fco.afterMsDelayDo(1000, () {
      //   var cc = selectedNode.nodeGK?.currentContext;
      //   if (cc != null) {
      //     Scrollable.ensureVisible(
      //       cc,
      //       duration: const Duration(milliseconds: 500),
      //       curve: Curves.easeOut,
      //       alignment: .5,
      //     );
      //   }
      // });
    });
  }

  Widget _msv() {
    print('_msv');
    // set up areas
    List<Area> areas = [];
    areas.add(
      Area(
        builder: (ctx, area) =>
            LayoutBuilder(
              builder: (_, BoxConstraints constraints) {
                sNodeTreeAreaMaxWidth = constraints.maxWidth;
                return _sNodeTreeArea();
              },
            ),
        flex: 1,
      ),
    );
    if (fco.capiBloc.state.snippetBeingEdited?.selectedNode?.pTreeC != null) {
      areas.add(
        Area(
          builder: (ctx, area) =>
              LayoutBuilder(
                builder: (_, BoxConstraints constraints) {
                  pNodeTreeAreaMaxWidth = constraints.maxWidth;
                  return _propertiesPanel();
                },
              ),
          flex: 1,
        ),
      );
    }
    areas.add(
      Area(
        builder: (ctx, area) =>
            SnippetBuilder(
              snippetName: fco.capiBloc.state.snippetBeingEdited
                  ?.getRootNode()
                  .name,
              scName: widget.routePath,
            ),
        flex: 2,
      ),
    );

    msvC.areas = areas;

    // 2 layouts: 1) property tree on right of content area, 2) hidden snode tree, single property above content area
    var msvt = MultiSplitViewTheme(
      data: MultiSplitViewThemeData(
        dividerThickness: kDividerThickness,
        dividerPainter: DividerPainters.grooved1(
          backgroundColor: Colors.purple,
          color: Colors.indigo[100]!,
          highlightedColor: Colors.indigo[900]!,
        ),
      ),
      child: MultiSplitView(
        controller: msvC,
        axis: Axis.horizontal,
        initialAreas: areas,
        onDividerDragStart: (_) {
          // TODO rebuild nodeBorderRects
          fco.capiBloc.add(CAPIEvent.updateTappableRects());
        },
        onDividerDragEnd: (_) {
          // final rootNode = fco.selectedNode?.rootNodeOfSnippet();
          // if (rootNode != null) {
          //   assert(rootNode.isValid());
          //   fco.saveNewVersion(snippet: rootNode);
          //   // refreshSelectedNodeWidgetBorderOverlay(rootNode.name);
          //   // showNodeWidgetOverlays();
          // }
        },
      ),
    );

    //
    return Center(child: msvt);
  }

  Widget _snippetWidgetStack(CAPIBloC bloc) =>
      Stack(
        children: [
          if (bloc.showTappableBorderRects())
            SnippetBuilder(
              snippetName: bloc.state.activeSnippetName,
              scName: widget.routePath,
              onLayoutDone: () {
                // when SnippetBuilder's FutureBuilder finishes.
                if (_needsToPopulateRects) {
                  print('SnippetBuilder.onLayoutDone: Populating rects now.');
                  // We are already in a post-frame callback, so it's safe to measure.
                  if (mounted) {
                    setState(() {
                      _populateNodeBorderRects(bloc);
                      _needsToPopulateRects = false;
                    }); // Trigger rebuild to show the new borders
                  }
                }
              },
              onScrollF: (ScrollNotification event) {
                // debouncer.run(() {
                setState(() {
                  _populateNodeBorderRects(bloc);
                });
                // });
              },
            ),
          if (bloc.dontShowTappableBorderRects())
            DevGrid(
              showGuides: fco.canEditContent(),
              horizontalSpacing: 100.0,
              verticalSpacing: 100.0,
              lineColor: Colors.red.withAlpha(70),
              // 0.15 * 255
              lineThickness: 1.0,

              // Show additional guides
              // showSafeArea: true,
              // showRuler: true,
              marginWidth: 0.0,
              child: Zoomer(key: zoomerGk, child: widget.child),
            ),
          if (bloc.showTappableBorderRects() && borderRects.isNotEmpty)
            TappableNodeBorders(
              renderData: borderRects,
              onNodeTapped: (node) {
                if (bloc.aSnippetIsBeingEdited()) {
                  // When a node is tapped, fire the existing SelectNode event
                  bloc.add(CAPIEvent.selectNode(node: node));
                } else {
                  _tappedToEditSnippetAndSelectNode(node);
                }
              },
            ),
          if (bloc.dontShowTappableBorderRects())
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(
                    right: fco.canEditContent() ? 68 : 8.0),
                child: fco.NavigationDD(pencilIconColor: Colors.red),
              ),
            ),
        ],
      );

  // Widget _viewingPageInSelectWidgetMode() {
  //   print('_viewingPageInSelectWidgetMode(${nodeBorderRects.length})');
  //   Widget builtWidget = Material(
  //     child: Stack(
  //       fit: StackFit.loose,
  //       children: [
  //         _snippetToShowIn(context),
  //         Stack(children: nodeBorderRects),
  //       ],
  //     ),
  //   );
  //
  //   return fco.isAndroid
  //       ? fco.androidAwareBuild(context, builtWidget)
  //       : builtWidget;
  // }

  // Widget _editContentArea(BuildContext areaContext) {
  //   Widget builtWidget = NotificationListener<SizeChangedLayoutNotification>(
  //     onNotification: (SizeChangedLayoutNotification notification) {
  //       // fco.logger.i("FlutterContentApp SizeChangedLayoutNotification}");
  //       // fco.dismissAll(exceptFeatures: ["FAB"]);
  //       // refresh tappables
  //       fco.afterMsDelayDo(300, () {
  //         // FCO.refreshMQ(context);
  //         if (fco.inNodeSelectionMode) {
  //           // EditablePage.removeAllTappableNodeWidgetOverlays();
  //           fco.dismissAll();
  //           // show a barrier for any parts of page not being edited
  //           // showNodeWidgetOverlays();
  //           // protect iFrames and PlatformViews with an overlay having PointerInterceptor
  //           // showNodeWidgetOverlays();
  //           // fco.afterNextBuildDo(() {});
  //         }
  //       });
  //       return true;
  //     },
  //     child: SizeChangedLayoutNotifier(
  //       child: GestureDetector(
  //         onTap: () {
  //           // exitEditMode();
  //           fco.capiBloc.add(CAPIEvent.exitNodeSelectionMode());
  //           // fco.afterNextBuildDo(() {
  //           //   fco.afterMsDelayDo(1000, () {
  //           //     showNodeWidgetOverlays();
  //           //   });
  //           // });
  //         },
  //         child: Material(
  //           animateColor: true,
  //           child: false && fco.aNodeIsSelected
  //               ? _editContentAreaHighlightingASelectedNode(widgetToShow)
  //               : widgetToShow,
  //         ),
  //       ),
  //     ),
  //   );
  //
  //   return fco.isAndroid
  //       ? fco.androidAwareBuild(context, builtWidget)
  //       : builtWidget;
  // }

  // Widget _contentWidget(BuildContext ctx) {
  //   SnippetRootNodeNode? snippetToShow;
  //
  //   if (fco.capiBloc.state.showOnlySnippet != null) {
  //     SnippetName snippetName = fco.capiBloc.state.showOnlySnippet!;
  //     SnippetInfoModel? snippetInfo = SnippetInfoModel.cachedSnippetInfo(
  //       snippetName,
  //     );
  //     snippetToShow =
  //         snippetInfo?.currentVersionFromCache() ??
  //         SnippetRootNode(name: 'placeholder', child: PlaceholderNode());
  //   } else {
  //     snippetToShow =
  //         (fco.snippetBeingEdited?.getRootNode()) ??
  //         SnippetRootNode(name: 'placeholder', child: PlaceholderNode());
  //   }
  //
  //   return snippetToShow.buildFlutterWidget(ctx, null);
  // }

  // Widget _editContentAreaHighlightingASelectedNode(widgetToShow) => Stack(
  //   fit: StackFit.loose,
  //   children: [
  //     widgetToShow,
  //     if (fco.selectedNode != null && mounted)
  //       // show a cutout barrier for selected snode
  //       ModalBarrierWithCutout(
  //         cutoutRect: (fco.selectedNode?.calcBorderRect() ?? Rect.zero)
  //             .translate(
  //               -sNodeTreeAreaMaxWidth -
  //                   pNodeTreeAreaMaxWidth -
  //                   kDividerThickness * 2,
  //               0,
  //             ),
  //         color: Colors.purple,
  //         opacity: .75,
  //       ),
  //   ],
  // );

  Widget _sNodeTreeArea() {
    final bloc = context.read<CAPIBloC>();

    SNode? rootNode = fco.snippetBeingEdited?.treeC.roots.first
        .rootNodeOfSnippet();
    if (rootNode is SnippetRootNode) {
      SnippetName snippetName = rootNode.name;
      SnippetInfoModel? snippetInfo = SnippetInfoModel.cachedSnippetInfo(
        snippetName,
      );
      if (snippetInfo != null) {
        // String title =
        //     fco.snippetBeingEdited?.getRootNode().name ??
        //         'snippet name?';
        //snippetBeingEdited?.treeC.rebuild();
        return GestureDetector(
          onTap: () {
            fco.dismissAll();
            // if showing markdown editor callout, just dismiss it, but don't remove node selection
            // if (fco.anyPresent(['md-te'])) {
            //   fco.dismiss('md-te');
            //   return;
            // }
            bloc.add(CAPIEvent.clearNodeSelection());
            // removeAllNodeWidgetOverlays();
            // fco.afterMsDelayDo(1000, () {
            //   showNodeWidgetOverlays();
            // });
            fco.hide("floating-clipboard");
          },
          child: Material(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.purple,
                title: fco.coloredText("Snippet", color: Colors.white),
                centerTitle: true, // Add this line
                actions: [
                  IconButton(
                    hoverColor: Colors.white30,
                    onPressed: () async {
                      CAPIState capiState = fco.capiBloc.state;
                      if (!snippetInfo.isFirstVersion()) {
                        VersionId? prevId = snippetInfo.previousVersionId();
                        revertToVersion(prevId, snippetInfo, capiState);
                      }
                    },
                    icon: Icon(
                      Icons.undo,
                      color:
                      !snippetInfo
                          .isFirstVersion() //|| fco.capiBloc.canUndo
                          ? Colors.white
                          : Colors.white54,
                    ),
                    tooltip: 'previous version',
                  ),
                  IconButton(
                    hoverColor: Colors.white30,
                    onPressed: () {
                      CAPIState capiState = fco.capiBloc.state;
                      if (!snippetInfo.isLatestVersion()) {
                        VersionId? nextId = snippetInfo.nextVersionId();
                        revertToVersion(nextId, snippetInfo, capiState);
                      }
                    },
                    icon: Icon(
                      Icons.redo,
                      color:
                      !snippetInfo
                          .isLatestVersion() //|| fco.capiBloc.canRedo
                          ? Colors.white
                          : Colors.white54,
                    ),
                    tooltip: 'next version',
                  ),
                  IconButton(
                    hoverColor: Colors.white30,
                    onPressed: () async {},
                    icon: VersionsMenuAnchor(snippetInfo: snippetInfo),
                  ),
                  IconButton(
                    onPressed: () {
                      // SNode.unhighlightSelectedNode();
                      // if was editing a callout content snippet, dismiss all callouts
                      if (SnippetRootNode.isHotspotCalloutContent(
                        snippetName,
                      )) {
                        fco.dismissAll();
                      } else {
                        fco.dismiss('selected-node');
                        // fco.dismissAll(exceptFeatures: [CalloutConfigToolbar.CID]);
                        fco.unhide(CalloutConfigToolbar.CID);
                        fco.appInfo.hideClipboard();
                      }
                      fco.dismissAll();
                      fco.capiBloc.add(const CAPIEvent.popSnippetEditor());
                    },
                    icon: Icon(Icons.close),
                  ),
                ],
              ),
              body: Material(
                color: Colors.purple.shade200,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: InteractiveViewer(
                    transformationController: fco.snippetTreeTC,
                    // trackpadScrollCausesScale: true,
                    alignment: Alignment.topLeft,
                    constrained: false,
                    // onInteractionStart: (_) => snippetBloc.add(const CAPIEvent.clearNodeSelection()),
                    // onInteractionEnd: (_) => snippetBloc.add(const CAPIEvent.clearNodeSelection()),
                    child: Builder(
                      builder: (context) {
                        // fco.logger.i('SnippetTreeView...');
                        return SizedBox(
                          width: 700,
                          height: 1200,
                          child: SnippetTreeView(scName: namedSC.name),
                        );
                      },
                    ),
                  ),
                ),
              ),
              // SnippetTreePane(snippetInfo, widget.routePath),
            ),
          ),
        );
      }
      return const Offstage();
    } else {
      return const Offstage();
    }
  }

  Widget _propertiesPanel() {
    print('_properties panel');
    return BlocBuilder<CAPIBloC, CAPIState>(
      // only rebuild when selection changes
      buildWhen: (previous, current) {
        if (current.onlyTargetsWrappers) return false;
        if (previous.snippetBeingEdited?.selectedNode !=
            current.snippetBeingEdited?.selectedNode) {
          print('new node selection');
          return true;
        }
        return false;
      },
      builder: (BuildContext context, CAPIState state) {
        // final bloc = fco.capiBloc; //context.read<CAPIBloC>();
        bool showingProperties = fco.aNodeIsSelected;
        ScrollController? propertiesPaneSC = state
            .snippetBeingEdited
            ?.selectedNode
            ?.propertiesPaneSC();
        PNodeTreeController? pTreeC = state.snippetBeingEdited?.selectedNode
            ?.pTreeC(context, {});
        // pTreeC!.collapseAll();
        return !showingProperties || propertiesPaneSC == null
            ? const Offstage()
            : Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
            title: fco.coloredText(
              "Properties (selected node)",
              color: Colors.white,
            ),
          ),
          body: Material(
            color: Colors.blue[50],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InteractiveViewer(
                transformationController: fco.propertiesTreeTC,
                alignment: Alignment.topLeft,
                constrained: false,
                child: SizedBox(
                  width: pNodeTreeAreaMaxWidth,
                  height: 1000,
                  child: PropertiesTreeView(
                    treeC: pTreeC!,
                    sNode: state.snippetBeingEdited!.selectedNode!,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // only called with MaterialAppWrapper context
  // void showNodeWidgetOverlays() {
  //   return;
  //   void traverseAndMeasure(BuildContext el) {
  //     if ((fco.nodesByGK.containsKey(el.widget.key))) {
  //       GlobalKey gk = el.widget.key as GlobalKey;
  //       SNode? node = fco.nodesByGK[gk];
  //       if (node != null) {
  //         Rect? r = gk.globalPaintBounds(
  //           skipWidthConstraintWarning: true,
  //           skipHeightConstraintWarning: true,
  //         );
  //         if (r != null) {
  //           r = fco.restrictRectToScreen(r);
  //           if (fco.inSelectWidgetMode &&
  //                   node.canShowTappableNodeWidgetOverlay ||
  //               node.isHtmlElementViewOrPlatformView()) {
  //             node.showTappableNodeWidgetOverlay(
  //               context,
  //               // whiteBarrier: overlayWithABarrier,
  //               scName: widget.routePath,
  //             );
  //           }
  //         }
  //       }
  //     }
  //
  //     el.visitChildElements((innerEl) {
  //       traverseAndMeasure(innerEl);
  //     });
  //   }
  //
  //   dismissAllNodeWidgetOverlays();
  //
  //   var pageContext = context;
  //   traverseAndMeasure(pageContext);
  //   // fco.showingNodeBoundaryOverlays = true;
  //   // fco.logger.i('traverseAndMeasure(context) finished.');
  // }

  // static void dismissAllNodeWidgetOverlays() {
  //   for (GlobalKey nodeWidgetGK in fco.nodesByGK.keys) {
  //     fco.dismiss('${nodeWidgetGK.hashCode}-pink-overlay');
  //   }
  // }

  // when a node is selected, whiten out ALL others
  // void showUnselectedNonTappableNodeWidgetOverlays() {
  //   void traverseAndMeasure(BuildContext el) {
  //     if ((fco.nodesByGK.containsKey(el.widget.key))) {
  //       GlobalKey gk = el.widget.key as GlobalKey;
  //       SNode? node = fco.nodesByGK[gk];
  //       if (node != null &&
  //           fco.selectedNode != null &&
  //           fco.selectedNode != node) {
  //         Rect? r = gk.globalPaintBounds(
  //           skipWidthConstraintWarning: true,
  //           skipHeightConstraintWarning: true,
  //         );
  //         if (r != null) {
  //           r = fco.restrictRectToScreen(r);
  //           node.showNonTappableNodeWidgetOverlay(borderRect: r);
  //         }
  //       }
  //     }
  //     el.visitChildElements((innerEl) {
  //       traverseAndMeasure(innerEl);
  //     });
  //   }
  //
  //   var pageContext = context;
  //   traverseAndMeasure(pageContext);
  //   // fco.showingNodeBoundaryOverlays = true;
  //   // fco.logger.i('traverseAndMeasure(context) finished.');
  // }

  // only called with MaterialAppWrapper context
  // void showNodeWidgetOverlaysNeedingInterception() {
  //   void traverseAndMeasure(BuildContext el, bool overlayWithABarrier) {
  //     if ((fco.nodesByGK.containsKey(el.widget.key))) {
  //       GlobalKey gk = el.widget.key as GlobalKey;
  //       SNode? node = fco.nodesByGK[gk];
  //       if (node != null && node.isHtmlElementViewOrPlatformView()) {
  //         Rect? r = gk.globalPaintBounds(
  //           skipWidthConstraintWarning: true,
  //           skipHeightConstraintWarning: true,
  //         );
  //         if (r != null) {
  //           r = fco.restrictRectToScreen(r);
  //           node.showNonTappableNodeWidgetOverlay(
  //             // selected: false,
  //             borderRect: r,
  //             scName: widget.routePath,
  //           );
  //         }
  //       }
  //     }
  //     el.visitChildElements((innerEl) {
  //       traverseAndMeasure(innerEl, false);
  //     });
  //   }
  //
  //   var pageContext = context;
  //   traverseAndMeasure(pageContext, true);
  //   // fco.showingNodeBoundaryOverlays = true;
  //   // fco.logger.i('traverseAndMeasure(context) finished.');
  // }

  static final String cid_EditorPassword = "editor-password";

  void editorPasswordDialog() {
    fco.registerKeystrokeHandler(cid_EditorPassword, (KeyEvent event) {
      // final key = event.logicalKey.keyLabel;

      // if (event is KeyDownEvent) {
      //   print("Key down: $key");
      // } else if (event is KeyUpEvent) {
      //   print("Key up: $key");
      // } else if (event is KeyRepeatEvent) {
      //   print("Key repeat: $key");
      // }

      if (event.logicalKey == LogicalKeyboardKey.escape) {
        fco.dismiss(cid_EditorPassword);
      }

      return false;
    });
    // give the callout a gk so it can be measured
    final gk = GlobalKey();
    fco.showOverlay(
      calloutContent: Card(
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          margin: EdgeInsets.all(12),
          width: 320,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              fco.purpleText(
                "Editor Access\n",
                fontSize: 24,
                family: 'Merriweather',
              ),

              StringOrNumberEditor(
                inputType: String,
                prompt: () => 'password',
                originalS: '',
                onTextChangedF: (String s) async {
                  if (!fco.appInfo.editorPasswords.contains(s)) {
                    return;
                  }
                  // if (!kDebugMode && !(fco.editorPasswords.contains(s))) return;
                  fco.dismiss(cid_EditorPassword);
                  fco.capiBloc.add(
                    CAPIEvent.signedIn(asGuestEditor: s == "GUEST"),
                  );
                },
                onEscapedF: (_) {
                  fco.dismiss(cid_EditorPassword);
                },
                dontAutoFocus: false,
                isPassword: true,
                onEditingCompleteF: (s) {
                  // if (s == "lakebeachocean") {
                  //   FCO.om.remove("TrainerPassword".hashCode);
                  //   setState(() {
                  //     HydratedBloc.storage.write("trainerIsSignedIn", true);
                  //   });
                  // }
                },
              ),
              Text.rich(
                TextSpan(
                  text: '\n\nAnonymous Users:\n',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text:
                      'If you\'d like to see how editing works in an\n'
                          'app built with our ',
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                    TextSpan(
                      text: 'flutter_content',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text:
                      ' package,\nuse password "GUEST".\n'
                          'Any changes you make will be discarded when\n'
                          'you leave this browser tab, or sign out.',
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      calloutConfig: CalloutConfig(
        cId: cid_EditorPassword,
        // initialTargetAlignment: Alignment.bottomLeft,
        // initialCalloutAlignment: Alignment.topRight,
        // finalSeparation: 200,
        barrier: CalloutBarrierConfig(
          opacity: .5,
          onTappedF: () async {
            fco.dismiss(cid_EditorPassword);
          },
        ),
        // initialCalloutW: 300,
        // initialCalloutH: 240,
        // decorationBorderRadius: 12,
        // // arrowType: ArrowTypeEnumModel.THIN_REVERSED,
        // decorationFillColors: ColorOrGradient.color(Colors.white),
        scrollControllerName: widget.routePath,
        onDismissedF: () {
          fco.removeKeystrokeHandler(cid_EditorPassword);
        },
      ),
      // targetGkF: ()=> fco.authIconGK,
      wrapInPointerInterceptor: true,
      targetGkF: () => gk,
    );
  }

  static final String cid_editablePageName = "user-editable-page-name";

  void showPageNameDialog() {
    fco.registerKeystrokeHandler(cid_editablePageName, (KeyEvent event) {
      if (event.logicalKey == LogicalKeyboardKey.escape) {
        fco.dismiss(cid_editablePageName);
      }
      return false;
    });
    fco.showOverlay(
      calloutContent: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          fco.purpleText(
            fco.canEditContent()
                ? 'Create an editable Page'
                : 'Create your own editable Page',
            fontSize: 24,
            family: 'Merriweather',
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            width: 480,
            height: 100,
            child: StringOrNumberEditor(
              inputType: String,
              prompt: () => 'Page name',
              originalS: '',
              onTextChangedF: (String s) async {},
              onEscapedF: (_) {
                fco.dismiss(cid_editablePageName);
              },
              dontAutoFocus: false,
              onEditingCompleteF: (s) async {
                String pageName = s.replaceAll(' ', '-').toLowerCase();
                pageName = pageName.startsWith('/') ? pageName : '/$pageName';
                // add to appInfo
                if (!fco.canEditContent() &&
                    !fco.appInfo.anonymousUserEditablePages.contains(
                      pageName,
                    )) {
                  // jsArray issue
                  List<String> newList = fco.appInfo.anonymousUserEditablePages
                      .toList();
                  newList.add(pageName);
                  fco.appInfo.anonymousUserEditablePages = newList;
                  await fco.modelRepo.saveAppInfo();
                  fco.afterNextBuildDo(() {
                    fco.dismiss(cid_editablePageName);
                    fco.addSubRoute(newPath: pageName);
                    fco.afterMsDelayDo(1000, () {
                      fco.router?.go(pageName);
                    });
                  });
                } else if (fco.canEditContent() &&
                    !fco.appInfo.snippetNames.contains(pageName)) {
                  // fco.dismiss('exit-editMode');
                  // bool userCanEdit = canEditContent.isTrue;
                  final snippetName = pageName;
                  // final rootNode = SnippetTemplateEnum.empty.clone()
                  //   ..name = snippetName;
                  // SnippetRootNode.loadSnippetFromCacheOrFromFBOrCreateFromTemplate(
                  //   snippetName: snippetName,
                  //   templateSnippetRootNode: rootNode,
                  // ).then((_) {
                  //   fco.dismiss(cid_editablePageName);
                  //   fco.addSubRoute(
                  //     newPath: snippetName,
                  //     template: rootNode,
                  //   );
                  //   fco.router.go(pageName);
                  // });
                  fco.dismiss(cid_editablePageName);
                  fco.addSubRoute(newPath: snippetName);
                  fco.afterMsDelayDo(1000, () {
                    fco.router?.go(pageName);
                  });
                } else {
                  if (context.mounted) {
                    context.go(pageName);
                  }
                }
                return;
              },
            ),
          ),
        ],
      ),
      calloutConfig: CalloutConfig(
        cId: cid_editablePageName,
        // initialTargetAlignment: Alignment.bottomLeft,
        // initialCalloutAlignment: Alignment.topRight,
        // finalSeparation: 200,
        barrier: CalloutBarrierConfig(
          opacity: .5,
          onTappedF: () async {
            fco.dismiss(cid_editablePageName);
          },
        ),
        initialCalloutW: 500,
        initialCalloutH: 180,
        decorationBorderRadius: 12,
        decorationFillColors: ColorOrGradient.color(Colors.white),
        scrollControllerName: widget.routePath,
        onDismissedF: () {
          fco.removeKeystrokeHandler(cid_editablePageName);
        },
      ),
      // targetGkF: ()=> fco.authIconGK,
    );
  }

  void revertToVersion(VersionId? versionId,
      SnippetInfoModel snippetInfo,
      CAPIState state,) {
    if (versionId == null) return;
    fco.capiBloc.add(
      CAPIEvent.revertSnippet(
        snippetName: snippetInfo.name,
        versionId: fco.removeNonNumeric(versionId),
      ),
    );
    fco.afterNextBuildDo(() async {
      // current snippet version will now be changed to prevId
      fco.logger.i('reverted to previous version.');
      // SNode.unhighlightSelectedNode();
      // var currPageState = fco.currentPageState;
      // currPageState?.unhideFAB();
      fco.dismiss(CalloutConfigToolbar.CID);
      fco.appInfo.hideClipboard();
      // exitEditModeF();
      // fco.capiBloc
      //     .add(const CAPIEvent.popSnippetEditor());
      // fco.dismiss(snippetName, skipOnDismiss: true);
      final revertedVersion = snippetInfo.currentVersionFromCache();
      if (revertedVersion != null) {
        final newTreeC = SnippetTreeController(
          roots: [revertedVersion],
          childrenProvider: SNode.childrenProvider,
          parentProvider: SNode.parentProvider,
        );

        newTreeC.roots.first.validateTree();
        newTreeC.expand(revertedVersion);
        newTreeC.rebuild();

        fco.snippetBeingEdited!
          ..setRootNode(revertedVersion)
          ..selectedNode = revertedVersion.child
          ..showProperties = false
          ..treeC = newTreeC;

        fco.refreshAll();
      }
      return;
    });
  }
}

class SelectionCutoutPainter extends CustomPainter {
  final Rect cutoutRect;

  SelectionCutoutPainter({required this.cutoutRect});

  @override
  void paint(Canvas canvas, Size size) {
    // 1. Create the background paint
    final backgroundPaint = Paint()
      ..color = Colors.black
          .withValues(alpha: 0.6) // Semi-transparent black
      ..style = PaintingStyle.fill;

    // 2. Create the cutout path
    final cutoutPath = Path()
      ..addRect(cutoutRect);

    // 3. Create the full canvas path
    final fullCanvasPath = Path()
      ..addRect(Offset.zero & size);

    // 4. Combine the paths using difference
    final combinedPath = Path.combine(
      PathOperation.difference,
      fullCanvasPath,
      cutoutPath,
    );

    // 5. Draw the combined path
    canvas.drawPath(combinedPath, backgroundPaint);
    canvas.drawRect(
      cutoutRect,
      Paint()
        ..color = Colors
            .transparent // Semi-transparent black
        ..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is SelectionCutoutPainter &&
        oldDelegate.cutoutRect != cutoutRect;
  }
}

// First, define this helper class either in the same file or a utility file.
// This class overrides the default scroll physics for all descendant scrollables.
class _ForceNeverScrollableScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const NeverScrollableScrollPhysics();
}
