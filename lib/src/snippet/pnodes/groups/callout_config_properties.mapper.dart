// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'callout_config_properties.dart';

class CalloutConfigPropertiesMapper
    extends ClassMapperBase<CalloutConfigProperties> {
  CalloutConfigPropertiesMapper._();

  static CalloutConfigPropertiesMapper? _instance;
  static CalloutConfigPropertiesMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = CalloutConfigPropertiesMapper._());
      AlignmentEnumMapper.ensureInitialized();
      ArrowTypeEnumMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CalloutConfigProperties';

  static String? _$cid(CalloutConfigProperties v) => v.cid;
  static const Field<CalloutConfigProperties, String> _f$cid =
      Field('cid', _$cid, opt: true);
  static AlignmentEnum? _$targetAlignment(CalloutConfigProperties v) =>
      v.targetAlignment;
  static const Field<CalloutConfigProperties, AlignmentEnum>
      _f$targetAlignment =
      Field('targetAlignment', _$targetAlignment, opt: true);
  static double? _$calloutTop(CalloutConfigProperties v) => v.calloutTop;
  static const Field<CalloutConfigProperties, double> _f$calloutTop =
      Field('calloutTop', _$calloutTop, opt: true);
  static double? _$calloutLeft(CalloutConfigProperties v) => v.calloutLeft;
  static const Field<CalloutConfigProperties, double> _f$calloutLeft =
      Field('calloutLeft', _$calloutLeft, opt: true);
  static int? _$colorValue(CalloutConfigProperties v) => v.colorValue;
  static const Field<CalloutConfigProperties, int> _f$colorValue =
      Field('colorValue', _$colorValue, opt: true);
  static ArrowTypeEnum? _$arrowType(CalloutConfigProperties v) => v.arrowType;
  static const Field<CalloutConfigProperties, ArrowTypeEnum> _f$arrowType =
      Field('arrowType', _$arrowType, opt: true);
  static Color? _$arrowColor(CalloutConfigProperties v) => v.arrowColor;
  static const Field<CalloutConfigProperties, Color> _f$arrowColor =
      Field('arrowColor', _$arrowColor, opt: true);
  static double? _$separation(CalloutConfigProperties v) => v.separation;
  static const Field<CalloutConfigProperties, double> _f$separation =
      Field('separation', _$separation, opt: true);
  static bool _$resizableH(CalloutConfigProperties v) => v.resizableH;
  static const Field<CalloutConfigProperties, bool> _f$resizableH =
      Field('resizableH', _$resizableH, opt: true, def: true);
  static bool _$resizableV(CalloutConfigProperties v) => v.resizableV;
  static const Field<CalloutConfigProperties, bool> _f$resizableV =
      Field('resizableV', _$resizableV, opt: true, def: true);
  static bool _$closeOnBarrierTap(CalloutConfigProperties v) =>
      v.closeOnBarrierTap;
  static const Field<CalloutConfigProperties, bool> _f$closeOnBarrierTap =
      Field('closeOnBarrierTap', _$closeOnBarrierTap, opt: true, def: true);
  static bool _$showCloseButton(CalloutConfigProperties v) => v.showCloseButton;
  static const Field<CalloutConfigProperties, bool> _f$showCloseButton =
      Field('showCloseButton', _$showCloseButton, opt: true, def: false);
  static double? _$closeAfterMs(CalloutConfigProperties v) => v.closeAfterMs;
  static const Field<CalloutConfigProperties, double> _f$closeAfterMs =
      Field('closeAfterMs', _$closeAfterMs, opt: true);

  @override
  final MappableFields<CalloutConfigProperties> fields = const {
    #cid: _f$cid,
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

  static CalloutConfigProperties _instantiate(DecodingData data) {
    return CalloutConfigProperties(
        cid: data.dec(_f$cid),
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

  static CalloutConfigProperties fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CalloutConfigProperties>(map);
  }

  static CalloutConfigProperties fromJson(String json) {
    return ensureInitialized().decodeJson<CalloutConfigProperties>(json);
  }
}

mixin CalloutConfigPropertiesMappable {
  String toJson() {
    return CalloutConfigPropertiesMapper.ensureInitialized()
        .encodeJson<CalloutConfigProperties>(this as CalloutConfigProperties);
  }

  Map<String, dynamic> toMap() {
    return CalloutConfigPropertiesMapper.ensureInitialized()
        .encodeMap<CalloutConfigProperties>(this as CalloutConfigProperties);
  }

  CalloutConfigPropertiesCopyWith<CalloutConfigProperties,
          CalloutConfigProperties, CalloutConfigProperties>
      get copyWith => _CalloutConfigPropertiesCopyWithImpl(
          this as CalloutConfigProperties, $identity, $identity);
  @override
  String toString() {
    return CalloutConfigPropertiesMapper.ensureInitialized()
        .stringifyValue(this as CalloutConfigProperties);
  }

  @override
  bool operator ==(Object other) {
    return CalloutConfigPropertiesMapper.ensureInitialized()
        .equalsValue(this as CalloutConfigProperties, other);
  }

  @override
  int get hashCode {
    return CalloutConfigPropertiesMapper.ensureInitialized()
        .hashValue(this as CalloutConfigProperties);
  }
}

extension CalloutConfigPropertiesValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CalloutConfigProperties, $Out> {
  CalloutConfigPropertiesCopyWith<$R, CalloutConfigProperties, $Out>
      get $asCalloutConfigProperties => $base
          .as((v, t, t2) => _CalloutConfigPropertiesCopyWithImpl(v, t, t2));
}

abstract class CalloutConfigPropertiesCopyWith<
    $R,
    $In extends CalloutConfigProperties,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? cid,
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
  CalloutConfigPropertiesCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CalloutConfigPropertiesCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CalloutConfigProperties, $Out>
    implements
        CalloutConfigPropertiesCopyWith<$R, CalloutConfigProperties, $Out> {
  _CalloutConfigPropertiesCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CalloutConfigProperties> $mapper =
      CalloutConfigPropertiesMapper.ensureInitialized();
  @override
  $R call(
          {Object? cid = $none,
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
        if (cid != $none) #cid: cid,
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
  CalloutConfigProperties $make(CopyWithData data) => CalloutConfigProperties(
      cid: data.get(#cid, or: $value.cid),
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
  CalloutConfigPropertiesCopyWith<$R2, CalloutConfigProperties, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _CalloutConfigPropertiesCopyWithImpl($value, $cast, t);
}
