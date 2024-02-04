// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/target_config/content/snippet_editor/node_properties/node_property_button_radio_menu.dart';

part 'enum_main_axis_alignment.mapper.dart';

@MappableEnum()
enum MainAxisAlignmentEnum  {
  start(MainAxisAlignment.start),
  end(MainAxisAlignment.end),
  center(MainAxisAlignment.center),
  space_between(MainAxisAlignment.spaceBetween),
  space_around(MainAxisAlignment.spaceAround),
  space_evenly(MainAxisAlignment.spaceEvenly);

  const MainAxisAlignmentEnum(this.flutterValue);

  final MainAxisAlignment flutterValue;

  
  String toSource() => 'MainAxisAlignment.$name';

  static Widget propertyNodeContents({
    int? enumValueIndex,
    required STreeNode snode,
    required String label,
    ValueChanged<int?>? onChangedF,
  }) =>
      NodePropertyButtonEnum(
        label: label,
        menuItems: values.map((e) => e.toMenuItem(snode is RowNode)).toList(),
        originalEnumIndex: enumValueIndex,
        onChangeF: (newIndex) {
          onChangedF?.call(newIndex);
          
        },
        wrap: true,
        calloutButtonSize: Size(snode is RowNode ? 260 : 200, snode is RowNode ? 60 : 100),
        calloutSize: Size(snode is RowNode ? 140 : 370, snode is RowNode ? 380 :120),
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

  // static EnumPropertyValueNode toEnumPropertyValueNode(
  //         MainAxisAlignmentEnum? value, Node snippetTreeNode, String label, ValueChanged<int?> onChange, bool isRow) =>
  //     EnumPropertyValueNode(
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
  //       menuItems: MainAxisAlignmentEnum.values.map((e) => e.toMenuItem(node is RowNode)).toList(),
  //       originalEnumIndex: node.mainAxisAlignment?.index,
  //       onChangeF: (newOption) {
  //         node.mainAxisAlignment = MainAxisAlignmentEnum.values[newOption];
  //         node.bloc.add(const CAPIEvent.forceRefresh());
  //       },
  //       wrap: node is! RowNode,
  //       calloutSize: calloutSize(isRow: node is RowNode),
  //     );

  static MainAxisAlignmentEnum? of(int? index) => index != null ? MainAxisAlignmentEnum.values.elementAtOrNull(index) : null;
}
