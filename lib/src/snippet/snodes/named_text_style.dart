import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_content/src/snippet/pnodes/enums/enum_font_style.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_font_weight.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_material3_text_size.dart';

part 'named_text_style.mapper.dart';

@MappableClass()
class NamedTextStyle with NamedTextStyleMappable {
  String? fontFamily;

  double? fontSize;
  Material3TextSizeEnum? fontSizeName;
  FontStyleEnum? fontStyle;
  FontWeightEnum? fontWeight;
  double? lineHeight;
  double? letterSpacing;
  Color? color;

  NamedTextStyle({
    this.fontFamily,
    this.fontSize,
    this.fontSizeName,
    this.fontStyle,
    this.fontWeight,
    this.lineHeight,
    this.letterSpacing,
    this.color,
  });

  // String toSource(BuildContext context) {
  //   return fontFamily != null
  //       ? '''GoogleFonts.getFont(
  //     ${fontFamily!},
  //     textStyle: ${fontSizeName != null ? fontSizeName!.toTextStyle(Theme.of(context)) : null},
  //     fontSize: ${fontSize},
  //     fontStyle: ${fontStyle?.toFontStyle()},
  //     fontWeight: ${fontWeight?.toFontWeight()},
  //     letterSpacing: ${letterSpacing},
  //     height: ${lineHeight},
  //     color: ${color},
  //   )'''
  //       : fontSizeName != null
  //       ? '''${fontSizeName!.toTextStyle(Theme.of(context))}?.copyWith(
  //     fontSize: ${fontSize},
  //     fontStyle: ${fontStyle?.toFontStyle()},
  //     fontWeight: ${fontWeight?.toFontWeight()},
  //     letterSpacing: ${letterSpacing},
  //     height: ${lineHeight},
  //     color: ${color},
  //   )'''
  //       : '''TextStyle(
  //     fontSize: ${fontSize},
  //     fontStyle: ${fontStyle?.toFontStyle()},
  //     fontWeight: ${fontWeight?.toFontWeight()},
  //     letterSpacing: ${letterSpacing},
  //     height: ${lineHeight},
  //     color: ${color},
  //   )''';
  // }

  TextStyle? toTextStyle(ThemeData themeData) => fontFamily != null
      ? GoogleFonts.getFont(
          fontFamily!,
          textStyle: fontSizeName != null ? fontSizeName!.flutterTextStyle(themeData: themeData) : null,
          fontSize: fontSize,
          fontStyle: fontStyle?.flutterValue,
          fontWeight: fontWeight?.flutterValue,
          letterSpacing: letterSpacing,
          height: lineHeight,
          color: color,
        )
      : fontSizeName != null
          ? fontSizeName!.flutterTextStyle(themeData:themeData)?.copyWith(
                fontSize: fontSize,
                fontStyle: fontStyle?.flutterValue,
                fontWeight: fontWeight?.flutterValue,
                letterSpacing: letterSpacing,
                height: lineHeight,
                color: color,
              )
          : TextStyle(
              fontSize: fontSize,
              fontStyle: fontStyle?.flutterValue,
              fontWeight: fontWeight?.flutterValue,
              letterSpacing: letterSpacing,
              height: lineHeight,
              color: color,
            );
}
