// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'sliver_resizing_header_node.dart';

class SliverResizingHeaderNodeMapper
    extends SubClassMapperBase<SliverResizingHeaderNode> {
  SliverResizingHeaderNodeMapper._();

  static SliverResizingHeaderNodeMapper? _instance;
  static SliverResizingHeaderNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = SliverResizingHeaderNodeMapper._(),
      );
      SCMapper.ensureInitialized().addSubMapper(_instance!);
      SNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SliverResizingHeaderNode';

  static SNode? _$child(SliverResizingHeaderNode v) => v.child;
  static const Field<SliverResizingHeaderNode, SNode> _f$child = Field(
    'child',
    _$child,
    opt: true,
  );
  static String _$uid(SliverResizingHeaderNode v) => v.uid;
  static const Field<SliverResizingHeaderNode, String> _f$uid = Field(
    'uid',
    _$uid,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$treeNodeGK(
    SliverResizingHeaderNode v,
  ) => v.treeNodeGK;
  static const Field<SliverResizingHeaderNode, GlobalKey<State<StatefulWidget>>>
  _f$treeNodeGK = Field('treeNodeGK', _$treeNodeGK, mode: FieldMode.member);
  static bool _$isExpanded(SliverResizingHeaderNode v) => v.isExpanded;
  static const Field<SliverResizingHeaderNode, bool> _f$isExpanded = Field(
    'isExpanded',
    _$isExpanded,
    mode: FieldMode.member,
  );
  static bool? _$hidePropertiesWhileDragging(SliverResizingHeaderNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<SliverResizingHeaderNode, bool>
  _f$hidePropertiesWhileDragging = Field(
    'hidePropertiesWhileDragging',
    _$hidePropertiesWhileDragging,
    mode: FieldMode.member,
  );
  static bool _$canShowTappableNodeWidgetOverlay(SliverResizingHeaderNode v) =>
      v.canShowTappableNodeWidgetOverlay;
  static const Field<SliverResizingHeaderNode, bool>
  _f$canShowTappableNodeWidgetOverlay = Field(
    'canShowTappableNodeWidgetOverlay',
    _$canShowTappableNodeWidgetOverlay,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(
    SliverResizingHeaderNode v,
  ) => v.nodeWidgetGK;
  static const Field<SliverResizingHeaderNode, GlobalKey<State<StatefulWidget>>>
  _f$nodeWidgetGK = Field(
    'nodeWidgetGK',
    _$nodeWidgetGK,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<SliverResizingHeaderNode> fields = const {
    #child: _f$child,
    #uid: _f$uid,
    #treeNodeGK: _f$treeNodeGK,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #canShowTappableNodeWidgetOverlay: _f$canShowTappableNodeWidgetOverlay,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'sc';
  @override
  final dynamic discriminatorValue = 'SliverResizingHeaderNode';
  @override
  late final ClassMapperBase superMapper = SCMapper.ensureInitialized();

  static SliverResizingHeaderNode _instantiate(DecodingData data) {
    return SliverResizingHeaderNode(child: data.dec(_f$child));
  }

  @override
  final Function instantiate = _instantiate;

  static SliverResizingHeaderNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SliverResizingHeaderNode>(map);
  }

  static SliverResizingHeaderNode fromJson(String json) {
    return ensureInitialized().decodeJson<SliverResizingHeaderNode>(json);
  }
}

mixin SliverResizingHeaderNodeMappable {
  String toJson() {
    return SliverResizingHeaderNodeMapper.ensureInitialized()
        .encodeJson<SliverResizingHeaderNode>(this as SliverResizingHeaderNode);
  }

  Map<String, dynamic> toMap() {
    return SliverResizingHeaderNodeMapper.ensureInitialized()
        .encodeMap<SliverResizingHeaderNode>(this as SliverResizingHeaderNode);
  }

  SliverResizingHeaderNodeCopyWith<
    SliverResizingHeaderNode,
    SliverResizingHeaderNode,
    SliverResizingHeaderNode
  >
  get copyWith =>
      _SliverResizingHeaderNodeCopyWithImpl<
        SliverResizingHeaderNode,
        SliverResizingHeaderNode
      >(this as SliverResizingHeaderNode, $identity, $identity);
  @override
  String toString() {
    return SliverResizingHeaderNodeMapper.ensureInitialized().stringifyValue(
      this as SliverResizingHeaderNode,
    );
  }

  @override
  bool operator ==(Object other) {
    return SliverResizingHeaderNodeMapper.ensureInitialized().equalsValue(
      this as SliverResizingHeaderNode,
      other,
    );
  }

  @override
  int get hashCode {
    return SliverResizingHeaderNodeMapper.ensureInitialized().hashValue(
      this as SliverResizingHeaderNode,
    );
  }
}

extension SliverResizingHeaderNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SliverResizingHeaderNode, $Out> {
  SliverResizingHeaderNodeCopyWith<$R, SliverResizingHeaderNode, $Out>
  get $asSliverResizingHeaderNode => $base.as(
    (v, t, t2) => _SliverResizingHeaderNodeCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class SliverResizingHeaderNodeCopyWith<
  $R,
  $In extends SliverResizingHeaderNode,
  $Out
>
    implements SCCopyWith<$R, $In, $Out> {
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child;
  @override
  $R call({SNode? child});
  SliverResizingHeaderNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SliverResizingHeaderNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SliverResizingHeaderNode, $Out>
    implements
        SliverResizingHeaderNodeCopyWith<$R, SliverResizingHeaderNode, $Out> {
  _SliverResizingHeaderNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SliverResizingHeaderNode> $mapper =
      SliverResizingHeaderNodeMapper.ensureInitialized();
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child =>
      $value.child?.copyWith.$chain((v) => call(child: v));
  @override
  $R call({Object? child = $none}) =>
      $apply(FieldCopyWithData({if (child != $none) #child: child}));
  @override
  SliverResizingHeaderNode $make(CopyWithData data) =>
      SliverResizingHeaderNode(child: data.get(#child, or: $value.child));

  @override
  SliverResizingHeaderNodeCopyWith<$R2, SliverResizingHeaderNode, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SliverResizingHeaderNodeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

