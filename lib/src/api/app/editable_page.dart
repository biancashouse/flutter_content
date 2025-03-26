import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/api/snippet_panel/snippet_properties_tree_view.dart';
import 'package:flutter_content/src/api/snippet_panel/snippet_tree_pane.dart';
import 'package:flutter_content/src/api/snippet_panel/versions_menu_anchor.dart';
import 'package:flutter_content/src/bloc/snippet_being_edited.dart';
import 'package:multi_split_view/multi_split_view.dart';

class EditablePage extends StatefulWidget {
  final RoutePath routePath;
  final Widget child;
  final bool provideNamedScrollController;

  const EditablePage({
    required this.routePath,
    required this.child,
    this.provideNamedScrollController = false,
    // this.dontShowLockIcon = false,
    required super.key, // provides access to state later - see initState and fco.pageGKs
  });

  static void refreshSelectedNodeWidgetBorderOverlay(scName) {
    fco.dismiss(PINK_OVERLAY_NON_TAPPABLE);
    FlutterContentApp.selectedNode
        ?.showNodeWidgetOverlay(scName: scName, followScroll: false);
  }

  static void removeAllNodeWidgetOverlays() {
    // fco.logger.i('removeAllNodeWidgetOverlays - start');
    for (GlobalKey nodeWidgetGK in fco.nodesByGK.keys) {
      fco.dismiss('${nodeWidgetGK.hashCode}-pink-overlay');
    }
    // fco.logger.i('removeAllNodeWidgetOverlays - ended');
    fco.showingNodeBoundaryOverlays = false;
  }

  // allow a page widget to find its parent EditablePage
  static EditablePageState? of(BuildContext context) => context.mounted
      ? context.findAncestorStateOfType<EditablePageState>()
      : null;

  static String? scName(context) => of(context)?.namedSC?.name;

  // static ScrollController? ancestorSc(BuildContext context, Axis? axis) {
  //   ScrollableState? scrollableState = Scrollable.maybeOf(context, axis: axis);
  //   return scrollableState?.widget.controller;
  // }

  @override
  State<EditablePage> createState() => EditablePageState();
}

class EditablePageState extends State<EditablePage> {
  late MultiSplitViewController msvC;
  late NamedScrollController? namedSC;

  SnippetBeingEdited? get snippetBeingEdited =>
      FlutterContentApp.snippetBeingEdited;

  SNode? get selectedNode => FlutterContentApp.selectedNode;

  bool isFABVisible = true; // Tracks FAB visibility
  Offset? fabPosition;

  @override
  void initState() {
    super.initState();

    msvC = MultiSplitViewController();
    namedSC = NamedScrollController(widget.routePath, Axis.vertical);

    // fco.pageGKs[widget.routePath] = widget.key as GlobalKey;
    fco.currentEditablePagePath = widget.routePath;

    fco.afterNextBuildDo(() {
      setState(() {
        fabPosition = Offset(fco.scrW - 90, 10); // Initial position of the FAB
      });
    });
  }

  // ScrollControllerName? scName(ctx) => EditablePage.name(ctx);
  //
  // NamedScrollController? sC(ctx) => scName(ctx) != null
  //   ? NamedScrollController(scName(ctx)!, Axis.vertical)
  //   : null;

