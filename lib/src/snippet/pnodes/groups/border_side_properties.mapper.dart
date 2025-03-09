// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'border_side_properties.dart';

class BorderSidePropertiesMapper extends ClassMapperBase<BorderSideProperties> {
  BorderSidePropertiesMapper._();

  static BorderSidePropertiesMapper? _instance;
  static BorderSidePropertiesMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BorderSidePropertiesMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'BorderSideProperties';

  static double? _$width(BorderSideProperties v) => v.width;
  static const Field<BorderSideProperties, double> _f$width =
      Field('width', _$width, opt: true);
  static int? _$colorValue(BorderSideProperties v) => v.colorValue;
  static const Field<BorderSideProperties, int> _f$colorValue =
      Field('colorValue', _$colorValue, opt: true);

  @override
  final MappableFields<BorderSideProperties> fields = const {
    #width: _f$width,
    #colorValue: _f$colorValue,
  };

  static BorderSideProperties _instantiate(DecodingData data) {
    return BorderSideProperties(
        width: data.dec(_f$width), colorValue: data.dec(_f$colorValue));
  }

  @override
  final Function instantiate = _instantiate;

  static BorderSideProperties fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BorderSideProperties>(map);
  }

  static BorderSideProperties fromJson(String json) {
    return ensureInitialized().decodeJson<BorderSideProperties>(json);
  }
}

mixin BorderSidePropertiesMappable {
  String toJson() {
    return BorderSidePropertiesMapper.ensureInitialized()
        .encodeJson<BorderSideProperties>(this as BorderSideProperties);
  }

  Map<String, dynamic> toMap() {
    return BorderSidePropertiesMapper.ensureInitialized()
        .encodeMap<BorderSideProperties>(this as BorderSideProperties);
  }

  BorderSidePropertiesCopyWith<BorderSideProperties, BorderSideProperties,
          BorderSideProperties>
      get copyWith => _BorderSidePropertiesCopyWithImpl(
          this as BorderSideProperties, $identity, $identity);
  @override
  String toString() {
    return BorderSidePropertiesMapper.ensureInitialized()
        .stringifyValue(this as BorderSideProperties);
  }

  @override
  bool operator ==(Object other) {
    return BorderSidePropertiesMapper.ensureInitialized()
        .equalsValue(this as BorderSideProperties, other);
  }

  @override
  int get hashCode {
    return BorderSidePropertiesMapper.ensureInitialized()
        .hashValue(this as BorderSideProperties);
  }
}

extension BorderSidePropertiesValueCopy<$R, $Out>
    on ObjectCopyWith<$R, BorderSideProperties, $Out> {
  BorderSidePropertiesCopyWith<$R, BorderSideProperties, $Out>
      get $asBorderSideProperties =>
          $base.as((v, t, t2) => _BorderSidePropertiesCopyWithImpl(v, t, t2));
}

abstract class BorderSidePropertiesCopyWith<
    $R,
    $In extends BorderSideProperties,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({double? width, int? colorValue});
  BorderSidePropertiesCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _BorderSidePropertiesCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BorderSideProperties, $Out>
    implements BorderSidePropertiesCopyWith<$R, BorderSideProperties, $Out> {
  _BorderSidePropertiesCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BorderSideProperties> $mapper =
      BorderSidePropertiesMapper.ensureInitialized();
  @override
  $R call({Object? width = $none, Object? colorValue = $none}) =>
      $apply(FieldCopyWithData({
        if (width != $none) #width: width,
        if (colorValue != $none) #colorValue: colorValue
      }));
  @override
  BorderSideProperties $make(CopyWithData data) => BorderSideProperties(
      width: data.get(#width, or: $value.width),
      colorValue: data.get(#colorValue, or: $value.colorValue));

  @override
  BorderSidePropertiesCopyWith<$R2, BorderSideProperties, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _BorderSidePropertiesCopyWithImpl($value, $cast, t);
}
