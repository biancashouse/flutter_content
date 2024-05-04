// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'flexible_node.dart';

class FlexibleNodeMapper extends SubClassMapperBase<FlexibleNode> {
  FlexibleNodeMapper._();

  static FlexibleNodeMapper? _instance;
  static FlexibleNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FlexibleNodeMapper._());
      SCMapper.ensureInitialized().addSubMapper(_instance!);
      FlexFitEnumMapper.ensureInitialized();
      STreeNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'FlexibleNode';

  static int _$flex(FlexibleNode v) => v.flex;
  static const Field<FlexibleNode, int> _f$flex =
      Field('flex', _$flex, opt: true, def: 1);
  static FlexFitEnum _$fit(FlexibleNode v) => v.fit;
  static const Field<FlexibleNode, FlexFitEnum> _f$fit =
      Field('fit', _$fit, opt: true, def: FlexFitEnum.loose);
  static STreeNode? _$child(FlexibleNode v) => v.child;
  static const Field<FlexibleNode, STreeNode> _f$child =
      Field('child', _$child, opt: true);
  static String _$uid(FlexibleNode v) => v.uid;
  static const Field<FlexibleNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static bool _$isExpanded(FlexibleNode v) => v.isExpanded;
  static const Field<FlexibleNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(FlexibleNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<FlexibleNode, bool> _f$hidePropertiesWhileDragging = Field(
      'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
      mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(FlexibleNode v) =>
      v.nodeWidgetGK;
  static const Field<FlexibleNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<FlexibleNode> fields = const {
    #flex: _f$flex,
    #fit: _f$fit,
    #child: _f$child,
    #uid: _f$uid,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'sc';
  @override
  final dynamic discriminatorValue = 'FlexibleNode';
  @override
  late final ClassMapperBase superMapper = SCMapper.ensureInitialized();

  static FlexibleNode _instantiate(DecodingData data) {
    return FlexibleNode(
        flex: data.dec(_f$flex),
        fit: data.dec(_f$fit),
        child: data.dec(_f$child));
  }

  @override
  final Function instantiate = _instantiate;

  static FlexibleNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FlexibleNode>(map);
  }

  static FlexibleNode fromJson(String json) {
    return ensureInitialized().decodeJson<FlexibleNode>(json);
  }
}

mixin FlexibleNodeMappable {
  String toJson() {
    return FlexibleNodeMapper.ensureInitialized()
        .encodeJson<FlexibleNode>(this as FlexibleNode);
  }

  Map<String, dynamic> toMap() {
    return FlexibleNodeMapper.ensureInitialized()
        .encodeMap<FlexibleNode>(this as FlexibleNode);
  }

  FlexibleNodeCopyWith<FlexibleNode, FlexibleNode, FlexibleNode> get copyWith =>
      _FlexibleNodeCopyWithImpl(this as FlexibleNode, $identity, $identity);
  @override
  String toString() {
    return FlexibleNodeMapper.ensureInitialized()
        .stringifyValue(this as FlexibleNode);
  }

  @override
  bool operator ==(Object other) {
    return FlexibleNodeMapper.ensureInitialized()
        .equalsValue(this as FlexibleNode, other);
  }

  @override
  int get hashCode {
    return FlexibleNodeMapper.ensureInitialized()
        .hashValue(this as FlexibleNode);
  }
}

extension FlexibleNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FlexibleNode, $Out> {
  FlexibleNodeCopyWith<$R, FlexibleNode, $Out> get $asFlexibleNode =>
      $base.as((v, t, t2) => _FlexibleNodeCopyWithImpl(v, t, t2));
}

abstract class FlexibleNodeCopyWith<$R, $In extends FlexibleNode, $Out>
    implements SCCopyWith<$R, $In, $Out> {
  @override
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get child;
  @override
  $R call({int? flex, FlexFitEnum? fit, STreeNode? child});
  FlexibleNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _FlexibleNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FlexibleNode, $Out>
    implements FlexibleNodeCopyWith<$R, FlexibleNode, $Out> {
  _FlexibleNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FlexibleNode> $mapper =
      FlexibleNodeMapper.ensureInitialized();
  @override
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get child =>
      $value.child?.copyWith.$chain((v) => call(child: v));
  @override
  $R call({int? flex, FlexFitEnum? fit, Object? child = $none}) =>
      $apply(FieldCopyWithData({
        if (flex != null) #flex: flex,
        if (fit != null) #fit: fit,
        if (child != $none) #child: child
      }));
  @override
  FlexibleNode $make(CopyWithData data) => FlexibleNode(
      flex: data.get(#flex, or: $value.flex),
      fit: data.get(#fit, or: $value.fit),
      child: data.get(#child, or: $value.child));

  @override
  FlexibleNodeCopyWith<$R2, FlexibleNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _FlexibleNodeCopyWithImpl($value, $cast, t);
}
