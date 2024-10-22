// ignore_for_file: constant_identifier_names

import 'dart:math';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/text_style_group.dart';
import 'package:gap/gap.dart';

part 'tabbar_node.mapper.dart';

@MappableClass()
class TabBarNode extends MC with TabBarNodeMappable {
  int? bgColorValue;
  TextStyleGroup? labelStyleGroup;
  int? selectedLabelColorValue;
  int? unselectedLabelColorValue;
  int? indicatorColorValue;
  EdgeInsetsValue? padding;
  double? indicatorWeight;
  int? selection;

  TabBarNode({
    this.bgColorValue,
    this.labelStyleGroup,
    this.selectedLabelColorValue,
    this.unselectedLabelColorValue,
    this.indicatorColorValue,
    this.padding,
    this.indicatorWeight = 2.0,
    this.selection,
    required super.children,
  });

  @override
  List<PTreeNode> properties(BuildContext context) => [
        ColorPropertyValueNode(
          snode: this,
          name: 'b/g Color',
          colorValue: bgColorValue,
          onColorIntChange: (newValue) =>
              refreshWithUpdate(() => bgColorValue = newValue),
          calloutButtonSize: const Size(160, 20),
        ),
        TextStylePropertyGroup(
          snode: this,
          name: 'labelStyle',
          textStyleGroup: labelStyleGroup,
          onGroupChange: (newValue) =>
              refreshWithUpdate(() => labelStyleGroup = newValue),
        ),
        ColorPropertyValueNode(
          snode: this,
          name: 'selected label Color',
          colorValue: selectedLabelColorValue,
          onColorIntChange: (newValue) =>
              refreshWithUpdate(() => selectedLabelColorValue = newValue),
          calloutButtonSize: const Size(160, 20),
        ),
        ColorPropertyValueNode(
          snode: this,
          name: 'unselected label Color',
          colorValue: unselectedLabelColorValue,
          onColorIntChange: (newValue) =>
              refreshWithUpdate(() => unselectedLabelColorValue = newValue),
          calloutButtonSize: const Size(180, 20),
        ),
        ColorPropertyValueNode(
          snode: this,
          name: 'indicatorColor',
          colorValue: indicatorColorValue,
          onColorIntChange: (newValue) =>
              refreshWithUpdate(() => indicatorColorValue = newValue),
          calloutButtonSize: const Size(120, 20),
        ),
        PropertyGroup(
          snode: this,
          name: 'padding',
          children: [
            EdgeInsetsPropertyValueNode(
              snode: this,
              name: 'padding',
              eiValue: padding,
              onEIChangedF: (newValue) =>
                  refreshWithUpdate(() => padding = newValue),
            ),
          ],
        ),
        DecimalPropertyValueNode(
          snode: this,
          name: 'indicatorWeight',
          decimalValue: indicatorWeight,
          onDoubleChange: (newValue) => refreshWithUpdate(() {
            if (newValue != indicatorWeight) indicatorWeight = newValue;
          }),
          calloutButtonSize: const Size(130, 20),
        ),
      ];

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    try {
      setParent(parentNode);
      possiblyHighlightSelectedNode();
      // find transformable scaffold node then its corr state object
      // TransformableScaffoldNode? tsNode = findNearestAncestorOfType(TransformableScaffoldNode) as TransformableScaffoldNode?;
      // TransformableScaffoldState? tState = tsNode?.nodeWidgetGK?.currentState as TransformableScaffoldState?;
      SnippetPanelState? spState = SnippetPanel.of(context);
      spState?.createTabController(children.length);
      List<Widget> tabs = [];
      for (STreeNode node in children) {
            tabs.add(Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              // if just text, simply render a Tab with text, otherwise render a Tab with a child widget
              child: node is TextNode
                  ? Tab(text: (node as TextNode).text)
                  : Tab(child: node.toWidget(context, parentNode)),
            ));
          }
      final tabBar = TabBar(
            key: spState?.tabBarGK = createNodeGK(),
            controller: spState?.tabC,
            tabs: tabs,
            labelColor: selectedLabelColorValue != null
                ? Color(selectedLabelColorValue!)
                : null,
            unselectedLabelColor: unselectedLabelColorValue != null
                ? Color(unselectedLabelColorValue!)
                : null,
            labelPadding: EdgeInsets.all(10),
            labelStyle: labelStyleGroup?.toTextStyle(context),
            indicatorColor:
                indicatorColorValue != null ? Color(indicatorColorValue!) : null,
            indicatorWeight: indicatorWeight = 2.0,
            indicator: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: padding?.toEdgeInsets() ?? const EdgeInsets.all(10),
          );
      spState?.tabC?.index = min(selection ?? 0, children.length - 1);
      try {
            return PreferredSize(
              preferredSize: Size.fromHeight(100), //tabBar.preferredSize,
              child: Container(
                color: bgColorValue != null ? Color(bgColorValue!) : Colors.grey,
                child: tabBar,
              ),
            );
          } catch (e) {
            fco.logi('TabBarNode.toWidget() failed! ${e.toString()}');
            return Material(
              textStyle: const TextStyle(fontFamily: 'monospace', fontSize: 12),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    fco.errorIcon(Colors.red),
                    const Gap(10),
                    fco.coloredText(e.toString()),
                  ],
                ),
              ),
            );
          }
    } catch (e) {
      print(e);
      return const Column(
        children: [
          Text(FLUTTER_TYPE),
          Icon(Icons.error_outline, color: Colors.red, size: 32),
        ],
      );
    }
  }

  @override
  bool canBeDeleted() => children.isEmpty;

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "TabBar";
}

// class ColoredTabBar extends Container implements PreferredSizeWidget {
//   ColoredTabBar(this.color, this.tabBar);
//
//   final Color color;
//   final TabBar tabBar;
//
//   @override
//   Size get preferredSize => tabBar.preferredSize;
//
//   @override
//   Widget build(BuildContext context) => Container(
//         color: color,
//         child: tabBar,
//       );
// }
