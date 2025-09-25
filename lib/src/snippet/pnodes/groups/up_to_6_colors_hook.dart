// ignore_for_file: constant_identifier_names

import 'dart:ui';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter_content/flutter_content.dart';

class UpTo6ColorsHook extends MappingHook {
  const UpTo6ColorsHook();

  @override
  Object? beforeDecode(Object? value) {
    // ColorModel props might have the old naming
    final gradientMap = value as Map<String, dynamic>?;
    if (gradientMap != null && gradientMap.containsKey('color1Value')) {
      Map<String, dynamic>? updatedValue = UpTo6Colors(
        color1: _toColorModel(gradientMap, 1),
        color2: _toColorModel(gradientMap, 2),
        color3: _toColorModel(gradientMap, 3),
        color4: _toColorModel(gradientMap, 4),
        color5: _toColorModel(gradientMap, 5),
        color6: _toColorModel(gradientMap, 6),
      ).toMap();
      return updatedValue;
    } else {
      return value; // ?? {'borderColors': BorderColors().toJson()};
    }
  }

  ColorModel? _toColorModel(Map<String, dynamic> gradientMap, int colorIndex) {
    Object? o = gradientMap['color${colorIndex}Value'];
    o ??= gradientMap['color$colorIndex'];
    if (o == null) return null;
    if (o is int) {
      return ColorModel.fromColor(Color(o));
    } else {
      final colorPropsMap = o as Map<String, dynamic>?;
      return colorPropsMap != null
          ? ColorModel(
        colorPropsMap['a'],
        colorPropsMap['r'],
        colorPropsMap['g'],
        colorPropsMap['b'],
      )
          : null;
    }
  }
}
