import 'dart:async';

import 'package:admin/bh-apps.firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:logger/logger.dart';

import 'admin.dart';

// original main
// void main() {
//   runApp(const MyApp());
// }

void disableOverflowErrors() {
  FlutterError.onError = (FlutterErrorDetails details) {
    final exception = details.exception;
    final isOverflowError = exception is FlutterError &&
        !exception.diagnostics.any(
                (e) => e.value.toString().startsWith("A RenderFlex overflowed by"));

    if (isOverflowError) {
    } else {
      FlutterError.presentError(details);
    }
  };
}

class MyFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    // String? eventMsg = event.message as String?;
    return true;//eventMsg?.contains('SnippetRootNode') ?? false;
  }
}

// main when using the flutter_content package
Future<void> main({bool useEmulator = false}) async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();

    // SemanticsBinding.instance.ensureSemantics();

    debugProfileBuildsEnabledUserWidgets = true;

    disableOverflowErrors();

    // override the logger instance create by flutter_callouts pkg
    final logger = Logger(
      filter: MyFilter(),
      printer: PrettyPrinter(
        colors: true,
        printEmojis: false,
        methodCount: 0,
      ),
    );

    // exercising the logger
    // try {
    //   int i = int.parse('abc');
    // } catch (e) {
    //   fco.logger.e('deliberate parse failure!', error: e);
    // }

    runApp(Admin(
      appName: 'flutter-content-demo',
      fbOptions: BH_APPS_DefaultFirebaseOptions.currentPlatform,
      onReadyF: () {
        fco.modelRepo.purgePreviousSnippetVersions('home-scaffold_with_tabs');
      },
    ));
  }, (error, stack) {
    fco.logger.e(error.toString());
    // if (!kIsWeb)
    // FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  });
}
