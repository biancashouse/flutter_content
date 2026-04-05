// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'flex_node.dart';

class FlexNodeMapper extends SubClassMapperBase<FlexNode> {
  FlexNodeMapper._();

  static FlexNodeMapper? _instance;
  static FlexNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FlexNodeMapper._());
      MCMapper.ensureInitialized().addSubMapper(_instance!);
      RowNodeMapper.ensureInitialized();
      ColumnNodeMapper.ensureInitialized();
      AxisEnumMapper.ensureInitialized();
      MainAxisAlignmentEnumModelMapper.ensureInitialized();
      MainAxisSizeEnumMapper.ensureInitialized();
      CrossAxisAlignmentEnumModelMapper.ensureInitialized();
      SNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'FlexNode';

  static AxisEnum _$direction(FlexNode v) => v.direction;
  static const Field<FlexNode, AxisEnum> _f$direction = Field(
    'direction',
    _$direction,
  );
  static MainAxisAlignmentEnumModel? _$mainAxisAlignment(FlexNode v) =>
      v.mainAxisAlignment;
  static const Field<FlexNode, MainAxisAlignmentEnumModel>
  _f$mainAxisAlignment = Field(
    'mainAxisAlignment',
    _$mainAxisAlignment,
    opt: true,
  );
  static MainAxisSizeEnum? _$mainAxisSize(FlexNode v) => v.mainAxisSize;
  static const Field<FlexNode, MainAxisSizeEnum> _f$mainAxisSize = Field(
    'mainAxisSize',
    _$mainAxisSize,
    opt: true,
  );
  static CrossAxisAlignmentEnumModel? _$crossAxisAlignment(FlexNode v) =>
      v.crossAxisAlignment;
  static const Field<FlexNode, CrossAxisAlignmentEnumModel>
  _f$crossAxisAlignment = Field(
    'crossAxisAlignment',
    _$crossAxisAlignment,
    opt: true,
  );
  static List<SNode> _$children(FlexNode v) => v.children;
  static const Field<FlexNode, List<SNode>> _f$children = Field(
    'children',
    _$children,
  );
  static String _$uid(FlexNode v) => v.uid;
  static const Field<FlexNode, String> _f$uid = Field(
    'uid',
    _$uid,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$treeNodeGK(FlexNode v) =>
      v.treeNodeGK;
  static const Field<FlexNode, GlobalKey<State<StatefulWidget>>> _f$treeNodeGK =
      Field('treeNodeGK', _$treeNodeGK, mode: FieldMode.member);
  static bool _$isExpanded(FlexNode v) => v.isExpanded;
  static const Field<FlexNode, bool> _f$isExpanded = Field(
    'isExpanded',
    _$isExpanded,
    mode: FieldMode.member,
  );
  static bool? _$hidePropertiesWhileDragging(FlexNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<FlexNode, bool> _f$hidePropertiesWhileDragging = Field(
    'hidePropertiesWhileDragging',
    _$hidePropertiesWhileDragging,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$nodeGK(FlexNode v) => v.nodeGK;
  static const Field<FlexNode, GlobalKey<State<StatefulWidget>>> _f$nodeGK =
      Field('nodeGK', _$nodeGK, mode: FieldMode.member);
  static bool? _$wrapInExpanded(FlexNode v) => v.wrapInExpanded;
  static const Field<FlexNode, bool> _f$wrapInExpanded = Field(
    'wrapInExpanded',
    _$wrapInExpanded,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<FlexNode> fields = const {
    #direction: _f$direction,
    #mainAxisAlignment: _f$mainAxisAlignment,
    #mainAxisSize: _f$mainAxisSize,
    #crossAxisAlignment: _f$crossAxisAlignment,
    #children: _f$children,
    #uid: _f$uid,
    #treeNodeGK: _f$treeNodeGK,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeGK: _f$nodeGK,
    #wrapInExpanded: _f$wrapInExpanded,
  };

  @override
  final String discriminatorKey = 'DK:mc';
  @override
  final dynamic discriminatorValue = 'FlexNode';
  @override
  late final ClassMapperBase superMapper = MCMapper.ensureInitialized();

  @override
  final MappingHook hook = const PropertyRenameHook('flex', 'DK:flex');
  @override
  final MappingHook superHook = ChainedHook([
    PropertyRenameHook('mc', 'DK:mc'),
    PropertyRenameHook('snode', 'DK:snode'),
  ]);

  static FlexNode _instantiate(DecodingData data) {
    return FlexNode(
      direction: data.dec(_f$direction),
      mainAxisAlignment: data.dec(_f$mainAxisAlignment),
      mainAxisSize: data.dec(_f$mainAxisSize),
      crossAxisAlignment: data.dec(_f$crossAxisAlignment),
      children: data.dec(_f$children),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static FlexNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FlexNode>(map);
  }

  static FlexNode fromJson(String json) {
    return ensureInitialized().decodeJson<FlexNode>(json);
  }
}

mixin FlexNodeMappable {
  String toJson() {
    return FlexNodeMapper.ensureInitialized().encodeJson<FlexNode>(
      this as FlexNode,
    );
  }

  Map<String, dynamic> toMap() {
    return FlexNodeMapper.ensureInitialized().encodeMap<FlexNode>(
      this as FlexNode,
    );
  }

  FlexNodeCopyWith<FlexNode, FlexNode, FlexNode> get copyWith =>
      _FlexNodeCopyWithImpl<FlexNode, FlexNode>(
        this as FlexNode,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return FlexNodeMapper.ensureInitialized().stringifyValue(this as FlexNode);
  }

  @override
  bool operator ==(Object other) {
    return FlexNodeMapper.ensureInitialized().equalsValue(
      this as FlexNode,
      other,
    );
  }

  @override
  int get hashCode {
    return FlexNodeMapper.ensureInitialized().hashValue(this as FlexNode);
  }
}

extension FlexNodeValueCopy<$R, $Out> on ObjectCopyWith<$R, FlexNode, $Out> {
  FlexNodeCopyWith<$R, FlexNode, $Out> get $asFlexNode =>
      $base.as((v, t, t2) => _FlexNodeCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class FlexNodeCopyWith<$R, $In extends FlexNode, $Out>
    implements MCCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, SNode, SNodeCopyWith<$R, SNode, SNode>> get children;
  @override
  $R call({
    AxisEnum? direction,
    MainAxisAlignmentEnumModel? mainAxisAlignment,
    MainAxisSizeEnum? mainAxisSize,
    CrossAxisAlignmentEnumModel? crossAxisAlignment,
    List<SNode>? children,
  });
  FlexNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _FlexNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FlexNode, $Out>
    implements FlexNodeCopyWith<$R, FlexNode, $Out> {
  _FlexNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FlexNode> $mapper =
      FlexNodeMapper.ensureInitialized();
  @override
  ListCopyWith<$R, SNode, SNodeCopyWith<$R, SNode, SNode>> get children =>
      ListCopyWith(
        $value.children,
        (v, t) => v.copyWith.$chain(t),
        (v) => call(children: v),
      );
  @override
  $R call({
    AxisEnum? direction,
    Object? mainAxisAlignment = $none,
    Object? mainAxisSize = $none,
    Object? crossAxisAlignment = $none,
    List<SNode>? children,
  }) => $apply(
    FieldCopyWithData({
      if (direction != null) #direction: direction,
      if (mainAxisAlignment != $none) #mainAxisAlignment: mainAxisAlignment,
      if (mainAxisSize != $none) #mainAxisSize: mainAxisSize,
      if (crossAxisAlignment != $none) #crossAxisAlignment: crossAxisAlignment,
      if (children != null) #children: children,
    }),
  );
  @override
  FlexNode $make(CopyWithData data) => FlexNode(
    direction: data.get(#direction, or: $value.direction),
    mainAxisAlignment: data.get(
      #mainAxisAlignment,
      or: $value.mainAxisAlignment,
    ),
    mainAxisSize: data.get(#mainAxisSize, or: $value.mainAxisSize),
    crossAxisAlignment: data.get(
      #crossAxisAlignment,
      or: $value.crossAxisAlignment,
    ),
    children: data.get(#children, or: $value.children),
  );

  @override
  FlexNodeCopyWith<$R2, FlexNode, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _FlexNodeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

