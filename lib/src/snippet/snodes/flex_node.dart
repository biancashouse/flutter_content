import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enum_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_cross_axis_alignment.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_main_axis_alignment.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_main_axis_size.dart';
import 'package:gap/gap.dart';

import '../pnodes/fyi_pnodes.dart';

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
  List<PNode> properties(BuildContext context, SNode? parentSNode) => [
        FlutterDocPNode(
            buttonLabel: 'Flex',
            webLink:
                'https://api.flutter.dev/flutter/widgets/Flex-class.html',
            snode: this,
            name: 'fyi'),
        EnumPNode<MainAxisAlignmentEnum?>(
          snode: this,
          name: 'mainAxisAlignment',
          valueIndex: mainAxisAlignment?.index,
          onIndexChange: (newValue) => refreshWithUpdate(context,
              () => mainAxisAlignment = MainAxisAlignmentEnum.of(newValue)),
        ),
        EnumPNode<MainAxisSizeEnum?>(
          snode: this,
          name: 'mainAxisSize',
          valueIndex: mainAxisSize?.index,
          onIndexChange: (newValue) => refreshWithUpdate(
              context, () => mainAxisSize = MainAxisSizeEnum.of(newValue)),
        ),
        EnumPNode<CrossAxisAlignmentEnum?>(
          snode: this,
          name: 'crossAxisAlignment',
          valueIndex: crossAxisAlignment?.index,
          onIndexChange: (newValue) => refreshWithUpdate(context,
              () => crossAxisAlignment = CrossAxisAlignmentEnum.of(newValue)),
        ),
      ];

  @override
  List<Widget> menuAnchorWidgets_WrapWith(
    NodeAction action,
    bool? skipHeading,
    ScrollControllerName? scName,
  ) {
    return [
      ...super.menuAnchorWidgets_Heading(action, scName),
      menuItemButton("Expanded", ExpandedNode, action, scName),
      menuItemButton("Flexible", FlexibleNode, action, scName),
      ...super.menuAnchorWidgets_WrapWith(action, true, scName),
    ];
  }

  @override
  Widget toWidget(BuildContext context, SNode? parentNode,
      {bool showTriangle = false}) {
    try {
      setParent(parentNode);
      //ScrollControllerName? scName = EditablePage.name(context);
      //possiblyHighlightSelectedNode(scName);
      Widget w;
      try {
        w = LayoutBuilder(builder: (context, constraints) {
          // bool constraintsError = (this is RowNode && constraints.maxWidth == double.infinity) || (this is ColumnNode && constraints.maxHeight == double.infinity);
          return Flex(
            direction: this is RowNode ? Axis.horizontal : Axis.vertical,
            key: createNodeWidgetGK(),
            mainAxisAlignment:
                mainAxisAlignment?.flutterValue ?? MainAxisAlignment.start,
            mainAxisSize: mainAxisSize?.flutterValue ?? MainAxisSize.max,
            crossAxisAlignment:
                crossAxisAlignment?.flutterValue ?? CrossAxisAlignment.center,
            textBaseline: TextBaseline.alphabetic,
            children:
                children.map((node) => node.toWidget(context, this)).toList(),
          );
        });
      } catch (e) {
        w = _Error();
        fco.logger.i(
            'Flex() failed to render properly. ===============================================');
      }
      return w;
    } catch (e) {
      return Error(
          key: createNodeWidgetGK(),
          FLUTTER_TYPE,
          color: Colors.red,
          size: 16,
          errorMsg: e.toString());
    }
  }

  Widget _Error() => const Row(
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

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "Flex";
}
