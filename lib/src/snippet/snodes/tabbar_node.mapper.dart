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
      EdgeInsetsValueMapper.ensureInitialized();
      STreeNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TabBarNode';

  static int? _$selectedLabelColorValue(TabBarNode v) =>
      v.selectedLabelColorValue;
  static const Field<TabBarNode, int> _f$selectedLabelColorValue =
      Field('selectedLabelColorValue', _$selectedLabelColorValue, opt: true);
  static int? _$unselectedLabelColorValue(TabBarNode v) =>
      v.unselectedLabelColorValue;
  static const Field<TabBarNode, int> _f$unselectedLabelColorValue = Field(
      'unselectedLabelColorValue', _$unselectedLabelColorValue,
      opt: true);
  static int? _$indicatorColorValue(TabBarNode v) => v.indicatorColorValue;
  static const Field<TabBarNode, int> _f$indicatorColorValue =
      Field('indicatorColorValue', _$indicatorColorValue, opt: true);
  static EdgeInsetsValue? _$padding(TabBarNode v) => v.padding;
  static const Field<TabBarNode, EdgeInsetsValue> _f$padding =
      Field('padding', _$padding, opt: true);
  static double? _$indicatorWeight(TabBarNode v) => v.indicatorWeight;
  static const Field<TabBarNode, double> _f$indicatorWeight =
      Field('indicatorWeight', _$indicatorWeight, opt: true, def: 2.0);
  static int? _$selection(TabBarNode v) => v.selection;
  static const Field<TabBarNode, int> _f$selection =
      Field('selection', _$selection, opt: true);
  static List<STreeNode> _$children(TabBarNode v) => v.children;
  static const Field<TabBarNode, List<STreeNode>> _f$children =
      Field('children', _$children);
  static bool _$isExpanded(TabBarNode v) => v.isExpanded;
  static const Field<TabBarNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(TabBarNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<TabBarNode, bool> _f$hidePropertiesWhileDragging = Field(
      'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
      mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(TabBarNode v) =>
      v.nodeWidgetGK;
  static const Field<TabBarNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<TabBarNode> fields = const {
    #selectedLabelColorValue: _f$selectedLabelColorValue,
    #unselectedLabelColorValue: _f$unselectedLabelColorValue,
    #indicatorColorValue: _f$indicatorColorValue,
    #padding: _f$padding,
    #indicatorWeight: _f$indicatorWeight,
    #selection: _f$selection,
    #children: _f$children,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'mc';
  @override
  final dynamic discriminatorValue = 'TabBarNode';
  @override
  late final ClassMapperBase superMapper = MCMapper.ensureInitialized();

  static TabBarNode _instantiate(DecodingData data) {
    return TabBarNode(
        selectedLabelColorValue: data.dec(_f$selectedLabelColorValue),
        unselectedLabelColorValue: data.dec(_f$unselectedLabelColorValue),
        indicatorColorValue: data.dec(_f$indicatorColorValue),
        padding: data.dec(_f$padding),
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
      _TabBarNodeCopyWithImpl(this as TabBarNode, $identity, $identity);
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
      $base.as((v, t, t2) => _TabBarNodeCopyWithImpl(v, t, t2));
}

abstract class TabBarNodeCopyWith<$R, $In extends TabBarNode, $Out>
    implements MCCopyWith<$R, $In, $Out> {
  EdgeInsetsValueCopyWith<$R, EdgeInsetsValue, EdgeInsetsValue>? get padding;
  @override
  ListCopyWith<$R, STreeNode, STreeNodeCopyWith<$R, STreeNode, STreeNode>>
      get children;
  @override
  $R call(
      {int? selectedLabelColorValue,
      int? unselectedLabelColorValue,
      int? indicatorColorValue,
      EdgeInsetsValue? padding,
      double? indicatorWeight,
      int? selection,
      List<STreeNode>? children});
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
  EdgeInsetsValueCopyWith<$R, EdgeInsetsValue, EdgeInsetsValue>? get padding =>
      $value.padding?.copyWith.$chain((v) => call(padding: v));
  @override
  ListCopyWith<$R, STreeNode, STreeNodeCopyWith<$R, STreeNode, STreeNode>>
      get children => ListCopyWith($value.children,
          (v, t) => v.copyWith.$chain(t), (v) => call(children: v));
  @override
  $R call(
          {Object? selectedLabelColorValue = $none,
          Object? unselectedLabelColorValue = $none,
          Object? indicatorColorValue = $none,
          Object? padding = $none,
          Object? indicatorWeight = $none,
          Object? selection = $none,
          List<STreeNode>? children}) =>
      $apply(FieldCopyWithData({
        if (selectedLabelColorValue != $none)
          #selectedLabelColorValue: selectedLabelColorValue,
        if (unselectedLabelColorValue != $none)
          #unselectedLabelColorValue: unselectedLabelColorValue,
        if (indicatorColorValue != $none)
          #indicatorColorValue: indicatorColorValue,
        if (padding != $none) #padding: padding,
        if (indicatorWeight != $none) #indicatorWeight: indicatorWeight,
        if (selection != $none) #selection: selection,
        if (children != null) #children: children
      }));
  @override
  TabBarNode $make(CopyWithData data) => TabBarNode(
      selectedLabelColorValue: data.get(#selectedLabelColorValue,
          or: $value.selectedLabelColorValue),
      unselectedLabelColorValue: data.get(#unselectedLabelColorValue,
          or: $value.unselectedLabelColorValue),
      indicatorColorValue:
          data.get(#indicatorColorValue, or: $value.indicatorColorValue),
      padding: data.get(#padding, or: $value.padding),
      indicatorWeight: data.get(#indicatorWeight, or: $value.indicatorWeight),
      selection: data.get(#selection, or: $value.selection),
      children: data.get(#children, or: $value.children));

  @override
  TabBarNodeCopyWith<$R2, TabBarNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TabBarNodeCopyWithImpl($value, $cast, t);
}
