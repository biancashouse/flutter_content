// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'target_model.dart';

class TargetModelMapper extends ClassMapperBase<TargetModel> {
  TargetModelMapper._();

  static TargetModelMapper? _instance;
  static TargetModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TargetModelMapper._());
      UpTo6ColorsMapper.ensureInitialized();
      DecorationShapeEnumMapper.ensureInitialized();
      TargetPointerTypeEnumMapper.ensureInitialized();
      ColorModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TargetModel';

  static int _$uid(TargetModel v) => v.uid;
  static const Field<TargetModel, int> _f$uid = Field('uid', _$uid);
  static double _$transformScale(TargetModel v) => v.transformScale;
  static const Field<TargetModel, double> _f$transformScale =
      Field('transformScale', _$transformScale, opt: true, def: 1.0);
  static double? _$radiusPc(TargetModel v) => v.radiusPc;
  static const Field<TargetModel, double> _f$radiusPc =
      Field('radiusPc', _$radiusPc, opt: true);
  static int _$calloutDurationMs(TargetModel v) => v.calloutDurationMs;
  static const Field<TargetModel, int> _f$calloutDurationMs =
      Field('calloutDurationMs', _$calloutDurationMs, opt: true, def: 1500);
  static double _$calloutWidth(TargetModel v) => v.calloutWidth;
  static const Field<TargetModel, double> _f$calloutWidth =
      Field('calloutWidth', _$calloutWidth, opt: true, def: 400);
  static double _$calloutHeight(TargetModel v) => v.calloutHeight;
  static const Field<TargetModel, double> _f$calloutHeight =
      Field('calloutHeight', _$calloutHeight, opt: true, def: 85);
  static double? _$calloutTopPc(TargetModel v) => v.calloutTopPc;
  static const Field<TargetModel, double> _f$calloutTopPc =
      Field('calloutTopPc', _$calloutTopPc, opt: true);
  static double? _$calloutLeftPc(TargetModel v) => v.calloutLeftPc;
  static const Field<TargetModel, double> _f$calloutLeftPc =
      Field('calloutLeftPc', _$calloutLeftPc, opt: true);
  static double? _$btnLocalTopPc(TargetModel v) => v.btnLocalTopPc;
  static const Field<TargetModel, double> _f$btnLocalTopPc =
      Field('btnLocalTopPc', _$btnLocalTopPc, opt: true);
  static double? _$btnLocalLeftPc(TargetModel v) => v.btnLocalLeftPc;
  static const Field<TargetModel, double> _f$btnLocalLeftPc =
      Field('btnLocalLeftPc', _$btnLocalLeftPc, opt: true);
  static double? _$targetLocalPosLeftPc(TargetModel v) =>
      v.targetLocalPosLeftPc;
  static const Field<TargetModel, double> _f$targetLocalPosLeftPc =
      Field('targetLocalPosLeftPc', _$targetLocalPosLeftPc, opt: true);
  static double? _$targetLocalPosTopPc(TargetModel v) => v.targetLocalPosTopPc;
  static const Field<TargetModel, double> _f$targetLocalPosTopPc =
      Field('targetLocalPosTopPc', _$targetLocalPosTopPc, opt: true);
  static bool _$showCover(TargetModel v) => v.showCover;
  static const Field<TargetModel, bool> _f$showCover =
      Field('showCover', _$showCover, opt: true, def: true);
  static bool _$showBtn(TargetModel v) => v.showBtn;
  static const Field<TargetModel, bool> _f$showBtn =
      Field('showBtn', _$showBtn, opt: true, def: true);
  static bool _$canResizeH(TargetModel v) => v.canResizeH;
  static const Field<TargetModel, bool> _f$canResizeH =
      Field('canResizeH', _$canResizeH, opt: true, def: true);
  static bool _$canResizeV(TargetModel v) => v.canResizeV;
  static const Field<TargetModel, bool> _f$canResizeV =
      Field('canResizeV', _$canResizeV, opt: true, def: true);
  static bool _$followScroll(TargetModel v) => v.followScroll;
  static const Field<TargetModel, bool> _f$followScroll =
      Field('followScroll', _$followScroll, opt: true, def: true);
  static UpTo6Colors? _$calloutFillColors(TargetModel v) => v.calloutFillColors;
  static const Field<TargetModel, UpTo6Colors> _f$calloutFillColors =
      Field('calloutFillColors', _$calloutFillColors, opt: true);
  static UpTo6Colors? _$calloutBorderColors(TargetModel v) =>
      v.calloutBorderColors;
  static const Field<TargetModel, UpTo6Colors> _f$calloutBorderColors =
      Field('calloutBorderColors', _$calloutBorderColors, opt: true);
  static DecorationShapeEnum? _$calloutDecorationShapeEnum(TargetModel v) =>
      v.calloutDecorationShapeEnum;
  static const Field<TargetModel, DecorationShapeEnum>
      _f$calloutDecorationShapeEnum = Field(
          'calloutDecorationShapeEnum', _$calloutDecorationShapeEnum,
          opt: true);
  static double _$calloutBorderRadius(TargetModel v) => v.calloutBorderRadius;
  static const Field<TargetModel, double> _f$calloutBorderRadius =
      Field('calloutBorderRadius', _$calloutBorderRadius, opt: true, def: 30);
  static double _$calloutBorderThickness(TargetModel v) =>
      v.calloutBorderThickness;
  static const Field<TargetModel, double> _f$calloutBorderThickness = Field(
      'calloutBorderThickness', _$calloutBorderThickness,
      opt: true, def: 1);
  static int? _$starPoints(TargetModel v) => v.starPoints;
  static const Field<TargetModel, int> _f$starPoints =
      Field('starPoints', _$starPoints, opt: true);
  static TargetPointerTypeEnum? _$targetPointerTypeEnum(TargetModel v) =>
      v.targetPointerTypeEnum;
  static const Field<TargetModel, TargetPointerTypeEnum>
      _f$targetPointerTypeEnum =
      Field('targetPointerTypeEnum', _$targetPointerTypeEnum, opt: true);
  static ColorModel? _$bubbleOrTargetPointerColor(TargetModel v) =>
      v.bubbleOrTargetPointerColor;
  static const Field<TargetModel, ColorModel> _f$bubbleOrTargetPointerColor =
      Field('bubbleOrTargetPointerColor', _$bubbleOrTargetPointerColor,
          opt: true);
  static bool? _$animatePointer(TargetModel v) => v.animatePointer;
  static const Field<TargetModel, bool> _f$animatePointer =
      Field('animatePointer', _$animatePointer, opt: true, def: false);
  static bool _$autoPlay(TargetModel v) => v.autoPlay;
  static const Field<TargetModel, bool> _f$autoPlay =
      Field('autoPlay', _$autoPlay, opt: true, def: false);
  static TargetsWrapperNode? _$parentTargetsWrapperNode(TargetModel v) =>
      v.parentTargetsWrapperNode;
  static const Field<TargetModel, TargetsWrapperNode>
      _f$parentTargetsWrapperNode = Field(
          'parentTargetsWrapperNode', _$parentTargetsWrapperNode,
          mode: FieldMode.member);

  @override
  final MappableFields<TargetModel> fields = const {
    #uid: _f$uid,
    #transformScale: _f$transformScale,
    #radiusPc: _f$radiusPc,
    #calloutDurationMs: _f$calloutDurationMs,
    #calloutWidth: _f$calloutWidth,
    #calloutHeight: _f$calloutHeight,
    #calloutTopPc: _f$calloutTopPc,
    #calloutLeftPc: _f$calloutLeftPc,
    #btnLocalTopPc: _f$btnLocalTopPc,
    #btnLocalLeftPc: _f$btnLocalLeftPc,
    #targetLocalPosLeftPc: _f$targetLocalPosLeftPc,
    #targetLocalPosTopPc: _f$targetLocalPosTopPc,
    #showCover: _f$showCover,
    #showBtn: _f$showBtn,
    #canResizeH: _f$canResizeH,
    #canResizeV: _f$canResizeV,
    #followScroll: _f$followScroll,
    #calloutFillColors: _f$calloutFillColors,
    #calloutBorderColors: _f$calloutBorderColors,
    #calloutDecorationShapeEnum: _f$calloutDecorationShapeEnum,
    #calloutBorderRadius: _f$calloutBorderRadius,
    #calloutBorderThickness: _f$calloutBorderThickness,
    #starPoints: _f$starPoints,
    #targetPointerTypeEnum: _f$targetPointerTypeEnum,
    #bubbleOrTargetPointerColor: _f$bubbleOrTargetPointerColor,
    #animatePointer: _f$animatePointer,
    #autoPlay: _f$autoPlay,
    #parentTargetsWrapperNode: _f$parentTargetsWrapperNode,
  };

  static TargetModel _instantiate(DecodingData data) {
    return TargetModel(
        uid: data.dec(_f$uid),
        transformScale: data.dec(_f$transformScale),
        radiusPc: data.dec(_f$radiusPc),
        calloutDurationMs: data.dec(_f$calloutDurationMs),
        calloutWidth: data.dec(_f$calloutWidth),
        calloutHeight: data.dec(_f$calloutHeight),
        calloutTopPc: data.dec(_f$calloutTopPc),
        calloutLeftPc: data.dec(_f$calloutLeftPc),
        btnLocalTopPc: data.dec(_f$btnLocalTopPc),
        btnLocalLeftPc: data.dec(_f$btnLocalLeftPc),
        targetLocalPosLeftPc: data.dec(_f$targetLocalPosLeftPc),
        targetLocalPosTopPc: data.dec(_f$targetLocalPosTopPc),
        showCover: data.dec(_f$showCover),
        showBtn: data.dec(_f$showBtn),
        canResizeH: data.dec(_f$canResizeH),
        canResizeV: data.dec(_f$canResizeV),
        followScroll: data.dec(_f$followScroll),
        calloutFillColors: data.dec(_f$calloutFillColors),
        calloutBorderColors: data.dec(_f$calloutBorderColors),
        calloutDecorationShapeEnum: data.dec(_f$calloutDecorationShapeEnum),
        calloutBorderRadius: data.dec(_f$calloutBorderRadius),
        calloutBorderThickness: data.dec(_f$calloutBorderThickness),
        starPoints: data.dec(_f$starPoints),
        targetPointerTypeEnum: data.dec(_f$targetPointerTypeEnum),
        bubbleOrTargetPointerColor: data.dec(_f$bubbleOrTargetPointerColor),
        animatePointer: data.dec(_f$animatePointer),
        autoPlay: data.dec(_f$autoPlay));
  }

  @override
  final Function instantiate = _instantiate;

  static TargetModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TargetModel>(map);
  }

  static TargetModel fromJson(String json) {
    return ensureInitialized().decodeJson<TargetModel>(json);
  }
}

