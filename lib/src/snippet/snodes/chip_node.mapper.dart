// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'chip_node.dart';

class ChipNodeMapper extends SubClassMapperBase<ChipNode> {
  ChipNodeMapper._();

  static ChipNodeMapper? _instance;
  static ChipNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChipNodeMapper._());
      CLMapper.ensureInitialized().addSubMapper(_instance!);
      TextStyleGroupMapper.ensureInitialized();
      EdgeInsetsValueMapper.ensureInitialized();
      SnippetTemplateEnumMapper.ensureInitialized();
      CalloutConfigGroupMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ChipNode';

  static String _$label(ChipNode v) => v.label;
  static const Field<ChipNode, String> _f$label =
      Field('label', _$label, opt: true, def: 'chip-name?');
  static TextStyleGroup? _$labelStyle(ChipNode v) => v.labelStyle;
  static const Field<ChipNode, TextStyleGroup> _f$labelStyle =
      Field('labelStyle', _$labelStyle, opt: true);
  static EdgeInsetsValue? _$labelPadding(ChipNode v) => v.labelPadding;
  static const Field<ChipNode, EdgeInsetsValue> _f$labelPadding =
      Field('labelPadding', _$labelPadding, opt: true);
  static int? _$bgColorValue(ChipNode v) => v.bgColorValue;
  static const Field<ChipNode, int> _f$bgColorValue =
      Field('bgColorValue', _$bgColorValue, opt: true);
  static int? _$disabledColorValue(ChipNode v) => v.disabledColorValue;
  static const Field<ChipNode, int> _f$disabledColorValue =
      Field('disabledColorValue', _$disabledColorValue, opt: true);
  static int? _$selectedColorValue(ChipNode v) => v.selectedColorValue;
  static const Field<ChipNode, int> _f$selectedColorValue =
      Field('selectedColorValue', _$selectedColorValue, opt: true);
  static bool _$enabled(ChipNode v) => v.enabled;
  static const Field<ChipNode, bool> _f$enabled =
      Field('enabled', _$enabled, opt: true, def: false);
  static String? _$destinationPanelOrPlaceholderName(ChipNode v) =>
      v.destinationPanelOrPlaceholderName;
  static const Field<ChipNode, String> _f$destinationPanelOrPlaceholderName =
      Field('destinationPanelOrPlaceholderName',
          _$destinationPanelOrPlaceholderName,
          opt: true);
  static String? _$destinationSnippetName(ChipNode v) =>
      v.destinationSnippetName;
  static const Field<ChipNode, String> _f$destinationSnippetName =
      Field('destinationSnippetName', _$destinationSnippetName, opt: true);
  static String? _$destinationRoutePathSnippetName(ChipNode v) =>
      v.destinationRoutePathSnippetName;
  static const Field<ChipNode, String> _f$destinationRoutePathSnippetName =
      Field(
          'destinationRoutePathSnippetName', _$destinationRoutePathSnippetName,
          opt: true);
  static SnippetTemplateEnum? _$template(ChipNode v) => v.template;
  static const Field<ChipNode, SnippetTemplateEnum> _f$template =
      Field('template', _$template, opt: true);
  static String? _$onTapHandlerName(ChipNode v) => v.onTapHandlerName;
  static const Field<ChipNode, String> _f$onTapHandlerName =
      Field('onTapHandlerName', _$onTapHandlerName, opt: true);
  static CalloutConfigGroup? _$calloutConfigGroup(ChipNode v) =>
      v.calloutConfigGroup;
  static const Field<ChipNode, CalloutConfigGroup> _f$calloutConfigGroup =
      Field('calloutConfigGroup', _$calloutConfigGroup, opt: true);
  static String _$uid(ChipNode v) => v.uid;
  static const Field<ChipNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static bool _$isExpanded(ChipNode v) => v.isExpanded;
  static const Field<ChipNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static Rect? _$measuredRect(ChipNode v) => v.measuredRect;
  static const Field<ChipNode, Rect> _f$measuredRect =
      Field('measuredRect', _$measuredRect, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(ChipNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<ChipNode, bool> _f$hidePropertiesWhileDragging = Field(
      'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
      mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(ChipNode v) =>
      v.nodeWidgetGK;
  static const Field<ChipNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<ChipNode> fields = const {
    #label: _f$label,
    #labelStyle: _f$labelStyle,
    #labelPadding: _f$labelPadding,
    #bgColorValue: _f$bgColorValue,
    #disabledColorValue: _f$disabledColorValue,
    #selectedColorValue: _f$selectedColorValue,
    #enabled: _f$enabled,
    #destinationPanelOrPlaceholderName: _f$destinationPanelOrPlaceholderName,
    #destinationSnippetName: _f$destinationSnippetName,
    #destinationRoutePathSnippetName: _f$destinationRoutePathSnippetName,
    #template: _f$template,
    #onTapHandlerName: _f$onTapHandlerName,
    #calloutConfigGroup: _f$calloutConfigGroup,
    #uid: _f$uid,
    #isExpanded: _f$isExpanded,
    #measuredRect: _f$measuredRect,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'cl';
  @override
  final dynamic discriminatorValue = 'ChipNode';
  @override
  late final ClassMapperBase superMapper = CLMapper.ensureInitialized();

  static ChipNode _instantiate(DecodingData data) {
    return ChipNode(
        label: data.dec(_f$label),
        labelStyle: data.dec(_f$labelStyle),
        labelPadding: data.dec(_f$labelPadding),
        bgColorValue: data.dec(_f$bgColorValue),
        disabledColorValue: data.dec(_f$disabledColorValue),
        selectedColorValue: data.dec(_f$selectedColorValue),
        enabled: data.dec(_f$enabled),
        destinationPanelOrPlaceholderName:
            data.dec(_f$destinationPanelOrPlaceholderName),
        destinationSnippetName: data.dec(_f$destinationSnippetName),
        destinationRoutePathSnippetName:
            data.dec(_f$destinationRoutePathSnippetName),
        template: data.dec(_f$template),
        onTapHandlerName: data.dec(_f$onTapHandlerName),
        calloutConfigGroup: data.dec(_f$calloutConfigGroup));
  }

  @override
  final Function instantiate = _instantiate;

  static ChipNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ChipNode>(map);
  }

  static ChipNode fromJson(String json) {
    return ensureInitialized().decodeJson<ChipNode>(json);
  }
}

mixin ChipNodeMappable {
  String toJson() {
    return ChipNodeMapper.ensureInitialized()
        .encodeJson<ChipNode>(this as ChipNode);
  }

  Map<String, dynamic> toMap() {
    return ChipNodeMapper.ensureInitialized()
        .encodeMap<ChipNode>(this as ChipNode);
  }

  ChipNodeCopyWith<ChipNode, ChipNode, ChipNode> get copyWith =>
      _ChipNodeCopyWithImpl(this as ChipNode, $identity, $identity);
  @override
  String toString() {
    return ChipNodeMapper.ensureInitialized().stringifyValue(this as ChipNode);
  }

  @override
  bool operator ==(Object other) {
    return ChipNodeMapper.ensureInitialized()
        .equalsValue(this as ChipNode, other);
  }

  @override
  int get hashCode {
    return ChipNodeMapper.ensureInitialized().hashValue(this as ChipNode);
  }
}

extension ChipNodeValueCopy<$R, $Out> on ObjectCopyWith<$R, ChipNode, $Out> {
  ChipNodeCopyWith<$R, ChipNode, $Out> get $asChipNode =>
      $base.as((v, t, t2) => _ChipNodeCopyWithImpl(v, t, t2));
}

abstract class ChipNodeCopyWith<$R, $In extends ChipNode, $Out>
    implements CLCopyWith<$R, $In, $Out> {
  TextStyleGroupCopyWith<$R, TextStyleGroup, TextStyleGroup>? get labelStyle;
  EdgeInsetsValueCopyWith<$R, EdgeInsetsValue, EdgeInsetsValue>?
      get labelPadding;
  CalloutConfigGroupCopyWith<$R, CalloutConfigGroup, CalloutConfigGroup>?
      get calloutConfigGroup;
  @override
  $R call(
      {String? label,
      TextStyleGroup? labelStyle,
      EdgeInsetsValue? labelPadding,
      int? bgColorValue,
      int? disabledColorValue,
      int? selectedColorValue,
      bool? enabled,
      String? destinationPanelOrPlaceholderName,
      String? destinationSnippetName,
      String? destinationRoutePathSnippetName,
      SnippetTemplateEnum? template,
      String? onTapHandlerName,
      CalloutConfigGroup? calloutConfigGroup});
  ChipNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ChipNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ChipNode, $Out>
    implements ChipNodeCopyWith<$R, ChipNode, $Out> {
  _ChipNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ChipNode> $mapper =
      ChipNodeMapper.ensureInitialized();
  @override
  TextStyleGroupCopyWith<$R, TextStyleGroup, TextStyleGroup>? get labelStyle =>
      $value.labelStyle?.copyWith.$chain((v) => call(labelStyle: v));
  @override
  EdgeInsetsValueCopyWith<$R, EdgeInsetsValue, EdgeInsetsValue>?
      get labelPadding =>
          $value.labelPadding?.copyWith.$chain((v) => call(labelPadding: v));
  @override
  CalloutConfigGroupCopyWith<$R, CalloutConfigGroup, CalloutConfigGroup>?
      get calloutConfigGroup => $value.calloutConfigGroup?.copyWith
          .$chain((v) => call(calloutConfigGroup: v));
  @override
  $R call(
          {String? label,
          Object? labelStyle = $none,
          Object? labelPadding = $none,
          Object? bgColorValue = $none,
          Object? disabledColorValue = $none,
          Object? selectedColorValue = $none,
          bool? enabled,
          Object? destinationPanelOrPlaceholderName = $none,
          Object? destinationSnippetName = $none,
          Object? destinationRoutePathSnippetName = $none,
          Object? template = $none,
          Object? onTapHandlerName = $none,
          Object? calloutConfigGroup = $none}) =>
      $apply(FieldCopyWithData({
        if (label != null) #label: label,
        if (labelStyle != $none) #labelStyle: labelStyle,
        if (labelPadding != $none) #labelPadding: labelPadding,
        if (bgColorValue != $none) #bgColorValue: bgColorValue,
        if (disabledColorValue != $none)
          #disabledColorValue: disabledColorValue,
        if (selectedColorValue != $none)
          #selectedColorValue: selectedColorValue,
        if (enabled != null) #enabled: enabled,
        if (destinationPanelOrPlaceholderName != $none)
          #destinationPanelOrPlaceholderName: destinationPanelOrPlaceholderName,
        if (destinationSnippetName != $none)
          #destinationSnippetName: destinationSnippetName,
        if (destinationRoutePathSnippetName != $none)
          #destinationRoutePathSnippetName: destinationRoutePathSnippetName,
        if (template != $none) #template: template,
        if (onTapHandlerName != $none) #onTapHandlerName: onTapHandlerName,
        if (calloutConfigGroup != $none) #calloutConfigGroup: calloutConfigGroup
      }));
  @override
  ChipNode $make(CopyWithData data) => ChipNode(
      label: data.get(#label, or: $value.label),
      labelStyle: data.get(#labelStyle, or: $value.labelStyle),
      labelPadding: data.get(#labelPadding, or: $value.labelPadding),
      bgColorValue: data.get(#bgColorValue, or: $value.bgColorValue),
      disabledColorValue:
          data.get(#disabledColorValue, or: $value.disabledColorValue),
      selectedColorValue:
          data.get(#selectedColorValue, or: $value.selectedColorValue),
      enabled: data.get(#enabled, or: $value.enabled),
      destinationPanelOrPlaceholderName: data.get(
          #destinationPanelOrPlaceholderName,
          or: $value.destinationPanelOrPlaceholderName),
      destinationSnippetName:
          data.get(#destinationSnippetName, or: $value.destinationSnippetName),
      destinationRoutePathSnippetName: data.get(
          #destinationRoutePathSnippetName,
          or: $value.destinationRoutePathSnippetName),
      template: data.get(#template, or: $value.template),
      onTapHandlerName:
          data.get(#onTapHandlerName, or: $value.onTapHandlerName),
      calloutConfigGroup:
          data.get(#calloutConfigGroup, or: $value.calloutConfigGroup));

  @override
  ChipNodeCopyWith<$R2, ChipNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ChipNodeCopyWithImpl($value, $cast, t);
}
