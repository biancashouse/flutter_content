// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'upto6color_values.dart';

class UpTo6ColorValuesMapper extends ClassMapperBase<UpTo6ColorValues> {
  UpTo6ColorValuesMapper._();

  static UpTo6ColorValuesMapper? _instance;
  static UpTo6ColorValuesMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UpTo6ColorValuesMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UpTo6ColorValues';

  static int? _$color1Value(UpTo6ColorValues v) => v.color1Value;
  static const Field<UpTo6ColorValues, int> _f$color1Value =
      Field('color1Value', _$color1Value, opt: true);
  static int? _$color2Value(UpTo6ColorValues v) => v.color2Value;
  static const Field<UpTo6ColorValues, int> _f$color2Value =
      Field('color2Value', _$color2Value, opt: true);
  static int? _$color3Value(UpTo6ColorValues v) => v.color3Value;
  static const Field<UpTo6ColorValues, int> _f$color3Value =
      Field('color3Value', _$color3Value, opt: true);
  static int? _$color4Value(UpTo6ColorValues v) => v.color4Value;
  static const Field<UpTo6ColorValues, int> _f$color4Value =
      Field('color4Value', _$color4Value, opt: true);
  static int? _$color5Value(UpTo6ColorValues v) => v.color5Value;
  static const Field<UpTo6ColorValues, int> _f$color5Value =
      Field('color5Value', _$color5Value, opt: true);
  static int? _$color6Value(UpTo6ColorValues v) => v.color6Value;
  static const Field<UpTo6ColorValues, int> _f$color6Value =
      Field('color6Value', _$color6Value, opt: true);

  @override
  final MappableFields<UpTo6ColorValues> fields = const {
    #color1Value: _f$color1Value,
    #color2Value: _f$color2Value,
    #color3Value: _f$color3Value,
    #color4Value: _f$color4Value,
    #color5Value: _f$color5Value,
    #color6Value: _f$color6Value,
  };

  static UpTo6ColorValues _instantiate(DecodingData data) {
    return UpTo6ColorValues(
        color1Value: data.dec(_f$color1Value),
        color2Value: data.dec(_f$color2Value),
        color3Value: data.dec(_f$color3Value),
        color4Value: data.dec(_f$color4Value),
        color5Value: data.dec(_f$color5Value),
        color6Value: data.dec(_f$color6Value));
  }

  @override
  final Function instantiate = _instantiate;

  static UpTo6ColorValues fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UpTo6ColorValues>(map);
  }

  static UpTo6ColorValues fromJson(String json) {
    return ensureInitialized().decodeJson<UpTo6ColorValues>(json);
  }
}

mixin UpTo6ColorValuesMappable {
  String toJson() {
    return UpTo6ColorValuesMapper.ensureInitialized()
        .encodeJson<UpTo6ColorValues>(this as UpTo6ColorValues);
  }

  Map<String, dynamic> toMap() {
    return UpTo6ColorValuesMapper.ensureInitialized()
        .encodeMap<UpTo6ColorValues>(this as UpTo6ColorValues);
  }

  UpTo6ColorValuesCopyWith<UpTo6ColorValues, UpTo6ColorValues, UpTo6ColorValues>
      get copyWith => _UpTo6ColorValuesCopyWithImpl(
          this as UpTo6ColorValues, $identity, $identity);
  @override
  String toString() {
    return UpTo6ColorValuesMapper.ensureInitialized()
        .stringifyValue(this as UpTo6ColorValues);
  }

  @override
  bool operator ==(Object other) {
    return UpTo6ColorValuesMapper.ensureInitialized()
        .equalsValue(this as UpTo6ColorValues, other);
  }

  @override
  int get hashCode {
    return UpTo6ColorValuesMapper.ensureInitialized()
        .hashValue(this as UpTo6ColorValues);
  }
}

extension UpTo6ColorValuesValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UpTo6ColorValues, $Out> {
  UpTo6ColorValuesCopyWith<$R, UpTo6ColorValues, $Out>
      get $asUpTo6ColorValues =>
          $base.as((v, t, t2) => _UpTo6ColorValuesCopyWithImpl(v, t, t2));
}

abstract class UpTo6ColorValuesCopyWith<$R, $In extends UpTo6ColorValues, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? color1Value,
      int? color2Value,
      int? color3Value,
      int? color4Value,
      int? color5Value,
      int? color6Value});
  UpTo6ColorValuesCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _UpTo6ColorValuesCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UpTo6ColorValues, $Out>
    implements UpTo6ColorValuesCopyWith<$R, UpTo6ColorValues, $Out> {
  _UpTo6ColorValuesCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UpTo6ColorValues> $mapper =
      UpTo6ColorValuesMapper.ensureInitialized();
  @override
  $R call(
          {Object? color1Value = $none,
          Object? color2Value = $none,
          Object? color3Value = $none,
          Object? color4Value = $none,
          Object? color5Value = $none,
          Object? color6Value = $none}) =>
      $apply(FieldCopyWithData({
        if (color1Value != $none) #color1Value: color1Value,
        if (color2Value != $none) #color2Value: color2Value,
        if (color3Value != $none) #color3Value: color3Value,
        if (color4Value != $none) #color4Value: color4Value,
        if (color5Value != $none) #color5Value: color5Value,
        if (color6Value != $none) #color6Value: color6Value
      }));
  @override
  UpTo6ColorValues $make(CopyWithData data) => UpTo6ColorValues(
      color1Value: data.get(#color1Value, or: $value.color1Value),
      color2Value: data.get(#color2Value, or: $value.color2Value),
      color3Value: data.get(#color3Value, or: $value.color3Value),
      color4Value: data.get(#color4Value, or: $value.color4Value),
      color5Value: data.get(#color5Value, or: $value.color5Value),
      color6Value: data.get(#color6Value, or: $value.color6Value));

  @override
  UpTo6ColorValuesCopyWith<$R2, UpTo6ColorValues, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UpTo6ColorValuesCopyWithImpl($value, $cast, t);
}
