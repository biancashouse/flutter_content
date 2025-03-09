// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'button_style_properties.dart';

class ButtonStylePropertiesMapper
    extends ClassMapperBase<ButtonStyleProperties> {
  ButtonStylePropertiesMapper._();

  static ButtonStylePropertiesMapper? _instance;
  static ButtonStylePropertiesMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ButtonStylePropertiesMapper._());
      TextStylePropertiesMapper.ensureInitialized();
      OutlinedBorderEnumMapper.ensureInitialized();
      BorderSidePropertiesMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ButtonStyleProperties';

  static TextStyleProperties _$tsPropGroup(ButtonStyleProperties v) =>
      v.tsPropGroup;
  static const Field<ButtonStyleProperties, TextStyleProperties>
      _f$tsPropGroup =
      Field('tsPropGroup', _$tsPropGroup, hook: TextStyleHook());
  static int? _$fgColorValue(ButtonStyleProperties v) => v.fgColorValue;
  static const Field<ButtonStyleProperties, int> _f$fgColorValue =
      Field('fgColorValue', _$fgColorValue, opt: true);
  static int? _$bgColorValue(ButtonStyleProperties v) => v.bgColorValue;
  static const Field<ButtonStyleProperties, int> _f$bgColorValue =
      Field('bgColorValue', _$bgColorValue, opt: true);
  static double? _$elevation(ButtonStyleProperties v) => v.elevation;
  static const Field<ButtonStyleProperties, double> _f$elevation =
      Field('elevation', _$elevation, opt: true);
  static double? _$padding(ButtonStyleProperties v) => v.padding;
  static const Field<ButtonStyleProperties, double> _f$padding =
      Field('padding', _$padding, opt: true);
  static OutlinedBorderEnum? _$shape(ButtonStyleProperties v) => v.shape;
  static const Field<ButtonStyleProperties, OutlinedBorderEnum> _f$shape =
      Field('shape', _$shape, opt: true);
  static BorderSideProperties? _$side(ButtonStyleProperties v) => v.side;
  static const Field<ButtonStyleProperties, BorderSideProperties> _f$side =
      Field('side', _$side, opt: true);
  static double? _$radius(ButtonStyleProperties v) => v.radius;
  static const Field<ButtonStyleProperties, double> _f$radius =
      Field('radius', _$radius, opt: true);
  static double? _$minW(ButtonStyleProperties v) => v.minW;
  static const Field<ButtonStyleProperties, double> _f$minW =
      Field('minW', _$minW, opt: true);
  static double? _$maxW(ButtonStyleProperties v) => v.maxW;
  static const Field<ButtonStyleProperties, double> _f$maxW =
      Field('maxW', _$maxW, opt: true);
  static double? _$minH(ButtonStyleProperties v) => v.minH;
  static const Field<ButtonStyleProperties, double> _f$minH =
      Field('minH', _$minH, opt: true);
  static double? _$maxH(ButtonStyleProperties v) => v.maxH;
  static const Field<ButtonStyleProperties, double> _f$maxH =
      Field('maxH', _$maxH, opt: true);
  static double? _$fixedW(ButtonStyleProperties v) => v.fixedW;
  static const Field<ButtonStyleProperties, double> _f$fixedW =
      Field('fixedW', _$fixedW, opt: true);
  static double? _$fixedH(ButtonStyleProperties v) => v.fixedH;
  static const Field<ButtonStyleProperties, double> _f$fixedH =
      Field('fixedH', _$fixedH, opt: true);

  @override
  final MappableFields<ButtonStyleProperties> fields = const {
    #tsPropGroup: _f$tsPropGroup,
    #fgColorValue: _f$fgColorValue,
    #bgColorValue: _f$bgColorValue,
    #elevation: _f$elevation,
    #padding: _f$padding,
    #shape: _f$shape,
    #side: _f$side,
    #radius: _f$radius,
    #minW: _f$minW,
    #maxW: _f$maxW,
    #minH: _f$minH,
    #maxH: _f$maxH,
    #fixedW: _f$fixedW,
    #fixedH: _f$fixedH,
  };

  static ButtonStyleProperties _instantiate(DecodingData data) {
    return ButtonStyleProperties(
        tsPropGroup: data.dec(_f$tsPropGroup),
        fgColorValue: data.dec(_f$fgColorValue),
        bgColorValue: data.dec(_f$bgColorValue),
        elevation: data.dec(_f$elevation),
        padding: data.dec(_f$padding),
        shape: data.dec(_f$shape),
        side: data.dec(_f$side),
        radius: data.dec(_f$radius),
        minW: data.dec(_f$minW),
        maxW: data.dec(_f$maxW),
        minH: data.dec(_f$minH),
        maxH: data.dec(_f$maxH),
        fixedW: data.dec(_f$fixedW),
        fixedH: data.dec(_f$fixedH));
  }

  @override
  final Function instantiate = _instantiate;

  static ButtonStyleProperties fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ButtonStyleProperties>(map);
  }

  static ButtonStyleProperties fromJson(String json) {
    return ensureInitialized().decodeJson<ButtonStyleProperties>(json);
  }
}

