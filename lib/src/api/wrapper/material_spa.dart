// ignore_for_file: camel_case_types

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_event.dart';
import 'package:flutter_content/src/home_page_provider/home_page_provider.dart';
import 'package:flutter_content/src/model/model_repo.dart';
import 'package:flutter_content/src/target_config/content/snippet_editor/clipboard_view.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

// conditional import for webview ------------------
import 'register_ios_or_android_webview.dart'
    if (dart.library.html) 'register_web_webview.dart';
//--------------------------------------------------

/// this widget must enclose your MaterialApp, or CupertinoApp or WidgetsApp
/// so that the CAPIBloc becomes available to overlays, which are placed into
/// the app's overlay and not in your widget tree as you might have expected.
class MaterialSPA extends StatefulWidget {
  final String appName;
  final String title;

  // final SnippetName pageSnippetName;
  final String? initialValueJsonAssetPath;
  final Widget? webHome;
  final Widget? mobileHome;
  final MaterialAppThemeFunc materialAppThemeF;
  final FirebaseOptions? fbOptions;
  final Map<String, NamedTextStyle> namedStyles;
  final bool hideStatusBar;
  final IModelRepository?
      testModelRepo; // created in tests by a when(mockRepository.getCAPIModel(appName: appName...
  final Widget? testWidget;

  // final bool localTestingFilePaths;

  MaterialSPA({
    required this.appName,
    this.title = '',
    // required this.pageSnippetName,
    this.initialValueJsonAssetPath,
    // this.localTestingFilePaths = false,
    this.webHome,
    this.mobileHome,
    required this.materialAppThemeF,
    this.fbOptions,
    this.namedStyles = const {},
    this.hideStatusBar = true,
    @visibleForTesting this.testModelRepo,
    @visibleForTesting this.testWidget,
  });

  static GlobalKey _lockIconGK =
      GlobalKey(); //will go null after user tap bianca

  // static void removeAllPinkSnippetOverlays() {
  //   return;
  // for (String panelName in CAPIState.snippetPanelGkMap.keys) {
  //   Callout.dismiss('$panelName-pink-overlay');
  //   Callout.dismiss('$panelName-panel-name-callout');
  // }
  // }

