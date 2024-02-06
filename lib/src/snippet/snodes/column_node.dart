// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_cross_axis_alignment.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_main_axis_alignment.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_main_axis_size.dart';
import 'package:flutter_content/src/bloc/capi_bloc.dart';

part 'column_node.mapper.dart';

@MappableClass()
class ColumnNode extends FlexNode with ColumnNodeMappable {
  ColumnNode({
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    required super.children,
  });

  @override
  List<PTreeNode> createPropertiesList(BuildContext context) => [
        EnumPropertyValueNode<MainAxisSizeEnum?>(
          snode: this,
          name: 'mainAxisSize',
          valueIndex: mainAxisSize?.index,
          onIndexChange: (newValue) => refreshWithUpdate(() => mainAxisSize = MainAxisSizeEnum.of(newValue)),
        ),
        EnumPropertyValueNode<MainAxisAlignmentEnum?>(
          snode: this,
          name: 'mainAxisAlignment',
          valueIndex: mainAxisAlignment?.index,
          onIndexChange: (newValue) => refreshWithUpdate(() => mainAxisAlignment = MainAxisAlignmentEnum.of(newValue)),
        ),
        EnumPropertyValueNode<CrossAxisAlignmentEnum?>(
          snode: this,
          name: 'crossAxisAlignment',
          valueIndex: crossAxisAlignment?.index,
          onIndexChange: (newValue) => refreshWithUpdate(() => crossAxisAlignment = CrossAxisAlignmentEnum.of(newValue)),
        ),
      ];

  // @override
  // String toSource(BuildContext context) {
  //   return '''Column(
  //       mainAxisAlignment: ${mainAxisAlignment?.toSource() ?? 'MainAxisAlignment.start'},
  //       mainAxisSize: ${mainAxisSize?.toSource() ?? 'MainAxisSize.max'},
  //       crossAxisAlignment: ${crossAxisAlignment?.toSource() ?? 'CrossAxisAlignment.center'},
  //       textBaseline: TextBaseline.alphabetic,
  //       children: ${children.map((node) => node.toSource(context)).toList()},
  //     )''';
  // }

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    setParent(parentNode);
    possiblyHighlightSelectedNode(context);
    return possiblyCheckHeightConstraint(
      parentNode,
      Column(
        key: nodeWidgetGK,
        mainAxisAlignment: mainAxisAlignment?.flutterValue ?? MainAxisAlignment.start,
        mainAxisSize: mainAxisSize?.flutterValue ?? MainAxisSize.max,
        crossAxisAlignment: crossAxisAlignment?.flutterValue ?? CrossAxisAlignment.center,
        textBaseline: TextBaseline.alphabetic,
        children: children.map((node) => node.toWidget(context, this)).toList(),
      ),
    );
  }

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "Column";
}
