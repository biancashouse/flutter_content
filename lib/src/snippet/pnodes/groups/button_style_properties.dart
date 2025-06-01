import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_callouts/flutter_callouts.dart'
    show ColorModel, ColorModelCopyWith, ColorModelMapper;

// import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_outlined_border.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/border_side_properties.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/text_style_properties.dart';
import 'package:flutter_content/src/snippet/snodes/text_style_hook.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../typedefs.dart';

part 'button_style_properties.mapper.dart';

@MappableClass(discriminatorKey: 'bs', includeSubClasses: [])
class ButtonStyleProperties with ButtonStylePropertiesMappable {
  @MappableField(hook: TextStyleHook())
  TextStyleProperties tsPropGroup;
  ColorModel? fgColor;
  ColorModel? bgColor;
  double? elevation;
  double? padding;

  // TextStyleGroup? textStyle;
  OutlinedBorderEnum? shape;
  BorderSideProperties? side;
  double? radius;
  double? minH;
  double? maxH;
  double? minW;
  double? maxW;
  double? fixedH;
  double? fixedW;

  @JsonKey(includeFromJson: false, includeToJson: false)
  TextStyleName? lastHoveredSuggestion;
  @JsonKey(includeFromJson: false, includeToJson: false)
  TextStyleName? lastSearchString;

  ButtonStyleProperties({
    required this.tsPropGroup,
    this.fgColor,
    this.bgColor,
    this.elevation,
    this.padding,
    // this.textStyle,
    this.shape,
    this.side,
    this.radius,
    this.minW,
    this.maxW,
    this.minH,
    this.maxH,
    this.fixedW,
    this.fixedH,
  });

  ButtonStyle? toButtonStyle(BuildContext context,
      {ButtonStyle? defaultButtonStyle}) {
    OutlinedBorder ob = shape != null
        ? shape!.toFlutterWidget(nodeSide: side!, nodeRadius: radius)
        : RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius ?? 8.0)),
          );
    BorderSide? bs = side?.toBorderSide();

    TextStyle? ts = tsPropGroup.toTextStyle(context);

    ButtonStyle? buttonStyle =
        // (defaultButtonStyle)
        //   ?.merge(
        ButtonStyle(
      textStyle: WidgetStatePropertyAll<TextStyle?>(ts),
      backgroundColor: WidgetStatePropertyAll<Color?>(bgColor?.flutterValue),
      foregroundColor: WidgetStatePropertyAll<Color?>(fgColor?.flutterValue),
      padding:
          WidgetStatePropertyAll<EdgeInsets?>(EdgeInsets.all(padding ?? 0.0)),
      elevation: WidgetStatePropertyAll<double?>(elevation),
      minimumSize: WidgetStatePropertyAll<Size?>(
          minW != null && minH != null ? Size(minW!, minH!) : null),
      maximumSize: WidgetStatePropertyAll<Size?>(
          maxW != null && maxH != null ? Size(maxW!, maxH!) : null),
      fixedSize: WidgetStatePropertyAll<Size?>(
          fixedW != null && fixedH != null ? Size(fixedW!, fixedH!) : null),
      shape: WidgetStatePropertyAll<OutlinedBorder>(ob),
      side: WidgetStatePropertyAll<BorderSide?>(bs),
      // textStyle: WidgetStatePropertyAll<TextStyle?>(ts),
      // ),
    );
    return buttonStyle;
  }

  ButtonStyleProperties clone() => ButtonStyleProperties(
        tsPropGroup: tsPropGroup,
        elevation: elevation,
        fgColor: fgColor,
        bgColor: bgColor,
        padding: padding,
        radius: radius,
        fixedH: fixedH,
        fixedW: fixedW,
        minH: minH,
        minW: minW,
        maxH: maxH,
        maxW: maxW,
        shape: shape,
        side: side,
      );

  @override
  operator ==(o) =>
      o is ButtonStyleProperties &&
      tsPropGroup == o.tsPropGroup &&
      elevation == o.elevation &&
      fgColor == o.fgColor &&
      bgColor == o.bgColor &&
      padding == o.padding &&
      radius == o.radius &&
      padding == o.padding &&
      fixedH == o.fixedH &&
      fixedW == o.fixedW &&
      minH == o.minH &&
      minW == o.minW &&
      maxH == o.maxH &&
      maxW == o.maxW &&
      shape == o.shape &&
      side == o.side;

  @override
  int get hashCode => Object.hash(
        tsPropGroup,
        elevation,
        fgColor,
        bgColor,
        padding,
        radius,
        fixedH,
        fixedW,
        minH,
        minW,
        maxH,
        maxW,
        shape,
        side,
      );
}
