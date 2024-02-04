import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/surround/dotted_decoration.dart';
import 'package:flutter_content/src/target_config/content/snippet_editor/node_properties/node_property_button_radio_menu.dart';

part 'enum_decoration.mapper.dart';

@MappableEnum()
enum DecorationShapeEnum {
  rectangle,
  rounded_rectangle,
  rectangle_dotted,
  rounded_rectangle_dotted,
  circle,
  bevelled,
  stadium,
  star;

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
        calloutButtonSize: const Size(130, 40),
        calloutSize: const Size(240, 220),
      );

  Widget toMenuItem({bool skipLabel = true}) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          hspacer(8),
          SizedBox(
            width: 50,
            height: 30,
            child: Container(
              width: 10,
              height: 10,
              decoration: toDecoration(),
            ),
          ),
          hspacer(8),
        ],
      );

  Decoration? toDecoration({
    Color? fillColor1,
    Color? fillColor2,
    Color? fillColor3,
    Color? fillColor4,
    Color? fillColor5,
    Color? fillColor6,
    Color? borderColor1,
    Color? borderColor2,
    Color? borderColor3,
    Color? borderColor4,
    Color? borderColor5,
    Color? borderColor6,
    double? thickness,
    double? borderRadius,
    int? starPoints,
  }) {
    // if no fill colors supplied, default to black.
    // if only one color supplied use that as color param
    // if >1 colors supplied use the colors in a gradient
    Color? fillColor;
    List<Color> fillColors = [];
    if (fillColor1 != null) fillColors.add(fillColor1);
    if (fillColor2 != null) fillColors.add(fillColor2);
    if (fillColor3 != null) fillColors.add(fillColor3);
    if (fillColor4 != null) fillColors.add(fillColor4);
    if (fillColor5 != null) fillColors.add(fillColor5);
    if (fillColor6 != null) fillColors.add(fillColor6);
    Gradient? fillGradient = fillColors.length > 1 ? LinearGradient(colors: fillColors) : null;
    if (fillColors.length == 1) fillColor = fillColors.first;
    if (fillColors.isEmpty) fillColor = Colors.white;
    Color? borderColor;
    List<Color> borderColors = [];
    if (borderColor1 != null) borderColors.add(borderColor1);
    if (borderColor2 != null) borderColors.add(borderColor2);
    if (borderColor3 != null) borderColors.add(borderColor3);
    if (borderColor4 != null) borderColors.add(borderColor4);
    if (borderColor5 != null) borderColors.add(borderColor5);
    if (borderColor6 != null) borderColors.add(borderColor6);
    LinearGradient? borderGradient = borderColors.length > 1 ? LinearGradient(colors: borderColors) : null;
    if (borderColors.length == 1) borderColor = borderColors.first;
    if (borderColors.isEmpty) borderColor = Colors.black;
    return switch (this) {
      DecorationShapeEnum.rectangle => BoxDecoration(
          shape: BoxShape.rectangle,
          border: borderColor != null ? Border.all(color: borderColor, width: thickness ?? 2) : null,
          //gradient: borderGradient,
          color: fillColor,
        ),
      DecorationShapeEnum.rounded_rectangle => BoxDecoration(
          shape: BoxShape.rectangle,
          border: borderColor != null ? Border.all(color: borderColor, width: thickness ?? 2) : null,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 8)),
          //gradient: borderGradient,
          color: fillColor,
        ),
      DecorationShapeEnum.rectangle_dotted => DottedDecoration(
          shape: Shape.box,
          dash: const <int>[3, 3],
          borderColor: borderColor = Colors.grey,
          strokeWidth: 3,
          fillColor: fillColor ?? Colors.white,
        ),
      DecorationShapeEnum.rounded_rectangle_dotted => DottedDecoration(
          shape: Shape.box,
          dash: const <int>[3, 3],
          borderColor: borderColor = Colors.grey,
          strokeWidth: 3,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 8)),
          fillColor: fillColor ?? Colors.white,
        ),
      DecorationShapeEnum.circle => BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: borderColor ?? Colors.black, width: thickness ?? 2),
          color: fillColor ?? Colors.white,
        ),
      DecorationShapeEnum.bevelled => ShapeDecoration(
          shape: BeveledRectangleBorder(
            side: BorderSide(color: borderColor ?? Colors.black, width: thickness ?? 1),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 6)),
          ),
          color: fillColor ?? Colors.white,
        ),
      DecorationShapeEnum.stadium => ShapeDecoration(
          shape: StadiumBorder(
            side: BorderSide(color: borderColor ?? Colors.black, width: thickness ?? 2),
          ),
          color: fillColor ?? Colors.white,
        ),
      DecorationShapeEnum.star => ShapeDecoration(
          shape: StarBorder(
            side: BorderSide(color: borderColor ?? Colors.black, width: thickness ?? 2),
            points: starPoints?.toDouble() ?? 7,
            // innerRadiusRatio: _model.innerRadiusRatio,
            // pointRounding: _model.pointRounding,
            // valleyRounding: _model.valleyRounding,
            // rotation: 0,
          ),
          color: fillColor ?? Colors.white,
        ),
    };
  }

  static DecorationShapeEnum? of(int? index) => index != null ? DecorationShapeEnum.values.elementAtOrNull(index) : null;
}
