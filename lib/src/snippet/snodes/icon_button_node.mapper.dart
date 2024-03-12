// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'icon_button_node.dart';

class IconButtonNodeMapper extends SubClassMapperBase<IconButtonNode> {
  IconButtonNodeMapper._();

  static IconButtonNodeMapper? _instance;
  static IconButtonNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = IconButtonNodeMapper._());
      ButtonNodeMapper.ensureInitialized().addSubMapper(_instance!);
      ButtonStyleGroupMapper.ensureInitialized();
      CalloutConfigGroupMapper.ensureInitialized();
      STreeNodeMapper.ensureInitialized();
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
  static ButtonStyleGroup? _$buttonStyleGroup(IconButtonNode v) =>
      v.buttonStyleGroup;
  static const Field<IconButtonNode, ButtonStyleGroup> _f$buttonStyleGroup =
      Field('buttonStyleGroup', _$buttonStyleGroup, opt: true);
  static String? _$onTapHandlerName(IconButtonNode v) => v.onTapHandlerName;
  static const Field<IconButtonNode, String> _f$onTapHandlerName =
      Field('onTapHandlerName', _$onTapHandlerName, opt: true);
  static CalloutConfigGroup? _$calloutConfigGroup(IconButtonNode v) =>
      v.calloutConfigGroup;
  static const Field<IconButtonNode, CalloutConfigGroup> _f$calloutConfigGroup =
      Field('calloutConfigGroup', _$calloutConfigGroup, opt: true);
  static STreeNode? _$child(IconButtonNode v) => v.child;
  static const Field<IconButtonNode, STreeNode> _f$child =
      Field('child', _$child, opt: true);
  static bool _$isExpanded(IconButtonNode v) => v.isExpanded;
  static const Field<IconButtonNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(IconButtonNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<IconButtonNode, bool> _f$hidePropertiesWhileDragging =
      Field('hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
          mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(IconButtonNode v) =>
      v.nodeWidgetGK;
  static const Field<IconButtonNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);
  static String? _$namedButtonStyle(IconButtonNode v) => v.namedButtonStyle;
  static const Field<IconButtonNode, String> _f$namedButtonStyle =
      Field('namedButtonStyle', _$namedButtonStyle, mode: FieldMode.member);

  @override
  final MappableFields<IconButtonNode> fields = const {
    #iconCodePoint: _f$iconCodePoint,
    #iconFontFamily: _f$iconFontFamily,
    #iconFontPackage: _f$iconFontPackage,
    #iconColor: _f$iconColor,
    #iconSize: _f$iconSize,
    #buttonStyleGroup: _f$buttonStyleGroup,
    #onTapHandlerName: _f$onTapHandlerName,
    #calloutConfigGroup: _f$calloutConfigGroup,
    #child: _f$child,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
    #namedButtonStyle: _f$namedButtonStyle,
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
        buttonStyleGroup: data.dec(_f$buttonStyleGroup),
        onTapHandlerName: data.dec(_f$onTapHandlerName),
        calloutConfigGroup: data.dec(_f$calloutConfigGroup),
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
      get copyWith => _IconButtonNodeCopyWithImpl(
          this as IconButtonNode, $identity, $identity);
  @override
  String toString() {
    return IconButtonNodeMapper.ensureInitialized()
        .stringifyValue(this as IconButtonNode);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            IconButtonNodeMapper.ensureInitialized()
                .isValueEqual(this as IconButtonNode, other));
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
      $base.as((v, t, t2) => _IconButtonNodeCopyWithImpl(v, t, t2));
}

abstract class IconButtonNodeCopyWith<$R, $In extends IconButtonNode, $Out>
    implements ButtonNodeCopyWith<$R, $In, $Out> {
  @override
  ButtonStyleGroupCopyWith<$R, ButtonStyleGroup, ButtonStyleGroup>?
      get buttonStyleGroup;
  @override
  CalloutConfigGroupCopyWith<$R, CalloutConfigGroup, CalloutConfigGroup>?
      get calloutConfigGroup;
  @override
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get child;
  @override
  $R call(
      {int? iconCodePoint,
      String? iconFontFamily,
      String? iconFontPackage,
      int? iconColor,
      double? iconSize,
      ButtonStyleGroup? buttonStyleGroup,
      String? onTapHandlerName,
      CalloutConfigGroup? calloutConfigGroup,
      STreeNode? child});
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
  ButtonStyleGroupCopyWith<$R, ButtonStyleGroup, ButtonStyleGroup>?
      get buttonStyleGroup => $value.buttonStyleGroup?.copyWith
          .$chain((v) => call(buttonStyleGroup: v));
  @override
  CalloutConfigGroupCopyWith<$R, CalloutConfigGroup, CalloutConfigGroup>?
      get calloutConfigGroup => $value.calloutConfigGroup?.copyWith
          .$chain((v) => call(calloutConfigGroup: v));
  @override
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get child =>
      $value.child?.copyWith.$chain((v) => call(child: v));
  @override
  $R call(
          {Object? iconCodePoint = $none,
          Object? iconFontFamily = $none,
          Object? iconFontPackage = $none,
          Object? iconColor = $none,
          Object? iconSize = $none,
          Object? buttonStyleGroup = $none,
          Object? onTapHandlerName = $none,
          Object? calloutConfigGroup = $none,
          Object? child = $none}) =>
      $apply(FieldCopyWithData({
        if (iconCodePoint != $none) #iconCodePoint: iconCodePoint,
        if (iconFontFamily != $none) #iconFontFamily: iconFontFamily,
        if (iconFontPackage != $none) #iconFontPackage: iconFontPackage,
        if (iconColor != $none) #iconColor: iconColor,
        if (iconSize != $none) #iconSize: iconSize,
        if (buttonStyleGroup != $none) #buttonStyleGroup: buttonStyleGroup,
        if (onTapHandlerName != $none) #onTapHandlerName: onTapHandlerName,
        if (calloutConfigGroup != $none)
          #calloutConfigGroup: calloutConfigGroup,
        if (child != $none) #child: child
      }));
  @override
  IconButtonNode $make(CopyWithData data) => IconButtonNode(
      iconCodePoint: data.get(#iconCodePoint, or: $value.iconCodePoint),
      iconFontFamily: data.get(#iconFontFamily, or: $value.iconFontFamily),
      iconFontPackage: data.get(#iconFontPackage, or: $value.iconFontPackage),
      iconColor: data.get(#iconColor, or: $value.iconColor),
      iconSize: data.get(#iconSize, or: $value.iconSize),
      buttonStyleGroup:
          data.get(#buttonStyleGroup, or: $value.buttonStyleGroup),
      onTapHandlerName:
          data.get(#onTapHandlerName, or: $value.onTapHandlerName),
      calloutConfigGroup:
          data.get(#calloutConfigGroup, or: $value.calloutConfigGroup),
      child: data.get(#child, or: $value.child));

  @override
  IconButtonNodeCopyWith<$R2, IconButtonNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _IconButtonNodeCopyWithImpl($value, $cast, t);
}