mixin ButtonStylePropertiesMappable {
  String toJson() {
    return ButtonStylePropertiesMapper.ensureInitialized()
        .encodeJson<ButtonStyleProperties>(this as ButtonStyleProperties);
  }

  Map<String, dynamic> toMap() {
    return ButtonStylePropertiesMapper.ensureInitialized()
        .encodeMap<ButtonStyleProperties>(this as ButtonStyleProperties);
  }

  ButtonStylePropertiesCopyWith<ButtonStyleProperties, ButtonStyleProperties,
          ButtonStyleProperties>
      get copyWith => _ButtonStylePropertiesCopyWithImpl(
          this as ButtonStyleProperties, $identity, $identity);
  @override
  String toString() {
    return ButtonStylePropertiesMapper.ensureInitialized()
        .stringifyValue(this as ButtonStyleProperties);
  }

  @override
  bool operator ==(Object other) {
    return ButtonStylePropertiesMapper.ensureInitialized()
        .equalsValue(this as ButtonStyleProperties, other);
  }

  @override
  int get hashCode {
    return ButtonStylePropertiesMapper.ensureInitialized()
        .hashValue(this as ButtonStyleProperties);
  }
}

extension ButtonStylePropertiesValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ButtonStyleProperties, $Out> {
  ButtonStylePropertiesCopyWith<$R, ButtonStyleProperties, $Out>
      get $asButtonStyleProperties =>
          $base.as((v, t, t2) => _ButtonStylePropertiesCopyWithImpl(v, t, t2));
}

abstract class ButtonStylePropertiesCopyWith<
    $R,
    $In extends ButtonStyleProperties,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  TextStylePropertiesCopyWith<$R, TextStyleProperties, TextStyleProperties>
      get tsPropGroup;
  BorderSidePropertiesCopyWith<$R, BorderSideProperties, BorderSideProperties>?
      get side;
  $R call(
      {TextStyleProperties? tsPropGroup,
      int? fgColorValue,
      int? bgColorValue,
      double? elevation,
      double? padding,
      OutlinedBorderEnum? shape,
      BorderSideProperties? side,
      double? radius,
      double? minW,
      double? maxW,
      double? minH,
      double? maxH,
      double? fixedW,
      double? fixedH});
  ButtonStylePropertiesCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ButtonStylePropertiesCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ButtonStyleProperties, $Out>
    implements ButtonStylePropertiesCopyWith<$R, ButtonStyleProperties, $Out> {
  _ButtonStylePropertiesCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ButtonStyleProperties> $mapper =
      ButtonStylePropertiesMapper.ensureInitialized();
  @override
  TextStylePropertiesCopyWith<$R, TextStyleProperties, TextStyleProperties>
      get tsPropGroup =>
          $value.tsPropGroup.copyWith.$chain((v) => call(tsPropGroup: v));
  @override
  BorderSidePropertiesCopyWith<$R, BorderSideProperties, BorderSideProperties>?
      get side => $value.side?.copyWith.$chain((v) => call(side: v));
  @override
  $R call(
          {TextStyleProperties? tsPropGroup,
          Object? fgColorValue = $none,
          Object? bgColorValue = $none,
          Object? elevation = $none,
          Object? padding = $none,
          Object? shape = $none,
          Object? side = $none,
          Object? radius = $none,
          Object? minW = $none,
          Object? maxW = $none,
          Object? minH = $none,
          Object? maxH = $none,
          Object? fixedW = $none,
          Object? fixedH = $none}) =>
      $apply(FieldCopyWithData({
        if (tsPropGroup != null) #tsPropGroup: tsPropGroup,
        if (fgColorValue != $none) #fgColorValue: fgColorValue,
        if (bgColorValue != $none) #bgColorValue: bgColorValue,
        if (elevation != $none) #elevation: elevation,
        if (padding != $none) #padding: padding,
        if (shape != $none) #shape: shape,
        if (side != $none) #side: side,
        if (radius != $none) #radius: radius,
        if (minW != $none) #minW: minW,
        if (maxW != $none) #maxW: maxW,
        if (minH != $none) #minH: minH,
        if (maxH != $none) #maxH: maxH,
        if (fixedW != $none) #fixedW: fixedW,
        if (fixedH != $none) #fixedH: fixedH
      }));
  @override
  ButtonStyleProperties $make(CopyWithData data) => ButtonStyleProperties(
      tsPropGroup: data.get(#tsPropGroup, or: $value.tsPropGroup),
      fgColorValue: data.get(#fgColorValue, or: $value.fgColorValue),
      bgColorValue: data.get(#bgColorValue, or: $value.bgColorValue),
      elevation: data.get(#elevation, or: $value.elevation),
      padding: data.get(#padding, or: $value.padding),
      shape: data.get(#shape, or: $value.shape),
      side: data.get(#side, or: $value.side),
      radius: data.get(#radius, or: $value.radius),
      minW: data.get(#minW, or: $value.minW),
      maxW: data.get(#maxW, or: $value.maxW),
      minH: data.get(#minH, or: $value.minH),
      maxH: data.get(#maxH, or: $value.maxH),
      fixedW: data.get(#fixedW, or: $value.fixedW),
      fixedH: data.get(#fixedH, or: $value.fixedH));

  @override
  ButtonStylePropertiesCopyWith<$R2, ButtonStyleProperties, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ButtonStylePropertiesCopyWithImpl($value, $cast, t);
}
