import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_cross_axis_alignment.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_main_axis_alignment.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_main_axis_size.dart';

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
