// ignore_for_file: constant_identifier_names
import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/decimal_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';
import 'package:flutter_content/src/snippet/snodes/text_style_hook.dart';

part 'sliver_appbar_node.mapper.dart';

const COLLAPSED_HEIGHT = 64.0;
// final LARGE_EXPANDED_HEIGHT = 152.0;
// final MEDIUM_EXPANDED_HEIGHT = 112.0;

@MappableClass()
class SliverAppBarNode extends AppBarNode with SliverAppBarNodeMappable {
  double? collapsedHeight;
  double? expandedHeight;
  bool? large;
  bool? medium;
  NamedSC? flexibleSpace;

  SliverAppBarNode({
    this.collapsedHeight,
    this.expandedHeight,
    this.flexibleSpace,
    super.bgColor,
    super.fgColor,
    super.toolbarHeight,
    required super.titleTextStyle,
    required super.leading,
    required super.title,
    required super.bottom,
    required super.actions,
  });

  @override
  bool hasTabBar() => bottom.child is TabBarNode;

  @override
  bool hasMenuBar() => bottom.child is MenuBarNode;

  @override
  List<PNode> propertyNodes(BuildContext context, SNode? parentSNode) {
    // fco.logger.i("ContainerNode.properties()...");
    return [
      FlutterDocPNode(
        buttonLabel: 'SliverAppBar',
        webLink:
            'https://api.flutter.dev/flutter/material/SliverAppBar-class.html',
        snode: this,
        name: 'fyi',
      ),
      DecimalPNode(
        snode: this,
        name: 'collapsedHeight',
        decimalValue: collapsedHeight,
        onDoubleChange: (newValue) =>
            refreshWithUpdate(context, () => collapsedHeight = newValue),
        calloutButtonSize: const Size(130, 20),
      ),
      DecimalPNode(
        snode: this,
        name: 'expandedHeight',
        decimalValue: expandedHeight,
        onDoubleChange: (newValue) =>
            refreshWithUpdate(context, () => expandedHeight = newValue),
        calloutButtonSize: const Size(130, 20),
      ),
      ...super.propertyNodes(context, parentSNode),
    ];
  }

  @override
  // no tabbar nor menubar
  Widget buildFlutterWidget(BuildContext context, SNode? parentNode) {
    try {
      setParent(parentNode); // propagating parents down from root

      var actionWidgets = actions.toWidgetProperty(context, this);
      Widget? titleWidget;
      if (flexibleSpace == null) {
        titleWidget = title.buildFlutterWidget(context, this);
      }
      var flexibleSpaceWidget = flexibleSpace?.buildFlutterWidget(context, this);

      // if (hasTabBar()) {
      //   toolbarHeight = kToolbarHeight;
      // } else if (hasMenuBar()) {
      //   toolbarHeight = kToolbarHeight;
      // }
      if (large ?? false) {
        toolbarHeight = COLLAPSED_HEIGHT;
      } else if (medium ?? false) {
        toolbarHeight = COLLAPSED_HEIGHT;
      } else {
        toolbarHeight = kToolbarHeight;
      }
      PreferredSizeWidget? bottomWidget;
      if (toolbarHeight != null) {
        bottomWidget = bottom.buildPreferredSizeFlutterWidget(context, this);
      }

      try {
        late SliverAppBar sliverAppBar;
        if (large ?? false) {
          sliverAppBar = SliverAppBar.large(
            key: createNodeWidgetGK(),
            title: titleWidget,
            collapsedHeight: collapsedHeight,
            expandedHeight: expandedHeight,
            flexibleSpace: flexibleSpaceWidget,
            toolbarHeight: toolbarHeight ?? kToolbarHeight,
            actions: actionWidgets,
            backgroundColor: bgColor?.flutterValue,
            foregroundColor: fgColor?.flutterValue,
            bottom: bottomWidget,
          );
        } else if (medium ?? false) {
          sliverAppBar = SliverAppBar.medium(
            key: createNodeWidgetGK(),
            title: titleWidget,
            collapsedHeight: collapsedHeight,
            expandedHeight: expandedHeight,
            toolbarHeight: toolbarHeight ?? COLLAPSED_HEIGHT,
            actions: actionWidgets,
            backgroundColor: bgColor?.flutterValue,
            foregroundColor: fgColor?.flutterValue,
            bottom: bottomWidget,
          );
        } else {
          sliverAppBar = SliverAppBar(
            key: createNodeWidgetGK(),
            title: titleWidget,
            collapsedHeight: collapsedHeight,
            expandedHeight: expandedHeight,
            toolbarHeight: toolbarHeight ?? COLLAPSED_HEIGHT,
            actions: actionWidgets,
            backgroundColor: bgColor?.flutterValue,
            foregroundColor: fgColor?.flutterValue,
            bottom: bottomWidget,
          );
        }
        return sliverAppBar;
      } catch (e) {
        fco.logger.i('SliverAppBarNode.toWidget() failed!');
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
        errorMsg: e.toString(),
      );
    }
  }

  @override
  bool canAppendAChild() => flexibleSpace == null;

  @override
  List<Widget> menuAnchorWidgets_Append(
    BuildContext context,
    NodeAction action,
    bool? skipHeading,
    ScrollControllerName? scName,
  ) {
    return [
      if (!(skipHeading ?? false))
        ...menuAnchorWidgets_Heading(context, action, scName),
      menuItemButton(
        context,
        "FlexibleSpaceBar",
        FlexibleSpaceBarNode,
        action,
        scName,
      ),
    ];
  }

  @override
  List<Widget> menuAnchorWidgets_WrapWith(
    BuildContext context,
    NodeAction action,
    bool? skipHeading,
    ScrollControllerName? scName,
  ) {
    return [
      if (getParent() is! ScaffoldNode)
        ...super.menuAnchorWidgets_Heading(context, action, scName),
      if (getParent() is! ScaffoldNode)
        menuItemButton(context, "Scaffold", ScaffoldNode, action, scName),
    ];
  }

  @override
  bool canRemove() => true;

  @override
  List<Type> replaceWithOnly() => [SliverAppBarNode];

  @override
  List<Type> wrapCandidates() => [ScaffoldNode];

  @override
  List<Type> wrapWithOnly() => [ScaffoldNode];

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "SliverAppBar";
}
