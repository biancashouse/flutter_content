// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'edgeinsets_node_value.dart';

class EdgeInsetsValueMapper extends ClassMapperBase<EdgeInsetsValue> {
  EdgeInsetsValueMapper._();

  static EdgeInsetsValueMapper? _instance;
  static EdgeInsetsValueMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = EdgeInsetsValueMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'EdgeInsetsValue';

  static double _$top(EdgeInsetsValue v) => v.top;
  static const Field<EdgeInsetsValue, double> _f$top =
      Field('top', _$top, opt: true, def: 0.0);
  static double _$left(EdgeInsetsValue v) => v.left;
  static const Field<EdgeInsetsValue, double> _f$left =
      Field('left', _$left, opt: true, def: 0.0);
  static double _$bottom(EdgeInsetsValue v) => v.bottom;
  static const Field<EdgeInsetsValue, double> _f$bottom =
      Field('bottom', _$bottom, opt: true, def: 0.0);
  static double _$right(EdgeInsetsValue v) => v.right;
  static const Field<EdgeInsetsValue, double> _f$right =
      Field('right', _$right, opt: true, def: 0.0);

  @override
  final MappableFields<EdgeInsetsValue> fields = const {
    #top: _f$top,
    #left: _f$left,
    #bottom: _f$bottom,
    #right: _f$right,
  };

  static EdgeInsetsValue _instantiate(DecodingData data) {
    return EdgeInsetsValue(
        top: data.dec(_f$top),
        left: data.dec(_f$left),
        bottom: data.dec(_f$bottom),
        right: data.dec(_f$right));
  }

  @override
  final Function instantiate = _instantiate;

  static EdgeInsetsValue fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<EdgeInsetsValue>(map);
  }

  static EdgeInsetsValue fromJson(String json) {
    return ensureInitialized().decodeJson<EdgeInsetsValue>(json);
  }
}

mixin EdgeInsetsValueMappable {
  String toJson() {
    return EdgeInsetsValueMapper.ensureInitialized()
        .encodeJson<EdgeInsetsValue>(this as EdgeInsetsValue);
  }

  Map<String, dynamic> toMap() {
    return EdgeInsetsValueMapper.ensureInitialized()
        .encodeMap<EdgeInsetsValue>(this as EdgeInsetsValue);
  }

  EdgeInsetsValueCopyWith<EdgeInsetsValue, EdgeInsetsValue, EdgeInsetsValue>
      get copyWith => _EdgeInsetsValueCopyWithImpl(
          this as EdgeInsetsValue, $identity, $identity);
  @override
  String toString() {
    return EdgeInsetsValueMapper.ensureInitialized()
        .stringifyValue(this as EdgeInsetsValue);
  }

  @override
  bool operator ==(Object other) {
    return EdgeInsetsValueMapper.ensureInitialized()
        .equalsValue(this as EdgeInsetsValue, other);
  }

  @override
  int get hashCode {
    return EdgeInsetsValueMapper.ensureInitialized()
        .hashValue(this as EdgeInsetsValue);
  }
}

extension EdgeInsetsValueValueCopy<$R, $Out>
    on ObjectCopyWith<$R, EdgeInsetsValue, $Out> {
  EdgeInsetsValueCopyWith<$R, EdgeInsetsValue, $Out> get $asEdgeInsetsValue =>
      $base.as((v, t, t2) => _EdgeInsetsValueCopyWithImpl(v, t, t2));
}

abstract class EdgeInsetsValueCopyWith<$R, $In extends EdgeInsetsValue, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({double? top, double? left, double? bottom, double? right});
  EdgeInsetsValueCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _EdgeInsetsValueCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, EdgeInsetsValue, $Out>
    implements EdgeInsetsValueCopyWith<$R, EdgeInsetsValue, $Out> {
  _EdgeInsetsValueCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<EdgeInsetsValue> $mapper =
      EdgeInsetsValueMapper.ensureInitialized();
  @override
  $R call({double? top, double? left, double? bottom, double? right}) =>
      $apply(FieldCopyWithData({
        if (top != null) #top: top,
        if (left != null) #left: left,
        if (bottom != null) #bottom: bottom,
        if (right != null) #right: right
      }));
  @override
  EdgeInsetsValue $make(CopyWithData data) => EdgeInsetsValue(
      top: data.get(#top, or: $value.top),
      left: data.get(#left, or: $value.left),
      bottom: data.get(#bottom, or: $value.bottom),
      right: data.get(#right, or: $value.right));

  @override
  EdgeInsetsValueCopyWith<$R2, EdgeInsetsValue, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _EdgeInsetsValueCopyWithImpl($value, $cast, t);
}
