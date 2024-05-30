// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'button_style_group.dart';

class ButtonStyleGroupMapper extends ClassMapperBase<ButtonStyleGroup> {
  ButtonStyleGroupMapper._();

  static ButtonStyleGroupMapper? _instance;
  static ButtonStyleGroupMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ButtonStyleGroupMapper._());
      OutlinedBorderEnumMapper.ensureInitialized();
      BorderSideGroupMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ButtonStyleGroup';

  static String? _$namedButtonStyle(ButtonStyleGroup v) => v.namedButtonStyle;
  static const Field<ButtonStyleGroup, String> _f$namedButtonStyle =
      Field('namedButtonStyle', _$namedButtonStyle, opt: true);
  static int? _$fgColorValue(ButtonStyleGroup v) => v.fgColorValue;
  static const Field<ButtonStyleGroup, int> _f$fgColorValue =
      Field('fgColorValue', _$fgColorValue, opt: true);
  static int? _$bgColorValue(ButtonStyleGroup v) => v.bgColorValue;
  static const Field<ButtonStyleGroup, int> _f$bgColorValue =
      Field('bgColorValue', _$bgColorValue, opt: true);
  static double? _$elevation(ButtonStyleGroup v) => v.elevation;
  static const Field<ButtonStyleGroup, double> _f$elevation =
      Field('elevation', _$elevation, opt: true);
  static double? _$padding(ButtonStyleGroup v) => v.padding;
  static const Field<ButtonStyleGroup, double> _f$padding =
      Field('padding', _$padding, opt: true);
  static OutlinedBorderEnum? _$shape(ButtonStyleGroup v) => v.shape;
  static const Field<ButtonStyleGroup, OutlinedBorderEnum> _f$shape =
      Field('shape', _$shape, opt: true);
  static BorderSideGroup? _$side(ButtonStyleGroup v) => v.side;
  static const Field<ButtonStyleGroup, BorderSideGroup> _f$side =
      Field('side', _$side, opt: true);
  static double? _$radius(ButtonStyleGroup v) => v.radius;
  static const Field<ButtonStyleGroup, double> _f$radius =
      Field('radius', _$radius, opt: true);
  static double? _$minW(ButtonStyleGroup v) => v.minW;
  static const Field<ButtonStyleGroup, double> _f$minW =
      Field('minW', _$minW, opt: true);
  static double? _$maxW(ButtonStyleGroup v) => v.maxW;
  static const Field<ButtonStyleGroup, double> _f$maxW =
      Field('maxW', _$maxW, opt: true);
  static double? _$minH(ButtonStyleGroup v) => v.minH;
  static const Field<ButtonStyleGroup, double> _f$minH =
      Field('minH', _$minH, opt: true);
  static double? _$maxH(ButtonStyleGroup v) => v.maxH;
  static const Field<ButtonStyleGroup, double> _f$maxH =
      Field('maxH', _$maxH, opt: true);
  static double? _$fixedW(ButtonStyleGroup v) => v.fixedW;
  static const Field<ButtonStyleGroup, double> _f$fixedW =
      Field('fixedW', _$fixedW, opt: true);
  static double? _$fixedH(ButtonStyleGroup v) => v.fixedH;
  static const Field<ButtonStyleGroup, double> _f$fixedH =
      Field('fixedH', _$fixedH, opt: true);

  @override
  final MappableFields<ButtonStyleGroup> fields = const {
    #namedButtonStyle: _f$namedButtonStyle,
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

  static ButtonStyleGroup _instantiate(DecodingData data) {
    return ButtonStyleGroup(
        namedButtonStyle: data.dec(_f$namedButtonStyle),
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

  static ButtonStyleGroup fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ButtonStyleGroup>(map);
  }

  static ButtonStyleGroup fromJson(String json) {
    return ensureInitialized().decodeJson<ButtonStyleGroup>(json);
  }
}

mixin ButtonStyleGroupMappable {
  String toJson() {
    return ButtonStyleGroupMapper.ensureInitialized()
        .encodeJson<ButtonStyleGroup>(this as ButtonStyleGroup);
  }

  Map<String, dynamic> toMap() {
    return ButtonStyleGroupMapper.ensureInitialized()
        .encodeMap<ButtonStyleGroup>(this as ButtonStyleGroup);
  }

  ButtonStyleGroupCopyWith<ButtonStyleGroup, ButtonStyleGroup, ButtonStyleGroup>
      get copyWith => _ButtonStyleGroupCopyWithImpl(
          this as ButtonStyleGroup, $identity, $identity);
  @override
  String toString() {
    return ButtonStyleGroupMapper.ensureInitialized()
        .stringifyValue(this as ButtonStyleGroup);
  }

  @override
  bool operator ==(Object other) {
    return ButtonStyleGroupMapper.ensureInitialized()
        .equalsValue(this as ButtonStyleGroup, other);
  }

  @override
  int get hashCode {
    return ButtonStyleGroupMapper.ensureInitialized()
        .hashValue(this as ButtonStyleGroup);
  }
}

extension ButtonStyleGroupValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ButtonStyleGroup, $Out> {
  ButtonStyleGroupCopyWith<$R, ButtonStyleGroup, $Out>
      get $asButtonStyleGroup =>
          $base.as((v, t, t2) => _ButtonStyleGroupCopyWithImpl(v, t, t2));
}

abstract class ButtonStyleGroupCopyWith<$R, $In extends ButtonStyleGroup, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  BorderSideGroupCopyWith<$R, BorderSideGroup, BorderSideGroup>? get side;
  $R call(
      {String? namedButtonStyle,
      int? fgColorValue,
      int? bgColorValue,
      double? elevation,
      double? padding,
      OutlinedBorderEnum? shape,
      BorderSideGroup? side,
      double? radius,
      double? minW,
      double? maxW,
      double? minH,
      double? maxH,
      double? fixedW,
      double? fixedH});
  ButtonStyleGroupCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ButtonStyleGroupCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ButtonStyleGroup, $Out>
    implements ButtonStyleGroupCopyWith<$R, ButtonStyleGroup, $Out> {
  _ButtonStyleGroupCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ButtonStyleGroup> $mapper =
      ButtonStyleGroupMapper.ensureInitialized();
  @override
  BorderSideGroupCopyWith<$R, BorderSideGroup, BorderSideGroup>? get side =>
      $value.side?.copyWith.$chain((v) => call(side: v));
  @override
  $R call(
          {Object? namedButtonStyle = $none,
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
        if (namedButtonStyle != $none) #namedButtonStyle: namedButtonStyle,
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
  ButtonStyleGroup $make(CopyWithData data) => ButtonStyleGroup(
      namedButtonStyle:
          data.get(#namedButtonStyle, or: $value.namedButtonStyle),
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
  ButtonStyleGroupCopyWith<$R2, ButtonStyleGroup, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ButtonStyleGroupCopyWithImpl($value, $cast, t);
}
