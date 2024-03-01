// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'transformable_scaffold_node.dart';

class TransformableScaffoldNodeMapper
    extends SubClassMapperBase<TransformableScaffoldNode> {
  TransformableScaffoldNodeMapper._();

  static TransformableScaffoldNodeMapper? _instance;
  static TransformableScaffoldNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = TransformableScaffoldNodeMapper._());
      STreeNodeMapper.ensureInitialized().addSubMapper(_instance!);
      ScaffoldNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TransformableScaffoldNode';

  static ScaffoldNode _$scaffold(TransformableScaffoldNode v) => v.scaffold;
  static const Field<TransformableScaffoldNode, ScaffoldNode> _f$scaffold =
      Field('scaffold', _$scaffold);
  static bool _$isExpanded(TransformableScaffoldNode v) => v.isExpanded;
  static const Field<TransformableScaffoldNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static PTreeNodeTreeController? _$pTreeC(TransformableScaffoldNode v) =>
      v.pTreeC;
  static const Field<TransformableScaffoldNode, PTreeNodeTreeController>
      _f$pTreeC = Field('pTreeC', _$pTreeC, mode: FieldMode.member);
  static double? _$propertiesPaneScrollPos(TransformableScaffoldNode v) =>
      v.propertiesPaneScrollPos;
  static const Field<TransformableScaffoldNode, double>
      _f$propertiesPaneScrollPos = Field(
          'propertiesPaneScrollPos', _$propertiesPaneScrollPos,
          mode: FieldMode.member);
  static ScrollController? _$propertiesPaneSC(TransformableScaffoldNode v) =>
      v.propertiesPaneSC;
  static const Field<TransformableScaffoldNode, ScrollController>
      _f$propertiesPaneSC =
      Field('propertiesPaneSC', _$propertiesPaneSC, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(TransformableScaffoldNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<TransformableScaffoldNode, bool>
      _f$hidePropertiesWhileDragging = Field(
          'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
          mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(
          TransformableScaffoldNode v) =>
      v.nodeWidgetGK;
  static const Field<TransformableScaffoldNode,
          GlobalKey<State<StatefulWidget>>> _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<TransformableScaffoldNode> fields = const {
    #scaffold: _f$scaffold,
    #isExpanded: _f$isExpanded,
    #pTreeC: _f$pTreeC,
    #propertiesPaneScrollPos: _f$propertiesPaneScrollPos,
    #propertiesPaneSC: _f$propertiesPaneSC,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'snode';
  @override
  final dynamic discriminatorValue = 'TransformableScaffoldNode';
  @override
  late final ClassMapperBase superMapper = STreeNodeMapper.ensureInitialized();

  static TransformableScaffoldNode _instantiate(DecodingData data) {
    return TransformableScaffoldNode(scaffold: data.dec(_f$scaffold));
  }

  @override
  final Function instantiate = _instantiate;

  static TransformableScaffoldNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TransformableScaffoldNode>(map);
  }

  static TransformableScaffoldNode fromJson(String json) {
    return ensureInitialized().decodeJson<TransformableScaffoldNode>(json);
  }
}

mixin TransformableScaffoldNodeMappable {
  String toJson() {
    return TransformableScaffoldNodeMapper.ensureInitialized()
        .encodeJson<TransformableScaffoldNode>(
            this as TransformableScaffoldNode);
  }

  Map<String, dynamic> toMap() {
    return TransformableScaffoldNodeMapper.ensureInitialized()
        .encodeMap<TransformableScaffoldNode>(
            this as TransformableScaffoldNode);
  }

  TransformableScaffoldNodeCopyWith<TransformableScaffoldNode,
          TransformableScaffoldNode, TransformableScaffoldNode>
      get copyWith => _TransformableScaffoldNodeCopyWithImpl(
          this as TransformableScaffoldNode, $identity, $identity);
  @override
  String toString() {
    return TransformableScaffoldNodeMapper.ensureInitialized()
        .stringifyValue(this as TransformableScaffoldNode);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            TransformableScaffoldNodeMapper.ensureInitialized()
                .isValueEqual(this as TransformableScaffoldNode, other));
  }

  @override
  int get hashCode {
    return TransformableScaffoldNodeMapper.ensureInitialized()
        .hashValue(this as TransformableScaffoldNode);
  }
}

extension TransformableScaffoldNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TransformableScaffoldNode, $Out> {
  TransformableScaffoldNodeCopyWith<$R, TransformableScaffoldNode, $Out>
      get $asTransformableScaffoldNode => $base
          .as((v, t, t2) => _TransformableScaffoldNodeCopyWithImpl(v, t, t2));
}

abstract class TransformableScaffoldNodeCopyWith<
    $R,
    $In extends TransformableScaffoldNode,
    $Out> implements STreeNodeCopyWith<$R, $In, $Out> {
  ScaffoldNodeCopyWith<$R, ScaffoldNode, ScaffoldNode> get scaffold;
  @override
  $R call({ScaffoldNode? scaffold});
  TransformableScaffoldNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TransformableScaffoldNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TransformableScaffoldNode, $Out>
    implements
        TransformableScaffoldNodeCopyWith<$R, TransformableScaffoldNode, $Out> {
  _TransformableScaffoldNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TransformableScaffoldNode> $mapper =
      TransformableScaffoldNodeMapper.ensureInitialized();
  @override
  ScaffoldNodeCopyWith<$R, ScaffoldNode, ScaffoldNode> get scaffold =>
      $value.scaffold.copyWith.$chain((v) => call(scaffold: v));
  @override
  $R call({ScaffoldNode? scaffold}) =>
      $apply(FieldCopyWithData({if (scaffold != null) #scaffold: scaffold}));
  @override
  TransformableScaffoldNode $make(CopyWithData data) =>
      TransformableScaffoldNode(
          scaffold: data.get(#scaffold, or: $value.scaffold));

  @override
  TransformableScaffoldNodeCopyWith<$R2, TransformableScaffoldNode, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _TransformableScaffoldNodeCopyWithImpl($value, $cast, t);
}
