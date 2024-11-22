// ignore_for_file: camel_case_types

import 'dart:async';

import 'package:bh_shared/bh_shared.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/snippet_being_edited.dart';
import 'package:go_router/go_router.dart';
import 'package:routing_config_provider/routing_config_provider.dart';

// conditional import for webview ------------------
import 'register_ios_or_android_webview.dart' if (dart.library.html) 'register_web_webview.dart';
//--------------------------------------------------

/// this widget must enclose your MaterialApp, or CupertinoApp or WidgetsApp
/// so that the CAPIBloc becomes available to overlays, which are placed into
/// the app's overlay and not in your widget tree as you might have expected.
class FlutterContentApp extends StatefulWidget {
  final String appName;
  final String editorPassword;
  final String title;

  // final SnippetName pageSnippetName;
  final RoutingConfig webRoutingConfig;
  final RoutingConfig mobileRoutingConfig;
  final String initialRoutePath;
  final MaterialAppThemeFunc materialAppThemeF;
  final FirebaseOptions? fbOptions;
  final bool useEmulator;
  final bool useFBStorage;
  final Map<String, void Function(BuildContext)> namedVoidCallbacks = {};
  final Map<String, TextStyle> namedTextStyles;
  final Map<String, ButtonStyle> namedButtonStyles;
  final bool hideStatusBar;
  final VoidCallback? onReadyF;

  // --- globally available -----------------------------------------------------
  static CAPIBloC? _singletonBloc;

  static CAPIBloC get capiBloc => _singletonBloc!;

  static CAPIState get capiState => _singletonBloc!.state;

  static SnippetBeingEdited? get snippetBeingEdited => capiState.snippetBeingEdited;

  static STreeNode? get selectedNode => snippetBeingEdited?.selectedNode;

  static bool get showProperties => snippetBeingEdited?.showProperties ?? false;

  static bool get aNodeIsSelected => snippetBeingEdited?.selectedNode != null;

  // --- globally available -----------------------------------------------------

  // final IModelRepository? testModelRepo; // created in tests by a when(mockRepository.getCAPIModel(appName: appName...
  // final Widget? testWidget;

  // final bool localTestingFilePaths;

  FlutterContentApp({
    super.key,
    required this.appName,
    required this.editorPassword,
    this.title = '',
    // required this.pageSnippetName,
    // this.localTestingFilePaths = false,
    required this.webRoutingConfig,
    required this.mobileRoutingConfig,
    required this.materialAppThemeF,
    required this.initialRoutePath,
    this.fbOptions,
    this.useEmulator = false,
    this.useFBStorage = false,
    this.namedTextStyles = const {},
    this.namedButtonStyles = const {},
    this.hideStatusBar = true,
    // @visibleForTesting this.testModelRepo,
    // @visibleForTesting this.testWidget,
    this.onReadyF,
  });

