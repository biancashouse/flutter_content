import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_alignment.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_corner.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/mappable_enum_decoration.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/outlined_border_properties.dart';
import 'package:flutter_content/src/snippet/snodes/upto6color_values.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'container_style_properties.mapper.dart';

@MappableClass(discriminatorKey: 'cprops', includeSubClasses: [])
class ContainerStyleProperties with ContainerStylePropertiesMappable {
  UpTo6ColorValues? fillColorValues;
  // if fillColorValues has >1 color, indicates whether to use linear or radial gradient
  bool? radialGradient;
  EdgeInsetsValue? margin;
  EdgeInsetsValue? padding;
  double? width;
  double? height;
  AlignmentEnum? alignment;
  MappableDecorationShapeEnum decoration;
  double? borderThickness;
  UpTo6ColorValues? borderColorValues;
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
    this.fillColorValues,
    this.radialGradient,
    this.margin,
    this.padding,
    this.width,
    this.height,
    this.alignment,
    this.decoration = MappableDecorationShapeEnum.rectangle,
    this.borderThickness,
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
  });

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

  ContainerStyleProperties clone() =>
      ContainerStyleProperties(
          fillColorValues: fillColorValues,
          margin: margin,
          padding: padding,
          width: width,
          height: height,
          alignment: alignment,
          decoration: decoration,
          borderThickness: borderThickness,
          borderColorValues: borderColorValues,
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
      fillColorValues == null &&
          margin == null &&
          padding == null &&
          width == null &&
          height == null &&
          alignment == null &&
          decoration == MappableDecorationShapeEnum.rectangle &&
          borderThickness == null &&
          borderColorValues == null &&
          borderRadius == null &&
          starPoints == null && dash == null && gap == null &&
          badgeCorner == null && badgeHeight == null && badgeText == null &&
          badgeWidth == null &&
          outlinedBorderGroup == null;

  bool same(ContainerStyleProperties other) =>
      fillColorValues == other.fillColorValues &&
          margin == other.margin &&
          padding == other.padding &&
          width == other.width &&
          height == other.height &&
          alignment == other.alignment &&
          decoration == other.decoration &&
          borderThickness == other.borderThickness &&
          borderColorValues == other.borderColorValues &&
          borderRadius == other.borderRadius &&
          starPoints == other.starPoints && dash == other.dash &&
          gap == other.gap &&
          badgeCorner == other.badgeCorner &&
          badgeHeight == other.badgeHeight && badgeText == other.badgeText
          && badgeWidth == other.badgeWidth &&
          outlinedBorderGroup == other.outlinedBorderGroup;
}
