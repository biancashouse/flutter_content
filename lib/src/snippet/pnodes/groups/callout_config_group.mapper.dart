// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'callout_config_group.dart';

class CalloutConfigGroupMapper extends ClassMapperBase<CalloutConfigGroup> {
  CalloutConfigGroupMapper._();

  static CalloutConfigGroupMapper? _instance;
  static CalloutConfigGroupMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CalloutConfigGroupMapper._());
      AlignmentEnumMapper.ensureInitialized();
      ArrowTypeEnumMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CalloutConfigGroup';

  static String? _$contentSnippetName(CalloutConfigGroup v) =>
      v.contentSnippetName;
  static const Field<CalloutConfigGroup, String> _f$contentSnippetName =
      Field('contentSnippetName', _$contentSnippetName, opt: true);
  static AlignmentEnum? _$targetAlignment(CalloutConfigGroup v) =>
      v.targetAlignment;
  static const Field<CalloutConfigGroup, AlignmentEnum> _f$targetAlignment =
      Field('targetAlignment', _$targetAlignment, opt: true);
  static double? _$calloutTop(CalloutConfigGroup v) => v.calloutTop;
  static const Field<CalloutConfigGroup, double> _f$calloutTop =
      Field('calloutTop', _$calloutTop, opt: true);
  static double? _$calloutLeft(CalloutConfigGroup v) => v.calloutLeft;
  static const Field<CalloutConfigGroup, double> _f$calloutLeft =
      Field('calloutLeft', _$calloutLeft, opt: true);
  static int? _$colorValue(CalloutConfigGroup v) => v.colorValue;
  static const Field<CalloutConfigGroup, int> _f$colorValue =
      Field('colorValue', _$colorValue, opt: true);
  static ArrowTypeEnum? _$arrowType(CalloutConfigGroup v) => v.arrowType;
  static const Field<CalloutConfigGroup, ArrowTypeEnum> _f$arrowType =
      Field('arrowType', _$arrowType, opt: true);
  static Color? _$arrowColor(CalloutConfigGroup v) => v.arrowColor;
  static const Field<CalloutConfigGroup, Color> _f$arrowColor =
      Field('arrowColor', _$arrowColor, opt: true);
  static double? _$separation(CalloutConfigGroup v) => v.separation;
  static const Field<CalloutConfigGroup, double> _f$separation =
      Field('separation', _$separation, opt: true);
  static bool _$resizableH(CalloutConfigGroup v) => v.resizableH;
  static const Field<CalloutConfigGroup, bool> _f$resizableH =
      Field('resizableH', _$resizableH, opt: true, def: true);
  static bool _$resizableV(CalloutConfigGroup v) => v.resizableV;
  static const Field<CalloutConfigGroup, bool> _f$resizableV =
      Field('resizableV', _$resizableV, opt: true, def: true);
  static bool _$closeOnBarrierTap(CalloutConfigGroup v) => v.closeOnBarrierTap;
  static const Field<CalloutConfigGroup, bool> _f$closeOnBarrierTap =
      Field('closeOnBarrierTap', _$closeOnBarrierTap, opt: true, def: true);
  static bool _$showCloseButton(CalloutConfigGroup v) => v.showCloseButton;
  static const Field<CalloutConfigGroup, bool> _f$showCloseButton =
      Field('showCloseButton', _$showCloseButton, opt: true, def: false);
  static double? _$closeAfterMs(CalloutConfigGroup v) => v.closeAfterMs;
  static const Field<CalloutConfigGroup, double> _f$closeAfterMs =
      Field('closeAfterMs', _$closeAfterMs, opt: true);

  @override
  final MappableFields<CalloutConfigGroup> fields = const {
    #contentSnippetName: _f$contentSnippetName,
    #targetAlignment: _f$targetAlignment,
    #calloutTop: _f$calloutTop,
    #calloutLeft: _f$calloutLeft,
    #colorValue: _f$colorValue,
    #arrowType: _f$arrowType,
    #arrowColor: _f$arrowColor,
    #separation: _f$separation,
    #resizableH: _f$resizableH,
    #resizableV: _f$resizableV,
    #closeOnBarrierTap: _f$closeOnBarrierTap,
    #showCloseButton: _f$showCloseButton,
    #closeAfterMs: _f$closeAfterMs,
  };

  static CalloutConfigGroup _instantiate(DecodingData data) {
    return CalloutConfigGroup(
        contentSnippetName: data.dec(_f$contentSnippetName),
        targetAlignment: data.dec(_f$targetAlignment),
        calloutTop: data.dec(_f$calloutTop),
        calloutLeft: data.dec(_f$calloutLeft),
        colorValue: data.dec(_f$colorValue),
        arrowType: data.dec(_f$arrowType),
        arrowColor: data.dec(_f$arrowColor),
        separation: data.dec(_f$separation),
        resizableH: data.dec(_f$resizableH),
        resizableV: data.dec(_f$resizableV),
        closeOnBarrierTap: data.dec(_f$closeOnBarrierTap),
        showCloseButton: data.dec(_f$showCloseButton),
        closeAfterMs: data.dec(_f$closeAfterMs));
  }

  @override
  final Function instantiate = _instantiate;

  static CalloutConfigGroup fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CalloutConfigGroup>(map);
  }

  static CalloutConfigGroup fromJson(String json) {
    return ensureInitialized().decodeJson<CalloutConfigGroup>(json);
  }
}

