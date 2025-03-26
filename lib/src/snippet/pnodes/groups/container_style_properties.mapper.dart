// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'container_style_properties.dart';

class ContainerStylePropertiesMapper
    extends ClassMapperBase<ContainerStyleProperties> {
  ContainerStylePropertiesMapper._();

  static ContainerStylePropertiesMapper? _instance;
  static ContainerStylePropertiesMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ContainerStylePropertiesMapper._());
      UpTo6ColorValuesMapper.ensureInitialized();
      EdgeInsetsValueMapper.ensureInitialized();
      AlignmentEnumMapper.ensureInitialized();
      MappableDecorationShapeEnumMapper.ensureInitialized();
      BadgePositionEnumMapper.ensureInitialized();
      OutlinedBorderPropertiesMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ContainerStyleProperties';

  static UpTo6ColorValues? _$fillColorValues(ContainerStyleProperties v) =>
      v.fillColorValues;
  static const Field<ContainerStyleProperties, UpTo6ColorValues>
      _f$fillColorValues =
      Field('fillColorValues', _$fillColorValues, opt: true);
  static bool? _$radialGradient(ContainerStyleProperties v) => v.radialGradient;
  static const Field<ContainerStyleProperties, bool> _f$radialGradient =
      Field('radialGradient', _$radialGradient, opt: true);
  static EdgeInsetsValue? _$margin(ContainerStyleProperties v) => v.margin;
  static const Field<ContainerStyleProperties, EdgeInsetsValue> _f$margin =
      Field('margin', _$margin, opt: true);
  static EdgeInsetsValue? _$padding(ContainerStyleProperties v) => v.padding;
  static const Field<ContainerStyleProperties, EdgeInsetsValue> _f$padding =
      Field('padding', _$padding, opt: true);
  static double? _$width(ContainerStyleProperties v) => v.width;
  static const Field<ContainerStyleProperties, double> _f$width =
      Field('width', _$width, opt: true);
  static double? _$height(ContainerStyleProperties v) => v.height;
  static const Field<ContainerStyleProperties, double> _f$height =
      Field('height', _$height, opt: true);
  static AlignmentEnum? _$alignment(ContainerStyleProperties v) => v.alignment;
  static const Field<ContainerStyleProperties, AlignmentEnum> _f$alignment =
      Field('alignment', _$alignment, opt: true);
  static MappableDecorationShapeEnum _$decoration(ContainerStyleProperties v) =>
      v.decoration;
  static const Field<ContainerStyleProperties, MappableDecorationShapeEnum>
      _f$decoration = Field('decoration', _$decoration,
          opt: true, def: MappableDecorationShapeEnum.rectangle);
  static double? _$borderThickness(ContainerStyleProperties v) =>
      v.borderThickness;
  static const Field<ContainerStyleProperties, double> _f$borderThickness =
      Field('borderThickness', _$borderThickness, opt: true);
  static UpTo6ColorValues? _$borderColorValues(ContainerStyleProperties v) =>
      v.borderColorValues;
  static const Field<ContainerStyleProperties, UpTo6ColorValues>
      _f$borderColorValues =
      Field('borderColorValues', _$borderColorValues, opt: true);
  static double? _$borderRadius(ContainerStyleProperties v) => v.borderRadius;
  static const Field<ContainerStyleProperties, double> _f$borderRadius =
      Field('borderRadius', _$borderRadius, opt: true);
  static int? _$starPoints(ContainerStyleProperties v) => v.starPoints;
  static const Field<ContainerStyleProperties, int> _f$starPoints =
      Field('starPoints', _$starPoints, opt: true);
  static int? _$dash(ContainerStyleProperties v) => v.dash;
  static const Field<ContainerStyleProperties, int> _f$dash =
      Field('dash', _$dash, opt: true);
  static int? _$gap(ContainerStyleProperties v) => v.gap;
  static const Field<ContainerStyleProperties, int> _f$gap =
      Field('gap', _$gap, opt: true);
  static double? _$badgeWidth(ContainerStyleProperties v) => v.badgeWidth;
  static const Field<ContainerStyleProperties, double> _f$badgeWidth =
      Field('badgeWidth', _$badgeWidth, opt: true);
  static double? _$badgeHeight(ContainerStyleProperties v) => v.badgeHeight;
  static const Field<ContainerStyleProperties, double> _f$badgeHeight =
      Field('badgeHeight', _$badgeHeight, opt: true);
  static BadgePositionEnum? _$badgeCorner(ContainerStyleProperties v) =>
      v.badgeCorner;
  static const Field<ContainerStyleProperties, BadgePositionEnum>
      _f$badgeCorner = Field('badgeCorner', _$badgeCorner, opt: true);
  static String? _$badgeText(ContainerStyleProperties v) => v.badgeText;
  static const Field<ContainerStyleProperties, String> _f$badgeText =
      Field('badgeText', _$badgeText, opt: true);
  static OutlinedBorderProperties? _$outlinedBorderGroup(
          ContainerStyleProperties v) =>
      v.outlinedBorderGroup;
  static const Field<ContainerStyleProperties, OutlinedBorderProperties>
      _f$outlinedBorderGroup =
      Field('outlinedBorderGroup', _$outlinedBorderGroup, opt: true);
  static String? _$lastHoveredSuggestion(ContainerStyleProperties v) =>
      v.lastHoveredSuggestion;
  static const Field<ContainerStyleProperties, String>
      _f$lastHoveredSuggestion = Field(
          'lastHoveredSuggestion', _$lastHoveredSuggestion,
          mode: FieldMode.member);
  static String? _$lastSearchString(ContainerStyleProperties v) =>
      v.lastSearchString;
  static const Field<ContainerStyleProperties, String> _f$lastSearchString =
      Field('lastSearchString', _$lastSearchString, mode: FieldMode.member);

  @override
  final MappableFields<ContainerStyleProperties> fields = const {
    #fillColorValues: _f$fillColorValues,
    #radialGradient: _f$radialGradient,
    #margin: _f$margin,
    #padding: _f$padding,
    #width: _f$width,
    #height: _f$height,
    #alignment: _f$alignment,
    #decoration: _f$decoration,
    #borderThickness: _f$borderThickness,
    #borderColorValues: _f$borderColorValues,
    #borderRadius: _f$borderRadius,
    #starPoints: _f$starPoints,
    #dash: _f$dash,
    #gap: _f$gap,
    #badgeWidth: _f$badgeWidth,
    #badgeHeight: _f$badgeHeight,
    #badgeCorner: _f$badgeCorner,
    #badgeText: _f$badgeText,
    #outlinedBorderGroup: _f$outlinedBorderGroup,
    #lastHoveredSuggestion: _f$lastHoveredSuggestion,
    #lastSearchString: _f$lastSearchString,
  };

  static ContainerStyleProperties _instantiate(DecodingData data) {
    return ContainerStyleProperties(
        fillColorValues: data.dec(_f$fillColorValues),
        radialGradient: data.dec(_f$radialGradient),
        margin: data.dec(_f$margin),
        padding: data.dec(_f$padding),
        width: data.dec(_f$width),
        height: data.dec(_f$height),
        alignment: data.dec(_f$alignment),
        decoration: data.dec(_f$decoration),
        borderThickness: data.dec(_f$borderThickness),
        borderColorValues: data.dec(_f$borderColorValues),
        borderRadius: data.dec(_f$borderRadius),
        starPoints: data.dec(_f$starPoints),
        dash: data.dec(_f$dash),
        gap: data.dec(_f$gap),
        badgeWidth: data.dec(_f$badgeWidth),
        badgeHeight: data.dec(_f$badgeHeight),
        badgeCorner: data.dec(_f$badgeCorner),
        badgeText: data.dec(_f$badgeText),
        outlinedBorderGroup: data.dec(_f$outlinedBorderGroup));
  }

  @override
  final Function instantiate = _instantiate;

  static ContainerStyleProperties fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ContainerStyleProperties>(map);
  }

  static ContainerStyleProperties fromJson(String json) {
    return ensureInitialized().decodeJson<ContainerStyleProperties>(json);
  }
}

