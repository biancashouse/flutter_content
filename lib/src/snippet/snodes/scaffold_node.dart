import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

part 'scaffold_node.mapper.dart';

@MappableClass(discriminatorKey: 'sc')
class ScaffoldNode extends STreeNode with ScaffoldNodeMappable {
  int? bgColorValue;
  AppBarNode? appBar;
  GenericSingleChildNode? body;
  double? tabLabelFontSize;

  // int numTabs;

  ScaffoldNode({
    this.bgColorValue,
    this.appBar,
    required this.body,
    // this.numTabs = 0,
  });

  @override
  List<PTreeNode> properties(BuildContext context) {
    // fco.logi("ContainerNode.properties()...");
    return [
      ColorPropertyValueNode(
        snode: this,
        name: 'background color',
        colorValue: bgColorValue,
        onColorIntChange: (newValue) =>
            refreshWithUpdate(() => bgColorValue = newValue),
        calloutButtonSize: const Size(200, 20),
      ),
      // IntPropertyValueNode(
      //   snode: this,
      //   name: 'Number of Tabs',
      //   intValue: numTabs,
      //   onIntChange: (newValue) => refreshWithUpdate(() => numTabs = newValue ?? 0),
      //   calloutButtonSize: const Size(130, 20),
      // ),
    ];
  }

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    // if (parentNode == null) throw Exception("parent is null!");
    setParent(parentNode);
    possiblyHighlightSelectedNode();

    late Widget scaffold;
    bool usingTabs = appBar?.bottom?.child is TabBarNode;
    int? numTabs;
    if (usingTabs) {
      TabBarNode tabBarNode = appBar?.bottom?.child as TabBarNode;
      numTabs = tabBarNode.children.length;
      SnippetPanelState? spState = SnippetPanel.of(context);
      spState?.createTabController(numTabs);
      scaffold = Theme(
        data: ThemeData(
          // brightness: Brightness.light,
          tabBarTheme: TabBarTheme(
            labelStyle: TextStyle(fontSize: tabLabelFontSize),
            // indicator: UnderlineTabIndicator(
            //     // color for indicator (underline)
            //     borderSide: BorderSide(color: Colors.black, width: 3)),
          ),
        ),
        child: Scaffold(
          key: createNodeGK(),
          backgroundColor: bgColorValue != null ? Color(bgColorValue!) : null,
          appBar: appBar?.toWidget(context, this) as PreferredSizeWidget?,
          // guaranteed the widget is actually an AppBar
          body: body?.toWidgetProperty(context, this) ?? const Placeholder(),
        ),
      );
    } else {
      scaffold = Scaffold(
        key: createNodeGK(),
        backgroundColor: bgColorValue != null ? Color(bgColorValue!) : null,
        appBar: appBar?.toWidget(context, this) as PreferredSizeWidget?,
        // guaranteed the widget is actually an AppBar
        body: body?.toWidgetProperty(context, this) ?? const Placeholder(),
      );
    }

    // FlutterContentAppState? spaState = FlutterContentApp.of(context);
    return Stack(
      children: [
        scaffold,
        if (!fco.canEditContent)
          Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  // ask user to sign in as editor
                  EditablePage.of(context)?.lockIconTapped();
                },
                icon: Icon(Icons.edit, color: bgColorValue == Colors.black.value ? Colors.white : Colors.black,),
              )),
      ],
    );
  }

  @override
  bool canBeDeleted() => appBar == null && body == null;

  @override
  List<Widget> menuAnchorWidgets_Append(NodeAction action, bool? skipHeading) {
    return [
      ...super.menuAnchorWidgets_Heading(action),
      menuItemButton("PollOption", PollOptionNode, action),
    ];
  }

  @override
  List<Type> replaceWithRecommendations() => [ScaffoldNode];

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "Scaffold";
}
