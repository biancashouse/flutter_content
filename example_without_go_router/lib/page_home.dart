import 'package:flutter/material.dart';

import 'package:flutter_content/flutter_content.dart';

class Page_Home extends StatelessWidget {
  const Page_Home({super.key});

  @override
  Widget build(BuildContext context) {
    final uniqueTabBarName = DateTime.now().millisecondsSinceEpoch.toString();
    SnippetBuilder sp = SnippetBuilder.fromNodes(
      snippetRootNode: SnippetRootNode(
        name: 'home-scaffold-with-tabs',
        child: ScaffoldNode(
          appBar: NamedPS(
            propertyName: 'appBar',
            child: AppBarNode(
              toolbarHeight: kToolbarHeight,
              // tabBarName: uniqueTabBarName,
              bgColor: ColorModel.grey(),
              title: NamedSC(
                propertyName: 'title',
                child: TextNode(
                  text: 'my title',
                  tsPropGroup: TextStyleProperties(),
                ),
              ),
              titleTextStyle: TextStyleProperties(),
              actions: NamedMC(
                propertyName: 'actions',
                children: [],
              ),
              leading: NamedSC(propertyName: 'leading'),
              bottom: NamedPS(
                propertyName: 'bottom',
                child: TabBarNode(
                  name: uniqueTabBarName,
                  labelTSPropGroup: TextStyleProperties(),
                  children: [
                    TextNode(text:'Tab 1', tsPropGroup: TextStyleProperties()),
                    TextNode(text:'Tab 2', tsPropGroup: TextStyleProperties()),
                  ],
                ),
              ),
            ),
          ),
          body: NamedSC(
            propertyName: 'body',
            child: TabBarViewNode(
              tabBarName: uniqueTabBarName,
              children: [
                ContainerNode(csPropGroup: ContainerStyleProperties(width: 100, height: 100, fillColors: UpTo6Colors(color1: ColorModel.red()))),
                ContainerNode(csPropGroup: ContainerStyleProperties(width: 100, height: 100, fillColors: UpTo6Colors(color1: ColorModel.blue()))),
              ],
            ),
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
        appBar: AppBar(title: Text('flutter_callouts demo')),
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
        ),
      ),
    );

    return EditablePage(
      routePath: '/',
      key: GlobalKey(),
      child: Stack(
        children: [
          scaffold,
          // Align(
          //   alignment: Alignment.topRight,
          //   child: Padding(
          //     padding:  EdgeInsets.only(right:fco.canEditContent() ?  68: 8.0),
          //     child: fco.NavigationDD(pencilIconColor: Colors.red),
          //   ),
          // ),
        ],
      ),
    );
  }
}
