import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:go_router/go_router.dart';

import 'firebase_options.dart';

/// The route configuration.

final GoRouter _webRouter = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      name: 'home',
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const FlutterContentPage(
          pageName: 'home',
          snippetName: 'rich-text-snippet',
          fromTemplate: SnippetTemplate.rich_text,
          pageGK: GlobalKey(),
        );
      },
      routes: <RouteBase>[
        GoRoute(
          name: 'hotspots',
          path: 'hotspots-demo',
          builder: (BuildContext context, GoRouterState state) {
            return const FlutterContentPage(
              pageName: 'hotspots-demo',
              snippetName: 'hotspots-demo-snippet',
              fromTemplate: SnippetTemplate.empty,
            );
          },
        ),
        GoRoute(
          name: 'scaffold-with-tabs',
          path: 'scaffold-with-tabs',
          builder: (BuildContext context, GoRouterState state) {
            return const FlutterContentPage(
              pageName: 'scaffold-with-tabs-demo',
              snippetName: 'scaffold-with-tabs-demo-snippet',
              fromTemplate: SnippetTemplate.scaffold_with_tabs,
            );
          },
        ),
      ],
    ),
  ],
  debugLogDiagnostics: true,
);

final GoRouter _mobileRouter = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      name: 'home',
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const FlutterContentPage(
          pageName: 'home',
          snippetName: 'home-snippet',
          fromTemplate: SnippetTemplate.scaffold_with_menubar,
        );
      },
      routes: <RouteBase>[
        GoRoute(
          name: 'hotspots',
          path: 'hotspots-demo',
          builder: (BuildContext context, GoRouterState state) {
            return const FlutterContentPage(
              pageName: 'hotspots-demo',
              snippetName: 'hotspots-demo-snippet',
              fromTemplate: SnippetTemplate.empty,
            );
          },
        ),
        GoRoute(
          name: 'scaffold-with-tabs',
          path: 'scaffold-with-tabs',
          builder: (BuildContext context, GoRouterState state) {
            return const FlutterContentPage(
              pageName: 'scaffold-with-tabs-demo',
              snippetName: 'scaffold-with-tabs-demo-snippet',
              fromTemplate: SnippetTemplate.scaffold_with_tabs,
            );
          },
        ),
      ],
    ),
  ],
  debugLogDiagnostics: true,
);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialSPA(
    appName: 'flutter-content-example-app',
    webRouter: _webRouter,
    // webHome: const ZoomerSamplePage(),
    mobileRouter: _mobileRouter,
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
