import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:go_router/go_router.dart';
import 'package:example/firebase_options.dart';

import 'pages/routes_config.dart';

// original main
// void main() {
//   runApp(const MyApp());
// }

void disableOverflowErrors() {
  FlutterError.onError = (FlutterErrorDetails details) {
    final exception = details.exception;
    final isOverflowError = exception is FlutterError && !exception.diagnostics.any((e) => e.value.toString().startsWith("A RenderFlex overflowed by"));

    if (isOverflowError) {
      debugPrint(details.toString());
    } else {
      FlutterError.presentError(details);
    }
  };
}

// main when using the flutter_content package
Future<void> main({bool useEmulator = false}) async {
  WidgetsFlutterBinding.ensureInitialized();

  disableOverflowErrors();

  runApp(FlutterContentApp(
    appName: 'flutter-content-example-app2',
    webRoutingConfig: webRoutingConfig,
    mobileRoutingConfig: mobileRoutingConfig,
    initialRoutePath: '/home',
    materialAppThemeF: () => ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      primaryColor: fco.FUCHSIA_X,
      primarySwatch: Colors.purple,
    ),
    fbOptions: DefaultFirebaseOptions.currentPlatform,
    useEmulator: useEmulator,
    useFBStorage: true,
    namedVoidCallbacks: {
      // used by button tap handlers
      'goto-row-of-2-panels': (context)=>context.go('/row-of-2-panels'),
      'goto-snippet-sandbox': (context)=>context.go('/snippet-sandbox'),
      'goto-editable-scaffold-with-menubar': (context)=>context.go('/editable-scaffold-with-menubar'),
      'goto-editable-scaffold-with-tabbar': (context)=>context.go('/editable-scaffold-with-tabbar'),
      'goto-editable-rich-text': (context)=>context.go('/editable-rich-text'),
    },
    namedTextStyles: const {
      "purple24": TextStyle(color: Colors.purpleAccent, fontSize: 24),
      "white30": TextStyle(color: Colors.white, fontSize: 30),
      "white36": TextStyle(color: Colors.white, fontSize: 36),
      "yellow72": TextStyle(color: Colors.yellow, fontSize: 72),
      "blue-tab": TextStyle(color: Colors.blue, fontSize: 24),
    },
    namedButtonStyles: const {},
  ));
}