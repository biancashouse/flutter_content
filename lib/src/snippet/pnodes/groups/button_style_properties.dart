import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_outlined_border.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/border_side_properties.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/text_style_properties.dart';

part 'button_style_properties.mapper.dart';

@MappableClass(discriminatorKey: 'bs', includeSubClasses: [])
class ButtonStyleProperties with ButtonStylePropertiesMappable {
  @MappableField(hook: TextStyleHook())
  TextStyleProperties tsPropGroup;
  int? fgColorValue;
  int? bgColorValue;
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

  ButtonStyleProperties({
    required this.tsPropGroup,
    this.fgColorValue,
    this.bgColorValue,
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

  ButtonStyle? toButtonStyle(
      BuildContext context, ButtonStyle? defaultButtonStyle) {
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
        backgroundColor: WidgetStatePropertyAll<Color?>(
            bgColorValue != null ? Color(bgColorValue!) : null),
        foregroundColor: WidgetStatePropertyAll<Color?>(
            fgColorValue != null ? Color(fgColorValue!) : null),
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
        fgColorValue: fgColorValue,
        bgColorValue: bgColorValue,
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
}
