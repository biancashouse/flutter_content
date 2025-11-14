// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'interactiveviewer_node.dart';

class InteractiveViewerNodeMapper
    extends SubClassMapperBase<InteractiveViewerNode> {
  InteractiveViewerNodeMapper._();

  static InteractiveViewerNodeMapper? _instance;
  static InteractiveViewerNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = InteractiveViewerNodeMapper._());
      SCMapper.ensureInitialized().addSubMapper(_instance!);
      SNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'InteractiveViewerNode';

  static SNode? _$child(InteractiveViewerNode v) => v.child;
  static const Field<InteractiveViewerNode, SNode> _f$child = Field(
    'child',
    _$child,
    opt: true,
  );
  static double? _$maxScale(InteractiveViewerNode v) => v.maxScale;
  static const Field<InteractiveViewerNode, double> _f$maxScale = Field(
    'maxScale',
    _$maxScale,
    opt: true,
  );
  static double? _$minScale(InteractiveViewerNode v) => v.minScale;
  static const Field<InteractiveViewerNode, double> _f$minScale = Field(
    'minScale',
    _$minScale,
    opt: true,
  );
  static bool? _$scaleEnabled(InteractiveViewerNode v) => v.scaleEnabled;
  static const Field<InteractiveViewerNode, bool> _f$scaleEnabled = Field(
    'scaleEnabled',
    _$scaleEnabled,
    opt: true,
  );
  static String _$uid(InteractiveViewerNode v) => v.uid;
  static const Field<InteractiveViewerNode, String> _f$uid = Field(
    'uid',
    _$uid,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$treeNodeGK(
    InteractiveViewerNode v,
  ) => v.treeNodeGK;
  static const Field<InteractiveViewerNode, GlobalKey<State<StatefulWidget>>>
  _f$treeNodeGK = Field('treeNodeGK', _$treeNodeGK, mode: FieldMode.member);
  static bool _$isExpanded(InteractiveViewerNode v) => v.isExpanded;
  static const Field<InteractiveViewerNode, bool> _f$isExpanded = Field(
    'isExpanded',
    _$isExpanded,
    mode: FieldMode.member,
  );
  static bool? _$hidePropertiesWhileDragging(InteractiveViewerNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<InteractiveViewerNode, bool>
  _f$hidePropertiesWhileDragging = Field(
    'hidePropertiesWhileDragging',
    _$hidePropertiesWhileDragging,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$nodeGK(InteractiveViewerNode v) =>
      v.nodeGK;
  static const Field<InteractiveViewerNode, GlobalKey<State<StatefulWidget>>>
  _f$nodeGK = Field('nodeGK', _$nodeGK, mode: FieldMode.member);
  static bool _$canShowTappableNodeWidgetOverlay(InteractiveViewerNode v) =>
      v.canShowTappableNodeWidgetOverlay;
  static const Field<InteractiveViewerNode, bool>
  _f$canShowTappableNodeWidgetOverlay = Field(
    'canShowTappableNodeWidgetOverlay',
    _$canShowTappableNodeWidgetOverlay,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(
    InteractiveViewerNode v,
  ) => v.nodeWidgetGK;
  static const Field<InteractiveViewerNode, GlobalKey<State<StatefulWidget>>>
  _f$nodeWidgetGK = Field(
    'nodeWidgetGK',
    _$nodeWidgetGK,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<InteractiveViewerNode> fields = const {
    #child: _f$child,
    #maxScale: _f$maxScale,
    #minScale: _f$minScale,
    #scaleEnabled: _f$scaleEnabled,
    #uid: _f$uid,
    #treeNodeGK: _f$treeNodeGK,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeGK: _f$nodeGK,
    #canShowTappableNodeWidgetOverlay: _f$canShowTappableNodeWidgetOverlay,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'DK:sc';
  @override
  final dynamic discriminatorValue = 'InteractiveViewerNode';
  @override
  late final ClassMapperBase superMapper = SCMapper.ensureInitialized();

  @override
  final MappingHook superHook = ChainedHook([
    PropertyRenameHook('sc', 'DK:sc'),
    PropertyRenameHook('snode', 'DK:snode'),
  ]);

  static InteractiveViewerNode _instantiate(DecodingData data) {
    return InteractiveViewerNode(
      child: data.dec(_f$child),
      maxScale: data.dec(_f$maxScale),
      minScale: data.dec(_f$minScale),
      scaleEnabled: data.dec(_f$scaleEnabled),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static InteractiveViewerNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<InteractiveViewerNode>(map);
  }

  static InteractiveViewerNode fromJson(String json) {
    return ensureInitialized().decodeJson<InteractiveViewerNode>(json);
  }
}

mixin InteractiveViewerNodeMappable {
  String toJson() {
    return InteractiveViewerNodeMapper.ensureInitialized()
        .encodeJson<InteractiveViewerNode>(this as InteractiveViewerNode);
  }

  Map<String, dynamic> toMap() {
    return InteractiveViewerNodeMapper.ensureInitialized()
        .encodeMap<InteractiveViewerNode>(this as InteractiveViewerNode);
  }

  InteractiveViewerNodeCopyWith<
    InteractiveViewerNode,
    InteractiveViewerNode,
    InteractiveViewerNode
  >
  get copyWith =>
      _InteractiveViewerNodeCopyWithImpl<
        InteractiveViewerNode,
        InteractiveViewerNode
      >(this as InteractiveViewerNode, $identity, $identity);
  @override
  String toString() {
    return InteractiveViewerNodeMapper.ensureInitialized().stringifyValue(
      this as InteractiveViewerNode,
    );
  }

  @override
  bool operator ==(Object other) {
    return InteractiveViewerNodeMapper.ensureInitialized().equalsValue(
      this as InteractiveViewerNode,
      other,
    );
  }

  @override
  int get hashCode {
    return InteractiveViewerNodeMapper.ensureInitialized().hashValue(
      this as InteractiveViewerNode,
    );
  }
}

extension InteractiveViewerNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, InteractiveViewerNode, $Out> {
  InteractiveViewerNodeCopyWith<$R, InteractiveViewerNode, $Out>
  get $asInteractiveViewerNode => $base.as(
    (v, t, t2) => _InteractiveViewerNodeCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class InteractiveViewerNodeCopyWith<
  $R,
  $In extends InteractiveViewerNode,
  $Out
>
    implements SCCopyWith<$R, $In, $Out> {
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child;
  @override
  $R call({
    SNode? child,
    double? maxScale,
    double? minScale,
    bool? scaleEnabled,
  });
  InteractiveViewerNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _InteractiveViewerNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, InteractiveViewerNode, $Out>
    implements InteractiveViewerNodeCopyWith<$R, InteractiveViewerNode, $Out> {
  _InteractiveViewerNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<InteractiveViewerNode> $mapper =
      InteractiveViewerNodeMapper.ensureInitialized();
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child =>
      $value.child?.copyWith.$chain((v) => call(child: v));
  @override
  $R call({
    Object? child = $none,
    Object? maxScale = $none,
    Object? minScale = $none,
    Object? scaleEnabled = $none,
  }) => $apply(
    FieldCopyWithData({
      if (child != $none) #child: child,
      if (maxScale != $none) #maxScale: maxScale,
      if (minScale != $none) #minScale: minScale,
      if (scaleEnabled != $none) #scaleEnabled: scaleEnabled,
    }),
  );
  @override
  InteractiveViewerNode $make(CopyWithData data) => InteractiveViewerNode(
    child: data.get(#child, or: $value.child),
    maxScale: data.get(#maxScale, or: $value.maxScale),
    minScale: data.get(#minScale, or: $value.minScale),
    scaleEnabled: data.get(#scaleEnabled, or: $value.scaleEnabled),
  );

  @override
  InteractiveViewerNodeCopyWith<$R2, InteractiveViewerNode, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _InteractiveViewerNodeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

