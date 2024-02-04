// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/target_config/content/snippet_editor/node_properties/node_property_button_radio_menu.dart';

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
    required STreeNode snode,
    required String label,
    ValueChanged<int?>? onChangedF,
  }) =>
      NodePropertyButtonEnum(
        label: label,
        menuItems: values.map((e) => e.toMenuItem()).toList(),
        originalEnumIndex: enumValueIndex,
        onChangeF: (newIndex) {
          onChangedF?.call(newIndex);
          
        },
        wrap: true,
        calloutButtonSize: const Size(120, 30),
        calloutSize: const Size(170, 50),
      );

  Widget toMenuItem() => Useful.coloredText(name, color: Colors.white);

  static FontStyleEnum? of(int? index) => index != null ? FontStyleEnum.values.elementAtOrNull(index) : null;

}
