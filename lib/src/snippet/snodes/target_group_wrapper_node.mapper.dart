// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'target_group_wrapper_node.dart';

class TargetGroupWrapperNodeMapper
    extends SubClassMapperBase<TargetGroupWrapperNode> {
  TargetGroupWrapperNodeMapper._();

  static TargetGroupWrapperNodeMapper? _instance;
  static TargetGroupWrapperNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TargetGroupWrapperNodeMapper._());
      SCMapper.ensureInitialized().addSubMapper(_instance!);
      STreeNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TargetGroupWrapperNode';

  static String _$name(TargetGroupWrapperNode v) => v.name;
  static const Field<TargetGroupWrapperNode, String> _f$name =
      Field('name', _$name);
  static STreeNode? _$child(TargetGroupWrapperNode v) => v.child;
  static const Field<TargetGroupWrapperNode, STreeNode> _f$child =
      Field('child', _$child, opt: true);
  static bool _$isExpanded(TargetGroupWrapperNode v) => v.isExpanded;
  static const Field<TargetGroupWrapperNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static PTreeNodeTreeController? _$pTreeC(TargetGroupWrapperNode v) =>
      v.pTreeC;
  static const Field<TargetGroupWrapperNode, PTreeNodeTreeController>
      _f$pTreeC = Field('pTreeC', _$pTreeC, mode: FieldMode.member);
  static double? _$propertiesPaneScrollPos(TargetGroupWrapperNode v) =>
      v.propertiesPaneScrollPos;
  static const Field<TargetGroupWrapperNode, double>
      _f$propertiesPaneScrollPos = Field(
          'propertiesPaneScrollPos', _$propertiesPaneScrollPos,
          mode: FieldMode.member);
  static ScrollController? _$propertiesPaneSC(TargetGroupWrapperNode v) =>
      v.propertiesPaneSC;
  static const Field<TargetGroupWrapperNode, ScrollController>
      _f$propertiesPaneSC =
      Field('propertiesPaneSC', _$propertiesPaneSC, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(TargetGroupWrapperNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<TargetGroupWrapperNode, bool>
      _f$hidePropertiesWhileDragging = Field(
          'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
          mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(
          TargetGroupWrapperNode v) =>
      v.nodeWidgetGK;
  static const Field<TargetGroupWrapperNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<TargetGroupWrapperNode> fields = const {
    #name: _f$name,
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
  final dynamic discriminatorValue = 'TargetGroupWrapperNode';
  @override
  late final ClassMapperBase superMapper = SCMapper.ensureInitialized();

  static TargetGroupWrapperNode _instantiate(DecodingData data) {
    return TargetGroupWrapperNode(
        name: data.dec(_f$name), child: data.dec(_f$child));
  }

  @override
  final Function instantiate = _instantiate;

  static TargetGroupWrapperNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TargetGroupWrapperNode>(map);
  }

  static TargetGroupWrapperNode fromJson(String json) {
    return ensureInitialized().decodeJson<TargetGroupWrapperNode>(json);
  }
}

mixin TargetGroupWrapperNodeMappable {
  String toJson() {
    return TargetGroupWrapperNodeMapper.ensureInitialized()
        .encodeJson<TargetGroupWrapperNode>(this as TargetGroupWrapperNode);
  }

  Map<String, dynamic> toMap() {
    return TargetGroupWrapperNodeMapper.ensureInitialized()
        .encodeMap<TargetGroupWrapperNode>(this as TargetGroupWrapperNode);
  }

  TargetGroupWrapperNodeCopyWith<TargetGroupWrapperNode, TargetGroupWrapperNode,
          TargetGroupWrapperNode>
      get copyWith => _TargetGroupWrapperNodeCopyWithImpl(
          this as TargetGroupWrapperNode, $identity, $identity);
  @override
  String toString() {
    return TargetGroupWrapperNodeMapper.ensureInitialized()
        .stringifyValue(this as TargetGroupWrapperNode);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            TargetGroupWrapperNodeMapper.ensureInitialized()
                .isValueEqual(this as TargetGroupWrapperNode, other));
  }

  @override
  int get hashCode {
    return TargetGroupWrapperNodeMapper.ensureInitialized()
        .hashValue(this as TargetGroupWrapperNode);
  }
}

extension TargetGroupWrapperNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TargetGroupWrapperNode, $Out> {
  TargetGroupWrapperNodeCopyWith<$R, TargetGroupWrapperNode, $Out>
      get $asTargetGroupWrapperNode =>
          $base.as((v, t, t2) => _TargetGroupWrapperNodeCopyWithImpl(v, t, t2));
}

abstract class TargetGroupWrapperNodeCopyWith<
    $R,
    $In extends TargetGroupWrapperNode,
    $Out> implements SCCopyWith<$R, $In, $Out> {
  @override
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get child;
  @override
  $R call({String? name, STreeNode? child});
  TargetGroupWrapperNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TargetGroupWrapperNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TargetGroupWrapperNode, $Out>
    implements
        TargetGroupWrapperNodeCopyWith<$R, TargetGroupWrapperNode, $Out> {
  _TargetGroupWrapperNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TargetGroupWrapperNode> $mapper =
      TargetGroupWrapperNodeMapper.ensureInitialized();
  @override
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get child =>
      $value.child?.copyWith.$chain((v) => call(child: v));
  @override
  $R call({String? name, Object? child = $none}) => $apply(FieldCopyWithData(
      {if (name != null) #name: name, if (child != $none) #child: child}));
  @override
  TargetGroupWrapperNode $make(CopyWithData data) => TargetGroupWrapperNode(
      name: data.get(#name, or: $value.name),
      child: data.get(#child, or: $value.child));

  @override
  TargetGroupWrapperNodeCopyWith<$R2, TargetGroupWrapperNode, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _TargetGroupWrapperNodeCopyWithImpl($value, $cast, t);
}