mixin CalloutConfigGroupMappable {
  String toJson() {
    return CalloutConfigGroupMapper.ensureInitialized()
        .encodeJson<CalloutConfigGroup>(this as CalloutConfigGroup);
  }

  Map<String, dynamic> toMap() {
    return CalloutConfigGroupMapper.ensureInitialized()
        .encodeMap<CalloutConfigGroup>(this as CalloutConfigGroup);
  }

  CalloutConfigGroupCopyWith<CalloutConfigGroup, CalloutConfigGroup,
          CalloutConfigGroup>
      get copyWith => _CalloutConfigGroupCopyWithImpl(
          this as CalloutConfigGroup, $identity, $identity);
  @override
  String toString() {
    return CalloutConfigGroupMapper.ensureInitialized()
        .stringifyValue(this as CalloutConfigGroup);
  }

  @override
  bool operator ==(Object other) {
    return CalloutConfigGroupMapper.ensureInitialized()
        .equalsValue(this as CalloutConfigGroup, other);
  }

  @override
  int get hashCode {
    return CalloutConfigGroupMapper.ensureInitialized()
        .hashValue(this as CalloutConfigGroup);
  }
}

extension CalloutConfigGroupValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CalloutConfigGroup, $Out> {
  CalloutConfigGroupCopyWith<$R, CalloutConfigGroup, $Out>
      get $asCalloutConfigGroup =>
          $base.as((v, t, t2) => _CalloutConfigGroupCopyWithImpl(v, t, t2));
}

abstract class CalloutConfigGroupCopyWith<$R, $In extends CalloutConfigGroup,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? contentSnippetName,
      AlignmentEnum? targetAlignment,
      double? calloutTop,
      double? calloutLeft,
      int? colorValue,
      ArrowTypeEnum? arrowType,
      Color? arrowColor,
      double? separation,
      bool? resizableH,
      bool? resizableV,
      bool? closeOnBarrierTap,
      bool? showCloseButton,
      double? closeAfterMs});
  CalloutConfigGroupCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CalloutConfigGroupCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CalloutConfigGroup, $Out>
    implements CalloutConfigGroupCopyWith<$R, CalloutConfigGroup, $Out> {
  _CalloutConfigGroupCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CalloutConfigGroup> $mapper =
      CalloutConfigGroupMapper.ensureInitialized();
  @override
  $R call(
          {Object? contentSnippetName = $none,
          Object? targetAlignment = $none,
          Object? calloutTop = $none,
          Object? calloutLeft = $none,
          Object? colorValue = $none,
          Object? arrowType = $none,
          Object? arrowColor = $none,
          Object? separation = $none,
          bool? resizableH,
          bool? resizableV,
          bool? closeOnBarrierTap,
          bool? showCloseButton,
          Object? closeAfterMs = $none}) =>
      $apply(FieldCopyWithData({
        if (contentSnippetName != $none)
          #contentSnippetName: contentSnippetName,
        if (targetAlignment != $none) #targetAlignment: targetAlignment,
        if (calloutTop != $none) #calloutTop: calloutTop,
        if (calloutLeft != $none) #calloutLeft: calloutLeft,
        if (colorValue != $none) #colorValue: colorValue,
        if (arrowType != $none) #arrowType: arrowType,
        if (arrowColor != $none) #arrowColor: arrowColor,
        if (separation != $none) #separation: separation,
        if (resizableH != null) #resizableH: resizableH,
        if (resizableV != null) #resizableV: resizableV,
        if (closeOnBarrierTap != null) #closeOnBarrierTap: closeOnBarrierTap,
        if (showCloseButton != null) #showCloseButton: showCloseButton,
        if (closeAfterMs != $none) #closeAfterMs: closeAfterMs
      }));
  @override
  CalloutConfigGroup $make(CopyWithData data) => CalloutConfigGroup(
      contentSnippetName:
          data.get(#contentSnippetName, or: $value.contentSnippetName),
      targetAlignment: data.get(#targetAlignment, or: $value.targetAlignment),
      calloutTop: data.get(#calloutTop, or: $value.calloutTop),
      calloutLeft: data.get(#calloutLeft, or: $value.calloutLeft),
      colorValue: data.get(#colorValue, or: $value.colorValue),
      arrowType: data.get(#arrowType, or: $value.arrowType),
      arrowColor: data.get(#arrowColor, or: $value.arrowColor),
      separation: data.get(#separation, or: $value.separation),
      resizableH: data.get(#resizableH, or: $value.resizableH),
      resizableV: data.get(#resizableV, or: $value.resizableV),
      closeOnBarrierTap:
          data.get(#closeOnBarrierTap, or: $value.closeOnBarrierTap),
      showCloseButton: data.get(#showCloseButton, or: $value.showCloseButton),
      closeAfterMs: data.get(#closeAfterMs, or: $value.closeAfterMs));

  @override
  CalloutConfigGroupCopyWith<$R2, CalloutConfigGroup, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CalloutConfigGroupCopyWithImpl($value, $cast, t);
}
