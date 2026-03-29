import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enum_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_cross_axis_alignment.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_main_axis_alignment.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_main_axis_size.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../pnodes/fyi_pnodes.dart';

part 'flex_node.mapper.dart';

@MappableClass(
  discriminatorKey: 'DK:flex',
  includeSubClasses: flexSubClasses,
  hook: PropertyRenameHook(
    'flex',
    'DK:flex',
  ), // 'first_name' -> JSON key, 'firstName' -> Dart field name
)
class FlexNode extends MC with FlexNodeMappable {
  AxisEnum direction;
  MainAxisAlignmentEnumModel? mainAxisAlignment;
  MainAxisSizeEnum? mainAxisSize;
  CrossAxisAlignmentEnumModel? crossAxisAlignment;

  @JsonKey(includeFromJson: false, includeToJson: false)
  bool? wrapInExpanded;

  FlexNode({
    required this.direction,
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
    EnumPNode<AxisEnum?>(
      snode: this,
      name: 'direction',
      valueIndex: direction.index,
      onIndexChange: (newValue) => refreshWithUpdate(
        context,
        () => direction = AxisEnum.of(newValue) ?? AxisEnum.vertical,
      ),
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
  ) {
    return [
      ...super.menuAnchorWidgets_Heading(context, action),
      menuItemButton(context, "Expanded", ExpandedNode, action),
      menuItemButton(context, "Flexible", FlexibleNode, action),
      ...super.menuAnchorWidgets_WrapWith(context, action, true),
    ];
  }

  @override
  Widget buildFlutterWidget(BuildContext context, SNode? parentNode) {
    try {
      setParent(parentNode);
      //ScrollControllerName? scName = EditablePage.name(context);
      //possiblyHighlightSelectedNode(scName);

      // if (!(wrapInExpanded??false))
      // WidgetsBinding.instance.addPostFrameCallback((_) {
      //   // This code runs after the layout and paint phases are complete.
      //
      //   // It's now safe to get the RenderObject and its size.
      //   // Use the GlobalKey of the parent to get its context.
      //   if (nodeWidgetGK?.currentContext != null) {
      //     final RenderBox? renderBox =
      //     nodeWidgetGK?.currentContext!.findRenderObject() as RenderBox?;
      //     if (renderBox != null && renderBox.hasSize) {
      //       final Size parentSize = renderBox.size;
      //       print('${toString()} size is now available: $parentSize');
      //       // --- YOUR LOGIC THAT NEEDS THE PARENT'S SIZE GOES HERE ---
      //     } else {
      //       SnippetRootNode?  srn = this.rootNodeOfSnippet();
      //       print('Snippet: ${srn?.name}: this (${parentNode.toString()}) size is MISSING!');
      //       wrapInExpanded = true;
      //       fco.forceRefresh();
      //     }
      //   }
      // });

      // first get flex children widgets
      // print('getting flex child widgets...');
      List<Widget> flexChildWidgets = children
          .map((childNode) => childNode.buildFlutterWidget(context, this))
          .toList();

      // print('getting flex widget...');
      var flex = Flex(
        direction: this is RowNode ? Axis.horizontal : Axis.vertical,
        key: createNodeWidgetGK(),
        mainAxisAlignment:
            mainAxisAlignment?.flutterValue ?? MainAxisAlignment.start,
        mainAxisSize: mainAxisSize?.flutterValue ?? MainAxisSize.min,
        crossAxisAlignment:
            crossAxisAlignment?.flutterValue ?? CrossAxisAlignment.center,
        textBaseline: TextBaseline.alphabetic,
        children: flexChildWidgets,
      );

      return false && parentNode is FlexNode
          ? Expanded(child: flex)
          : LayoutBuilder(
              builder: (context, constraints) {
                bool rowConstraintError =
                    (this is RowNode &&
                    constraints.maxWidth == double.infinity);
                bool columnConstraintError =
                    (this is ColumnNode &&
                    constraints.maxHeight == double.infinity);
                return rowConstraintError || columnConstraintError
                    ? Error(
                        key: createNodeWidgetGK(),
                        "${toString()} $uid",
                        color: Colors.red,
                        size: 16,
                        errorMsg:
                            "${toString()} Parent has an infinite ${this is RowNode ? 'maxWidth' : 'maxHeight'} Constraints Error!",
                      )
                    : flex;
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
