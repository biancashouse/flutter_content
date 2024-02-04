import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_outlined_border.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/border_side_group.dart';

import 'text_style_group.dart';

part 'button_style_group.mapper.dart';

@MappableClass(discriminatorKey: 'bs', includeSubClasses: [])
class ButtonStyleGroup with ButtonStyleGroupMappable {
  int? fgColorValue;
  int? bgColorValue;
  double? elevation;
  double? padding;
  TextStyleGroup? style;
  OutlinedBorderEnum? shape;
  BorderSideGroup? side;
  double? radius;
  double? minH;
  double? maxH;
  double? minW;
  double? maxW;
  double? fixedH;
  double? fixedW;

  ButtonStyleGroup({
    this.fgColorValue,
    this.bgColorValue,
    this.elevation,
    this.padding,
    this.style,
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

  ButtonStyle? toButtonStyle(BuildContext context) {
    OutlinedBorder ob = shape != null
        ? shape!.toFlutterWidget(nodeSide: side!, nodeRadius: radius)
        : const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          );
    BorderSide? bs = side?.toBorderSide();
    return ButtonStyle(
      backgroundColor: MaterialStatePropertyAll<Color?>(bgColorValue != null ? Color(bgColorValue!) : null),
      foregroundColor: MaterialStatePropertyAll<Color?>(fgColorValue != null ? Color(fgColorValue!) : null),
      padding: MaterialStatePropertyAll<EdgeInsets?>(EdgeInsets.all(padding ?? 0.0)),
      elevation: MaterialStatePropertyAll<double?>(elevation),
      minimumSize: MaterialStatePropertyAll<Size?>(minW != null && minH != null ? Size(minW!, minH!) : null),
      maximumSize: MaterialStatePropertyAll<Size?>(maxW != null && maxH != null ? Size(maxW!, maxH!) : null),
      fixedSize: MaterialStatePropertyAll<Size?>(fixedW != null && fixedH != null ? Size(fixedW!, fixedH!) : null),
      shape: MaterialStatePropertyAll<OutlinedBorder>(ob),
      side: bs != null ? MaterialStatePropertyAll<BorderSide>(bs) : null,
    );
  }

  String toButtonStyleSource(BuildContext context) => '''ButtonStyle(
      backgroundColor: MaterialStatePropertyAll<Color?>(${bgColorValue != null ? 'Color($bgColorValue!)' : 'null'}),
      foregroundColor: MaterialStatePropertyAll<Color?>(${fgColorValue != null ? 'Color($fgColorValue!)' : 'null'}),
      padding: MaterialStatePropertyAll<EdgeInsets?>(EdgeInsets.all(${padding ?? 0.0})),
      elevation: MaterialStatePropertyAll<double?>($elevation),
      minimumSize: MaterialStatePropertyAll<Size?>(${minW != null && minH != null ? 'Size(${minW!}, ${minH!})' : 'null'}),
      maximumSize: MaterialStatePropertyAll<Size?>(${maxW != null && maxH != null ? 'Size(${maxW!}, ${maxH!})' : 'null'}),
      fixedSize: MaterialStatePropertyAll<Size?>(${fixedW != null && fixedH != null ? 'Size(${fixedW!}, ${fixedH!})' : 'null'}),
   )''';
}
