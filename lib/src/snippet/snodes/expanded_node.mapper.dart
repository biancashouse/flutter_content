// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'expanded_node.dart';

class ExpandedNodeMapper extends SubClassMapperBase<ExpandedNode> {
  ExpandedNodeMapper._();

  static ExpandedNodeMapper? _instance;
  static ExpandedNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ExpandedNodeMapper._());
      SCMapper.ensureInitialized().addSubMapper(_instance!);
      STreeNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ExpandedNode';

  static int _$flex(ExpandedNode v) => v.flex;
  static const Field<ExpandedNode, int> _f$flex =
      Field('flex', _$flex, opt: true, def: 1);
  static STreeNode? _$child(ExpandedNode v) => v.child;
  static const Field<ExpandedNode, STreeNode> _f$child =
      Field('child', _$child, opt: true);
  static String _$uid(ExpandedNode v) => v.uid;
  static const Field<ExpandedNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static bool _$isExpanded(ExpandedNode v) => v.isExpanded;
  static const Field<ExpandedNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(ExpandedNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<ExpandedNode, bool> _f$hidePropertiesWhileDragging = Field(
      'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
      mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(ExpandedNode v) =>
      v.nodeWidgetGK;
  static const Field<ExpandedNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<ExpandedNode> fields = const {
    #flex: _f$flex,
    #child: _f$child,
    #uid: _f$uid,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'sc';
  @override
  final dynamic discriminatorValue = 'ExpandedNode';
  @override
  late final ClassMapperBase superMapper = SCMapper.ensureInitialized();

  static ExpandedNode _instantiate(DecodingData data) {
    return ExpandedNode(flex: data.dec(_f$flex), child: data.dec(_f$child));
  }

  @override
  final Function instantiate = _instantiate;

  static ExpandedNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ExpandedNode>(map);
  }

  static ExpandedNode fromJson(String json) {
    return ensureInitialized().decodeJson<ExpandedNode>(json);
  }
}

mixin ExpandedNodeMappable {
  String toJson() {
    return ExpandedNodeMapper.ensureInitialized()
        .encodeJson<ExpandedNode>(this as ExpandedNode);
  }

  Map<String, dynamic> toMap() {
    return ExpandedNodeMapper.ensureInitialized()
        .encodeMap<ExpandedNode>(this as ExpandedNode);
  }

  ExpandedNodeCopyWith<ExpandedNode, ExpandedNode, ExpandedNode> get copyWith =>
      _ExpandedNodeCopyWithImpl(this as ExpandedNode, $identity, $identity);
  @override
  String toString() {
    return ExpandedNodeMapper.ensureInitialized()
        .stringifyValue(this as ExpandedNode);
  }

  @override
  bool operator ==(Object other) {
    return ExpandedNodeMapper.ensureInitialized()
        .equalsValue(this as ExpandedNode, other);
  }

  @override
  int get hashCode {
    return ExpandedNodeMapper.ensureInitialized()
        .hashValue(this as ExpandedNode);
  }
}

extension ExpandedNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ExpandedNode, $Out> {
  ExpandedNodeCopyWith<$R, ExpandedNode, $Out> get $asExpandedNode =>
      $base.as((v, t, t2) => _ExpandedNodeCopyWithImpl(v, t, t2));
}

abstract class ExpandedNodeCopyWith<$R, $In extends ExpandedNode, $Out>
    implements SCCopyWith<$R, $In, $Out> {
  @override
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get child;
  @override
  $R call({int? flex, STreeNode? child});
  ExpandedNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ExpandedNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ExpandedNode, $Out>
    implements ExpandedNodeCopyWith<$R, ExpandedNode, $Out> {
  _ExpandedNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ExpandedNode> $mapper =
      ExpandedNodeMapper.ensureInitialized();
  @override
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get child =>
      $value.child?.copyWith.$chain((v) => call(child: v));
  @override
  $R call({int? flex, Object? child = $none}) => $apply(FieldCopyWithData(
      {if (flex != null) #flex: flex, if (child != $none) #child: child}));
  @override
  ExpandedNode $make(CopyWithData data) => ExpandedNode(
      flex: data.get(#flex, or: $value.flex),
      child: data.get(#child, or: $value.child));

  @override
  ExpandedNodeCopyWith<$R2, ExpandedNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ExpandedNodeCopyWithImpl($value, $cast, t);
}
