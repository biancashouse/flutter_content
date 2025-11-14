// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'gridview_node.dart';

class GridViewNodeMapper extends SubClassMapperBase<GridViewNode> {
  GridViewNodeMapper._();

  static GridViewNodeMapper? _instance;
  static GridViewNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GridViewNodeMapper._());
      BoxScrollViewNodeMapper.ensureInitialized().addSubMapper(_instance!);
      SNodeMapper.ensureInitialized();
      EdgeInsetsValueMapper.ensureInitialized();
      AxisEnumMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'GridViewNode';

  static double? _$mainAxisSpacing(GridViewNode v) => v.mainAxisSpacing;
  static const Field<GridViewNode, double> _f$mainAxisSpacing = Field(
    'mainAxisSpacing',
    _$mainAxisSpacing,
    opt: true,
  );
  static double? _$crossAxisSpacing(GridViewNode v) => v.crossAxisSpacing;
  static const Field<GridViewNode, double> _f$crossAxisSpacing = Field(
    'crossAxisSpacing',
    _$crossAxisSpacing,
    opt: true,
  );
  static int? _$crossAxisCount(GridViewNode v) => v.crossAxisCount;
  static const Field<GridViewNode, int> _f$crossAxisCount = Field(
    'crossAxisCount',
    _$crossAxisCount,
    opt: true,
  );
  static List<SNode> _$children(GridViewNode v) => v.children;
  static const Field<GridViewNode, List<SNode>> _f$children = Field(
    'children',
    _$children,
  );
  static EdgeInsetsValue? _$padding(GridViewNode v) => v.padding;
  static const Field<GridViewNode, EdgeInsetsValue> _f$padding = Field(
    'padding',
    _$padding,
    opt: true,
  );
  static AxisEnum _$axis(GridViewNode v) => v.axis;
  static const Field<GridViewNode, AxisEnum> _f$axis = Field(
    'axis',
    _$axis,
    opt: true,
    def: AxisEnum.vertical,
  );
  static bool? _$shrinkWrap(GridViewNode v) => v.shrinkWrap;
  static const Field<GridViewNode, bool> _f$shrinkWrap = Field(
    'shrinkWrap',
    _$shrinkWrap,
    opt: true,
  );
  static String _$uid(GridViewNode v) => v.uid;
  static const Field<GridViewNode, String> _f$uid = Field(
    'uid',
    _$uid,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$treeNodeGK(GridViewNode v) =>
      v.treeNodeGK;
  static const Field<GridViewNode, GlobalKey<State<StatefulWidget>>>
  _f$treeNodeGK = Field('treeNodeGK', _$treeNodeGK, mode: FieldMode.member);
  static bool _$isExpanded(GridViewNode v) => v.isExpanded;
  static const Field<GridViewNode, bool> _f$isExpanded = Field(
    'isExpanded',
    _$isExpanded,
    mode: FieldMode.member,
  );
  static bool? _$hidePropertiesWhileDragging(GridViewNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<GridViewNode, bool> _f$hidePropertiesWhileDragging = Field(
    'hidePropertiesWhileDragging',
    _$hidePropertiesWhileDragging,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$nodeGK(GridViewNode v) => v.nodeGK;
  static const Field<GridViewNode, GlobalKey<State<StatefulWidget>>> _f$nodeGK =
      Field('nodeGK', _$nodeGK, mode: FieldMode.member);
  static bool _$canShowTappableNodeWidgetOverlay(GridViewNode v) =>
      v.canShowTappableNodeWidgetOverlay;
  static const Field<GridViewNode, bool> _f$canShowTappableNodeWidgetOverlay =
      Field(
        'canShowTappableNodeWidgetOverlay',
        _$canShowTappableNodeWidgetOverlay,
        mode: FieldMode.member,
      );
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(GridViewNode v) =>
      v.nodeWidgetGK;
  static const Field<GridViewNode, GlobalKey<State<StatefulWidget>>>
  _f$nodeWidgetGK = Field(
    'nodeWidgetGK',
    _$nodeWidgetGK,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<GridViewNode> fields = const {
    #mainAxisSpacing: _f$mainAxisSpacing,
    #crossAxisSpacing: _f$crossAxisSpacing,
    #crossAxisCount: _f$crossAxisCount,
    #children: _f$children,
    #padding: _f$padding,
    #axis: _f$axis,
    #shrinkWrap: _f$shrinkWrap,
    #uid: _f$uid,
    #treeNodeGK: _f$treeNodeGK,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeGK: _f$nodeGK,
    #canShowTappableNodeWidgetOverlay: _f$canShowTappableNodeWidgetOverlay,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'DK:boxscrollview';
  @override
  final dynamic discriminatorValue = 'GridViewNode';
  @override
  late final ClassMapperBase superMapper =
      BoxScrollViewNodeMapper.ensureInitialized();

  @override
  final MappingHook superHook = ChainedHook([
    PropertyRenameHook('cl', 'DK:cl'),
    PropertyRenameHook('snode', 'DK:snode'),
  ]);

  static GridViewNode _instantiate(DecodingData data) {
    return GridViewNode(
      mainAxisSpacing: data.dec(_f$mainAxisSpacing),
      crossAxisSpacing: data.dec(_f$crossAxisSpacing),
      crossAxisCount: data.dec(_f$crossAxisCount),
      children: data.dec(_f$children),
      padding: data.dec(_f$padding),
      axis: data.dec(_f$axis),
      shrinkWrap: data.dec(_f$shrinkWrap),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static GridViewNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GridViewNode>(map);
  }

  static GridViewNode fromJson(String json) {
    return ensureInitialized().decodeJson<GridViewNode>(json);
  }
}

mixin GridViewNodeMappable {
  String toJson() {
    return GridViewNodeMapper.ensureInitialized().encodeJson<GridViewNode>(
      this as GridViewNode,
    );
  }

  Map<String, dynamic> toMap() {
    return GridViewNodeMapper.ensureInitialized().encodeMap<GridViewNode>(
      this as GridViewNode,
    );
  }

  GridViewNodeCopyWith<GridViewNode, GridViewNode, GridViewNode> get copyWith =>
      _GridViewNodeCopyWithImpl<GridViewNode, GridViewNode>(
        this as GridViewNode,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return GridViewNodeMapper.ensureInitialized().stringifyValue(
      this as GridViewNode,
    );
  }

  @override
  bool operator ==(Object other) {
    return GridViewNodeMapper.ensureInitialized().equalsValue(
      this as GridViewNode,
      other,
    );
  }

  @override
  int get hashCode {
    return GridViewNodeMapper.ensureInitialized().hashValue(
      this as GridViewNode,
    );
  }
}

extension GridViewNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GridViewNode, $Out> {
  GridViewNodeCopyWith<$R, GridViewNode, $Out> get $asGridViewNode =>
      $base.as((v, t, t2) => _GridViewNodeCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class GridViewNodeCopyWith<$R, $In extends GridViewNode, $Out>
    implements BoxScrollViewNodeCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, SNode, SNodeCopyWith<$R, SNode, SNode>> get children;
  @override
  EdgeInsetsValueCopyWith<$R, EdgeInsetsValue, EdgeInsetsValue>? get padding;
  @override
  $R call({
    double? mainAxisSpacing,
    double? crossAxisSpacing,
    int? crossAxisCount,
    List<SNode>? children,
    EdgeInsetsValue? padding,
    AxisEnum? axis,
    bool? shrinkWrap,
  });
  GridViewNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _GridViewNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GridViewNode, $Out>
    implements GridViewNodeCopyWith<$R, GridViewNode, $Out> {
  _GridViewNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GridViewNode> $mapper =
      GridViewNodeMapper.ensureInitialized();
  @override
  ListCopyWith<$R, SNode, SNodeCopyWith<$R, SNode, SNode>> get children =>
      ListCopyWith(
        $value.children,
        (v, t) => v.copyWith.$chain(t),
        (v) => call(children: v),
      );
  @override
  EdgeInsetsValueCopyWith<$R, EdgeInsetsValue, EdgeInsetsValue>? get padding =>
      $value.padding?.copyWith.$chain((v) => call(padding: v));
  @override
  $R call({
    Object? mainAxisSpacing = $none,
    Object? crossAxisSpacing = $none,
    Object? crossAxisCount = $none,
    List<SNode>? children,
    Object? padding = $none,
    AxisEnum? axis,
    Object? shrinkWrap = $none,
  }) => $apply(
    FieldCopyWithData({
      if (mainAxisSpacing != $none) #mainAxisSpacing: mainAxisSpacing,
      if (crossAxisSpacing != $none) #crossAxisSpacing: crossAxisSpacing,
      if (crossAxisCount != $none) #crossAxisCount: crossAxisCount,
      if (children != null) #children: children,
      if (padding != $none) #padding: padding,
      if (axis != null) #axis: axis,
      if (shrinkWrap != $none) #shrinkWrap: shrinkWrap,
    }),
  );
  @override
  GridViewNode $make(CopyWithData data) => GridViewNode(
    mainAxisSpacing: data.get(#mainAxisSpacing, or: $value.mainAxisSpacing),
    crossAxisSpacing: data.get(#crossAxisSpacing, or: $value.crossAxisSpacing),
    crossAxisCount: data.get(#crossAxisCount, or: $value.crossAxisCount),
    children: data.get(#children, or: $value.children),
    padding: data.get(#padding, or: $value.padding),
    axis: data.get(#axis, or: $value.axis),
    shrinkWrap: data.get(#shrinkWrap, or: $value.shrinkWrap),
  );

  @override
  GridViewNodeCopyWith<$R2, GridViewNode, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _GridViewNodeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