  @override
  void dispose() {
    if (!mounted) return;
    namedSC?.dispose(); // Dispose of the ScrollController
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    /// initialize the Callouts API with the root context
    fco.initWithContext(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CAPIBloC, CAPIState>(
        // buildWhen: (previous, current) {
        //   bool  nodeChanged = current.snippetBeingEdited != previous.snippetBeingEdited;
        //   bool selectionChanged = current.snippetBeingEdited?.selectedNode !=
        //       previous.snippetBeingEdited?.selectedNode;
        //   return true || nodeChanged || selectionChanged;
        // },
        builder: (context, state) {
      // fco.logger.i('editable page build() -----------------------------------');
      bool showNodeTree() => snippetBeingEdited != null;
      bool showPropertiesTree() =>
          showNodeTree() && selectedNode?.pTreeC != null;

      // set up areas
      List<Area> areas = [];
      if (showNodeTree()) {
        areas.add(
          Area(
            builder: (ctx, area) => _nodeTree(),
            flex: 1,
          ),
        );
      }
      areas.add(Area(
        builder: (ctx, area) {
          return _pageContentArea();
        },
        flex: 2,
      ));

      msvC.areas = areas;

      var msvt = MultiSplitViewTheme(
        data: MultiSplitViewThemeData(
          dividerThickness: 24,
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
            EditablePage.removeAllNodeWidgetOverlays();
          },
          onDividerDragEnd: (_) {
            fco.afterMsDelayDo(500, () {
              FlutterContentApp.snippetBeingEdited?.selectedNode
                  ?.showNodeWidgetOverlay(
                      scName: widget.routePath, followScroll: true);
            });
          },
        ),
      );

      return Center(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: msvt),
            if (showPropertiesTree())
              Container(
                width: 320,
                color: Colors.purpleAccent[100],
                child: _propertiesTree(),
              )
          ],
        ),
      );
    });
  }

  Widget _pageContentArea() {
    // FCO.initWithContext(context);

    GlobalKey zoomerGk = GlobalKey();

    bool aSnippetIsBeingEdited = FlutterContentApp.snippetBeingEdited != null;

    Widget builtWidget = NotificationListener<SizeChangedLayoutNotification>(
      onNotification: (SizeChangedLayoutNotification notification) {
        // fco.logger.i("FlutterContentApp SizeChangedLayoutNotification}");
        fco.dismissAll(exceptFeatures: ["FAB"]);
        fco.afterMsDelayDo(300, () {
          // FCO.refreshMQ(context);
          if (fco.showingNodeBoundaryOverlays ?? false) {
            EditablePage.removeAllNodeWidgetOverlays();
            // show a barrier for any parts of page not being edited
            showAllNodeWidgetOverlays();
            fco.afterNextBuildDo(() {});
          }
        });
        return true;
      },
      child: SizeChangedLayoutNotifier(
        child: GestureDetector(
          onTap: () {
            // exitEditMode();
            fco.inEditMode.value = false;
          },
          child: Material(
            child: Stack(
              children: [
                if (aSnippetIsBeingEdited) widget.child,
                if (!aSnippetIsBeingEdited)
                  Zoomer(
                    key: zoomerGk,
                    child: widget.child,
                    // child: BlocBuilder<CAPIBloC, CAPIState>(
                    //     builder: (blocContext, state) {
                    //   return widget.child;
                    // }),
                  ),
                // Builder(
                //   builder: (context) {
                //     Widget? cutout;
                //     if (capiState.cutoutRect != null) {
                //       cutout = CustomPaint(
                //         foregroundPainter: CutoutPainter(
                //           cutoutRect: capiState.cutoutRect!,
                //         ),
                //         size: Size.infinite,
                //       );
                //     }
                //     return cutout ?? const Offstage();
                //   },
                // ),
              ],
            ),
          ),
          // ),
        ),
      ),
    );

    return fco.isAndroid
        ? fco.androidAwareBuild(context, builtWidget)
        : builtWidget;
  }

  Widget _nodeTree() {
    SNode? rootNode = snippetBeingEdited?.treeC.roots.first.rootNodeOfSnippet();
    if (rootNode is SnippetRootNode) {
      SnippetName snippetName = rootNode.name;
      SnippetInfoModel? snippetInfo =
          SnippetInfoModel.cachedSnippet(snippetName);
      if (snippetInfo != null) {
        String title =
            FlutterContentApp.snippetBeingEdited?.getRootNode().name ??
                'snippet name?';
        //snippetBeingEdited?.treeC.rebuild();
        return GestureDetector(
          onTap: () {
            FlutterContentApp.capiBloc.add(CAPIEvent.clearNodeSelection());
            fco.dismiss(PINK_OVERLAY_NON_TAPPABLE);
            fco.hide("floating-clipboard");
          },
          child: Column(
            children: [
              Container(
                color: Colors.purple,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Spacer(),
                    // Tooltip(
                    //   message:
                    //       'snippet: $title, versionId: ${snippetInfo.editingVersionId}'
                    //       '${snippetInfo.editingVersionId != snippetInfo.publishedVersionId ? "\n\nSnippet name in RED indicates that this "
                    //           "\nversion is not the PUBLISHED version" : ""}',
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(left: 10.0),
                    //     child: Container(
                    //       margin: EdgeInsets.zero,
                    //       padding: const EdgeInsets.symmetric(
                    //           horizontal: 8, vertical: 4),
                    //       decoration: BoxDecoration(
                    //         color: Colors.black,
                    //         borderRadius: BorderRadius.all(Radius.circular(30)),
                    //       ),
                    //       alignment: Alignment.center,
                    //       child: Material(
                    //         color: Colors.transparent,
                    //         child: fco.coloredText(
                    //           title,
                    //           fontSize: 14.0,
                    //           color: snippetInfo.editingVersionId !=
                    //                   snippetInfo.publishedVersionId
                    //               ? Colors.red
                    //               : Colors.grey,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Row(
                      children: [
                        IconButton(
                          hoverColor: Colors.white30,
                          onPressed: () async {
                            CAPIState capiState = FlutterContentApp.capiState;
                            if (!snippetInfo.isFirstVersion()) {
                              VersionId? prevId =
                                  snippetInfo.previousVersionId();
                              revertToVersion(prevId, snippetInfo, capiState);
                            }
                          },
                          icon: Icon(Icons.undo,
                              color: !snippetInfo
                                      .isFirstVersion() //|| FlutterContentApp.capiBloc.canUndo
                                  ? Colors.white
                                  : Colors.white54),
                          tooltip: 'previous version',
                        ),
                        IconButton(
                          hoverColor: Colors.white30,
                          onPressed: () {
                            CAPIState capiState = FlutterContentApp.capiState;
                            if (!snippetInfo.isLatestVersion()) {
                              VersionId? nextId = snippetInfo.nextVersionId();
                              revertToVersion(nextId, snippetInfo, capiState);
                            }
                          },
                          icon: Icon(Icons.redo,
                              color: !snippetInfo
                                      .isLatestVersion() //|| FlutterContentApp.capiBloc.canRedo
                                  ? Colors.white
                                  : Colors.white54),
                          tooltip: 'next version',
                        ),
                        IconButton(
                          hoverColor: Colors.white30,
                          onPressed: () async {},
                          icon: VersionsMenuAnchor(snippetInfo: snippetInfo),
                          tooltip: 'version...',
                        ),
                        IconButton(
                          onPressed: () {
                            SNode.unhighlightSelectedNode();
                            var pinkOverlayFeature = PINK_OVERLAY_NON_TAPPABLE;
                            fco.dismiss(pinkOverlayFeature);
                            // fco.dismissAll(exceptFeatures: [CalloutConfigToolbar.CID]);
                            fco.unhide(CalloutConfigToolbar.CID);
                            fco.hideClipboard();
                            fco.inEditMode.value = false;
                            FlutterContentApp.capiBloc
                                .add(const CAPIEvent.popSnippetEditor());
                            // fco.afterNextBuildDo(() {
                            //   NamedScrollController.restoreOffset(scName);
                            // });
                          },
                          icon: Icon(Icons.close),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                // child: Offstage()
                child: SnippetTreePane(snippetInfo, widget.routePath),
              ),
            ],
          ),
        );
      }
      return const Offstage();
    } else {
      return const Offstage();
    }
  }

  Widget _propertiesTree() {
    bool showingProperties = FlutterContentApp.aNodeIsSelected;
    ScrollController? propertiesPaneSC = selectedNode?.propertiesPaneSC();
    // selectedNode?.pTreeC(context).expandAll();
    return !showingProperties || propertiesPaneSC == null
        ? const Offstage()
        : Container(
            color: Colors.blue[50],
            child: ListView(
              controller: selectedNode!.propertiesPaneSC(),
              shrinkWrap: true,
              children: [
                // icon buttons
                // ExpansionTile(
                //   title: fco.coloredText('widget actions',
                //       color: Colors.white54,
                //       fontSize: 14),
                //   backgroundColor: Colors.black,
                //   collapsedBackgroundColor: Colors.black,
                //   onExpansionChanged: (bool isExpanded) =>
                //       fco.showingNodeButtons = isExpanded,
                //   initiallyExpanded:
                //       fco.showingNodeButtons,
                //   children: [nodeButtons(context, scName)],
                // ),
                // NODE PROPERTIES TREE
                if ((selectedNode?.pTreeC(context).roots.isEmpty) ?? false)
                  Material(
                    // color: Colors.purpleAccent[50],
                    child: fco.coloredText(
                        ' (${selectedNode.toString()} has no properties)',
                        color: Colors.black87),
                  ),
                Material(
                  color: Colors.blue[50],
                  child: PropertiesTreeView(
                      treeC: FlutterContentApp.selectedNode!.pTreeC(context),
                      sNode: FlutterContentApp.selectedNode!),
                ),
                // Container(color: Colors.purpleAccent[100], width: double.infinity, height: 1000),
              ],
            ),
          );
  }

  // void showCutoutOverlay({
  //   ScrollControllerName? scName,
  // }) {
  //   fco.dismiss(CUTOUT_OVERLAY_NON_TAPPABLE);
  //   Rect? r = nodeWidgetGK?.globalPaintBounds(
  //     skipWidthConstraintWarning: true,
  //     skipHeightConstraintWarning: true,
  //   );
  //   if (r != null) {
  //     Rect borderRect = r; //_borderRect(r);
  //     CalloutConfig cc = _cc(
  //       cId: CUTOUT_OVERLAY_NON_TAPPABLE,
  //       borderRect: borderRect,
  //       scName: scName,
  //     );
  //     Widget cutout = CustomPaint(foregroundPainter: CutoutPainter(cutoutRect:
  //     Rect.fromLTWH(0, 0, cc.calloutW!, cc.calloutH!)
  //     ));
  //     fco.showOverlay(
  //       ensureLowestOverlay: true,
  //       calloutContent: cutout,
  //       calloutConfig: cc,
  //       targetGkF: () => nodeWidgetGK,
  //     );
  //   }
  // }

  // only called with MaterialAppWrapper context
  void showAllNodeWidgetOverlays() {
    // fco.logger.i('showAllNodeWidgetOverlays...');
    // if currently configuring a target, only show for the current target's snippet
    // bool configuringATarget = fco.anyPresent([CalloutConfigToolbar.CALLOUT_CONFIG_TOOLBAR]);

    void traverseAndMeasure(BuildContext el, bool overlayWithABarrier) {
      // fco.logger.i('traverseAndMeasure(${el.toString()})');

      if ((fco.nodesByGK.containsKey(el.widget.key))) {
        // || (el.widget.key != null && gkSTreeNodeMap[el.widget.key]?.rootNodeOfSnippet() == FCO.targetSnippetBeingConfigured)) {
        GlobalKey gk = el.widget.key as GlobalKey;
        SNode? node = fco.nodesByGK[gk];
        // fco.logger.i("traverseAndMeasure: ${node.toString()}");
        if (node != null && node.canShowTappableNodeWidgetOverlay) {
          // if (node.rootNodeOfSnippet() == FCO.targetSnippetBeingConfigured) {
          // fco.logger.i("targetSnippetBeingConfigured: ${node.toString()}");
          // }
          // fco.logger.i('Rect? r = gk.globalPaintBounds...');
// measure node
          Rect? r = gk.globalPaintBounds(
              skipWidthConstraintWarning: true,
              skipHeightConstraintWarning: true);
          // if (node is PlaceholderNode) {
          //   fco.logger.i('PlaceholderNode');
          // }
          if (r != null) {
            // node.measuredRect = Rect.fromLTWH(r.left, r.top, r.width, r.height);
            r = fco.restrictRectToScreen(r);
            // fco.logger.i("========>  r restricted to ${r.toString()}");
            // fco.logger.i('${node.runtimeType.toString()} - size: (${r != null ? r.size.toString() : ""})');
            // node.setParent(parent);
            // parent = node;
            // fco.logger.i('_showNodeWidgetOverlay...');
            // removeAllNodeWidgetOverlays();
            // pass possible ancestor scrollcontroller to overlay
            node.showTappableNodeWidgetOverlay(
              whiteBarrier: overlayWithABarrier,
              scName: widget.routePath,
            );
          }
        }
      }
      el.visitChildElements((innerEl) {
        traverseAndMeasure(innerEl, false);
      });
    }

    var pageContext = context;
    traverseAndMeasure(pageContext, true);
    fco.showingNodeBoundaryOverlays = true;
    // fco.logger.i('traverseAndMeasure(context) finished.');
  }

  void editorPasswordDialog() {
    fco.registerKeystrokeHandler('editor-password', (KeyEvent event) {
      final key = event.logicalKey.keyLabel;

      // if (event is KeyDownEvent) {
      //   print("Key down: $key");
      // } else if (event is KeyUpEvent) {
      //   print("Key up: $key");
      // } else if (event is KeyRepeatEvent) {
      //   print("Key repeat: $key");
      // }

      if (event.logicalKey == LogicalKeyboardKey.escape) {
        fco.dismiss("editor-password");
      }

      return false;
    });
    fco.showOverlay(
      calloutContent: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          fco.purpleText("Editor Access", fontSize: 24, family: 'Merriweather'),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            width: 240,
            height: 100,
            child: StringEditor_T(
              inputType: String,
              prompt: () => 'password',
              originalS: '',
              onTextChangedF: (String s) async {
                if (kDebugMode && s != " ") return;
                if (!kDebugMode && !(fco.editorPasswords.contains(s))) return;
                fco.dismiss("editor-password");
                fco.setCanEditContent(true);
                // await FC.loadLatestSnippetMap();
                // FlutterContentApp.capiBloc.add(const CAPIEvent.hideAllTargetGroupsAndBtns());
                // fco.afterNextBuildDo(() {
                //   FC()
                //       .capiBloc
                //       .add(const CAPIEvent.unhideAllTargetGroupsAndBtns());
                //   showDevToolsFAB();
                // });
                // fco.dismiss("editor-password");
                FlutterContentApp.capiBloc.add(
                    const CAPIEvent.forceRefresh(onlyTargetsWrappers: true));
              },
              onEscapedF: (_) {
                fco.dismiss("editor-password");
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
          ),
        ],
      ),
      calloutConfig: CalloutConfig(
          cId: "editor-password",
          initialTargetAlignment: Alignment.bottomLeft,
          initialCalloutAlignment: Alignment.topRight,
          finalSeparation: 200,
          barrier: CalloutBarrierConfig(
            opacity: .5,
            onTappedF: () async {
              fco.dismiss("editor-password");
            },
          ),
          initialCalloutW: 240,
          initialCalloutH: 150,
          borderRadius: 12,
          arrowType: ArrowType.THIN_REVERSED,
          fillColor: Colors.white,
          scrollControllerName: widget.routePath,
          onDismissedF: () {
            fco.removeKeystrokeHandler('editor-password');
          }),
      targetGkF: ()=> fco.signinIconGK,
    );
  }

  void revertToVersion(
      VersionId? versionId, SnippetInfoModel snippetInfo, CAPIState state) {
    if (versionId == null) return;
    FlutterContentApp.capiBloc.add(
      CAPIEvent.revertSnippet(
        snippetName: snippetInfo.name,
        versionId: fco.removeNonNumeric(versionId),
      ),
    );
    fco.afterNextBuildDo(() async {
      // current snippet version will now be changed to prevId
      fco.logger.i('reverted to previous version.');
      SNode.unhighlightSelectedNode();
      // var currPageState = fco.currentPageState;
      // currPageState?.unhideFAB();
      fco.dismiss(PINK_OVERLAY_NON_TAPPABLE);
      fco.dismiss(CalloutConfigToolbar.CID);
      fco.hideClipboard();
      // exitEditModeF();
      // FlutterContentApp.capiBloc
      //     .add(const CAPIEvent.popSnippetEditor());
      // fco.dismiss(snippetName, skipOnDismiss: true);
      final revertedVersion = snippetInfo.currentVersionFromCache();
      if (revertedVersion != null) {
        final newTreeC = SnippetTreeController(
          roots: [revertedVersion],
          childrenProvider: Node.snippetTreeChildrenProvider,
          parentProvider: Node.snippetTreeParentProvider,
        );

        newTreeC.roots.first.validateTree();
        newTreeC.expand(revertedVersion);
        newTreeC.rebuild();

        snippetBeingEdited!
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
