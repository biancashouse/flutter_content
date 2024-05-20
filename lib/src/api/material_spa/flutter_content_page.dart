import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_event.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

class FlutterContentPage extends StatefulWidget {
  final PanelName pageName;
  final WidgetBuilder pageBuilder;

  const FlutterContentPage({
    required this.pageName,
    required this.pageBuilder,
    required super.key,
  });

  @override
  State<FlutterContentPage> createState() => FlutterContentPageState();
}

class FlutterContentPageState extends State<FlutterContentPage> {
  final focusNode = FocusNode();
  final GlobalKey _lockIconGK = GlobalKey();

  bool isFABVisible = true; // Tracks FAB visibility
  Offset fabPosition = const Offset(20, 20); // Initial position of the FAB

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
  }

  //will go null after user tap bianca
  @override
  Widget build(BuildContext context) {
    Useful.instance.initWithContext(context);

    return NotificationListener<SizeChangedLayoutNotification>(
      onNotification: (SizeChangedLayoutNotification notification) {
        debugPrint("MaterialSPA SizeChangedLayoutNotification}");
        Callout.dismissAll(exceptFeatures: ["FAB"]);
        Useful.afterMsDelayDo(300, () {
          // Useful.refreshMQ(context);
          if (FC().showingNodeBoundaryOverlays ?? false) {
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
              if (FC().inEditMode.value && isEsc) {
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
                    Zoomer(child: widget.pageBuilder(context)),
                    Positioned(
                      left: fabPosition.dx,
                      top: fabPosition.dy,
                      child: Draggable(
                        feedback: FAB(),
                        child: isFABVisible ? FAB() : const Offstage(), // Hide FAB when isFABVisible is false
                        onDragEnd: (details) {
                          setState(() {
                            fabPosition = details.offset; // Update FAB position when dragged
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
  }

  Widget FAB() => Container(
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: FC().canEditContent
            ? PointerInterceptor(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () async {
                        enterEditMode(); //rootState.context);
                      },
                      icon: const Icon(Icons.search, color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () async {
                        if (!Callout.anyPresent(['config-toolbar'])) _signOut();
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

  void enterEditMode() {
    hideFAB();
    FC().inEditMode.value = true;
    showAllNodeWidgetOverlays();
    Callout.showTextToast(
      feature: 'tap-a-widget',
      backgroundColor: Colors.red,
      textColor: Colors.white,
      textScaleFactor: 2.5,
      msgText: 'Tap a widget...',
      onlyOnce: true,
      height: 100,
    );
  }

  void exitEditMode() {
    FC().inEditMode.value = false;
    removeAllNodeWidgetOverlays();
    String feature = FC().snippetBeingEdited?.rootNode.name ?? "snippet name ?!";
    if (Callout.anyPresent([feature])) {
      Callout.dismiss(feature);
    }
    unhideFAB();
    FC().capiBloc.add(const CAPIEvent.popSnippetBloc());
  }

  void removeAllNodeWidgetOverlays() {
    // debugPrint('removeAllNodeWidgetOverlays - start');
    for (GlobalKey nodeWidgetGK in FC().gkSTreeNodeMap.keys) {
      Callout.dismiss('${nodeWidgetGK.hashCode}-pink-overlay');
    }
    // debugPrint('removeAllNodeWidgetOverlays - ended');
    FC().showingNodeBoundaryOverlays = false;
  }

  // only called with MaterialAppWrapper context
  void showAllNodeWidgetOverlays() {
    // debugPrint('showAllNodeWidgetOverlays...');
    // if currently configuring a target, only show for the current target's snippet
    // bool configuringATarget = Callout.anyPresent(['config-toolbar']);
    void traverseAndMeasure(BuildContext el) {
      // debugPrint('traverseAndMeasure(${el.toString()})');

      if ((FC().gkSTreeNodeMap.containsKey(el.widget.key))) {
        // || (el.widget.key != null && gkSTreeNodeMap[el.widget.key]?.rootNodeOfSnippet() == FC().targetSnippetBeingConfigured)) {
        GlobalKey gk = el.widget.key as GlobalKey;
        STreeNode? node = FC().gkSTreeNodeMap[gk];
        debugPrint("traverseAndMeasure: ${node.toString()}");
        if (node != null && node.canShowTappableNodeWidgetOverlay) {
          if (node.rootNodeOfSnippet() == FC().targetSnippetBeingConfigured) {
            debugPrint("targetSnippetBeingConfigured: ${node.toString()}");
          }
          debugPrint('Rect? r = gk.globalPaintBounds...');
// measure node
          Rect? r = gk.globalPaintBounds(skipWidthConstraintWarning: true, skipHeightConstraintWarning: true);
          if (node is PlaceholderNode) {
            debugPrint('PlaceholderNode');
          }
          if (r != null) {
            r = Useful.restrictRectToScreen(r);
            // debugPrint("========>  r restricted to ${r.toString()}");
            // debugPrint('${node.runtimeType.toString()} - size: (${r != null ? r.size.toString() : ""})');
            // node.setParent(parent);
            // parent = node;
            // debugPrint('_showNodeWidgetOverlay...');
            // removeAllNodeWidgetOverlays();
            node.showTappableNodeWidgetOverlay(
              widget.pageName,
              node.toString(),
              r,
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
    FC().showingNodeBoundaryOverlays = true;
    // debugPrint('traverseAndMeasure(context) finished.');
  }

  // only called with MaterialAppWrapper context
  void showNodeWidgetOverlay(STreeNode node) {
    Callout.dismiss('pink-border-overlay-non-tappable');
    Useful.afterNextBuildDo(() {
      node.showNodeWidgetOverlay(widget.pageName);
    });
    return;
    // Rect? r = node.nodeWidgetGK?.globalPaintBounds(skipWidthConstraintWarning: true, skipHeightConstraintWarning: true);
    // if (r != null) {
    //   r = Useful.restrictRectToScreen(r);
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
          boxContentF: (ctx) => Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Useful.purpleText("Editor Access", fontSize: 24, family: 'Merriweather'),
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
                      FC().setCanEdit(true);
                      // await FC.loadLatestSnippetMap();
                      // FC().capiBloc.add(const CAPIEvent.hideAllTargetGroupsAndBtns());
                      // Useful.afterNextBuildDo(() {
                      //   FC()
                      //       .capiBloc
                      //       .add(const CAPIEvent.unhideAllTargetGroupsAndBtns());
                      //   showDevToolsFAB();
                      // });
                      Callout.dismiss("EditorPassword");
                      FC().capiBloc.add(const CAPIEvent.forceRefresh(onlyTargetsWrappers: true));
                      setState(() {
                        enterEditMode();
                      });
                    }
                  },
                  dontAutoFocus: false,
                  isPassword: true,
                  onEditingCompleteF: (s) {
                    // if (s == "lakebeachocean") {
                    //   Useful.om.remove("TrainerPassword".hashCode);
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
            feature: "EditorPassword",
            initialTargetAlignment: Alignment.topRight,
            initialCalloutAlignment: Alignment.bottomLeft,
            finalSeparation: 150,
            barrier: CalloutBarrier(
              opacity: .5,
              onTappedF: () async {
                Callout.dismiss("EditorPassword");
              },
            ),
            suppliedCalloutW: 240,
            suppliedCalloutH: 150,
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
      FC().setCanEdit(false);
    });

    // // if auto-publishing, make sure publishing version == editing version
    // if (FC().isAutoPublishing()) {
    //   FC().appInfo.publishedVersionIds[]
    // }

    FC().capiBloc.add(const CAPIEvent.forceRefresh(onlyTargetsWrappers: true));
  }

  // wait for android to register screen size
  Widget _buildAndroid(BuildContext context, Widget pageWidget) => FutureBuilder<double?>(
      future: _whenNotZero(
        Stream<double>.periodic(const Duration(milliseconds: 50), (_) => MediaQuery.sizeOf(context).width),
      ),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData && (snapshot.data ?? 0) > 0) {
          return pageWidget;
        }
        return const CircularProgressIndicator(
          color: Colors.orange,
        );
      });

// https://github.com/flutter/flutter/issues/25827
  Future<double?> _whenNotZero(Stream<double> source) async {
    await for (double value in source) {
      if (value > 0) {
        return value;
      }
    }
    return null;
    // stream exited without a true value, maybe return an exception.
  }
}
