// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'generic_single_child_node.dart';

class GenericSingleChildNodeMapper
    extends SubClassMapperBase<GenericSingleChildNode> {
  GenericSingleChildNodeMapper._();

  static GenericSingleChildNodeMapper? _instance;
  static GenericSingleChildNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GenericSingleChildNodeMapper._());
      SCMapper.ensureInitialized().addSubMapper(_instance!);
      SNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'GenericSingleChildNode';

  static String _$propertyName(GenericSingleChildNode v) => v.propertyName;
  static const Field<GenericSingleChildNode, String> _f$propertyName =
      Field('propertyName', _$propertyName);
  static SNode? _$child(GenericSingleChildNode v) => v.child;
  static const Field<GenericSingleChildNode, SNode> _f$child =
      Field('child', _$child, opt: true);
  static String _$uid(GenericSingleChildNode v) => v.uid;
  static const Field<GenericSingleChildNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static bool _$isExpanded(GenericSingleChildNode v) => v.isExpanded;
  static const Field<GenericSingleChildNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(GenericSingleChildNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<GenericSingleChildNode, bool>
      _f$hidePropertiesWhileDragging = Field(
          'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
          mode: FieldMode.member);

  @override
  final MappableFields<GenericSingleChildNode> fields = const {
    #propertyName: _f$propertyName,
    #child: _f$child,
    #uid: _f$uid,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
  };

  @override
  final String discriminatorKey = 'sc';
  @override
  final dynamic discriminatorValue = 'GenericSingleChildNode';
  @override
  late final ClassMapperBase superMapper = SCMapper.ensureInitialized();

  static GenericSingleChildNode _instantiate(DecodingData data) {
    return GenericSingleChildNode(
        propertyName: data.dec(_f$propertyName), child: data.dec(_f$child));
  }

  @override
  final Function instantiate = _instantiate;

  static GenericSingleChildNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GenericSingleChildNode>(map);
  }

  static GenericSingleChildNode fromJson(String json) {
    return ensureInitialized().decodeJson<GenericSingleChildNode>(json);
  }
}

mixin GenericSingleChildNodeMappable {
  String toJson() {
    return GenericSingleChildNodeMapper.ensureInitialized()
        .encodeJson<GenericSingleChildNode>(this as GenericSingleChildNode);
  }

  Map<String, dynamic> toMap() {
    return GenericSingleChildNodeMapper.ensureInitialized()
        .encodeMap<GenericSingleChildNode>(this as GenericSingleChildNode);
  }

  GenericSingleChildNodeCopyWith<GenericSingleChildNode, GenericSingleChildNode,
          GenericSingleChildNode>
      get copyWith => _GenericSingleChildNodeCopyWithImpl<
              GenericSingleChildNode, GenericSingleChildNode>(
          this as GenericSingleChildNode, $identity, $identity);
  @override
  String toString() {
    return GenericSingleChildNodeMapper.ensureInitialized()
        .stringifyValue(this as GenericSingleChildNode);
  }

  @override
  bool operator ==(Object other) {
    return GenericSingleChildNodeMapper.ensureInitialized()
        .equalsValue(this as GenericSingleChildNode, other);
  }

  @override
  int get hashCode {
    return GenericSingleChildNodeMapper.ensureInitialized()
        .hashValue(this as GenericSingleChildNode);
  }
}

extension GenericSingleChildNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GenericSingleChildNode, $Out> {
  GenericSingleChildNodeCopyWith<$R, GenericSingleChildNode, $Out>
      get $asGenericSingleChildNode => $base.as((v, t, t2) =>
          _GenericSingleChildNodeCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class GenericSingleChildNodeCopyWith<
    $R,
    $In extends GenericSingleChildNode,
    $Out> implements SCCopyWith<$R, $In, $Out> {
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child;
  @override
  $R call({String? propertyName, SNode? child});
  GenericSingleChildNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _GenericSingleChildNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GenericSingleChildNode, $Out>
    implements
        GenericSingleChildNodeCopyWith<$R, GenericSingleChildNode, $Out> {
  _GenericSingleChildNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GenericSingleChildNode> $mapper =
      GenericSingleChildNodeMapper.ensureInitialized();
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child =>
      $value.child?.copyWith.$chain((v) => call(child: v));
  @override
  $R call({String? propertyName, Object? child = $none}) =>
      $apply(FieldCopyWithData({
        if (propertyName != null) #propertyName: propertyName,
        if (child != $none) #child: child
      }));
  @override
  GenericSingleChildNode $make(CopyWithData data) => GenericSingleChildNode(
      propertyName: data.get(#propertyName, or: $value.propertyName),
      child: data.get(#child, or: $value.child));

  @override
  GenericSingleChildNodeCopyWith<$R2, GenericSingleChildNode, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _GenericSingleChildNodeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
