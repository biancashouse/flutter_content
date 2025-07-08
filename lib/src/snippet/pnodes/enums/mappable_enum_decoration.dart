import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';

import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_button_enum.dart';
import 'package:flutter_content/src/snippet/snodes/upto6colors.dart';
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
        calloutButtonSize: const Size(150, 40),
        calloutSize: const Size(240, 220),
        scName: scName,
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
    UpTo6Colors? upTo6FillColors,
    bool? radialGradient,
    UpTo6Colors? upTo6BorderColors,
    double? thickness,
    double? borderRadius,
    int? starPoints,
  }) {
    // if (this != DecorationShapeEnum.rectangle) {
    //   fco.logger.d('blah');
    // }
    // if no fill colors supplied, default to black.
    // if only one color supplied use that as color param
    // if >1 colors supplied use the colors in a gradient
    Color? fillColor;
    List<Color> fillColors = [];
    if (upTo6FillColors?.color1Value != null) {
      fillColors.add(Color(upTo6FillColors!.color1Value!.toInt()));
    } else if (upTo6FillColors?.color1 != null) {
      fillColors.add(upTo6FillColors!.color1!.flutterValue);
    }
    if (upTo6FillColors?.color2Value != null) {
      fillColors.add(Color(upTo6FillColors!.color2Value!.toInt()));
    } else if (upTo6FillColors?.color2 != null) {
      fillColors.add(upTo6FillColors!.color2!.flutterValue);
    }
    if (upTo6FillColors?.color3Value != null) {
      fillColors.add(Color(upTo6FillColors!.color3Value!.toInt()));
    } else if (upTo6FillColors?.color3 != null) {
      fillColors.add(upTo6FillColors!.color3!.flutterValue);
    }
    if (upTo6FillColors?.color4Value != null) {
      fillColors.add(Color(upTo6FillColors!.color4Value!.toInt()));
    } else if (upTo6FillColors?.color4 != null) {
      fillColors.add(upTo6FillColors!.color4!.flutterValue);
    }
    if (upTo6FillColors?.color5Value != null) {
      fillColors.add(Color(upTo6FillColors!.color5Value!.toInt()));
    } else if (upTo6FillColors?.color5 != null) {
      fillColors.add(upTo6FillColors!.color5!.flutterValue);
    }
    if (upTo6FillColors?.color6Value != null) {
      fillColors.add(Color(upTo6FillColors!.color6Value!.toInt()));
    } else if (upTo6FillColors?.color6 != null) {
      fillColors.add(upTo6FillColors!.color6!.flutterValue);
    }

    Gradient? fillGradient;
    if (fillColors.length > 1) {
      fillGradient = radialGradient??false
          ? RadialGradient(colors: fillColors)
          : LinearGradient(colors: fillColors);
    }
    if (fillColors.length == 1) fillColor = fillColors.first;
    if (fillColors.isEmpty) fillColor = Colors.white;

    List<Color> borderColors = [];
    if (upTo6BorderColors?.color1Value != null) {
      borderColors.add(Color(upTo6BorderColors!.color1Value!.toInt()));
    } else if (upTo6BorderColors?.color1 != null) {
      borderColors.add(upTo6BorderColors!.color1!.flutterValue);
    }
    if (upTo6BorderColors?.color2Value != null) {
      borderColors.add(Color(upTo6BorderColors!.color2Value!.toInt()));
    } else if (upTo6BorderColors?.color2 != null) {
      borderColors.add(upTo6BorderColors!.color2!.flutterValue);
    }
    if (upTo6BorderColors?.color3Value != null) {
      borderColors.add(Color(upTo6BorderColors!.color3Value!.toInt()));
    } else if (upTo6BorderColors?.color3 != null) {
      borderColors.add(upTo6BorderColors!.color3!.flutterValue);   }
    if (upTo6BorderColors?.color4Value != null) {
      borderColors.add(Color(upTo6BorderColors!.color4Value!.toInt()));
    } else if (upTo6BorderColors?.color4 != null) {
      borderColors.add(upTo6BorderColors!.color4!.flutterValue);    }
    if (upTo6BorderColors?.color5Value != null) {
      borderColors.add(Color(upTo6BorderColors!.color5Value!.toInt()));
    } else if (upTo6BorderColors?.color5 != null) {
      borderColors.add(upTo6BorderColors!.color5!.flutterValue);    }
    if (upTo6BorderColors?.color6Value != null) {
      borderColors.add(Color(upTo6BorderColors!.color6Value!.toInt()));
    } else if (upTo6BorderColors?.color6 != null) {
      borderColors.add(upTo6BorderColors!.color6!.flutterValue);   }
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
