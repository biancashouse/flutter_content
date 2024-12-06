import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

part 'scaffold_node.mapper.dart';

@MappableClass(discriminatorKey: 'sc')
class ScaffoldNode extends STreeNode with ScaffoldNodeMappable {
  int? bgColorValue;
  AppBarNode? appBar;
  GenericSingleChildNode? body;
  bool canShowEditorLoginBtn;

  // int numTabs;

  ScaffoldNode({
    this.bgColorValue,
    this.appBar,
    required this.body,
    // this.numTabs = 0,
    this.canShowEditorLoginBtn = false,
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
    // bool usingTabs = appBar?.bottom?.child is TabBarNode;
    scaffold = Scaffold(
      key: createNodeGK(),
      backgroundColor: bgColorValue != null ? Color(bgColorValue!) : null,
      appBar: appBar?.toWidget(context, this) as PreferredSizeWidget?,
      // guaranteed the widget is actually an AppBar
      body: body?.toWidgetProperty(context, this) ?? const Placeholder(),
    );

    try {
      return ValueListenableBuilder<bool>(
            valueListenable: fco.canEditContent,
            builder: (context, value, child) {
              bool showPencil = !value;
              return Stack(
                children: [
                  scaffold,
                  if (showPencil && canShowEditorLoginBtn)
                    Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () {
                            // ask user to sign in as editor
                            EditablePage.of(context)
                                ?.editorPasswordDialog();
                          },
                          icon: const Icon(Icons.edit, color: Colors.white),
                        )),
                ],
              );
            },
            child: scaffold,
          );
    } catch (e) {
     return Error(key: createNodeGK(), FLUTTER_TYPE, color: Colors.red, size: 32, errorMsg: e.toString());
    }
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
