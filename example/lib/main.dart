import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:go_router/go_router.dart';
import 'package:url_strategy/url_strategy.dart';
import 'bh-apps.firebase_options.dart';
import 'old.firebase_options.dart';

import 'pages/routes_config.dart';

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
      debugPrint(details.toString());
    } else {
      FlutterError.presentError(details);
    }
  };
}

// main when using the flutter_content package
Future<void> main({bool useEmulator = false}) async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

    setPathUrlStrategy();
    //
    // try {
    //   await Firebase.initializeApp(
    //       options: DefaultFirebaseOptions.currentPlatform);
    // } catch (e) {
    //   fco.loge(e.toString());
    // }
    //
    // await Future.delayed(Duration(seconds: 1));

    disableOverflowErrors();

    runApp(FlutterContentApp(
      appName: 'flutter-content-example',
      webRoutingConfig: webRoutingConfig,
      mobileRoutingConfig: mobileRoutingConfig,
      initialRoutePath: '/home',
      materialAppThemeF: () => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primaryColor: fco.FUCHSIA_X,
        primarySwatch: Colors.purple,
      ),
      fbOptions: OLD_DefaultFirebaseOptions.currentPlatform,
      useEmulator: useEmulator,
      useFBStorage: true,
      namedVoidCallbacks: {
        // used by button tap handlers
        'goto-row-of-2-panels': (context) => context.go('/row-of-2-panels'),
        'goto-snippet-sandbox': (context) => context.go('/snippet-sandbox'),
        'goto-editable-scaffold-with-menubar': (context) =>
            context.go('/editable-scaffold-with-menubar'),
        'goto-editable-scaffold-with-tabbar': (context) =>
            context.go('/editable-scaffold-with-tabbar'),
        'goto-editable-rich-text': (context) =>
            context.go('/editable-rich-text'),
      },
      namedTextStyles: const {
        "purple24": TextStyle(color: Colors.purpleAccent, fontSize: 24),
        "white30": TextStyle(color: Colors.white, fontSize: 30),
        "white36": TextStyle(color: Colors.white, fontSize: 36),
        "yellow72": TextStyle(color: Colors.yellow, fontSize: 72),
        "blue-tab": TextStyle(color: Colors.blue, fontSize: 24),
      },
      namedButtonStyles: const {},
      onReadyF: () {
        copyCollectionBetweenProjects();
      },
    ));
  }, (error, stack) {
    fco.loge(error.toString());
    // if (!kIsWeb)
    // FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  });
}

Future<void> copyCollectionBetweenProjects() async {
  return;
  await Firebase.initializeApp(
      options: OLD_DefaultFirebaseOptions.currentPlatform, name: 'OLD');

  FirebaseApp oldApp = Firebase.app('OLD');

  FirebaseFirestore oldFs = FirebaseFirestore.instanceFor(app: oldApp);

  final fromCollectionRef = oldFs.collection(
      '/flutter-content-apps/flutter-content-example-app2/snippets/demo-buttons/versions');
  final toCollectionRef = FirebaseFirestore.instance.collection(
      '/apps/flutter-content-example/snippets/demo-buttons/versions');

  try {
    final usersSnapshot = await fromCollectionRef.get();
    for (final document in usersSnapshot.docs) {
      await toCollectionRef.doc(document.id).set(document.data());
      print('Document ${document.id} migrated successfully');
    }
    // Optionally delete the old collection after migration
    // await oldCollectionRef.doc(document.id).delete();
  } catch (e) {
    print('Error during migration: $e');
    // Handle errors appropriately
  }
}
