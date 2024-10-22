// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'stepper_node.dart';

class StepperNodeMapper extends SubClassMapperBase<StepperNode> {
  StepperNodeMapper._();

  static StepperNodeMapper? _instance;
  static StepperNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StepperNodeMapper._());
      MCMapper.ensureInitialized().addSubMapper(_instance!);
      StepperTypeEnumMapper.ensureInitialized();
      STreeNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'StepperNode';

  static StepperTypeEnum _$type(StepperNode v) => v.type;
  static const Field<StepperNode, StepperTypeEnum> _f$type =
      Field('type', _$type, opt: true, def: StepperTypeEnum.vertical);
  static String? _$name(StepperNode v) => v.name;
  static const Field<StepperNode, String> _f$name =
      Field('name', _$name, opt: true);
  static List<STreeNode> _$children(StepperNode v) => v.children;
  static const Field<StepperNode, List<STreeNode>> _f$children =
      Field('children', _$children);
  static String _$uid(StepperNode v) => v.uid;
  static const Field<StepperNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static bool _$isExpanded(StepperNode v) => v.isExpanded;
  static const Field<StepperNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(StepperNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<StepperNode, bool> _f$hidePropertiesWhileDragging = Field(
      'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
      mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(StepperNode v) =>
      v.nodeWidgetGK;
  static const Field<StepperNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<StepperNode> fields = const {
    #type: _f$type,
    #name: _f$name,
    #children: _f$children,
    #uid: _f$uid,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'mc';
  @override
  final dynamic discriminatorValue = 'StepperNode';
  @override
  late final ClassMapperBase superMapper = MCMapper.ensureInitialized();

  static StepperNode _instantiate(DecodingData data) {
    return StepperNode(
        type: data.dec(_f$type),
        name: data.dec(_f$name),
        children: data.dec(_f$children));
  }

  @override
  final Function instantiate = _instantiate;

  static StepperNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StepperNode>(map);
  }

  static StepperNode fromJson(String json) {
    return ensureInitialized().decodeJson<StepperNode>(json);
  }
}

mixin StepperNodeMappable {
  String toJson() {
    return StepperNodeMapper.ensureInitialized()
        .encodeJson<StepperNode>(this as StepperNode);
  }

  Map<String, dynamic> toMap() {
    return StepperNodeMapper.ensureInitialized()
        .encodeMap<StepperNode>(this as StepperNode);
  }

  StepperNodeCopyWith<StepperNode, StepperNode, StepperNode> get copyWith =>
      _StepperNodeCopyWithImpl(this as StepperNode, $identity, $identity);
  @override
  String toString() {
    return StepperNodeMapper.ensureInitialized()
        .stringifyValue(this as StepperNode);
  }

  @override
  bool operator ==(Object other) {
    return StepperNodeMapper.ensureInitialized()
        .equalsValue(this as StepperNode, other);
  }

  @override
  int get hashCode {
    return StepperNodeMapper.ensureInitialized().hashValue(this as StepperNode);
  }
}

extension StepperNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StepperNode, $Out> {
  StepperNodeCopyWith<$R, StepperNode, $Out> get $asStepperNode =>
      $base.as((v, t, t2) => _StepperNodeCopyWithImpl(v, t, t2));
}

abstract class StepperNodeCopyWith<$R, $In extends StepperNode, $Out>
    implements MCCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, STreeNode, STreeNodeCopyWith<$R, STreeNode, STreeNode>>
      get children;
  @override
  $R call({StepperTypeEnum? type, String? name, List<STreeNode>? children});
  StepperNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _StepperNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StepperNode, $Out>
    implements StepperNodeCopyWith<$R, StepperNode, $Out> {
  _StepperNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StepperNode> $mapper =
      StepperNodeMapper.ensureInitialized();
  @override
  ListCopyWith<$R, STreeNode, STreeNodeCopyWith<$R, STreeNode, STreeNode>>
      get children => ListCopyWith($value.children,
          (v, t) => v.copyWith.$chain(t), (v) => call(children: v));
  @override
  $R call(
          {StepperTypeEnum? type,
          Object? name = $none,
          List<STreeNode>? children}) =>
      $apply(FieldCopyWithData({
        if (type != null) #type: type,
        if (name != $none) #name: name,
        if (children != null) #children: children
      }));
  @override
  StepperNode $make(CopyWithData data) => StepperNode(
      type: data.get(#type, or: $value.type),
      name: data.get(#name, or: $value.name),
      children: data.get(#children, or: $value.children));

  @override
  StepperNodeCopyWith<$R2, StepperNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _StepperNodeCopyWithImpl($value, $cast, t);
}
