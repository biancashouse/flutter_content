// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'filled_button_node.dart';

class FilledButtonNodeMapper extends SubClassMapperBase<FilledButtonNode> {
  FilledButtonNodeMapper._();

  static FilledButtonNodeMapper? _instance;
  static FilledButtonNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FilledButtonNodeMapper._());
      ButtonNodeMapper.ensureInitialized().addSubMapper(_instance!);
      SnippetTemplateEnumMapper.ensureInitialized();
      ButtonStylePropertiesMapper.ensureInitialized();
      CalloutConfigModelMapper.ensureInitialized();
      SNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'FilledButtonNode';

  static String? _$destinationRoutePathSnippetName(FilledButtonNode v) =>
      v.destinationRoutePathSnippetName;
  static const Field<FilledButtonNode, String>
      _f$destinationRoutePathSnippetName = Field(
          'destinationRoutePathSnippetName', _$destinationRoutePathSnippetName,
          opt: true);
  static SnippetTemplateEnum? _$template(FilledButtonNode v) => v.template;
  static const Field<FilledButtonNode, SnippetTemplateEnum> _f$template =
      Field('template', _$template, opt: true);
  static ButtonStyleProperties _$bsPropGroup(FilledButtonNode v) =>
      v.bsPropGroup;
  static const Field<FilledButtonNode, ButtonStyleProperties> _f$bsPropGroup =
      Field('bsPropGroup', _$bsPropGroup, hook: ButtonStyleHook());
  static String? _$onTapHandlerName(FilledButtonNode v) => v.onTapHandlerName;
  static const Field<FilledButtonNode, String> _f$onTapHandlerName =
      Field('onTapHandlerName', _$onTapHandlerName, opt: true);
  static CalloutConfigModel? _$calloutConfig(FilledButtonNode v) =>
      v.calloutConfig;
  static const Field<FilledButtonNode, CalloutConfigModel> _f$calloutConfig =
      Field('calloutConfig', _$calloutConfig, opt: true);
  static SNode? _$child(FilledButtonNode v) => v.child;
  static const Field<FilledButtonNode, SNode> _f$child =
      Field('child', _$child, opt: true);
  static String _$uid(FilledButtonNode v) => v.uid;
  static const Field<FilledButtonNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static bool _$isExpanded(FilledButtonNode v) => v.isExpanded;
  static const Field<FilledButtonNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(FilledButtonNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<FilledButtonNode, bool> _f$hidePropertiesWhileDragging =
      Field('hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
          mode: FieldMode.member);

  @override
  final MappableFields<FilledButtonNode> fields = const {
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
  final dynamic discriminatorValue = 'FilledButtonNode';
  @override
  late final ClassMapperBase superMapper = ButtonNodeMapper.ensureInitialized();

  static FilledButtonNode _instantiate(DecodingData data) {
    return FilledButtonNode(
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

  static FilledButtonNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FilledButtonNode>(map);
  }

  static FilledButtonNode fromJson(String json) {
    return ensureInitialized().decodeJson<FilledButtonNode>(json);
  }
}

mixin FilledButtonNodeMappable {
  String toJson() {
    return FilledButtonNodeMapper.ensureInitialized()
        .encodeJson<FilledButtonNode>(this as FilledButtonNode);
  }

  Map<String, dynamic> toMap() {
    return FilledButtonNodeMapper.ensureInitialized()
        .encodeMap<FilledButtonNode>(this as FilledButtonNode);
  }

  FilledButtonNodeCopyWith<FilledButtonNode, FilledButtonNode, FilledButtonNode>
      get copyWith =>
          _FilledButtonNodeCopyWithImpl<FilledButtonNode, FilledButtonNode>(
              this as FilledButtonNode, $identity, $identity);
  @override
  String toString() {
    return FilledButtonNodeMapper.ensureInitialized()
        .stringifyValue(this as FilledButtonNode);
  }

  @override
  bool operator ==(Object other) {
    return FilledButtonNodeMapper.ensureInitialized()
        .equalsValue(this as FilledButtonNode, other);
  }

  @override
  int get hashCode {
    return FilledButtonNodeMapper.ensureInitialized()
        .hashValue(this as FilledButtonNode);
  }
}

extension FilledButtonNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FilledButtonNode, $Out> {
  FilledButtonNodeCopyWith<$R, FilledButtonNode, $Out>
      get $asFilledButtonNode => $base
          .as((v, t, t2) => _FilledButtonNodeCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class FilledButtonNodeCopyWith<$R, $In extends FilledButtonNode, $Out>
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
  FilledButtonNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _FilledButtonNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FilledButtonNode, $Out>
    implements FilledButtonNodeCopyWith<$R, FilledButtonNode, $Out> {
  _FilledButtonNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FilledButtonNode> $mapper =
      FilledButtonNodeMapper.ensureInitialized();
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
  FilledButtonNode $make(CopyWithData data) => FilledButtonNode(
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
  FilledButtonNodeCopyWith<$R2, FilledButtonNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _FilledButtonNodeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
