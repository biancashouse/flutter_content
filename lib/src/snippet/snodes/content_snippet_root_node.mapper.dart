// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'content_snippet_root_node.dart';

class ContentSnippetRootNodeMapper
    extends SubClassMapperBase<ContentSnippetRootNode> {
  ContentSnippetRootNodeMapper._();

  static ContentSnippetRootNodeMapper? _instance;
  static ContentSnippetRootNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ContentSnippetRootNodeMapper._());
      SnippetRootNodeMapper.ensureInitialized().addSubMapper(_instance!);
      STreeNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ContentSnippetRootNode';

  static String _$name(ContentSnippetRootNode v) => v.name;
  static const Field<ContentSnippetRootNode, String> _f$name =
      Field('name', _$name);
  static bool _$isEmbedded(ContentSnippetRootNode v) => v.isEmbedded;
  static const Field<ContentSnippetRootNode, bool> _f$isEmbedded =
      Field('isEmbedded', _$isEmbedded, opt: true, def: false);
  static String _$tags(ContentSnippetRootNode v) => v.tags;
  static const Field<ContentSnippetRootNode, String> _f$tags =
      Field('tags', _$tags, opt: true, def: '');
  static STreeNode? _$child(ContentSnippetRootNode v) => v.child;
  static const Field<ContentSnippetRootNode, STreeNode> _f$child =
      Field('child', _$child, opt: true);
  static bool _$isExpanded(ContentSnippetRootNode v) => v.isExpanded;
  static const Field<ContentSnippetRootNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(ContentSnippetRootNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<ContentSnippetRootNode, bool>
      _f$hidePropertiesWhileDragging = Field(
          'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
          mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(
          ContentSnippetRootNode v) =>
      v.nodeWidgetGK;
  static const Field<ContentSnippetRootNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<ContentSnippetRootNode> fields = const {
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
  final dynamic discriminatorValue = 'ContentSnippetRootNode';
  @override
  late final ClassMapperBase superMapper =
      SnippetRootNodeMapper.ensureInitialized();

  static ContentSnippetRootNode _instantiate(DecodingData data) {
    return ContentSnippetRootNode(
        name: data.dec(_f$name),
        isEmbedded: data.dec(_f$isEmbedded),
        tags: data.dec(_f$tags),
        child: data.dec(_f$child));
  }

  @override
  final Function instantiate = _instantiate;

  static ContentSnippetRootNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ContentSnippetRootNode>(map);
  }

  static ContentSnippetRootNode fromJson(String json) {
    return ensureInitialized().decodeJson<ContentSnippetRootNode>(json);
  }
}

mixin ContentSnippetRootNodeMappable {
  String toJson() {
    return ContentSnippetRootNodeMapper.ensureInitialized()
        .encodeJson<ContentSnippetRootNode>(this as ContentSnippetRootNode);
  }

  Map<String, dynamic> toMap() {
    return ContentSnippetRootNodeMapper.ensureInitialized()
        .encodeMap<ContentSnippetRootNode>(this as ContentSnippetRootNode);
  }

  ContentSnippetRootNodeCopyWith<ContentSnippetRootNode, ContentSnippetRootNode,
          ContentSnippetRootNode>
      get copyWith => _ContentSnippetRootNodeCopyWithImpl(
          this as ContentSnippetRootNode, $identity, $identity);
  @override
  String toString() {
    return ContentSnippetRootNodeMapper.ensureInitialized()
        .stringifyValue(this as ContentSnippetRootNode);
  }

  @override
  bool operator ==(Object other) {
    return ContentSnippetRootNodeMapper.ensureInitialized()
        .equalsValue(this as ContentSnippetRootNode, other);
  }

  @override
  int get hashCode {
    return ContentSnippetRootNodeMapper.ensureInitialized()
        .hashValue(this as ContentSnippetRootNode);
  }
}

extension ContentSnippetRootNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ContentSnippetRootNode, $Out> {
  ContentSnippetRootNodeCopyWith<$R, ContentSnippetRootNode, $Out>
      get $asContentSnippetRootNode =>
          $base.as((v, t, t2) => _ContentSnippetRootNodeCopyWithImpl(v, t, t2));
}

abstract class ContentSnippetRootNodeCopyWith<
    $R,
    $In extends ContentSnippetRootNode,
    $Out> implements SnippetRootNodeCopyWith<$R, $In, $Out> {
  @override
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get child;
  @override
  $R call({String? name, bool? isEmbedded, String? tags, STreeNode? child});
  ContentSnippetRootNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ContentSnippetRootNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ContentSnippetRootNode, $Out>
    implements
        ContentSnippetRootNodeCopyWith<$R, ContentSnippetRootNode, $Out> {
  _ContentSnippetRootNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ContentSnippetRootNode> $mapper =
      ContentSnippetRootNodeMapper.ensureInitialized();
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
  ContentSnippetRootNode $make(CopyWithData data) => ContentSnippetRootNode(
      name: data.get(#name, or: $value.name),
      isEmbedded: data.get(#isEmbedded, or: $value.isEmbedded),
      tags: data.get(#tags, or: $value.tags),
      child: data.get(#child, or: $value.child));

  @override
  ContentSnippetRootNodeCopyWith<$R2, ContentSnippetRootNode, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ContentSnippetRootNodeCopyWithImpl($value, $cast, t);
}
