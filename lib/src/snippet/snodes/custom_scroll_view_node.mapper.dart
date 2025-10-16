// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'custom_scroll_view_node.dart';

class CustomScrollViewNodeMapper
    extends SubClassMapperBase<CustomScrollViewNode> {
  CustomScrollViewNodeMapper._();

  static CustomScrollViewNodeMapper? _instance;
  static CustomScrollViewNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CustomScrollViewNodeMapper._());
      MCMapper.ensureInitialized().addSubMapper(_instance!);
      AxisEnumMapper.ensureInitialized();
      SNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CustomScrollViewNode';

  static AxisEnum _$axis(CustomScrollViewNode v) => v.axis;
  static const Field<CustomScrollViewNode, AxisEnum> _f$axis = Field(
    'axis',
    _$axis,
    opt: true,
    def: AxisEnum.vertical,
  );
  static bool? _$shrinkWrap(CustomScrollViewNode v) => v.shrinkWrap;
  static const Field<CustomScrollViewNode, bool> _f$shrinkWrap = Field(
    'shrinkWrap',
    _$shrinkWrap,
    opt: true,
    def: false,
  );
  static List<SNode> _$children(CustomScrollViewNode v) => v.children;
  static const Field<CustomScrollViewNode, List<SNode>> _f$children = Field(
    'children',
    _$children,
  );
  static String _$uid(CustomScrollViewNode v) => v.uid;
  static const Field<CustomScrollViewNode, String> _f$uid = Field(
    'uid',
    _$uid,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$treeNodeGK(
    CustomScrollViewNode v,
  ) => v.treeNodeGK;
  static const Field<CustomScrollViewNode, GlobalKey<State<StatefulWidget>>>
  _f$treeNodeGK = Field('treeNodeGK', _$treeNodeGK, mode: FieldMode.member);
  static bool _$isExpanded(CustomScrollViewNode v) => v.isExpanded;
  static const Field<CustomScrollViewNode, bool> _f$isExpanded = Field(
    'isExpanded',
    _$isExpanded,
    mode: FieldMode.member,
  );
  static bool? _$hidePropertiesWhileDragging(CustomScrollViewNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<CustomScrollViewNode, bool>
  _f$hidePropertiesWhileDragging = Field(
    'hidePropertiesWhileDragging',
    _$hidePropertiesWhileDragging,
    mode: FieldMode.member,
  );
  static bool _$canShowTappableNodeWidgetOverlay(CustomScrollViewNode v) =>
      v.canShowTappableNodeWidgetOverlay;
  static const Field<CustomScrollViewNode, bool>
  _f$canShowTappableNodeWidgetOverlay = Field(
    'canShowTappableNodeWidgetOverlay',
    _$canShowTappableNodeWidgetOverlay,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(
    CustomScrollViewNode v,
  ) => v.nodeWidgetGK;
  static const Field<CustomScrollViewNode, GlobalKey<State<StatefulWidget>>>
  _f$nodeWidgetGK = Field(
    'nodeWidgetGK',
    _$nodeWidgetGK,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<CustomScrollViewNode> fields = const {
    #axis: _f$axis,
    #shrinkWrap: _f$shrinkWrap,
    #children: _f$children,
    #uid: _f$uid,
    #treeNodeGK: _f$treeNodeGK,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #canShowTappableNodeWidgetOverlay: _f$canShowTappableNodeWidgetOverlay,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'mc';
  @override
  final dynamic discriminatorValue = 'CustomScrollViewNode';
  @override
  late final ClassMapperBase superMapper = MCMapper.ensureInitialized();

  static CustomScrollViewNode _instantiate(DecodingData data) {
    return CustomScrollViewNode(
      axis: data.dec(_f$axis),
      shrinkWrap: data.dec(_f$shrinkWrap),
      children: data.dec(_f$children),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static CustomScrollViewNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CustomScrollViewNode>(map);
  }

  static CustomScrollViewNode fromJson(String json) {
    return ensureInitialized().decodeJson<CustomScrollViewNode>(json);
  }
}

mixin CustomScrollViewNodeMappable {
  String toJson() {
    return CustomScrollViewNodeMapper.ensureInitialized()
        .encodeJson<CustomScrollViewNode>(this as CustomScrollViewNode);
  }

  Map<String, dynamic> toMap() {
    return CustomScrollViewNodeMapper.ensureInitialized()
        .encodeMap<CustomScrollViewNode>(this as CustomScrollViewNode);
  }

  CustomScrollViewNodeCopyWith<
    CustomScrollViewNode,
    CustomScrollViewNode,
    CustomScrollViewNode
  >
  get copyWith =>
      _CustomScrollViewNodeCopyWithImpl<
        CustomScrollViewNode,
        CustomScrollViewNode
      >(this as CustomScrollViewNode, $identity, $identity);
  @override
  String toString() {
    return CustomScrollViewNodeMapper.ensureInitialized().stringifyValue(
      this as CustomScrollViewNode,
    );
  }

  @override
  bool operator ==(Object other) {
    return CustomScrollViewNodeMapper.ensureInitialized().equalsValue(
      this as CustomScrollViewNode,
      other,
    );
  }

  @override
  int get hashCode {
    return CustomScrollViewNodeMapper.ensureInitialized().hashValue(
      this as CustomScrollViewNode,
    );
  }
}

extension CustomScrollViewNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CustomScrollViewNode, $Out> {
  CustomScrollViewNodeCopyWith<$R, CustomScrollViewNode, $Out>
  get $asCustomScrollViewNode => $base.as(
    (v, t, t2) => _CustomScrollViewNodeCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class CustomScrollViewNodeCopyWith<
  $R,
  $In extends CustomScrollViewNode,
  $Out
>
    implements MCCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, SNode, SNodeCopyWith<$R, SNode, SNode>> get children;
  @override
  $R call({AxisEnum? axis, bool? shrinkWrap, List<SNode>? children});
  CustomScrollViewNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _CustomScrollViewNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CustomScrollViewNode, $Out>
    implements CustomScrollViewNodeCopyWith<$R, CustomScrollViewNode, $Out> {
  _CustomScrollViewNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CustomScrollViewNode> $mapper =
      CustomScrollViewNodeMapper.ensureInitialized();
  @override
  ListCopyWith<$R, SNode, SNodeCopyWith<$R, SNode, SNode>> get children =>
      ListCopyWith(
        $value.children,
        (v, t) => v.copyWith.$chain(t),
        (v) => call(children: v),
      );
  @override
  $R call({
    AxisEnum? axis,
    Object? shrinkWrap = $none,
    List<SNode>? children,
  }) => $apply(
    FieldCopyWithData({
      if (axis != null) #axis: axis,
      if (shrinkWrap != $none) #shrinkWrap: shrinkWrap,
      if (children != null) #children: children,
    }),
  );
  @override
  CustomScrollViewNode $make(CopyWithData data) => CustomScrollViewNode(
    axis: data.get(#axis, or: $value.axis),
    shrinkWrap: data.get(#shrinkWrap, or: $value.shrinkWrap),
    children: data.get(#children, or: $value.children),
  );

  @override
  CustomScrollViewNodeCopyWith<$R2, CustomScrollViewNode, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _CustomScrollViewNodeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

