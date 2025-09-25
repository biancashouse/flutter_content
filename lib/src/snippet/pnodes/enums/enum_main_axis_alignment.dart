// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_button_enum.dart';

part 'enum_main_axis_alignment.mapper.dart';

@MappableEnum()
enum MainAxisAlignmentEnumModel  {
  start(MainAxisAlignment.start),
  end(MainAxisAlignment.end),
  center(MainAxisAlignment.center),
  space_between(MainAxisAlignment.spaceBetween),
  space_around(MainAxisAlignment.spaceAround),
  space_evenly(MainAxisAlignment.spaceEvenly);

  const MainAxisAlignmentEnumModel(this.flutterValue);

  final MainAxisAlignment flutterValue;

  
  String toSource() => 'MainAxisAlignment.$name';

  static Widget propertyNodeContents({
    int? enumValueIndex,
    required SNode snode,
    required String label,
    ValueChanged<int?>? onChangedF,
    required ScrollControllerName? scName,
  }) =>
      PropertyButtonEnum(
        label: label,
        menuItems: values.map((e) => e.toMenuItem(snode is RowNode)).toList(),
        originalEnumIndex: enumValueIndex,
        onChangeF: (newIndex) {
          onChangedF?.call(newIndex);
          
        },
        wrap: true,
        calloutButtonSize: Size(snode is RowNode ? 260 : 200, snode is RowNode ? 60 : 100),
        calloutSize: Size(snode is RowNode ? 140 : 370, snode is RowNode ? 380 :120),
        scName: scName,
      );


  List<Widget> allItems(bool isRow) => values.map((e) => e.toMenuItem(isRow)).toList();

  Widget toMenuItem(bool isRow) =>
      Tooltip(
        message: name,
        child: Transform.scale(
          scale: .7,
          child: Container(
            padding: const EdgeInsets.all(8),
            height: isRow ? 40 : 90,
            width: isRow ? 120 : 40,
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(3)),
              ),
            ),
            child: isRow
                ? Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: flutterValue,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _box(.7),
                _box(.7),
                _box(.7),
              ],
            )
                : SizedBox(
              width: 50,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: flutterValue,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _box(.5),
                  _box(.5),
                  _box(.5),
                ],
              ),
            ),
          ),
        ),
      );

  Widget _box(double factor) =>
      Container(
        width: 24 * factor,
        height: 16 * factor,
        // padding: EdgeInsets.all(4.0),
        decoration: const ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
        ),
      );

  // static EnumPNode toEnumPNode(
  //         MainAxisAlignmentEnumModel? value, Node snippetTreeNode, String label, ValueChanged<int?> onChange, bool isRow) =>
  //     EnumPNode(
  //       snippetTreeNode: snippetTreeNode,
  //       label: label,
  //       value: value,
  //       enumCalloutSize: calloutSize(isRow: isRow),
  //       enumValueWidgets: values.map((e) => e.toMenuItem(isRow)).toList(),
  //       originalEnumIndex: value?.index,
  //       wrap: true,
  //       onChange: onChange,
  //     );

  // Widget toPropertyButton(FlexNode node) =>
  //     NodePropertyButtonEnum(
  //       label: 'MainAxisAlignment',
  //       menuItems: MainAxisAlignmentEnumModel.values.map((e) => e.toMenuItem(node is RowNode)).toList(),
  //       originalEnumIndex: node.mainAxisAlignment?.index,
  //       onChangeF: (newOption) {
  //         node.mainAxisAlignment = MainAxisAlignmentEnumModel.values[newOption];
  //         node.bloc.add(const CAPIEvent.forceRefresh());
  //       },
  //       wrap: node is! RowNode,
  //       calloutSize: calloutSize(isRow: node is RowNode),
  //     );

  static MainAxisAlignmentEnumModel? of(int? index) => index != null ? MainAxisAlignmentEnumModel.values.elementAtOrNull(index) : null;
}
