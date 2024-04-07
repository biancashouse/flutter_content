// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'outlined_border_group.dart';

class OutlinedBorderGroupMapper extends ClassMapperBase<OutlinedBorderGroup> {
  OutlinedBorderGroupMapper._();

  static OutlinedBorderGroupMapper? _instance;
  static OutlinedBorderGroupMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OutlinedBorderGroupMapper._());
      BorderSideGroupMapper.ensureInitialized();
      OutlinedBorderEnumMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'OutlinedBorderGroup';

  static BorderSideGroup? _$side(OutlinedBorderGroup v) => v.side;
  static const Field<OutlinedBorderGroup, BorderSideGroup> _f$side =
      Field('side', _$side, opt: true);
  static OutlinedBorderEnum? _$outlinedBorderType(OutlinedBorderGroup v) =>
      v.outlinedBorderType;
  static const Field<OutlinedBorderGroup, OutlinedBorderEnum>
      _f$outlinedBorderType =
      Field('outlinedBorderType', _$outlinedBorderType, opt: true);

  @override
  final MappableFields<OutlinedBorderGroup> fields = const {
    #side: _f$side,
    #outlinedBorderType: _f$outlinedBorderType,
  };

  static OutlinedBorderGroup _instantiate(DecodingData data) {
    return OutlinedBorderGroup(
        side: data.dec(_f$side),
        outlinedBorderType: data.dec(_f$outlinedBorderType));
  }

  @override
  final Function instantiate = _instantiate;

  static OutlinedBorderGroup fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<OutlinedBorderGroup>(map);
  }

  static OutlinedBorderGroup fromJson(String json) {
    return ensureInitialized().decodeJson<OutlinedBorderGroup>(json);
  }
}

mixin OutlinedBorderGroupMappable {
  String toJson() {
    return OutlinedBorderGroupMapper.ensureInitialized()
        .encodeJson<OutlinedBorderGroup>(this as OutlinedBorderGroup);
  }

  Map<String, dynamic> toMap() {
    return OutlinedBorderGroupMapper.ensureInitialized()
        .encodeMap<OutlinedBorderGroup>(this as OutlinedBorderGroup);
  }

  OutlinedBorderGroupCopyWith<OutlinedBorderGroup, OutlinedBorderGroup,
          OutlinedBorderGroup>
      get copyWith => _OutlinedBorderGroupCopyWithImpl(
          this as OutlinedBorderGroup, $identity, $identity);
  @override
  String toString() {
    return OutlinedBorderGroupMapper.ensureInitialized()
        .stringifyValue(this as OutlinedBorderGroup);
  }

  @override
  bool operator ==(Object other) {
    return OutlinedBorderGroupMapper.ensureInitialized()
        .equalsValue(this as OutlinedBorderGroup, other);
  }

  @override
  int get hashCode {
    return OutlinedBorderGroupMapper.ensureInitialized()
        .hashValue(this as OutlinedBorderGroup);
  }
}

extension OutlinedBorderGroupValueCopy<$R, $Out>
    on ObjectCopyWith<$R, OutlinedBorderGroup, $Out> {
  OutlinedBorderGroupCopyWith<$R, OutlinedBorderGroup, $Out>
      get $asOutlinedBorderGroup =>
          $base.as((v, t, t2) => _OutlinedBorderGroupCopyWithImpl(v, t, t2));
}

abstract class OutlinedBorderGroupCopyWith<$R, $In extends OutlinedBorderGroup,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  BorderSideGroupCopyWith<$R, BorderSideGroup, BorderSideGroup>? get side;
  $R call({BorderSideGroup? side, OutlinedBorderEnum? outlinedBorderType});
  OutlinedBorderGroupCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _OutlinedBorderGroupCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, OutlinedBorderGroup, $Out>
    implements OutlinedBorderGroupCopyWith<$R, OutlinedBorderGroup, $Out> {
  _OutlinedBorderGroupCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<OutlinedBorderGroup> $mapper =
      OutlinedBorderGroupMapper.ensureInitialized();
  @override
  BorderSideGroupCopyWith<$R, BorderSideGroup, BorderSideGroup>? get side =>
      $value.side?.copyWith.$chain((v) => call(side: v));
  @override
  $R call({Object? side = $none, Object? outlinedBorderType = $none}) =>
      $apply(FieldCopyWithData({
        if (side != $none) #side: side,
        if (outlinedBorderType != $none) #outlinedBorderType: outlinedBorderType
      }));
  @override
  OutlinedBorderGroup $make(CopyWithData data) => OutlinedBorderGroup(
      side: data.get(#side, or: $value.side),
      outlinedBorderType:
          data.get(#outlinedBorderType, or: $value.outlinedBorderType));

  @override
  OutlinedBorderGroupCopyWith<$R2, OutlinedBorderGroup, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _OutlinedBorderGroupCopyWithImpl($value, $cast, t);
}
