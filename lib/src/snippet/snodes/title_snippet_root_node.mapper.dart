// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'title_snippet_root_node.dart';

class TitleSnippetRootNodeMapper
    extends SubClassMapperBase<TitleSnippetRootNode> {
  TitleSnippetRootNodeMapper._();

  static TitleSnippetRootNodeMapper? _instance;
  static TitleSnippetRootNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TitleSnippetRootNodeMapper._());
      SnippetRootNodeMapper.ensureInitialized().addSubMapper(_instance!);
      STreeNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TitleSnippetRootNode';

  static String _$name(TitleSnippetRootNode v) => v.name;
  static const Field<TitleSnippetRootNode, String> _f$name =
      Field('name', _$name);
  static bool _$isEmbedded(TitleSnippetRootNode v) => v.isEmbedded;
  static const Field<TitleSnippetRootNode, bool> _f$isEmbedded =
      Field('isEmbedded', _$isEmbedded, opt: true, def: false);
  static String _$tags(TitleSnippetRootNode v) => v.tags;
  static const Field<TitleSnippetRootNode, String> _f$tags =
      Field('tags', _$tags, opt: true, def: '');
  static STreeNode? _$child(TitleSnippetRootNode v) => v.child;
  static const Field<TitleSnippetRootNode, STreeNode> _f$child =
      Field('child', _$child, opt: true);
  static bool _$isExpanded(TitleSnippetRootNode v) => v.isExpanded;
  static const Field<TitleSnippetRootNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(TitleSnippetRootNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<TitleSnippetRootNode, bool>
      _f$hidePropertiesWhileDragging = Field(
          'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
          mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(
          TitleSnippetRootNode v) =>
      v.nodeWidgetGK;
  static const Field<TitleSnippetRootNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<TitleSnippetRootNode> fields = const {
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
  final dynamic discriminatorValue = 'TitleSnippetRootNode';
  @override
  late final ClassMapperBase superMapper =
      SnippetRootNodeMapper.ensureInitialized();

  static TitleSnippetRootNode _instantiate(DecodingData data) {
    return TitleSnippetRootNode(
        name: data.dec(_f$name),
        isEmbedded: data.dec(_f$isEmbedded),
        tags: data.dec(_f$tags),
        child: data.dec(_f$child));
  }

  @override
  final Function instantiate = _instantiate;

  static TitleSnippetRootNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TitleSnippetRootNode>(map);
  }

  static TitleSnippetRootNode fromJson(String json) {
    return ensureInitialized().decodeJson<TitleSnippetRootNode>(json);
  }
}

mixin TitleSnippetRootNodeMappable {
  String toJson() {
    return TitleSnippetRootNodeMapper.ensureInitialized()
        .encodeJson<TitleSnippetRootNode>(this as TitleSnippetRootNode);
  }

  Map<String, dynamic> toMap() {
    return TitleSnippetRootNodeMapper.ensureInitialized()
        .encodeMap<TitleSnippetRootNode>(this as TitleSnippetRootNode);
  }

  TitleSnippetRootNodeCopyWith<TitleSnippetRootNode, TitleSnippetRootNode,
          TitleSnippetRootNode>
      get copyWith => _TitleSnippetRootNodeCopyWithImpl(
          this as TitleSnippetRootNode, $identity, $identity);
  @override
  String toString() {
    return TitleSnippetRootNodeMapper.ensureInitialized()
        .stringifyValue(this as TitleSnippetRootNode);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            TitleSnippetRootNodeMapper.ensureInitialized()
                .isValueEqual(this as TitleSnippetRootNode, other));
  }

  @override
  int get hashCode {
    return TitleSnippetRootNodeMapper.ensureInitialized()
        .hashValue(this as TitleSnippetRootNode);
  }
}

extension TitleSnippetRootNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TitleSnippetRootNode, $Out> {
  TitleSnippetRootNodeCopyWith<$R, TitleSnippetRootNode, $Out>
      get $asTitleSnippetRootNode =>
          $base.as((v, t, t2) => _TitleSnippetRootNodeCopyWithImpl(v, t, t2));
}

abstract class TitleSnippetRootNodeCopyWith<
    $R,
    $In extends TitleSnippetRootNode,
    $Out> implements SnippetRootNodeCopyWith<$R, $In, $Out> {
  @override
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get child;
  @override
  $R call({String? name, bool? isEmbedded, String? tags, STreeNode? child});
  TitleSnippetRootNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TitleSnippetRootNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TitleSnippetRootNode, $Out>
    implements TitleSnippetRootNodeCopyWith<$R, TitleSnippetRootNode, $Out> {
  _TitleSnippetRootNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TitleSnippetRootNode> $mapper =
      TitleSnippetRootNodeMapper.ensureInitialized();
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
  TitleSnippetRootNode $make(CopyWithData data) => TitleSnippetRootNode(
      name: data.get(#name, or: $value.name),
      isEmbedded: data.get(#isEmbedded, or: $value.isEmbedded),
      tags: data.get(#tags, or: $value.tags),
      child: data.get(#child, or: $value.child));

  @override
  TitleSnippetRootNodeCopyWith<$R2, TitleSnippetRootNode, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _TitleSnippetRootNodeCopyWithImpl($value, $cast, t);
}
