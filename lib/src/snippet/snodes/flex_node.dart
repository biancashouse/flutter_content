import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enum_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_cross_axis_alignment.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_main_axis_alignment.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_main_axis_size.dart';

import '../pnodes/fyi_pnodes.dart';

part 'flex_node.mapper.dart';

@MappableClass(discriminatorKey: 'flex', includeSubClasses: flexSubClasses)
abstract class FlexNode extends MC with FlexNodeMappable {
  MainAxisAlignmentEnumModel? mainAxisAlignment;
  MainAxisSizeEnum? mainAxisSize;
  CrossAxisAlignmentEnumModel? crossAxisAlignment;

  FlexNode({
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.crossAxisAlignment,
    required super.children,
  });

  @override
  List<PNode> propertyNodes(BuildContext context, SNode? parentSNode) => [
    FlutterDocPNode(
      buttonLabel: 'Flex',
      webLink: 'https://api.flutter.dev/flutter/widgets/Flex-class.html',
      snode: this,
      name: 'fyi',
    ),
    EnumPNode<MainAxisAlignmentEnumModel?>(
      snode: this,
      name: 'mainAxisAlignment',
      valueIndex: mainAxisAlignment?.index,
      onIndexChange: (newValue) => refreshWithUpdate(
        context,
        () => mainAxisAlignment = MainAxisAlignmentEnumModel.of(newValue),
      ),
    ),
    EnumPNode<MainAxisSizeEnum?>(
      snode: this,
      name: 'mainAxisSize',
      valueIndex: mainAxisSize?.index,
      onIndexChange: (newValue) => refreshWithUpdate(
        context,
        () => mainAxisSize = MainAxisSizeEnum.of(newValue),
      ),
    ),
    EnumPNode<CrossAxisAlignmentEnumModel?>(
      snode: this,
      name: 'crossAxisAlignment',
      valueIndex: crossAxisAlignment?.index,
      onIndexChange: (newValue) => refreshWithUpdate(
        context,
        () => crossAxisAlignment = CrossAxisAlignmentEnumModel.of(newValue),
      ),
    ),
  ];

  @override
  List<Widget> menuAnchorWidgets_WrapWith(
    BuildContext context,
    NodeAction action,
    bool? skipHeading,
    ScrollControllerName? scName,
  ) {
    return [
      ...super.menuAnchorWidgets_Heading(context, action, scName),
      menuItemButton(context, "Expanded", ExpandedNode, action, scName),
      menuItemButton(context, "Flexible", FlexibleNode, action, scName),
      ...super.menuAnchorWidgets_WrapWith(context, action, true, scName),
    ];
  }

  @override
  Widget buildFlutterWidget(BuildContext context, SNode? parentNode) {
    try {
      setParent(parentNode);
      //ScrollControllerName? scName = EditablePage.name(context);
      //possiblyHighlightSelectedNode(scName);
      return LayoutBuilder(
        builder: (context, constraints) {
          bool rowConstraintError =
              (this is RowNode && constraints.maxWidth == double.infinity);
          bool columnConstraintError =
              (this is ColumnNode && constraints.maxHeight == double.infinity);
          return rowConstraintError || columnConstraintError
              ? Error(
                  key: createNodeWidgetGK(),
                  "${toString()} ${uid}",
                  color: Colors.red,
                  size: 16,
                  errorMsg:
                      "${toString()} Parent has an infinite ${this is RowNode ? 'maxWidth' : 'maxHeight'} Constraints Error!",
                )
              : Flex(
                  direction: this is RowNode ? Axis.horizontal : Axis.vertical,
                  key: createNodeWidgetGK(),
                  mainAxisAlignment:
                      mainAxisAlignment?.flutterValue ??
                      MainAxisAlignment.start,
                  mainAxisSize: mainAxisSize?.flutterValue ?? MainAxisSize.min,
                  crossAxisAlignment:
                      crossAxisAlignment?.flutterValue ??
                      CrossAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
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
  List<Type> wrapWithRecommendations() => [
    ExpandedNode,
    FlexibleNode,
    // PositionedNode,
    // AlignNode,
  ];

  @override
  List<Type> addChildRecommendations() => [ExpandedNode, FlexibleNode];

  // bool get isRow {
  //   throw UnimplementedError('FlexNode.isRow !');
  // }

  // @override
  // List<Widget> nodePropertyEditors(BuildContext context, {bool allowButtonCallouts = false}) => [
  //       NodePropertyButtonEnum(
  //         label: 'mainAxisAlignment',
  //         menuItems: MainAxisAlignmentEnumModel.values.map((e) => e.toMenuItem(isRow)).toList(),
  //         originalEnumIndex: mainAxisAlignment?.index,
  //         onChangeF: (newOption) {
  //           mainAxisAlignment = MainAxisAlignmentEnumModel.values[newOption];
  //           bloc.add(const CAPIEvent.forceRefresh());
  //         },
  //         wrap: !isRow,
  //         calloutSize: MainAxisAlignmentEnumModel.calloutSize(isRow: isRow),
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
  //         menuItems: CrossAxisAlignmentEnumModel.values.map((e) => e.toMenuItem(isRow)).toList(),
  //         originalEnumIndex: crossAxisAlignment?.index,
  //         onChangeF: (newOption) {
  //           crossAxisAlignment = CrossAxisAlignmentEnumModel.values[newOption];
  //           bloc.add(const CAPIEvent.forceRefresh());
  //         },
  //         wrap: !isRow,
  //         calloutSize: CrossAxisAlignmentEnumModel.calloutSize(isRow: isRow),
  //       ),
  //     ];

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "Flex";
}
