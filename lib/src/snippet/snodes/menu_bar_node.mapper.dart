// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'menu_bar_node.dart';

class MenuBarNodeMapper extends SubClassMapperBase<MenuBarNode> {
  MenuBarNodeMapper._();

  static MenuBarNodeMapper? _instance;
  static MenuBarNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MenuBarNodeMapper._());
      MCMapper.ensureInitialized().addSubMapper(_instance!);
      STreeNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MenuBarNode';

  static List<STreeNode> _$children(MenuBarNode v) => v.children;
  static const Field<MenuBarNode, List<STreeNode>> _f$children =
      Field('children', _$children);
  static bool _$isExpanded(MenuBarNode v) => v.isExpanded;
  static const Field<MenuBarNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static PTreeNodeTreeController? _$pTreeC(MenuBarNode v) => v.pTreeC;
  static const Field<MenuBarNode, PTreeNodeTreeController> _f$pTreeC =
      Field('pTreeC', _$pTreeC, mode: FieldMode.member);
  static double? _$propertiesPaneScrollPos(MenuBarNode v) =>
      v.propertiesPaneScrollPos;
  static const Field<MenuBarNode, double> _f$propertiesPaneScrollPos = Field(
      'propertiesPaneScrollPos', _$propertiesPaneScrollPos,
      mode: FieldMode.member);
  static ScrollController? _$propertiesPaneSC(MenuBarNode v) =>
      v.propertiesPaneSC;
  static const Field<MenuBarNode, ScrollController> _f$propertiesPaneSC =
      Field('propertiesPaneSC', _$propertiesPaneSC, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(MenuBarNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<MenuBarNode, bool> _f$hidePropertiesWhileDragging = Field(
      'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
      mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(MenuBarNode v) =>
      v.nodeWidgetGK;
  static const Field<MenuBarNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<MenuBarNode> fields = const {
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
  final dynamic discriminatorValue = 'MenuBarNode';
  @override
  late final ClassMapperBase superMapper = MCMapper.ensureInitialized();

  static MenuBarNode _instantiate(DecodingData data) {
    return MenuBarNode(children: data.dec(_f$children));
  }

  @override
  final Function instantiate = _instantiate;

  static MenuBarNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MenuBarNode>(map);
  }

  static MenuBarNode fromJson(String json) {
    return ensureInitialized().decodeJson<MenuBarNode>(json);
  }
}

mixin MenuBarNodeMappable {
  String toJson() {
    return MenuBarNodeMapper.ensureInitialized()
        .encodeJson<MenuBarNode>(this as MenuBarNode);
  }

  Map<String, dynamic> toMap() {
    return MenuBarNodeMapper.ensureInitialized()
        .encodeMap<MenuBarNode>(this as MenuBarNode);
  }

  MenuBarNodeCopyWith<MenuBarNode, MenuBarNode, MenuBarNode> get copyWith =>
      _MenuBarNodeCopyWithImpl(this as MenuBarNode, $identity, $identity);
  @override
  String toString() {
    return MenuBarNodeMapper.ensureInitialized()
        .stringifyValue(this as MenuBarNode);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            MenuBarNodeMapper.ensureInitialized()
                .isValueEqual(this as MenuBarNode, other));
  }

  @override
  int get hashCode {
    return MenuBarNodeMapper.ensureInitialized().hashValue(this as MenuBarNode);
  }
}

extension MenuBarNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MenuBarNode, $Out> {
  MenuBarNodeCopyWith<$R, MenuBarNode, $Out> get $asMenuBarNode =>
      $base.as((v, t, t2) => _MenuBarNodeCopyWithImpl(v, t, t2));
}

abstract class MenuBarNodeCopyWith<$R, $In extends MenuBarNode, $Out>
    implements MCCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, STreeNode, STreeNodeCopyWith<$R, STreeNode, STreeNode>>
      get children;
  @override
  $R call({List<STreeNode>? children});
  MenuBarNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MenuBarNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MenuBarNode, $Out>
    implements MenuBarNodeCopyWith<$R, MenuBarNode, $Out> {
  _MenuBarNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MenuBarNode> $mapper =
      MenuBarNodeMapper.ensureInitialized();
  @override
  ListCopyWith<$R, STreeNode, STreeNodeCopyWith<$R, STreeNode, STreeNode>>
      get children => ListCopyWith($value.children,
          (v, t) => v.copyWith.$chain(t), (v) => call(children: v));
  @override
  $R call({List<STreeNode>? children}) =>
      $apply(FieldCopyWithData({if (children != null) #children: children}));
  @override
  MenuBarNode $make(CopyWithData data) =>
      MenuBarNode(children: data.get(#children, or: $value.children));

  @override
  MenuBarNodeCopyWith<$R2, MenuBarNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MenuBarNodeCopyWithImpl($value, $cast, t);
}