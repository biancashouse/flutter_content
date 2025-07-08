// ignore_for_file: constant_identifier_names
import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/color_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/decimal_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';
import 'package:flutter_content/src/snippet/pnodes/string_pnode.dart';

part 'appbar_node.mapper.dart';

@MappableClass()
class AppBarNode extends SNode with AppBarNodeMappable {
  String? tabBarName;
  ColorModel? bgColor;
  ColorModel? fgColor;
  double? toolbarHeight;
  GenericSingleChildNode? leading;
  GenericSingleChildNode? title;
  GenericSingleChildNode? bottom;
  GenericMultiChildNode? actions;

  AppBarNode({
    this.tabBarName,
    this.bgColor,
    this.fgColor,
    this.toolbarHeight,
    this.leading,
    this.title,
    this.bottom,
    this.actions,
  });

  bool hasTabBar() => tabBarName != null && bottom?.child is TabBarNode;

  bool hasMenuBar() => bottom?.child is MenuBarNode;

  @override
  List<PNode> properties(BuildContext context, SNode? parentSNode) {
    // fco.logger.i("ContainerNode.properties()...");
    return [
      FlutterDocPNode(
          buttonLabel: 'AppBar',
          webLink: 'https://api.flutter.dev/flutter/material/AppBar-class.html',
          snode: this,
          name: 'fyi'),
      StringPNode(
        snode: this,
        name: 'TabBar name',
        stringValue: tabBarName,
        skipHelperText: true,
        onStringChange: (newValue) =>
            refreshWithUpdate(context,() => tabBarName = newValue!),
        calloutButtonSize: const Size(280, 70),
        calloutWidth: 400,
        numLines: 1,
      ),
      DecimalPNode(
        snode: this,
        name: 'toolbarHeight',
        decimalValue: toolbarHeight,
        onDoubleChange: (newValue) =>
            refreshWithUpdate(context,() => toolbarHeight = newValue),
        calloutButtonSize: const Size(130, 20),
      ),
      ColorPNode(
        snode: this,
        name: 'bg color',
        tooltip: "The fill color to use for an app bar's Material.",
        color: bgColor,
        onColorChange: (newValue) =>
            refreshWithUpdate(context,() => bgColor = newValue),
        calloutButtonSize: const Size(130, 20),
      ),
      ColorPNode(
        snode: this,
        name: 'fg color',
        tooltip: 'The default color for Text and Icons within the app bar.',
        color: fgColor,
        onColorChange: (newValue) =>
            refreshWithUpdate(context,() => fgColor = newValue),
        calloutButtonSize: const Size(130, 20),
      ),
    ];
  }

  @override
  // no tabbar nor menubar
  Widget toWidget(BuildContext context, SNode? parentNode) {
    try {
      setParent(parentNode); // propagating parents down from root

      var actionWidgets = actions?.toWidgetProperty(context, this);
      var titleWidget = title?.toWidgetProperty(context, this);

      if (hasTabBar()) {
        toolbarHeight = kToolbarHeight;
      } else if (hasMenuBar()) toolbarHeight = kToolbarHeight;

      PreferredSizeWidget? bottomWidget;
      if (toolbarHeight != null) {
        bottomWidget = bottom?.toPreferredSizeWidgetProperty(
            context, 80, this);
      }

      try {
        var appBar = AppBar(
          key: createNodeWidgetGK(),
          title: titleWidget,
          // centerTitle: true,
          toolbarHeight: toolbarHeight,
          actions: actionWidgets,
          backgroundColor: bgColor?.flutterValue,
          foregroundColor: fgColor?.flutterValue,
          bottom: bottomWidget,
        );
        return appBar;
      } catch (e) {
        fco.logger.i('AppBarNode.toWidget() failed!');
        return Material(
          textStyle: const TextStyle(fontFamily: 'monospace', fontSize: 12),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Icon(Icons.error, color: Colors.red),
                const Gap(10),
                fco.coloredText(e.toString()),
              ],
            ),
          ),
        );
      }
    } catch (e) {
      return Error(
          key: createNodeWidgetGK(),
          FLUTTER_TYPE,
          color: Colors.red,
          size: 16,
          errorMsg: e.toString());
    }
  }

  @override
  bool canBeDeleted() =>
      (leading == null && title == null && bottom == null && actions == null);

  @override
  List<Widget> menuAnchorWidgets_WrapWith(
    NodeAction action,
    bool? skipHeading,
    ScrollControllerName? scName,
  ) {
    return [
      if (getParent() is! ScaffoldNode)
        ...super.menuAnchorWidgets_Heading(action, scName),
      if (getParent() is! ScaffoldNode)
        menuItemButton("Scaffold", ScaffoldNode, action, scName),
    ];
  }

  @override
  List<Type> replaceWithOnly() => [AppBarNode];

  @override
  List<Type> wrapCandidates() => [ScaffoldNode];

  @override
  List<Type> wrapWithOnly() => [ScaffoldNode];

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "AppBar";
}
