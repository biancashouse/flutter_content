// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'menu_item_button_node.dart';

class MenuItemButtonNodeMapper extends SubClassMapperBase<MenuItemButtonNode> {
  MenuItemButtonNodeMapper._();

  static MenuItemButtonNodeMapper? _instance;
  static MenuItemButtonNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MenuItemButtonNodeMapper._());
      CLMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'MenuItemButtonNode';

  static String _$itemLabel(MenuItemButtonNode v) => v.itemLabel;
  static const Field<MenuItemButtonNode, String> _f$itemLabel =
      Field('itemLabel', _$itemLabel, opt: true, def: '');
  static String? _$destinationPanelName(MenuItemButtonNode v) =>
      v.destinationPanelName;
  static const Field<MenuItemButtonNode, String> _f$destinationPanelName =
      Field('destinationPanelName', _$destinationPanelName, opt: true);
  static String? _$destinationSnippetName(MenuItemButtonNode v) =>
      v.destinationSnippetName;
  static const Field<MenuItemButtonNode, String> _f$destinationSnippetName =
      Field('destinationSnippetName', _$destinationSnippetName, opt: true);
  static bool _$isExpanded(MenuItemButtonNode v) => v.isExpanded;
  static const Field<MenuItemButtonNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static PTreeNodeTreeController? _$pTreeC(MenuItemButtonNode v) => v.pTreeC;
  static const Field<MenuItemButtonNode, PTreeNodeTreeController> _f$pTreeC =
      Field('pTreeC', _$pTreeC, mode: FieldMode.member);
  static double? _$propertiesPaneScrollPos(MenuItemButtonNode v) =>
      v.propertiesPaneScrollPos;
  static const Field<MenuItemButtonNode, double> _f$propertiesPaneScrollPos =
      Field('propertiesPaneScrollPos', _$propertiesPaneScrollPos,
          mode: FieldMode.member);
  static ScrollController? _$propertiesPaneSC(MenuItemButtonNode v) =>
      v.propertiesPaneSC;
  static const Field<MenuItemButtonNode, ScrollController> _f$propertiesPaneSC =
      Field('propertiesPaneSC', _$propertiesPaneSC, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(MenuItemButtonNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<MenuItemButtonNode, bool> _f$hidePropertiesWhileDragging =
      Field('hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
          mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(
          MenuItemButtonNode v) =>
      v.nodeWidgetGK;
  static const Field<MenuItemButtonNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<MenuItemButtonNode> fields = const {
    #itemLabel: _f$itemLabel,
    #destinationPanelName: _f$destinationPanelName,
    #destinationSnippetName: _f$destinationSnippetName,
    #isExpanded: _f$isExpanded,
    #pTreeC: _f$pTreeC,
    #propertiesPaneScrollPos: _f$propertiesPaneScrollPos,
    #propertiesPaneSC: _f$propertiesPaneSC,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'cl';
  @override
  final dynamic discriminatorValue = 'MenuItemButtonNode';
  @override
  late final ClassMapperBase superMapper = CLMapper.ensureInitialized();

  static MenuItemButtonNode _instantiate(DecodingData data) {
    return MenuItemButtonNode(
        itemLabel: data.dec(_f$itemLabel),
        destinationPanelName: data.dec(_f$destinationPanelName),
        destinationSnippetName: data.dec(_f$destinationSnippetName));
  }

  @override
  final Function instantiate = _instantiate;

  static MenuItemButtonNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MenuItemButtonNode>(map);
  }

  static MenuItemButtonNode fromJson(String json) {
    return ensureInitialized().decodeJson<MenuItemButtonNode>(json);
  }
}

mixin MenuItemButtonNodeMappable {
  String toJson() {
    return MenuItemButtonNodeMapper.ensureInitialized()
        .encodeJson<MenuItemButtonNode>(this as MenuItemButtonNode);
  }

  Map<String, dynamic> toMap() {
    return MenuItemButtonNodeMapper.ensureInitialized()
        .encodeMap<MenuItemButtonNode>(this as MenuItemButtonNode);
  }

  MenuItemButtonNodeCopyWith<MenuItemButtonNode, MenuItemButtonNode,
          MenuItemButtonNode>
      get copyWith => _MenuItemButtonNodeCopyWithImpl(
          this as MenuItemButtonNode, $identity, $identity);
  @override
  String toString() {
    return MenuItemButtonNodeMapper.ensureInitialized()
        .stringifyValue(this as MenuItemButtonNode);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            MenuItemButtonNodeMapper.ensureInitialized()
                .isValueEqual(this as MenuItemButtonNode, other));
  }

  @override
  int get hashCode {
    return MenuItemButtonNodeMapper.ensureInitialized()
        .hashValue(this as MenuItemButtonNode);
  }
}

extension MenuItemButtonNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MenuItemButtonNode, $Out> {
  MenuItemButtonNodeCopyWith<$R, MenuItemButtonNode, $Out>
      get $asMenuItemButtonNode =>
          $base.as((v, t, t2) => _MenuItemButtonNodeCopyWithImpl(v, t, t2));
}

abstract class MenuItemButtonNodeCopyWith<$R, $In extends MenuItemButtonNode,
    $Out> implements CLCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {String? itemLabel,
      String? destinationPanelName,
      String? destinationSnippetName});
  MenuItemButtonNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _MenuItemButtonNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MenuItemButtonNode, $Out>
    implements MenuItemButtonNodeCopyWith<$R, MenuItemButtonNode, $Out> {
  _MenuItemButtonNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MenuItemButtonNode> $mapper =
      MenuItemButtonNodeMapper.ensureInitialized();
  @override
  $R call(
          {String? itemLabel,
          Object? destinationPanelName = $none,
          Object? destinationSnippetName = $none}) =>
      $apply(FieldCopyWithData({
        if (itemLabel != null) #itemLabel: itemLabel,
        if (destinationPanelName != $none)
          #destinationPanelName: destinationPanelName,
        if (destinationSnippetName != $none)
          #destinationSnippetName: destinationSnippetName
      }));
  @override
  MenuItemButtonNode $make(CopyWithData data) => MenuItemButtonNode(
      itemLabel: data.get(#itemLabel, or: $value.itemLabel),
      destinationPanelName:
          data.get(#destinationPanelName, or: $value.destinationPanelName),
      destinationSnippetName:
          data.get(#destinationSnippetName, or: $value.destinationSnippetName));

  @override
  MenuItemButtonNodeCopyWith<$R2, MenuItemButtonNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MenuItemButtonNodeCopyWithImpl($value, $cast, t);
}
