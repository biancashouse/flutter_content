// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'icon_button_node.dart';

class IconButtonNodeMapper extends SubClassMapperBase<IconButtonNode> {
  IconButtonNodeMapper._();

  static IconButtonNodeMapper? _instance;
  static IconButtonNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = IconButtonNodeMapper._());
      ButtonNodeMapper.ensureInitialized().addSubMapper(_instance!);
      SnippetTemplateEnumMapper.ensureInitialized();
      ButtonStylePropertiesMapper.ensureInitialized();
      CalloutConfigModelMapper.ensureInitialized();
      SNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'IconButtonNode';

  static int? _$iconCodePoint(IconButtonNode v) => v.iconCodePoint;
  static const Field<IconButtonNode, int> _f$iconCodePoint =
      Field('iconCodePoint', _$iconCodePoint, opt: true);
  static String? _$iconFontFamily(IconButtonNode v) => v.iconFontFamily;
  static const Field<IconButtonNode, String> _f$iconFontFamily =
      Field('iconFontFamily', _$iconFontFamily, opt: true);
  static String? _$iconFontPackage(IconButtonNode v) => v.iconFontPackage;
  static const Field<IconButtonNode, String> _f$iconFontPackage =
      Field('iconFontPackage', _$iconFontPackage, opt: true);
  static int? _$iconColor(IconButtonNode v) => v.iconColor;
  static const Field<IconButtonNode, int> _f$iconColor =
      Field('iconColor', _$iconColor, opt: true);
  static double? _$iconSize(IconButtonNode v) => v.iconSize;
  static const Field<IconButtonNode, double> _f$iconSize =
      Field('iconSize', _$iconSize, opt: true);
  static String? _$destinationRoutePathSnippetName(IconButtonNode v) =>
      v.destinationRoutePathSnippetName;
  static const Field<IconButtonNode, String>
      _f$destinationRoutePathSnippetName = Field(
          'destinationRoutePathSnippetName', _$destinationRoutePathSnippetName,
          opt: true);
  static SnippetTemplateEnum? _$template(IconButtonNode v) => v.template;
  static const Field<IconButtonNode, SnippetTemplateEnum> _f$template =
      Field('template', _$template, opt: true);
  static ButtonStyleProperties _$bsPropGroup(IconButtonNode v) => v.bsPropGroup;
  static const Field<IconButtonNode, ButtonStyleProperties> _f$bsPropGroup =
      Field('bsPropGroup', _$bsPropGroup, hook: ButtonStyleHook());
  static String? _$onTapHandlerName(IconButtonNode v) => v.onTapHandlerName;
  static const Field<IconButtonNode, String> _f$onTapHandlerName =
      Field('onTapHandlerName', _$onTapHandlerName, opt: true);
  static CalloutConfigModel? _$calloutConfig(IconButtonNode v) =>
      v.calloutConfig;
  static const Field<IconButtonNode, CalloutConfigModel> _f$calloutConfig =
      Field('calloutConfig', _$calloutConfig, opt: true);
  static SNode? _$child(IconButtonNode v) => v.child;
  static const Field<IconButtonNode, SNode> _f$child =
      Field('child', _$child, opt: true);
  static String _$uid(IconButtonNode v) => v.uid;
  static const Field<IconButtonNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$treeNodeGK(IconButtonNode v) =>
      v.treeNodeGK;
  static const Field<IconButtonNode, GlobalKey<State<StatefulWidget>>>
      _f$treeNodeGK = Field('treeNodeGK', _$treeNodeGK, mode: FieldMode.member);
  static bool _$isExpanded(IconButtonNode v) => v.isExpanded;
  static const Field<IconButtonNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(IconButtonNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<IconButtonNode, bool> _f$hidePropertiesWhileDragging =
      Field('hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
          mode: FieldMode.member);

  @override
  final MappableFields<IconButtonNode> fields = const {
    #iconCodePoint: _f$iconCodePoint,
    #iconFontFamily: _f$iconFontFamily,
    #iconFontPackage: _f$iconFontPackage,
    #iconColor: _f$iconColor,
    #iconSize: _f$iconSize,
    #destinationRoutePathSnippetName: _f$destinationRoutePathSnippetName,
    #template: _f$template,
    #bsPropGroup: _f$bsPropGroup,
    #onTapHandlerName: _f$onTapHandlerName,
    #calloutConfig: _f$calloutConfig,
    #child: _f$child,
    #uid: _f$uid,
    #treeNodeGK: _f$treeNodeGK,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
  };

  @override
  final String discriminatorKey = 'button';
  @override
  final dynamic discriminatorValue = 'IconButtonNode';
  @override
  late final ClassMapperBase superMapper = ButtonNodeMapper.ensureInitialized();

  static IconButtonNode _instantiate(DecodingData data) {
    return IconButtonNode(
        iconCodePoint: data.dec(_f$iconCodePoint),
        iconFontFamily: data.dec(_f$iconFontFamily),
        iconFontPackage: data.dec(_f$iconFontPackage),
        iconColor: data.dec(_f$iconColor),
        iconSize: data.dec(_f$iconSize),
        destinationRoutePathSnippetName:
            data.dec(_f$destinationRoutePathSnippetName),
        template: data.dec(_f$template),
        bsPropGroup: data.dec(_f$bsPropGroup),
        onTapHandlerName: data.dec(_f$onTapHandlerName),
        calloutConfig: data.dec(_f$calloutConfig),
        child: data.dec(_f$child));
  }

  @override
  final Function instantiate = _instantiate;

  static IconButtonNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<IconButtonNode>(map);
  }

  static IconButtonNode fromJson(String json) {
    return ensureInitialized().decodeJson<IconButtonNode>(json);
  }
}

