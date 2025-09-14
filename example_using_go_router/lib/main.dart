import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:window_manager/window_manager.dart';
import 'pages/routes_config.dart';
import 'bh-apps.firebase_options.dart';

void disableOverflowErrors() {
  FlutterError.onError = (FlutterErrorDetails details) {
    final exception = details.exception;
    final isOverflowError =
        exception is FlutterError &&
        !exception.diagnostics.any(
          (e) => e.value.toString().startsWith("A RenderFlex overflowed by"),
        );

    if (isOverflowError) {
      fco.logger.d(details.toString());
    } else {
      FlutterError.presentError(details);
    }
  };
}

void main({bool useEmulator = false}) {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      if (fco.isMac || fco.isWindows) {
        await windowManager.ensureInitialized();

        // Define the window options
        WindowOptions windowOptions = const WindowOptions(
          size: Size(1280, 1190),
          // Set your desired width and height
          center: true,
          // Center the window on the screen
          backgroundColor: Colors.transparent,
          skipTaskbar: false,
          titleBarStyle: TitleBarStyle.normal,
          title: "My Awesome Flutter App", // Optional: Set a window title
        );

        // Wait until the window is ready to show, then apply options and show
        windowManager.waitUntilReadyToShow(windowOptions, () async {
          await windowManager.show();
          await windowManager.focus();
        });
      }

      debugProfileBuildsEnabledUserWidgets = true;

      disableOverflowErrors();

      runApp(
        FlutterContentApp.router(
          appName: 'flutter-content-example',
          // use web, mobile or desktop routingConfig defined in your routes_config.dart
          routingConfig: webRoutingConfig,
          initialRoutePath: '/',
          materialAppThemeF: () => ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            primaryColor: fco.FUCHSIA_X,
            primarySwatch: Colors.purple,
          ),
          fbOptions: BH_APPS_DefaultFirebaseOptions.currentPlatform,
          useEmulator: useEmulator,
          useFBStorage: true,
          // onReadyF: () {},
        ),
      );
    },
    (Object error, StackTrace stack) {
      // Handle the error here, e.g., log it, show a dialog, etc.
      print('Caught error in runZonedGuarded: $error');
      print('Stack trace: $stack');
      // Optionally, send the error to a crash reporting service like Sentry or Firebase Crashlytics
    },
  );
}
