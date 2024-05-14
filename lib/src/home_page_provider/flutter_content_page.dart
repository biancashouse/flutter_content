import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_event.dart';
import 'package:flutter_content/src/bloc/snippet_event.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

class FlutterContentPage extends HookWidget {
  final PanelName pageName;
  final SnippetName snippetName;
  final SnippetTemplate fromTemplate;

  const FlutterContentPage({required this.pageName, required this.snippetName, this.fromTemplate = SnippetTemplate.empty, super.key});

  static final GlobalKey _lockIconGK = GlobalKey(); //will go null after user tap bianca

  // https://github.com/flutter/flutter/issues/25827
  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();

    // initstate
    useEffect(
      () {
        // Code to run only once on widget build (similar to initState)
        debugPrint('This code runs only once when the widget builds');
        Useful.afterNextBuildDo(() {
          showDevToolsFAB();
          FC.forceRefresh();
        });
        return null;
      },
      // Empty dependency list ensures it runs only once
      const [],
    );

    final snippetPanel = SnippetPanel(
      panelName: pageName,
      snippetName: snippetName,
      fromTemplate: fromTemplate,
    );

    Useful.instance.initWithContext(useContext());

    return NotificationListener<SizeChangedLayoutNotification>(
      onNotification: (SizeChangedLayoutNotification notification) {
        debugPrint("MaterialSPA SizeChangedLayoutNotification}");
        Callout.dismissAll(exceptFeatures: ["FAB"]);
        Useful.afterMsDelayDo(300, () {
          Useful.refreshMQ(context);
          if (FC().showingNodeOBoundaryOverlays ?? false) {
            FlutterContentPage.removeAllNodeWidgetOverlays();
            FlutterContentPage.showAllNodeWidgetOverlays(context);
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
          child: Material(
            child: Zoomer(
              child: Useful.isAndroid ? _buildAndroid(context, snippetPanel) : snippetPanel,
            ),
          ),
        ),
      ),
    );
  }

  // wait for android to register screen size
  Widget _buildAndroid(BuildContext context, Widget snippetPanel) => FutureBuilder<double?>(
      future: _whenNotZero(
        Stream<double>.periodic(const Duration(milliseconds: 50), (_) => MediaQuery.of(context).size.width),
      ),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData && (snapshot.data ?? 0) > 0) {
          return snippetPanel;
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

  static void exitEditMode() {
    FC().inEditMode.value = false;
    removeAllNodeWidgetOverlays();
    String feature = FC().snippetBeingEdited?.rootNode.name ?? "snippet name ?!";
    if (Callout.anyPresent([feature])) {
      Callout.dismiss(feature);
    }
    showDevToolsFAB();
    FC().capiBloc.add(const CAPIEvent.popSnippetBloc());
    // unhideAllSingleTargetBtns();
    //         FC.forceRefresh();
  }

  /// either show edit btn fab, or lock icon fab
  static Future<void> showDevToolsFAB() async {
    Callout.dismiss("FAB");
    if (FC().canEditContent) {
      Callout.showTextToast(
        feature: 'show-auto-publish-status',
        msgText: 'auto-publishing of new snippets is ${FC().appInfo.autoPublishDefault ? "ON" : "OFF"}',
      );
    }
    // // AppModel appModel = FC().appInfo;
    // // BranchModel? currentBranch = appModel.branches[appModel.editingBranchName];
    // String buildInfo = '${FC().yamlVersion}-${FC().yamlBuildNumber}';
    // int ver = int.tryParse(FC().appInfo.editingVersionIds ?? '0') ?? 0;
    // // String verTimestamp = ver > 0 ? Useful.formattedDate(ver) : 'not yet';
    // String verTimeago =
    //     timeago.format(DateTime.fromMillisecondsSinceEpoch(ver));
    // String verTimeDate = Useful.formattedDate(ver);
    CalloutConfig cc = CalloutConfig(
      feature: "FAB",
      suppliedCalloutW: FC().canEditContent ? 120 : 60,
      suppliedCalloutH: 60,
      initialCalloutPos: FC().devToolsFABPos(Useful.rootContext),
      fillColor: FUCHSIA_X,
      arrowType: ArrowType.NO_CONNECTOR,
      //circleShape: true,
      borderRadius: 24,
      elevation: 10,
      onDragEndedF: (newPos) => FC().setDevToolsFABPos(newPos),
    );
    var boxContentF = FC().canEditContent
        ? PointerInterceptor(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () async {
                    MaterialSPAState? rootState = MaterialSPA.of(Useful.rootContext!);
                    if (rootState != null) {
                      enterEditMode(rootState.context); //rootState.context);
                    }
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
        : _lockIconButton();
    Callout.showOverlay(
      boxContentF: (context) => boxContentF,
      calloutConfig: cc,
    );
  }

  static void enterEditMode(BuildContext context) {
    Callout.dismiss("FAB");
    FC().inEditMode.value = true;
    showAllNodeWidgetOverlays(context);
    Callout.showTextToast(
      feature: 'tap-a-widget',
      backgroundColor: Colors.red,
      textColor: Colors.white,
      textScaleFactor: 2.5,
      msgText: 'Tap a widget...',
      onlyOnce: true,
      height: 100,
    );
    // FC.loadLatestSnippetMap();
    // hideAllSingleTargetBtns();
    //         FC.forceRefresh();
  }

  // only called with MaterialAppWrapper context
  static void showAllNodeWidgetOverlays(context) {
    // debugPrint('showAllNodeWidgetOverlays...');
    // if currently configuring a target, only show for the current target's snippet
    FC().showingNodeOBoundaryOverlays = true;
    // bool configuringATarget = Callout.anyPresent(['config-toolbar']);
    void traverseAndMeasure(BuildContext el) {
      // debugPrint('traverseAndMeasure(${el.toString()})');

      if ((FC().gkSTreeNodeMap.containsKey(el.widget.key))) {
        // || (el.widget.key != null && gkSTreeNodeMap[el.widget.key]?.rootNodeOfSnippet() == FC().targetSnippetBeingConfigured)) {
        GlobalKey gk = el.widget.key as GlobalKey;
        STreeNode? node = FC().gkSTreeNodeMap[gk];
        if (node != null) {
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
            node.showTappableNodeWidgetOverlay(r);
          }
        }
      }
      el.visitChildElements((innerEl) {
        traverseAndMeasure(innerEl);
      });
    }

    traverseAndMeasure(context);

    // debugPrint('traverseAndMeasure(context) finished.');
  }

  // only called with MaterialAppWrapper context
  static void showNodeWidgetOverlay(STreeNode node) {
    Callout.dismiss('${node.nodeWidgetGK.hashCode}-pink-overlay');
    Useful.afterNextBuildDo(() {
      node.showNodeWidgetOverlay();
    });
    return;
    Rect? r = node.nodeWidgetGK?.globalPaintBounds(skipWidthConstraintWarning: true, skipHeightConstraintWarning: true);
    if (r != null) {
      r = Useful.restrictRectToScreen(r);
      // debugPrint("========>  r restricted to ${r.toString()}");
      Callout.dismiss('${node.nodeWidgetGK.hashCode}-pink-overlay');
      node.showNodeWidgetOverlay();
    }
  }

  static void removeAllNodeWidgetOverlays() {
    // debugPrint('removeAllNodeWidgetOverlays - start');
    for (GlobalKey nodeWidgetGK in FC().gkSTreeNodeMap.keys) {
      Callout.dismiss('${nodeWidgetGK.hashCode}-pink-overlay');
    }
    // debugPrint('removeAllNodeWidgetOverlays - ended');
    FC().showingNodeOBoundaryOverlays = false;
  }

  static Widget _lockIconButton() {
    return IconButton(
      key: FlutterContentPage._lockIconGK,
      onPressed: () {
        Callout.showOverlay(
          targetGkF: () => FlutterContentPage._lockIconGK,
          boxContentF: (ctx) => Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Useful.purpleText("Editor Access", fontSize: 24, family: 'Merriweather'),
              SizedBox(
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
                      showDevToolsFAB();
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

  static void _signOut() {
    FC().setCanEdit(false);
    FlutterContentPage.showDevToolsFAB();

    // // if auto-publishing, make sure publishing version == editing version
    // if (FC().isAutoPublishing()) {
    //   FC().appInfo.publishedVersionIds[]
    // }

    FC().capiBloc.add(const CAPIEvent.forceRefresh(onlyTargetsWrappers: true));
    // Useful.afterNextBuildDo(() {
    // });
  }
}
