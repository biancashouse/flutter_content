// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_button_enum.dart';

part 'enum_wrap_alignment.mapper.dart';

@MappableEnum()
enum WrapAlignmentEnum {
  start(WrapAlignment.start),
  end(WrapAlignment.end),
  center(WrapAlignment.center),
  space_between(WrapAlignment.spaceBetween),
  space_around(WrapAlignment.spaceAround),
  space_evenly(WrapAlignment.spaceEvenly);

  const WrapAlignmentEnum(this.flutterValue);

  final WrapAlignment flutterValue;

  String toSource() => 'WrapAlignment.$name';

  static Widget propertyNodeContents({
    int? enumValueIndex,
    required SNode snode,
    required String label,
    ValueChanged<int?>? onChangedF,
    required ScrollControllerName? scName,
  }) =>
      PropertyButtonEnum(
        label: label,
        menuItems: values.map((e) => e.toMenuItem()).toList(),
        originalEnumIndex: enumValueIndex,
        onChangeF: (newIndex) {
          onChangedF?.call(newIndex);
        },
        wrap: true,
        calloutButtonSize: const Size(260, 60),
        calloutSize: const Size(140, 380),
        scName: scName,
      );

  List<Widget> allItems(w) => values.map((e) => e.toMenuItem()).toList();

  Widget toMenuItem() => Tooltip(
        message: name,
        child: Transform.scale(
          scale: .7,
          child: Container(
              padding: const EdgeInsets.all(8),
              height: 40,
              width: 120,
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                ),
              ),
              child: Wrap(
                children: [
                  _box(.7),
                  _box(.7),
                  _box(.7),
                  _box(.7),
                  _box(.7),
                ],
              )),
        ),
      );

  Widget _box(double factor) => Container(
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
  //         WrapAlignmentEnum? value, Node snippetTreeNode, String label, ValueChanged<int?> onChange, bool isRow) =>
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
  //       label: 'WrapAlignment',
  //       menuItems: WrapAlignmentEnum.values.map((e) => e.toMenuItem(node is RowNode)).toList(),
  //       originalEnumIndex: node.WrapAlignment?.index,
  //       onChangeF: (newOption) {
  //         node.WrapAlignment = WrapAlignmentEnum.values[newOption];
  //         node.bloc.add(const CAPIEvent.forceRefresh());
  //       },
  //       wrap: node is! RowNode,
  //       calloutSize: calloutSize(isRow: node is RowNode),
  //     );

  static WrapAlignmentEnum? of(int? index) => index != null ? WrapAlignmentEnum.values.elementAtOrNull(index) : null;
}
