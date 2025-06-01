import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter_callouts/flutter_callouts.dart'
    show AlignmentEnum, AlignmentEnumMapper;

// import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_corner.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/mappable_enum_decoration.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/outlined_border_properties.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/up_to_6_colors_hook.dart';
import 'package:flutter_content/src/snippet/snodes/upto6colors.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../typedefs.dart';
import '../../snodes/edgeinsets_node_value.dart';

part 'container_style_properties.mapper.dart';

@MappableClass(discriminatorKey: 'cprops', includeSubClasses: [])
class ContainerStyleProperties with ContainerStylePropertiesMappable {
  UpTo6Colors? fillColors;

  // depreccated: name change
  @MappableField(hook: UpTo6ColorsHook())
  UpTo6Colors? fillColorValues;

  // if fillColorValues has >1 color, indicates whether to use linear or radial gradient
  bool? radialGradient;
  EdgeInsetsValue? margin;
  EdgeInsetsValue? padding;
  double? width;
  double? height;
  AlignmentEnum? alignment;
  MappableDecorationShapeEnum decoration;
  double? borderThickness;
  UpTo6Colors? borderColors;
  @MappableField(hook: UpTo6ColorsHook())
  UpTo6Colors? borderColorValues;
  double? borderRadius;

  // star shape
  int? starPoints;

  // dotted or dashed
  int? dash;
  int? gap;

  // corner badge
  double? badgeWidth;
  double? badgeHeight;
  BadgePositionEnum? badgeCorner;
  String? badgeText;
  OutlinedBorderProperties? outlinedBorderGroup;

  @JsonKey(includeFromJson: false, includeToJson: false)
  TextStyleName? lastHoveredSuggestion;
  @JsonKey(includeFromJson: false, includeToJson: false)
  TextStyleName? lastSearchString;

  ContainerStyleProperties({
    this.fillColors,
    this.fillColorValues,
    this.radialGradient,
    this.margin,
    this.padding,
    this.width,
    this.height,
    this.alignment,
    this.decoration = MappableDecorationShapeEnum.rectangle,
    this.borderThickness,
    this.borderColors,
    this.borderColorValues,
    this.borderRadius,
    this.starPoints,
    this.dash,
    this.gap,
    this.badgeWidth,
    this.badgeHeight,
    this.badgeCorner,
    this.badgeText,
    this.outlinedBorderGroup,
  }) {
    // handle name change
    if (fillColorValues != null) {
      fillColors = fillColorValues;
    }
    if (borderColorValues != null) {
      borderColors = borderColorValues;
    }
  }

  //  Container toContainer(BuildContext context) {
  //    if (_allNull()) return Container();
  //    return Container(
  //      decoration: decoration.toDecoration(
  //        fillColorValues: fillColorValues,
  //        borderColorValues: borderColorValues,
  //        borderRadius: borderRadius,
  //        thickness: borderThickness,
  //        starPoints: starPoints,
  //      ),
  //      // decoration: ShapeDecoration(
  //      //   shape: outlinedBorderGroup!.outlinedBorderType!.toFlutterWidget(nodeSide: outlinedBorderGroup?.side, nodeRadius: borderRadius),
  //      //   color: fillColor1Value != null ? Color(fillColor1Value!) : null,
  //      // ),
  //      padding: padding?.toEdgeInsets(),
  //      margin: margin?.toEdgeInsets(),
  //      width: width,
  //      height: height,
  //      alignment: alignment?.flutterValue,
  //      child: Text('container style name'),
  //    );
  // }

  ContainerStyleProperties clone() => ContainerStyleProperties(
        fillColors: fillColors,
        margin: margin,
        padding: padding,
        width: width,
        height: height,
        alignment: alignment,
        decoration: decoration,
        borderThickness: borderThickness,
        borderColors: borderColors,
        borderRadius: borderRadius,
        starPoints: starPoints,
        dash: dash,
        gap: gap,
        badgeCorner: badgeCorner,
        badgeHeight: badgeHeight,
        badgeText: badgeText,
        badgeWidth: badgeWidth,
        outlinedBorderGroup: outlinedBorderGroup,
      );

  bool _allNull() =>
      fillColors == null &&
      margin == null &&
      padding == null &&
      width == null &&
      height == null &&
      alignment == null &&
      decoration == MappableDecorationShapeEnum.rectangle &&
      borderThickness == null &&
      borderColors == null &&
      borderRadius == null &&
      starPoints == null &&
      dash == null &&
      gap == null &&
      badgeCorner == null &&
      badgeHeight == null &&
      badgeText == null &&
      badgeWidth == null &&
      outlinedBorderGroup == null;

  @override
  operator ==(o) =>
      o is ContainerStyleProperties &&
      fillColors == o.fillColors &&
      margin == o.margin &&
      padding == o.padding &&
      width == o.width &&
      height == o.height &&
      alignment == o.alignment &&
      decoration == o.decoration &&
      borderThickness == o.borderThickness &&
      borderColors == o.borderColors &&
      borderRadius == o.borderRadius &&
      starPoints == o.starPoints &&
      dash == o.dash &&
      gap == o.gap &&
      badgeCorner == o.badgeCorner &&
      badgeHeight == o.badgeHeight &&
      badgeText == o.badgeText &&
      badgeWidth == o.badgeWidth &&
      outlinedBorderGroup == o.outlinedBorderGroup;

  @override
  int get hashCode => Object.hash(
        fillColors,
        margin,
        padding,
        width,
        height,
        alignment,
        decoration,
        borderThickness,
        borderColors,
        borderRadius,
        starPoints,
        dash,
        gap,
        badgeCorner,
        badgeHeight,
        badgeText,
        badgeWidth,
        outlinedBorderGroup,
      );
// bool same(ContainerStyleProperties o) =>
//     ((fillColors != null && fillColors!.same(o.fillColors)) || o.fillColors == null) &&
//         ((margin != null && margin!.same(o.margin)) || o.margin == null) &&
//     margin == o.margin &&
//     padding == o.padding &&
//     width == o.width &&
//     height == o.height &&
//     alignment == o.alignment &&
//     decoration == o.decoration &&
//     borderThickness == o.borderThickness &&
//     borderColors == o.borderColors &&
//     borderRadius == o.borderRadius &&
//     starPoints == o.starPoints &&
//     dash == o.dash &&
//     gap == o.gap &&
//     badgeCorner == o.badgeCorner &&
//     badgeHeight == o.badgeHeight &&
//     badgeText == o.badgeText &&
//     badgeWidth == o.badgeWidth &&
//     outlinedBorderGroup == o.outlinedBorderGroup;
}
