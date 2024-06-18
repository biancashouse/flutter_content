// ignore_for_file: camel_case_types

import 'dart:async';

import 'package:bh_shared/bh_shared.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_state.dart';
import 'package:flutter_content/src/bloc/snippet_being_edited.dart';
import 'package:go_router/go_router.dart';

// conditional import for webview ------------------
import 'register_ios_or_android_webview.dart' if (dart.library.html) 'register_web_webview.dart';
//--------------------------------------------------

/// this widget must enclose your MaterialApp, or CupertinoApp or WidgetsApp
/// so that the CAPIBloc becomes available to overlays, which are placed into
/// the app's overlay and not in your widget tree as you might have expected.
class MaterialSPA extends StatefulWidget {
  final String appName;
  final String title;

  // final SnippetName pageSnippetName;
  final RoutingConfig webRoutingConfig;
  final RoutingConfig mobileRoutingConfig;
  final String initialRoutePath;
  final MaterialAppThemeFunc materialAppThemeF;
  final FirebaseOptions? fbOptions;
  final Map<String, VoidCallback> namedVoidCallbacks;
  final Map<String, TextStyle> namedTextStyles;
  final Map<String, ButtonStyle> namedButtonStyles;
  final bool hideStatusBar;

  // --- globally available -----------------------------------------------------
  static CAPIBloC? _singletonBloc;

  static CAPIBloC get capiBloc => _singletonBloc!;

  static CAPIState get capiState => _singletonBloc!.state;

  static SnippetBeingEdited? get snippetBeingEdited => capiState.snippetBeingEdited;

  static STreeNode? get selectedNode => snippetBeingEdited?.selectedNode;

  static SnippetRootNode? get rootNode => snippetBeingEdited?.rootNode;

  static bool get showProperties => snippetBeingEdited?.showProperties ?? false;

  static bool get aNodeIsSelected => snippetBeingEdited?.selectedNode != null;

  // --- globally available -----------------------------------------------------

  // final IModelRepository? testModelRepo; // created in tests by a when(mockRepository.getCAPIModel(appName: appName...
  // final Widget? testWidget;

  // final bool localTestingFilePaths;

  const MaterialSPA({
    super.key,
    required this.appName,
    this.title = '',
    // required this.pageSnippetName,
    // this.localTestingFilePaths = false,
    required this.webRoutingConfig,
    required this.mobileRoutingConfig,
    required this.materialAppThemeF,
    required this.initialRoutePath,
    this.fbOptions,
    this.namedVoidCallbacks = const {},
    this.namedTextStyles = const {},
    this.namedButtonStyles = const {},
    this.hideStatusBar = true,
    // @visibleForTesting this.testModelRepo,
    // @visibleForTesting this.testWidget,
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
  //             FC().afterNextBuildDo(() {
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
  //               FC().afterNextBuildDo(() {
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
  //           child: Center(child: FC().coloredText('$panelName / $rootSnippetName', color: Colors.white)),
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

  @override
  State<MaterialSPA> createState() => MaterialSPAState();
}

// Ticker available for use by Callouts; i.e. vsync: MaterialAppWrapper.of(context)
class MaterialSPAState extends State<MaterialSPA> with TickerProviderStateMixin {
  late Future<CAPIBloC> fInitApp;
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

  // @override
  // void didChangeDependencies() {
  //   debugPrint("didChangeDependencies");
  //   // FC().refreshMQ(context);
  //   if (FC().showingNodeOBoundaryOverlays??false) {
  //     MaterialSPAState.removeAllNodeWidgetOverlays();
  //     MaterialSPAState.exitEditMode();
  //     FC().afterMsDelayDo(1000, () {
  //               FC.forceRefresh();

  //       MaterialSPA.snippetBeingEdited?.add(const SnippetEvent.forceSnippetRefresh());
  //       // MaterialSPAState.showAllNodeWidgetOverlays(context);
  //     });
  //   }
  //   super.didChangeDependencies();
  // }

  // init FlutterContent, which keeps a single CAPIBloC and multiple SnippetBloCs
  Future<CAPIBloC> _initApp() async {
    CAPIBloC capiBloc = await FContent().init(
      modelName: widget.appName,
      fbOptions: widget.fbOptions,
      namedVoidCallbacks: widget.namedVoidCallbacks,
      namedTextStyles: widget.namedTextStyles,
      namedButtonStyles: widget.namedButtonStyles,
      routingConfig: RoutingConfigProvider().getWebOrMobileRoutingConfig(
        widget.webRoutingConfig,
        widget.mobileRoutingConfig,
      ),
      initialRoutePath: widget.initialRoutePath,
    );
    STreeNode.hideAllTargetCovers();
    // trigger another build
    FContent().afterNextBuildDo(() {
      FContent().afterMsDelayDo(1000, () async {
        debugPrint('============================================================================');
        debugPrint('================   ${FContent().appName}-${await FContent().versionAndBuild}  ==========');
        debugPrint('============================================================================');
        FContent.forceRefresh();
      });
    });
    return MaterialSPA._singletonBloc = capiBloc;
  }

  // ytController = YoutubePlayerController.fromVideoId(
  //   videoId: 'zWh3CShX_do',
  //   autoPlay: false,
  //   params: const YoutubePlayerParams(showFullscreenButton: true),
  // );

  @override
  Widget build(context) {
    return FutureBuilder<CAPIBloC>(
        future: fInitApp,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            return BlocProvider<CAPIBloC>(
              create: (BuildContext context) => snapshot.data!,
              child: MaterialApp.router(
                routerConfig: FContent().router,
                theme: widget.materialAppThemeF(),
                debugShowCheckedModeBanner: false,
                title: widget.title,
                scrollBehavior: const ConstantScrollBehavior(),
              ),
            );
          } else {
            return const Offstage();
          }
          // TESTING ONLY
        });
  }
}
