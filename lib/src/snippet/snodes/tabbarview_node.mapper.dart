// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'tabbarview_node.dart';

class TabBarViewNodeMapper extends SubClassMapperBase<TabBarViewNode> {
  TabBarViewNodeMapper._();

  static TabBarViewNodeMapper? _instance;
  static TabBarViewNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TabBarViewNodeMapper._());
      MCMapper.ensureInitialized().addSubMapper(_instance!);
      STreeNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TabBarViewNode';

  static List<STreeNode> _$children(TabBarViewNode v) => v.children;
  static const Field<TabBarViewNode, List<STreeNode>> _f$children =
      Field('children', _$children);
  static bool _$isExpanded(TabBarViewNode v) => v.isExpanded;
  static const Field<TabBarViewNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static PTreeNodeTreeController? _$pTreeC(TabBarViewNode v) => v.pTreeC;
  static const Field<TabBarViewNode, PTreeNodeTreeController> _f$pTreeC =
      Field('pTreeC', _$pTreeC, mode: FieldMode.member);
  static double? _$propertiesPaneScrollPos(TabBarViewNode v) =>
      v.propertiesPaneScrollPos;
  static const Field<TabBarViewNode, double> _f$propertiesPaneScrollPos = Field(
      'propertiesPaneScrollPos', _$propertiesPaneScrollPos,
      mode: FieldMode.member);
  static ScrollController? _$propertiesPaneSC(TabBarViewNode v) =>
      v.propertiesPaneSC;
  static const Field<TabBarViewNode, ScrollController> _f$propertiesPaneSC =
      Field('propertiesPaneSC', _$propertiesPaneSC, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(TabBarViewNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<TabBarViewNode, bool> _f$hidePropertiesWhileDragging =
      Field('hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
          mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(TabBarViewNode v) =>
      v.nodeWidgetGK;
  static const Field<TabBarViewNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<TabBarViewNode> fields = const {
    #children: _f$children,
    #isExpanded: _f$isExpanded,
    #pTreeC: _f$pTreeC,
    #propertiesPaneScrollPos: _f$propertiesPaneScrollPos,
    #propertiesPaneSC: _f$propertiesPaneSC,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'mc';
  @override
  final dynamic discriminatorValue = 'TabBarViewNode';
  @override
  late final ClassMapperBase superMapper = MCMapper.ensureInitialized();

  static TabBarViewNode _instantiate(DecodingData data) {
    return TabBarViewNode(children: data.dec(_f$children));
  }

  @override
  final Function instantiate = _instantiate;

  static TabBarViewNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TabBarViewNode>(map);
  }

  static TabBarViewNode fromJson(String json) {
    return ensureInitialized().decodeJson<TabBarViewNode>(json);
  }
}

mixin TabBarViewNodeMappable {
  String toJson() {
    return TabBarViewNodeMapper.ensureInitialized()
        .encodeJson<TabBarViewNode>(this as TabBarViewNode);
  }

  Map<String, dynamic> toMap() {
    return TabBarViewNodeMapper.ensureInitialized()
        .encodeMap<TabBarViewNode>(this as TabBarViewNode);
  }

  TabBarViewNodeCopyWith<TabBarViewNode, TabBarViewNode, TabBarViewNode>
      get copyWith => _TabBarViewNodeCopyWithImpl(
          this as TabBarViewNode, $identity, $identity);
  @override
  String toString() {
    return TabBarViewNodeMapper.ensureInitialized()
        .stringifyValue(this as TabBarViewNode);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            TabBarViewNodeMapper.ensureInitialized()
                .isValueEqual(this as TabBarViewNode, other));
  }

  @override
  int get hashCode {
    return TabBarViewNodeMapper.ensureInitialized()
        .hashValue(this as TabBarViewNode);
  }
}

extension TabBarViewNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TabBarViewNode, $Out> {
  TabBarViewNodeCopyWith<$R, TabBarViewNode, $Out> get $asTabBarViewNode =>
      $base.as((v, t, t2) => _TabBarViewNodeCopyWithImpl(v, t, t2));
}

abstract class TabBarViewNodeCopyWith<$R, $In extends TabBarViewNode, $Out>
    implements MCCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, STreeNode, STreeNodeCopyWith<$R, STreeNode, STreeNode>>
      get children;
  @override
  $R call({List<STreeNode>? children});
  TabBarViewNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TabBarViewNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TabBarViewNode, $Out>
    implements TabBarViewNodeCopyWith<$R, TabBarViewNode, $Out> {
  _TabBarViewNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TabBarViewNode> $mapper =
      TabBarViewNodeMapper.ensureInitialized();
  @override
  ListCopyWith<$R, STreeNode, STreeNodeCopyWith<$R, STreeNode, STreeNode>>
      get children => ListCopyWith($value.children,
          (v, t) => v.copyWith.$chain(t), (v) => call(children: v));
  @override
  $R call({List<STreeNode>? children}) =>
      $apply(FieldCopyWithData({if (children != null) #children: children}));
  @override
  TabBarViewNode $make(CopyWithData data) =>
      TabBarViewNode(children: data.get(#children, or: $value.children));

  @override
  TabBarViewNodeCopyWith<$R2, TabBarViewNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TabBarViewNodeCopyWithImpl($value, $cast, t);
}