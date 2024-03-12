// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/target_config/content/snippet_editor/node_properties/node_property_button_radio_menu.dart';

part 'enum_material3_text_size.mapper.dart';

@MappableEnum()
enum Material3TextSizeEnum {
  displayL,
  displayM,
  displayS,
  headlineL,
  headlineM,
  headlineS,
  titleL,
  titleM,
  titleS,
  bodyL,
  bodyM,
  bodyS,
  labelL,
  labelM,
  labelS;

  String toSource() => 'themeData?.textTheme.$name';

  static Widget propertyNodeContents({
    int? enumValueIndex,
    required STreeNode snode,
    required String label,
    ValueChanged<int?>? onChangedF,
    required ThemeData themeData,
  }) =>
      NodePropertyButtonEnum(
        label: enumValueIndex != null ? '' : 'Material 3 FontSize',
        //'Material3 font size',
        menuItems: values.map((e) => e.toMenuItem(themeData)).toList(),
        originalEnumIndex: enumValueIndex,
        onChangeF: (newIndex) {
          onChangedF?.call(newIndex);
        },
        wrap: true,
        calloutButtonSize: const Size(210, 90),
        calloutSize: const Size(275, 800),
      );

  TextStyle? flutterTextStyle({ThemeData? themeData}) {
    return switch (this) {
      Material3TextSizeEnum.displayL => themeData?.textTheme.displayLarge,
      Material3TextSizeEnum.displayM => themeData?.textTheme.displayMedium,
      Material3TextSizeEnum.displayS => themeData?.textTheme.displaySmall,
      Material3TextSizeEnum.headlineL => themeData?.textTheme.headlineLarge,
      Material3TextSizeEnum.headlineM => themeData?.textTheme.headlineMedium,
      Material3TextSizeEnum.headlineS => themeData?.textTheme.headlineSmall,
      Material3TextSizeEnum.titleL => themeData?.textTheme.titleLarge,
      Material3TextSizeEnum.titleM => themeData?.textTheme.titleMedium,
      Material3TextSizeEnum.titleS => themeData?.textTheme.titleSmall,
      Material3TextSizeEnum.bodyL => themeData?.textTheme.bodyLarge,
      Material3TextSizeEnum.bodyM => themeData?.textTheme.bodyMedium,
      Material3TextSizeEnum.bodyS => themeData?.textTheme.bodySmall,
      Material3TextSizeEnum.labelL => themeData?.textTheme.labelLarge,
      Material3TextSizeEnum.labelM => themeData?.textTheme.labelMedium,
      Material3TextSizeEnum.labelS => themeData?.textTheme.labelSmall,
    };
  }

  Widget toMenuItem(ThemeData themeData, {int? colorValue, String? fontFamily}) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            name.substring(0, name.length - 1),
            // textScaler: TextScaler.linear(.9),
            softWrap: false,
            style: flutterTextStyle(themeData: themeData)?.copyWith(
              overflow: TextOverflow.fade,
              color: colorValue == null ? Colors.white : Color(colorValue),
              fontFamily: fontFamily,
            ),
          ),
          Container(
              margin: const EdgeInsets.only(left: 10),
              padding: const EdgeInsets.all(4),
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  // side: BorderSide(color: Colors.black12),
                ),
              ),
              child: Text(name[name.length - 1], style: const TextStyle(fontWeight: FontWeight.w900))),
        ],
      );

  static Material3TextSizeEnum? of(int? index) => index != null ? Material3TextSizeEnum.values.elementAtOrNull(index) : null;
}
