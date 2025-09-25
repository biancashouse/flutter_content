import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';

import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_button_enum.dart';

part 'enum_decoration_shape.mapper.dart';

@MappableEnum()
enum DecorationShapeEnum {
  rectangle(DecorationShape.rectangle()),
  rounded_rectangle(DecorationShape.rounded_rectangle()),
  rectangle_dotted(DecorationShape.rectangle_dotted()),
  rounded_rectangle_dotted(DecorationShape.rounded_rectangle_dotted()),
  circle(DecorationShape.circle()),
  bevelled(DecorationShape.bevelled()),
  stadium(DecorationShape.stadium()),
  star(DecorationShape.star());

  const DecorationShapeEnum(this.decorationShape);

  final DecorationShape decorationShape;

  static DecorationShapeEnum? of(int? index) =>
      index != null ? DecorationShapeEnum.values.elementAtOrNull(index) : null;

  Decoration toDecoration({
    ColorOrGradient? fillColorOrGradient,
    ColorOrGradient? borderColorOrGradient,
    double? borderThickness,
    double? borderRadius,
    int? starPoints,
  }) => decorationShape.toDecoration(
    fillColorOrGradient: fillColorOrGradient,
    borderColorOrGradient: borderColorOrGradient,
    borderThickness: borderThickness,
    borderRadius: borderRadius,
    starPoints: starPoints,
  );

  // static MappableDecorationShapeEnumModel? of(int? index) => index != null
  //     ? MappableDecorationShapeEnumModel.values.elementAtOrNull(index)
  //     : null;

