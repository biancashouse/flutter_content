import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_cross_axis_alignment.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_main_axis_alignment.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_main_axis_size.dart';
import 'package:gap/gap.dart';

part 'flex_node.mapper.dart';

@MappableClass(discriminatorKey: 'flex', includeSubClasses: flexSubClasses)
abstract class FlexNode extends MC with FlexNodeMappable {
  MainAxisAlignmentEnum? mainAxisAlignment;
  MainAxisSizeEnum? mainAxisSize;
  CrossAxisAlignmentEnum? crossAxisAlignment;

  FlexNode({
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.crossAxisAlignment,
    required super.children,
  });

  @override
  List<PTreeNode> properties(BuildContext context) => [
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
  List<Widget> menuAnchorWidgets_WrapWith(NodeAction action, bool? skipHeading) {
    return [
      ...super.menuAnchorWidgets_Heading(action),
      menuItemButton("Expanded", ExpandedNode, action),
      menuItemButton("Flexible", FlexibleNode, action),
      ...super.menuAnchorWidgets_WrapWith(action, true),
    ];
  }

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    setParent(parentNode);
    possiblyHighlightSelectedNode();
    Widget w;
    try {
      w = LayoutBuilder(builder: (context, constraints) {
        bool constraintsError = (this is RowNode && constraints.maxWidth == double.infinity) || (this is ColumnNode && constraints.maxHeight == double.infinity);
        return false && constraintsError
            ? _errorWidget()
            : Flex(
          direction: this is RowNode ? Axis.horizontal : Axis.vertical,
          key: createNodeGK(),
          mainAxisAlignment: mainAxisAlignment?.flutterValue ?? MainAxisAlignment.start,
          mainAxisSize: mainAxisSize?.flutterValue ?? MainAxisSize.max,
          crossAxisAlignment: crossAxisAlignment?.flutterValue ?? CrossAxisAlignment.center,
          textBaseline: TextBaseline.alphabetic,
          children: children.map((node) => node.toWidget(context, this)).toList(),
        );
      });
    } catch(e) {
      w = _errorWidget();
      fco.logi('Flex() failed to render properly. ===============================================');
    }
    return w;
  }

  Widget _errorWidget() => const Row(
        children: [
          Icon(
            Icons.error,
            color: Colors.red,
          ),
          Gap(10),
          Text('Row has infinite maxWidth constraint!'),
        ],
      );

  @override
  List<Type> addChildRecommendations() => [ExpandedNode, FlexibleNode];

// bool get isRow {
//   throw UnimplementedError('FlexNode.isRow !');
// }

// @override
// List<Widget> nodePropertyEditors(BuildContext context, {bool allowButtonCallouts = false}) => [
//       NodePropertyButtonEnum(
//         label: 'mainAxisAlignment',
//         menuItems: MainAxisAlignmentEnum.values.map((e) => e.toMenuItem(isRow)).toList(),
//         originalEnumIndex: mainAxisAlignment?.index,
//         onChangeF: (newOption) {
//           mainAxisAlignment = MainAxisAlignmentEnum.values[newOption];
//           bloc.add(const CAPIEvent.forceRefresh());
//         },
//         wrap: !isRow,
//         calloutSize: MainAxisAlignmentEnum.calloutSize(isRow: isRow),
//       ),
//       const SizedBox(width: 10, height: 10),
//       Container(
//         color: Colors.purple,
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             Text('mainAxisSize:'),
//             const SizedBox(width: 10),
//             MainAxisSizeEditor(
//               originalValue: mainAxisSize,
//               onChangedF: (newValue) {
//                 mainAxisSize = newValue;
//                 bloc.add(const CAPIEvent.forceRefresh());
//               },
//             ),
//           ],
//         ),
//       ),
//       // NodePropertyButtonRadioMenu(
//       //   label: 'mainAxisSize',
//       //   menuItems: NodeMainAxisSize.values.map((e) => e.toMenuItem()).toList(),
//       //   originalOption: mainAxisSize?.index,
//       //   onChangeF: (newOption) {
//       //     mainAxisSize = NodeMainAxisSize.values[newOption];
//       //     bloc.add(const CAPIEvent.forceRefresh());
//       //   },
//       //   calloutSize: NodeMainAxisSize.calloutSize,
//       // ),
//       NodePropertyButtonEnum(
//         label: 'crossAxisAlignment',
//         menuItems: CrossAxisAlignmentEnum.values.map((e) => e.toMenuItem(isRow)).toList(),
//         originalEnumIndex: crossAxisAlignment?.index,
//         onChangeF: (newOption) {
//           crossAxisAlignment = CrossAxisAlignmentEnum.values[newOption];
//           bloc.add(const CAPIEvent.forceRefresh());
//         },
//         wrap: !isRow,
//         calloutSize: CrossAxisAlignmentEnum.calloutSize(isRow: isRow),
//       ),
//     ];
}
