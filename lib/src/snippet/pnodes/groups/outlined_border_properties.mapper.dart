// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'outlined_border_properties.dart';

class OutlinedBorderPropertiesMapper
    extends ClassMapperBase<OutlinedBorderProperties> {
  OutlinedBorderPropertiesMapper._();

  static OutlinedBorderPropertiesMapper? _instance;
  static OutlinedBorderPropertiesMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = OutlinedBorderPropertiesMapper._());
      BorderSidePropertiesMapper.ensureInitialized();
      OutlinedBorderEnumMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'OutlinedBorderProperties';

  static BorderSideProperties? _$side(OutlinedBorderProperties v) => v.side;
  static const Field<OutlinedBorderProperties, BorderSideProperties> _f$side =
      Field('side', _$side, opt: true);
  static OutlinedBorderEnum? _$outlinedBorderType(OutlinedBorderProperties v) =>
      v.outlinedBorderType;
  static const Field<OutlinedBorderProperties, OutlinedBorderEnum>
      _f$outlinedBorderType =
      Field('outlinedBorderType', _$outlinedBorderType, opt: true);

  @override
  final MappableFields<OutlinedBorderProperties> fields = const {
    #side: _f$side,
    #outlinedBorderType: _f$outlinedBorderType,
  };

  static OutlinedBorderProperties _instantiate(DecodingData data) {
    return OutlinedBorderProperties(
        side: data.dec(_f$side),
        outlinedBorderType: data.dec(_f$outlinedBorderType));
  }

  @override
  final Function instantiate = _instantiate;

  static OutlinedBorderProperties fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<OutlinedBorderProperties>(map);
  }

  static OutlinedBorderProperties fromJson(String json) {
    return ensureInitialized().decodeJson<OutlinedBorderProperties>(json);
  }
}

mixin OutlinedBorderPropertiesMappable {
  String toJson() {
    return OutlinedBorderPropertiesMapper.ensureInitialized()
        .encodeJson<OutlinedBorderProperties>(this as OutlinedBorderProperties);
  }

  Map<String, dynamic> toMap() {
    return OutlinedBorderPropertiesMapper.ensureInitialized()
        .encodeMap<OutlinedBorderProperties>(this as OutlinedBorderProperties);
  }

  OutlinedBorderPropertiesCopyWith<OutlinedBorderProperties,
          OutlinedBorderProperties, OutlinedBorderProperties>
      get copyWith => _OutlinedBorderPropertiesCopyWithImpl<
              OutlinedBorderProperties, OutlinedBorderProperties>(
          this as OutlinedBorderProperties, $identity, $identity);
  @override
  String toString() {
    return OutlinedBorderPropertiesMapper.ensureInitialized()
        .stringifyValue(this as OutlinedBorderProperties);
  }

  @override
  bool operator ==(Object other) {
    return OutlinedBorderPropertiesMapper.ensureInitialized()
        .equalsValue(this as OutlinedBorderProperties, other);
  }

  @override
  int get hashCode {
    return OutlinedBorderPropertiesMapper.ensureInitialized()
        .hashValue(this as OutlinedBorderProperties);
  }
}

extension OutlinedBorderPropertiesValueCopy<$R, $Out>
    on ObjectCopyWith<$R, OutlinedBorderProperties, $Out> {
  OutlinedBorderPropertiesCopyWith<$R, OutlinedBorderProperties, $Out>
      get $asOutlinedBorderProperties => $base.as((v, t, t2) =>
          _OutlinedBorderPropertiesCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class OutlinedBorderPropertiesCopyWith<
    $R,
    $In extends OutlinedBorderProperties,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  BorderSidePropertiesCopyWith<$R, BorderSideProperties, BorderSideProperties>?
      get side;
  $R call({BorderSideProperties? side, OutlinedBorderEnum? outlinedBorderType});
  OutlinedBorderPropertiesCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _OutlinedBorderPropertiesCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, OutlinedBorderProperties, $Out>
    implements
        OutlinedBorderPropertiesCopyWith<$R, OutlinedBorderProperties, $Out> {
  _OutlinedBorderPropertiesCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<OutlinedBorderProperties> $mapper =
      OutlinedBorderPropertiesMapper.ensureInitialized();
  @override
  BorderSidePropertiesCopyWith<$R, BorderSideProperties, BorderSideProperties>?
      get side => $value.side?.copyWith.$chain((v) => call(side: v));
  @override
  $R call({Object? side = $none, Object? outlinedBorderType = $none}) =>
      $apply(FieldCopyWithData({
        if (side != $none) #side: side,
        if (outlinedBorderType != $none) #outlinedBorderType: outlinedBorderType
      }));
  @override
  OutlinedBorderProperties $make(CopyWithData data) => OutlinedBorderProperties(
      side: data.get(#side, or: $value.side),
      outlinedBorderType:
          data.get(#outlinedBorderType, or: $value.outlinedBorderType));

  @override
  OutlinedBorderPropertiesCopyWith<$R2, OutlinedBorderProperties, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _OutlinedBorderPropertiesCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
