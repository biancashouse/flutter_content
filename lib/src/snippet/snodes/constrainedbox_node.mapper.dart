// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'constrainedbox_node.dart';

class ConstrainedBoxNodeMapper extends SubClassMapperBase<ConstrainedBoxNode> {
  ConstrainedBoxNodeMapper._();

  static ConstrainedBoxNodeMapper? _instance;
  static ConstrainedBoxNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ConstrainedBoxNodeMapper._());
      SCMapper.ensureInitialized().addSubMapper(_instance!);
      SNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ConstrainedBoxNode';

  static double? _$minWidth(ConstrainedBoxNode v) => v.minWidth;
  static const Field<ConstrainedBoxNode, double> _f$minWidth = Field(
    'minWidth',
    _$minWidth,
    opt: true,
  );
  static double? _$minHeight(ConstrainedBoxNode v) => v.minHeight;
  static const Field<ConstrainedBoxNode, double> _f$minHeight = Field(
    'minHeight',
    _$minHeight,
    opt: true,
  );
  static double? _$maxWidth(ConstrainedBoxNode v) => v.maxWidth;
  static const Field<ConstrainedBoxNode, double> _f$maxWidth = Field(
    'maxWidth',
    _$maxWidth,
    opt: true,
  );
  static double? _$maxHeight(ConstrainedBoxNode v) => v.maxHeight;
  static const Field<ConstrainedBoxNode, double> _f$maxHeight = Field(
    'maxHeight',
    _$maxHeight,
    opt: true,
  );
  static SNode? _$child(ConstrainedBoxNode v) => v.child;
  static const Field<ConstrainedBoxNode, SNode> _f$child = Field(
    'child',
    _$child,
    opt: true,
  );
  static String _$uid(ConstrainedBoxNode v) => v.uid;
  static const Field<ConstrainedBoxNode, String> _f$uid = Field(
    'uid',
    _$uid,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$treeNodeGK(ConstrainedBoxNode v) =>
      v.treeNodeGK;
  static const Field<ConstrainedBoxNode, GlobalKey<State<StatefulWidget>>>
  _f$treeNodeGK = Field('treeNodeGK', _$treeNodeGK, mode: FieldMode.member);
  static bool _$isExpanded(ConstrainedBoxNode v) => v.isExpanded;
  static const Field<ConstrainedBoxNode, bool> _f$isExpanded = Field(
    'isExpanded',
    _$isExpanded,
    mode: FieldMode.member,
  );
  static bool? _$hidePropertiesWhileDragging(ConstrainedBoxNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<ConstrainedBoxNode, bool> _f$hidePropertiesWhileDragging =
      Field(
        'hidePropertiesWhileDragging',
        _$hidePropertiesWhileDragging,
        mode: FieldMode.member,
      );
  static bool _$canShowTappableNodeWidgetOverlay(ConstrainedBoxNode v) =>
      v.canShowTappableNodeWidgetOverlay;
  static const Field<ConstrainedBoxNode, bool>
  _f$canShowTappableNodeWidgetOverlay = Field(
    'canShowTappableNodeWidgetOverlay',
    _$canShowTappableNodeWidgetOverlay,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(
    ConstrainedBoxNode v,
  ) => v.nodeWidgetGK;
  static const Field<ConstrainedBoxNode, GlobalKey<State<StatefulWidget>>>
  _f$nodeWidgetGK = Field(
    'nodeWidgetGK',
    _$nodeWidgetGK,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<ConstrainedBoxNode> fields = const {
    #minWidth: _f$minWidth,
    #minHeight: _f$minHeight,
    #maxWidth: _f$maxWidth,
    #maxHeight: _f$maxHeight,
    #child: _f$child,
    #uid: _f$uid,
    #treeNodeGK: _f$treeNodeGK,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #canShowTappableNodeWidgetOverlay: _f$canShowTappableNodeWidgetOverlay,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'DK:sc';
  @override
  final dynamic discriminatorValue = 'ConstrainedBoxNode';
  @override
  late final ClassMapperBase superMapper = SCMapper.ensureInitialized();

  @override
  final MappingHook superHook = ChainedHook([
    PropertyRenameHook('sc', 'DK:sc'),
    PropertyRenameHook('snode', 'DK:snode'),
  ]);

  static ConstrainedBoxNode _instantiate(DecodingData data) {
    return ConstrainedBoxNode(
      minWidth: data.dec(_f$minWidth),
      minHeight: data.dec(_f$minHeight),
      maxWidth: data.dec(_f$maxWidth),
      maxHeight: data.dec(_f$maxHeight),
      child: data.dec(_f$child),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ConstrainedBoxNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ConstrainedBoxNode>(map);
  }

  static ConstrainedBoxNode fromJson(String json) {
    return ensureInitialized().decodeJson<ConstrainedBoxNode>(json);
  }
}

mixin ConstrainedBoxNodeMappable {
  String toJson() {
    return ConstrainedBoxNodeMapper.ensureInitialized()
        .encodeJson<ConstrainedBoxNode>(this as ConstrainedBoxNode);
  }

  Map<String, dynamic> toMap() {
    return ConstrainedBoxNodeMapper.ensureInitialized()
        .encodeMap<ConstrainedBoxNode>(this as ConstrainedBoxNode);
  }

  ConstrainedBoxNodeCopyWith<
    ConstrainedBoxNode,
    ConstrainedBoxNode,
    ConstrainedBoxNode
  >
  get copyWith =>
      _ConstrainedBoxNodeCopyWithImpl<ConstrainedBoxNode, ConstrainedBoxNode>(
        this as ConstrainedBoxNode,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ConstrainedBoxNodeMapper.ensureInitialized().stringifyValue(
      this as ConstrainedBoxNode,
    );
  }

  @override
  bool operator ==(Object other) {
    return ConstrainedBoxNodeMapper.ensureInitialized().equalsValue(
      this as ConstrainedBoxNode,
      other,
    );
  }

  @override
  int get hashCode {
    return ConstrainedBoxNodeMapper.ensureInitialized().hashValue(
      this as ConstrainedBoxNode,
    );
  }
}

extension ConstrainedBoxNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ConstrainedBoxNode, $Out> {
  ConstrainedBoxNodeCopyWith<$R, ConstrainedBoxNode, $Out>
  get $asConstrainedBoxNode => $base.as(
    (v, t, t2) => _ConstrainedBoxNodeCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ConstrainedBoxNodeCopyWith<
  $R,
  $In extends ConstrainedBoxNode,
  $Out
>
    implements SCCopyWith<$R, $In, $Out> {
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child;
  @override
  $R call({
    double? minWidth,
    double? minHeight,
    double? maxWidth,
    double? maxHeight,
    SNode? child,
  });
  ConstrainedBoxNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ConstrainedBoxNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ConstrainedBoxNode, $Out>
    implements ConstrainedBoxNodeCopyWith<$R, ConstrainedBoxNode, $Out> {
  _ConstrainedBoxNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ConstrainedBoxNode> $mapper =
      ConstrainedBoxNodeMapper.ensureInitialized();
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child =>
      $value.child?.copyWith.$chain((v) => call(child: v));
  @override
  $R call({
    Object? minWidth = $none,
    Object? minHeight = $none,
    Object? maxWidth = $none,
    Object? maxHeight = $none,
    Object? child = $none,
  }) => $apply(
    FieldCopyWithData({
      if (minWidth != $none) #minWidth: minWidth,
      if (minHeight != $none) #minHeight: minHeight,
      if (maxWidth != $none) #maxWidth: maxWidth,
      if (maxHeight != $none) #maxHeight: maxHeight,
      if (child != $none) #child: child,
    }),
  );
  @override
  ConstrainedBoxNode $make(CopyWithData data) => ConstrainedBoxNode(
    minWidth: data.get(#minWidth, or: $value.minWidth),
    minHeight: data.get(#minHeight, or: $value.minHeight),
    maxWidth: data.get(#maxWidth, or: $value.maxWidth),
    maxHeight: data.get(#maxHeight, or: $value.maxHeight),
    child: data.get(#child, or: $value.child),
  );

  @override
  ConstrainedBoxNodeCopyWith<$R2, ConstrainedBoxNode, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ConstrainedBoxNodeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

