// ignore_for_file: camel_case_types

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_content/flutter_content.dart';

/// this widget must enclose your MaterialApp, or CupertinoApp or WidgetsApp
/// so that the CAPIBloc becomes available to overlays, which are placed into
/// the app's overlay and not in your widget tree as you might have expected.
class Admin extends StatefulWidget {
  final String appName;
  final FirebaseOptions fbOptions;
  final VoidCallback? onReadyF;

  // // --- globally available -----------------------------------------------------
  // static CAPIBloC? _singletonBloc;
  //
  // static CAPIBloC get capiBloc => _singletonBloc!;
  //
  // static CAPIState get capiState => _singletonBloc!.state;

  const Admin({
    super.key,
    required this.appName,
    required this.fbOptions,
    this.onReadyF,
  });

  @override
  State<Admin> createState() => AdminState();
}

// Ticker available for use by Callouts; i.e. vsync: MaterialAppWrapper.of(context)
class AdminState extends State<Admin>
    with TickerProviderStateMixin {
  late Future<void> fInitApp;

  // YoutubePlayerController? ytController;

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    if (kIsWeb) {
      BrowserContextMenu.disableContextMenu();
    }

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
  Future<void> _initApp() async {
    await adminInit(
      appName: widget.appName,
      fbOptions: widget.fbOptions,
    );

    widget.onReadyF?.call();

    // return Page_FirestoreAdmin._singletonBloc = capiBloc;
  }

  @override
  Widget build(context) {
    return FutureBuilder<void>(
      future: fInitApp,
      builder: (context, snapshot) {
        return Offstage(
          offstage:
              snapshot.connectionState != ConnectionState.done ||
              !snapshot.hasData,
          child: MaterialApp(
              darkTheme: ThemeData.dark(),
              // themeMode: App.bloc.state.darkMode ? ThemeMode.dark : ThemeMode.light,
              debugShowCheckedModeBanner: false,
              title: 'Firestore Admin',
          ),
        );
      },
    );
  }

  Future<void> adminInit({
    required String appName,
    required FirebaseOptions fbOptions,
  }) async {

    var modelRepo = FireStoreModelRepository(fbOptions);
    await modelRepo.possiblyInitFireStoreRelatedAPIs(useEmulator: false);

    // fetch model
    AppInfoModel? fbAppInfo = await modelRepo.getAppInfo();
  }

}
