// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_content/compals/home_page_cats.dart';
// import 'package:flutter_content/flutter_content.dart';
// import 'package:flutter_content/src/bloc/bloc_observer.dart';
//
// import '../../example/lib/firebase_options.dart';
// import '../../example/lib/home_page_provider/home_page_provider.dart';
// // conditional import for webview ------------------
// import '../../example/lib/register_ios_or_android_webview.dart'
// if (dart.library.html) 'register_web_webview.dart';
// //--------------------------------------------------
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   //
//   registerWebViewImplementation();
//
//   // hide status bar
//   await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
//   SystemChrome.setSystemUIOverlayStyle(
//     SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
//   );
//
//   FlutterContent.init(
//     skipAssetPkgName: true,
//     namedStyles: {
//       "purple24": NamedTextStyle(color: Colors.purpleAccent, fontSize: 24),
//       "white30": NamedTextStyle(color: Colors.white, fontSize: 30),
//       "white36": NamedTextStyle(color: Colors.white, fontSize: 36),
//       "yellow72": NamedTextStyle(color: Colors.yellow, fontSize: 72),
//     },
//   );
//
//   Bloc.observer = MyGlobalObserver();
//
//   runApp(MaterialAppWrapper(
//     appName: 'cats',
//     initialValueJsonAssetPath: "startup-scripts/cats-config.json",
//     materialAppHomeF: () => const HomePageCats(), //HomePageProvider().getWebOrMobileHomePage(),
//     materialAppThemeF: () => ThemeData(
//       primaryColor: FUCHSIA_X,
//       primarySwatch: Colors.purple,
//       scaffoldBackgroundColor: Colors.pink[30],
//       // useMaterial3: true,
//     ),
//     fbOptions: DefaultFirebaseOptions.currentPlatform,
//   ));
// }
