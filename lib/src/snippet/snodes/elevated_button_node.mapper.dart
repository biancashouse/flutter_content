// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'elevated_button_node.dart';

class ElevatedButtonNodeMapper extends SubClassMapperBase<ElevatedButtonNode> {
  ElevatedButtonNodeMapper._();

  static ElevatedButtonNodeMapper? _instance;
  static ElevatedButtonNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ElevatedButtonNodeMapper._());
      ButtonNodeMapper.ensureInitialized().addSubMapper(_instance!);
      SnippetTemplateEnumMapper.ensureInitialized();
      ButtonStyleGroupMapper.ensureInitialized();
      CalloutConfigGroupMapper.ensureInitialized();
      STreeNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ElevatedButtonNode';

  static String? _$destinationRoutePathSnippetName(ElevatedButtonNode v) =>
      v.destinationRoutePathSnippetName;
  static const Field<ElevatedButtonNode, String>
      _f$destinationRoutePathSnippetName = Field(
          'destinationRoutePathSnippetName', _$destinationRoutePathSnippetName,
          opt: true);
  static SnippetTemplateEnum? _$template(ElevatedButtonNode v) => v.template;
  static const Field<ElevatedButtonNode, SnippetTemplateEnum> _f$template =
      Field('template', _$template, opt: true);
  static String? _$destinationPanelOrPlaceholderName(ElevatedButtonNode v) =>
      v.destinationPanelOrPlaceholderName;
  static const Field<ElevatedButtonNode, String>
      _f$destinationPanelOrPlaceholderName = Field(
          'destinationPanelOrPlaceholderName',
          _$destinationPanelOrPlaceholderName,
          opt: true);
  static String? _$destinationSnippetName(ElevatedButtonNode v) =>
      v.destinationSnippetName;
  static const Field<ElevatedButtonNode, String> _f$destinationSnippetName =
      Field('destinationSnippetName', _$destinationSnippetName, opt: true);
  static ButtonStyleGroup? _$buttonStyle(ElevatedButtonNode v) => v.buttonStyle;
  static const Field<ElevatedButtonNode, ButtonStyleGroup> _f$buttonStyle =
      Field('buttonStyle', _$buttonStyle, opt: true);
  static String? _$onTapHandlerName(ElevatedButtonNode v) => v.onTapHandlerName;
  static const Field<ElevatedButtonNode, String> _f$onTapHandlerName =
      Field('onTapHandlerName', _$onTapHandlerName, opt: true);
  static CalloutConfigGroup? _$calloutConfigGroup(ElevatedButtonNode v) =>
      v.calloutConfigGroup;
  static const Field<ElevatedButtonNode, CalloutConfigGroup>
      _f$calloutConfigGroup =
      Field('calloutConfigGroup', _$calloutConfigGroup, opt: true);
  static STreeNode? _$child(ElevatedButtonNode v) => v.child;
  static const Field<ElevatedButtonNode, STreeNode> _f$child =
      Field('child', _$child, opt: true);
  static String _$uid(ElevatedButtonNode v) => v.uid;
  static const Field<ElevatedButtonNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static bool _$isExpanded(ElevatedButtonNode v) => v.isExpanded;
  static const Field<ElevatedButtonNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(ElevatedButtonNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<ElevatedButtonNode, bool> _f$hidePropertiesWhileDragging =
      Field('hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
          mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(
          ElevatedButtonNode v) =>
      v.nodeWidgetGK;
  static const Field<ElevatedButtonNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<ElevatedButtonNode> fields = const {
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
  final dynamic discriminatorValue = 'ElevatedButtonNode';
  @override
  late final ClassMapperBase superMapper = ButtonNodeMapper.ensureInitialized();

  static ElevatedButtonNode _instantiate(DecodingData data) {
    return ElevatedButtonNode(
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

  static ElevatedButtonNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ElevatedButtonNode>(map);
  }

  static ElevatedButtonNode fromJson(String json) {
    return ensureInitialized().decodeJson<ElevatedButtonNode>(json);
  }
}

mixin ElevatedButtonNodeMappable {
  String toJson() {
    return ElevatedButtonNodeMapper.ensureInitialized()
        .encodeJson<ElevatedButtonNode>(this as ElevatedButtonNode);
  }

  Map<String, dynamic> toMap() {
    return ElevatedButtonNodeMapper.ensureInitialized()
        .encodeMap<ElevatedButtonNode>(this as ElevatedButtonNode);
  }

  ElevatedButtonNodeCopyWith<ElevatedButtonNode, ElevatedButtonNode,
          ElevatedButtonNode>
      get copyWith => _ElevatedButtonNodeCopyWithImpl(
          this as ElevatedButtonNode, $identity, $identity);
  @override
  String toString() {
    return ElevatedButtonNodeMapper.ensureInitialized()
        .stringifyValue(this as ElevatedButtonNode);
  }

  @override
  bool operator ==(Object other) {
    return ElevatedButtonNodeMapper.ensureInitialized()
        .equalsValue(this as ElevatedButtonNode, other);
  }

  @override
  int get hashCode {
    return ElevatedButtonNodeMapper.ensureInitialized()
        .hashValue(this as ElevatedButtonNode);
  }
}

extension ElevatedButtonNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ElevatedButtonNode, $Out> {
  ElevatedButtonNodeCopyWith<$R, ElevatedButtonNode, $Out>
      get $asElevatedButtonNode =>
          $base.as((v, t, t2) => _ElevatedButtonNodeCopyWithImpl(v, t, t2));
}

abstract class ElevatedButtonNodeCopyWith<$R, $In extends ElevatedButtonNode,
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
  ElevatedButtonNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ElevatedButtonNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ElevatedButtonNode, $Out>
    implements ElevatedButtonNodeCopyWith<$R, ElevatedButtonNode, $Out> {
  _ElevatedButtonNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ElevatedButtonNode> $mapper =
      ElevatedButtonNodeMapper.ensureInitialized();
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
  ElevatedButtonNode $make(CopyWithData data) => ElevatedButtonNode(
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
  ElevatedButtonNodeCopyWith<$R2, ElevatedButtonNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ElevatedButtonNodeCopyWithImpl($value, $cast, t);
}