  // static void showAllPinkSnippetOverlays() {
  //   return;
  // for (String panelName in CAPIState.snippetPanelGkMap.keys) {
  //   Rect? rect = CAPIState.snippetPanelGkMap[panelName]?.globalPaintBounds(
  //       // skipWidthConstraintWarning: skipWidthConstraintWarning,
  //       // skipHeightConstraintWarning: skipHeightConstraintWarning,
  //       ); //Measuring.findGlobalRect(_offstageGK!);
  //   if (rect != null) {
  //     debugPrint('$panelName ${rect.toString()}');
  //     // overlay rect with a transparent pink rect, and a 3px surround
  //     Callout.showOverlay(
  //       ensureLowestOverlay: true,
  //       boxContentF: (context) => InkWell(
  //         onTap: () {
  //           String? snippetName = CAPIState.snippetPlacementMap[panelName];
  //           if (snippetName != null) {
  //             // edit the snippet
  //             hideAllSingleTargetBtns();
  //             // FlutterContent().capiBloc.add(const CAPIEvent.hideAllTargetGroupBtns());
  //             // FlutterContent().capiBloc.add(const CAPIEvent.hideTargetGroupsExcept());
  //             MaterialAppWrapper.removeAllPinkSnippetOverlays();
  //             FlutterContent().capiBloc.add(CAPIEvent.pushSnippetBloc(snippetName: snippetName));
  //             Useful.afterNextBuildDo(() {
  //               SnippetBloC? snippetBeingEdited = CAPIBloC.snippetBeingEdited;
  //               if (snippetBeingEdited != null) {
  //                 showSnippetTreeCallout(
  //                   snippetBloc: snippetBeingEdited,
  //                   targetGKF: () => CAPIState.snippetPanelGkMap[panelName],
  //                   onChangedF: () {},
  //                 );
  //               }
  //             });
  //           }
  //         },
  //         child: Container(
  //           width: rect.width,
  //           height: rect.height,
  //           decoration: BoxDecoration(
  //             color: Colors.purpleAccent.withOpacity(.2),
  //             border: Border.all(width: 2, color: Colors.purpleAccent, style: BorderStyle.solid),
  //           ),
  //         ),
  //       ),
  //       calloutConfig: CalloutConfig(
  //         feature: '$panelName-pink-overlay',
  //         suppliedCalloutW: rect.width + 6,
  //         suppliedCalloutH: rect.height + 6,
  //         initialCalloutPos: rect.topLeft.translate(-3, -3),
  //         color: Colors.transparent,
  //         arrowType: ArrowType.NO_CONNECTOR,
  //         draggable: false,
  //       ),
  //       targetGkF: () => CAPIState.snippetPanelGkMap[panelName],
  //     );
  //     // calc optimal alignment of panel-name callout
  //     late Alignment al;
  //     if (max(rect.top, rect.bottom) > max(rect.left, rect.right)) {
  //       al = rect.top > rect.bottom ? Alignment.topCenter : Alignment.bottomCenter;
  //       if (rect.left > rect.right) al = Alignment.topLeft;
  //       if (rect.left < rect.right) al = Alignment.topRight;
  //     } else {
  //       al = rect.left > rect.right ? Alignment.centerLeft : Alignment.centerRight;
  //       if (rect.top > rect.bottom) al = Alignment.topLeft;
  //       if (rect.top < rect.bottom) al = Alignment.topRight;
  //     }
  //     String? rootSnippetName = CAPIState.snippetPlacementMap[panelName];
  //     if (rootSnippetName != null) {
  //       Callout.showOverlay(
  //         ensureLowestOverlay: true,
  //         boxContentF: (context) => InkWell(
  //           onTap: () {
  //             // edit the snippet
  //             hideAllSingleTargetBtns();
  //             // FlutterContent().capiBloc.add(const CAPIEvent.hideAllTargetGroupBtns());
  //             // FlutterContent().capiBloc.add(const CAPIEvent.hideTargetGroupsExcept());
  //             MaterialAppWrapper.removeAllPinkSnippetOverlays();
  //             String? snippetName = CAPIState.snippetPlacementMap[panelName];
  //             if (snippetName != null) {
  //               FlutterContent().capiBloc.add(CAPIEvent.pushSnippetBloc(snippetName: snippetName));
  //               Useful.afterNextBuildDo(() {
  //                 SnippetBloC? snippetBeingEdited = CAPIBloC.snippetBeingEdited;
  //                 if (snippetBeingEdited != null) {
  //                   showSnippetTreeCallout(
  //                     snippetBloc: snippetBeingEdited,
  //                     targetGKF: () => CAPIState.snippetPanelGkMap[panelName],
  //                     onChangedF: () {},
  //                   );
  //                 }
  //               });
  //             }
  //           },
  //           child: Center(child: Useful.coloredText('$panelName / $rootSnippetName', color: Colors.white)),
  //         ),
  //         calloutConfig: CalloutConfig(
  //           feature: '$panelName-panel-name-callout',
  //           suppliedCalloutW: 300,
  //           suppliedCalloutH: 30,
  //           initialCalloutAlignment: al,
  //           initialTargetAlignment: -al,
  //           color: Colors.black,
  //           arrowType: ArrowType.THIN,
  //           finalSeparation: 40,
  //           draggable: true,
  //         ),
  //         targetGkF: () => CAPIState.snippetPanelGkMap[panelName],
  //       );
  //     }
  //   }
  // }
  // }

  static MaterialSPAState? of(BuildContext context) =>
      context.findAncestorStateOfType<MaterialSPAState>();

  // static bool escKeyPressedZFor3Secs = false;

  @override
  State<MaterialSPA> createState() => MaterialSPAState();
}

