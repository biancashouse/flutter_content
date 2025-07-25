// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'placeholder_node.dart';

class PlaceholderNodeMapper extends SubClassMapperBase<PlaceholderNode> {
  PlaceholderNodeMapper._();

  static PlaceholderNodeMapper? _instance;
  static PlaceholderNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PlaceholderNodeMapper._());
      CLMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'PlaceholderNode';

  static String? _$name(PlaceholderNode v) => v.name;
  static const Field<PlaceholderNode, String> _f$name =
      Field('name', _$name, opt: true);
  static double? _$width(PlaceholderNode v) => v.width;
  static const Field<PlaceholderNode, double> _f$width =
      Field('width', _$width, opt: true);
  static double? _$height(PlaceholderNode v) => v.height;
  static const Field<PlaceholderNode, double> _f$height =
      Field('height', _$height, opt: true);
  static String _$uid(PlaceholderNode v) => v.uid;
  static const Field<PlaceholderNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static bool _$isExpanded(PlaceholderNode v) => v.isExpanded;
  static const Field<PlaceholderNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(PlaceholderNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<PlaceholderNode, bool> _f$hidePropertiesWhileDragging =
      Field('hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
          mode: FieldMode.member);

  @override
  final MappableFields<PlaceholderNode> fields = const {
    #name: _f$name,
    #width: _f$width,
    #height: _f$height,
    #uid: _f$uid,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
  };

  @override
  final String discriminatorKey = 'cl';
  @override
  final dynamic discriminatorValue = 'PlaceholderNode';
  @override
  late final ClassMapperBase superMapper = CLMapper.ensureInitialized();

  static PlaceholderNode _instantiate(DecodingData data) {
    return PlaceholderNode(
        name: data.dec(_f$name),
        width: data.dec(_f$width),
        height: data.dec(_f$height));
  }

  @override
  final Function instantiate = _instantiate;

  static PlaceholderNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PlaceholderNode>(map);
  }

  static PlaceholderNode fromJson(String json) {
    return ensureInitialized().decodeJson<PlaceholderNode>(json);
  }
}

mixin PlaceholderNodeMappable {
  String toJson() {
    return PlaceholderNodeMapper.ensureInitialized()
        .encodeJson<PlaceholderNode>(this as PlaceholderNode);
  }

  Map<String, dynamic> toMap() {
    return PlaceholderNodeMapper.ensureInitialized()
        .encodeMap<PlaceholderNode>(this as PlaceholderNode);
  }

  PlaceholderNodeCopyWith<PlaceholderNode, PlaceholderNode, PlaceholderNode>
      get copyWith =>
          _PlaceholderNodeCopyWithImpl<PlaceholderNode, PlaceholderNode>(
              this as PlaceholderNode, $identity, $identity);
  @override
  String toString() {
    return PlaceholderNodeMapper.ensureInitialized()
        .stringifyValue(this as PlaceholderNode);
  }

  @override
  bool operator ==(Object other) {
    return PlaceholderNodeMapper.ensureInitialized()
        .equalsValue(this as PlaceholderNode, other);
  }

  @override
  int get hashCode {
    return PlaceholderNodeMapper.ensureInitialized()
        .hashValue(this as PlaceholderNode);
  }
}

extension PlaceholderNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PlaceholderNode, $Out> {
  PlaceholderNodeCopyWith<$R, PlaceholderNode, $Out> get $asPlaceholderNode =>
      $base.as((v, t, t2) => _PlaceholderNodeCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PlaceholderNodeCopyWith<$R, $In extends PlaceholderNode, $Out>
    implements CLCopyWith<$R, $In, $Out> {
  @override
  $R call({String? name, double? width, double? height});
  PlaceholderNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PlaceholderNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PlaceholderNode, $Out>
    implements PlaceholderNodeCopyWith<$R, PlaceholderNode, $Out> {
  _PlaceholderNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PlaceholderNode> $mapper =
      PlaceholderNodeMapper.ensureInitialized();
  @override
  $R call(
          {Object? name = $none,
          Object? width = $none,
          Object? height = $none}) =>
      $apply(FieldCopyWithData({
        if (name != $none) #name: name,
        if (width != $none) #width: width,
        if (height != $none) #height: height
      }));
  @override
  PlaceholderNode $make(CopyWithData data) => PlaceholderNode(
      name: data.get(#name, or: $value.name),
      width: data.get(#width, or: $value.width),
      height: data.get(#height, or: $value.height));

  @override
  PlaceholderNodeCopyWith<$R2, PlaceholderNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PlaceholderNodeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
