// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'row_node.dart';

class RowNodeMapper extends SubClassMapperBase<RowNode> {
  RowNodeMapper._();

  static RowNodeMapper? _instance;
  static RowNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RowNodeMapper._());
      FlexNodeMapper.ensureInitialized().addSubMapper(_instance!);
      MainAxisAlignmentEnumMapper.ensureInitialized();
      MainAxisSizeEnumMapper.ensureInitialized();
      CrossAxisAlignmentEnumMapper.ensureInitialized();
      STreeNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'RowNode';

  static MainAxisAlignmentEnum? _$mainAxisAlignment(RowNode v) =>
      v.mainAxisAlignment;
  static const Field<RowNode, MainAxisAlignmentEnum> _f$mainAxisAlignment =
      Field('mainAxisAlignment', _$mainAxisAlignment, opt: true);
  static MainAxisSizeEnum? _$mainAxisSize(RowNode v) => v.mainAxisSize;
  static const Field<RowNode, MainAxisSizeEnum> _f$mainAxisSize =
      Field('mainAxisSize', _$mainAxisSize, opt: true);
  static CrossAxisAlignmentEnum? _$crossAxisAlignment(RowNode v) =>
      v.crossAxisAlignment;
  static const Field<RowNode, CrossAxisAlignmentEnum> _f$crossAxisAlignment =
      Field('crossAxisAlignment', _$crossAxisAlignment, opt: true);
  static List<STreeNode> _$children(RowNode v) => v.children;
  static const Field<RowNode, List<STreeNode>> _f$children =
      Field('children', _$children);
  static bool _$isExpanded(RowNode v) => v.isExpanded;
  static const Field<RowNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static PTreeNodeTreeController? _$pTreeC(RowNode v) => v.pTreeC;
  static const Field<RowNode, PTreeNodeTreeController> _f$pTreeC =
      Field('pTreeC', _$pTreeC, mode: FieldMode.member);
  static double? _$propertiesPaneScrollPos(RowNode v) =>
      v.propertiesPaneScrollPos;
  static const Field<RowNode, double> _f$propertiesPaneScrollPos = Field(
      'propertiesPaneScrollPos', _$propertiesPaneScrollPos,
      mode: FieldMode.member);
  static ScrollController? _$propertiesPaneSC(RowNode v) => v.propertiesPaneSC;
  static const Field<RowNode, ScrollController> _f$propertiesPaneSC =
      Field('propertiesPaneSC', _$propertiesPaneSC, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(RowNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<RowNode, bool> _f$hidePropertiesWhileDragging = Field(
      'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
      mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(RowNode v) =>
      v.nodeWidgetGK;
  static const Field<RowNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<RowNode> fields = const {
    #mainAxisAlignment: _f$mainAxisAlignment,
    #mainAxisSize: _f$mainAxisSize,
    #crossAxisAlignment: _f$crossAxisAlignment,
    #children: _f$children,
    #isExpanded: _f$isExpanded,
    #pTreeC: _f$pTreeC,
    #propertiesPaneScrollPos: _f$propertiesPaneScrollPos,
    #propertiesPaneSC: _f$propertiesPaneSC,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'flex';
  @override
  final dynamic discriminatorValue = 'RowNode';
  @override
  late final ClassMapperBase superMapper = FlexNodeMapper.ensureInitialized();

  static RowNode _instantiate(DecodingData data) {
    return RowNode(
        mainAxisAlignment: data.dec(_f$mainAxisAlignment),
        mainAxisSize: data.dec(_f$mainAxisSize),
        crossAxisAlignment: data.dec(_f$crossAxisAlignment),
        children: data.dec(_f$children));
  }

  @override
  final Function instantiate = _instantiate;

  static RowNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RowNode>(map);
  }

  static RowNode fromJson(String json) {
    return ensureInitialized().decodeJson<RowNode>(json);
  }
}

mixin RowNodeMappable {
  String toJson() {
    return RowNodeMapper.ensureInitialized()
        .encodeJson<RowNode>(this as RowNode);
  }

  Map<String, dynamic> toMap() {
    return RowNodeMapper.ensureInitialized()
        .encodeMap<RowNode>(this as RowNode);
  }

  RowNodeCopyWith<RowNode, RowNode, RowNode> get copyWith =>
      _RowNodeCopyWithImpl(this as RowNode, $identity, $identity);
  @override
  String toString() {
    return RowNodeMapper.ensureInitialized().stringifyValue(this as RowNode);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            RowNodeMapper.ensureInitialized()
                .isValueEqual(this as RowNode, other));
  }

  @override
  int get hashCode {
    return RowNodeMapper.ensureInitialized().hashValue(this as RowNode);
  }
}

extension RowNodeValueCopy<$R, $Out> on ObjectCopyWith<$R, RowNode, $Out> {
  RowNodeCopyWith<$R, RowNode, $Out> get $asRowNode =>
      $base.as((v, t, t2) => _RowNodeCopyWithImpl(v, t, t2));
}

abstract class RowNodeCopyWith<$R, $In extends RowNode, $Out>
    implements FlexNodeCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, STreeNode, STreeNodeCopyWith<$R, STreeNode, STreeNode>>
      get children;
  @override
  $R call(
      {MainAxisAlignmentEnum? mainAxisAlignment,
      MainAxisSizeEnum? mainAxisSize,
      CrossAxisAlignmentEnum? crossAxisAlignment,
      List<STreeNode>? children});
  RowNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RowNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RowNode, $Out>
    implements RowNodeCopyWith<$R, RowNode, $Out> {
  _RowNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RowNode> $mapper =
      RowNodeMapper.ensureInitialized();
  @override
  ListCopyWith<$R, STreeNode, STreeNodeCopyWith<$R, STreeNode, STreeNode>>
      get children => ListCopyWith($value.children,
          (v, t) => v.copyWith.$chain(t), (v) => call(children: v));
  @override
  $R call(
          {Object? mainAxisAlignment = $none,
          Object? mainAxisSize = $none,
          Object? crossAxisAlignment = $none,
          List<STreeNode>? children}) =>
      $apply(FieldCopyWithData({
        if (mainAxisAlignment != $none) #mainAxisAlignment: mainAxisAlignment,
        if (mainAxisSize != $none) #mainAxisSize: mainAxisSize,
        if (crossAxisAlignment != $none)
          #crossAxisAlignment: crossAxisAlignment,
        if (children != null) #children: children
      }));
  @override
  RowNode $make(CopyWithData data) => RowNode(
      mainAxisAlignment:
          data.get(#mainAxisAlignment, or: $value.mainAxisAlignment),
      mainAxisSize: data.get(#mainAxisSize, or: $value.mainAxisSize),
      crossAxisAlignment:
          data.get(#crossAxisAlignment, or: $value.crossAxisAlignment),
      children: data.get(#children, or: $value.children));

  @override
  RowNodeCopyWith<$R2, RowNode, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _RowNodeCopyWithImpl($value, $cast, t);
}