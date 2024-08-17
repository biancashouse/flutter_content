// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_button_enum.dart';

part 'enum_wrap_cross_alignment.mapper.dart';

@MappableEnum()
enum WrapCrossAlignmentEnum  {
  start(WrapCrossAlignment.start),
  end(WrapCrossAlignment.end),
  center(WrapCrossAlignment.center);

  const WrapCrossAlignmentEnum(this.flutterValue);

  final WrapCrossAlignment flutterValue;

  
  String toSource() => 'WrapCrossAlignment.$name';

  static Widget propertyNodeContents({
    int? enumValueIndex,
    required STreeNode snode,
    required String label,
    ValueChanged<int?>? onChangedF,
  }) =>
      PropertyButtonEnum(
        label: label,
        menuItems: values.map((e) => e.toMenuItem(snode is RowNode)).toList(),
        originalEnumIndex: enumValueIndex,
        onChangeF: (newIndex) {
          onChangedF?.call(newIndex);
          
        },
        wrap: true,
        calloutButtonSize: Size(260, 70),
        calloutSize: Size(140, 20),
      );

  Widget toMenuItem(bool isRow) {
    // fco.logi("isRow:$isRow WrapCrossAlignment toWidget ${name}");
    return Container(
      padding: const EdgeInsets.all(8),
      height: 50,
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
          _box(1),
          _box(1),
          _box(1),
          _box(1),
          _box(1),
          _box(1),
        ],
      ),
    );
  }

  // Widget toMenuItem(bool isRow) => Container(
  //       padding: EdgeInsets.all(8),
  //       width: 120,
  //       decoration: const ShapeDecoration(
  //         color: Colors.white,
  //         shape: RoundedRectangleBorder(
  //           side: BorderSide(color: Colors.grey, width: 1),
  //           borderRadius: BorderRadius.all(Radius.circular(6)),
  //         ),
  //       ),
  //       child: isRow
  //           ? Row(
  //               mainAxisSize: MainAxisSize.min,
  //               WrapCrossAlignment: toWidget({ThemeData? themeData}),
  //               children: [
  //                 _box(),
  //                 _box(),
  //                 _box(),
  //               ],
  //             )
  //           : Column(
  //               mainAxisSize: MainAxisSize.max,
  //               WrapCrossAlignment: toWidget({ThemeData? themeData}),
  //               children: [
  //                 _box(),
  //                 _box(),
  //                 _box(),
  //               ],
  //             ),
  //     );

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

  static WrapCrossAlignmentEnum? of(int? index) => index != null ? WrapCrossAlignmentEnum.values.elementAtOrNull(index) : null;

}
