// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'text_button_node.dart';

class TextButtonNodeMapper extends SubClassMapperBase<TextButtonNode> {
  TextButtonNodeMapper._();

  static TextButtonNodeMapper? _instance;
  static TextButtonNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TextButtonNodeMapper._());
      ButtonNodeMapper.ensureInitialized().addSubMapper(_instance!);
      SnippetTemplateEnumMapper.ensureInitialized();
      ButtonStyleGroupMapper.ensureInitialized();
      CalloutConfigGroupMapper.ensureInitialized();
      STreeNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TextButtonNode';

  static String? _$destinationRoutePathSnippetName(TextButtonNode v) =>
      v.destinationRoutePathSnippetName;
  static const Field<TextButtonNode, String>
      _f$destinationRoutePathSnippetName = Field(
          'destinationRoutePathSnippetName', _$destinationRoutePathSnippetName,
          opt: true);
  static SnippetTemplateEnum? _$template(TextButtonNode v) => v.template;
  static const Field<TextButtonNode, SnippetTemplateEnum> _f$template =
      Field('template', _$template, opt: true);
  static String? _$destinationPanelName(TextButtonNode v) =>
      v.destinationPanelName;
  static const Field<TextButtonNode, String> _f$destinationPanelName =
      Field('destinationPanelName', _$destinationPanelName, opt: true);
  static String? _$destinationSnippetName(TextButtonNode v) =>
      v.destinationSnippetName;
  static const Field<TextButtonNode, String> _f$destinationSnippetName =
      Field('destinationSnippetName', _$destinationSnippetName, opt: true);
  static ButtonStyleGroup? _$buttonStyle(TextButtonNode v) => v.buttonStyle;
  static const Field<TextButtonNode, ButtonStyleGroup> _f$buttonStyle =
      Field('buttonStyle', _$buttonStyle, opt: true);
  static String? _$onTapHandlerName(TextButtonNode v) => v.onTapHandlerName;
  static const Field<TextButtonNode, String> _f$onTapHandlerName =
      Field('onTapHandlerName', _$onTapHandlerName, opt: true);
  static CalloutConfigGroup? _$calloutConfigGroup(TextButtonNode v) =>
      v.calloutConfigGroup;
  static const Field<TextButtonNode, CalloutConfigGroup> _f$calloutConfigGroup =
      Field('calloutConfigGroup', _$calloutConfigGroup, opt: true);
  static STreeNode? _$child(TextButtonNode v) => v.child;
  static const Field<TextButtonNode, STreeNode> _f$child =
      Field('child', _$child, opt: true);
  static String _$uid(TextButtonNode v) => v.uid;
  static const Field<TextButtonNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static bool _$isExpanded(TextButtonNode v) => v.isExpanded;
  static const Field<TextButtonNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(TextButtonNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<TextButtonNode, bool> _f$hidePropertiesWhileDragging =
      Field('hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
          mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(TextButtonNode v) =>
      v.nodeWidgetGK;
  static const Field<TextButtonNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<TextButtonNode> fields = const {
    #destinationRoutePathSnippetName: _f$destinationRoutePathSnippetName,
    #template: _f$template,
    #destinationPanelName: _f$destinationPanelName,
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
  final dynamic discriminatorValue = 'TextButtonNode';
  @override
  late final ClassMapperBase superMapper = ButtonNodeMapper.ensureInitialized();

  static TextButtonNode _instantiate(DecodingData data) {
    return TextButtonNode(
        destinationRoutePathSnippetName:
            data.dec(_f$destinationRoutePathSnippetName),
        template: data.dec(_f$template),
        destinationPanelName: data.dec(_f$destinationPanelName),
        destinationSnippetName: data.dec(_f$destinationSnippetName),
        buttonStyle: data.dec(_f$buttonStyle),
        onTapHandlerName: data.dec(_f$onTapHandlerName),
        calloutConfigGroup: data.dec(_f$calloutConfigGroup),
        child: data.dec(_f$child));
  }

  @override
  final Function instantiate = _instantiate;

  static TextButtonNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TextButtonNode>(map);
  }

  static TextButtonNode fromJson(String json) {
    return ensureInitialized().decodeJson<TextButtonNode>(json);
  }
}

mixin TextButtonNodeMappable {
  String toJson() {
    return TextButtonNodeMapper.ensureInitialized()
        .encodeJson<TextButtonNode>(this as TextButtonNode);
  }

  Map<String, dynamic> toMap() {
    return TextButtonNodeMapper.ensureInitialized()
        .encodeMap<TextButtonNode>(this as TextButtonNode);
  }

  TextButtonNodeCopyWith<TextButtonNode, TextButtonNode, TextButtonNode>
      get copyWith => _TextButtonNodeCopyWithImpl(
          this as TextButtonNode, $identity, $identity);
  @override
  String toString() {
    return TextButtonNodeMapper.ensureInitialized()
        .stringifyValue(this as TextButtonNode);
  }

  @override
  bool operator ==(Object other) {
    return TextButtonNodeMapper.ensureInitialized()
        .equalsValue(this as TextButtonNode, other);
  }

  @override
  int get hashCode {
    return TextButtonNodeMapper.ensureInitialized()
        .hashValue(this as TextButtonNode);
  }
}

extension TextButtonNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TextButtonNode, $Out> {
  TextButtonNodeCopyWith<$R, TextButtonNode, $Out> get $asTextButtonNode =>
      $base.as((v, t, t2) => _TextButtonNodeCopyWithImpl(v, t, t2));
}

abstract class TextButtonNodeCopyWith<$R, $In extends TextButtonNode, $Out>
    implements ButtonNodeCopyWith<$R, $In, $Out> {
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
      String? destinationPanelName,
      String? destinationSnippetName,
      ButtonStyleGroup? buttonStyle,
      String? onTapHandlerName,
      CalloutConfigGroup? calloutConfigGroup,
      STreeNode? child});
  TextButtonNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TextButtonNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TextButtonNode, $Out>
    implements TextButtonNodeCopyWith<$R, TextButtonNode, $Out> {
  _TextButtonNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TextButtonNode> $mapper =
      TextButtonNodeMapper.ensureInitialized();
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
          Object? destinationPanelName = $none,
          Object? destinationSnippetName = $none,
          Object? buttonStyle = $none,
          Object? onTapHandlerName = $none,
          Object? calloutConfigGroup = $none,
          Object? child = $none}) =>
      $apply(FieldCopyWithData({
        if (destinationRoutePathSnippetName != $none)
          #destinationRoutePathSnippetName: destinationRoutePathSnippetName,
        if (template != $none) #template: template,
        if (destinationPanelName != $none)
          #destinationPanelName: destinationPanelName,
        if (destinationSnippetName != $none)
          #destinationSnippetName: destinationSnippetName,
        if (buttonStyle != $none) #buttonStyle: buttonStyle,
        if (onTapHandlerName != $none) #onTapHandlerName: onTapHandlerName,
        if (calloutConfigGroup != $none)
          #calloutConfigGroup: calloutConfigGroup,
        if (child != $none) #child: child
      }));
  @override
  TextButtonNode $make(CopyWithData data) => TextButtonNode(
      destinationRoutePathSnippetName: data.get(
          #destinationRoutePathSnippetName,
          or: $value.destinationRoutePathSnippetName),
      template: data.get(#template, or: $value.template),
      destinationPanelName:
          data.get(#destinationPanelName, or: $value.destinationPanelName),
      destinationSnippetName:
          data.get(#destinationSnippetName, or: $value.destinationSnippetName),
      buttonStyle: data.get(#buttonStyle, or: $value.buttonStyle),
      onTapHandlerName:
          data.get(#onTapHandlerName, or: $value.onTapHandlerName),
      calloutConfigGroup:
          data.get(#calloutConfigGroup, or: $value.calloutConfigGroup),
      child: data.get(#child, or: $value.child));

  @override
  TextButtonNodeCopyWith<$R2, TextButtonNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TextButtonNodeCopyWithImpl($value, $cast, t);
}
