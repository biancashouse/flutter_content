// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'pinned_header_sliver_node.dart';

class PinnedHeaderSliverNodeMapper
    extends SubClassMapperBase<PinnedHeaderSliverNode> {
  PinnedHeaderSliverNodeMapper._();

  static PinnedHeaderSliverNodeMapper? _instance;
  static PinnedHeaderSliverNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PinnedHeaderSliverNodeMapper._());
      SCMapper.ensureInitialized().addSubMapper(_instance!);
      SNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PinnedHeaderSliverNode';

  static SNode? _$child(PinnedHeaderSliverNode v) => v.child;
  static const Field<PinnedHeaderSliverNode, SNode> _f$child = Field(
    'child',
    _$child,
    opt: true,
  );
  static String _$uid(PinnedHeaderSliverNode v) => v.uid;
  static const Field<PinnedHeaderSliverNode, String> _f$uid = Field(
    'uid',
    _$uid,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$treeNodeGK(
    PinnedHeaderSliverNode v,
  ) => v.treeNodeGK;
  static const Field<PinnedHeaderSliverNode, GlobalKey<State<StatefulWidget>>>
  _f$treeNodeGK = Field('treeNodeGK', _$treeNodeGK, mode: FieldMode.member);
  static bool _$isExpanded(PinnedHeaderSliverNode v) => v.isExpanded;
  static const Field<PinnedHeaderSliverNode, bool> _f$isExpanded = Field(
    'isExpanded',
    _$isExpanded,
    mode: FieldMode.member,
  );
  static bool? _$hidePropertiesWhileDragging(PinnedHeaderSliverNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<PinnedHeaderSliverNode, bool>
  _f$hidePropertiesWhileDragging = Field(
    'hidePropertiesWhileDragging',
    _$hidePropertiesWhileDragging,
    mode: FieldMode.member,
  );
  static bool _$canShowTappableNodeWidgetOverlay(PinnedHeaderSliverNode v) =>
      v.canShowTappableNodeWidgetOverlay;
  static const Field<PinnedHeaderSliverNode, bool>
  _f$canShowTappableNodeWidgetOverlay = Field(
    'canShowTappableNodeWidgetOverlay',
    _$canShowTappableNodeWidgetOverlay,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(
    PinnedHeaderSliverNode v,
  ) => v.nodeWidgetGK;
  static const Field<PinnedHeaderSliverNode, GlobalKey<State<StatefulWidget>>>
  _f$nodeWidgetGK = Field(
    'nodeWidgetGK',
    _$nodeWidgetGK,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<PinnedHeaderSliverNode> fields = const {
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
  final dynamic discriminatorValue = 'PinnedHeaderSliverNode';
  @override
  late final ClassMapperBase superMapper = SCMapper.ensureInitialized();

  static PinnedHeaderSliverNode _instantiate(DecodingData data) {
    return PinnedHeaderSliverNode(child: data.dec(_f$child));
  }

  @override
  final Function instantiate = _instantiate;

  static PinnedHeaderSliverNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PinnedHeaderSliverNode>(map);
  }

  static PinnedHeaderSliverNode fromJson(String json) {
    return ensureInitialized().decodeJson<PinnedHeaderSliverNode>(json);
  }
}

mixin PinnedHeaderSliverNodeMappable {
  String toJson() {
    return PinnedHeaderSliverNodeMapper.ensureInitialized()
        .encodeJson<PinnedHeaderSliverNode>(this as PinnedHeaderSliverNode);
  }

  Map<String, dynamic> toMap() {
    return PinnedHeaderSliverNodeMapper.ensureInitialized()
        .encodeMap<PinnedHeaderSliverNode>(this as PinnedHeaderSliverNode);
  }

  PinnedHeaderSliverNodeCopyWith<
    PinnedHeaderSliverNode,
    PinnedHeaderSliverNode,
    PinnedHeaderSliverNode
  >
  get copyWith =>
      _PinnedHeaderSliverNodeCopyWithImpl<
        PinnedHeaderSliverNode,
        PinnedHeaderSliverNode
      >(this as PinnedHeaderSliverNode, $identity, $identity);
  @override
  String toString() {
    return PinnedHeaderSliverNodeMapper.ensureInitialized().stringifyValue(
      this as PinnedHeaderSliverNode,
    );
  }

  @override
  bool operator ==(Object other) {
    return PinnedHeaderSliverNodeMapper.ensureInitialized().equalsValue(
      this as PinnedHeaderSliverNode,
      other,
    );
  }

  @override
  int get hashCode {
    return PinnedHeaderSliverNodeMapper.ensureInitialized().hashValue(
      this as PinnedHeaderSliverNode,
    );
  }
}

extension PinnedHeaderSliverNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PinnedHeaderSliverNode, $Out> {
  PinnedHeaderSliverNodeCopyWith<$R, PinnedHeaderSliverNode, $Out>
  get $asPinnedHeaderSliverNode => $base.as(
    (v, t, t2) => _PinnedHeaderSliverNodeCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class PinnedHeaderSliverNodeCopyWith<
  $R,
  $In extends PinnedHeaderSliverNode,
  $Out
>
    implements SCCopyWith<$R, $In, $Out> {
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child;
  @override
  $R call({SNode? child});
  PinnedHeaderSliverNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _PinnedHeaderSliverNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PinnedHeaderSliverNode, $Out>
    implements
        PinnedHeaderSliverNodeCopyWith<$R, PinnedHeaderSliverNode, $Out> {
  _PinnedHeaderSliverNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PinnedHeaderSliverNode> $mapper =
      PinnedHeaderSliverNodeMapper.ensureInitialized();
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child =>
      $value.child?.copyWith.$chain((v) => call(child: v));
  @override
  $R call({Object? child = $none}) =>
      $apply(FieldCopyWithData({if (child != $none) #child: child}));
  @override
  PinnedHeaderSliverNode $make(CopyWithData data) =>
      PinnedHeaderSliverNode(child: data.get(#child, or: $value.child));

  @override
  PinnedHeaderSliverNodeCopyWith<$R2, PinnedHeaderSliverNode, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _PinnedHeaderSliverNodeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

