// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_cross_axis_alignment.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_main_axis_alignment.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_main_axis_size.dart';

part 'row_node.mapper.dart';

@MappableClass()
class RowNode extends FlexNode with RowNodeMappable {
  RowNode({
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    required super.children,
  });

  @override
  List<PTreeNode> createPropertiesList(BuildContext context) => [
        EnumPropertyValueNode<MainAxisAlignmentEnum?>(
          snode: this,
          name: 'mainAxisAlignment',
          valueIndex: mainAxisAlignment?.index,
          onIndexChange: (newValue) => refreshWithUpdate(() => mainAxisAlignment = MainAxisAlignmentEnum.of(newValue)),
        ),
        EnumPropertyValueNode<MainAxisSizeEnum?>(
          snode: this,
          name: 'mainAxisSize',
          valueIndex: mainAxisSize?.index,
          onIndexChange: (newValue) => refreshWithUpdate(() => mainAxisSize = MainAxisSizeEnum.of(newValue)),
        ),
        EnumPropertyValueNode<CrossAxisAlignmentEnum?>(
          snode: this,
          name: 'crossAxisAlignment',
          valueIndex: crossAxisAlignment?.index,
          onIndexChange: (newValue) => refreshWithUpdate(() => crossAxisAlignment = CrossAxisAlignmentEnum.of(newValue)),
        ),
      ];

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    setParent(parentNode);
    possiblyHighlightSelectedNode();
    return LayoutBuilder(builder: (context, constraints) {
      return constraints.maxWidth == double.infinity
          ? Row(
              children: [
                const Icon(
                  Icons.error,
                  color: Colors.red,
                ),
                hspacer(10),
                const Text('Row has infinite maxWidth constraint!'),
              ],
            )
          : Row(
              key: createNodeGK(),
              mainAxisAlignment: mainAxisAlignment?.flutterValue ?? MainAxisAlignment.start,
              mainAxisSize: mainAxisSize?.flutterValue ?? MainAxisSize.max,
              crossAxisAlignment: crossAxisAlignment?.flutterValue ?? CrossAxisAlignment.center,
              textBaseline: TextBaseline.alphabetic,
              children: children.map((node) => node.toWidget(context, this)).toList(),
            );
    });
  }

  @override
  String toSource(BuildContext context) {
    return '''Row(
    mainAxisAlignment: ${mainAxisAlignment?.flutterValue ?? 'MainAxisAlignment.start'},
    mainAxisSize: ${mainAxisSize?.flutterValue ?? 'MainAxisSize.max'},
    crossAxisAlignment: ${crossAxisAlignment?.flutterValue ?? 'CrossAxisAlignment.center'},
    textBaseline: TextBaseline.alphabetic,
    children: ${children.map((node) => node.toSource(context)).toList()},
  )''';
  }

  @override
  List<Type> addChildRecommendations() => [ExpandedNode, FlexibleNode];


  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "Row";
}
