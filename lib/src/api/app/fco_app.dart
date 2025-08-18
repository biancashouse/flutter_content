// ignore_for_file: camel_case_types

import 'dart:async';

import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_callouts/flutter_callouts.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:go_router/go_router.dart';

// conditional import for webview ------------------
import 'register_ios_or_android_webview.dart'
    if (dart.library.html) 'register_web_webview.dart';

/// this widget must enclose your MaterialApp, or CupertinoApp or WidgetsApp
/// so that the CAPIBloc becomes available to overlays, which are placed into
/// the app's overlay and not in your widget tree as you might have expected.
class FlutterContentApp extends StatefulWidget {
  final String appName;
  final List<String> editorPasswords;
  final String title;

  // final SnippetName pageSnippetName;
  final MaterialAppThemeFunc materialAppThemeF;
  final FirebaseOptions? fbOptions;
  final bool useEmulator;
  final bool useFBStorage;
  final Map<String, void Function(BuildContext)>? namedVoidCallbacks;
  final bool hideStatusBar;
  final VoidCallback? onReadyF;
  final VoidCallback? alsoInitF;

  final RoutingConfig? routingConfig;
  final String? initialRoutePath;

  final Widget? home;

  // // --- globally available -----------------------------------------------------
  // static CAPIBloC? _singletonBloc;
  //
  // static CAPIBloC? get capiBloc {
  //   assert(
  //     _singletonBloc != null,
  //     "FlutterContentApp's CAPIBloc has not been initialized. Ensure FlutterContentApp is at the root of your widget tree and has completed its setup.",
  //   );
  //   return _singletonBloc!;
  // }

  // --- globally available -----------------------------------------------------

  // final IModelRepository? testModelRepo; // created in tests by a when(mockRepository.getCAPIModel(appName: appName...
  // final Widget? testWidget;

  // final bool localTestingFilePaths;

  FlutterContentApp.router({
    super.key,
    required this.appName,
    required this.editorPasswords,
    this.title = '',
    required this.routingConfig,
    required this.initialRoutePath,
    this.home,
    required this.materialAppThemeF,
    this.fbOptions,
    this.useEmulator = false,
    this.useFBStorage = false,
    this.hideStatusBar = true,
    // @visibleForTesting this.testModelRepo,
    // @visibleForTesting this.testWidget,
    this.onReadyF,
    this.alsoInitF,
    this.namedVoidCallbacks,
  });

  FlutterContentApp({
    super.key,
    required this.appName,
    required this.editorPasswords,
    this.title = '',
    this.routingConfig,
    this.initialRoutePath,
    required this.home,
    required this.materialAppThemeF,
    this.fbOptions,
    this.useEmulator = false,
    this.useFBStorage = false,
    this.hideStatusBar = true,
    // @visibleForTesting this.testModelRepo,
    // @visibleForTesting this.testWidget,
    this.onReadyF,
    this.alsoInitF,
    this.namedVoidCallbacks,
  });

  static FlutterContentAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<FlutterContentAppState>();

  // static bool escKeyPressedZFor3Secs = false;

  @override
  State<FlutterContentApp> createState() => FlutterContentAppState();
}

// Ticker available for use by Callouts; i.e. vsync: MaterialAppWrapper.of(context)
class FlutterContentAppState extends State<FlutterContentApp>
    with TickerProviderStateMixin {
  late Future<CAPIBloC?> fInitApp;
  int tapCount = 0;
  DateTime? lastTapTime;

  // YoutubePlayerController? ytController;

  @override
  void initState() {
    super.initState();

    // if (kReleaseMode) {
    //   // don't log anything below warning in production
    //   Logger.root.level = Level.WARNING;
    // }
    // Logger.root.onRecord.listen((record) {
    //   fco.logger.d('${record.level.name}: ${record.time}'
    //       '${record.loggerName}: ${record.message}');
    // });

    if (widget.hideStatusBar) {
      // fco.logger.i('hiding status bar');
      // https://medium.com/@mustafatahirhussein/these-quick-tips-will-surely-help-you-to-build-a-better-flutter-app-6db93c1095b6
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
      );
    } else {
      fco.logger.i('going full screen');
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }

    if (kIsWeb) {
      BrowserContextMenu.disableContextMenu();
    }

    // see conditional imports for web or mobile
    registerWebViewImplementation();

    fInitApp = _initApp();
  }

  @override
  void dispose() {
    if (kIsWeb) {
      BrowserContextMenu.enableContextMenu();
    }
    super.dispose();
  }

  // init FlutterContent, which keeps a single CAPIBloC and multiple SnippetBloCs
  Future<CAPIBloC?> _initApp() async {
    // If a bloc already exists due to a previous initialization (perhaps after hot restart
    // where the static variable persisted but the widget state re-initialized).
    try {
      return fco.capiBloc;
    } catch (e) {
      var capiBloc = await fco.init(
        appName: widget.appName,
        editorPasswords: widget.editorPasswords,
        fbOptions: widget.fbOptions,
        useEmulator: widget.useEmulator,
        useFBStorage: widget.useFBStorage,
        routingConfig: widget.routingConfig,
        initialRoutePath: widget.initialRoutePath,
      );
      widget.onReadyF?.call();
      SNode.hideAllTargetCovers();
      widget.alsoInitF?.call();
      return capiBloc;
    }
  }

  // ytController = YoutubePlayerController.fromVideoId(
  //   videoId: 'zWh3CShX_do',
  //   autoPlay: false,
  //   params: const YoutubePlayerParams(showFullscreenButton: true),
  // );

  @override
  Widget build(context) {
    return FutureBuilder<CAPIBloC?>(
      future: fInitApp,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return BlocProvider<CAPIBloC>(
            create: (BuildContext context) => snapshot.data!,
            child: widget.routingConfig != null
                ? MaterialApp.router(
                    // following line not valid for router;
                    // instead pass navigatorKey: fco.globalNavigatorKey
                    // to GoRouter.routingConfig()
                    routerConfig: fco.router,
                    theme: widget.materialAppThemeF(),
                    darkTheme: ThemeData(
                      brightness: Brightness.light,
                      primarySwatch: Colors.purple,
                      // ... other dark theme properties
                      scaffoldBackgroundColor: Colors.black54,
                      // Example
                      textTheme: TextTheme(
                        bodyMedium: TextStyle(color: Colors.black87),
                      ),
                      appBarTheme: AppBarTheme(
                        backgroundColor: Colors.grey[850],
                      ),
                    ),
                    debugShowCheckedModeBanner: false,
                    title: widget.title,
                    scrollBehavior: const ConstantScrollBehavior(),
                  )
                : MaterialApp(
                    navigatorKey: fco.globalNavigatorKey,
                    home: widget.home,
                    theme: widget.materialAppThemeF(),
                    darkTheme: ThemeData(
                      brightness: Brightness.light,
                      primarySwatch: Colors.purple,
                      // ... other dark theme properties
                      scaffoldBackgroundColor: Colors.black54,
                      // Example
                      textTheme: TextTheme(
                        bodyMedium: TextStyle(color: Colors.black87),
                      ),
                      appBarTheme: AppBarTheme(
                        backgroundColor: Colors.grey[850],
                      ),
                    ),
                    debugShowCheckedModeBanner: false,
                    title: widget.title,
                    scrollBehavior: const ConstantScrollBehavior(),
                  ),
          );
        } else {
          return const Offstage();
        }
        // TESTING ONLY
      },
    );
  }
}
