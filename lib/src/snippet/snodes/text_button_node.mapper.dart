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
      ButtonStylePropertiesMapper.ensureInitialized();
      CalloutConfigModelMapper.ensureInitialized();
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
  static ButtonStyleProperties _$bsPropGroup(TextButtonNode v) => v.bsPropGroup;
  static const Field<TextButtonNode, ButtonStyleProperties> _f$bsPropGroup =
      Field('bsPropGroup', _$bsPropGroup, hook: ButtonStyleHook());
  static String? _$onTapHandlerName(TextButtonNode v) => v.onTapHandlerName;
  static const Field<TextButtonNode, String> _f$onTapHandlerName =
      Field('onTapHandlerName', _$onTapHandlerName, opt: true);
  static CalloutConfigModel? _$calloutConfig(TextButtonNode v) =>
      v.calloutConfig;
  static const Field<TextButtonNode, CalloutConfigModel> _f$calloutConfig =
      Field('calloutConfig', _$calloutConfig, opt: true);
  static SNode? _$child(TextButtonNode v) => v.child;
  static const Field<TextButtonNode, SNode> _f$child =
      Field('child', _$child, opt: true);
  static String _$uid(TextButtonNode v) => v.uid;
  static const Field<TextButtonNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$treeNodeGK(TextButtonNode v) =>
      v.treeNodeGK;
  static const Field<TextButtonNode, GlobalKey<State<StatefulWidget>>>
      _f$treeNodeGK = Field('treeNodeGK', _$treeNodeGK, mode: FieldMode.member);
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
  final dynamic discriminatorValue = 'TextButtonNode';
  @override
  late final ClassMapperBase superMapper = ButtonNodeMapper.ensureInitialized();

  static TextButtonNode _instantiate(DecodingData data) {
    return TextButtonNode(
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
      get copyWith =>
          _TextButtonNodeCopyWithImpl<TextButtonNode, TextButtonNode>(
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
      $base.as((v, t, t2) => _TextButtonNodeCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TextButtonNodeCopyWith<$R, $In extends TextButtonNode, $Out>
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
      {String? destinationRoutePathSnippetName,
      SnippetTemplateEnum? template,
      ButtonStyleProperties? bsPropGroup,
      String? onTapHandlerName,
      CalloutConfigModel? calloutConfig,
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
          {Object? destinationRoutePathSnippetName = $none,
          Object? template = $none,
          ButtonStyleProperties? bsPropGroup,
          Object? onTapHandlerName = $none,
          Object? calloutConfig = $none,
          Object? child = $none}) =>
      $apply(FieldCopyWithData({
        if (destinationRoutePathSnippetName != $none)
          #destinationRoutePathSnippetName: destinationRoutePathSnippetName,
        if (template != $none) #template: template,
        if (bsPropGroup != null) #bsPropGroup: bsPropGroup,
        if (onTapHandlerName != $none) #onTapHandlerName: onTapHandlerName,
        if (calloutConfig != $none) #calloutConfig: calloutConfig,
        if (child != $none) #child: child
      }));
  @override
  TextButtonNode $make(CopyWithData data) => TextButtonNode(
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
  TextButtonNodeCopyWith<$R2, TextButtonNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TextButtonNodeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
