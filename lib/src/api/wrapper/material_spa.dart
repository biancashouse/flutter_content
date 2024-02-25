// ignore_for_file: camel_case_types

import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/api/snippet_panel/callout_snippet_tree_and_proerties.dart';
import 'package:flutter_content/src/bloc/capi_event.dart';
import 'package:flutter_content/src/bloc/snippet_event.dart';
import 'package:flutter_content/src/home_page_provider/home_page_provider.dart';
import 'package:flutter_content/src/model/firestore_model_repo.dart';
import 'package:flutter_content/src/model/model_repo.dart';
import 'package:flutter_content/src/target_config/content/snippet_editor/clipboard_view.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
// import 'package:youtube_player_iframe/youtube_player_iframe.dart';

// conditional import for webview ------------------
import 'register_ios_or_android_webview.dart' if (dart.library.html) 'register_web_webview.dart';
//--------------------------------------------------

/// this widget must enclose your MaterialApp, or CupertinoApp or WidgetsApp
/// so that the CAPIBloc becomes available to overlays, which are placed into
/// the app's overlay and not in your widget tree as you might have expected.
class MaterialSPA extends StatefulWidget {
  final String appName;

  // final SnippetName pageSnippetName;
  final String? initialValueJsonAssetPath;
  final Widget? webHome;
  final Widget? mobileHome;
  final MaterialAppThemeFunc materialAppThemeF;
  final FirebaseOptions? fbOptions;
  final Map<String, NamedTextStyle> namedStyles;
  final bool hideStatusBar;
  final IModelRepository? testModelRepo; // created in tests by a when(mockRepository.getCAPIModel(appName: appName...
  final Widget? testWidget;

  // final bool localTestingFilePaths;

  const MaterialSPA({
    required this.appName,
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
    super.key,
  });

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
  //     print('$panelName ${rect.toString()}');
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

  static MaterialSPAState? of(BuildContext context) => context.findAncestorStateOfType<MaterialSPAState>();

  // static bool escKeyPressedZFor3Secs = false;
  static final inEditMode = ValueNotifier<bool>(false);

  @override
  State<MaterialSPA> createState() => MaterialSPAState();
}

// Ticker available for use by Callouts; i.e. vsync: MaterialAppWrapper.of(context)
class MaterialSPAState extends State<MaterialSPA> with TickerProviderStateMixin {
  FireStoreModelRepository fbModelRepo = FireStoreModelRepository();
  late Future<CAPIBloC> fInitApp;
  bool _inited = false;
  int tapCount = 0;
  DateTime? lastTapTime;
  // YoutubePlayerController? ytController;

