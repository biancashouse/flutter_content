// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'outlined_button_node.dart';

class OutlinedButtonNodeMapper extends SubClassMapperBase<OutlinedButtonNode> {
  OutlinedButtonNodeMapper._();

  static OutlinedButtonNodeMapper? _instance;
  static OutlinedButtonNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OutlinedButtonNodeMapper._());
      ButtonNodeMapper.ensureInitialized().addSubMapper(_instance!);
      SnippetTemplateEnumMapper.ensureInitialized();
      ButtonStyleGroupMapper.ensureInitialized();
      CalloutConfigGroupMapper.ensureInitialized();
      STreeNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'OutlinedButtonNode';

  static String? _$destinationRoutePathSnippetName(OutlinedButtonNode v) =>
      v.destinationRoutePathSnippetName;
  static const Field<OutlinedButtonNode, String>
      _f$destinationRoutePathSnippetName = Field(
          'destinationRoutePathSnippetName', _$destinationRoutePathSnippetName,
          opt: true);
  static SnippetTemplateEnum? _$template(OutlinedButtonNode v) => v.template;
  static const Field<OutlinedButtonNode, SnippetTemplateEnum> _f$template =
      Field('template', _$template, opt: true);
  static String? _$destinationPanelOrPlaceholderName(OutlinedButtonNode v) =>
      v.destinationPanelOrPlaceholderName;
  static const Field<OutlinedButtonNode, String>
      _f$destinationPanelOrPlaceholderName = Field(
          'destinationPanelOrPlaceholderName',
          _$destinationPanelOrPlaceholderName,
          opt: true);
  static String? _$destinationSnippetName(OutlinedButtonNode v) =>
      v.destinationSnippetName;
  static const Field<OutlinedButtonNode, String> _f$destinationSnippetName =
      Field('destinationSnippetName', _$destinationSnippetName, opt: true);
  static ButtonStyleGroup? _$buttonStyle(OutlinedButtonNode v) => v.buttonStyle;
  static const Field<OutlinedButtonNode, ButtonStyleGroup> _f$buttonStyle =
      Field('buttonStyle', _$buttonStyle, opt: true);
  static String? _$onTapHandlerName(OutlinedButtonNode v) => v.onTapHandlerName;
  static const Field<OutlinedButtonNode, String> _f$onTapHandlerName =
      Field('onTapHandlerName', _$onTapHandlerName, opt: true);
  static CalloutConfigGroup? _$calloutConfigGroup(OutlinedButtonNode v) =>
      v.calloutConfigGroup;
  static const Field<OutlinedButtonNode, CalloutConfigGroup>
      _f$calloutConfigGroup =
      Field('calloutConfigGroup', _$calloutConfigGroup, opt: true);
  static STreeNode? _$child(OutlinedButtonNode v) => v.child;
  static const Field<OutlinedButtonNode, STreeNode> _f$child =
      Field('child', _$child, opt: true);
  static String _$uid(OutlinedButtonNode v) => v.uid;
  static const Field<OutlinedButtonNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static bool _$isExpanded(OutlinedButtonNode v) => v.isExpanded;
  static const Field<OutlinedButtonNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(OutlinedButtonNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<OutlinedButtonNode, bool> _f$hidePropertiesWhileDragging =
      Field('hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
          mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(
          OutlinedButtonNode v) =>
      v.nodeWidgetGK;
  static const Field<OutlinedButtonNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<OutlinedButtonNode> fields = const {
    #destinationRoutePathSnippetName: _f$destinationRoutePathSnippetName,
    #template: _f$template,
    #destinationPanelOrPlaceholderName: _f$destinationPanelOrPlaceholderName,
    #destinationSnippetName: _f$destinationSnippetName,
    #buttonStyle: _f$buttonStyle,
    #onTapHandlerName: _f$onTapHandlerName,
    #calloutConfigGroup: _f$calloutConfigGroup,
    #child: _f$child,
    #uid: _f$uid,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'button';
  @override
  final dynamic discriminatorValue = 'OutlinedButtonNode';
  @override
  late final ClassMapperBase superMapper = ButtonNodeMapper.ensureInitialized();

  static OutlinedButtonNode _instantiate(DecodingData data) {
    return OutlinedButtonNode(
        destinationRoutePathSnippetName:
            data.dec(_f$destinationRoutePathSnippetName),
        template: data.dec(_f$template),
        destinationPanelOrPlaceholderName:
            data.dec(_f$destinationPanelOrPlaceholderName),
        destinationSnippetName: data.dec(_f$destinationSnippetName),
        buttonStyle: data.dec(_f$buttonStyle),
        onTapHandlerName: data.dec(_f$onTapHandlerName),
        calloutConfigGroup: data.dec(_f$calloutConfigGroup),
        child: data.dec(_f$child));
  }

  @override
  final Function instantiate = _instantiate;

  static OutlinedButtonNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<OutlinedButtonNode>(map);
  }

  static OutlinedButtonNode fromJson(String json) {
    return ensureInitialized().decodeJson<OutlinedButtonNode>(json);
  }
}

mixin OutlinedButtonNodeMappable {
  String toJson() {
    return OutlinedButtonNodeMapper.ensureInitialized()
        .encodeJson<OutlinedButtonNode>(this as OutlinedButtonNode);
  }

  Map<String, dynamic> toMap() {
    return OutlinedButtonNodeMapper.ensureInitialized()
        .encodeMap<OutlinedButtonNode>(this as OutlinedButtonNode);
  }

  OutlinedButtonNodeCopyWith<OutlinedButtonNode, OutlinedButtonNode,
          OutlinedButtonNode>
      get copyWith => _OutlinedButtonNodeCopyWithImpl(
          this as OutlinedButtonNode, $identity, $identity);
  @override
  String toString() {
    return OutlinedButtonNodeMapper.ensureInitialized()
        .stringifyValue(this as OutlinedButtonNode);
  }

  @override
  bool operator ==(Object other) {
    return OutlinedButtonNodeMapper.ensureInitialized()
        .equalsValue(this as OutlinedButtonNode, other);
  }

  @override
  int get hashCode {
    return OutlinedButtonNodeMapper.ensureInitialized()
        .hashValue(this as OutlinedButtonNode);
  }
}

extension OutlinedButtonNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, OutlinedButtonNode, $Out> {
  OutlinedButtonNodeCopyWith<$R, OutlinedButtonNode, $Out>
      get $asOutlinedButtonNode =>
          $base.as((v, t, t2) => _OutlinedButtonNodeCopyWithImpl(v, t, t2));
}

abstract class OutlinedButtonNodeCopyWith<$R, $In extends OutlinedButtonNode,
    $Out> implements ButtonNodeCopyWith<$R, $In, $Out> {
  @override
  ButtonStyleGroupCopyWith<$R, ButtonStyleGroup, ButtonStyleGroup>?
      get buttonStyle;
  @override
  CalloutConfigGroupCopyWith<$R, CalloutConfigGroup, CalloutConfigGroup>?
      get calloutConfigGroup;
  @override
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get child;
  @override
  $R call(
      {String? destinationRoutePathSnippetName,
      SnippetTemplateEnum? template,
      String? destinationPanelOrPlaceholderName,
      String? destinationSnippetName,
      ButtonStyleGroup? buttonStyle,
      String? onTapHandlerName,
      CalloutConfigGroup? calloutConfigGroup,
      STreeNode? child});
  OutlinedButtonNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _OutlinedButtonNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, OutlinedButtonNode, $Out>
    implements OutlinedButtonNodeCopyWith<$R, OutlinedButtonNode, $Out> {
  _OutlinedButtonNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<OutlinedButtonNode> $mapper =
      OutlinedButtonNodeMapper.ensureInitialized();
  @override
  ButtonStyleGroupCopyWith<$R, ButtonStyleGroup, ButtonStyleGroup>?
      get buttonStyle =>
          $value.buttonStyle?.copyWith.$chain((v) => call(buttonStyle: v));
  @override
  CalloutConfigGroupCopyWith<$R, CalloutConfigGroup, CalloutConfigGroup>?
      get calloutConfigGroup => $value.calloutConfigGroup?.copyWith
          .$chain((v) => call(calloutConfigGroup: v));
  @override
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get child =>
      $value.child?.copyWith.$chain((v) => call(child: v));
  @override
  $R call(
          {Object? destinationRoutePathSnippetName = $none,
          Object? template = $none,
          Object? destinationPanelOrPlaceholderName = $none,
          Object? destinationSnippetName = $none,
          Object? buttonStyle = $none,
          Object? onTapHandlerName = $none,
          Object? calloutConfigGroup = $none,
          Object? child = $none}) =>
      $apply(FieldCopyWithData({
        if (destinationRoutePathSnippetName != $none)
          #destinationRoutePathSnippetName: destinationRoutePathSnippetName,
        if (template != $none) #template: template,
        if (destinationPanelOrPlaceholderName != $none)
          #destinationPanelOrPlaceholderName: destinationPanelOrPlaceholderName,
        if (destinationSnippetName != $none)
          #destinationSnippetName: destinationSnippetName,
        if (buttonStyle != $none) #buttonStyle: buttonStyle,
        if (onTapHandlerName != $none) #onTapHandlerName: onTapHandlerName,
        if (calloutConfigGroup != $none)
          #calloutConfigGroup: calloutConfigGroup,
        if (child != $none) #child: child
      }));
  @override
  OutlinedButtonNode $make(CopyWithData data) => OutlinedButtonNode(
      destinationRoutePathSnippetName: data.get(
          #destinationRoutePathSnippetName,
          or: $value.destinationRoutePathSnippetName),
      template: data.get(#template, or: $value.template),
      destinationPanelOrPlaceholderName: data.get(
          #destinationPanelOrPlaceholderName,
          or: $value.destinationPanelOrPlaceholderName),
      destinationSnippetName:
          data.get(#destinationSnippetName, or: $value.destinationSnippetName),
      buttonStyle: data.get(#buttonStyle, or: $value.buttonStyle),
      onTapHandlerName:
          data.get(#onTapHandlerName, or: $value.onTapHandlerName),
      calloutConfigGroup:
          data.get(#calloutConfigGroup, or: $value.calloutConfigGroup),
      child: data.get(#child, or: $value.child));

  @override
  OutlinedButtonNodeCopyWith<$R2, OutlinedButtonNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _OutlinedButtonNodeCopyWithImpl($value, $cast, t);
}
