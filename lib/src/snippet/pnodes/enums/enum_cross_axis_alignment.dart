// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_button_enum.dart';

part 'enum_cross_axis_alignment.mapper.dart';

@MappableEnum()
enum CrossAxisAlignmentEnum  {
  start(CrossAxisAlignment.start),
  end(CrossAxisAlignment.end),
  center(CrossAxisAlignment.center),
  stretch(CrossAxisAlignment.stretch);
  // baseline;

  const CrossAxisAlignmentEnum(this.flutterValue);

  final CrossAxisAlignment flutterValue;

  
  String toSource() => 'CrossAxisAlignment.$name';

  static Widget propertyNodeContents({
    int? enumValueIndex,
    required STreeNode snode,
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
        calloutButtonSize: Size(snode is RowNode ? 260 : 200, snode is RowNode ? 70 : 120),
        calloutSize: Size(snode is RowNode ? 140 : 340, snode is RowNode ? 280 : 130),
        scName: scName,
      );

  Widget toMenuItem(bool isRow) {
    // fco.logi("isRow:$isRow CrossAxisAlignment toWidget ${name}");
    return Container(
      padding: const EdgeInsets.all(8),
      height: isRow ? 50 : 90,
      width: isRow ? 120 : 60,
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: flutterValue,
        children: [
          _box(1),
          _box(1),
          _box(1),
        ],
      )
          : SizedBox(
        width: 50,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: flutterValue,
          children: [
            _box(.5),
            _box(.5),
            _box(.5),
          ],
        ),
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
  //               crossAxisAlignment: toWidget({ThemeData? themeData}),
  //               children: [
  //                 _box(),
  //                 _box(),
  //                 _box(),
  //               ],
  //             )
  //           : Column(
  //               mainAxisSize: MainAxisSize.max,
  //               crossAxisAlignment: toWidget({ThemeData? themeData}),
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

  static CrossAxisAlignmentEnum? of(int? index) => index != null ? CrossAxisAlignmentEnum.values.elementAtOrNull(index) : null;

}
