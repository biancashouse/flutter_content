import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'pages/routes_config.dart';
import 'bh-apps.firebase_options.dart';

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
      fco.logger.d(details.toString());
    } else {
      FlutterError.presentError(details);
    }
  };
}

// class MyFilter extends LogFilter {
//   @override
//   bool shouldLog(LogEvent event) {
//     String? eventMsg = event.message as String?;
//     return true;//eventMsg?.contains('SnippetRootNode') ?? false;
//   }
// }

// main when using the flutter_content package
Future<void> main({bool useEmulator = false}) async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();

    // SemanticsBinding.instance.ensureSemantics();

    debugProfileBuildsEnabledUserWidgets = true;

    disableOverflowErrors();

    // // override the logger instance create by flutter_callouts pkg
    // final logger = Logger(
    //   filter: MyFilter(),
    //   printer: PrettyPrinter(
    //     colors: true,
    //     printEmojis: false,
    //     methodCount: 0,
    //   ),
    // );

    // exercising the logger
    // try {
    //   int i = int.parse('abc');
    // } catch (e) {
    //   fco.logger.e('deliberate parse failure!', error: e);
    // }

    runApp(FlutterContentApp.router(
      appName: 'flutter-content-example',
      editorPasswords: ['pigsinspace'],
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
      onReadyF: () {
        copyCollectionBetweenProjects();
      },
    ));
  }, (error, stack) {
    fco.logger.e(error.toString(), stackTrace: stack);
    // if (!kIsWeb)
    // FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  });
}

Future<void> copyCollectionBetweenProjects() async {
  return;
  // await Firebase.initializeApp(
  //     options: BH_APPS_DefaultFirebaseOptions.currentPlatform, name: 'OLD');
  //
  // FirebaseApp oldApp = Firebase.app('OLD');
  //
  // FirebaseFirestore oldFs = FirebaseFirestore.instanceFor(app: oldApp);
  //
  // final fromCollectionRef = oldFs.collection(
  //     '/flutter-content-apps/flutter-content-example_using_go_router-app2/snippets/demo-buttons/versions');
  // final toCollectionRef = FirebaseFirestore.instance.collection(
  //     '/apps/flutter-content-example_using_go_router/snippets/demo-buttons/versions');
  //
  // try {
  //   final usersSnapshot = await fromCollectionRef.get();
  //   for (final document in usersSnapshot.docs) {
  //     await toCollectionRef.doc(document.id).set(document.data());
  //     fco.logger.d('Document ${document.id} migrated successfully');
  //   }
  //   // Optionally delete the old collection after migration
  //   // await oldCollectionRef.doc(document.id).delete();
  // } catch (e) {
  //   fco.logger.w('Error during migration: $e');
  //   // Handle errors appropriately
  // }
}