mixin IconButtonNodeMappable {
  String toJson() {
    return IconButtonNodeMapper.ensureInitialized()
        .encodeJson<IconButtonNode>(this as IconButtonNode);
  }

  Map<String, dynamic> toMap() {
    return IconButtonNodeMapper.ensureInitialized()
        .encodeMap<IconButtonNode>(this as IconButtonNode);
  }

  IconButtonNodeCopyWith<IconButtonNode, IconButtonNode, IconButtonNode>
      get copyWith =>
          _IconButtonNodeCopyWithImpl<IconButtonNode, IconButtonNode>(
              this as IconButtonNode, $identity, $identity);
  @override
  String toString() {
    return IconButtonNodeMapper.ensureInitialized()
        .stringifyValue(this as IconButtonNode);
  }

  @override
  bool operator ==(Object other) {
    return IconButtonNodeMapper.ensureInitialized()
        .equalsValue(this as IconButtonNode, other);
  }

  @override
  int get hashCode {
    return IconButtonNodeMapper.ensureInitialized()
        .hashValue(this as IconButtonNode);
  }
}

extension IconButtonNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, IconButtonNode, $Out> {
  IconButtonNodeCopyWith<$R, IconButtonNode, $Out> get $asIconButtonNode =>
      $base.as((v, t, t2) => _IconButtonNodeCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class IconButtonNodeCopyWith<$R, $In extends IconButtonNode, $Out>
    implements ButtonNodeCopyWith<$R, $In, $Out> {
  @override
  ButtonStylePropertiesCopyWith<$R, ButtonStyleProperties,
      ButtonStyleProperties> get bsPropGroup;
  @override
  CalloutConfigModelCopyWith<$R, CalloutConfigModel, CalloutConfigModel>?
      get calloutConfig;
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child;
  @override
  $R call(
      {int? iconCodePoint,
      String? iconFontFamily,
      String? iconFontPackage,
      int? iconColor,
      double? iconSize,
      String? destinationRoutePathSnippetName,
      SnippetTemplateEnum? template,
      ButtonStyleProperties? bsPropGroup,
      String? onTapHandlerName,
      CalloutConfigModel? calloutConfig,
      SNode? child});
  IconButtonNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _IconButtonNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, IconButtonNode, $Out>
    implements IconButtonNodeCopyWith<$R, IconButtonNode, $Out> {
  _IconButtonNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<IconButtonNode> $mapper =
      IconButtonNodeMapper.ensureInitialized();
  @override
  ButtonStylePropertiesCopyWith<$R, ButtonStyleProperties,
          ButtonStyleProperties>
      get bsPropGroup =>
          $value.bsPropGroup.copyWith.$chain((v) => call(bsPropGroup: v));
  @override
  CalloutConfigModelCopyWith<$R, CalloutConfigModel, CalloutConfigModel>?
      get calloutConfig =>
          $value.calloutConfig?.copyWith.$chain((v) => call(calloutConfig: v));
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child =>
      $value.child?.copyWith.$chain((v) => call(child: v));
  @override
  $R call(
          {Object? iconCodePoint = $none,
          Object? iconFontFamily = $none,
          Object? iconFontPackage = $none,
          Object? iconColor = $none,
          Object? iconSize = $none,
          Object? destinationRoutePathSnippetName = $none,
          Object? template = $none,
          ButtonStyleProperties? bsPropGroup,
          Object? onTapHandlerName = $none,
          Object? calloutConfig = $none,
          Object? child = $none}) =>
      $apply(FieldCopyWithData({
        if (iconCodePoint != $none) #iconCodePoint: iconCodePoint,
        if (iconFontFamily != $none) #iconFontFamily: iconFontFamily,
        if (iconFontPackage != $none) #iconFontPackage: iconFontPackage,
        if (iconColor != $none) #iconColor: iconColor,
        if (iconSize != $none) #iconSize: iconSize,
        if (destinationRoutePathSnippetName != $none)
          #destinationRoutePathSnippetName: destinationRoutePathSnippetName,
        if (template != $none) #template: template,
        if (bsPropGroup != null) #bsPropGroup: bsPropGroup,
        if (onTapHandlerName != $none) #onTapHandlerName: onTapHandlerName,
        if (calloutConfig != $none) #calloutConfig: calloutConfig,
        if (child != $none) #child: child
      }));
  @override
  IconButtonNode $make(CopyWithData data) => IconButtonNode(
      iconCodePoint: data.get(#iconCodePoint, or: $value.iconCodePoint),
      iconFontFamily: data.get(#iconFontFamily, or: $value.iconFontFamily),
      iconFontPackage: data.get(#iconFontPackage, or: $value.iconFontPackage),
      iconColor: data.get(#iconColor, or: $value.iconColor),
      iconSize: data.get(#iconSize, or: $value.iconSize),
      destinationRoutePathSnippetName: data.get(
          #destinationRoutePathSnippetName,
          or: $value.destinationRoutePathSnippetName),
      template: data.get(#template, or: $value.template),
      bsPropGroup: data.get(#bsPropGroup, or: $value.bsPropGroup),
      onTapHandlerName:
          data.get(#onTapHandlerName, or: $value.onTapHandlerName),
      calloutConfig: data.get(#calloutConfig, or: $value.calloutConfig),
      child: data.get(#child, or: $value.child));

  @override
  IconButtonNodeCopyWith<$R2, IconButtonNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _IconButtonNodeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
