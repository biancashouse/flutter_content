// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'subtitle_snippet_root_node.dart';

class SubtitleSnippetRootNodeMapper
    extends SubClassMapperBase<SubtitleSnippetRootNode> {
  SubtitleSnippetRootNodeMapper._();

  static SubtitleSnippetRootNodeMapper? _instance;
  static SubtitleSnippetRootNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = SubtitleSnippetRootNodeMapper._());
      SnippetRootNodeMapper.ensureInitialized().addSubMapper(_instance!);
      STreeNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SubtitleSnippetRootNode';

  static String _$name(SubtitleSnippetRootNode v) => v.name;
  static const Field<SubtitleSnippetRootNode, String> _f$name =
      Field('name', _$name);
  static bool _$isEmbedded(SubtitleSnippetRootNode v) => v.isEmbedded;
  static const Field<SubtitleSnippetRootNode, bool> _f$isEmbedded =
      Field('isEmbedded', _$isEmbedded, opt: true, def: false);
  static String _$tags(SubtitleSnippetRootNode v) => v.tags;
  static const Field<SubtitleSnippetRootNode, String> _f$tags =
      Field('tags', _$tags, opt: true, def: '');
  static STreeNode? _$child(SubtitleSnippetRootNode v) => v.child;
  static const Field<SubtitleSnippetRootNode, STreeNode> _f$child =
      Field('child', _$child, opt: true);
  static bool _$isExpanded(SubtitleSnippetRootNode v) => v.isExpanded;
  static const Field<SubtitleSnippetRootNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(SubtitleSnippetRootNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<SubtitleSnippetRootNode, bool>
      _f$hidePropertiesWhileDragging = Field(
          'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
          mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(
          SubtitleSnippetRootNode v) =>
      v.nodeWidgetGK;
  static const Field<SubtitleSnippetRootNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<SubtitleSnippetRootNode> fields = const {
    #name: _f$name,
    #isEmbedded: _f$isEmbedded,
    #tags: _f$tags,
    #child: _f$child,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'sr';
  @override
  final dynamic discriminatorValue = 'SubtitleSnippetRootNode';
  @override
  late final ClassMapperBase superMapper =
      SnippetRootNodeMapper.ensureInitialized();

  static SubtitleSnippetRootNode _instantiate(DecodingData data) {
    return SubtitleSnippetRootNode(
        name: data.dec(_f$name),
        isEmbedded: data.dec(_f$isEmbedded),
        tags: data.dec(_f$tags),
        child: data.dec(_f$child));
  }

  @override
  final Function instantiate = _instantiate;

  static SubtitleSnippetRootNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SubtitleSnippetRootNode>(map);
  }

  static SubtitleSnippetRootNode fromJson(String json) {
    return ensureInitialized().decodeJson<SubtitleSnippetRootNode>(json);
  }
}

mixin SubtitleSnippetRootNodeMappable {
  String toJson() {
    return SubtitleSnippetRootNodeMapper.ensureInitialized()
        .encodeJson<SubtitleSnippetRootNode>(this as SubtitleSnippetRootNode);
  }

  Map<String, dynamic> toMap() {
    return SubtitleSnippetRootNodeMapper.ensureInitialized()
        .encodeMap<SubtitleSnippetRootNode>(this as SubtitleSnippetRootNode);
  }

  SubtitleSnippetRootNodeCopyWith<SubtitleSnippetRootNode,
          SubtitleSnippetRootNode, SubtitleSnippetRootNode>
      get copyWith => _SubtitleSnippetRootNodeCopyWithImpl(
          this as SubtitleSnippetRootNode, $identity, $identity);
  @override
  String toString() {
    return SubtitleSnippetRootNodeMapper.ensureInitialized()
        .stringifyValue(this as SubtitleSnippetRootNode);
  }

  @override
  bool operator ==(Object other) {
    return SubtitleSnippetRootNodeMapper.ensureInitialized()
        .equalsValue(this as SubtitleSnippetRootNode, other);
  }

  @override
  int get hashCode {
    return SubtitleSnippetRootNodeMapper.ensureInitialized()
        .hashValue(this as SubtitleSnippetRootNode);
  }
}

extension SubtitleSnippetRootNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SubtitleSnippetRootNode, $Out> {
  SubtitleSnippetRootNodeCopyWith<$R, SubtitleSnippetRootNode, $Out>
      get $asSubtitleSnippetRootNode => $base
          .as((v, t, t2) => _SubtitleSnippetRootNodeCopyWithImpl(v, t, t2));
}

abstract class SubtitleSnippetRootNodeCopyWith<
    $R,
    $In extends SubtitleSnippetRootNode,
    $Out> implements SnippetRootNodeCopyWith<$R, $In, $Out> {
  @override
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get child;
  @override
  $R call({String? name, bool? isEmbedded, String? tags, STreeNode? child});
  SubtitleSnippetRootNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SubtitleSnippetRootNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SubtitleSnippetRootNode, $Out>
    implements
        SubtitleSnippetRootNodeCopyWith<$R, SubtitleSnippetRootNode, $Out> {
  _SubtitleSnippetRootNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SubtitleSnippetRootNode> $mapper =
      SubtitleSnippetRootNodeMapper.ensureInitialized();
  @override
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get child =>
      $value.child?.copyWith.$chain((v) => call(child: v));
  @override
  $R call(
          {String? name,
          bool? isEmbedded,
          String? tags,
          Object? child = $none}) =>
      $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (isEmbedded != null) #isEmbedded: isEmbedded,
        if (tags != null) #tags: tags,
        if (child != $none) #child: child
      }));
  @override
  SubtitleSnippetRootNode $make(CopyWithData data) => SubtitleSnippetRootNode(
      name: data.get(#name, or: $value.name),
      isEmbedded: data.get(#isEmbedded, or: $value.isEmbedded),
      tags: data.get(#tags, or: $value.tags),
      child: data.get(#child, or: $value.child));

  @override
  SubtitleSnippetRootNodeCopyWith<$R2, SubtitleSnippetRootNode, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _SubtitleSnippetRootNodeCopyWithImpl($value, $cast, t);
}
