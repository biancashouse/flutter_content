import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

import 'firebase_options.dart';
import 'home_page_mobile.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialSPA(
    appName: 'flutter-content-app',
    initialValueJsonAssetPath: "startup-scripts/example-config.json",
    webHome: const FlutterContentPage(panelName: 'home', snippetName: 'empty-home', fromTemplate: SnippetTemplate.empty_snippet),
    // webHome: const ZoomerSamplePage(),
    mobileHome: const HomePageMobile(),
    materialAppThemeF: () => ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      primaryColor: FUCHSIA_X,
      primarySwatch: Colors.purple,
    ),
    fbOptions: DefaultFirebaseOptions.currentPlatform,
    namedStyles: {
      "purple24": NamedTextStyle(color: Colors.purpleAccent, fontSize: 24),
      "white30": NamedTextStyle(color: Colors.white, fontSize: 30),
      "white36": NamedTextStyle(color: Colors.white, fontSize: 36),
      "yellow72": NamedTextStyle(color: Colors.yellow, fontSize: 72),
      "blue-tab": NamedTextStyle(color: Colors.blue, fontSize: 24),
    },
  ));
}