// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'align_node.dart';

class AlignNodeMapper extends SubClassMapperBase<AlignNode> {
  AlignNodeMapper._();

  static AlignNodeMapper? _instance;
  static AlignNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AlignNodeMapper._());
      SCMapper.ensureInitialized().addSubMapper(_instance!);
      AlignmentEnumMapper.ensureInitialized();
      STreeNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AlignNode';

  static AlignmentEnum _$alignment(AlignNode v) => v.alignment;
  static const Field<AlignNode, AlignmentEnum> _f$alignment =
      Field('alignment', _$alignment);
  static STreeNode? _$child(AlignNode v) => v.child;
  static const Field<AlignNode, STreeNode> _f$child =
      Field('child', _$child, opt: true);
  static bool _$isExpanded(AlignNode v) => v.isExpanded;
  static const Field<AlignNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static PTreeNodeTreeController? _$pTreeC(AlignNode v) => v.pTreeC;
  static const Field<AlignNode, PTreeNodeTreeController> _f$pTreeC =
      Field('pTreeC', _$pTreeC, mode: FieldMode.member);
  static double? _$propertiesPaneScrollPos(AlignNode v) =>
      v.propertiesPaneScrollPos;
  static const Field<AlignNode, double> _f$propertiesPaneScrollPos = Field(
      'propertiesPaneScrollPos', _$propertiesPaneScrollPos,
      mode: FieldMode.member);
  static ScrollController? _$propertiesPaneSC(AlignNode v) =>
      v.propertiesPaneSC;
  static const Field<AlignNode, ScrollController> _f$propertiesPaneSC =
      Field('propertiesPaneSC', _$propertiesPaneSC, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(AlignNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<AlignNode, bool> _f$hidePropertiesWhileDragging = Field(
      'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
      mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(AlignNode v) =>
      v.nodeWidgetGK;
  static const Field<AlignNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<AlignNode> fields = const {
    #alignment: _f$alignment,
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
  final dynamic discriminatorValue = 'AlignNode';
  @override
  late final ClassMapperBase superMapper = SCMapper.ensureInitialized();

  static AlignNode _instantiate(DecodingData data) {
    return AlignNode(
        alignment: data.dec(_f$alignment), child: data.dec(_f$child));
  }

  @override
  final Function instantiate = _instantiate;

  static AlignNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AlignNode>(map);
  }

  static AlignNode fromJson(String json) {
    return ensureInitialized().decodeJson<AlignNode>(json);
  }
}

mixin AlignNodeMappable {
  String toJson() {
    return AlignNodeMapper.ensureInitialized()
        .encodeJson<AlignNode>(this as AlignNode);
  }

  Map<String, dynamic> toMap() {
    return AlignNodeMapper.ensureInitialized()
        .encodeMap<AlignNode>(this as AlignNode);
  }

  AlignNodeCopyWith<AlignNode, AlignNode, AlignNode> get copyWith =>
      _AlignNodeCopyWithImpl(this as AlignNode, $identity, $identity);
  @override
  String toString() {
    return AlignNodeMapper.ensureInitialized()
        .stringifyValue(this as AlignNode);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AlignNodeMapper.ensureInitialized()
                .isValueEqual(this as AlignNode, other));
  }

  @override
  int get hashCode {
    return AlignNodeMapper.ensureInitialized().hashValue(this as AlignNode);
  }
}

extension AlignNodeValueCopy<$R, $Out> on ObjectCopyWith<$R, AlignNode, $Out> {
  AlignNodeCopyWith<$R, AlignNode, $Out> get $asAlignNode =>
      $base.as((v, t, t2) => _AlignNodeCopyWithImpl(v, t, t2));
}

abstract class AlignNodeCopyWith<$R, $In extends AlignNode, $Out>
    implements SCCopyWith<$R, $In, $Out> {
  @override
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get child;
  @override
  $R call({AlignmentEnum? alignment, STreeNode? child});
  AlignNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AlignNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AlignNode, $Out>
    implements AlignNodeCopyWith<$R, AlignNode, $Out> {
  _AlignNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AlignNode> $mapper =
      AlignNodeMapper.ensureInitialized();
  @override
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get child =>
      $value.child?.copyWith.$chain((v) => call(child: v));
  @override
  $R call({AlignmentEnum? alignment, Object? child = $none}) =>
      $apply(FieldCopyWithData({
        if (alignment != null) #alignment: alignment,
        if (child != $none) #child: child
      }));
  @override
  AlignNode $make(CopyWithData data) => AlignNode(
      alignment: data.get(#alignment, or: $value.alignment),
      child: data.get(#child, or: $value.child));

  @override
  AlignNodeCopyWith<$R2, AlignNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AlignNodeCopyWithImpl($value, $cast, t);
}