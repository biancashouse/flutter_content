// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_callouts/flutter_callouts.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_button_enum.dart';

part 'enum_arrow_type.mapper.dart';

@MappableEnum()
enum ArrowTypeEnum  {
  NONE(ArrowType.NONE),
  POINTY(ArrowType.POINTY),
  VERY_THIN(ArrowType.VERY_THIN),
  VERY_THIN_REVERSED(ArrowType.VERY_THIN_REVERSED),
  THIN(ArrowType.THIN),
  THIN_REVERSED(ArrowType.THIN_REVERSED),
  MEDIUM(ArrowType.MEDIUM),
  MEDIUM_REVERSED(ArrowType.MEDIUM_REVERSED),
  LARGE(ArrowType.LARGE),
  LARGE_REVERSED(ArrowType.LARGE_REVERSED),
  // HUGE,
  // HUGE_REVERSED
  ;

  const ArrowTypeEnum(this.flutterValue);

  final ArrowType flutterValue;

  String toSource() => name;

  static Widget propertyNodeContents({
    int? enumValueIndex,
    required STreeNode snode,
    required String label,
    ValueChanged<int?>? onChangedF,
  }) =>
      PropertyButtonEnum(
        label: label,
        menuItems: values.map((e) => e.toMenuItem()).toList(),
        originalEnumIndex: enumValueIndex,
        onChangeF: (newIndex) {
          onChangedF?.call(newIndex);
        },
        wrap: true,
        calloutButtonSize: const Size(120, 80),
        calloutSize: Size(260, values.length * 50),
      );

  Widget toMenuItem() => fco.coloredText(name, color: Colors.white);

  static ArrowTypeEnum? of(int? index) => index != null ? ArrowTypeEnum.values.elementAtOrNull(index) : null;
}
