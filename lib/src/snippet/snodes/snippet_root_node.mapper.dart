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
      TitleSnippetRootNodeMapper.ensureInitialized();
      SubtitleSnippetRootNodeMapper.ensureInitialized();
      ContentSnippetRootNodeMapper.ensureInitialized();
      STreeNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SnippetRootNode';

  static String _$name(SnippetRootNode v) => v.name;
  static const Field<SnippetRootNode, String> _f$name = Field('name', _$name);
  static bool _$isEmbedded(SnippetRootNode v) => v.isEmbedded;
  static const Field<SnippetRootNode, bool> _f$isEmbedded =
      Field('isEmbedded', _$isEmbedded, opt: true, def: false);
  static String _$tags(SnippetRootNode v) => v.tags;
  static const Field<SnippetRootNode, String> _f$tags =
      Field('tags', _$tags, opt: true, def: '');
  static STreeNode? _$child(SnippetRootNode v) => v.child;
  static const Field<SnippetRootNode, STreeNode> _f$child =
      Field('child', _$child, opt: true);
  static bool _$isExpanded(SnippetRootNode v) => v.isExpanded;
  static const Field<SnippetRootNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static PTreeNodeTreeController? _$pTreeC(SnippetRootNode v) => v.pTreeC;
  static const Field<SnippetRootNode, PTreeNodeTreeController> _f$pTreeC =
      Field('pTreeC', _$pTreeC, mode: FieldMode.member);
  static double? _$propertiesPaneScrollPos(SnippetRootNode v) =>
      v.propertiesPaneScrollPos;
  static const Field<SnippetRootNode, double> _f$propertiesPaneScrollPos =
      Field('propertiesPaneScrollPos', _$propertiesPaneScrollPos,
          mode: FieldMode.member);
  static ScrollController? _$propertiesPaneSC(SnippetRootNode v) =>
      v.propertiesPaneSC;
  static const Field<SnippetRootNode, ScrollController> _f$propertiesPaneSC =
      Field('propertiesPaneSC', _$propertiesPaneSC, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(SnippetRootNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<SnippetRootNode, bool> _f$hidePropertiesWhileDragging =
      Field('hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
          mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(SnippetRootNode v) =>
      v.nodeWidgetGK;
  static const Field<SnippetRootNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<SnippetRootNode> fields = const {
    #name: _f$name,
    #isEmbedded: _f$isEmbedded,
    #tags: _f$tags,
    #child: _f$child,
    #isExpanded: _f$isExpanded,
    #pTreeC: _f$pTreeC,
    #propertiesPaneScrollPos: _f$propertiesPaneScrollPos,
    #propertiesPaneSC: _f$propertiesPaneSC,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'sc';
  @override
  final dynamic discriminatorValue = 'SnippetRootNode';
  @override
  late final ClassMapperBase superMapper = SCMapper.ensureInitialized();

  static SnippetRootNode _instantiate(DecodingData data) {
    return SnippetRootNode(
        name: data.dec(_f$name),
        isEmbedded: data.dec(_f$isEmbedded),
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
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            SnippetRootNodeMapper.ensureInitialized()
                .isValueEqual(this as SnippetRootNode, other));
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
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get child;
  @override
  $R call({String? name, bool? isEmbedded, String? tags, STreeNode? child});
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
  SnippetRootNode $make(CopyWithData data) => SnippetRootNode(
      name: data.get(#name, or: $value.name),
      isEmbedded: data.get(#isEmbedded, or: $value.isEmbedded),
      tags: data.get(#tags, or: $value.tags),
      child: data.get(#child, or: $value.child));

  @override
  SnippetRootNodeCopyWith<$R2, SnippetRootNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SnippetRootNodeCopyWithImpl($value, $cast, t);
}