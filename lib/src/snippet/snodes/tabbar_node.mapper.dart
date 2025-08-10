// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'tabbar_node.dart';

class TabBarNodeMapper extends SubClassMapperBase<TabBarNode> {
  TabBarNodeMapper._();

  static TabBarNodeMapper? _instance;
  static TabBarNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TabBarNodeMapper._());
      MCMapper.ensureInitialized().addSubMapper(_instance!);
      ColorModelMapper.ensureInitialized();
      TextStylePropertiesMapper.ensureInitialized();
      SNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TabBarNode';

  static String _$name(TabBarNode v) => v.name;
  static const Field<TabBarNode, String> _f$name = Field('name', _$name);
  static ColorModel? _$bgColor(TabBarNode v) => v.bgColor;
  static const Field<TabBarNode, ColorModel> _f$bgColor =
      Field('bgColor', _$bgColor, opt: true);
  static TextStyleProperties _$labelTSPropGroup(TabBarNode v) =>
      v.labelTSPropGroup;
  static const Field<TabBarNode, TextStyleProperties> _f$labelTSPropGroup =
      Field('labelTSPropGroup', _$labelTSPropGroup);
  static ColorModel? _$selectedLabelColor(TabBarNode v) => v.selectedLabelColor;
  static const Field<TabBarNode, ColorModel> _f$selectedLabelColor =
      Field('selectedLabelColor', _$selectedLabelColor, opt: true);
  static ColorModel? _$unselectedLabelColor(TabBarNode v) =>
      v.unselectedLabelColor;
  static const Field<TabBarNode, ColorModel> _f$unselectedLabelColor =
      Field('unselectedLabelColor', _$unselectedLabelColor, opt: true);
  static ColorModel? _$indicatorColor(TabBarNode v) => v.indicatorColor;
  static const Field<TabBarNode, ColorModel> _f$indicatorColor =
      Field('indicatorColor', _$indicatorColor, opt: true);
  static double? _$indicatorWeight(TabBarNode v) => v.indicatorWeight;
  static const Field<TabBarNode, double> _f$indicatorWeight =
      Field('indicatorWeight', _$indicatorWeight, opt: true, def: 2.0);
  static int? _$selection(TabBarNode v) => v.selection;
  static const Field<TabBarNode, int> _f$selection =
      Field('selection', _$selection, opt: true);
  static List<SNode> _$children(TabBarNode v) => v.children;
  static const Field<TabBarNode, List<SNode>> _f$children =
      Field('children', _$children);
  static String _$uid(TabBarNode v) => v.uid;
  static const Field<TabBarNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$treeNodeGK(TabBarNode v) =>
      v.treeNodeGK;
  static const Field<TabBarNode, GlobalKey<State<StatefulWidget>>>
      _f$treeNodeGK = Field('treeNodeGK', _$treeNodeGK, mode: FieldMode.member);
  static bool _$isExpanded(TabBarNode v) => v.isExpanded;
  static const Field<TabBarNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(TabBarNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<TabBarNode, bool> _f$hidePropertiesWhileDragging = Field(
      'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
      mode: FieldMode.member);
  static TabController? _$tabC(TabBarNode v) => v.tabC;
  static const Field<TabBarNode, TabController> _f$tabC =
      Field('tabC', _$tabC, mode: FieldMode.member);
  static List<int> _$prevTabQ(TabBarNode v) => v.prevTabQ;
  static const Field<TabBarNode, List<int>> _f$prevTabQ =
      Field('prevTabQ', _$prevTabQ, mode: FieldMode.member);
  static ValueNotifier<int> _$prevTabQSize(TabBarNode v) => v.prevTabQSize;
  static const Field<TabBarNode, ValueNotifier<int>> _f$prevTabQSize =
      Field('prevTabQSize', _$prevTabQSize, mode: FieldMode.member);
  static bool? _$backBtnPressed(TabBarNode v) => v.backBtnPressed;
  static const Field<TabBarNode, bool> _f$backBtnPressed =
      Field('backBtnPressed', _$backBtnPressed, mode: FieldMode.member);

  @override
  final MappableFields<TabBarNode> fields = const {
    #name: _f$name,
    #bgColor: _f$bgColor,
    #labelTSPropGroup: _f$labelTSPropGroup,
    #selectedLabelColor: _f$selectedLabelColor,
    #unselectedLabelColor: _f$unselectedLabelColor,
    #indicatorColor: _f$indicatorColor,
    #indicatorWeight: _f$indicatorWeight,
    #selection: _f$selection,
    #children: _f$children,
    #uid: _f$uid,
    #treeNodeGK: _f$treeNodeGK,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #tabC: _f$tabC,
    #prevTabQ: _f$prevTabQ,
    #prevTabQSize: _f$prevTabQSize,
    #backBtnPressed: _f$backBtnPressed,
  };

  @override
  final String discriminatorKey = 'mc';
  @override
  final dynamic discriminatorValue = 'TabBarNode';
  @override
  late final ClassMapperBase superMapper = MCMapper.ensureInitialized();

  static TabBarNode _instantiate(DecodingData data) {
    return TabBarNode(
        name: data.dec(_f$name),
        bgColor: data.dec(_f$bgColor),
        labelTSPropGroup: data.dec(_f$labelTSPropGroup),
        selectedLabelColor: data.dec(_f$selectedLabelColor),
        unselectedLabelColor: data.dec(_f$unselectedLabelColor),
        indicatorColor: data.dec(_f$indicatorColor),
        indicatorWeight: data.dec(_f$indicatorWeight),
        selection: data.dec(_f$selection),
        children: data.dec(_f$children));
  }

  @override
  final Function instantiate = _instantiate;

  static TabBarNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TabBarNode>(map);
  }

  static TabBarNode fromJson(String json) {
    return ensureInitialized().decodeJson<TabBarNode>(json);
  }
}

