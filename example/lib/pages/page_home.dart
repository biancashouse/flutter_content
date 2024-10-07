import 'package:flutter/material.dart';
import 'package:flutter_callouts/flutter_callouts.dart';
import 'package:flutter_content/flutter_content.dart';

class Page_Home extends StatefulWidget {
  const Page_Home({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<Page_Home> createState() => _Page_HomeState();
}

class _Page_HomeState extends State<Page_Home> {
  int _counter = 0;

  // ScrollController? sC(context) => EditablePage.of(context)?.sC;

  @override
  void initState() {
    CalloutConfig cc = CalloutConfig(
      cId: 'basic',
      initialTargetAlignment: Alignment.topLeft,
      initialCalloutAlignment: Alignment.bottomRight,
      finalSeparation: 100,
      borderThickness: 3,
      fillColor: Colors.yellow[700],
      arrowType: ArrowType.POINTY,
      animate: true,
      scrollControllerName: 'main',
    );

    fco.setNamedCallback(
      'sample-popup',
      (context, gk) => fco.showOverlay(
        calloutConfig: cc,
        calloutContent: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('This is a dynamic popup invoked by a named callback.'),
            ],
          ),
        ),
        targetGkF: () => gk,
      ),
    );
    super.initState();
  }

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

    final vea = fco.hiveBox.get('vea') ?? 'anon';
    final title = vea != 'anon'
    ? "flutter content demo (signed in as $vea)"
        : "flutter content demo";
    final scaffold = Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Flexible(
              flex: 1,
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
              flex: 4,
              child: SnippetPanel.fromNodes(
                // panelName: 'demo-buttons',
                snippetRootNode: SnippetTemplateEnum.scaffold_with_tabs
                    .templateSnippet()
                    .clone(
                        cloneName: /*'demo-buttons'*/
                            'inner-scaffold-with-tabs'),
                // snippetRootNode: SnippetRootNode(
                //   name: 'we-create-flutter-apps-and-packages',
                //   child: PlaceholderNode()
                // ),
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

    return ValueListenableBuilder<bool>(
      valueListenable: fco.canEditContent,
      builder: (context, value, child) {
        bool showPencil = !value;
        return Stack(
          children: [
            scaffold,
            if (showPencil)
              Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      // ask user to sign in as editor
                      setState(() {
                        EditablePage.of(context)?.editorPasswordDialog();
                      });
                    },
                    icon: Icon(Icons.edit, color: Colors.white),
                  )),
          ],
        );
      },
      child: scaffold,
    );
  }
}
