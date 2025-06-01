// ignore_for_file: constant_identifier_names

import 'dart:ui';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter_callouts/flutter_callouts.dart';
import 'package:flutter_content/src/snippet/snodes/upto6colors.dart';

class UpTo6ColorsHook extends MappingHook {
  const UpTo6ColorsHook();

  @override
  Object? beforeDecode(Object? value) {
    // ColorModel props might have the old naming
    final upTo6ColorsMap = value as Map<String, dynamic>?;
    if (upTo6ColorsMap != null && upTo6ColorsMap.containsKey('color1Value')) {
      Map<String, dynamic>? updatedValue = UpTo6Colors(
        color1: _toColorModel(upTo6ColorsMap, 1),
        color2: _toColorModel(upTo6ColorsMap, 2),
        color3: _toColorModel(upTo6ColorsMap, 3),
        color4: _toColorModel(upTo6ColorsMap, 4),
        color5: _toColorModel(upTo6ColorsMap, 5),
        color6: _toColorModel(upTo6ColorsMap, 6),
      ).toMap();
      return updatedValue;
    } else {
      return value; // ?? {'borderColors': BorderColors().toJson()};
    }
  }

  ColorModel? _toColorModel(upTo6ColorsMap, int colorIndex) {
    Object? o = upTo6ColorsMap['color${colorIndex}Value'];
    o ??= upTo6ColorsMap['color$colorIndex'];
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
