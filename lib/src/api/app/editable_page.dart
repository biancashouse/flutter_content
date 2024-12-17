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
    fco.dismiss('pink-border-overlay-non-tappable');
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

  final focusNode = FocusNode();

  bool isFABVisible = true; // Tracks FAB visibility
  Offset? fabPosition;

  @override
  void initState() {
    super.initState();

    var scName = EditablePage.name(context);
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
        buildWhen: (previous, current) =>
            current.snippetBeingEdited != previous.snippetBeingEdited,
        builder: (context, state) {
          bool showEditorArea = state.snippetBeingEdited != null;
          List<Area> areas = [];
          if (showEditorArea) {
            areas.add(Area(
              builder: (ctx, area) {
                SnippetRootNode? rootNode = state
                    .snippetBeingEdited?.treeC.roots.first as SnippetRootNode;
                SnippetName snippetName = rootNode.name;
                SnippetInfoModel? snippetInfo =
                    SnippetInfoModel.cachedSnippet(snippetName);
                if (snippetInfo != null) {
                  //state.snippetBeingEdited?.treeC.rebuild();
                  return GestureDetector(
                    onTap: () {
                      FlutterContentApp.capiBloc
                          .add(const CAPIEvent.clearNodeSelection());
                      fco.hide("floating-clipboard");
                    },
                    child: Stack(
                      children: [
                        SnippetTreePane(snippetInfo, null),
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                              onPressed: () {
                                STreeNode.unhighlightSelectedNode();
                                var pinkOverlayFeature =
                                    'pink-border-overlay-non-tappable';
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
                              icon: Icon(Icons.close)),
                        )
                      ],
                    ),
                  );
                }
                return const Offstage();
              },
              flex: 1,
            ));
          }
          areas.add(Area(
            builder: (ctx, area) {
              return _build(context);
            },
            flex: 4,
          ));
          msvC.areas = areas;
          return MultiSplitViewTheme(
            data: MultiSplitViewThemeData(
              dividerThickness: 24,
              dividerPainter: DividerPainters.grooved1(
                backgroundColor: Colors.grey[700],
                color: Colors.indigo[100]!,
                highlightedColor: Colors.indigo[900]!,
              ),
            ),
            child: MultiSplitView(
              controller: msvC,
              axis: Axis.horizontal,
              initialAreas: areas,
              onDividerDragStart: (_){
                EditablePage.removeAllNodeWidgetOverlays();
              },
              onDividerDragEnd: (_){
                fco.afterMsDelayDo(500, (){
                  FlutterContentApp.snippetBeingEdited?.selectedNode?.showNodeWidgetOverlay();
                });

              },
            ),
          );
        });
  }

  Widget _build(BuildContext context) {
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
}

extension MultiSplitViewControllerX on MultiSplitViewController {}
