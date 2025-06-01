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
      ButtonStylePropertiesMapper.ensureInitialized();
      CalloutConfigModelMapper.ensureInitialized();
      SNodeMapper.ensureInitialized();
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
  static ButtonStyleProperties _$bsPropGroup(OutlinedButtonNode v) =>
      v.bsPropGroup;
  static const Field<OutlinedButtonNode, ButtonStyleProperties> _f$bsPropGroup =
      Field('bsPropGroup', _$bsPropGroup, hook: ButtonStyleHook());
  static String? _$onTapHandlerName(OutlinedButtonNode v) => v.onTapHandlerName;
  static const Field<OutlinedButtonNode, String> _f$onTapHandlerName =
      Field('onTapHandlerName', _$onTapHandlerName, opt: true);
  static CalloutConfigModel? _$calloutConfig(OutlinedButtonNode v) =>
      v.calloutConfig;
  static const Field<OutlinedButtonNode, CalloutConfigModel> _f$calloutConfig =
      Field('calloutConfig', _$calloutConfig, opt: true);
  static SNode? _$child(OutlinedButtonNode v) => v.child;
  static const Field<OutlinedButtonNode, SNode> _f$child =
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

  @override
  final MappableFields<OutlinedButtonNode> fields = const {
    #destinationRoutePathSnippetName: _f$destinationRoutePathSnippetName,
    #template: _f$template,
    #bsPropGroup: _f$bsPropGroup,
    #onTapHandlerName: _f$onTapHandlerName,
    #calloutConfig: _f$calloutConfig,
    #child: _f$child,
    #uid: _f$uid,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
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
        bsPropGroup: data.dec(_f$bsPropGroup),
        onTapHandlerName: data.dec(_f$onTapHandlerName),
        calloutConfig: data.dec(_f$calloutConfig),
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
  OutlinedButtonNode $make(CopyWithData data) => OutlinedButtonNode(
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
  OutlinedButtonNodeCopyWith<$R2, OutlinedButtonNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _OutlinedButtonNodeCopyWithImpl($value, $cast, t);
}
