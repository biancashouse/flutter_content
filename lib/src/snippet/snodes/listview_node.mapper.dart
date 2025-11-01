// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'listview_node.dart';

class ListViewNodeMapper extends SubClassMapperBase<ListViewNode> {
  ListViewNodeMapper._();

  static ListViewNodeMapper? _instance;
  static ListViewNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ListViewNodeMapper._());
      BoxScrollViewNodeMapper.ensureInitialized().addSubMapper(_instance!);
      EdgeInsetsValueMapper.ensureInitialized();
      SNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ListViewNode';

  static EdgeInsetsValue? _$padding(ListViewNode v) => v.padding;
  static const Field<ListViewNode, EdgeInsetsValue> _f$padding = Field(
    'padding',
    _$padding,
    opt: true,
  );
  static bool? _$shrinkWrap(ListViewNode v) => v.shrinkWrap;
  static const Field<ListViewNode, bool> _f$shrinkWrap = Field(
    'shrinkWrap',
    _$shrinkWrap,
    opt: true,
  );
  static List<SNode> _$children(ListViewNode v) => v.children;
  static const Field<ListViewNode, List<SNode>> _f$children = Field(
    'children',
    _$children,
  );
  static String _$uid(ListViewNode v) => v.uid;
  static const Field<ListViewNode, String> _f$uid = Field(
    'uid',
    _$uid,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$treeNodeGK(ListViewNode v) =>
      v.treeNodeGK;
  static const Field<ListViewNode, GlobalKey<State<StatefulWidget>>>
  _f$treeNodeGK = Field('treeNodeGK', _$treeNodeGK, mode: FieldMode.member);
  static bool _$isExpanded(ListViewNode v) => v.isExpanded;
  static const Field<ListViewNode, bool> _f$isExpanded = Field(
    'isExpanded',
    _$isExpanded,
    mode: FieldMode.member,
  );
  static bool? _$hidePropertiesWhileDragging(ListViewNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<ListViewNode, bool> _f$hidePropertiesWhileDragging = Field(
    'hidePropertiesWhileDragging',
    _$hidePropertiesWhileDragging,
    mode: FieldMode.member,
  );
  static bool _$canShowTappableNodeWidgetOverlay(ListViewNode v) =>
      v.canShowTappableNodeWidgetOverlay;
  static const Field<ListViewNode, bool> _f$canShowTappableNodeWidgetOverlay =
      Field(
        'canShowTappableNodeWidgetOverlay',
        _$canShowTappableNodeWidgetOverlay,
        mode: FieldMode.member,
      );
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(ListViewNode v) =>
      v.nodeWidgetGK;
  static const Field<ListViewNode, GlobalKey<State<StatefulWidget>>>
  _f$nodeWidgetGK = Field(
    'nodeWidgetGK',
    _$nodeWidgetGK,
    mode: FieldMode.member,
  );
  static AxisEnum _$axis(ListViewNode v) => v.axis;
  static const Field<ListViewNode, AxisEnum> _f$axis = Field(
    'axis',
    _$axis,
    mode: FieldMode.member,
  );
  static String? _$scrollControllerName(ListViewNode v) =>
      v.scrollControllerName;
  static const Field<ListViewNode, String> _f$scrollControllerName = Field(
    'scrollControllerName',
    _$scrollControllerName,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<ListViewNode> fields = const {
    #padding: _f$padding,
    #shrinkWrap: _f$shrinkWrap,
    #children: _f$children,
    #uid: _f$uid,
    #treeNodeGK: _f$treeNodeGK,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #canShowTappableNodeWidgetOverlay: _f$canShowTappableNodeWidgetOverlay,
    #nodeWidgetGK: _f$nodeWidgetGK,
    #axis: _f$axis,
    #scrollControllerName: _f$scrollControllerName,
  };

  @override
  final String discriminatorKey = 'DK:boxscrollview';
  @override
  final dynamic discriminatorValue = 'ListViewNode';
  @override
  late final ClassMapperBase superMapper =
      BoxScrollViewNodeMapper.ensureInitialized();

  @override
  final MappingHook superHook = ChainedHook([
    PropertyRenameHook('cl', 'DK:cl'),
    PropertyRenameHook('snode', 'DK:snode'),
  ]);

  static ListViewNode _instantiate(DecodingData data) {
    return ListViewNode(
      padding: data.dec(_f$padding),
      shrinkWrap: data.dec(_f$shrinkWrap),
      children: data.dec(_f$children),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ListViewNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ListViewNode>(map);
  }

  static ListViewNode fromJson(String json) {
    return ensureInitialized().decodeJson<ListViewNode>(json);
  }
}

mixin ListViewNodeMappable {
  String toJson() {
    return ListViewNodeMapper.ensureInitialized().encodeJson<ListViewNode>(
      this as ListViewNode,
    );
  }

  Map<String, dynamic> toMap() {
    return ListViewNodeMapper.ensureInitialized().encodeMap<ListViewNode>(
      this as ListViewNode,
    );
  }

  ListViewNodeCopyWith<ListViewNode, ListViewNode, ListViewNode> get copyWith =>
      _ListViewNodeCopyWithImpl<ListViewNode, ListViewNode>(
        this as ListViewNode,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ListViewNodeMapper.ensureInitialized().stringifyValue(
      this as ListViewNode,
    );
  }

  @override
  bool operator ==(Object other) {
    return ListViewNodeMapper.ensureInitialized().equalsValue(
      this as ListViewNode,
      other,
    );
  }

  @override
  int get hashCode {
    return ListViewNodeMapper.ensureInitialized().hashValue(
      this as ListViewNode,
    );
  }
}

extension ListViewNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ListViewNode, $Out> {
  ListViewNodeCopyWith<$R, ListViewNode, $Out> get $asListViewNode =>
      $base.as((v, t, t2) => _ListViewNodeCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ListViewNodeCopyWith<$R, $In extends ListViewNode, $Out>
    implements BoxScrollViewNodeCopyWith<$R, $In, $Out> {
  @override
  EdgeInsetsValueCopyWith<$R, EdgeInsetsValue, EdgeInsetsValue>? get padding;
  ListCopyWith<$R, SNode, SNodeCopyWith<$R, SNode, SNode>> get children;
  @override
  $R call({EdgeInsetsValue? padding, bool? shrinkWrap, List<SNode>? children});
  ListViewNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ListViewNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ListViewNode, $Out>
    implements ListViewNodeCopyWith<$R, ListViewNode, $Out> {
  _ListViewNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ListViewNode> $mapper =
      ListViewNodeMapper.ensureInitialized();
  @override
  EdgeInsetsValueCopyWith<$R, EdgeInsetsValue, EdgeInsetsValue>? get padding =>
      $value.padding?.copyWith.$chain((v) => call(padding: v));
  @override
  ListCopyWith<$R, SNode, SNodeCopyWith<$R, SNode, SNode>> get children =>
      ListCopyWith(
        $value.children,
        (v, t) => v.copyWith.$chain(t),
        (v) => call(children: v),
      );
  @override
  $R call({
    Object? padding = $none,
    Object? shrinkWrap = $none,
    List<SNode>? children,
  }) => $apply(
    FieldCopyWithData({
      if (padding != $none) #padding: padding,
      if (shrinkWrap != $none) #shrinkWrap: shrinkWrap,
      if (children != null) #children: children,
    }),
  );
  @override
  ListViewNode $make(CopyWithData data) => ListViewNode(
    padding: data.get(#padding, or: $value.padding),
    shrinkWrap: data.get(#shrinkWrap, or: $value.shrinkWrap),
    children: data.get(#children, or: $value.children),
  );

  @override
  ListViewNodeCopyWith<$R2, ListViewNode, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ListViewNodeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

