import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:multi_split_view/multi_split_view.dart';

class EditablePage extends StatefulWidget {
  final RoutePath routePath;
  final Widget child;

  const EditablePage({
    required this.routePath,
    required this.child,
    // this.dontShowLockIcon = false,
    required super.key, // provides access to state later - see initState and fco.pageGKs
  });

  static void refreshSelectedNodeWidgetBorderOverlay() {
    fco.dismiss(PINK_OVERLAY_NON_TAPPABLE);
    FlutterContentApp.selectedNode?.showNodeWidgetOverlay();
  }

  static void removeAllNodeWidgetOverlays() {
    // fco.logi('removeAllNodeWidgetOverlays - start');
    for (GlobalKey nodeWidgetGK in fco.gkSTreeNodeMap.keys) {
      fco.dismiss('${nodeWidgetGK.hashCode}-pink-overlay');
    }
    // fco.logi('removeAllNodeWidgetOverlays - ended');
    fco.showingNodeBoundaryOverlays = false;
  }

  // allow a page widget to find its parent EditablePage
  static EditablePageState? of(BuildContext context) =>
      context.findAncestorStateOfType<EditablePageState>();

  static String name(context) =>
      of(context)?.widget.routePath ?? 'no ancestor EditablePage!';

  static ScrollController? ancestorSc(BuildContext context, Axis axis) {
    ScrollableState? scrollableState = Scrollable.maybeOf(context, axis: axis);
    return scrollableState?.widget.controller;
  }

  @override
  State<EditablePage> createState() => EditablePageState();
}

class EditablePageState extends State<EditablePage> {
  late NamedScrollController sC;
  late MultiSplitViewController msvC;
  late ScrollControllerName scName;

  final focusNode = FocusNode();

  bool isFABVisible = true; // Tracks FAB visibility
  Offset? fabPosition;

  @override
  void initState() {
    super.initState();

    scName = EditablePage.name(context);
    sC = NamedScrollController(scName, Axis.vertical);

    msvC = MultiSplitViewController();

    fco.pageGKs[widget.routePath] = widget.key as GlobalKey;
    fco.currentEditablePagePath = widget.routePath;

    fco.afterNextBuildDo(() {
      setState(() {
        fabPosition = Offset(fco.scrW - 90, 10); // Initial position of the FAB
      });
    });
  }

