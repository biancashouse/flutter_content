// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'snode.dart';

class STreeNodeMapper extends ClassMapperBase<STreeNode> {
  STreeNodeMapper._();

  static STreeNodeMapper? _instance;
  static STreeNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = STreeNodeMapper._());
      TransformableScaffoldNodeMapper.ensureInitialized();
      ScaffoldNodeMapper.ensureInitialized();
      AppBarNodeMapper.ensureInitialized();
      SCMapper.ensureInitialized();
      MCMapper.ensureInitialized();
      CLMapper.ensureInitialized();
      InlineSpanNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'STreeNode';

  static bool _$isExpanded(STreeNode v) => v.isExpanded;
  static const Field<STreeNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static PTreeNodeTreeController? _$pTreeC(STreeNode v) => v.pTreeC;
  static const Field<STreeNode, PTreeNodeTreeController> _f$pTreeC =
      Field('pTreeC', _$pTreeC, mode: FieldMode.member);
  static double? _$propertiesPaneScrollPos(STreeNode v) =>
      v.propertiesPaneScrollPos;
  static const Field<STreeNode, double> _f$propertiesPaneScrollPos = Field(
      'propertiesPaneScrollPos', _$propertiesPaneScrollPos,
      mode: FieldMode.member);
  static ScrollController? _$propertiesPaneSC(STreeNode v) =>
      v.propertiesPaneSC;
  static const Field<STreeNode, ScrollController> _f$propertiesPaneSC =
      Field('propertiesPaneSC', _$propertiesPaneSC, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(STreeNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<STreeNode, bool> _f$hidePropertiesWhileDragging = Field(
      'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
      mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(STreeNode v) =>
      v.nodeWidgetGK;
  static const Field<STreeNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<STreeNode> fields = const {
    #isExpanded: _f$isExpanded,
    #pTreeC: _f$pTreeC,
    #propertiesPaneScrollPos: _f$propertiesPaneScrollPos,
    #propertiesPaneSC: _f$propertiesPaneSC,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  static STreeNode _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'STreeNode', 'snode', '${data.value['snode']}');
  }

  @override
  final Function instantiate = _instantiate;

  static STreeNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<STreeNode>(map);
  }

  static STreeNode fromJson(String json) {
    return ensureInitialized().decodeJson<STreeNode>(json);
  }
}

mixin STreeNodeMappable {
  String toJson();
  Map<String, dynamic> toMap();
  STreeNodeCopyWith<STreeNode, STreeNode, STreeNode> get copyWith;
}

abstract class STreeNodeCopyWith<$R, $In extends STreeNode, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  STreeNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}