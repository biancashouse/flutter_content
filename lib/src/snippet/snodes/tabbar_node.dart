// ignore_for_file: constant_identifier_names

import 'dart:math';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/color_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/decimal_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/text_style_properties.dart';
import 'package:flutter_content/src/snippet/pnodes/string_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/text_style_pnodes.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tabbar_node.mapper.dart';

@MappableClass()
class TabBarNode extends MC with TabBarNodeMappable {
  String name;
  ColorModel? bgColor;
  TextStyleProperties labelTSPropGroup;
  ColorModel? selectedLabelColor;
  ColorModel? unselectedLabelColor;
  ColorModel? indicatorColor;
  double? indicatorWeight;
  int? selection;

  TabBarNode({
    required this.name,
    this.bgColor,
    required this.labelTSPropGroup,
    this.selectedLabelColor,
    this.unselectedLabelColor,
    this.indicatorColor,
    this.indicatorWeight = 2.0,
    this.selection,
    required super.children,
  });

  @JsonKey(includeFromJson: false, includeToJson: false)
  // used when a TabBar and TabBarView are used in a snippet's Scaffold
  TabController? tabC;

  @JsonKey(includeFromJson: false, includeToJson: false)
  final List<int> prevTabQ = [];

  @JsonKey(includeFromJson: false, includeToJson: false)
  final prevTabQSize = ValueNotifier<int>(0);

  @JsonKey(includeFromJson: false, includeToJson: false)
  // allow the listener to know when to skip adding index back onto Q after a back btn
  bool? backBtnPressed;

  @override
  TextStyleProperties? textStyleProperties() => labelTSPropGroup;

  @override
  void setTextStyleProperties(TextStyleProperties newProps) =>
      labelTSPropGroup = newProps;

  @override
  List<PNode> properties(BuildContext context, SNode? parentSNode) {
    var textStyleName = fco.findTextStyleName(fco.appInfo, labelTSPropGroup);
    textStyleName = textStyleName != null ? ': $textStyleName' : '';
    return [
      FlutterDocPNode(
          buttonLabel: 'TabBar',
          webLink:
          'https://api.flutter.dev/flutter/material/TabBar-class.html',
          snode: this,
          name: 'fyi'),
      StringPNode(
          snode: this,
          name: 'name',
          stringValue: name,
          skipHelperText: true,
          onStringChange: (newValue) =>
              refreshWithUpdate(context, () => name = newValue!),
          calloutButtonSize: const Size(280, 70),
          calloutWidth: 400,
          numLines: 1,
        ),
        PNode /*Group*/ (
          snode: this,
          name: 'colours',
          children: [
            ColorPNode(
              snode: this,
              name: 'b/g Color',
              color: bgColor,
              onColorChange: (newValue) =>
                  refreshWithUpdate(context, () => bgColor = newValue),
              calloutButtonSize: const Size(160, 20),
            ),
            ColorPNode(
              snode: this,
              name: 'selected label Color',
              color: selectedLabelColor,
              onColorChange: (newValue) => refreshWithUpdate(
                  context, () => selectedLabelColor = newValue),
              calloutButtonSize: const Size(160, 20),
            ),
            ColorPNode(
              snode: this,
              name: 'unselected label Color',
              color: unselectedLabelColor,
              onColorChange: (newValue) => refreshWithUpdate(
                  context, () => unselectedLabelColor = newValue),
              calloutButtonSize: const Size(180, 20),
            ),
          ],
        ),
      TextStyleWithoutColorPNode /*Group*/ (
        snode: this,
        name: 'labelStyle',
        textStyleProperties: labelTSPropGroup,
        onGroupChange: (newValue, refreshPTree) {
          refreshWithUpdate(context, () {
            labelTSPropGroup = newValue;
            if (refreshPTree) {
              forcePropertyTreeRefresh(context);
            }
          });
        },
      ),
        // TextStyleWithoutColorPNode /*Group*/ (
        //   snode: this,
        //   name: 'labelStyle',
        //   textStyleProperties: labelTSPropGroup,
        //   onGroupChange: (newValue, refreshPTree) {
        //     if (refreshPTree) {
        //       forcePropertyTreeRefresh(context);
        //     }
        //     refreshWithUpdate(context, () => labelTSPropGroup = newValue);
        //   },
        // ),
        // ColorPNode(
        //   snode: this,
        //   name: 'indicatorColor',
        //   colorValue: indicatorColorValue,
        //   onColorIntChange: (newValue) =>
        //       refreshWithUpdate(context,() => indicatorColorValue = newValue),
        //   calloutButtonSize: const Size(120, 20),
        // ),
        DecimalPNode(
          snode: this,
          name: 'indicatorWeight',
          decimalValue: indicatorWeight,
          onDoubleChange: (newValue) => refreshWithUpdate(context, () {
            if (newValue != indicatorWeight) indicatorWeight = newValue;
          }),
          calloutButtonSize: const Size(130, 20),
        ),
      ];
  }

