// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
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
      ButtonStylePropertiesMapper.ensureInitialized();
      CalloutConfigPropertiesMapper.ensureInitialized();
      SNodeMapper.ensureInitialized();
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
  static String? _$destinationPanelOrPlaceholderName(TextButtonNode v) =>
      v.destinationPanelOrPlaceholderName;
  static const Field<TextButtonNode, String>
      _f$destinationPanelOrPlaceholderName = Field(
          'destinationPanelOrPlaceholderName',
          _$destinationPanelOrPlaceholderName,
          opt: true);
  static String? _$destinationSnippetName(TextButtonNode v) =>
      v.destinationSnippetName;
  static const Field<TextButtonNode, String> _f$destinationSnippetName =
      Field('destinationSnippetName', _$destinationSnippetName, opt: true);
  static ButtonStyleProperties _$bsPropsGroup(TextButtonNode v) =>
      v.bsPropsGroup;
  static const Field<TextButtonNode, ButtonStyleProperties> _f$bsPropsGroup =
      Field('bsPropsGroup', _$bsPropsGroup);
  static String? _$onTapHandlerName(TextButtonNode v) => v.onTapHandlerName;
  static const Field<TextButtonNode, String> _f$onTapHandlerName =
      Field('onTapHandlerName', _$onTapHandlerName, opt: true);
  static CalloutConfigProperties? _$calloutConfigGroup(TextButtonNode v) =>
      v.calloutConfigGroup;
  static const Field<TextButtonNode, CalloutConfigProperties>
      _f$calloutConfigGroup =
      Field('calloutConfigGroup', _$calloutConfigGroup, opt: true);
  static SNode? _$child(TextButtonNode v) => v.child;
  static const Field<TextButtonNode, SNode> _f$child =
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

  @override
  final MappableFields<TextButtonNode> fields = const {
    #destinationRoutePathSnippetName: _f$destinationRoutePathSnippetName,
    #template: _f$template,
    #destinationPanelOrPlaceholderName: _f$destinationPanelOrPlaceholderName,
    #destinationSnippetName: _f$destinationSnippetName,
    #bsPropsGroup: _f$bsPropsGroup,
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
  final dynamic discriminatorValue = 'TextButtonNode';
  @override
  late final ClassMapperBase superMapper = ButtonNodeMapper.ensureInitialized();

  static TextButtonNode _instantiate(DecodingData data) {
    return TextButtonNode(
        destinationRoutePathSnippetName:
            data.dec(_f$destinationRoutePathSnippetName),
        template: data.dec(_f$template),
        destinationPanelOrPlaceholderName:
            data.dec(_f$destinationPanelOrPlaceholderName),
        destinationSnippetName: data.dec(_f$destinationSnippetName),
        bsPropsGroup: data.dec(_f$bsPropsGroup),
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
  ButtonStylePropertiesCopyWith<$R, ButtonStyleProperties,
      ButtonStyleProperties> get bsPropsGroup;
  @override
  CalloutConfigPropertiesCopyWith<$R, CalloutConfigProperties,
      CalloutConfigProperties>? get calloutConfigGroup;
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child;
  @override
  $R call(
      {String? destinationRoutePathSnippetName,
      SnippetTemplateEnum? template,
      String? destinationPanelOrPlaceholderName,
      String? destinationSnippetName,
      ButtonStyleProperties? bsPropsGroup,
      String? onTapHandlerName,
      CalloutConfigProperties? calloutConfigGroup,
      SNode? child});
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
  ButtonStylePropertiesCopyWith<$R, ButtonStyleProperties,
          ButtonStyleProperties>
      get bsPropsGroup =>
          $value.bsPropsGroup.copyWith.$chain((v) => call(bsPropsGroup: v));
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
          Object? destinationPanelOrPlaceholderName = $none,
          Object? destinationSnippetName = $none,
          ButtonStyleProperties? bsPropsGroup,
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
        if (bsPropsGroup != null) #bsPropsGroup: bsPropsGroup,
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
      destinationPanelOrPlaceholderName: data.get(
          #destinationPanelOrPlaceholderName,
          or: $value.destinationPanelOrPlaceholderName),
      destinationSnippetName:
          data.get(#destinationSnippetName, or: $value.destinationSnippetName),
      bsPropsGroup: data.get(#bsPropsGroup, or: $value.bsPropsGroup),
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
