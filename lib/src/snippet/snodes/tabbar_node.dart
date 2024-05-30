// ignore_for_file: constant_identifier_names

import 'dart:math';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

import 'edgeinsets_node_value.dart';

part 'tabbar_node.mapper.dart';

@MappableClass()
class TabBarNode extends MC with TabBarNodeMappable {
  int? selectedLabelColorValue;
  int? unselectedLabelColorValue;
  int? indicatorColorValue;
  EdgeInsetsValue? padding;
  double? indicatorWeight;
  int? selection;

  TabBarNode({
    this.selectedLabelColorValue,
    this.unselectedLabelColorValue,
    this.indicatorColorValue,
    this.padding,
    this.indicatorWeight = 2.0,
    this.selection,
    required super.children,
  });

  @override
  List<PTreeNode> properties(BuildContext context) =>
      [
        ColorPropertyValueNode(
          snode: this,
          name: 'selected label Color',
          colorValue: selectedLabelColorValue,
          onColorIntChange: (newValue) => refreshWithUpdate(() => selectedLabelColorValue = newValue),
          calloutButtonSize: const Size(160, 20),
        ),
        ColorPropertyValueNode(
          snode: this,
          name: 'unselected label Color',
          colorValue: unselectedLabelColorValue,
          onColorIntChange: (newValue) => refreshWithUpdate(() => unselectedLabelColorValue = newValue),
          calloutButtonSize: const Size(180, 20),
        ),
        ColorPropertyValueNode(
          snode: this,
          name: 'indicatorColor',
          colorValue: indicatorColorValue,
          onColorIntChange: (newValue) => refreshWithUpdate(() => indicatorColorValue = newValue),
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
              onEIChangedF: (newValue) => refreshWithUpdate(() => padding = newValue),
            ),
          ],
        ),
        DecimalPropertyValueNode(
          snode: this,
          name: 'indicatorWeight',
          decimalValue: indicatorWeight,
          onDoubleChange: (newValue) =>
              refreshWithUpdate(() {
                if (newValue != indicatorWeight) indicatorWeight = newValue;
              }),
          calloutButtonSize: const Size(130, 20),
        ),
      ];

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
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
        padding: const EdgeInsets.all(8.0),
        child: node.toWidget(context, this),
      ));
    }
    spState?.tabC?.index = min(selection ?? 0, children.length-1);
    try {
      return TabBar(
        key: spState?.tabBarGK = createNodeGK(),
        controller: spState?.tabC,
        tabs: tabs,
        labelColor: selectedLabelColorValue != null ? Color(selectedLabelColorValue!) : null,
        unselectedLabelColor: unselectedLabelColorValue != null ? Color(unselectedLabelColorValue!) : null,
        indicatorColor: indicatorColorValue != null ? Color(indicatorColorValue!) : null,
        indicatorWeight: indicatorWeight = 2.0,
        indicator: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: padding?.toEdgeInsets() ?? const EdgeInsets.all(8),
      );
    } catch (e) {
      debugPrint('TabBarNode.toWidget() failed! ${e.toString()}');
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
  bool canBeDeleted() => children.isEmpty;

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "TabBar";
}