mixin ContainerStylePropertiesMappable {
  String toJson() {
    return ContainerStylePropertiesMapper.ensureInitialized()
        .encodeJson<ContainerStyleProperties>(this as ContainerStyleProperties);
  }

  Map<String, dynamic> toMap() {
    return ContainerStylePropertiesMapper.ensureInitialized()
        .encodeMap<ContainerStyleProperties>(this as ContainerStyleProperties);
  }

  ContainerStylePropertiesCopyWith<ContainerStyleProperties,
          ContainerStyleProperties, ContainerStyleProperties>
      get copyWith => _ContainerStylePropertiesCopyWithImpl(
          this as ContainerStyleProperties, $identity, $identity);
  @override
  String toString() {
    return ContainerStylePropertiesMapper.ensureInitialized()
        .stringifyValue(this as ContainerStyleProperties);
  }

  @override
  bool operator ==(Object other) {
    return ContainerStylePropertiesMapper.ensureInitialized()
        .equalsValue(this as ContainerStyleProperties, other);
  }

  @override
  int get hashCode {
    return ContainerStylePropertiesMapper.ensureInitialized()
        .hashValue(this as ContainerStyleProperties);
  }
}

extension ContainerStylePropertiesValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ContainerStyleProperties, $Out> {
  ContainerStylePropertiesCopyWith<$R, ContainerStyleProperties, $Out>
      get $asContainerStyleProperties => $base
          .as((v, t, t2) => _ContainerStylePropertiesCopyWithImpl(v, t, t2));
}