// Ticker available for use by Callouts; i.e. vsync: MaterialAppWrapper.of(context)
class MaterialSPAState extends State<MaterialSPA>
    with TickerProviderStateMixin {
  late Future<CAPIBloC> fInitApp;
  int tapCount = 0;
  DateTime? lastTapTime;
  late FocusNode focusNode;

  // YoutubePlayerController? ytController;

  @override
  void initState() {
    super.initState();

    focusNode = FocusNode();

    if (widget.hideStatusBar) {
      // https://medium.com/@mustafatahirhussein/these-quick-tips-will-surely-help-you-to-build-a-better-flutter-app-6db93c1095b6
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
      );
    }

    // see conditional imports for web or mobile
    registerWebViewImplementation();

    fInitApp = _initApp();
  }

  // @override
  // void didChangeDependencies() {
  //   debugPrint("didChangeDependencies");
  //   // Useful.refreshMQ(context);
  //   if (FC().showingNodeOBoundaryOverlays??false) {
  //     MaterialSPAState.removeAllNodeWidgetOverlays();
  //     MaterialSPAState.exitEditMode();
  //     Useful.afterMsDelayDo(1000, () {
  //       FC().capiBloc.add(const CAPIEvent.forceRefresh());
  //       FC().snippetBeingEdited?.add(const SnippetEvent.forceSnippetRefresh());
  //       // MaterialSPAState.showAllNodeWidgetOverlays(context);
  //     });
  //   }
  //   super.didChangeDependencies();
  // }

  // init FlutterContent, which keeps a single CAPIBloC and multiple SnippetBloCs
  Future<CAPIBloC> _initApp() async {
    CAPIBloC capiBloc = await FC().init(
      modelName: widget.appName,
      fbOptions: widget.fbOptions,
      namedStyles: widget.namedStyles,
    );
    return capiBloc;
  }

  // ytController = YoutubePlayerController.fromVideoId(
  //   videoId: 'zWh3CShX_do',
  //   autoPlay: false,
  //   params: const YoutubePlayerParams(showFullscreenButton: true),
  // );

  @override
  Widget build(BuildContext context) => Builder(builder: (context) {
        return FutureBuilder<CAPIBloC>(
          future: fInitApp,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              // debugPrint("done (has data)");
              // create the clipboard overlay and hide
              // start the app with the main bloC
              if (!Callout.anyPresent(["floating-clipboard"])) {
                Useful.afterNextBuildDo(() {
                  _showFloatingClipboard();
                  Callout.hide("floating-clipboard");
                  showDevToolsButton();
                });
              }
              return BlocProvider<CAPIBloC>(
                create: (BuildContext context) => snapshot.data!,
                child: MaterialApp(
                  theme: widget.materialAppThemeF(),
                  debugShowCheckedModeBanner: false,
                  title: widget.title,
                  scrollBehavior: const ConstantScrollBehavior(),
                  home: NotificationListener<SizeChangedLayoutNotification>(
                    onNotification:
                        (SizeChangedLayoutNotification notification) {
                      debugPrint("MaterialSPA SizeChangedLayoutNotification}");
                      Callout.dismissAll(exceptFeatures: ["FAB"]);
                      Useful.afterMsDelayDo(300, () {
                        Useful.refreshMQ(context);
                        if (FC().showingNodeOBoundaryOverlays ?? false) {
                          MaterialSPAState.removeAllNodeWidgetOverlays();
                          MaterialSPAState.showAllNodeWidgetOverlays(context);
                        }
                      });
                      return true;
                    },
                    child: SizeChangedLayoutNotifier(
                      child: KeyboardListener(
                        autofocus: true,
                        focusNode: focusNode, // <-- more magic
                        onKeyEvent: (KeyEvent event) {
                          bool isEsc =
                              event.logicalKey == LogicalKeyboardKey.escape;
                          if (FC().inEditMode.value && isEsc) {
                            exitEditMode();
                          }
                          // _enterOrExitEditMode(event, lastTapTime, tapCount);
                        },
                        child: Builder(builder: (context) {
                          Useful.instance.initWithContext(context);
                          return widget.testWidget != null
                              ? widget.testWidget!
                              : widget.webHome != null &&
                                      widget.mobileHome != null
                                  ? HomePageProvider().getWebOrMobileHomePage(
                                      widget.webHome!, widget.mobileHome!)
                                  : const Icon(
                                      Icons.error_outlined,
                                      color: Colors.red,
                                      size: 40,
                                    );
                        }),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return const Offstage();
            }
          },
        );
        // TESTING ONLY
      });

  // @override
  // Widget build2(BuildContext context) => Builder(builder: (context) {
  //       return NotificationListener<SizeChangedLayoutNotification>(
  //           onNotification: (SizeChangedLayoutNotification notification) {
  //             debugPrint("_CAPIAppWrapperState onNotification: ${notification.toString()}");
  //             // MaterialAppWrapper.iwSizeMap = {};
  //             bool screenSizeChanged = false;
  //             Size screenSize = MediaQuery.of(context).size;
  //             if ((_prevScrW ?? 0) != screenSize.width) {
  //               _prevScrW = screenSize.width;
  //               screenSizeChanged = true;
  //             }
  //             if (!screenSizeChanged || (_prevScrH ?? 0) != screenSize.height) {
  //               _prevScrH = screenSize.height;
  //               screenSizeChanged = true;
  //             }
  //             return screenSizeChanged;
  //           },
  //           child: FutureBuilder<CAPIBloc>(
  //             future: initApp,
  //             builder: (context, snapshot) {
  //               bool done = snapshot.connectionState == ConnectionState.done;
  //               CAPIBloc? newBloc = done ? snapshot.data : null;
  //               return done && newBloc != null
  //                   ? SizeChangedLayoutNotifier(
  //                       child: BlocProvider<CAPIBloc>(
  //                         create: (BuildContext context) => newBloc,
  //                         child: Builder(builder: (context) {
  //                           debugPrint("MaterialAppWrapper => MaterialApp");
  //                           return MaterialApp(
  //                             theme: widget.materialAppThemeF(),
  //                             debugShowCheckedModeBanner: false,
  //                             scrollBehavior: const ConstantScrollBehavior(),
  //                             home: widget.materialAppHomeF(),
  //                           );
  //                         }),
  //                       ),
  //                     )
  //                   : const Offstage();
  //             },
  //           ));
  //     });

// Map<String, TargetModel> _parseSingleTargets(CAPIModel model) {
// Map<String, TargetModel> singleTargetListMap = {};
//   if (model.singleConfigs.isNotEmpty) {
//     try {
//       for (String wName in model.singleConfigs.keys ?? []) {
//         TargetModel? tc = model.singleConfigs[wName];
//         if (tc != null) {
//           tc.single = true;
//           tcs[wName] = tc;
//         }
//       }
//     } catch (e) {
//       debugPrint("_parseWidgetTargets(): ${e.toString()}");
//       rethrow;
//     }
//   }
//   return singleTargetListMap;
// }

// void _initImageTargets(CAPIBloc capiBloc) {
//   Map<String, CAPITargetModelList> imageTargetListMap = capiBloc.state.imageTargetListMap;
//   if (imageTargetListMap.isNotEmpty) {
//     try {
//       for (CAPITargetModelList imageConfig in imageTargetListMap.values) {
//         if (imageConfig.imageTargets.isNotEmpty) {
//           for (int i = 0; i < imageConfig.imageTargets.length; i++) {
//             // imageConfig.imageTargets[i].init(
//             //   capiBloc,
//             //   // GlobalKey(debugLabel: "image-target-$i"),
//             //   // FocusNode(),
//             //   // FocusNode(),
//             // );
//           }
//         }
//       }
//     } catch (e) {
//       debugPrint("_initTargets(): ${e.toString()}");
//       rethrow;
//     }
//   }
// }

  /// either show edit btn fab, or lock icon fab
  static Future<void> showDevToolsButton() async {
    AppModel appModel = FC().appModel;
    BranchModel? currentBranch = appModel.branches[appModel.currentBranchName];
    String ver = '${FC().version}-${FC().buildNumber}';
    Callout.dismiss("FAB");
    Callout.showOverlay(
        boxContentF: (context) => FC().canEditContent
            ? PointerInterceptor(
                child: Tooltip(
                  message: "Edit this widget's tree (v.$ver)",
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        tooltip: 'undo',
                        // style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white)),
                        icon: Icon(
                          Icons.undo,
                          color: Colors.white.withOpacity(
                              (currentBranch?.undos.isNotEmpty ?? false)
                                  ? 1.0
                                  : .5),
                        ),
                        onPressed: () {
                          FC().capiBloc.add(
                              const CAPIEvent.revert(action: FSAction.undo));
                          Useful.afterNextBuildDo(() {
                            showDevToolsButton();
                          });
                        },
                      ),
                      const VerticalDivider(color: Colors.white),
                      TextButton.icon(
                        onPressed: () async {
                          MaterialSPAState? rootState = MaterialSPA.of(context);
                          if (rootState != null) {
                            enterEditMode(
                                rootState.context); //rootState.context);
                          }
                        },
                        icon: Icon(Icons.edit, color: Colors.white),
                        label: Useful.coloredText(
                            '${FC().appModel.currentBranchName}',
                            color: Colors.white,
                            fontSize: 24),
                      ),
                      const VerticalDivider(color: Colors.white),
                      FABMenuAnchor(),
                      const VerticalDivider(color: Colors.white),
                      IconButton(
                        tooltip: 'redo',
                        // style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white)),
                        icon: Icon(
                          Icons.redo,
                          color: Colors.white.withOpacity(
                              (currentBranch?.redos.isNotEmpty ?? false)
                                  ? 1.0
                                  : .5),
                        ),
                        onPressed: () {
                          FC().capiBloc.add(
                              const CAPIEvent.revert(action: FSAction.redo));
                          Useful.afterNextBuildDo(() {
                            showDevToolsButton();
                          });
                        },
                      ),
                    ],
                  ),
                ),
              )
            : _lockIconButton(),
        calloutConfig: CalloutConfig(
          feature: "FAB",
          suppliedCalloutW: FC().canEditContent ? 320 : 60,
          suppliedCalloutH: 60,
          initialCalloutPos: FC().editModeBtnPos(Useful.rootContext),
          fillColor: FUCHSIA_X,
          arrowType: ArrowType.NO_CONNECTOR,
          //circleShape: true,
          borderRadius: 24,
          elevation: 10,
          onDragEndedF: (newPos) => FC().setEditModeBtnPos(newPos),
        ));
  }

  void _showFloatingClipboard() {
    Size screenSize = MediaQuery.of(context).size;
    Callout.showOverlay(
        boxContentF: (context) => const ClipboardView(),
        calloutConfig: CalloutConfig(
          feature: "floating-clipboard",
          suppliedCalloutW: 300,
          suppliedCalloutH: 180,
          initialCalloutPos: Offset(screenSize.width - 400, 0),
          fillColor: Colors.transparent,
          arrowType: ArrowType.NO_CONNECTOR,
          borderRadius: 16,
        ));
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
    // hideAllSingleTargetBtns();
    // FC().capiBloc.add(const CAPIEvent.forceRefresh());
  }

  static void exitEditMode() {
    FC().inEditMode.value = false;
    removeAllNodeWidgetOverlays();
    String feature =
        FC().snippetBeingEdited?.rootNode.name ?? "snippet name ?!";
    if (Callout.anyPresent([feature])) {
      Callout.dismiss(feature);
    }
    if (Useful.rootContext != null) {
      showDevToolsButton();
    }
    FC().capiBloc.add(const CAPIEvent.popSnippetBloc());
    // unhideAllSingleTargetBtns();
    // FC().capiBloc.add(const CAPIEvent.forceRefresh());
  }

  // _enterOrExitEditMode(KeyEvent event, DateTime? lastTapTime, int tapCount) {
  //   bool isEsc = event.logicalKey == LogicalKeyboardKey.escape;
  //   debugPrint("isEsc: $isEsc");
  //
  //   if (MaterialSPA.inEditMode.value && isEsc) {
  //     exitEditMode();
  //   }
  //
  //
  //   // wait a few millis in case Escaping from a property editor
  //   Future.delayed(const Duration(milliseconds: 50), () {
  //     if (!FC().skipEditModeEscape) {
  //       if (!MaterialSPA.inEditMode.value &&
  //           // (HardwareKeyboard.instance.isShiftPressed ||
  //           //     HardwareKeyboard.instance.isAltPressed ||
  //           //     HardwareKeyboard.instance.isShiftPressed) &&
  //           !isEsc &&
  //           event is KeyUpEvent) {
  //         enterEditMode(context);
  //       } else
  //       //  now reset flag with debounce duration
  //     }
  //     Future.delayed(const Duration(milliseconds: 300), () {
  //       FC().skipEditModeEscape = false;
  //     });
  //   });
  // }

  // only called with MaterialAppWrapper context
  static void showAllNodeWidgetOverlays(context) {
    // debugPrint('showAllNodeWidgetOverlays...');
    // if currently configuring a target, only show for the current target's snippet
    FC().showingNodeOBoundaryOverlays = true;
    // bool configuringATarget = Callout.anyPresent(['config-toolbar']);
    var gkSTreeNodeMap = FC().gkSTreeNodeMap;
    void traverseAndMeasure(BuildContext el) {
      // debugPrint('traverseAndMeasure(${el.toString()})');

      if ((gkSTreeNodeMap.containsKey(el.widget.key))) {
        // || (el.widget.key != null && gkSTreeNodeMap[el.widget.key]?.rootNodeOfSnippet() == FC().targetSnippetBeingConfigured)) {
        GlobalKey gk = el.widget.key as GlobalKey;
        STreeNode? node = gkSTreeNodeMap[gk];
        if (node != null) {
          if (node.rootNodeOfSnippet() == FC().targetSnippetBeingConfigured) {
            debugPrint("targetSnippetBeingConfigured: ${node.toString()}");
          }
          debugPrint('Rect? r = gk.globalPaintBounds...');
// measure node
          Rect? r = gk.globalPaintBounds(
              skipWidthConstraintWarning: true,
              skipHeightConstraintWarning: true);
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
    Rect? r = node.nodeWidgetGK?.globalPaintBounds(
        skipWidthConstraintWarning: true, skipHeightConstraintWarning: true);
    if (r != null) {
      r = Useful.restrictRectToScreen(r);
      // debugPrint("========>  r restricted to ${r.toString()}");
      MaterialSPAState.removeAllNodeWidgetOverlays();
      node.showNodeWidgetOverlay();
    }
  }

  // // only called with MaterialAppWrapper context
  // static void setAllNodeParents(context) {
  //   void traverseAndSetParent(BuildContext el, STreeNode? parent) {
  //     if (CAPIState.gkSTreeNodeMap.containsKey(el.widget.key)) {
  //       GlobalKey gk = el.widget.key as GlobalKey;
  //       STreeNode? node = CAPIState.gkSTreeNodeMap[gk];
  //       if (node != null) {
  //         node.parent = parent;
  //         parent = node;
  //       }
  //     }
  //     el.visitChildElements((innerEl) {
  //       traverseAndSetParent(innerEl, parent);
  //     });
  //   }
  //
  //   traverseAndSetParent(context, null);
  // }

  static void removeAllNodeWidgetOverlays() {
    // debugPrint('removeAllNodeWidgetOverlays - start');
    for (GlobalKey nodeWidgetGK in FC().gkSTreeNodeMap.keys) {
      Callout.dismiss('${nodeWidgetGK.hashCode}-pink-overlay');
    }
    // debugPrint('removeAllNodeWidgetOverlays - ended');
    FC().showingNodeOBoundaryOverlays = false;
  }

//   static void _showNodeWidgetOverlay(
//     STreeNode node,
//     Rect r,) {
// // overlay rect with a transparent pink rect, and a 3px surround
//     Rect restrictedRect = Useful.restrictRectToScreen(r);
//     debugPrint("=== _showNodeWidgetOverlay =====>  r restricted to ${restrictedRect.toString()}");
//     const int BORDER = 3;
//     double borderLeft = max(restrictedRect.left - 3, 0);
//     double borderTop = max(restrictedRect.top - 3, 0);
//     double borderRight = min(Useful.scrW, restrictedRect.right + BORDER * 2);
//     double borderBottom = min(Useful.scrH, restrictedRect.bottom + BORDER * 2);
//     Rect borderRect =
//         Rect.fromLTRB(borderLeft, borderTop, borderRight, borderBottom);
//     debugPrint("=== _showNodeWidgetOverlay =====>  borderRect ${borderRect.toString()}");
//     Callout.showOverlay(
//       ensureLowestOverlay: true,
//       boxContentF: (context) => PointerInterceptor(
//         child: Container(
//                 width: borderRect.width,
//                 height: borderRect.height,
//                 decoration: BoxDecoration(
// //color: Colors.purpleAccent.withOpacity(.1),
//                   border: Border.all(
//                       width: 2,
//                       color: Colors.purpleAccent,
//                       style: BorderStyle.solid),
//                 ),
//               ),
//       ),
//       calloutConfig: CalloutConfig(
//         feature: '${node.nodeWidgetGK.hashCode}-pink-overlay',
//         suppliedCalloutW: borderRect.width + 6,
//         suppliedCalloutH: borderRect.height + 6,
//         initialCalloutPos: borderRect.topLeft.translate(-3, -3),
//         color: Colors.transparent,
//         arrowType: ArrowType.NO_CONNECTOR,
//         draggable: false,
//       ),
//       targetGkF: () => node.nodeWidgetGK,
//     );
//   }

//   static void _showTappableNodeWidgetOverlay(
//       STreeNode node,
//       Rect r, ) {
// // overlay rect with a transparent pink rect, and a 3px surround
//     Rect restrictedRect = Useful.restrictRectToScreen(r);
//     debugPrint("=== _showNodeWidgetOverlay =====>  r restricted to ${restrictedRect.toString()}");
//     const int BORDER = 3;
//     double borderLeft = max(restrictedRect.left - 3, 0);
//     double borderTop = max(restrictedRect.top - 3, 0);
//     double borderRight = min(Useful.scrW, restrictedRect.right + BORDER * 2);
//     double borderBottom = min(Useful.scrH, restrictedRect.bottom + BORDER * 2);
//     Rect borderRect =
//     Rect.fromLTRB(borderLeft, borderTop, borderRight, borderBottom);
//     debugPrint("=== _showNodeWidgetOverlay =====>  borderRect ${borderRect.toString()}");
//     Callout.showOverlay(
//       ensureLowestOverlay: false,
//       boxContentF: (context) => PointerInterceptor(
//         child: InkWell(
//           onTap: () {
//             // debugPrint("tapped");
//             SnippetName? snippetName = node.rootNodeOfSnippet()?.name;
//             if (snippetName == null) return;
//             var cc = node.nodeWidgetGK?.currentContext;
// // edit the root snippet
//             hideAllSingleTargetBtns();
// // FlutterContent().capiBloc.add(const CAPIEvent.hideAllTargetGroupBtns());
// // FlutterContent().capiBloc.add(const CAPIEvent.hideTargetGroupsExcept());
//             removeAllNodeWidgetOverlays();
// // actually push node parent, then select node - more user-friendly
//             cc = node.nodeWidgetGK?.currentContext;
//             pushThenShowNamedSnippetWithNodeSelected(
//                 snippetName, node, node, context);
//             // Useful.afterNextBuildDo(() {
//             MaterialSPAState.showNodeWidgetOverlay(node);
//             // });
//           },
//           child: Container(
//             width: borderRect.width,
//             height: borderRect.height,
//             decoration: BoxDecoration(
// //color: Colors.purpleAccent.withOpacity(.1),
//               border: Border.all(
//                   width: 2,
//                   color: Colors.purpleAccent,
//                   style: BorderStyle.solid),
//             ),
//           ),
//         ),
//       ),
//       calloutConfig: CalloutConfig(
//         feature: '${node.nodeWidgetGK.hashCode}-pink-overlay',
//         suppliedCalloutW: borderRect.width + 6,
//         suppliedCalloutH: borderRect.height + 6,
//         initialCalloutPos: borderRect.topLeft.translate(-3, -3),
//         color: Colors.transparent,
//         arrowType: ArrowType.NO_CONNECTOR,
//         draggable: false,
//       ),
//       targetGkF: () => node.nodeWidgetGK,
//     );
//   }

  static Widget _lockIconButton() {
    return IconButton(
      key: MaterialSPA._lockIconGK,
      onPressed: () {
        Callout.showOverlay(
          targetGkF: () => MaterialSPA._lockIconGK,
          boxContentF: (ctx) => Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Useful.purpleText("Editor Access",
                  fontSize: 24, family: 'Merriweather'),
              SizedBox(
                width: 200,
                height: 100,
                child: TextEditor(
                  prompt: 'password',
                  originalS: '',
                  onTextChangedF: (s) {
                    if (s == "lakebeachocean") {
                      Callout.dismiss("EditorPassword");
                      FC().setCanEdit(true);
                      FC().capiBloc.add(const CAPIEvent.hideAllTargetGroups());
                      Useful.afterNextBuildDo(() {
                        FC()
                            .capiBloc
                            .add(const CAPIEvent.unhideAllTargetGroups());
                        showDevToolsButton();
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
}

class FABMenuAnchor extends StatefulWidget {
  const FABMenuAnchor({super.key});

  @override
  State<FABMenuAnchor> createState() => _FABMenuAnchorState();
}

class _FABMenuAnchorState extends State<FABMenuAnchor> {
  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      builder:
          (BuildContext context, MenuController controller, Widget? child) {
        return IconButton(
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          icon: const Icon(Icons.more_vert, color: Colors.white),
          tooltip: 'Show menu',
        );
      },
      menuChildren: [
        MenuItemButton(
          onPressed: () {
            FC()
                .capiBloc
                .add(const CAPIEvent.switchBranch(newBranchName: "staging"));
            Useful.afterNextBuildDo(() async {
              await FC.loadAppModel();
              await FC.loadLatestSnippetMap();
              FC().capiBloc.add(const CAPIEvent.forceRefresh());
              setState(() {});
            });
          },
          child: Text('staging'),
          trailingIcon: FC().appModel.currentBranchName != 'staging'
              ? null
              : Icon(Icons.check),
        ),
        MenuItemButton(
          onPressed: () {
            FC()
                .capiBloc
                .add(const CAPIEvent.switchBranch(newBranchName: "live"));
            Useful.afterNextBuildDo(() async {
              await FC.loadAppModel();
              await FC.loadLatestSnippetMap();
              FC().capiBloc.add(const CAPIEvent.forceRefresh());
              setState(() {});
            });
          },
          child: Text('live'),
          trailingIcon: FC().appModel.currentBranchName != 'live'
              ? null
              : Icon(Icons.check),
        ),
        MenuItemButton(
          onPressed: () => setState(() {}),
          child: Text('copy staging -> live'),
        ),
        MenuItemButton(
          onPressed: () => setState(() {}),
          child: Text('copy live -> staging'),
        ),
        MenuItemButton(
          onPressed: () => setState(
            () async {
              FC().setCanEdit(false);
              FC().capiBloc.add(const CAPIEvent.forceRefresh());
            },
          ),
          child: Text('sign out'),
        ),
      ],
    );
  }
}
