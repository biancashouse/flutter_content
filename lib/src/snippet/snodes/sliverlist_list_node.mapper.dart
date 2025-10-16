// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'sliverlist_list_node.dart';

class SliverListListNodeMapper extends SubClassMapperBase<SliverListListNode> {
  SliverListListNodeMapper._();

  static SliverListListNodeMapper? _instance;
  static SliverListListNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SliverListListNodeMapper._());
      MCMapper.ensureInitialized().addSubMapper(_instance!);
      SNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SliverListListNode';

  static List<SNode> _$children(SliverListListNode v) => v.children;
  static const Field<SliverListListNode, List<SNode>> _f$children = Field(
    'children',
    _$children,
  );
  static String _$uid(SliverListListNode v) => v.uid;
  static const Field<SliverListListNode, String> _f$uid = Field(
    'uid',
    _$uid,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$treeNodeGK(SliverListListNode v) =>
      v.treeNodeGK;
  static const Field<SliverListListNode, GlobalKey<State<StatefulWidget>>>
  _f$treeNodeGK = Field('treeNodeGK', _$treeNodeGK, mode: FieldMode.member);
  static bool _$isExpanded(SliverListListNode v) => v.isExpanded;
  static const Field<SliverListListNode, bool> _f$isExpanded = Field(
    'isExpanded',
    _$isExpanded,
    mode: FieldMode.member,
  );
  static bool? _$hidePropertiesWhileDragging(SliverListListNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<SliverListListNode, bool> _f$hidePropertiesWhileDragging =
      Field(
        'hidePropertiesWhileDragging',
        _$hidePropertiesWhileDragging,
        mode: FieldMode.member,
      );
  static bool _$canShowTappableNodeWidgetOverlay(SliverListListNode v) =>
      v.canShowTappableNodeWidgetOverlay;
  static const Field<SliverListListNode, bool>
  _f$canShowTappableNodeWidgetOverlay = Field(
    'canShowTappableNodeWidgetOverlay',
    _$canShowTappableNodeWidgetOverlay,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(
    SliverListListNode v,
  ) => v.nodeWidgetGK;
  static const Field<SliverListListNode, GlobalKey<State<StatefulWidget>>>
  _f$nodeWidgetGK = Field(
    'nodeWidgetGK',
    _$nodeWidgetGK,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<SliverListListNode> fields = const {
    #children: _f$children,
    #uid: _f$uid,
    #treeNodeGK: _f$treeNodeGK,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #canShowTappableNodeWidgetOverlay: _f$canShowTappableNodeWidgetOverlay,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'mc';
  @override
  final dynamic discriminatorValue = 'SliverListListNode';
  @override
  late final ClassMapperBase superMapper = MCMapper.ensureInitialized();

  static SliverListListNode _instantiate(DecodingData data) {
    return SliverListListNode(children: data.dec(_f$children));
  }

  @override
  final Function instantiate = _instantiate;

  static SliverListListNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SliverListListNode>(map);
  }

  static SliverListListNode fromJson(String json) {
    return ensureInitialized().decodeJson<SliverListListNode>(json);
  }
}

mixin SliverListListNodeMappable {
  String toJson() {
    return SliverListListNodeMapper.ensureInitialized()
        .encodeJson<SliverListListNode>(this as SliverListListNode);
  }

  Map<String, dynamic> toMap() {
    return SliverListListNodeMapper.ensureInitialized()
        .encodeMap<SliverListListNode>(this as SliverListListNode);
  }

  SliverListListNodeCopyWith<
    SliverListListNode,
    SliverListListNode,
    SliverListListNode
  >
  get copyWith =>
      _SliverListListNodeCopyWithImpl<SliverListListNode, SliverListListNode>(
        this as SliverListListNode,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return SliverListListNodeMapper.ensureInitialized().stringifyValue(
      this as SliverListListNode,
    );
  }

  @override
  bool operator ==(Object other) {
    return SliverListListNodeMapper.ensureInitialized().equalsValue(
      this as SliverListListNode,
      other,
    );
  }

  @override
  int get hashCode {
    return SliverListListNodeMapper.ensureInitialized().hashValue(
      this as SliverListListNode,
    );
  }
}

extension SliverListListNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SliverListListNode, $Out> {
  SliverListListNodeCopyWith<$R, SliverListListNode, $Out>
  get $asSliverListListNode => $base.as(
    (v, t, t2) => _SliverListListNodeCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class SliverListListNodeCopyWith<
  $R,
  $In extends SliverListListNode,
  $Out
>
    implements MCCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, SNode, SNodeCopyWith<$R, SNode, SNode>> get children;
  @override
  $R call({List<SNode>? children});
  SliverListListNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SliverListListNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SliverListListNode, $Out>
    implements SliverListListNodeCopyWith<$R, SliverListListNode, $Out> {
  _SliverListListNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SliverListListNode> $mapper =
      SliverListListNodeMapper.ensureInitialized();
  @override
  ListCopyWith<$R, SNode, SNodeCopyWith<$R, SNode, SNode>> get children =>
      ListCopyWith(
        $value.children,
        (v, t) => v.copyWith.$chain(t),
        (v) => call(children: v),
      );
  @override
  $R call({List<SNode>? children}) =>
      $apply(FieldCopyWithData({if (children != null) #children: children}));
  @override
  SliverListListNode $make(CopyWithData data) =>
      SliverListListNode(children: data.get(#children, or: $value.children));

  @override
  SliverListListNodeCopyWith<$R2, SliverListListNode, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _SliverListListNodeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

