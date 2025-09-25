import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_font_style.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_font_weight.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_fonts/google_fonts.dart';


part 'text_style_properties.mapper.dart';

@MappableClass(discriminatorKey: 'ts', includeSubClasses: [])
class TextStyleProperties with TextStylePropertiesMappable {
  String? fontFamily;
  double? fontSize;
  Material3TextSizeEnum? fontSizeName;
  FontStyleEnum? fontStyle;
  FontWeightEnum? fontWeight;
  double? lineHeight;
  double? letterSpacing;
  ColorModel? color;

  @JsonKey(includeFromJson: false, includeToJson: false)
  TextStyleName? lastHoveredSuggestion;
  @JsonKey(includeFromJson: false, includeToJson: false)
  TextStyleName? lastSearchString;

  TextStyleProperties({
    this.fontFamily,
    this.fontSize,
    this.fontSizeName,
    this.fontStyle,
    this.fontWeight,
    this.lineHeight,
    this.letterSpacing,
    this.color,
  });

  TextStyle? toTextStyle(BuildContext context) {
    if (_allNull()) return null;

    // start with default textstyle
    var ts = DefaultTextStyle.of(context).style;
    // possibly apply named textstyle
    // TextStyle? defaultTS;
    // possibly apply a google font
    if (fontFamily != null) {
      ts = ts.merge(GoogleFonts.getFont(fontFamily!));
    }
    // possibly apply a material named size
    if (fontSizeName != null) {
      ts = ts
          .merge(fontSizeName!.materialTextStyle(themeData: Theme.of(context)));
    }
    // finally apply any properties from this node's TextStyleGroup properties
    ts = ts.merge(
      TextStyle(
        fontSize: fontSizeName != null ? null : fontSize,
        fontStyle: fontStyle?.flutterValue,
        fontWeight: fontWeight?.flutterValue,
        letterSpacing: letterSpacing,
        height: lineHeight,
        color: color?.flutterValue,
      ),
    );

    return ts;
  }

  TextStyleProperties clone() => TextStyleProperties(
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontSizeName: fontSizeName,
        fontStyle: fontStyle,
        fontWeight: fontWeight,
        lineHeight: lineHeight,
        letterSpacing: letterSpacing,
        color: color,
      );

  bool _allNull() =>
      fontFamily == null &&
      fontWeight == null &&
      fontStyle == null &&
      fontSize == null &&
      fontSizeName == null &&
      lineHeight == null &&
      letterSpacing == null &&
      color == null;

  bool same(TextStyleProperties other) =>
      fontFamily == other.fontFamily &&
          fontWeight == other.fontWeight &&
          fontStyle == other.fontStyle &&
          fontSize == other.fontSize &&
          fontSizeName == other.fontSizeName &&
          lineHeight == other.lineHeight &&
          letterSpacing == other.letterSpacing &&
          color == other.color;
}
