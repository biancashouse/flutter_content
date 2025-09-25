import 'package:flutter/material.dart';

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
  @override
  void initState() {
    fco.afterNextBuildDo(() {
      // var pagePath = EditablePage.scName(context);
      // namedSC = NamedScrollController(pagePath, Axis.vertical);

      final cc = CalloutConfig(
        cId: 'basic',
        initialTargetAlignment: Alignment.topLeft,
        initialCalloutAlignment: Alignment.bottomRight,
        finalSeparation: 100,
        decorationBorderThickness: 3,
        decorationFillColors: ColorOrGradient.color(Colors.yellow[700]!),
        targetPointerType: TargetPointerType.bubble(),
        animatePointer: true,
        scrollControllerName: null,
      );

      fco.namedCallbacks['sample-popup'] = (context, gk) => fco.showOverlay(
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
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final vea = fco.localStorage.getString('vea') ?? 'anon';
    final vea = fco.localStorage.read('vea') ?? 'anon';
    final title = vea != 'anon'
        ? "flutter content demo (signed in as $vea)"
        : "flutter content demo";
    // final snippetPanel = SnippetPanel.fromNodes(
    //   // panelName: 'demo-buttons',
    //   snippetRootNode: SnippetTemplateEnum.scaffold_with_tabs
    //       .templateSnippet()
    //       .clone(
    //       cloneName: /*'demo-buttons'*/
    //       'inner-scaffold-with-tabs'),
    //   // snippetRootNode: SnippetRootNode(
    //   //   name: 'we-create-flutter-apps-and-packages',
    //   //   child: PlaceholderNode()
    //   // ),
    // );

    final uniqueTabBarName = DateTime.now().millisecondsSinceEpoch.toString();
    SnippetBuilder sp = SnippetBuilder.fromNodes(
      // panelName: 'demo-buttons',
      snippetRootNode: SnippetRootNode(
        name: 'home-scaffold-with-tabs',
        child: ScaffoldNode(
          appBar: AppBarNode(
            tabBarName: uniqueTabBarName,
            bgColor: ColorModel.grey(),
            title: GenericSingleChildNode(
              propertyName: 'title',
              child: TextNode(text: 'my title', tsPropGroup: TextStyleProperties()),
            ),
            bottom: GenericSingleChildNode(
              propertyName: 'bottom',
              child: TabBarNode(
                name: uniqueTabBarName,
                labelTSPropGroup: TextStyleProperties(),
                children: [
                  TextNode(text: 'tab 1', tsPropGroup: TextStyleProperties()),
                  TextNode(text: 'Tab 2', tsPropGroup: TextStyleProperties()),
                ],
              ),
            ),
          ),
          body: GenericSingleChildNode(
            propertyName: 'body',
            child: TabBarViewNode(tabBarName: uniqueTabBarName, children: [PlaceholderNode(), PlaceholderNode()]),
          ),
        ),
      ),

      // snippetRootNode: SnippetRootNode(
      //   name: 'we-create-flutter-apps-and-packages',
      //   child: PlaceholderNode()
      // ),
      scName: null, //sC.name, because no scrolling used
    );

    int counter = 0;

    final scaffold = StatefulBuilder(
      builder: (BuildContext context, st) => Scaffold(
        appBar: AppBar(title: Text(title)),
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
                    const Text('You have pushed the button this many times:'),
                    Text(
                      '$counter',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
              Flexible(flex: 4, child: sp),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => st(() {
            -counter++;
          }),
          // tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );

    return EditablePage(
      routePath: '/',
      key: GlobalKey(),
      child: Stack(
        children: [
          scaffold,
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: fco.NavigationDD(pencilIconColor: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
