import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:go_router/go_router.dart';
import 'package:hello/firebase_options.dart';

final _webRoutingConfig = RoutingConfig(
  routes: <RouteBase>[
    GoRoute(
      name: 'hello',
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MyHomePage(title: 'hello');
      },
    ),

    GoRoute(
      name: 'panels-demo1',
      path: '/panels-demo1',
      builder: (BuildContext context, GoRouterState state) {
        return const PanelsDemoPage();
      },
    ),

    FCRoute(
      name: 'panels-demo2',
      path: '/panels-demo2',
      widgetBuilder: (context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SnippetPanel.fromNodes(
              panelName: 'panel1',
              snippetRootNode: SnippetRootNode(
                name: 'demo2-panel1',
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
                name: 'demo2-panel2',
                child: CarouselNode(children: [
                  AssetImageNode(name: 'assets/images/frog.jpg'),
                  AssetImageNode(name: 'assets/images/hummingbird.jpg'),
                  AssetImageNode(name: 'assets/images/indian-chat.jpg'),
                ]),
              ),
            ),
          ),
        ],
      ),
    ),
  ],
);

final _mobileRoutingConfig = RoutingConfig(
  routes: <RouteBase>[
    GoRoute(
      name: 'hello',
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MyHomePage(title: 'hello');
      },
    ),
    GoRoute(
      name: 'panels-demo1',
      path: '/panels-demo1',
      builder: (BuildContext context, GoRouterState state) {
        return const PanelsDemoPage();
      },
    ),
    GoRoute(
      name: 'panels-demo2',
      path: '/panels-demo2',
      builder: (BuildContext context, GoRouterState state) {
        return FlutterContentPage(
          key: FC().pageGKs['fc-demo2'] = GlobalKey(),
          pageName: 'fc-demo2',
          pageBuilder: (context) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SnippetPanel.fromNodes(
                  panelName: 'panel1',
                  snippetRootNode: SnippetRootNode(
                    name: 'demo2-panel1',
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
                    name: 'demo2-panel2',
                    child: CarouselNode(children: [
                      AssetImageNode(name: 'assets/images/frog.jpg'),
                      AssetImageNode(name: 'assets/images/hummingbird.jpg'),
                      AssetImageNode(name: 'assets/images/indian-chat.jpg'),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
  ],
);

// original main
// void main() {
//   runApp(const MyApp());
// }

// main when using the flutter_content package
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialSPA(
    appName: 'flutter-content-example-app',
    webRoutingConfig: _webRoutingConfig,
    mobileRoutingConfig: _mobileRoutingConfig,
    initialRoutePath: '/',
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                  context.go('/panels-demo1');
                },
                child: const Text('go to a page that has 2 SnippetPanels'),
              ),
            ),
            Flexible(
              flex: 1,
              child: FilledButton(
                onPressed: () {
                  context.go('/panels-demo2');
                },
                child: const Text('go to a EDITABLE page that has 2 SnippetPanels'),
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

class PanelsDemoPage extends StatelessWidget {
  const PanelsDemoPage({super.key});

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
