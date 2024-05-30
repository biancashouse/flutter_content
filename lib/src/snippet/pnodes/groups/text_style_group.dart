import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_font_style.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_font_weight.dart';

import 'package:google_fonts/google_fonts.dart';

part 'text_style_group.mapper.dart';

@MappableClass(discriminatorKey: 'ts', includeSubClasses: [])
class TextStyleGroup with TextStyleGroupMappable {
  String? namedTextStyle;
  String? fontFamily;
  double? fontSize;
  Material3TextSizeEnum? fontSizeName;
  FontStyleEnum? fontStyle;
  FontWeightEnum? fontWeight;
  double? lineHeight;
  double? letterSpacing;
  int? colorValue;

  TextStyleGroup({
    this.namedTextStyle,
    this.fontFamily,
    this.fontSize,
    this.fontSizeName,
    this.fontStyle,
    this.fontWeight,
    this.lineHeight,
    this.letterSpacing,
    this.colorValue,
  });

  String toSource(BuildContext context, {String? namedTextStyle}) => '';

  // @override
  // String toSource(BuildContext context, {String? namedTextStyle}) {
  //   // CAPIBloc bloc = FlutterContent().capiBlocnstance;
  //   NamedTextStyle? namedStyle = FlutterContent().namedStyles[namedTextStyle];
  //   String? fFamily = (namedStyle?.fontFamily ?? fontFamily);
  //   Material3TextSizeEnum? fSizeName = (namedStyle?.fontSizeName ?? fontSizeName);
  //   double? fSize = (namedStyle?.fontSize ?? fontSize);
  //   FontStyleEnum? fStyle = (namedStyle?.fontStyle ?? fontStyle);
  //   FontWeightEnum? fWeight = (namedStyle?.fontWeight ?? fontWeight);
  //   double? lSpacing = (namedStyle?.letterSpacing ?? letterSpacing);
  //   double? lh = (namedStyle?.lineHeight ?? lineHeight);
  //   int? colorVal =  (namedStyle?.color?.value ?? colorValue);
  //   return fFamily != null
  //       ? '''GoogleFonts.getFont(
  //     ${fFamily},
  //     textStyle: ${fSizeName != null ? fSizeName.toTextStyle(Theme.of(context)) : null},
  //     fontSize: ${fSize},
  //     fontStyle: ${fStyle?.toFontStyle()},
  //     fontWeight: ${fWeight?.toFontWeight()},
  //     letterSpacing: ${lSpacing},
  //     height: ${lh},
  //     color: ${colorVal != null ? Color(colorVal) : null},
  //   )'''
  //       : fontSizeName != null
  //           ? '''${fSizeName!.toTextStyle(Theme.of(context))}?.copyWith(
  //     fontSize: ${fSize},
  //     fontStyle: ${fStyle?.toFontStyle()},
  //     fontWeight: ${fWeight?.toFontWeight()},
  //     letterSpacing: ${lSpacing},
  //     height: ${lh},
  //     color: ${colorVal != null ? Color(colorVal) : null},
  //   )'''
  //           : '''TextStyle(
  //     fontSize: ${fSize},
  //     fontStyle: ${fStyle?.toFontStyle()},
  //     fontWeight: ${fWeight?.toFontWeight()},
  //     letterSpacing: ${lSpacing},
  //     height: ${lh},
  //     color: ${colorVal != null ? Color(colorVal) : null},
  //   )''';
  // }

  TextStyle? toTextStyle(BuildContext context) {
    // start with default textstyle
    var ts = DefaultTextStyle.of(context).style;
    // possibly apply named textstyle
    TextStyle? defaultTS;
    if (namedTextStyle != null) {
      defaultTS = FC().namedTextStyles[namedTextStyle];
      if (defaultTS != null) {
        ts = ts.merge(defaultTS);
      }
    } else {
      // possibly apply a google font
      if (fontFamily != null) {
        ts = ts.merge(GoogleFonts.getFont(fontFamily!));
      }
      // possibly apply a material named size
      if (fontSizeName != null) {
        ts = ts.merge(fontSizeName!.materialTextStyle(themeData: Theme.of(context)));
      }
      // finally apply any properties from this node's TextStyleGroup properties
      ts = ts.merge(
        TextStyle(
          fontSize: fontSizeName != null ? null : fontSize,
          fontStyle: fontStyle?.flutterValue,
          fontWeight: fontWeight?.flutterValue,
          letterSpacing: letterSpacing,
          height: lineHeight,
          color: colorValue != null ? Color(colorValue!) : null,
        ),
      );
    }
    return ts;
  }
}
