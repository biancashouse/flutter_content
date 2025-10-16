// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'positioned_node.dart';

class PositionedNodeMapper extends SubClassMapperBase<PositionedNode> {
  PositionedNodeMapper._();

  static PositionedNodeMapper? _instance;
  static PositionedNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PositionedNodeMapper._());
      SCMapper.ensureInitialized().addSubMapper(_instance!);
      SNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PositionedNode';

  static double? _$top(PositionedNode v) => v.top;
  static const Field<PositionedNode, double> _f$top = Field(
    'top',
    _$top,
    opt: true,
  );
  static double? _$left(PositionedNode v) => v.left;
  static const Field<PositionedNode, double> _f$left = Field(
    'left',
    _$left,
    opt: true,
  );
  static double? _$bottom(PositionedNode v) => v.bottom;
  static const Field<PositionedNode, double> _f$bottom = Field(
    'bottom',
    _$bottom,
    opt: true,
  );
  static double? _$right(PositionedNode v) => v.right;
  static const Field<PositionedNode, double> _f$right = Field(
    'right',
    _$right,
    opt: true,
  );
  static SNode? _$child(PositionedNode v) => v.child;
  static const Field<PositionedNode, SNode> _f$child = Field(
    'child',
    _$child,
    opt: true,
  );
  static String _$uid(PositionedNode v) => v.uid;
  static const Field<PositionedNode, String> _f$uid = Field(
    'uid',
    _$uid,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$treeNodeGK(PositionedNode v) =>
      v.treeNodeGK;
  static const Field<PositionedNode, GlobalKey<State<StatefulWidget>>>
  _f$treeNodeGK = Field('treeNodeGK', _$treeNodeGK, mode: FieldMode.member);
  static bool _$isExpanded(PositionedNode v) => v.isExpanded;
  static const Field<PositionedNode, bool> _f$isExpanded = Field(
    'isExpanded',
    _$isExpanded,
    mode: FieldMode.member,
  );
  static bool? _$hidePropertiesWhileDragging(PositionedNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<PositionedNode, bool> _f$hidePropertiesWhileDragging =
      Field(
        'hidePropertiesWhileDragging',
        _$hidePropertiesWhileDragging,
        mode: FieldMode.member,
      );
  static bool _$canShowTappableNodeWidgetOverlay(PositionedNode v) =>
      v.canShowTappableNodeWidgetOverlay;
  static const Field<PositionedNode, bool> _f$canShowTappableNodeWidgetOverlay =
      Field(
        'canShowTappableNodeWidgetOverlay',
        _$canShowTappableNodeWidgetOverlay,
        mode: FieldMode.member,
      );
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(PositionedNode v) =>
      v.nodeWidgetGK;
  static const Field<PositionedNode, GlobalKey<State<StatefulWidget>>>
  _f$nodeWidgetGK = Field(
    'nodeWidgetGK',
    _$nodeWidgetGK,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<PositionedNode> fields = const {
    #top: _f$top,
    #left: _f$left,
    #bottom: _f$bottom,
    #right: _f$right,
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
  final dynamic discriminatorValue = 'PositionedNode';
  @override
  late final ClassMapperBase superMapper = SCMapper.ensureInitialized();

  static PositionedNode _instantiate(DecodingData data) {
    return PositionedNode(
      top: data.dec(_f$top),
      left: data.dec(_f$left),
      bottom: data.dec(_f$bottom),
      right: data.dec(_f$right),
      child: data.dec(_f$child),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static PositionedNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PositionedNode>(map);
  }

  static PositionedNode fromJson(String json) {
    return ensureInitialized().decodeJson<PositionedNode>(json);
  }
}

mixin PositionedNodeMappable {
  String toJson() {
    return PositionedNodeMapper.ensureInitialized().encodeJson<PositionedNode>(
      this as PositionedNode,
    );
  }

  Map<String, dynamic> toMap() {
    return PositionedNodeMapper.ensureInitialized().encodeMap<PositionedNode>(
      this as PositionedNode,
    );
  }

  PositionedNodeCopyWith<PositionedNode, PositionedNode, PositionedNode>
  get copyWith => _PositionedNodeCopyWithImpl<PositionedNode, PositionedNode>(
    this as PositionedNode,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return PositionedNodeMapper.ensureInitialized().stringifyValue(
      this as PositionedNode,
    );
  }

  @override
  bool operator ==(Object other) {
    return PositionedNodeMapper.ensureInitialized().equalsValue(
      this as PositionedNode,
      other,
    );
  }

  @override
  int get hashCode {
    return PositionedNodeMapper.ensureInitialized().hashValue(
      this as PositionedNode,
    );
  }
}

extension PositionedNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PositionedNode, $Out> {
  PositionedNodeCopyWith<$R, PositionedNode, $Out> get $asPositionedNode =>
      $base.as((v, t, t2) => _PositionedNodeCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PositionedNodeCopyWith<$R, $In extends PositionedNode, $Out>
    implements SCCopyWith<$R, $In, $Out> {
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child;
  @override
  $R call({
    double? top,
    double? left,
    double? bottom,
    double? right,
    SNode? child,
  });
  PositionedNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _PositionedNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PositionedNode, $Out>
    implements PositionedNodeCopyWith<$R, PositionedNode, $Out> {
  _PositionedNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PositionedNode> $mapper =
      PositionedNodeMapper.ensureInitialized();
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child =>
      $value.child?.copyWith.$chain((v) => call(child: v));
  @override
  $R call({
    Object? top = $none,
    Object? left = $none,
    Object? bottom = $none,
    Object? right = $none,
    Object? child = $none,
  }) => $apply(
    FieldCopyWithData({
      if (top != $none) #top: top,
      if (left != $none) #left: left,
      if (bottom != $none) #bottom: bottom,
      if (right != $none) #right: right,
      if (child != $none) #child: child,
    }),
  );
  @override
  PositionedNode $make(CopyWithData data) => PositionedNode(
    top: data.get(#top, or: $value.top),
    left: data.get(#left, or: $value.left),
    bottom: data.get(#bottom, or: $value.bottom),
    right: data.get(#right, or: $value.right),
    child: data.get(#child, or: $value.child),
  );

  @override
  PositionedNodeCopyWith<$R2, PositionedNode, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _PositionedNodeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

