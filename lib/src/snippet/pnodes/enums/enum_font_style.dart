// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_button_enum.dart';

part 'enum_font_style.mapper.dart';

@MappableEnum()
enum FontStyleEnum   {
  normal(FontStyle.normal),
  italic(FontStyle.italic);

  const FontStyleEnum(this.flutterValue);

  final FontStyle flutterValue;

  
  String toSource() => 'FontStyle.$name';

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
        calloutButtonSize: const Size(120, 30),
        calloutSize: const Size(170, 50),
        scName: scName,
      );

  Widget toMenuItem() => fco.coloredText(name, color: Colors.white);

  static FontStyleEnum? of(int? index) => index != null ? FontStyleEnum.values.elementAtOrNull(index) : null;

}