  // @override
  // void dispose() {
  //   sC?.dispose();
  //   super.dispose();
  // }

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
      bool showEditorArea = state.snippetBeingEdited != null;
      bool showProperties = state.snippetBeingEdited?.showProperties ?? false;
      List<Area> areas = [];
      if (showEditorArea) {
        areas.add(_treeArea(state));
      }
      areas.add(Area(
        builder: (ctx, area) {
          return _pageContent(context);
        },
        flex: 2.5,
      ));
      if (showEditorArea ||
          (showProperties && FlutterContentApp.selectedNode?.pTreeC != null)) {
        areas.add(_propertiesArea());
      }
      msvC.areas = areas;
      return MultiSplitViewTheme(
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
                  ?.showNodeWidgetOverlay();
            });
          },
        ),
      );
    });
  }

  Area _treeArea(CAPIState state) => Area(
        builder: (ctx, area) {
          SnippetRootNode? rootNode =
              state.snippetBeingEdited?.treeC.roots.first as SnippetRootNode;
          SnippetName snippetName = rootNode.name;
          SnippetInfoModel? snippetInfo =
              SnippetInfoModel.cachedSnippet(snippetName);
          String title =
              FlutterContentApp.snippetBeingEdited?.getRootNode().name ??
                  'snippet name?';
          if (snippetInfo != null) {
            //state.snippetBeingEdited?.treeC.rebuild();
            return GestureDetector(
              onTap: () {
                FlutterContentApp.capiBloc
                    .add(CAPIEvent.clearNodeSelection(scName));
                fco.dismiss(PINK_OVERLAY_NON_TAPPABLE);
                fco.hide("floating-clipboard");
              },
              child: Column(
                children: [
                  Container(
                    color: Colors.purple.shade200,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Tooltip(
                          message:
                              'snippet: $title, versionId: ${snippetInfo.editingVersionId}'
                                  '${snippetInfo.editingVersionId != snippetInfo.publishedVersionId
                                  ? "\n\nSnippet name in RED indicates that this "
                                  "\nversion is not the PUBLISHED version"
                                  : ""}',
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Container(
                              margin: EdgeInsets.zero,
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                              ),
                              alignment: Alignment.center,
                              child: Material(color: Colors.transparent,
                                child: fco.coloredText(
                                  title,
                                  fontSize: 14.0,
                                  color: snippetInfo.editingVersionId != snippetInfo.publishedVersionId
                                      ? Colors.red
                                      : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              hoverColor: Colors.white30,
                              onPressed: () async {
                                if (!snippetInfo.isFirstVersion()) {
                                  VersionId? prevId =
                                      snippetInfo.previousVersionId();
                                  revertToVersion(prevId, snippetInfo, state);
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
                                if (!snippetInfo.isLatestVersion()) {
                                  VersionId? nextId =
                                      snippetInfo.nextVersionId();
                                  revertToVersion(nextId, snippetInfo, state);
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
                              icon:
                                  VersionsMenuAnchor(snippetInfo: snippetInfo),
                              tooltip: 'version...',
                            ),
                            IconButton(
                              onPressed: () {
                                STreeNode.unhighlightSelectedNode();
                                var pinkOverlayFeature =
                                    PINK_OVERLAY_NON_TAPPABLE;
                                fco.dismiss(pinkOverlayFeature);
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
                    child: SnippetTreePane(snippetInfo, null),
                  ),
                ],
              ),
            );
          }
          return const Offstage();
        },
        flex: 1,
      );

  Area _propertiesArea() => Area(
        builder: (ctx, area) {
          FlutterContentApp.selectedNode?.pTreeC(context).expandAll();
          return !FlutterContentApp.aNodeIsSelected
              ? const Offstage()
              : Container(
                  color: Colors.purple.shade50,
                  child: ListView(
                    controller:
                        FlutterContentApp.selectedNode!.propertiesPaneSC(),
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
                      if (FlutterContentApp.selectedNode!
                          .pTreeC(context)
                          .roots
                          .isEmpty)
                        Material(
                          color: Colors.purpleAccent[50],
                          child: fco.coloredText(' (${FlutterContentApp.selectedNode.toString()} has no properties)',
                              color: Colors.white),
                        ),
                      Material(
                          color: Colors.purpleAccent[50],
                          child: PropertiesTreeView(
                            treeC: FlutterContentApp.selectedNode!.pTreeC(context),
                          )),
                      // Container(color: Colors.purpleAccent[100], width: double.infinity, height: 1000),
                    ],
                  ),
                );
        },
        flex: 1,
      );

  Widget _pageContent(BuildContext context) {
    // FCO.initWithContext(context);

    Widget builtWidget = NotificationListener<SizeChangedLayoutNotification>(
      onNotification: (SizeChangedLayoutNotification notification) {
        fco.logi("FlutterContentApp SizeChangedLayoutNotification}");
        fco.dismissAll(exceptFeatures: ["FAB"]);
        fco.afterMsDelayDo(300, () {
          // FCO.refreshMQ(context);
          if (fco.showingNodeBoundaryOverlays ?? false) {
            EditablePage.removeAllNodeWidgetOverlays();
            showAllNodeWidgetOverlays();
          }
        });
        return true;
      },
      child: SizeChangedLayoutNotifier(
        child: KeyboardListener(
          autofocus: true,
          focusNode: focusNode, // <-- more magic
          onKeyEvent: (KeyEvent event) {
            bool isEsc = event.logicalKey == LogicalKeyboardKey.escape;
            if (fco.inEditMode.value && isEsc) {
              // exitEditMode();
              fco.inEditMode.value = false;
            }
            // _enterOrExitEditMode(event, lastTapTime, tapCount);
          },
          child: GestureDetector(
            onTap: () {
              // exitEditMode();
              fco.inEditMode.value = false;
            },
            child: Material(
              child: Stack(
                children: [
                  Zoomer(
                    child: BlocBuilder<CAPIBloC, CAPIState>(
                        builder: (blocContext, state) {
                      return widget.child;
                    }),
                  ),
                ],
              ),
            ),
            // ),
          ),
        ),
      ),
    );

    return fco.isAndroid
        ? fco.androidAwareBuild(context, builtWidget)
        : builtWidget;
  }

  // only called with MaterialAppWrapper context
  void showAllNodeWidgetOverlays() {
    // fco.logi('showAllNodeWidgetOverlays...');
    // if currently configuring a target, only show for the current target's snippet
    // bool configuringATarget = fco.anyPresent([CalloutConfigToolbar.CALLOUT_CONFIG_TOOLBAR]);

    void traverseAndMeasure(BuildContext el, bool overlayWithABarrier) {
      // fco.logi('traverseAndMeasure(${el.toString()})');

      if ((fco.gkSTreeNodeMap.containsKey(el.widget.key))) {
        // || (el.widget.key != null && gkSTreeNodeMap[el.widget.key]?.rootNodeOfSnippet() == FCO.targetSnippetBeingConfigured)) {
        GlobalKey gk = el.widget.key as GlobalKey;
        STreeNode? node = fco.gkSTreeNodeMap[gk];
        // fco.logi("traverseAndMeasure: ${node.toString()}");
        if (node != null && node.canShowTappableNodeWidgetOverlay) {
          // if (node.rootNodeOfSnippet() == FCO.targetSnippetBeingConfigured) {
          // fco.logi("targetSnippetBeingConfigured: ${node.toString()}");
          // }
          // fco.logi('Rect? r = gk.globalPaintBounds...');
// measure node
          Rect? r = gk.globalPaintBounds(
              skipWidthConstraintWarning: true,
              skipHeightConstraintWarning: true);
          // if (node is PlaceholderNode) {
          //   fco.logi('PlaceholderNode');
          // }
          if (r != null) {
            // node.measuredRect = Rect.fromLTWH(r.left, r.top, r.width, r.height);
            r = fco.restrictRectToScreen(r);
            // fco.logi("========>  r restricted to ${r.toString()}");
            // fco.logi('${node.runtimeType.toString()} - size: (${r != null ? r.size.toString() : ""})');
            // node.setParent(parent);
            // parent = node;
            // fco.logi('_showNodeWidgetOverlay...');
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
    // fco.logi('traverseAndMeasure(context) finished.');
  }

  void editorPasswordDialog() {
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
              onTextChangedF: (s) async {
                if (s == (kDebugMode ? " " : fco.editorPassword)) {
                  fco.dismiss("EditorPassword");
                  fco.setCanEditContent(true);
                  // await FC.loadLatestSnippetMap();
                  // FlutterContentApp.capiBloc.add(const CAPIEvent.hideAllTargetGroupsAndBtns());
                  // fco.afterNextBuildDo(() {
                  //   FC()
                  //       .capiBloc
                  //       .add(const CAPIEvent.unhideAllTargetGroupsAndBtns());
                  //   showDevToolsFAB();
                  // });
                  // fco.dismiss("EditorPassword");
                  FlutterContentApp.capiBloc.add(
                      const CAPIEvent.forceRefresh(onlyTargetsWrappers: true));
                }
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
        cId: "EditorPassword",
        initialTargetAlignment: Alignment.topRight,
        initialCalloutAlignment: Alignment.bottomLeft,
        finalSeparation: 150,
        barrier: CalloutBarrier(
          opacity: .5,
          onTappedF: () async {
            fco.dismiss("EditorPassword");
          },
        ),
        initialCalloutW: 240,
        initialCalloutH: 150,
        borderRadius: 12,
        fillColor: Colors.white,
        scrollControllerName: sC.name,
      ),
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
      fco.logi('reverted to previous version.');
      STreeNode.unhighlightSelectedNode();
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

        state.snippetBeingEdited!
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
