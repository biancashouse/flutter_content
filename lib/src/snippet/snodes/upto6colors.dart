import 'dart:ui';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter_content/flutter_content.dart';

part 'upto6colors.mapper.dart';

@MappableClass()
class UpTo6Colors with UpTo6ColorsMappable {
  ColorModel? color1;
  ColorModel? color2;
  ColorModel? color3;
  ColorModel? color4;
  ColorModel? color5;
  ColorModel? color6;
  bool? isLinear;

  // deprecated
  double? color1Value;
  double? color2Value;
  double? color3Value;
  double? color4Value;
  double? color5Value;
  double? color6Value;

  UpTo6Colors({
    this.color1,
    this.color2,
    this.color3,
    this.color4,
    this.color5,
    this.color6,

    // deprecated: changed from ints to ColorModels
    this.color1Value,
    this.color2Value,
    this.color3Value,
    this.color4Value,
    this.color5Value,
    this.color6Value,
  }) {
    if (color1Value != null) {
      color1 = ColorModel.fromColor(Color(color1Value!.toInt()));
    }
    if (color2Value != null) {
      color2 = ColorModel.fromColor(Color(color2Value!.toInt()));
    }
    if (color3Value != null) {
      color3 = ColorModel.fromColor(Color(color3Value!.toInt()));
    }
    if (color4Value != null) {
      color4 = ColorModel.fromColor(Color(color4Value!.toInt()));
    }
    if (color5Value != null) {
      color5 = ColorModel.fromColor(Color(color5Value!.toInt()));
    }
    if (color6Value != null) {
      color6 = ColorModel.fromColor(Color(color6Value!.toInt()));
    }
  }

  bool isAGradient() {
    int count = 0;
    if (color1 != null) count++;
    if (color2 != null) count++;
    if (color3 != null) count++;
    if (color4 != null) count++;
    if (color5 != null) count++;
    if (color6 != null) count++;
    return count > 1;
  }

  bool isEmpty() {
    int count = 0;
    if (color1 != null) count++;
    if (color2 != null) count++;
    if (color3 != null) count++;
    if (color4 != null) count++;
    if (color5 != null) count++;
    if (color6 != null) count++;
    return count == 0;
  }

  ColorOrGradient getColorOrGradient({bool isRadial = false}) {
    ColorOrGradient result;
    if (isAGradient()) {
      result = ColorOrGradient.gradient([
        if (color1 != null) color1!.flutterValue,
        if (color2 != null) color2!.flutterValue,
        if (color3 != null) color3!.flutterValue,
        if (color4 != null) color4!.flutterValue,
        if (color5 != null) color5!.flutterValue,
        if (color6 != null) color6!.flutterValue,
      ], isLinear: !isRadial);
    } else {
      result = ColorOrGradient.color(color1!.flutterValue);
    }
    return result;
  }

  @override
  operator ==(o) =>
      o is UpTo6Colors &&
      color1 == o.color1 &&
      color2 == o.color2 &&
      color3 == o.color3 &&
      color4 == o.color4 &&
      color5 == o.color5 &&
      color6 == o.color6;

  @override
  int get hashCode =>
      Object.hash(color1, color2, color3, color4, color5, color6);
}
