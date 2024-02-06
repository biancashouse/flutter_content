import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

part 'appbar_node.mapper.dart';

@MappableClass(discriminatorKey: 'ab')
class AppBarNode extends STreeNode with AppBarNodeMappable {
  int? bgColorValue;
  int? fgColorValue;
  GenericSingleChildNode? leading;
  GenericSingleChildNode? title;
  GenericSingleChildNode? bottom;
  GenericMultiChildNode? actions;

  AppBarNode({
    this.bgColorValue,
    this.fgColorValue,
    this.leading,
    this.title,
    this.bottom,
    this.actions,
  });

  @override
  List<PTreeNode> createPropertiesList(BuildContext context) {
    // print("ContainerNode.properties()...");
    return [
      ColorPropertyValueNode(
        snode: this,
        name: 'bg color',
        colorValue: bgColorValue,
        onColorIntChange: (newValue) => refreshWithUpdate(() => bgColorValue = newValue),
        calloutButtonSize: const Size(130, 20),
      ),
      ColorPropertyValueNode(
        snode: this,
        name: 'fg color',
        colorValue: fgColorValue,
        onColorIntChange: (newValue) => refreshWithUpdate(() => fgColorValue = newValue),
        calloutButtonSize: const Size(130, 20),
      ),
    ];
  }

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    setParent(parentNode);  // propagating parents down from root
    possiblyHighlightSelectedNode(context);
    // find scaffold node
     // add a back button if scaffold has tabs
    Widget? leadingWidget;
    SnippetPanelState? spState = SnippetPanel.of(context);
    int numTabNodes = spState?.tabC?.length??0;
    if (numTabNodes > 0) {
      leadingWidget = IconButton(
        onPressed: () {
          var dtc = DefaultTabController.of(context);
        },
        icon: Icon(Icons.arrow_back),
      );
    } else {
      leadingWidget = leading?.toWidgetProperty(context, this);
    }
    var bottomWidget = bottom?.toWidgetProperty(context, this);
    var actionWidgets = actions?.toWidgetProperty(context, this);
    try {
      return AppBar(
        key: nodeWidgetGK,
        leading: leadingWidget,
        title: title?.toWidgetProperty(context, this),
        bottom: bottomWidget as PreferredSizeWidget,
        actions: actionWidgets,
        backgroundColor: bgColorValue != null ? Color(bgColorValue!) : null,
        foregroundColor: fgColorValue != null ? Color(fgColorValue!) : null,
      );
    } catch (e) {
      print('AppBarNode.toWidget() failed!');
      return Material(
        textStyle: const TextStyle(fontFamily: 'monospace', fontSize: 12),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const Icon(Icons.error, color: Colors.redAccent),
              hspacer(10),
              Useful.coloredText(e.toString()),
            ],
          ),
        ),
      );
    }
  }

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "AppBar";
}