  // static void removeAllPinkSnippetOverlays() {
  //   return;
  // for (String panelName in CAPIState.snippetPanelGkMap.keys) {
  //   fco.dismiss('$panelName-pink-overlay');
  //   fco.dismiss('$panelName-panel-name-callout');
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
  //     fco.logi('$panelName ${rect.toString()}');
  //     // overlay rect with a transparent pink rect, and a 3px surround
  //     fco.showOverlay(
  //       ensureLowestOverlay: true,
  //       calloutContentF: (context) => InkWell(
  //         onTap: () {
  //           String? snippetName = CAPIState.snippetPlacementMap[panelName];
  //           if (snippetName != null) {
  //             // edit the snippet
  //             hideAllSingleTargetBtns();
  //             // FCO.capiBloc.add(const CAPIEvent.hideAllTargetGroupBtns());
  //             // FCO.capiBloc.add(const CAPIEvent.hideTargetGroupsExcept());
  //             MaterialAppWrapper.removeAllPinkSnippetOverlays();
  //             FCO.capiBloc.add(CAPIEvent.pushSnippetBloc(snippetName: snippetName));
  //             fco.afterNextBuildDo(() {
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
  //         cId: '$panelName-pink-overlay',
  //         initialCalloutW: rect.width + 6,
  //         initialCalloutH: rect.height + 6,
  //         initialCalloutPos: rect.topLeft.translate(-3, -3),
  //         color: Colors.transparent,
  //         arrowType: ArrowType.NONE,
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
  //       fco.showOverlay(
  //         ensureLowestOverlay: true,
  //         calloutContentF: (context) => InkWell(
  //           onTap: () {
  //             // edit the snippet
  //             hideAllSingleTargetBtns();
  //             // FCO.capiBloc.add(const CAPIEvent.hideAllTargetGroupBtns());
  //             // FCO.capiBloc.add(const CAPIEvent.hideTargetGroupsExcept());
  //             MaterialAppWrapper.removeAllPinkSnippetOverlays();
  //             String? snippetName = CAPIState.snippetPlacementMap[panelName];
  //             if (snippetName != null) {
  //               FCO.capiBloc.add(CAPIEvent.pushSnippetBloc(snippetName: snippetName));
  //               fco.afterNextBuildDo(() {
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
  //           child: Center(child: FCO.coloredText('$panelName / $rootSnippetName', color: Colors.white)),
  //         ),
  //         calloutConfig: CalloutConfig(
  //           cId: '$panelName-panel-name-callout',
  //           initialCalloutW: 300,
  //           initialCalloutH: 30,
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

  static FlutterContentAppState? of(BuildContext context) => context.findAncestorStateOfType<FlutterContentAppState>();

  // static bool escKeyPressedZFor3Secs = false;

  @override
  State<FlutterContentApp> createState() => FlutterContentAppState();
}

// Ticker available for use by Callouts; i.e. vsync: MaterialAppWrapper.of(context)
class FlutterContentAppState extends State<FlutterContentApp> with TickerProviderStateMixin {
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
  //   fco.logi("didChangeDependencies");
  //   // FCO.refreshMQ(context);
  //   if (FCO.showingNodeOBoundaryOverlays??false) {
  //     FlutterContentAppState.removeAllNodeWidgetOverlays();
  //     FlutterContentAppState.exitEditMode();
  //     fco.afterMsDelayDo(1000, () {
  //               FC.forceRefresh();

  //       FlutterContentApp.snippetBeingEdited?.add(const SnippetEvent.forceSnippetRefresh());
  //       // FlutterContentAppState.showAllNodeWidgetOverlays(context);
  //     });
  //   }
  //   super.didChangeDependencies();
  // }

    // init FlutterContent, which keeps a single CAPIBloC and multiple SnippetBloCs
  Future<CAPIBloC> _initApp() async {
    debugPrint("_initApp() before init()");

    CAPIBloC capiBloc = await fco.init(
      appName: widget.appName,
      editorPassword: widget.editorPassword,
      fbOptions: widget.fbOptions,
      useEmulator: widget.useEmulator,
      useFBStorage: widget.useFBStorage,
      namedTextStyles: widget.namedTextStyles,
      namedButtonStyles: widget.namedButtonStyles,
      routingConfig: RoutingConfigProvider().getWebOrMobileRoutingConfig(
        widget.webRoutingConfig,
        widget.mobileRoutingConfig,
      ),
      initialRoutePath: widget.initialRoutePath,
    );
    debugPrint("_initApp() after");

    widget.onReadyF?.call();

    STreeNode.hideAllTargetCovers();
    // trigger another build
    // fco.afterNextBuildDo(() {
    //   fco.afterMsDelayDo(1000, () async {
    //     fco.logi('============================================================================');
    //     fco.logi('================   ${fco.appName}-${await fco.versionAndBuild}  ==========');
    //     fco.logi('============================================================================');
    //     fco.forceRefresh();
    //   });
    // });
    return FlutterContentApp._singletonBloc = capiBloc;
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
                routerConfig: fco.router,
                theme: widget.materialAppThemeF(),
                darkTheme: ThemeData.dark(),
                // themeMode: App.bloc.state.darkMode ? ThemeMode.dark : ThemeMode.light,
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
