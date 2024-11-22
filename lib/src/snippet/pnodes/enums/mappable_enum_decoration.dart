import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';

import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_button_enum.dart';
import 'package:flutter_content/src/snippet/snodes/upto6color_values.dart';
import 'package:gap/gap.dart';
import 'package:gradient_borders/gradient_borders.dart';

part 'mappable_enum_decoration.mapper.dart';

@MappableEnum()
enum MappableDecorationShapeEnum {
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
      PropertyButtonEnum(
        label: label,
        menuItems: values.map((e) => e.toMenuItem()).toList(),
        originalEnumIndex: enumValueIndex,
        onChangeF: (newIndex) {
          onChangedF?.call(newIndex);
        },
        wrap: true,
        calloutButtonSize: const Size(150, 40),
        calloutSize: const Size(240, 220),
      );

  Widget toMenuItem({bool skipLabel = true}) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Gap(8),
          SizedBox(
            width: 50,
            height: 30,
            child: Container(
              width: 10,
              height: 10,
              decoration: toDecoration(),
            ),
          ),
          const Gap(8),
        ],
      );

  Decoration? toDecoration({
    UpTo6ColorValues? fillColorValues,
    UpTo6ColorValues? borderColorValues,
    double? thickness,
    double? borderRadius,
    int? starPoints,
  }) {
    // if (this != DecorationShapeEnum.rectangle) {
    //   print('blah');
    // }
    // if no fill colors supplied, default to black.
    // if only one color supplied use that as color param
    // if >1 colors supplied use the colors in a gradient
    Color? fillColor;
    List<Color> fillColors = [];
    if (fillColorValues?.color1Value != null) {
      fillColors.add(Color(fillColorValues!.color1Value!));
    }
    if (fillColorValues?.color2Value != null) {
      fillColors.add(Color(fillColorValues!.color2Value!));
    }
    if (fillColorValues?.color3Value != null) {
      fillColors.add(Color(fillColorValues!.color3Value!));
    }
    if (fillColorValues?.color4Value != null) {
      fillColors.add(Color(fillColorValues!.color4Value!));
    }
    if (fillColorValues?.color5Value != null) {
      fillColors.add(Color(fillColorValues!.color5Value!));
    }
    if (fillColorValues?.color6Value != null) {
      fillColors.add(Color(fillColorValues!.color6Value!));
    }
    Gradient? fillGradient =
        fillColors.length > 1 ? LinearGradient(colors: fillColors) : null;
    if (fillColors.length == 1) fillColor = fillColors.first;
    if (fillColors.isEmpty) fillColor = Colors.white;
    List<Color> borderColors = [];
    if (borderColorValues?.color1Value != null) {
      borderColors.add(Color(borderColorValues!.color1Value!));
    }
    if (borderColorValues?.color2Value != null) {
      borderColors.add(Color(borderColorValues!.color2Value!));
    }
    if (borderColorValues?.color3Value != null) {
      borderColors.add(Color(borderColorValues!.color3Value!));
    }
    if (borderColorValues?.color4Value != null) {
      borderColors.add(Color(borderColorValues!.color4Value!));
    }
    if (borderColorValues?.color5Value != null) {
      borderColors.add(Color(borderColorValues!.color5Value!));
    }
    if (borderColorValues?.color6Value != null) {
      borderColors.add(Color(borderColorValues!.color6Value!));
    }
    BoxBorder? border;
    if (borderColors.length == 1) {
      border = Border.all(color: borderColors.first, width: thickness ?? 3);
    } else if (borderColors.length > 1) {
      // const rainbowGradient = LinearGradient(colors: [Colors.blue, Colors.green, Colors.yellow, Colors.red, Colors.purpleAccent]);
      LinearGradient borderGradient = LinearGradient(colors: borderColors);
      border =
          GradientBoxBorder(gradient: borderGradient, width: thickness ?? 3);
    }
    return switch (this) {
      MappableDecorationShapeEnum.rectangle => BoxDecoration(
          shape: BoxShape.rectangle,
          border: border,
          gradient: fillGradient,
          color: fillColor,
        ),
      MappableDecorationShapeEnum.rounded_rectangle => BoxDecoration(
          shape: BoxShape.rectangle,
          border: border,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 8)),
          gradient: fillGradient,
          color: fillColor,
        ),
      MappableDecorationShapeEnum.rectangle_dotted => DottedDecoration(
          shape: Shape.box,
          dash: const <int>[3, 3],
          borderColor: borderColors.firstOrNull ?? Colors.grey,
          strokeWidth: 3,
          fillColor: fillColor ?? Colors.white,
          fillGradient: fillGradient,
        ),
      MappableDecorationShapeEnum.rounded_rectangle_dotted => DottedDecoration(
          shape: Shape.box,
          dash: const <int>[3, 3],
          borderColor: borderColors.firstOrNull ?? Colors.grey,
          strokeWidth: 3,
          fillColor: fillColor ?? Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 8)),
          fillGradient: fillGradient,
        ),
      MappableDecorationShapeEnum.circle => BoxDecoration(
          shape: BoxShape.circle,
          border: border,
          color: fillGradient != null ? null : fillColor ?? Colors.white,
          gradient: fillGradient,
        ),
      MappableDecorationShapeEnum.bevelled => ShapeDecoration(
          shape: BeveledRectangleBorder(
            side: BorderSide(
                color: borderColors.firstOrNull ?? Colors.black,
                width: thickness ?? 1),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 6)),
          ),
          color: fillGradient != null ? null : fillColor ?? Colors.white,
          gradient: fillGradient,
        ),
      MappableDecorationShapeEnum.stadium => ShapeDecoration(
          shape: StadiumBorder(
            side: BorderSide(
                color: borderColors.firstOrNull ?? Colors.black,
                width: thickness ?? 2),
          ),
          color: fillGradient != null ? null : fillColor ?? Colors.white,
          gradient: fillGradient,
        ),
      MappableDecorationShapeEnum.star => ShapeDecoration(
          shape: StarBorder(
            side: BorderSide(
                color: borderColors.firstOrNull ?? Colors.black,
                width: thickness ?? 2),
            points: starPoints?.toDouble() ?? 7,
            // innerRadiusRatio: _model.innerRadiusRatio,
            // pointRounding: _model.pointRounding,
            // valleyRounding: _model.valleyRounding,
            // rotation: 0,
          ),
          color: fillGradient != null ? null : fillColor ?? Colors.white,
          gradient: fillGradient,
        ),
    };
  }

  static MappableDecorationShapeEnum? of(int? index) => index != null
      ? MappableDecorationShapeEnum.values.elementAtOrNull(index)
      : null;

  DecorationShapeEnum toDecorationShapeEnum() {
    return switch (this) {
      MappableDecorationShapeEnum.rectangle => DecorationShapeEnum.rectangle,
      MappableDecorationShapeEnum.rounded_rectangle =>
        DecorationShapeEnum.rounded_rectangle,
      MappableDecorationShapeEnum.rectangle_dotted =>
        DecorationShapeEnum.rectangle_dotted,
      MappableDecorationShapeEnum.rounded_rectangle_dotted =>
        DecorationShapeEnum.rounded_rectangle_dotted,
      MappableDecorationShapeEnum.circle => DecorationShapeEnum.circle,
      MappableDecorationShapeEnum.bevelled => DecorationShapeEnum.bevelled,
      MappableDecorationShapeEnum.stadium => DecorationShapeEnum.stadium,
      MappableDecorationShapeEnum.star => DecorationShapeEnum.star,
    };
  }
}
