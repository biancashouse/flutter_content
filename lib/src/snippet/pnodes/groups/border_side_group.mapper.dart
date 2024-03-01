// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'border_side_group.dart';

class BorderSideGroupMapper extends ClassMapperBase<BorderSideGroup> {
  BorderSideGroupMapper._();

  static BorderSideGroupMapper? _instance;
  static BorderSideGroupMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BorderSideGroupMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'BorderSideGroup';

  static double? _$width(BorderSideGroup v) => v.width;
  static const Field<BorderSideGroup, double> _f$width =
      Field('width', _$width, opt: true);
  static int? _$colorValue(BorderSideGroup v) => v.colorValue;
  static const Field<BorderSideGroup, int> _f$colorValue =
      Field('colorValue', _$colorValue, opt: true);

  @override
  final MappableFields<BorderSideGroup> fields = const {
    #width: _f$width,
    #colorValue: _f$colorValue,
  };

  static BorderSideGroup _instantiate(DecodingData data) {
    return BorderSideGroup(
        width: data.dec(_f$width), colorValue: data.dec(_f$colorValue));
  }

  @override
  final Function instantiate = _instantiate;

  static BorderSideGroup fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BorderSideGroup>(map);
  }

  static BorderSideGroup fromJson(String json) {
    return ensureInitialized().decodeJson<BorderSideGroup>(json);
  }
}

mixin BorderSideGroupMappable {
  String toJson() {
    return BorderSideGroupMapper.ensureInitialized()
        .encodeJson<BorderSideGroup>(this as BorderSideGroup);
  }

  Map<String, dynamic> toMap() {
    return BorderSideGroupMapper.ensureInitialized()
        .encodeMap<BorderSideGroup>(this as BorderSideGroup);
  }

  BorderSideGroupCopyWith<BorderSideGroup, BorderSideGroup, BorderSideGroup>
      get copyWith => _BorderSideGroupCopyWithImpl(
          this as BorderSideGroup, $identity, $identity);
  @override
  String toString() {
    return BorderSideGroupMapper.ensureInitialized()
        .stringifyValue(this as BorderSideGroup);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            BorderSideGroupMapper.ensureInitialized()
                .isValueEqual(this as BorderSideGroup, other));
  }

  @override
  int get hashCode {
    return BorderSideGroupMapper.ensureInitialized()
        .hashValue(this as BorderSideGroup);
  }
}

extension BorderSideGroupValueCopy<$R, $Out>
    on ObjectCopyWith<$R, BorderSideGroup, $Out> {
  BorderSideGroupCopyWith<$R, BorderSideGroup, $Out> get $asBorderSideGroup =>
      $base.as((v, t, t2) => _BorderSideGroupCopyWithImpl(v, t, t2));
}

abstract class BorderSideGroupCopyWith<$R, $In extends BorderSideGroup, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({double? width, int? colorValue});
  BorderSideGroupCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _BorderSideGroupCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BorderSideGroup, $Out>
    implements BorderSideGroupCopyWith<$R, BorderSideGroup, $Out> {
  _BorderSideGroupCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BorderSideGroup> $mapper =
      BorderSideGroupMapper.ensureInitialized();
  @override
  $R call({Object? width = $none, Object? colorValue = $none}) =>
      $apply(FieldCopyWithData({
        if (width != $none) #width: width,
        if (colorValue != $none) #colorValue: colorValue
      }));
  @override
  BorderSideGroup $make(CopyWithData data) => BorderSideGroup(
      width: data.get(#width, or: $value.width),
      colorValue: data.get(#colorValue, or: $value.colorValue));

  @override
  BorderSideGroupCopyWith<$R2, BorderSideGroup, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _BorderSideGroupCopyWithImpl($value, $cast, t);
}
