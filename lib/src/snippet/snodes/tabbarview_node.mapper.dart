// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'tabbarview_node.dart';

class TabBarViewNodeMapper extends SubClassMapperBase<TabBarViewNode> {
  TabBarViewNodeMapper._();

  static TabBarViewNodeMapper? _instance;
  static TabBarViewNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TabBarViewNodeMapper._());
      MCMapper.ensureInitialized().addSubMapper(_instance!);
      SNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TabBarViewNode';

  static String _$tabBarName(TabBarViewNode v) => v.tabBarName;
  static const Field<TabBarViewNode, String> _f$tabBarName =
      Field('tabBarName', _$tabBarName);
  static List<SNode> _$children(TabBarViewNode v) => v.children;
  static const Field<TabBarViewNode, List<SNode>> _f$children =
      Field('children', _$children);
  static String _$uid(TabBarViewNode v) => v.uid;
  static const Field<TabBarViewNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$treeNodeGK(TabBarViewNode v) =>
      v.treeNodeGK;
  static const Field<TabBarViewNode, GlobalKey<State<StatefulWidget>>>
      _f$treeNodeGK = Field('treeNodeGK', _$treeNodeGK, mode: FieldMode.member);
  static bool _$isExpanded(TabBarViewNode v) => v.isExpanded;
  static const Field<TabBarViewNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(TabBarViewNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<TabBarViewNode, bool> _f$hidePropertiesWhileDragging =
      Field('hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
          mode: FieldMode.member);

  @override
  final MappableFields<TabBarViewNode> fields = const {
    #tabBarName: _f$tabBarName,
    #children: _f$children,
    #uid: _f$uid,
    #treeNodeGK: _f$treeNodeGK,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
  };

  @override
  final String discriminatorKey = 'mc';
  @override
  final dynamic discriminatorValue = 'TabBarViewNode';
  @override
  late final ClassMapperBase superMapper = MCMapper.ensureInitialized();

  static TabBarViewNode _instantiate(DecodingData data) {
    return TabBarViewNode(
        tabBarName: data.dec(_f$tabBarName), children: data.dec(_f$children));
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
      get copyWith =>
          _TabBarViewNodeCopyWithImpl<TabBarViewNode, TabBarViewNode>(
              this as TabBarViewNode, $identity, $identity);
  @override
  String toString() {
    return TabBarViewNodeMapper.ensureInitialized()
        .stringifyValue(this as TabBarViewNode);
  }

  @override
  bool operator ==(Object other) {
    return TabBarViewNodeMapper.ensureInitialized()
        .equalsValue(this as TabBarViewNode, other);
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
      $base.as((v, t, t2) => _TabBarViewNodeCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TabBarViewNodeCopyWith<$R, $In extends TabBarViewNode, $Out>
    implements MCCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, SNode, SNodeCopyWith<$R, SNode, SNode>> get children;
  @override
  $R call({String? tabBarName, List<SNode>? children});
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
  ListCopyWith<$R, SNode, SNodeCopyWith<$R, SNode, SNode>> get children =>
      ListCopyWith($value.children, (v, t) => v.copyWith.$chain(t),
          (v) => call(children: v));
  @override
  $R call({String? tabBarName, List<SNode>? children}) =>
      $apply(FieldCopyWithData({
        if (tabBarName != null) #tabBarName: tabBarName,
        if (children != null) #children: children
      }));
  @override
  TabBarViewNode $make(CopyWithData data) => TabBarViewNode(
      tabBarName: data.get(#tabBarName, or: $value.tabBarName),
      children: data.get(#children, or: $value.children));

  @override
  TabBarViewNodeCopyWith<$R2, TabBarViewNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TabBarViewNodeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
