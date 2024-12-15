// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_button_enum.dart';

part 'enum_font_weight.mapper.dart';

@MappableEnum()
enum FontWeightEnum  {
  thin_100(FontWeight.w100),
  extraLight_200(FontWeight.w200),
  light_300(FontWeight.w300),
  normal_400(FontWeight.w400),
  medium_500(FontWeight.w500),
  semiBold_600(FontWeight.w600),
  bold_700(FontWeight.w700),
  extraBold_800(FontWeight.w800),
  thickest_900(FontWeight.w900);

  const FontWeightEnum(this.flutterValue);

  final FontWeight flutterValue;

  
  String toSource() => 'FontWeight.$name';

  static
  Widget propertyNodeContents({
    int? enumValueIndex,
    required STreeNode snode,
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
        calloutButtonSize: const Size(200, 30),
        calloutSize: Size(180, values.length * 40),
        scName: scName,
      );


  Widget toMenuItem() =>
      Text(
        name,
        style: TextStyle(color: Colors.white, fontWeight: flutterValue),
      );

  static FontWeightEnum? of(int? index) => index != null ? FontWeightEnum.values.elementAtOrNull(index) : null;
}
