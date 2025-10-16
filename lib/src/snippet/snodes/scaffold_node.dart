import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/color_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';

import 'appbar_hook.dart';

// import 'package:flutter_content/src/snippet/snodes/appbar_with_menubar_node.dart';
// import 'package:flutter_content/src/snippet/snodes/appbar_with_tabbar_node.dart';

part 'scaffold_node.mapper.dart';

@MappableClass()
class ScaffoldNode extends CL with ScaffoldNodeMappable {
  ColorModel? bgColor;
  @MappableField(hook: AppBarHook())
  NamedPS appBar;
  NamedSC body;
  bool? canShowEditorLoginBtn;

  // int numTabs;

  ScaffoldNode({
    this.bgColor,
    required this.appBar,
    required this.body,
    // this.numTabs = 0,
    this.canShowEditorLoginBtn,
  });

  @override
  List<PNode> propertyNodes(BuildContext context, SNode? parentSNode) {
    // fco.logger.i("ContainerNode.properties()...");
    return [
      FlutterDocPNode(
        buttonLabel: 'Scaffold',
        webLink: 'https://api.flutter.dev/flutter/material/Scaffold-class.html',
        snode: this,
        name: 'fyi',
      ),
      ColorPNode(
        snode: this,
        name: 'background color',
        color: bgColor,
        onColorChange: (newValue) =>
            refreshWithUpdate(context, () => bgColor = newValue),
        calloutButtonSize: const Size(200, 20),
      ),
      // IntPNode(
      //   snode: this,
      //   name: 'Number of Tabs',
      //   intValue: numTabs,
      //   onIntChange: (newValue) => refreshWithUpdate(context,() => numTabs = newValue ?? 0),
      //   calloutButtonSize: const Size(130, 20),
      // ),
    ];
  }

  @override
  Widget buildFlutterWidget(BuildContext context, SNode? parentNode) {
    // if (parentNode == null) throw Exception("parent is null!");
    setParent(parentNode);
    //ScrollControllerName? scName = EditablePage.name(context);
    //possiblyHighlightSelectedNode(scName);


    var appBarProp = appBar.buildPreferredSizeFlutterWidget(context, parentNode);
    var bodyProp = body.buildFlutterWidget(context, parentNode);

    // bool usingTabs = appBar?.bottom?.child is TabBarNode;
    Widget scaffold = Scaffold(
      key: createNodeWidgetGK(),
      backgroundColor: bgColor?.flutterValue,
      appBar: appBarProp,
      // guaranteed the widget is actually an AppBar
      body: bodyProp,
    );

    try {
      bool showPencil = !fco.canEditContent();
      return Stack(
        children: [
          scaffold,
          if (showPencil && (canShowEditorLoginBtn??false))
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  // ask user to sign in as editor
                  EditablePage.of(context)?.editorPasswordDialog();
                },
                icon: const Icon(Icons.edit, color: Colors.white),
              ),
            ),
        ],
      );
    } catch (e) {
      return Error(
        key: createNodeWidgetGK(),
        FLUTTER_TYPE,
        color: Colors.red,
        size: 16,
        errorMsg: e.toString(),
      );
    }
  }

  @override
  List<Widget> menuAnchorWidgets_Append(
    BuildContext context,
    NodeAction action,
    bool? skipHeading,
    ScrollControllerName? scName,
  ) {
    return [
      ...super.menuAnchorWidgets_Heading(context, action, scName),
      menuItemButton(context, "AppBar", AppBarNode, action, scName),
      // menuItemButton(context, "AppBar with TabBar", AppBarWithTabBarNode, action, scName),
      // menuItemButton(context, "AppBar with MenuBar", AppBarWithMenuBarNode, action, scName),
      // menuItemButton(context, "PollOption", PollOptionNode, action, scName),
    ];
  }

  @override
  List<Type> replaceWithRecommendations() => [ScaffoldNode];

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "Scaffold";
}
