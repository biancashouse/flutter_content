import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_content/flutter_content.dart';

class EditablePage extends StatefulWidget {
  final String routePath;
  final Widget child;

  // final bool dontShowLockIcon;

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
  // for use by child widget
  // ScrollController? sC;

  final focusNode = FocusNode();

  bool isFABVisible = true; // Tracks FAB visibility
  Offset? fabPosition;

  // void unhideFAB() {
  //   setState(() {
  //     isFABVisible = true; // Toggle FAB visibility
  //   });
  // }
  //
  // void hideFAB() {
  //   setState(() {
  //     isFABVisible = false; // Toggle FAB visibility
  //   });
  // }

  @override
  void initState() {
    super.initState();

    // sC = ScrollController(
    //   initialScrollOffset: fco.scrollControllerOffsets[widget.routePath] ?? 0.0,
    // );
    // // maintain offset between instantiations
    // sC!.addListener(() {
    //   fco.scrollControllerOffsets[widget.routePath] = sC!.offset;
    // });

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

  //will go null after user tap bianca
  @override
  Widget build(BuildContext context) {
    // FCO.initWithContext(context);

    // // maintain scroll pos
    // if (sC?.hasClients??false && fco.scrollControllerOffsets[widget.routePath] != sC?.offset) {
    //   fco.afterNextBuildDo(() {
    //     sC?.jumpTo(fco.scrollControllerOffsets[widget.routePath] ?? 0.0);
    //   });
    // }

    // fco.refreshScrollController(widget.routePath);

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
                        }
                      ),
                    ),
                    // if (fabPosition != null)
                    //   ValueListenableBuilder<bool>(
                    //     valueListenable: fco.canEditContent,
                    //     builder: (context, value, child) {
                    //       return isFABVisible
                    //           ? Positioned(
                    //               left: fabPosition!.dx,
                    //               top: fabPosition!.dy,
                    //               child: Draggable(
                    //                 feedback: FAB(),
                    //                 child: FAB(),
                    //                 //isFABVisible ? FAB() : const Offstage(), // Hide FAB when isFABVisible is false
                    //                 onDragEnd: (details) {
                    //                   setState(() {
                    //                     fabPosition = details
                    //                         .offset; // Update FAB position when dragged
                    //                   });
                    //                 },
                    //               ),
                    //             )
                    //           : const Offstage();
                    //     },
                    //   ),
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

  // Widget FAB() => Container(
  //       decoration: BoxDecoration(
  //         color: !fco.canEditContent.value ? Colors.green : Colors.blue,
  //         borderRadius: const BorderRadius.all(Radius.circular(20.0)),
  //       ),
  //       child: fco.canEditContent.value
  //           ? PointerInterceptor(
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                 children: [
  //                   IconButton(
  //                     tooltip: 'show editable widgets',
  //                     onPressed: () async {
  //                       enterEditMode(); //rootState.context);
  //                     },
  //                     icon: const Icon(Icons.search, color: Colors.white),
  //                   ),
  //                   IconButton(
  //                     tooltip: 'sign out',
  //                     onPressed: () {
  //                       if (!fco.anyPresent([CalloutConfigToolbar.CID])) {
  //                         _signOut();
  //                       }
  //                     },
  //                     icon: const Icon(
  //                       Icons.close,
  //                       color: Colors.white,
  //                       size: 12,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             )
  //           : const Offstage(), //lockIconButton(context),
  //     );

  // void showExitEditModeCallout() {
  //   fco.showOverlay(
  //     calloutContent: Container(
  //       decoration: const BoxDecoration(
  //         color: Colors.orange,
  //         borderRadius: BorderRadius.all(Radius.circular(20.0)),
  //       ),
  //       child: IconButton(
  //         tooltip: 'exit edit mode',
  //         onPressed: () async {
  //           if (!fco.anyPresent([CalloutConfigToolbar.CID])) exitEditMode();
  //         },
  //         icon: const Icon(
  //           Icons.close,
  //           color: Colors.red,
  //           size: 36,
  //         ),
  //       ),
  //     ),
  //     calloutConfig: CalloutConfig(
  //       cId: "exit-editMode",
  //       initialCalloutPos: fabPosition,
  //       initialCalloutW: 60,
  //       initialCalloutH: 60,
  //       borderRadius: 20,
  //       fillColor: Colors.orange,
  //     ),
  //   );
  // }

  // void enterEditMode() {
  //   hideFAB();
  //   fco.inEditMode.value = true;
  //   showAllNodeWidgetOverlays();
  //   showExitEditModeCallout();
  //   // fco.showTextToast(
  //   //   cId: 'tap-a-widget',
  //   //   backgroundColor: Colors.red,
  //   //   textColor: Colors.white,
  //   //   textScaleFactor: 2.5,
  //   //   msgText: 'Tap a widget...',
  //   //   onlyOnce: true,
  //   //   height: 100,
  //   // );
  // }

  // void exitEditMode() {
  //   removeAllNodeWidgetOverlays();
  //   FlutterContentApp.capiBloc.add(const CAPIEvent.popSnippetEditor());
  //   fco.dismiss('exit-editMode');
  //   unhideFAB();
  //   fco.inEditMode.value = false;
  //   // String feature = FlutterContentApp.rootNode?.name ?? "snippet name ?!";
  //   // if (fco.anyPresent([feature])) {
  //   //   fco.dismiss(feature);
  //   // }
  // }

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
            node.measuredRect = Rect.fromLTWH(r.left, r.top, r.width, r.height);
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

  // // only called with MaterialAppWrapper context
  // static void showNodeWidgetOverlay(STreeNode node) {
  //   fco.dismiss('pink-border-overlay-non-tappable');
  //   fco.afterNextBuildDo(() {
  //     node.showNodeWidgetOverlay();
  //   });
  //   return;
  //   // Rect? r = node.nodeWidgetGK?.globalPaintBounds(skipWidthConstraintWarning: true, skipHeightConstraintWarning: true);
  //   // if (r != null) {
  //   //   r = FCO.restrictRectToScreen(r);
  //   //   // fco.logi("========>  r restricted to ${r.toString()}");
  //   //   fco.dismiss('${node.nodeWidgetGK.hashCode}-pink-overlay');
  //   //   node.showNodeWidgetOverlay();
  //   // }
  // }

  // Widget lockIconButton(context) {
  //   if (!widget.dontShowLockIcon) return Offstage();
  //   return IconButton(
  //     key: _lockIconGK,
  //     onPressed: () {
  //       editorPasswordDialog();
  //     },
  //     icon: const Icon(
  //       Icons.lock,
  //       color: Colors.white,
  //     ),
  //     iconSize: 36,
  //     tooltip: 'editor login...',
  //   );
  // }

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
      ),
    );
  }

  // void _signOut() {
  //   setState(() {
  //     fco.setCanEditContent(false);
  //   });
  //
  //   // // if auto-publishing, make sure publishing version == editing version
  //   // if (FCO.isAutoPublishing()) {
  //   //   FCO.appInfo.publishedVersionIds[]
  //   // }
  //
  //   FlutterContentApp.capiBloc
  //       .add(const CAPIEvent.forceRefresh(onlyTargetsWrappers: true));
  // }
}
