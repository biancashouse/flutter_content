// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
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
      ButtonStylePropertiesMapper.ensureInitialized();
      CalloutConfigModelMapper.ensureInitialized();
      SNodeMapper.ensureInitialized();
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
  static ButtonStyleProperties _$bsPropGroup(ElevatedButtonNode v) =>
      v.bsPropGroup;
  static const Field<ElevatedButtonNode, ButtonStyleProperties> _f$bsPropGroup =
      Field('bsPropGroup', _$bsPropGroup, hook: ButtonStyleHook());
  static String? _$onTapHandlerName(ElevatedButtonNode v) => v.onTapHandlerName;
  static const Field<ElevatedButtonNode, String> _f$onTapHandlerName =
      Field('onTapHandlerName', _$onTapHandlerName, opt: true);
  static CalloutConfigModel? _$calloutConfig(ElevatedButtonNode v) =>
      v.calloutConfig;
  static const Field<ElevatedButtonNode, CalloutConfigModel> _f$calloutConfig =
      Field('calloutConfig', _$calloutConfig, opt: true);
  static SNode? _$child(ElevatedButtonNode v) => v.child;
  static const Field<ElevatedButtonNode, SNode> _f$child =
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

  @override
  final MappableFields<ElevatedButtonNode> fields = const {
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
  final dynamic discriminatorValue = 'ElevatedButtonNode';
  @override
  late final ClassMapperBase superMapper = ButtonNodeMapper.ensureInitialized();

  static ElevatedButtonNode _instantiate(DecodingData data) {
    return ElevatedButtonNode(
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
      get copyWith => _ElevatedButtonNodeCopyWithImpl<ElevatedButtonNode,
          ElevatedButtonNode>(this as ElevatedButtonNode, $identity, $identity);
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
      get $asElevatedButtonNode => $base.as(
          (v, t, t2) => _ElevatedButtonNodeCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ElevatedButtonNodeCopyWith<$R, $In extends ElevatedButtonNode,
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
  ElevatedButtonNode $make(CopyWithData data) => ElevatedButtonNode(
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
  ElevatedButtonNodeCopyWith<$R2, ElevatedButtonNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ElevatedButtonNodeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
