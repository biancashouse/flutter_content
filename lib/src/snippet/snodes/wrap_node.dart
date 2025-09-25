// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/decimal_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/enum_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_cross_axis_alignment.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_wrap_alignment.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_wrap_cross_alignment.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';

part 'wrap_node.mapper.dart';

@MappableClass()
class WrapNode extends MC with WrapNodeMappable {
  AxisEnum direction;
  WrapAlignmentEnumModel? alignment;
  WrapAlignmentEnumModel? runAlignment;
  WrapCrossAlignmentEnumModel? crossAxisAlignment;

  double? spacing;
  double? runSpacing;

  WrapNode({
    this.direction = AxisEnum.horizontal,
    this.spacing,
    this.runSpacing,
    this.alignment,
    this.runAlignment,
    this.crossAxisAlignment,
    required super.children,
  });

  @override
  List<PNode> propertyNodes(BuildContext context, SNode? parentSNode) => [
    FlutterDocPNode(
        buttonLabel: 'Wrap',
        webLink:
        'https://api.flutter.dev/flutter/widgets/Wrap-class.html',
        snode: this,
        name: 'fyi'), EnumPNode<AxisEnum?>(
          snode: this,
          name: 'axis',
          valueIndex: direction.index,
          onIndexChange: (newValue) => refreshWithUpdate(context,() => direction = AxisEnum.of(newValue) ?? AxisEnum.horizontal),
        ),
        DecimalPNode(
          snode: this,
          name: 'spacing',
          decimalValue: spacing,
          onDoubleChange: (newValue) => refreshWithUpdate(context,() => spacing = newValue),
          calloutButtonSize: const Size(140, 30),
        ),
        DecimalPNode(
          snode: this,
          name: 'runSpacing',
          decimalValue: runSpacing,
          onDoubleChange: (newValue) => refreshWithUpdate(context,() => runSpacing = newValue),
          calloutButtonSize: const Size(140, 30),
        ),
        EnumPNode<WrapAlignmentEnumModel?>(
          snode: this,
          name: 'alignment',
          valueIndex: alignment?.index,
          onIndexChange: (newValue) => refreshWithUpdate(context,() => alignment = WrapAlignmentEnumModel.of(newValue)),
        ),
        EnumPNode<CrossAxisAlignmentEnumModel?>(
          snode: this,
          name: 'crossAlignment',
          valueIndex: crossAxisAlignment?.index,
          onIndexChange: (newValue) => refreshWithUpdate(context,() => crossAxisAlignment = WrapCrossAlignmentEnumModel.of(newValue)),
        ),
      ];

  @override
  Widget buildFlutterWidget(BuildContext context, SNode? parentNode) {
    setParent(parentNode);
    //ScrollControllerName? scName = EditablePage.name(context);
    //possiblyHighlightSelectedNode(scName);
    return Wrap(
        key: createNodeWidgetGK(),
        direction: direction.flutterValue,
        alignment: alignment?.flutterValue ?? WrapAlignment.start,
        runAlignment: runAlignment?.flutterValue ?? WrapAlignment.start,
        crossAxisAlignment: crossAxisAlignment?.flutterValue ?? WrapCrossAlignment.center,
        spacing: spacing ?? 0.0,
        runSpacing: runSpacing ?? 0.0,
        children: children.map((node) => node.buildFlutterWidget(context, this)).toList(),
    );
  }

  @override
  List<Type> addChildRecommendations() => [ExpandedNode, FlexibleNode];

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "Wrap";
}
