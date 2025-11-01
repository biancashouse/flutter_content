// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/decimal_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';
import 'package:flutter_content/src/snippet/pnodes/int_pnode.dart';
import 'package:flutter_content/src/snippet/snodes/abstract_boxscrollview_node.dart';

import '../pnodes/edge_insets_pnode.dart';

part 'gridview_node.mapper.dart';

@MappableClass()
class GridViewNode extends BoxScrollViewNode with GridViewNodeMappable {
  List<SNode> children;
  int? crossAxisCount;
  double? mainAxisSpacing;
  double? crossAxisSpacing;

  GridViewNode({
    this.mainAxisSpacing,
    this.crossAxisSpacing,
    this.crossAxisCount,
    required this.children,
    super.padding,
    super.axis,
    super.shrinkWrap,
  });

  @override
  List<PNode> propertyNodes(BuildContext context, SNode? parentSNode) => [
    FlutterDocPNode(
        buttonLabel: 'GridView',
        webLink: 'https://api.flutter.dev/flutter/widgets/GridView-class.html',
        snode: this,
        name: 'fyi'),
    IntPNode(
      snode: this,
      name: 'crossAxisCount',
      intValue: crossAxisCount,
      onIntChange: (newValue) =>
          refreshWithUpdate(context, () => crossAxisCount = newValue),
      calloutButtonSize: const Size(130, 20),
    ),
    DecimalPNode(
      snode: this,
      name: 'mainAxisSpacing',
      decimalValue: mainAxisSpacing,
      onDoubleChange: (newValue) =>
          refreshWithUpdate(context, () => mainAxisSpacing = newValue),
      calloutButtonSize: const Size(130, 20),
    ),
    DecimalPNode(
      snode: this,
      name: 'crossAxisSpacing',
      decimalValue: crossAxisSpacing,
      onDoubleChange: (newValue) =>
          refreshWithUpdate(context, () => crossAxisSpacing = newValue),
      calloutButtonSize: const Size(130, 20),
    ),
    PNode /*Group*/ (
      snode: this,
      name: 'padding',
      children: [
        EdgeInsetsPNode(
            snode: this,
            name: 'padding',
            eiValue: padding,
            onEIChangedF: (newValue) {
              padding = newValue;
            }),
      ],
    ),
  ];

  @override
  Widget buildFlutterWidget(BuildContext context, SNode? parentNode) {
    try {
      setParent(parentNode);
      //ScrollControllerName? scName = EditablePage.name(context);
      //possiblyHighlightSelectedNode(scName);
      return LayoutBuilder(
        builder: (context, constraints) {
          bool constraintError = constraints.maxHeight == double.infinity;
          return constraintError
              ? Error(
            key: createNodeWidgetGK(),
            "${toString()} $uid",
            color: Colors.red,
            size: 16,
            errorMsg:
            "Parent ${toString()} has an infinite 'maxHeight'} Constraints Error!",
          )
              : GridView.count(
            crossAxisCount: crossAxisCount ?? 2,
            mainAxisSpacing: mainAxisSpacing??0.0,
            crossAxisSpacing: crossAxisSpacing??0.0,
            key: createNodeWidgetGK(),
            children: children
                .map(
                  (childNode) =>
                  childNode.buildFlutterWidget(context, this),
            )
                .toList(),
          );
        },
      );
    } catch (e) {
      return Error(
        key: createNodeWidgetGK(),
        toString(),
        color: Colors.red,
        size: 16,
        errorMsg: e.toString(),
      );
    }
  }

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "GridView";
}