  static Widget propertyNodeContents({
    int? enumValueIndex,
    required SNode snode,
    required String label,
    ValueChanged<int?>? onChangedF,
    required ScrollControllerName? scName,
  }) => PropertyButtonEnum(
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

  Widget toMenuItem({bool skipLabel = true}) => SizedBox(
    width: 50,
    height: 30,
    child: Container(decoration: toDecoration(
      fillColorOrGradient: ColorOrGradient.color(Colors.white),
      borderColorOrGradient: ColorOrGradient.color(Colors.grey),
    )),
  );

  // Decoration? toDecoration({
  //   UpTo6Colors? upTo6FillColors,
  //   bool? radialGradient,
  //   UpTo6Colors? upTo6BorderColors,
  //   double? thickness,
  //   double? borderRadius,
  //   int? starPoints,
  // }) {
  //   // if (this != DecorationShapeEnumModel.rectangle) {
  //   //   fco.logger.d('blah');
  //   // }
  //   // if no fill colors supplied, default to black.
  //   // if only one color supplied use that as color param
  //   // if >1 colors supplied use the colors in a gradient
  //   Color? fillColor;
  //   List<Color> fillColors = [];
  //  if (upTo6FillColors?.color1 != null) {
  //     fillColors.add(upTo6FillColors!.color1!);
  //   }
  //   if (upTo6FillColors?.color2 != null) {
  //     fillColors.add(upTo6FillColors!.color2!);
  //   }
  //   if (upTo6FillColors?.color3 != null) {
  //     fillColors.add(upTo6FillColors!.color3!);
  //   }
  //   if (upTo6FillColors?.color4 != null) {
  //     fillColors.add(upTo6FillColors!.color4!);
  //   }
  //   if (upTo6FillColors?.color5 != null) {
  //     fillColors.add(upTo6FillColors!.color5!);
  //   }
  //   if (upTo6FillColors?.color6 != null) {
  //     fillColors.add(upTo6FillColors!.color6!);
  //   }
  //
  //   Gradient? fillGradient;
  //   if (fillColors.length > 1) {
  //     fillGradient = radialGradient??false
  //         ? RadialGradient(colors: fillColors)
  //         : LinearGradient(colors: fillColors);
  //   }
  //   if (fillColors.length == 1) fillColor = fillColors.first;
  //   if (fillColors.isEmpty) fillColor = Colors.white;
  //
  //   List<Color> borderColors = [];
  //   if (upTo6BorderColors?.color1 != null) {
  //     borderColors.add(upTo6BorderColors!.color1!);
  //   }
  //  if (upTo6BorderColors?.color2 != null) {
  //     borderColors.add(upTo6BorderColors!.color2!);
  //   }
  //  if (upTo6BorderColors?.color3 != null) {
  //     borderColors.add(upTo6BorderColors!.color3!);   }
  //  if (upTo6BorderColors?.color4 != null) {
  //     borderColors.add(upTo6BorderColors!.color4!);    }
  //  if (upTo6BorderColors?.color5 != null) {
  //     borderColors.add(upTo6BorderColors!.color5!);    }
  //  if (upTo6BorderColors?.color6 != null) {
  //     borderColors.add(upTo6BorderColors!.color6!);   }
  //   BoxBorder? border;
  //   if (borderColors.length == 1) {
  //     border = Border.all(color: borderColors.first, width: thickness ?? 3);
  //   } else if (borderColors.length > 1) {
  //     // const rainbowGradient = LinearGradient(colors: [Colors.blue, Colors.green, Colors.yellow, Colors.red, Colors.purpleAccent]);
  //     LinearGradient borderGradient = LinearGradient(colors: borderColors);
  //     border =
  //         GradientBoxBorder(gradient: borderGradient, width: thickness ?? 3);
  //   }
  //   return switch (this) {
  //     MappableDecorationShapeEnumModel.rectangle => BoxDecoration(
  //         shape: BoxShape.rectangle,
  //         border: border,
  //         gradient: fillGradient,
  //         color: fillColor,
  //       ),
  //     MappableDecorationShapeEnumModel.rounded_rectangle => BoxDecoration(
  //         shape: BoxShape.rectangle,
  //         border: border,
  //         borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 8)),
  //         gradient: fillGradient,
  //         color: fillColor,
  //       ),
  //     MappableDecorationShapeEnumModel.rectangle_dotted => DottedDecoration(
  //         shape: Shape.box,
  //         dash: const <int>[3, 3],
  //         borderColor: borderColors.firstOrNull ?? Colors.grey,
  //         strokeWidth: 3,
  //         fillColor: fillColor ?? Colors.white,
  //         fillGradient: fillGradient,
  //       ),
  //     MappableDecorationShapeEnumModel.rounded_rectangle_dotted => DottedDecoration(
  //         shape: Shape.box,
  //         dash: const <int>[3, 3],
  //         borderColor: borderColors.firstOrNull ?? Colors.grey,
  //         strokeWidth: 3,
  //         fillColor: fillColor ?? Colors.white,
  //         borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 8)),
  //         fillGradient: fillGradient,
  //       ),
  //     MappableDecorationShapeEnumModel.circle => BoxDecoration(
  //         shape: BoxShape.circle,
  //         border: border,
  //         color: fillGradient != null ? null : fillColor ?? Colors.white,
  //         gradient: fillGradient,
  //       ),
  //     MappableDecorationShapeEnumModel.bevelled => ShapeDecoration(
  //         shape: BeveledRectangleBorder(
  //           side: BorderSide(
  //               color: borderColors.firstOrNull ?? Colors.black,
  //               width: thickness ?? 1),
  //           borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 6)),
  //         ),
  //         color: fillGradient != null ? null : fillColor ?? Colors.white,
  //         gradient: fillGradient,
  //       ),
  //     MappableDecorationShapeEnumModel.stadium => ShapeDecoration(
  //         shape: StadiumBorder(
  //           side: BorderSide(
  //               color: borderColors.firstOrNull ?? Colors.black,
  //               width: thickness ?? 2),
  //         ),
  //         color: fillGradient != null ? null : fillColor ?? Colors.white,
  //         gradient: fillGradient,
  //       ),
  //     MappableDecorationShapeEnumModel.star => ShapeDecoration(
  //         shape: StarBorder(
  //           side: BorderSide(
  //               color: borderColors.firstOrNull ?? Colors.black,
  //               width: thickness ?? 2),
  //           points: starPoints?.toDouble() ?? 7,
  //           // innerRadiusRatio: _model.innerRadiusRatio,
  //           // pointRounding: _model.pointRounding,
  //           // valleyRounding: _model.valleyRounding,
  //           // rotation: 0,
  //         ),
  //         color: fillGradient != null ? null : fillColor ?? Colors.white,
  //         gradient: fillGradient,
  //       ),
  //   };
  // }

  //
  // DecorationShapeEnumModel toDecorationShapeEnumModel() {
  //   return switch (this) {
  //     MappableDecorationShapeEnumModel.rectangle => DecorationShapeEnumModel.rectangle,
  //     MappableDecorationShapeEnumModel.rounded_rectangle =>
  //       DecorationShapeEnumModel.rounded_rectangle,
  //     MappableDecorationShapeEnumModel.rectangle_dotted =>
  //       DecorationShapeEnumModel.rectangle_dotted,
  //     MappableDecorationShapeEnumModel.rounded_rectangle_dotted =>
  //       DecorationShapeEnumModel.rounded_rectangle_dotted,
  //     MappableDecorationShapeEnumModel.circle => DecorationShapeEnumModel.circle,
  //     MappableDecorationShapeEnumModel.bevelled => DecorationShapeEnumModel.bevelled,
  //     MappableDecorationShapeEnumModel.stadium => DecorationShapeEnumModel.stadium,
  //     MappableDecorationShapeEnumModel.star => DecorationShapeEnumModel.star,
  //   };
  // }
  //
  // DecorationShapeEnum get value => switch (this) {
  //   MappableDecorationShapeEnumModel.rectangle => DecorationShapeEnum.rectangle,
  //   MappableDecorationShapeEnumModel.rounded_rectangle => DecorationShapeEnum.rounded_rectangle,
  //   MappableDecorationShapeEnumModel.rectangle_dotted => DecorationShapeEnum.rectangle_dotted,
  //   MappableDecorationShapeEnumModel.rounded_rectangle_dotted => DecorationShapeEnum.rounded_rectangle_dotted,
  //   MappableDecorationShapeEnumModel.circle => DecorationShapeEnum.circle,
  //   MappableDecorationShapeEnumModel.bevelled => DecorationShapeEnum.bevelled,
  //   MappableDecorationShapeEnumModel.stadium => DecorationShapeEnum.stadium,
  //   MappableDecorationShapeEnumModel.star => DecorationShapeEnum.star
  // };
}
