// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'snippet_root_node.dart';

class SnippetRootNodeMapper extends SubClassMapperBase<SnippetRootNode> {
  SnippetRootNodeMapper._();

  static SnippetRootNodeMapper? _instance;
  static SnippetRootNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SnippetRootNodeMapper._());
      SCMapper.ensureInitialized().addSubMapper(_instance!);
      SNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SnippetRootNode';

  static String _$name(SnippetRootNode v) => v.name;
  static const Field<SnippetRootNode, String> _f$name = Field('name', _$name);
  static String _$tags(SnippetRootNode v) => v.tags;
  static const Field<SnippetRootNode, String> _f$tags =
      Field('tags', _$tags, opt: true, def: '');
  static SNode? _$child(SnippetRootNode v) => v.child;
  static const Field<SnippetRootNode, SNode> _f$child =
      Field('child', _$child, opt: true);
  static String _$uid(SnippetRootNode v) => v.uid;
  static const Field<SnippetRootNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static bool _$isExpanded(SnippetRootNode v) => v.isExpanded;
  static const Field<SnippetRootNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(SnippetRootNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<SnippetRootNode, bool> _f$hidePropertiesWhileDragging =
      Field('hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
          mode: FieldMode.member);

  @override
  final MappableFields<SnippetRootNode> fields = const {
    #name: _f$name,
    #tags: _f$tags,
    #child: _f$child,
    #uid: _f$uid,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
  };

  @override
  final String discriminatorKey = 'sc';
  @override
  final dynamic discriminatorValue = 'SnippetRootNode';
  @override
  late final ClassMapperBase superMapper = SCMapper.ensureInitialized();

  @override
  final MappingHook hook = const SnippetRootNodeHook();
  static SnippetRootNode _instantiate(DecodingData data) {
    return SnippetRootNode(
        name: data.dec(_f$name),
        tags: data.dec(_f$tags),
        child: data.dec(_f$child));
  }

  @override
  final Function instantiate = _instantiate;

  static SnippetRootNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SnippetRootNode>(map);
  }

  static SnippetRootNode fromJson(String json) {
    return ensureInitialized().decodeJson<SnippetRootNode>(json);
  }
}

mixin SnippetRootNodeMappable {
  String toJson() {
    return SnippetRootNodeMapper.ensureInitialized()
        .encodeJson<SnippetRootNode>(this as SnippetRootNode);
  }

  Map<String, dynamic> toMap() {
    return SnippetRootNodeMapper.ensureInitialized()
        .encodeMap<SnippetRootNode>(this as SnippetRootNode);
  }

  SnippetRootNodeCopyWith<SnippetRootNode, SnippetRootNode, SnippetRootNode>
      get copyWith => _SnippetRootNodeCopyWithImpl(
          this as SnippetRootNode, $identity, $identity);
  @override
  String toString() {
    return SnippetRootNodeMapper.ensureInitialized()
        .stringifyValue(this as SnippetRootNode);
  }

  @override
  bool operator ==(Object other) {
    return SnippetRootNodeMapper.ensureInitialized()
        .equalsValue(this as SnippetRootNode, other);
  }

  @override
  int get hashCode {
    return SnippetRootNodeMapper.ensureInitialized()
        .hashValue(this as SnippetRootNode);
  }
}

extension SnippetRootNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SnippetRootNode, $Out> {
  SnippetRootNodeCopyWith<$R, SnippetRootNode, $Out> get $asSnippetRootNode =>
      $base.as((v, t, t2) => _SnippetRootNodeCopyWithImpl(v, t, t2));
}

abstract class SnippetRootNodeCopyWith<$R, $In extends SnippetRootNode, $Out>
    implements SCCopyWith<$R, $In, $Out> {
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child;
  @override
  $R call({String? name, String? tags, SNode? child});
  SnippetRootNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SnippetRootNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SnippetRootNode, $Out>
    implements SnippetRootNodeCopyWith<$R, SnippetRootNode, $Out> {
  _SnippetRootNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SnippetRootNode> $mapper =
      SnippetRootNodeMapper.ensureInitialized();
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child =>
      $value.child?.copyWith.$chain((v) => call(child: v));
  @override
  $R call({String? name, String? tags, Object? child = $none}) =>
      $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (tags != null) #tags: tags,
        if (child != $none) #child: child
      }));
  @override
  SnippetRootNode $make(CopyWithData data) => SnippetRootNode(
      name: data.get(#name, or: $value.name),
      tags: data.get(#tags, or: $value.tags),
      child: data.get(#child, or: $value.child));

  @override
  SnippetRootNodeCopyWith<$R2, SnippetRootNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SnippetRootNodeCopyWithImpl($value, $cast, t);
}
