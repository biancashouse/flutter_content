// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_cross_axis_alignment.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_wrap_alignment.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_wrap_cross_alignment.dart';

part 'wrap_node.mapper.dart';

@MappableClass()
class WrapNode extends MC with WrapNodeMappable {
  AxisEnum direction;
  WrapAlignmentEnum? alignment;
  WrapAlignmentEnum? runAlignment;
  WrapCrossAlignmentEnum? crossAxisAlignment;

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
  List<PTreeNode> properties(BuildContext context) => [
        EnumPropertyValueNode<AxisEnum?>(
          snode: this,
          name: 'axis',
          valueIndex: direction.index,
          onIndexChange: (newValue) => refreshWithUpdate(() => direction = AxisEnum.of(newValue) ?? AxisEnum.horizontal),
        ),
        DecimalPropertyValueNode(
          snode: this,
          name: 'spacing',
          decimalValue: spacing,
          onDoubleChange: (newValue) => refreshWithUpdate(() => spacing = newValue),
          calloutButtonSize: const Size(140, 30),
        ),
        DecimalPropertyValueNode(
          snode: this,
          name: 'runSpacing',
          decimalValue: runSpacing,
          onDoubleChange: (newValue) => refreshWithUpdate(() => runSpacing = newValue),
          calloutButtonSize: const Size(140, 30),
        ),
        EnumPropertyValueNode<WrapAlignmentEnum?>(
          snode: this,
          name: 'alignment',
          valueIndex: alignment?.index,
          onIndexChange: (newValue) => refreshWithUpdate(() => alignment = WrapAlignmentEnum.of(newValue)),
        ),
        EnumPropertyValueNode<CrossAxisAlignmentEnum?>(
          snode: this,
          name: 'crossAlignment',
          valueIndex: crossAxisAlignment?.index,
          onIndexChange: (newValue) => refreshWithUpdate(() => crossAxisAlignment = WrapCrossAlignmentEnum.of(newValue)),
        ),
      ];

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    setParent(parentNode);
    ScrollControllerName? scName = EditablePage.name(context);
    possiblyHighlightSelectedNode(scName);
    return Wrap(
        key: createNodeGK(),
        direction: direction.flutterValue,
        alignment: alignment?.flutterValue ?? WrapAlignment.start,
        runAlignment: runAlignment?.flutterValue ?? WrapAlignment.start,
        crossAxisAlignment: crossAxisAlignment?.flutterValue ?? WrapCrossAlignment.center,
        spacing: spacing ?? 0.0,
        runSpacing: runSpacing ?? 0.0,
        children: children.map((node) => node.toWidget(context, this)).toList(),
    );
  }

  @override
  List<Type> addChildRecommendations() => [ExpandedNode, FlexibleNode];

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "Wrap";
}