  void _tabListenerF() {
    if (!(tabC?.indexIsChanging ?? true)) {
      if (!(backBtnPressed ?? false)) {
        prevTabQ.add(selection ?? 0);
        selection = tabC!.index;
        prevTabQSize.value = prevTabQ.length;
        // fco.logger.i("tab pressed: ${tabC!.index}, Q: ${prevTabQ.toString()}");
      } else {
        selection = tabC!.index;
        backBtnPressed = false;
      }
    }
  }

  void _createTabController(SnippetPanelState? spState, int numTabs) {
    if (!(spState?.mounted ?? false)) return;
    tabC?.dispose();
    tabC = TabController(vsync: spState!, length: numTabs);
    tabC!.addListener(_tabListenerF);
    spState.tabBars[name] = this;

    // tabC!.addListener(() {
    //   setState(() {
    //     _tabQ.clear();
    //     tabC?.animateTo(tabC?.index??0);
    //   });
    // });
  }

  void resetTabQandC() {
    prevTabQ.clear();
    selection = 0;
    tabC?.index = 0;
  }

  @override
  Widget toWidget(BuildContext context, SNode? parentNode,
      ) {
    try {
      setParent(parentNode);
      //ScrollControllerName? scName = EditablePage.name(context);
      //possiblyHighlightSelectedNode(scName);
      // find transformable scaffold node then its corr state object
      // TransformableScaffoldNode? tsNode = findNearestAncestorOfType(TransformableScaffoldNode) as TransformableScaffoldNode?;
      // TransformableScaffoldState? tState = tsNode?.nodeWidgetGK?.currentState as TransformableScaffoldState?;
      SnippetPanelState? spState = SnippetPanel.of(context);
      _createTabController(spState, children.length);
      List<Widget> tabs = [];
      for (SNode node in children) {
        tabs.add(Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          // if just text, simply render a Tab with text, otherwise render a Tab with a child widget
          child: node is TextNode
              ? Tab(text: (node).text)
              : Tab(child: node.toWidget(context, parentNode)),
        ));
      }
      final tabBar = TabBar(
        key: createNodeWidgetGK(),
        controller: tabC,
        tabs: tabs,
        labelColor: selectedLabelColor?.flutterValue,
        unselectedLabelColor: unselectedLabelColor?.flutterValue,
        labelPadding: EdgeInsets.all(10),
        labelStyle: labelTSPropGroup.toTextStyle(context),
        indicatorColor: indicatorColor?.flutterValue,
        indicatorWeight: indicatorWeight = 2.0,
        indicator: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(10.0),
        ),
      );
      tabC?.index = min(selection ?? 0, children.length - 1);
      try {
        return PreferredSize(
          preferredSize: const Size.fromHeight(100), //tabBar.preferredSize,
          child: Container(
            color: bgColor?.flutterValue ?? Colors.grey,
            child: tabBar,
          ),
        );
      } catch (e) {
        fco.logger.i('TabBarNode.toWidget() failed! ${e.toString()}');
        return Error(
            key: createNodeWidgetGK(), FLUTTER_TYPE, errorMsg: e.toString());
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
  bool canBeDeleted() => false;

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
