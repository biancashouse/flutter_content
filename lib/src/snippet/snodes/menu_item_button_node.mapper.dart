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
      ButtonNodeMapper.ensureInitialized().addSubMapper(_instance!);
      SnippetTemplateEnumMapper.ensureInitialized();
      ButtonStylePropertiesMapper.ensureInitialized();
      CalloutConfigPropertiesMapper.ensureInitialized();
      SNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MenuItemButtonNode';

  static String? _$destinationRoutePathSnippetName(MenuItemButtonNode v) =>
      v.destinationRoutePathSnippetName;
  static const Field<MenuItemButtonNode, String>
      _f$destinationRoutePathSnippetName = Field(
          'destinationRoutePathSnippetName', _$destinationRoutePathSnippetName,
          opt: true);
  static SnippetTemplateEnum? _$template(MenuItemButtonNode v) => v.template;
  static const Field<MenuItemButtonNode, SnippetTemplateEnum> _f$template =
      Field('template', _$template, opt: true);
  static ButtonStyleProperties _$bsPropGroup(MenuItemButtonNode v) =>
      v.bsPropGroup;
  static const Field<MenuItemButtonNode, ButtonStyleProperties> _f$bsPropGroup =
      Field('bsPropGroup', _$bsPropGroup, hook: ButtonStyleHook());
  static String? _$onTapHandlerName(MenuItemButtonNode v) => v.onTapHandlerName;
  static const Field<MenuItemButtonNode, String> _f$onTapHandlerName =
      Field('onTapHandlerName', _$onTapHandlerName, opt: true);
  static CalloutConfigProperties? _$calloutConfigGroup(MenuItemButtonNode v) =>
      v.calloutConfigGroup;
  static const Field<MenuItemButtonNode, CalloutConfigProperties>
      _f$calloutConfigGroup =
      Field('calloutConfigGroup', _$calloutConfigGroup, opt: true);
  static SNode? _$child(MenuItemButtonNode v) => v.child;
  static const Field<MenuItemButtonNode, SNode> _f$child =
      Field('child', _$child, opt: true);
  static String _$uid(MenuItemButtonNode v) => v.uid;
  static const Field<MenuItemButtonNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static bool _$isExpanded(MenuItemButtonNode v) => v.isExpanded;
  static const Field<MenuItemButtonNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(MenuItemButtonNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<MenuItemButtonNode, bool> _f$hidePropertiesWhileDragging =
      Field('hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
          mode: FieldMode.member);

  @override
  final MappableFields<MenuItemButtonNode> fields = const {
    #destinationRoutePathSnippetName: _f$destinationRoutePathSnippetName,
    #template: _f$template,
    #bsPropGroup: _f$bsPropGroup,
    #onTapHandlerName: _f$onTapHandlerName,
    #calloutConfigGroup: _f$calloutConfigGroup,
    #child: _f$child,
    #uid: _f$uid,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
  };

  @override
  final String discriminatorKey = 'button';
  @override
  final dynamic discriminatorValue = 'MenuItemButtonNode';
  @override
  late final ClassMapperBase superMapper = ButtonNodeMapper.ensureInitialized();

  static MenuItemButtonNode _instantiate(DecodingData data) {
    return MenuItemButtonNode(
        destinationRoutePathSnippetName:
            data.dec(_f$destinationRoutePathSnippetName),
        template: data.dec(_f$template),
        bsPropGroup: data.dec(_f$bsPropGroup),
        onTapHandlerName: data.dec(_f$onTapHandlerName),
        calloutConfigGroup: data.dec(_f$calloutConfigGroup),
        child: data.dec(_f$child));
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
    return MenuItemButtonNodeMapper.ensureInitialized()
        .equalsValue(this as MenuItemButtonNode, other);
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
    $Out> implements ButtonNodeCopyWith<$R, $In, $Out> {
  @override
  ButtonStylePropertiesCopyWith<$R, ButtonStyleProperties,
      ButtonStyleProperties> get bsPropGroup;
  @override
  CalloutConfigPropertiesCopyWith<$R, CalloutConfigProperties,
      CalloutConfigProperties>? get calloutConfigGroup;
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child;
  @override
  $R call(
      {String? destinationRoutePathSnippetName,
      SnippetTemplateEnum? template,
      ButtonStyleProperties? bsPropGroup,
      String? onTapHandlerName,
      CalloutConfigProperties? calloutConfigGroup,
      SNode? child});
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
  ButtonStylePropertiesCopyWith<$R, ButtonStyleProperties,
          ButtonStyleProperties>
      get bsPropGroup =>
          $value.bsPropGroup.copyWith.$chain((v) => call(bsPropGroup: v));
  @override
  CalloutConfigPropertiesCopyWith<$R, CalloutConfigProperties,
          CalloutConfigProperties>?
      get calloutConfigGroup => $value.calloutConfigGroup?.copyWith
          .$chain((v) => call(calloutConfigGroup: v));
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child =>
      $value.child?.copyWith.$chain((v) => call(child: v));
  @override
  $R call(
          {Object? destinationRoutePathSnippetName = $none,
          Object? template = $none,
          ButtonStyleProperties? bsPropGroup,
          Object? onTapHandlerName = $none,
          Object? calloutConfigGroup = $none,
          Object? child = $none}) =>
      $apply(FieldCopyWithData({
        if (destinationRoutePathSnippetName != $none)
          #destinationRoutePathSnippetName: destinationRoutePathSnippetName,
        if (template != $none) #template: template,
        if (bsPropGroup != null) #bsPropGroup: bsPropGroup,
        if (onTapHandlerName != $none) #onTapHandlerName: onTapHandlerName,
        if (calloutConfigGroup != $none)
          #calloutConfigGroup: calloutConfigGroup,
        if (child != $none) #child: child
      }));
  @override
  MenuItemButtonNode $make(CopyWithData data) => MenuItemButtonNode(
      destinationRoutePathSnippetName: data.get(
          #destinationRoutePathSnippetName,
          or: $value.destinationRoutePathSnippetName),
      template: data.get(#template, or: $value.template),
      bsPropGroup: data.get(#bsPropGroup, or: $value.bsPropGroup),
      onTapHandlerName:
          data.get(#onTapHandlerName, or: $value.onTapHandlerName),
      calloutConfigGroup:
          data.get(#calloutConfigGroup, or: $value.calloutConfigGroup),
      child: data.get(#child, or: $value.child));

  @override
  MenuItemButtonNodeCopyWith<$R2, MenuItemButtonNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MenuItemButtonNodeCopyWithImpl($value, $cast, t);
}
