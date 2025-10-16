// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'sliver_floating_header_node.dart';

class SliverFloatingHeaderNodeMapper
    extends SubClassMapperBase<SliverFloatingHeaderNode> {
  SliverFloatingHeaderNodeMapper._();

  static SliverFloatingHeaderNodeMapper? _instance;
  static SliverFloatingHeaderNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = SliverFloatingHeaderNodeMapper._(),
      );
      SCMapper.ensureInitialized().addSubMapper(_instance!);
      SNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SliverFloatingHeaderNode';

  static SNode? _$child(SliverFloatingHeaderNode v) => v.child;
  static const Field<SliverFloatingHeaderNode, SNode> _f$child = Field(
    'child',
    _$child,
    opt: true,
  );
  static String _$uid(SliverFloatingHeaderNode v) => v.uid;
  static const Field<SliverFloatingHeaderNode, String> _f$uid = Field(
    'uid',
    _$uid,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$treeNodeGK(
    SliverFloatingHeaderNode v,
  ) => v.treeNodeGK;
  static const Field<SliverFloatingHeaderNode, GlobalKey<State<StatefulWidget>>>
  _f$treeNodeGK = Field('treeNodeGK', _$treeNodeGK, mode: FieldMode.member);
  static bool _$isExpanded(SliverFloatingHeaderNode v) => v.isExpanded;
  static const Field<SliverFloatingHeaderNode, bool> _f$isExpanded = Field(
    'isExpanded',
    _$isExpanded,
    mode: FieldMode.member,
  );
  static bool? _$hidePropertiesWhileDragging(SliverFloatingHeaderNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<SliverFloatingHeaderNode, bool>
  _f$hidePropertiesWhileDragging = Field(
    'hidePropertiesWhileDragging',
    _$hidePropertiesWhileDragging,
    mode: FieldMode.member,
  );
  static bool _$canShowTappableNodeWidgetOverlay(SliverFloatingHeaderNode v) =>
      v.canShowTappableNodeWidgetOverlay;
  static const Field<SliverFloatingHeaderNode, bool>
  _f$canShowTappableNodeWidgetOverlay = Field(
    'canShowTappableNodeWidgetOverlay',
    _$canShowTappableNodeWidgetOverlay,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(
    SliverFloatingHeaderNode v,
  ) => v.nodeWidgetGK;
  static const Field<SliverFloatingHeaderNode, GlobalKey<State<StatefulWidget>>>
  _f$nodeWidgetGK = Field(
    'nodeWidgetGK',
    _$nodeWidgetGK,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<SliverFloatingHeaderNode> fields = const {
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
  final dynamic discriminatorValue = 'SliverFloatingHeaderNode';
  @override
  late final ClassMapperBase superMapper = SCMapper.ensureInitialized();

  static SliverFloatingHeaderNode _instantiate(DecodingData data) {
    return SliverFloatingHeaderNode(child: data.dec(_f$child));
  }

  @override
  final Function instantiate = _instantiate;

  static SliverFloatingHeaderNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SliverFloatingHeaderNode>(map);
  }

  static SliverFloatingHeaderNode fromJson(String json) {
    return ensureInitialized().decodeJson<SliverFloatingHeaderNode>(json);
  }
}

mixin SliverFloatingHeaderNodeMappable {
  String toJson() {
    return SliverFloatingHeaderNodeMapper.ensureInitialized()
        .encodeJson<SliverFloatingHeaderNode>(this as SliverFloatingHeaderNode);
  }

  Map<String, dynamic> toMap() {
    return SliverFloatingHeaderNodeMapper.ensureInitialized()
        .encodeMap<SliverFloatingHeaderNode>(this as SliverFloatingHeaderNode);
  }

  SliverFloatingHeaderNodeCopyWith<
    SliverFloatingHeaderNode,
    SliverFloatingHeaderNode,
    SliverFloatingHeaderNode
  >
  get copyWith =>
      _SliverFloatingHeaderNodeCopyWithImpl<
        SliverFloatingHeaderNode,
        SliverFloatingHeaderNode
      >(this as SliverFloatingHeaderNode, $identity, $identity);
  @override
  String toString() {
    return SliverFloatingHeaderNodeMapper.ensureInitialized().stringifyValue(
      this as SliverFloatingHeaderNode,
    );
  }

  @override
  bool operator ==(Object other) {
    return SliverFloatingHeaderNodeMapper.ensureInitialized().equalsValue(
      this as SliverFloatingHeaderNode,
      other,
    );
  }

  @override
  int get hashCode {
    return SliverFloatingHeaderNodeMapper.ensureInitialized().hashValue(
      this as SliverFloatingHeaderNode,
    );
  }
}

extension SliverFloatingHeaderNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SliverFloatingHeaderNode, $Out> {
  SliverFloatingHeaderNodeCopyWith<$R, SliverFloatingHeaderNode, $Out>
  get $asSliverFloatingHeaderNode => $base.as(
    (v, t, t2) => _SliverFloatingHeaderNodeCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class SliverFloatingHeaderNodeCopyWith<
  $R,
  $In extends SliverFloatingHeaderNode,
  $Out
>
    implements SCCopyWith<$R, $In, $Out> {
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child;
  @override
  $R call({SNode? child});
  SliverFloatingHeaderNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SliverFloatingHeaderNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SliverFloatingHeaderNode, $Out>
    implements
        SliverFloatingHeaderNodeCopyWith<$R, SliverFloatingHeaderNode, $Out> {
  _SliverFloatingHeaderNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SliverFloatingHeaderNode> $mapper =
      SliverFloatingHeaderNodeMapper.ensureInitialized();
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child =>
      $value.child?.copyWith.$chain((v) => call(child: v));
  @override
  $R call({Object? child = $none}) =>
      $apply(FieldCopyWithData({if (child != $none) #child: child}));
  @override
  SliverFloatingHeaderNode $make(CopyWithData data) =>
      SliverFloatingHeaderNode(child: data.get(#child, or: $value.child));

  @override
  SliverFloatingHeaderNodeCopyWith<$R2, SliverFloatingHeaderNode, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SliverFloatingHeaderNodeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