  @override
  void initState() {
    super.initState();

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

  // cannot initWithContext() here - see transformable_widget_wrapper.dart and widget_wrapper.dart
  // @override
  // void didChangeDependencies() {
  //   Useful.instance.initWithContext(context, force: true);
  //   super.didChangeDependencies();
  // }

  Future<CAPIBloC> _initApp() async {
    Map<String, TargetConfig> singleTargetMap = {};
    late Map<String, TargetGroupConfig>? targetGroupMap;
    late Map<String, SnippetRootNode> snippetsMap;
    late CAPIModel model;

    if (widget.testModelRepo == null) {
      if (widget.fbOptions != null) {
        await fbModelRepo.initFireStore(options: widget.fbOptions);

        // if (kReleaseMode) {
        //   // read from json file asset
        //   if (widget.initialValueJsonAssetPath != null) {
        //     try {
        //       String configFileS = await rootBundle.loadString(widget.initialValueJsonAssetPath!, cache: false);
        //       model = CAPIModel.fromJson(json.decode(configFileS));
        //     } catch (e) {
        //       // failed to read json asset - ignore
        //     }
        //   }
        // }

        // ensure hydrated storage initialised
        try {
          HydratedBloc.storage;
        } catch (e) {
          // init local storage access
          var dir = kIsWeb ? HydratedStorage.webStorageDirectory : await getTemporaryDirectory();
          HydratedBloc.storage = await HydratedStorage.build(
            storageDirectory: dir,
          );
        }

        //possibly init firebase, then read model
        // try to read model from firebase
        // print("getFBModel()...");
        CAPIModel? fbModel;

        if (widget.fbOptions != null) {
          model = await fbModelRepo.getCAPIModel(appName: widget.appName) ?? CAPIModel(appName: widget.appName);
        }

        // // print("getFBModel() returned ${fbModel.toString()}");
        // // if can't get model from FB, try localstorage
        // if (fbModel == null) {
        //   var modelJson = HydratedBloc.storage.read("flutter-content");
        //   if (modelJson != null) {
        //     try {
        //       Map<String, dynamic> decoded = jsonDecode(modelJson);
        //       model = CAPIModel.fromJson(decoded);
        //     } catch (e) {
        //       targetGroupMap = {};
        //       snippetsMap = {};
        //     }
        //   }
        // } else {
        //   model = fbModel;
        // }
      }
    } else {
      // widget testing repo should  supply a model via a when(mockRepository.getCAPIModel(appName: appName...
      model = await widget.testModelRepo?.getCAPIModel(appName: widget.appName) ?? CAPIModel(appName: widget.appName);
    }

    targetGroupMap = _parseTargetGroups(model);
    for (TargetGroupConfig tgConfig in targetGroupMap.values) {
      for (TargetConfig tc in tgConfig.targets) {
        tc.single = false;
      }
    }
    // imageTargetListMap.values.forEach((TargetGroupConfig? mtconfig) => mtconfig?.imageTargets.forEach((tc) => tc.single = false));
    singleTargetMap = model.targetConfigs;
    for (TargetConfig tc in singleTargetMap.values) {
      tc.single = true;
    }
    // singleTargetMap.values.forEach((tc) => tc.single = true);

    // DirectoryNode rootDirectoryNode = model.jsonRootDirectoryNode != null
    //     ? NodeMapper.fromJson(model.jsonRootDirectoryNode!) as DirectoryNode
    //     : DirectoryNode(name: 'root', children: []);

    FC().lastSavedModelJson = jsonEncode(model.toJson());

    CAPIBloC capiBloc = CAPIBloC(
      modelRepo: fbModelRepo,
      appName: widget.appName,
      // useFirebase: GetIt.I.isRegistered<FirebaseFirestore>(),
      // localTestingFilePaths: widget.localTestingFilePaths,
      targetGroupMap: targetGroupMap,
      singleTargetMap: singleTargetMap,
      // jsonRootDirectoryNode: model.jsonRootDirectoryNode,
      jsonClipboard: model.jsonClipboard,
      // snippetsMap: snippetsMap,
    );

    // init FlutterContent, which keeps a single CAPIBloC and multiple SnippetBloCs
    FC().init(
      capiBloc: capiBloc,
      snippetsMap: parseSnippetJsons(model),
      namedStyles: widget.namedStyles,
    );

    // ytController = YoutubePlayerController.fromVideoId(
    //   videoId: 'zWh3CShX_do',
    //   autoPlay: false,
    //   params: const YoutubePlayerParams(showFullscreenButton: true),
    // );

    return capiBloc;
  }

  @override
  Widget build(BuildContext context) => Builder(builder: (context) {
        return FutureBuilder<CAPIBloC>(
          future: fInitApp,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
              print("done (has data)");
              // create the clipboard overlay and hide
              // start the app with the main bloC
              if (!_inited) {
                Useful.afterNextBuildDo(() {
                  _showFloatingClipboard();
                  Callout.hide("floating-clipboard");
                  print("showDevToolsButton");
                  showDevToolsButton(context);
                });
                _inited = true;
              }
              return BlocProvider<CAPIBloC>(
                create: (BuildContext context) => snapshot.data!,
                child: MaterialApp(
                  theme: widget.materialAppThemeF(),
                  debugShowCheckedModeBanner: false,
                  scrollBehavior: const ConstantScrollBehavior(),
                  home: RawKeyboardListener(
                    autofocus: true,
                    focusNode: FocusNode(), // <-- more magic
                    onKey: (event) => _enterOrExitEditMode(event, lastTapTime, tapCount),
                    child: Builder(builder: (context) {
                      Useful.instance.initWithContext(context);
                      return widget.testWidget != null
                          ? widget.testWidget!
                          : widget.webHome != null && widget.mobileHome != null
                              ? HomePageProvider().getWebOrMobileHomePage(widget.webHome!, widget.mobileHome!)
                              : const Icon(
                                  Icons.error_outlined,
                                  color: Colors.red,
                                  size: 40,
                                );
                    }),
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
  //             print("_CAPIAppWrapperState onNotification: ${notification.toString()}");
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
  //                           print("MaterialAppWrapper => MaterialApp");
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

  Map<String, TargetGroupConfig> _parseTargetGroups(CAPIModel model) {
    Map<String, TargetGroupConfig> imageTargetListMap = {};
    if (model.targetGroupConfigs.isNotEmpty) {
      try {
        for (String name in model.targetGroupConfigs.keys) {
          TargetGroupConfig? imageConfig = model.targetGroupConfigs[name];
          if (imageConfig != null && imageConfig.targets.isNotEmpty) {
            imageTargetListMap[name] = imageConfig;
          }
        }
      } catch (e) {
        print("_parseImageTargets(): ${e.toString()}");
        rethrow;
      }
    }
    return imageTargetListMap;
  }

// Map<String, TargetConfig> _parseSingleTargets(CAPIModel model) {
// Map<String, TargetConfig> singleTargetListMap = {};
//   if (model.singleConfigs.isNotEmpty) {
//     try {
//       for (String wName in model.singleConfigs.keys ?? []) {
//         TargetConfig? tc = model.singleConfigs[wName];
//         if (tc != null) {
//           tc.single = true;
//           tcs[wName] = tc;
//         }
//       }
//     } catch (e) {
//       print("_parseWidgetTargets(): ${e.toString()}");
//       rethrow;
//     }
//   }
//   return singleTargetListMap;
// }

// void _initImageTargets(CAPIBloc capiBloc) {
//   Map<String, CAPITargetConfigList> imageTargetListMap = capiBloc.state.imageTargetListMap;
//   if (imageTargetListMap.isNotEmpty) {
//     try {
//       for (CAPITargetConfigList imageConfig in imageTargetListMap.values) {
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
//       print("_initTargets(): ${e.toString()}");
//       rethrow;
//     }
//   }
// }

  static Map<SnippetName, SnippetRootNode> parseSnippetJsons(CAPIModel model) {
    Map<SnippetName, SnippetRootNode> snippetMap = {};
    try {
      for (String snippetJson in model.snippetEncodedJsons.values) {
        SnippetRootNode rootNode = SnippetRootNodeMapper.fromJson(snippetJson);
        snippetMap[rootNode.name] = rootNode..validateTree();
      }
    } catch (e) {
      print("_parseSnippetJsons(): ${e.toString()}");
      // rethrow;
    }
    return snippetMap;
  }

  static void showDevToolsButton(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Callout.showOverlay(
        boxContentF: (context) => FloatingActionButton.large(
              tooltip: 'highlight snippets\nfor editing',
              elevation: 6,
              onPressed: () async {
                MaterialSPAState? rootState = MaterialSPA.of(context);
                if (rootState != null) {
                  enterEditMode(rootState.context);
                }
              },
              child: const Icon(
                Icons.search,
                //color: Colors.purpleAccent,
                size: 30,
              ),
            ),
        calloutConfig: CalloutConfig(
          feature: "editMode-FAB",
          suppliedCalloutW: 60,
          suppliedCalloutH: 60,
          initialCalloutPos: FC().editModeBtnPos(context),
          color: MaterialSPA.inEditMode.value ? Colors.purple : Colors.white,
          arrowType: ArrowType.NO_CONNECTOR,
          circleShape: true,
          onDragEndedF: (newPos) => FC().setEditModeBtnPos(newPos),
        ));
  }

  void _showFloatingClipboard() {
    Size screenSize = MediaQuery.of(context).size;
    Callout.showOverlay(
        boxContentF: (context) => ClipboardView(),
        calloutConfig: CalloutConfig(
          feature: "floating-clipboard",
          suppliedCalloutW: 300,
          suppliedCalloutH: 180,
          initialCalloutPos: Offset(screenSize.width - 400, 0),
          color: Colors.transparent,
          arrowType: ArrowType.NO_CONNECTOR,
          roundedCorners: 16,
        ));
  }

  static enterEditMode(BuildContext context) {
    Callout.dismiss("editMode-FAB");
    MaterialSPA.inEditMode.value = true;
    showAllNodeWidgetOverlays(context);
    hideAllSingleTargetBtns();
    // FC().capiBloc.add(const CAPIEvent.forceRefresh());
  }

  static exitEditMode() {
    MaterialSPA.inEditMode.value = false;
    removeAllNodeWidgetOverlays();
    String feature = FC().snippetBeingEdited?.rootNode.name ?? "snippet name ?!";
    if (Callout.anyPresent([feature])) {
      Callout.dismiss(feature);
    }
    if (Useful.cachedContext != null) {
      showDevToolsButton(Useful.cachedContext!);
    }
    FC().capiBloc.add(const CAPIEvent.popSnippetBloc());
    unhideAllSingleTargetBtns();
    // FC().capiBloc.add(const CAPIEvent.forceRefresh());
  }

  _enterOrExitEditMode(RawKeyEvent event, DateTime? lastTapTime, int tapCount) {
    bool isEsc = event.logicalKey == LogicalKeyboardKey.escape;
    if (!MaterialSPA.inEditMode.value && (event.isControlPressed || event.isAltPressed || event.isShiftPressed) && isEsc && event is RawKeyUpEvent) {
      enterEditMode(context);
    } else if (MaterialSPA.inEditMode.value && isEsc) {
      exitEditMode();
    }
  }

  // only called with MaterialAppWrapper context
  static void showAllNodeWidgetOverlays(context) {
    var gkSTreeNodeMap = FC().gkSTreeNodeMap;
    void traverseAndMeasure(BuildContext el) {
      if (gkSTreeNodeMap.containsKey(el.widget.key)) {
        GlobalKey gk = el.widget.key as GlobalKey;
        STreeNode? node = gkSTreeNodeMap[gk];
        if (node != null) {
// measure node
          Rect? r = gk.globalPaintBounds(skipWidthConstraintWarning: true, skipHeightConstraintWarning: true);
          print('${node.runtimeType.toString()} - size: (${r != null ? r.size.toString() : ""})');
          // node.setParent(parent);
          // parent = node;
          _showNodeWidgetOverlay(node, r!);
        }
      }
      el.visitChildElements((innerEl) {
        traverseAndMeasure(innerEl);
      });
    }

    traverseAndMeasure(context);
  }

  // only called with MaterialAppWrapper context
  static void showNodeWidgetOverlay(STreeNode node) {
    Rect? r = node.nodeWidgetGK?.globalPaintBounds(skipWidthConstraintWarning: true, skipHeightConstraintWarning: true);
    if (r != null) {
      removeAllNodeWidgetOverlays();
      _showNodeWidgetOverlay(node, r, tappable: false, below: true);
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
    for (GlobalKey nodeWidgetGK in FC().gkSTreeNodeMap.keys) {
      Callout.dismiss('${nodeWidgetGK.hashCode}-pink-overlay');
    }
  }

  // node is where the snippet tree starts (not necc the snippet's root node)
  // selection is poss a current (lower) selection in the tree
  static void pushThenShowNamedSnippetWithNodeSelected(SnippetName snippetName, STreeNode startingAtNode, STreeNode? selectedNode) {
    STreeNode? highestNode;
    if (startingAtNode is ScaffoldNode) {
      highestNode = startingAtNode;
    } else {
      highestNode = (startingAtNode.parent ?? startingAtNode) as STreeNode;
    }
    var cc = startingAtNode.nodeWidgetGK?.currentContext;
    FC().capiBloc.add(CAPIEvent.pushSnippetBloc(snippetName: snippetName, visibleDecendantNode: highestNode));
    Useful.afterNextBuildDo(() {
      var cc = startingAtNode.nodeWidgetGK?.currentContext;
      SnippetBloC? snippetBeingEdited = FC().snippetBeingEdited;
      if (FC().snippetBeingEdited != null) {
        // currCtx = startingAtNode.nodeWidgetGK?.currentContext;
        showSnippetTreeAndPropertiesCallout(
          snippetBloc: snippetBeingEdited!,
          targetGKF: () => startingAtNode.nodeWidgetGK,
          onDismissedF: () {
// CAPIState.snippetStateMap[snippetBloc.snippetName] = snippetBloc.state;
            STreeNode.unhighlightSelectedNode();
            Callout.dismiss('selected-panel-border-overlay');
            FC().capiBloc.add(const CAPIEvent.unhideAllTargetGroups());
            FC().capiBloc.add(const CAPIEvent.popSnippetBloc());
// removeNodePropertiesCallout();
            Callout.dismiss(TREENODE_MENU_CALLOUT);
            MaterialSPAState.exitEditMode();
            if (snippetBeingEdited.state.canUndo()) {
              FC().capiBloc.add(const CAPIEvent.saveModel());
            }
          },
        );
// select node
        snippetBeingEdited.add(SnippetEvent.selectNode(
          node: selectedNode ?? startingAtNode,
          selectedWidgetGK: GlobalKey(debugLabel: 'selectedWidgetGK'),
          selectedTreeNodeGK: GlobalKey(debugLabel: 'selectedTreeNodeGK'),
// imageTC: tc,
        ));
// var nodeCtx = node.nodeWidgetGK?.currentContext;
// Scrollable.ensureVisible(context);
      }
    });
  }

  static void _showNodeWidgetOverlay(STreeNode node, Rect r, {bool tappable = true, bool below = false}) {
// overlay rect with a transparent pink rect, and a 3px surround
    const int BORDER = 3;
    double borderLeft = max(r.left - 3, 0);
    double borderTop = max(r.top - 3, 0);
    double borderRight = min(Useful.scrW, r.right + BORDER * 2);
    double borderBottom = min(Useful.scrH, r.bottom + BORDER * 2);
    Rect borderRect = Rect.fromLTRB(borderLeft, borderTop, borderRight, borderBottom);
    Callout.showOverlay(
      ensureLowestOverlay: below,
      boxContentF: (context) => PointerInterceptor(
        child: tappable
            ? InkWell(
                onTap: () {
                  print("tapped");
                  String? snippetName = STreeNode.rootNodeOfSnippet(node)?.name;
                  if (snippetName == null) return;
                  var cc = node.nodeWidgetGK?.currentContext;
// edit the root snippet
                  hideAllSingleTargetBtns();
// FlutterContent().capiBloc.add(const CAPIEvent.hideAllTargetGroupBtns());
// FlutterContent().capiBloc.add(const CAPIEvent.hideTargetGroupsExcept());
                  removeAllNodeWidgetOverlays();
// actually push node parent, then select node - more user-friendly
                  cc = node.nodeWidgetGK?.currentContext;
                  pushThenShowNamedSnippetWithNodeSelected(snippetName, node, node);
                  // Useful.afterNextBuildDo(() {
                  MaterialSPAState.showNodeWidgetOverlay(node);
                  // });
                },
                child: Container(
                  width: borderRect.width,
                  height: borderRect.height,
                  decoration: BoxDecoration(
//color: Colors.purpleAccent.withOpacity(.1),
                    border: Border.all(width: 2, color: Colors.purpleAccent, style: BorderStyle.solid),
                  ),
                ),
              )
            : Container(
                width: borderRect.width,
                height: borderRect.height,
                decoration: BoxDecoration(
//color: Colors.purpleAccent.withOpacity(.1),
                  border: Border.all(width: 2, color: Colors.purpleAccent, style: BorderStyle.solid),
                ),
              ),
      ),
      calloutConfig: CalloutConfig(
        feature: '${node.nodeWidgetGK.hashCode}-pink-overlay',
        suppliedCalloutW: borderRect.width + 6,
        suppliedCalloutH: borderRect.height + 6,
        initialCalloutPos: borderRect.topLeft.translate(-3, -3),
        color: Colors.transparent,
        arrowType: ArrowType.NO_CONNECTOR,
        draggable: false,
      ),
      targetGkF: () => node.nodeWidgetGK,
    );
  }
}