abstract class ContainerStylePropertiesCopyWith<
    $R,
    $In extends ContainerStyleProperties,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  UpTo6ColorValuesCopyWith<$R, UpTo6ColorValues, UpTo6ColorValues>?
      get fillColorValues;
  EdgeInsetsValueCopyWith<$R, EdgeInsetsValue, EdgeInsetsValue>? get margin;
  EdgeInsetsValueCopyWith<$R, EdgeInsetsValue, EdgeInsetsValue>? get padding;
  UpTo6ColorValuesCopyWith<$R, UpTo6ColorValues, UpTo6ColorValues>?
      get borderColorValues;
  OutlinedBorderPropertiesCopyWith<$R, OutlinedBorderProperties,
      OutlinedBorderProperties>? get outlinedBorderGroup;
  $R call(
      {UpTo6ColorValues? fillColorValues,
      bool? radialGradient,
      EdgeInsetsValue? margin,
      EdgeInsetsValue? padding,
      double? width,
      double? height,
      AlignmentEnum? alignment,
      MappableDecorationShapeEnum? decoration,
      double? borderThickness,
      UpTo6ColorValues? borderColorValues,
      double? borderRadius,
      int? starPoints,
      int? dash,
      int? gap,
      double? badgeWidth,
      double? badgeHeight,
      BadgePositionEnum? badgeCorner,
      String? badgeText,
      OutlinedBorderProperties? outlinedBorderGroup});
  ContainerStylePropertiesCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ContainerStylePropertiesCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ContainerStyleProperties, $Out>
    implements
        ContainerStylePropertiesCopyWith<$R, ContainerStyleProperties, $Out> {
  _ContainerStylePropertiesCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ContainerStyleProperties> $mapper =
      ContainerStylePropertiesMapper.ensureInitialized();
  @override
  UpTo6ColorValuesCopyWith<$R, UpTo6ColorValues, UpTo6ColorValues>?
      get fillColorValues => $value.fillColorValues?.copyWith
          .$chain((v) => call(fillColorValues: v));
  @override
  EdgeInsetsValueCopyWith<$R, EdgeInsetsValue, EdgeInsetsValue>? get margin =>
      $value.margin?.copyWith.$chain((v) => call(margin: v));
  @override
  EdgeInsetsValueCopyWith<$R, EdgeInsetsValue, EdgeInsetsValue>? get padding =>
      $value.padding?.copyWith.$chain((v) => call(padding: v));
  @override
  UpTo6ColorValuesCopyWith<$R, UpTo6ColorValues, UpTo6ColorValues>?
      get borderColorValues => $value.borderColorValues?.copyWith
          .$chain((v) => call(borderColorValues: v));
  @override
  OutlinedBorderPropertiesCopyWith<$R, OutlinedBorderProperties,
          OutlinedBorderProperties>?
      get outlinedBorderGroup => $value.outlinedBorderGroup?.copyWith
          .$chain((v) => call(outlinedBorderGroup: v));
  @override
  $R call(
          {Object? fillColorValues = $none,
          Object? radialGradient = $none,
          Object? margin = $none,
          Object? padding = $none,
          Object? width = $none,
          Object? height = $none,
          Object? alignment = $none,
          MappableDecorationShapeEnum? decoration,
          Object? borderThickness = $none,
          Object? borderColorValues = $none,
          Object? borderRadius = $none,
          Object? starPoints = $none,
          Object? dash = $none,
          Object? gap = $none,
          Object? badgeWidth = $none,
          Object? badgeHeight = $none,
          Object? badgeCorner = $none,
          Object? badgeText = $none,
          Object? outlinedBorderGroup = $none}) =>
      $apply(FieldCopyWithData({
        if (fillColorValues != $none) #fillColorValues: fillColorValues,
        if (radialGradient != $none) #radialGradient: radialGradient,
        if (margin != $none) #margin: margin,
        if (padding != $none) #padding: padding,
        if (width != $none) #width: width,
        if (height != $none) #height: height,
        if (alignment != $none) #alignment: alignment,
        if (decoration != null) #decoration: decoration,
        if (borderThickness != $none) #borderThickness: borderThickness,
        if (borderColorValues != $none) #borderColorValues: borderColorValues,
        if (borderRadius != $none) #borderRadius: borderRadius,
        if (starPoints != $none) #starPoints: starPoints,
        if (dash != $none) #dash: dash,
        if (gap != $none) #gap: gap,
        if (badgeWidth != $none) #badgeWidth: badgeWidth,
        if (badgeHeight != $none) #badgeHeight: badgeHeight,
        if (badgeCorner != $none) #badgeCorner: badgeCorner,
        if (badgeText != $none) #badgeText: badgeText,
        if (outlinedBorderGroup != $none)
          #outlinedBorderGroup: outlinedBorderGroup
      }));
  @override
  ContainerStyleProperties $make(CopyWithData data) => ContainerStyleProperties(
      fillColorValues: data.get(#fillColorValues, or: $value.fillColorValues),
      radialGradient: data.get(#radialGradient, or: $value.radialGradient),
      margin: data.get(#margin, or: $value.margin),
      padding: data.get(#padding, or: $value.padding),
      width: data.get(#width, or: $value.width),
      height: data.get(#height, or: $value.height),
      alignment: data.get(#alignment, or: $value.alignment),
      decoration: data.get(#decoration, or: $value.decoration),
      borderThickness: data.get(#borderThickness, or: $value.borderThickness),
      borderColorValues:
          data.get(#borderColorValues, or: $value.borderColorValues),
      borderRadius: data.get(#borderRadius, or: $value.borderRadius),
      starPoints: data.get(#starPoints, or: $value.starPoints),
      dash: data.get(#dash, or: $value.dash),
      gap: data.get(#gap, or: $value.gap),
      badgeWidth: data.get(#badgeWidth, or: $value.badgeWidth),
      badgeHeight: data.get(#badgeHeight, or: $value.badgeHeight),
      badgeCorner: data.get(#badgeCorner, or: $value.badgeCorner),
      badgeText: data.get(#badgeText, or: $value.badgeText),
      outlinedBorderGroup:
          data.get(#outlinedBorderGroup, or: $value.outlinedBorderGroup));

  @override
  ContainerStylePropertiesCopyWith<$R2, ContainerStyleProperties, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ContainerStylePropertiesCopyWithImpl($value, $cast, t);
}
