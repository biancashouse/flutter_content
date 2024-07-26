import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_callouts/flutter_callouts.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_event.dart';
import 'package:flutter_content/src/snippet/snodes/hotspots/widgets/config_toolbar/callout_config_toolbar.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

class EditablePage extends StatefulWidget {
  final String? routePath;
  final WidgetBuilder builder;

  const EditablePage({
    this.routePath,
    required this.builder,
    required super.key, // provides access to state later
  });

  static void refreshSelectedNodeWidgetBorderOverlay() {
    Callout.dismiss('pink-border-overlay-non-tappable');
    FlutterContentApp.selectedNode?.showNodeWidgetOverlay();
  }

  @override
  State<EditablePage> createState() => EditablePageState();
}

class EditablePageState extends State<EditablePage> {
  final focusNode = FocusNode();
  final GlobalKey _lockIconGK = GlobalKey();
  final ScrollController hSc = ScrollController();
  final ScrollController vSc = ScrollController();

  bool isFABVisible = true; // Tracks FAB visibility
  Offset? fabPosition;

  void unhideFAB() {
    setState(() {
      isFABVisible = true; // Toggle FAB visibility
    });
  }

  void hideFAB() {
    setState(() {
      isFABVisible = false; // Toggle FAB visibility
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.routePath != null) {
      fco.pageGKs[widget.routePath!] = widget.key as GlobalKey;
    }
    fco.afterNextBuildDo(() {
      setState(() {
        fabPosition = Offset(20, fco.scrH - 90); // Initial position of the FAB
      });
    });
  }

  @override
  void didChangeDependencies() {
    /// initialize the Callouts API with the root context
    fco.initWithContext(context);
    super.didChangeDependencies();
  }

  //will go null after user tap bianca
  @override
  Widget build(BuildContext context) {
    // FCO.initWithContext(context);

    Widget builtWidget = NotificationListener<SizeChangedLayoutNotification>(
      onNotification: (SizeChangedLayoutNotification notification) {
        debugPrint("FlutterContentApp SizeChangedLayoutNotification}");
        Callout.dismissAll(exceptFeatures: ["FAB"]);
        fco.afterMsDelayDo(300, () {
          // FCO.refreshMQ(context);
          if (fco.showingNodeBoundaryOverlays ?? false) {
            removeAllNodeWidgetOverlays();
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
                exitEditMode();
              }
              // _enterOrExitEditMode(event, lastTapTime, tapCount);
            },
            child: GestureDetector(
              onTap: () {
                exitEditMode();
              },
              child: Material(
                child: Stack(
                  children: [
                    Zoomer(
                      child: widget.builder(context),
                    ),
                    if (fabPosition != null && isFABVisible)
                      Positioned(
                        left: fabPosition!.dx,
                        top: fabPosition!.dy,
                        child: Draggable(
                          feedback: FAB(),
                          child: FAB(),
                          //isFABVisible ? FAB() : const Offstage(), // Hide FAB when isFABVisible is false
                          onDragEnd: (details) {
                            setState(() {
                              fabPosition = details
                                  .offset; // Update FAB position when dragged
                            });
                          },
                        ),
                      ),
                  ],
                ),
              ),
            )),
      ),
    );

    return fco.isAndroid
        ? fco.androidAwareBuild(context, builtWidget)
        : builtWidget;
  }

  Widget FAB() => Container(
        decoration: BoxDecoration(
          color: !fco.canEditContent ? Colors.green : Colors.blue,
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        ),
        child: fco.canEditContent
            ? PointerInterceptor(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      tooltip: 'show editable widgets',
                      onPressed: () async {
                        enterEditMode(); //rootState.context);
                      },
                      icon: const Icon(Icons.search, color: Colors.white),
                    ),
                    IconButton(
                      tooltip: 'sign out',
                      onPressed: () async {
                        if (!Callout.anyPresent([CalloutConfigToolbar.CID]))
                          _signOut();
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 12,
                      ),
                    ),
                  ],
                ),
              )
            : _lockIconButton(context),
      );

  void showExitEditModeCallout() {
    Callout.showOverlay(
      calloutContent: Container(
        decoration: const BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: IconButton(
          tooltip: 'exit edit mode',
          onPressed: () async {
            if (!Callout.anyPresent([CalloutConfigToolbar.CID])) exitEditMode();
          },
          icon: const Icon(
            Icons.close,
            color: Colors.red,
            size: 36,
          ),
        ),
      ),
      calloutConfig: CalloutConfig(
        cId: "exit-editMode",
        initialCalloutPos: fabPosition,
        initialCalloutW: 60,
        initialCalloutH: 60,
        borderRadius: 20,
        fillColor: Colors.orange,
      ),
    );
  }

  void enterEditMode() {
    hideFAB();
    fco.inEditMode.value = true;
    showAllNodeWidgetOverlays();
    showExitEditModeCallout();
    // Callout.showTextToast(
    //   cId: 'tap-a-widget',
    //   backgroundColor: Colors.red,
    //   textColor: Colors.white,
    //   textScaleFactor: 2.5,
    //   msgText: 'Tap a widget...',
    //   onlyOnce: true,
    //   height: 100,
    // );
  }

  void exitEditMode() {
    removeAllNodeWidgetOverlays();
    FlutterContentApp.capiBloc.add(const CAPIEvent.popSnippetEditor());
    Callout.dismiss('exit-editMode');
    unhideFAB();
    fco.inEditMode.value = false;
    // String feature = FlutterContentApp.rootNode?.name ?? "snippet name ?!";
    // if (Callout.anyPresent([feature])) {
    //   Callout.dismiss(feature);
    // }
  }

  void removeAllNodeWidgetOverlays() {
    // debugPrint('removeAllNodeWidgetOverlays - start');
    for (GlobalKey nodeWidgetGK in fco.gkSTreeNodeMap.keys) {
      Callout.dismiss('${nodeWidgetGK.hashCode}-pink-overlay');
    }
    // debugPrint('removeAllNodeWidgetOverlays - ended');
    fco.showingNodeBoundaryOverlays = false;
  }

  // only called with MaterialAppWrapper context
  void showAllNodeWidgetOverlays() {
    // debugPrint('showAllNodeWidgetOverlays...');
    // if currently configuring a target, only show for the current target's snippet
    // bool configuringATarget = Callout.anyPresent([CalloutConfigToolbar.CALLOUT_CONFIG_TOOLBAR]);
    void traverseAndMeasure(BuildContext el) {
      // debugPrint('traverseAndMeasure(${el.toString()})');

      if ((fco.gkSTreeNodeMap.containsKey(el.widget.key))) {
        // || (el.widget.key != null && gkSTreeNodeMap[el.widget.key]?.rootNodeOfSnippet() == FCO.targetSnippetBeingConfigured)) {
        GlobalKey gk = el.widget.key as GlobalKey;
        STreeNode? node = fco.gkSTreeNodeMap[gk];
        // debugPrint("traverseAndMeasure: ${node.toString()}");
        if (node != null && node.canShowTappableNodeWidgetOverlay) {
          // if (node.rootNodeOfSnippet() == FCO.targetSnippetBeingConfigured) {
          // debugPrint("targetSnippetBeingConfigured: ${node.toString()}");
          // }
          // debugPrint('Rect? r = gk.globalPaintBounds...');
// measure node
          Rect? r = gk.globalPaintBounds(
              skipWidthConstraintWarning: true,
              skipHeightConstraintWarning: true);
          // if (node is PlaceholderNode) {
          //   debugPrint('PlaceholderNode');
          // }
          if (r != null) {
            r = fco.restrictRectToScreen(r);
            // debugPrint("========>  r restricted to ${r.toString()}");
            // debugPrint('${node.runtimeType.toString()} - size: (${r != null ? r.size.toString() : ""})');
            // node.setParent(parent);
            // parent = node;
            // debugPrint('_showNodeWidgetOverlay...');
            // removeAllNodeWidgetOverlays();
            ScrollableState? vScrollableState =
                Scrollable.maybeOf(el, axis: Axis.vertical);
            ScrollController? vScrollController =
                vScrollableState?.widget.controller;
            ScrollableState? hScrollableState =
                Scrollable.maybeOf(el, axis: Axis.horizontal);
            ScrollController? hScrollController =
                hScrollableState?.widget.controller;
            node.showTappableNodeWidgetOverlay(
              node.toString(),
              r,
              hScrollController,
              vScrollController,
            );
          }
        }
      }
      el.visitChildElements((innerEl) {
        traverseAndMeasure(innerEl);
      });
    }

    var pageContext = context;
    traverseAndMeasure(pageContext);
    fco.showingNodeBoundaryOverlays = true;
    // debugPrint('traverseAndMeasure(context) finished.');
  }

  // only called with MaterialAppWrapper context
  void showNodeWidgetOverlay(STreeNode node) {
    Callout.dismiss('pink-border-overlay-non-tappable');
    fco.afterNextBuildDo(() {
      node.showNodeWidgetOverlay();
    });
    return;
    // Rect? r = node.nodeWidgetGK?.globalPaintBounds(skipWidthConstraintWarning: true, skipHeightConstraintWarning: true);
    // if (r != null) {
    //   r = FCO.restrictRectToScreen(r);
    //   // debugPrint("========>  r restricted to ${r.toString()}");
    //   Callout.dismiss('${node.nodeWidgetGK.hashCode}-pink-overlay');
    //   node.showNodeWidgetOverlay();
    // }
  }

  Widget _lockIconButton(context) {
    return IconButton(
      key: _lockIconGK,
      onPressed: () {
        Callout.showOverlay(
          targetGkF: () => _lockIconGK,
          calloutContent: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              fco.purpleText("Editor Access",
                  fontSize: 24, family: 'Merriweather'),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                width: 240,
                height: 100,
                child: FC_TextField(
                  inputType: String,
                  prompt: () => 'password',
                  originalS: '',
                  onTextChangedF: (s) async {
                    if (s == (kDebugMode ? " " : "lakebeachocean")) {
                      Callout.dismiss("EditorPassword");
                      fco.setCanEdit(true);
                      // await FC.loadLatestSnippetMap();
                      // FlutterContentApp.capiBloc.add(const CAPIEvent.hideAllTargetGroupsAndBtns());
                      // fco.afterNextBuildDo(() {
                      //   FC()
                      //       .capiBloc
                      //       .add(const CAPIEvent.unhideAllTargetGroupsAndBtns());
                      //   showDevToolsFAB();
                      // });
                      Callout.dismiss("EditorPassword");
                      FlutterContentApp.capiBloc.add(
                          const CAPIEvent.forceRefresh(
                              onlyTargetsWrappers: true));
                      setState(() {
                        // enterEditMode();
                      });
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
                Callout.dismiss("EditorPassword");
              },
            ),
            initialCalloutW: 240,
            initialCalloutH: 150,
            borderRadius: 12,
            fillColor: Colors.white,
          ),
        );
      },
      icon: const Icon(
        Icons.lock,
        color: Colors.white,
      ),
      iconSize: 36,
      tooltip: 'editor login...',
    );
  }

  void _signOut() {
    setState(() {
      fco.setCanEdit(false);
    });

    // // if auto-publishing, make sure publishing version == editing version
    // if (FCO.isAutoPublishing()) {
    //   FCO.appInfo.publishedVersionIds[]
    // }

    FlutterContentApp.capiBloc
        .add(const CAPIEvent.forceRefresh(onlyTargetsWrappers: true));
  }
}
