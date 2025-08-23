import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart'
    show fco, FlutterContentApp;
import 'bh-apps.firebase_options.dart';
import 'page_home.dart';

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

      debugProfileBuildsEnabledUserWidgets = true;

      disableOverflowErrors();

      runApp(
        FlutterContentApp(
          appName: 'flutter-content-example-without-go-router',
          home: Page_Home(),
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
