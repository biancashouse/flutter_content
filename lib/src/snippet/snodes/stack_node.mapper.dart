// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'stack_node.dart';

class StackNodeMapper extends SubClassMapperBase<StackNode> {
  StackNodeMapper._();

  static StackNodeMapper? _instance;
  static StackNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StackNodeMapper._());
      MCMapper.ensureInitialized().addSubMapper(_instance!);
      StackFitEnumMapper.ensureInitialized();
      ClipEnumMapper.ensureInitialized();
      AlignmentEnumMapper.ensureInitialized();
      STreeNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'StackNode';

  static StackFitEnum _$fit(StackNode v) => v.fit;
  static const Field<StackNode, StackFitEnum> _f$fit =
      Field('fit', _$fit, opt: true, def: StackFitEnum.loose);
  static ClipEnum _$clipBehavior(StackNode v) => v.clipBehavior;
  static const Field<StackNode, ClipEnum> _f$clipBehavior =
      Field('clipBehavior', _$clipBehavior, opt: true, def: ClipEnum.hardEdge);
  static AlignmentEnum _$alignment(StackNode v) => v.alignment;
  static const Field<StackNode, AlignmentEnum> _f$alignment =
      Field('alignment', _$alignment, opt: true, def: AlignmentEnum.topLeft);
  static List<STreeNode> _$children(StackNode v) => v.children;
  static const Field<StackNode, List<STreeNode>> _f$children =
      Field('children', _$children);
  static bool _$isExpanded(StackNode v) => v.isExpanded;
  static const Field<StackNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(StackNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<StackNode, bool> _f$hidePropertiesWhileDragging = Field(
      'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
      mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(StackNode v) =>
      v.nodeWidgetGK;
  static const Field<StackNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<StackNode> fields = const {
    #fit: _f$fit,
    #clipBehavior: _f$clipBehavior,
    #alignment: _f$alignment,
    #children: _f$children,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'mc';
  @override
  final dynamic discriminatorValue = 'StackNode';
  @override
  late final ClassMapperBase superMapper = MCMapper.ensureInitialized();

  static StackNode _instantiate(DecodingData data) {
    return StackNode(
        fit: data.dec(_f$fit),
        clipBehavior: data.dec(_f$clipBehavior),
        alignment: data.dec(_f$alignment),
        children: data.dec(_f$children));
  }

  @override
  final Function instantiate = _instantiate;

  static StackNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StackNode>(map);
  }

  static StackNode fromJson(String json) {
    return ensureInitialized().decodeJson<StackNode>(json);
  }
}

mixin StackNodeMappable {
  String toJson() {
    return StackNodeMapper.ensureInitialized()
        .encodeJson<StackNode>(this as StackNode);
  }

  Map<String, dynamic> toMap() {
    return StackNodeMapper.ensureInitialized()
        .encodeMap<StackNode>(this as StackNode);
  }

  StackNodeCopyWith<StackNode, StackNode, StackNode> get copyWith =>
      _StackNodeCopyWithImpl(this as StackNode, $identity, $identity);
  @override
  String toString() {
    return StackNodeMapper.ensureInitialized()
        .stringifyValue(this as StackNode);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            StackNodeMapper.ensureInitialized()
                .isValueEqual(this as StackNode, other));
  }

  @override
  int get hashCode {
    return StackNodeMapper.ensureInitialized().hashValue(this as StackNode);
  }
}

extension StackNodeValueCopy<$R, $Out> on ObjectCopyWith<$R, StackNode, $Out> {
  StackNodeCopyWith<$R, StackNode, $Out> get $asStackNode =>
      $base.as((v, t, t2) => _StackNodeCopyWithImpl(v, t, t2));
}

abstract class StackNodeCopyWith<$R, $In extends StackNode, $Out>
    implements MCCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, STreeNode, STreeNodeCopyWith<$R, STreeNode, STreeNode>>
      get children;
  @override
  $R call(
      {StackFitEnum? fit,
      ClipEnum? clipBehavior,
      AlignmentEnum? alignment,
      List<STreeNode>? children});
  StackNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _StackNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StackNode, $Out>
    implements StackNodeCopyWith<$R, StackNode, $Out> {
  _StackNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StackNode> $mapper =
      StackNodeMapper.ensureInitialized();
  @override
  ListCopyWith<$R, STreeNode, STreeNodeCopyWith<$R, STreeNode, STreeNode>>
      get children => ListCopyWith($value.children,
          (v, t) => v.copyWith.$chain(t), (v) => call(children: v));
  @override
  $R call(
          {StackFitEnum? fit,
          ClipEnum? clipBehavior,
          AlignmentEnum? alignment,
          List<STreeNode>? children}) =>
      $apply(FieldCopyWithData({
        if (fit != null) #fit: fit,
        if (clipBehavior != null) #clipBehavior: clipBehavior,
        if (alignment != null) #alignment: alignment,
        if (children != null) #children: children
      }));
  @override
  StackNode $make(CopyWithData data) => StackNode(
      fit: data.get(#fit, or: $value.fit),
      clipBehavior: data.get(#clipBehavior, or: $value.clipBehavior),
      alignment: data.get(#alignment, or: $value.alignment),
      children: data.get(#children, or: $value.children));

  @override
  StackNodeCopyWith<$R2, StackNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _StackNodeCopyWithImpl($value, $cast, t);
}
