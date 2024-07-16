import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

part 'scaffold_node.mapper.dart';

@MappableClass(discriminatorKey: 'sc')
class ScaffoldNode extends STreeNode with ScaffoldNodeMappable {
  int? bgColorValue;
  AppBarNode? appBar;
  GenericSingleChildNode? body;

  // int numTabs;

  ScaffoldNode({
    this.bgColorValue,
    this.appBar,
    required this.body,
    // this.numTabs = 0,
  });

  @override
  List<PTreeNode> properties(BuildContext context) {
    // debugPrint("ContainerNode.properties()...");
    return [
      ColorPropertyValueNode(
        snode: this,
        name: 'background color',
        colorValue: bgColorValue,
        onColorIntChange: (newValue) => refreshWithUpdate(() => bgColorValue = newValue),
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
    // FlutterContentAppState? spaState = FlutterContentApp.of(context);
    return  Scaffold(
      key: createNodeGK(),
      backgroundColor: bgColorValue != null ? Color(bgColorValue!) : null,
      appBar: appBar?.toWidget(context, this) as PreferredSizeWidget?, // guaranteed the widget is actually an AppBar
      body: body?.toWidgetProperty(context, this) ?? const Placeholder(),
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
