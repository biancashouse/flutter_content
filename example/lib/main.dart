import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:go_router/go_router.dart';
import 'package:example/firebase_options.dart';

enum PageButtonInfo {

  home(
      buttonLabel: Text('home'),
      path: '/home'
  ),
  rowOf2Panels(
    buttonLabel: Text('demo: row of 2 panels'),
    path: '/row-of-2-panels',
  ),
  snippetSandbox(
    buttonLabel: Text('demo: editable snippet sandbox panel'),
    path: '/snippet-sandbox',
  ),
  scaffoldWithMenuBar(
    buttonLabel: Text('demo: editable scaffold with MenuBar'),
    path: '/editable-scaffold-with-menubar',
  ),
  scaffoldWithTabBar(
    buttonLabel: Text('demo: editable scaffold with TabBar'),
    path: '/editable-scaffold-with-tabbar',
  ),
  richText(
    buttonLabel: Text('demo: editable rich text'),
    path: '/editable-rich-text',
  );


  const PageButtonInfo({required this.buttonLabel, required this.path});

  final String path;
  final Widget buttonLabel;
}

final _webRoutingConfig = RoutingConfig(
  routes: <RouteBase>[
    GoRoute(
      name: 'home',
      path: PageButtonInfo.home.path,
      builder: (BuildContext context, GoRouterState state) => const FlutterPageHome(title: 'hello'),
    ),
    GoRoute(
      path: PageButtonInfo.rowOf2Panels.path,
      builder: (BuildContext context, GoRouterState state) => const FlutterPageRowOf2Panels(),
    ),
    EditableRoute(
      path: PageButtonInfo.snippetSandbox.path,
      template: SnippetTemplateEnum.empty,
    ),
    EditableRoute(
      path: PageButtonInfo.scaffoldWithMenuBar.path,
      template: SnippetTemplateEnum.scaffold_with_menubar,
    ),
    EditableRoute(
      path: PageButtonInfo.scaffoldWithTabBar.path,
      template: SnippetTemplateEnum.scaffold_with_tabbar,
    ),
    EditableRoute(
      path: PageButtonInfo.richText.path,
      template: SnippetTemplateEnum.rich_text,
    ),
  ],
);

const _mobileRoutingConfig = RoutingConfig(
  routes: <RouteBase>[],
);

// original main
// void main() {
//   runApp(const MyApp());
// }

// main when using the flutter_content package
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialSPA(
    appName: 'flutter-content-example-app2',
    webRoutingConfig: _webRoutingConfig,
    mobileRoutingConfig: _mobileRoutingConfig,
    initialRoutePath: '/home',
    materialAppThemeF: () => ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      primaryColor: FUCHSIA_X,
      primarySwatch: Colors.purple,
    ),
    fbOptions: DefaultFirebaseOptions.currentPlatform,
    namedVoidCallbacks: const {},
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

class FlutterPageHome extends StatefulWidget {
  const FlutterPageHome({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<FlutterPageHome> createState() => _FlutterPageHomeState();
}

class _FlutterPageHomeState extends State<FlutterPageHome> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Flexible(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: FilledButton(
                onPressed: () {
                  context.go(PageButtonInfo.snippetSandbox.path);
                },
                child: PageButtonInfo.snippetSandbox.buttonLabel,
              ),
            ),
            Flexible(
              flex: 1,
              child: FilledButton(
                onPressed: () {
                  context.go(PageButtonInfo.scaffoldWithMenuBar.path);
                },
                child: PageButtonInfo.scaffoldWithMenuBar.buttonLabel,
              ),
            ),
            Flexible(
              flex: 1,
              child: FilledButton(
                onPressed: () {
                  context.go(PageButtonInfo.scaffoldWithTabBar.path);
                },
                child: PageButtonInfo.scaffoldWithTabBar.buttonLabel,
              ),
            ),
            Flexible(
              flex: 1,
              child: FilledButton(
                onPressed: () {
                  context.go(PageButtonInfo.richText.path);
                },
                child: PageButtonInfo.richText.buttonLabel,
              ),
            ),
            Flexible(
              flex: 1,
              child: FilledButton(
                onPressed: () {
                  context.go(PageButtonInfo.rowOf2Panels.path);
                },
                child: PageButtonInfo.rowOf2Panels.buttonLabel,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class FlutterPageRowOf2Panels extends StatelessWidget {
  const FlutterPageRowOf2Panels({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: SnippetPanel.fromNodes(
            panelName: 'panel1',
            snippetRootNode: SnippetRootNode(
              name: 'panels-demo1-panel1',
              child: PaddingNode(
                padding: EdgeInsetsValue(top: 30, left: 30, bottom: 30, right: 30),
                child: AssetImageNode(name: 'assets/images/flowers.jpg'),
              ),
            ),
          ),
        ),
        Expanded(
          child: SnippetPanel.fromNodes(
            panelName: 'panel2',
            snippetRootNode: SnippetRootNode(
              name: 'panels-demo2-panel2',
              child: CarouselNode(children: [
                AssetImageNode(name: 'assets/images/frog.jpg'),
                AssetImageNode(name: 'assets/images/hummingbird.jpg'),
                AssetImageNode(name: 'assets/images/indian-chat.jpg'),
              ]),
            ),
          ),
        ),
      ],
    );
  }
}