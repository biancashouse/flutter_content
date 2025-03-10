// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_cross_axis_alignment.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_main_axis_alignment.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_main_axis_size.dart';

part 'column_node.mapper.dart';

@MappableClass()
class ColumnNode extends FlexNode with ColumnNodeMappable {
  ColumnNode({
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    required super.children,
  });

  // @override
  // List<PTreeNode> properties(BuildContext context, SNode? parentSNode) => [
  //       EnumPNode<MainAxisSizeEnum?>(
  //         snode: this,
  //         name: 'mainAxisSize',
  //         valueIndex: mainAxisSize?.index,
  //         onIndexChange: (newValue) => refreshWithUpdate(() => mainAxisSize = MainAxisSizeEnum.of(newValue)),
  //       ),
  //       EnumPNode<MainAxisAlignmentEnum?>(
  //         snode: this,
  //         name: 'mainAxisAlignment',
  //         valueIndex: mainAxisAlignment?.index,
  //         onIndexChange: (newValue) => refreshWithUpdate(() => mainAxisAlignment = MainAxisAlignmentEnum.of(newValue)),
  //       ),
  //       EnumPNode<CrossAxisAlignmentEnum?>(
  //         snode: this,
  //         name: 'crossAxisAlignment',
  //         valueIndex: crossAxisAlignment?.index,
  //         onIndexChange: (newValue) => refreshWithUpdate(() => crossAxisAlignment = CrossAxisAlignmentEnum.of(newValue)),
  //       ),
  //     ];

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

  // @override
  // Widget toWidget(BuildContext context, STreeNode? parentNode) {
  //   setParent(parentNode);
  //   possiblyHighlightSelectedNode();
  //   return possiblyCheckHeightConstraint(
  //     parentNode,
  //     Column(
  //       key: createNodeGK(),
  //       mainAxisAlignment: mainAxisAlignment?.flutterValue ?? MainAxisAlignment.start,
  //       mainAxisSize: mainAxisSize?.flutterValue ?? MainAxisSize.max,
  //       crossAxisAlignment: crossAxisAlignment?.flutterValue ?? CrossAxisAlignment.center,
  //       textBaseline: TextBaseline.alphabetic,
  //       children: children.map((node) => node.toWidget(context, this)).toList(),
  //     ),
  //   );
  // }

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "Column";
}
