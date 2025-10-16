// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'menu_bar_node.dart';

class MenuBarNodeMapper extends SubClassMapperBase<MenuBarNode> {
  MenuBarNodeMapper._();

  static MenuBarNodeMapper? _instance;
  static MenuBarNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MenuBarNodeMapper._());
      MCMapper.ensureInitialized().addSubMapper(_instance!);
      SNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MenuBarNode';

  static double? _$width(MenuBarNode v) => v.width;
  static const Field<MenuBarNode, double> _f$width = Field(
    'width',
    _$width,
    opt: true,
  );
  static double? _$height(MenuBarNode v) => v.height;
  static const Field<MenuBarNode, double> _f$height = Field(
    'height',
    _$height,
    opt: true,
  );
  static List<SNode> _$children(MenuBarNode v) => v.children;
  static const Field<MenuBarNode, List<SNode>> _f$children = Field(
    'children',
    _$children,
  );
  static String _$uid(MenuBarNode v) => v.uid;
  static const Field<MenuBarNode, String> _f$uid = Field(
    'uid',
    _$uid,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$treeNodeGK(MenuBarNode v) =>
      v.treeNodeGK;
  static const Field<MenuBarNode, GlobalKey<State<StatefulWidget>>>
  _f$treeNodeGK = Field('treeNodeGK', _$treeNodeGK, mode: FieldMode.member);
  static bool _$isExpanded(MenuBarNode v) => v.isExpanded;
  static const Field<MenuBarNode, bool> _f$isExpanded = Field(
    'isExpanded',
    _$isExpanded,
    mode: FieldMode.member,
  );
  static bool? _$hidePropertiesWhileDragging(MenuBarNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<MenuBarNode, bool> _f$hidePropertiesWhileDragging = Field(
    'hidePropertiesWhileDragging',
    _$hidePropertiesWhileDragging,
    mode: FieldMode.member,
  );
  static bool _$canShowTappableNodeWidgetOverlay(MenuBarNode v) =>
      v.canShowTappableNodeWidgetOverlay;
  static const Field<MenuBarNode, bool> _f$canShowTappableNodeWidgetOverlay =
      Field(
        'canShowTappableNodeWidgetOverlay',
        _$canShowTappableNodeWidgetOverlay,
        mode: FieldMode.member,
      );
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(MenuBarNode v) =>
      v.nodeWidgetGK;
  static const Field<MenuBarNode, GlobalKey<State<StatefulWidget>>>
  _f$nodeWidgetGK = Field(
    'nodeWidgetGK',
    _$nodeWidgetGK,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<MenuBarNode> fields = const {
    #width: _f$width,
    #height: _f$height,
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
  final dynamic discriminatorValue = 'MenuBarNode';
  @override
  late final ClassMapperBase superMapper = MCMapper.ensureInitialized();

  static MenuBarNode _instantiate(DecodingData data) {
    return MenuBarNode(
      width: data.dec(_f$width),
      height: data.dec(_f$height),
      children: data.dec(_f$children),
    );
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
    return MenuBarNodeMapper.ensureInitialized().encodeJson<MenuBarNode>(
      this as MenuBarNode,
    );
  }

  Map<String, dynamic> toMap() {
    return MenuBarNodeMapper.ensureInitialized().encodeMap<MenuBarNode>(
      this as MenuBarNode,
    );
  }

  MenuBarNodeCopyWith<MenuBarNode, MenuBarNode, MenuBarNode> get copyWith =>
      _MenuBarNodeCopyWithImpl<MenuBarNode, MenuBarNode>(
        this as MenuBarNode,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return MenuBarNodeMapper.ensureInitialized().stringifyValue(
      this as MenuBarNode,
    );
  }

  @override
  bool operator ==(Object other) {
    return MenuBarNodeMapper.ensureInitialized().equalsValue(
      this as MenuBarNode,
      other,
    );
  }

  @override
  int get hashCode {
    return MenuBarNodeMapper.ensureInitialized().hashValue(this as MenuBarNode);
  }
}

extension MenuBarNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MenuBarNode, $Out> {
  MenuBarNodeCopyWith<$R, MenuBarNode, $Out> get $asMenuBarNode =>
      $base.as((v, t, t2) => _MenuBarNodeCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class MenuBarNodeCopyWith<$R, $In extends MenuBarNode, $Out>
    implements MCCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, SNode, SNodeCopyWith<$R, SNode, SNode>> get children;
  @override
  $R call({double? width, double? height, List<SNode>? children});
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
  ListCopyWith<$R, SNode, SNodeCopyWith<$R, SNode, SNode>> get children =>
      ListCopyWith(
        $value.children,
        (v, t) => v.copyWith.$chain(t),
        (v) => call(children: v),
      );
  @override
  $R call({
    Object? width = $none,
    Object? height = $none,
    List<SNode>? children,
  }) => $apply(
    FieldCopyWithData({
      if (width != $none) #width: width,
      if (height != $none) #height: height,
      if (children != null) #children: children,
    }),
  );
  @override
  MenuBarNode $make(CopyWithData data) => MenuBarNode(
    width: data.get(#width, or: $value.width),
    height: data.get(#height, or: $value.height),
    children: data.get(#children, or: $value.children),
  );

  @override
  MenuBarNodeCopyWith<$R2, MenuBarNode, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _MenuBarNodeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