mixin TargetModelMappable {
  String toJson() {
    return TargetModelMapper.ensureInitialized()
        .encodeJson<TargetModel>(this as TargetModel);
  }

  Map<String, dynamic> toMap() {
    return TargetModelMapper.ensureInitialized()
        .encodeMap<TargetModel>(this as TargetModel);
  }

  TargetModelCopyWith<TargetModel, TargetModel, TargetModel> get copyWith =>
      _TargetModelCopyWithImpl<TargetModel, TargetModel>(
          this as TargetModel, $identity, $identity);
  @override
  String toString() {
    return TargetModelMapper.ensureInitialized()
        .stringifyValue(this as TargetModel);
  }

  @override
  bool operator ==(Object other) {
    return TargetModelMapper.ensureInitialized()
        .equalsValue(this as TargetModel, other);
  }

  @override
  int get hashCode {
    return TargetModelMapper.ensureInitialized().hashValue(this as TargetModel);
  }
}

extension TargetModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TargetModel, $Out> {
  TargetModelCopyWith<$R, TargetModel, $Out> get $asTargetModel =>
      $base.as((v, t, t2) => _TargetModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TargetModelCopyWith<$R, $In extends TargetModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  UpTo6ColorsCopyWith<$R, UpTo6Colors, UpTo6Colors>? get calloutFillColors;
  UpTo6ColorsCopyWith<$R, UpTo6Colors, UpTo6Colors>? get calloutBorderColors;
  ColorModelCopyWith<$R, ColorModel, ColorModel>?
      get bubbleOrTargetPointerColor;
  $R call(
      {int? uid,
      double? transformScale,
      double? radiusPc,
      int? calloutDurationMs,
      double? calloutWidth,
      double? calloutHeight,
      double? calloutTopPc,
      double? calloutLeftPc,
      double? btnLocalTopPc,
      double? btnLocalLeftPc,
      double? targetLocalPosLeftPc,
      double? targetLocalPosTopPc,
      bool? showCover,
      bool? showBtn,
      bool? canResizeH,
      bool? canResizeV,
      bool? followScroll,
      UpTo6Colors? calloutFillColors,
      UpTo6Colors? calloutBorderColors,
      DecorationShapeEnum? calloutDecorationShapeEnum,
      double? calloutBorderRadius,
      double? calloutBorderThickness,
      int? starPoints,
      TargetPointerTypeEnum? targetPointerTypeEnum,
      ColorModel? bubbleOrTargetPointerColor,
      bool? animatePointer,
      bool? autoPlay});
  TargetModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TargetModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TargetModel, $Out>
    implements TargetModelCopyWith<$R, TargetModel, $Out> {
  _TargetModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TargetModel> $mapper =
      TargetModelMapper.ensureInitialized();
  @override
  UpTo6ColorsCopyWith<$R, UpTo6Colors, UpTo6Colors>? get calloutFillColors =>
      $value.calloutFillColors?.copyWith
          .$chain((v) => call(calloutFillColors: v));
  @override
  UpTo6ColorsCopyWith<$R, UpTo6Colors, UpTo6Colors>? get calloutBorderColors =>
      $value.calloutBorderColors?.copyWith
          .$chain((v) => call(calloutBorderColors: v));
  @override
  ColorModelCopyWith<$R, ColorModel, ColorModel>?
      get bubbleOrTargetPointerColor =>
          $value.bubbleOrTargetPointerColor?.copyWith
              .$chain((v) => call(bubbleOrTargetPointerColor: v));
  @override
  $R call(
          {int? uid,
          double? transformScale,
          Object? radiusPc = $none,
          int? calloutDurationMs,
          double? calloutWidth,
          double? calloutHeight,
          Object? calloutTopPc = $none,
          Object? calloutLeftPc = $none,
          Object? btnLocalTopPc = $none,
          Object? btnLocalLeftPc = $none,
          Object? targetLocalPosLeftPc = $none,
          Object? targetLocalPosTopPc = $none,
          bool? showCover,
          bool? showBtn,
          bool? canResizeH,
          bool? canResizeV,
          bool? followScroll,
          Object? calloutFillColors = $none,
          Object? calloutBorderColors = $none,
          Object? calloutDecorationShapeEnum = $none,
          double? calloutBorderRadius,
          double? calloutBorderThickness,
          Object? starPoints = $none,
          Object? targetPointerTypeEnum = $none,
          Object? bubbleOrTargetPointerColor = $none,
          Object? animatePointer = $none,
          bool? autoPlay}) =>
      $apply(FieldCopyWithData({
        if (uid != null) #uid: uid,
        if (transformScale != null) #transformScale: transformScale,
        if (radiusPc != $none) #radiusPc: radiusPc,
        if (calloutDurationMs != null) #calloutDurationMs: calloutDurationMs,
        if (calloutWidth != null) #calloutWidth: calloutWidth,
        if (calloutHeight != null) #calloutHeight: calloutHeight,
        if (calloutTopPc != $none) #calloutTopPc: calloutTopPc,
        if (calloutLeftPc != $none) #calloutLeftPc: calloutLeftPc,
        if (btnLocalTopPc != $none) #btnLocalTopPc: btnLocalTopPc,
        if (btnLocalLeftPc != $none) #btnLocalLeftPc: btnLocalLeftPc,
        if (targetLocalPosLeftPc != $none)
          #targetLocalPosLeftPc: targetLocalPosLeftPc,
        if (targetLocalPosTopPc != $none)
          #targetLocalPosTopPc: targetLocalPosTopPc,
        if (showCover != null) #showCover: showCover,
        if (showBtn != null) #showBtn: showBtn,
        if (canResizeH != null) #canResizeH: canResizeH,
        if (canResizeV != null) #canResizeV: canResizeV,
        if (followScroll != null) #followScroll: followScroll,
        if (calloutFillColors != $none) #calloutFillColors: calloutFillColors,
        if (calloutBorderColors != $none)
          #calloutBorderColors: calloutBorderColors,
        if (calloutDecorationShapeEnum != $none)
          #calloutDecorationShapeEnum: calloutDecorationShapeEnum,
        if (calloutBorderRadius != null)
          #calloutBorderRadius: calloutBorderRadius,
        if (calloutBorderThickness != null)
          #calloutBorderThickness: calloutBorderThickness,
        if (starPoints != $none) #starPoints: starPoints,
        if (targetPointerTypeEnum != $none)
          #targetPointerTypeEnum: targetPointerTypeEnum,
        if (bubbleOrTargetPointerColor != $none)
          #bubbleOrTargetPointerColor: bubbleOrTargetPointerColor,
        if (animatePointer != $none) #animatePointer: animatePointer,
        if (autoPlay != null) #autoPlay: autoPlay
      }));
  @override
  TargetModel $make(CopyWithData data) => TargetModel(
      uid: data.get(#uid, or: $value.uid),
      transformScale: data.get(#transformScale, or: $value.transformScale),
      radiusPc: data.get(#radiusPc, or: $value.radiusPc),
      calloutDurationMs:
          data.get(#calloutDurationMs, or: $value.calloutDurationMs),
      calloutWidth: data.get(#calloutWidth, or: $value.calloutWidth),
      calloutHeight: data.get(#calloutHeight, or: $value.calloutHeight),
      calloutTopPc: data.get(#calloutTopPc, or: $value.calloutTopPc),
      calloutLeftPc: data.get(#calloutLeftPc, or: $value.calloutLeftPc),
      btnLocalTopPc: data.get(#btnLocalTopPc, or: $value.btnLocalTopPc),
      btnLocalLeftPc: data.get(#btnLocalLeftPc, or: $value.btnLocalLeftPc),
      targetLocalPosLeftPc:
          data.get(#targetLocalPosLeftPc, or: $value.targetLocalPosLeftPc),
      targetLocalPosTopPc:
          data.get(#targetLocalPosTopPc, or: $value.targetLocalPosTopPc),
      showCover: data.get(#showCover, or: $value.showCover),
      showBtn: data.get(#showBtn, or: $value.showBtn),
      canResizeH: data.get(#canResizeH, or: $value.canResizeH),
      canResizeV: data.get(#canResizeV, or: $value.canResizeV),
      followScroll: data.get(#followScroll, or: $value.followScroll),
      calloutFillColors:
          data.get(#calloutFillColors, or: $value.calloutFillColors),
      calloutBorderColors:
          data.get(#calloutBorderColors, or: $value.calloutBorderColors),
      calloutDecorationShapeEnum: data.get(#calloutDecorationShapeEnum,
          or: $value.calloutDecorationShapeEnum),
      calloutBorderRadius:
          data.get(#calloutBorderRadius, or: $value.calloutBorderRadius),
      calloutBorderThickness:
          data.get(#calloutBorderThickness, or: $value.calloutBorderThickness),
      starPoints: data.get(#starPoints, or: $value.starPoints),
      targetPointerTypeEnum:
          data.get(#targetPointerTypeEnum, or: $value.targetPointerTypeEnum),
      bubbleOrTargetPointerColor: data.get(#bubbleOrTargetPointerColor,
          or: $value.bubbleOrTargetPointerColor),
      animatePointer: data.get(#animatePointer, or: $value.animatePointer),
      autoPlay: data.get(#autoPlay, or: $value.autoPlay));

  @override
  TargetModelCopyWith<$R2, TargetModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TargetModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