mixin TabBarNodeMappable {
  String toJson() {
    return TabBarNodeMapper.ensureInitialized()
        .encodeJson<TabBarNode>(this as TabBarNode);
  }

  Map<String, dynamic> toMap() {
    return TabBarNodeMapper.ensureInitialized()
        .encodeMap<TabBarNode>(this as TabBarNode);
  }

  TabBarNodeCopyWith<TabBarNode, TabBarNode, TabBarNode> get copyWith =>
      _TabBarNodeCopyWithImpl<TabBarNode, TabBarNode>(
          this as TabBarNode, $identity, $identity);
  @override
  String toString() {
    return TabBarNodeMapper.ensureInitialized()
        .stringifyValue(this as TabBarNode);
  }

  @override
  bool operator ==(Object other) {
    return TabBarNodeMapper.ensureInitialized()
        .equalsValue(this as TabBarNode, other);
  }

  @override
  int get hashCode {
    return TabBarNodeMapper.ensureInitialized().hashValue(this as TabBarNode);
  }
}

extension TabBarNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TabBarNode, $Out> {
  TabBarNodeCopyWith<$R, TabBarNode, $Out> get $asTabBarNode =>
      $base.as((v, t, t2) => _TabBarNodeCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TabBarNodeCopyWith<$R, $In extends TabBarNode, $Out>
    implements MCCopyWith<$R, $In, $Out> {
  ColorModelCopyWith<$R, ColorModel, ColorModel>? get bgColor;
  TextStylePropertiesCopyWith<$R, TextStyleProperties, TextStyleProperties>
      get labelTSPropGroup;
  ColorModelCopyWith<$R, ColorModel, ColorModel>? get selectedLabelColor;
  ColorModelCopyWith<$R, ColorModel, ColorModel>? get unselectedLabelColor;
  ColorModelCopyWith<$R, ColorModel, ColorModel>? get indicatorColor;
  @override
  ListCopyWith<$R, SNode, SNodeCopyWith<$R, SNode, SNode>> get children;
  @override
  $R call(
      {String? name,
      ColorModel? bgColor,
      TextStyleProperties? labelTSPropGroup,
      ColorModel? selectedLabelColor,
      ColorModel? unselectedLabelColor,
      ColorModel? indicatorColor,
      double? indicatorWeight,
      int? selection,
      List<SNode>? children});
  TabBarNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TabBarNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TabBarNode, $Out>
    implements TabBarNodeCopyWith<$R, TabBarNode, $Out> {
  _TabBarNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TabBarNode> $mapper =
      TabBarNodeMapper.ensureInitialized();
  @override
  ColorModelCopyWith<$R, ColorModel, ColorModel>? get bgColor =>
      $value.bgColor?.copyWith.$chain((v) => call(bgColor: v));
  @override
  TextStylePropertiesCopyWith<$R, TextStyleProperties, TextStyleProperties>
      get labelTSPropGroup => $value.labelTSPropGroup.copyWith
          .$chain((v) => call(labelTSPropGroup: v));
  @override
  ColorModelCopyWith<$R, ColorModel, ColorModel>? get selectedLabelColor =>
      $value.selectedLabelColor?.copyWith
          .$chain((v) => call(selectedLabelColor: v));
  @override
  ColorModelCopyWith<$R, ColorModel, ColorModel>? get unselectedLabelColor =>
      $value.unselectedLabelColor?.copyWith
          .$chain((v) => call(unselectedLabelColor: v));
  @override
  ColorModelCopyWith<$R, ColorModel, ColorModel>? get indicatorColor =>
      $value.indicatorColor?.copyWith.$chain((v) => call(indicatorColor: v));
  @override
  ListCopyWith<$R, SNode, SNodeCopyWith<$R, SNode, SNode>> get children =>
      ListCopyWith($value.children, (v, t) => v.copyWith.$chain(t),
          (v) => call(children: v));
  @override
  $R call(
          {String? name,
          Object? bgColor = $none,
          TextStyleProperties? labelTSPropGroup,
          Object? selectedLabelColor = $none,
          Object? unselectedLabelColor = $none,
          Object? indicatorColor = $none,
          Object? indicatorWeight = $none,
          Object? selection = $none,
          List<SNode>? children}) =>
      $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (bgColor != $none) #bgColor: bgColor,
        if (labelTSPropGroup != null) #labelTSPropGroup: labelTSPropGroup,
        if (selectedLabelColor != $none)
          #selectedLabelColor: selectedLabelColor,
        if (unselectedLabelColor != $none)
          #unselectedLabelColor: unselectedLabelColor,
        if (indicatorColor != $none) #indicatorColor: indicatorColor,
        if (indicatorWeight != $none) #indicatorWeight: indicatorWeight,
        if (selection != $none) #selection: selection,
        if (children != null) #children: children
      }));
  @override
  TabBarNode $make(CopyWithData data) => TabBarNode(
      name: data.get(#name, or: $value.name),
      bgColor: data.get(#bgColor, or: $value.bgColor),
      labelTSPropGroup:
          data.get(#labelTSPropGroup, or: $value.labelTSPropGroup),
      selectedLabelColor:
          data.get(#selectedLabelColor, or: $value.selectedLabelColor),
      unselectedLabelColor:
          data.get(#unselectedLabelColor, or: $value.unselectedLabelColor),
      indicatorColor: data.get(#indicatorColor, or: $value.indicatorColor),
      indicatorWeight: data.get(#indicatorWeight, or: $value.indicatorWeight),
      selection: data.get(#selection, or: $value.selection),
      children: data.get(#children, or: $value.children));

  @override
  TabBarNodeCopyWith<$R2, TabBarNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TabBarNodeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
