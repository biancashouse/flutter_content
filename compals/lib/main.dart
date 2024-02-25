import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

import 'firebase_options.dart';
import 'home_page_mobile.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialSPA(
    appName: 'compals-training-app',
    initialValueJsonAssetPath: "startup-scripts/compals-config.json",
    webHome: const FlutterContentPage(panelName: 'home', snippetName: 'home', fromTemplate: SnippetTemplate.scaffold_with_tabs),
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
      "blackTitle": NamedTextStyle(color: Colors.yellow, fontSize: 72),
      "displayLarge": NamedTextStyle(fontSizeName: Material3TextSizeEnum.displayL),
      "displayMedium": NamedTextStyle(fontSizeName: Material3TextSizeEnum.displayM),
      "displaySmall": NamedTextStyle(fontSizeName: Material3TextSizeEnum.displayS),
      "headlineLarge": NamedTextStyle(fontSizeName: Material3TextSizeEnum.headlineL),
      "headlineMedium": NamedTextStyle(fontSizeName: Material3TextSizeEnum.headlineM),
      "headlineSmall": NamedTextStyle(fontSizeName: Material3TextSizeEnum.headlineS),
      "titleLarge": NamedTextStyle(fontSizeName: Material3TextSizeEnum.titleL),
      "titleMedium": NamedTextStyle(fontSizeName: Material3TextSizeEnum.titleM),
      "titleSmall": NamedTextStyle(fontSizeName: Material3TextSizeEnum.titleS),
      "bodyLarge": NamedTextStyle(fontSizeName: Material3TextSizeEnum.bodyL),
      "bodyMedium": NamedTextStyle(fontSizeName: Material3TextSizeEnum.bodyM),
      "bodySmall": NamedTextStyle(fontSizeName: Material3TextSizeEnum.bodyS),
      "labelLarge": NamedTextStyle(fontSizeName: Material3TextSizeEnum.labelL),
      "labelMedium": NamedTextStyle(fontSizeName: Material3TextSizeEnum.labelM),
      "labelSmall": NamedTextStyle(fontSizeName: Material3TextSizeEnum.labelS),
    },
  ));
}
