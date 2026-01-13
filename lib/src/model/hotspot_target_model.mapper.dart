// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'hotspot_target_model.dart';

class HotspotTargetModelMapper extends ClassMapperBase<HotspotTargetModel> {
  HotspotTargetModelMapper._();

  static HotspotTargetModelMapper? _instance;
  static HotspotTargetModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HotspotTargetModelMapper._());
      OffsetModelMapper.ensureInitialized();
      TargetButtonIconEnumMapper.ensureInitialized();
      AlignmentModelMapper.ensureInitialized();
      SizeModelMapper.ensureInitialized();
      UpTo6ColorsMapper.ensureInitialized();
      DecorationShapeEnumMapper.ensureInitialized();
      TargetPointerTypeEnumMapper.ensureInitialized();
      ColorModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'HotspotTargetModel';

  static OffsetModel? _$targetCLocalPc(HotspotTargetModel v) =>
      v.targetCLocalPc;
  static const Field<HotspotTargetModel, OffsetModel> _f$targetCLocalPc = Field(
    'targetCLocalPc',
    _$targetCLocalPc,
    opt: true,
  );
  static OffsetModel? _$btnCLocalPosPc(HotspotTargetModel v) =>
      v.btnCLocalPosPc;
  static const Field<HotspotTargetModel, OffsetModel> _f$btnCLocalPosPc = Field(
    'btnCLocalPosPc',
    _$btnCLocalPosPc,
    opt: true,
  );
  static double? _$targetRadiusPC(HotspotTargetModel v) => v.targetRadiusPC;
  static const Field<HotspotTargetModel, double> _f$targetRadiusPC = Field(
    'targetRadiusPC',
    _$targetRadiusPC,
    opt: true,
  );
  static double? _$btnRadiusPc(HotspotTargetModel v) => v.btnRadiusPc;
  static const Field<HotspotTargetModel, double> _f$btnRadiusPc = Field(
    'btnRadiusPc',
    _$btnRadiusPc,
    opt: true,
  );
  static TargetButtonIconEnum? _$btnIcon(HotspotTargetModel v) => v.btnIcon;
  static const Field<HotspotTargetModel, TargetButtonIconEnum> _f$btnIcon =
      Field('btnIcon', _$btnIcon, opt: true);
  static bool _$showCover(HotspotTargetModel v) => v.showCover;
  static const Field<HotspotTargetModel, bool> _f$showCover = Field(
    'showCover',
    _$showCover,
    opt: true,
    def: true,
  );
  static bool _$showBtn(HotspotTargetModel v) => v.showBtn;
  static const Field<HotspotTargetModel, bool> _f$showBtn = Field(
    'showBtn',
    _$showBtn,
    opt: true,
    def: true,
  );
  static int _$uid(HotspotTargetModel v) => v.uid;
  static const Field<HotspotTargetModel, int> _f$uid = Field('uid', _$uid);
  static AlignmentModel? _$tcAlignment(HotspotTargetModel v) => v.tcAlignment;
  static const Field<HotspotTargetModel, AlignmentModel> _f$tcAlignment = Field(
    'tcAlignment',
    _$tcAlignment,
    opt: true,
  );
  static SizeModel? _$calloutSize(HotspotTargetModel v) => v.calloutSize;
  static const Field<HotspotTargetModel, SizeModel> _f$calloutSize = Field(
    'calloutSize',
    _$calloutSize,
    opt: true,
  );
  static int _$calloutDurationMs(HotspotTargetModel v) => v.calloutDurationMs;
  static const Field<HotspotTargetModel, int> _f$calloutDurationMs = Field(
    'calloutDurationMs',
    _$calloutDurationMs,
    opt: true,
    def: 1500,
  );
  static UpTo6Colors? _$calloutFillColors(HotspotTargetModel v) =>
      v.calloutFillColors;
  static const Field<HotspotTargetModel, UpTo6Colors> _f$calloutFillColors =
      Field('calloutFillColors', _$calloutFillColors, opt: true);
  static UpTo6Colors? _$calloutBorderColors(HotspotTargetModel v) =>
      v.calloutBorderColors;
  static const Field<HotspotTargetModel, UpTo6Colors> _f$calloutBorderColors =
      Field('calloutBorderColors', _$calloutBorderColors, opt: true);
  static DecorationShapeEnum? _$calloutDecorationShapeEnum(
    HotspotTargetModel v,
  ) => v.calloutDecorationShapeEnum;
  static const Field<HotspotTargetModel, DecorationShapeEnum>
  _f$calloutDecorationShapeEnum = Field(
    'calloutDecorationShapeEnum',
    _$calloutDecorationShapeEnum,
    opt: true,
  );
  static double? _$calloutBorderRadius(HotspotTargetModel v) =>
      v.calloutBorderRadius;
  static const Field<HotspotTargetModel, double> _f$calloutBorderRadius = Field(
    'calloutBorderRadius',
    _$calloutBorderRadius,
    opt: true,
  );
  static double? _$calloutBorderThickness(HotspotTargetModel v) =>
      v.calloutBorderThickness;
  static const Field<HotspotTargetModel, double> _f$calloutBorderThickness =
      Field('calloutBorderThickness', _$calloutBorderThickness, opt: true);
  static int? _$starPoints(HotspotTargetModel v) => v.starPoints;
  static const Field<HotspotTargetModel, int> _f$starPoints = Field(
    'starPoints',
    _$starPoints,
    opt: true,
  );
  static TargetPointerTypeEnum? _$targetPointerTypeEnum(HotspotTargetModel v) =>
      v.targetPointerTypeEnum;
  static const Field<HotspotTargetModel, TargetPointerTypeEnum>
  _f$targetPointerTypeEnum = Field(
    'targetPointerTypeEnum',
    _$targetPointerTypeEnum,
    opt: true,
  );
  static ColorModel? _$bubbleOrTargetPointerColor(HotspotTargetModel v) =>
      v.bubbleOrTargetPointerColor;
  static const Field<HotspotTargetModel, ColorModel>
  _f$bubbleOrTargetPointerColor = Field(
    'bubbleOrTargetPointerColor',
    _$bubbleOrTargetPointerColor,
    opt: true,
  );
  static bool? _$animatePointer(HotspotTargetModel v) => v.animatePointer;
  static const Field<HotspotTargetModel, bool> _f$animatePointer = Field(
    'animatePointer',
    _$animatePointer,
    opt: true,
    def: false,
  );
  static bool _$autoPlay(HotspotTargetModel v) => v.autoPlay;
  static const Field<HotspotTargetModel, bool> _f$autoPlay = Field(
    'autoPlay',
    _$autoPlay,
    opt: true,
    def: false,
  );
  static GlobalKey<State<StatefulWidget>>? _$gk(HotspotTargetModel v) => v.gk;
  static const Field<HotspotTargetModel, GlobalKey<State<StatefulWidget>>>
  _f$gk = Field('gk', _$gk, mode: FieldMode.member);
  static int _$hashCode(HotspotTargetModel v) => v.hashCode;
  static const Field<HotspotTargetModel, int> _f$hashCode = Field(
    'hashCode',
    _$hashCode,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<HotspotTargetModel> fields = const {
    #targetCLocalPc: _f$targetCLocalPc,
    #btnCLocalPosPc: _f$btnCLocalPosPc,
    #targetRadiusPC: _f$targetRadiusPC,
    #btnRadiusPc: _f$btnRadiusPc,
    #btnIcon: _f$btnIcon,
    #showCover: _f$showCover,
    #showBtn: _f$showBtn,
    #uid: _f$uid,
    #tcAlignment: _f$tcAlignment,
    #calloutSize: _f$calloutSize,
    #calloutDurationMs: _f$calloutDurationMs,
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
    #gk: _f$gk,
    #hashCode: _f$hashCode,
  };

  @override
  final MappingHook hook = const TargetModelHook();
  static HotspotTargetModel _instantiate(DecodingData data) {
    return HotspotTargetModel(
      targetCLocalPc: data.dec(_f$targetCLocalPc),
      btnCLocalPosPc: data.dec(_f$btnCLocalPosPc),
      targetRadiusPC: data.dec(_f$targetRadiusPC),
      btnRadiusPc: data.dec(_f$btnRadiusPc),
      btnIcon: data.dec(_f$btnIcon),
      showCover: data.dec(_f$showCover),
      showBtn: data.dec(_f$showBtn),
      uid: data.dec(_f$uid),
      tcAlignment: data.dec(_f$tcAlignment),
      calloutSize: data.dec(_f$calloutSize),
      calloutDurationMs: data.dec(_f$calloutDurationMs),
      calloutFillColors: data.dec(_f$calloutFillColors),
      calloutBorderColors: data.dec(_f$calloutBorderColors),
      calloutDecorationShapeEnum: data.dec(_f$calloutDecorationShapeEnum),
      calloutBorderRadius: data.dec(_f$calloutBorderRadius),
      calloutBorderThickness: data.dec(_f$calloutBorderThickness),
      starPoints: data.dec(_f$starPoints),
      targetPointerTypeEnum: data.dec(_f$targetPointerTypeEnum),
      bubbleOrTargetPointerColor: data.dec(_f$bubbleOrTargetPointerColor),
      animatePointer: data.dec(_f$animatePointer),
      autoPlay: data.dec(_f$autoPlay),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static HotspotTargetModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HotspotTargetModel>(map);
  }

  static HotspotTargetModel fromJson(String json) {
    return ensureInitialized().decodeJson<HotspotTargetModel>(json);
  }
}

mixin HotspotTargetModelMappable {
  String toJson() {
    return HotspotTargetModelMapper.ensureInitialized()
        .encodeJson<HotspotTargetModel>(this as HotspotTargetModel);
  }

  Map<String, dynamic> toMap() {
    return HotspotTargetModelMapper.ensureInitialized()
        .encodeMap<HotspotTargetModel>(this as HotspotTargetModel);
  }

  HotspotTargetModelCopyWith<
    HotspotTargetModel,
    HotspotTargetModel,
    HotspotTargetModel
  >
  get copyWith =>
      _HotspotTargetModelCopyWithImpl<HotspotTargetModel, HotspotTargetModel>(
        this as HotspotTargetModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return HotspotTargetModelMapper.ensureInitialized().stringifyValue(
      this as HotspotTargetModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return HotspotTargetModelMapper.ensureInitialized().equalsValue(
      this as HotspotTargetModel,
      other,
    );
  }

  @override
  int get hashCode {
    return HotspotTargetModelMapper.ensureInitialized().hashValue(
      this as HotspotTargetModel,
    );
  }
}

extension HotspotTargetModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HotspotTargetModel, $Out> {
  HotspotTargetModelCopyWith<$R, HotspotTargetModel, $Out>
  get $asHotspotTargetModel => $base.as(
    (v, t, t2) => _HotspotTargetModelCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class HotspotTargetModelCopyWith<
  $R,
  $In extends HotspotTargetModel,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  OffsetModelCopyWith<$R, OffsetModel, OffsetModel>? get targetCLocalPc;
  OffsetModelCopyWith<$R, OffsetModel, OffsetModel>? get btnCLocalPosPc;
  AlignmentModelCopyWith<$R, AlignmentModel, AlignmentModel>? get tcAlignment;
  SizeModelCopyWith<$R, SizeModel, SizeModel>? get calloutSize;
  UpTo6ColorsCopyWith<$R, UpTo6Colors, UpTo6Colors>? get calloutFillColors;
  UpTo6ColorsCopyWith<$R, UpTo6Colors, UpTo6Colors>? get calloutBorderColors;
  ColorModelCopyWith<$R, ColorModel, ColorModel>?
  get bubbleOrTargetPointerColor;
  $R call({
    OffsetModel? targetCLocalPc,
    OffsetModel? btnCLocalPosPc,
    double? targetRadiusPC,
    double? btnRadiusPc,
    TargetButtonIconEnum? btnIcon,
    bool? showCover,
    bool? showBtn,
    int? uid,
    AlignmentModel? tcAlignment,
    SizeModel? calloutSize,
    int? calloutDurationMs,
    UpTo6Colors? calloutFillColors,
    UpTo6Colors? calloutBorderColors,
    DecorationShapeEnum? calloutDecorationShapeEnum,
    double? calloutBorderRadius,
    double? calloutBorderThickness,
    int? starPoints,
    TargetPointerTypeEnum? targetPointerTypeEnum,
    ColorModel? bubbleOrTargetPointerColor,
    bool? animatePointer,
    bool? autoPlay,
  });
  HotspotTargetModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _HotspotTargetModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HotspotTargetModel, $Out>
    implements HotspotTargetModelCopyWith<$R, HotspotTargetModel, $Out> {
  _HotspotTargetModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HotspotTargetModel> $mapper =
      HotspotTargetModelMapper.ensureInitialized();
  @override
  OffsetModelCopyWith<$R, OffsetModel, OffsetModel>? get targetCLocalPc =>
      $value.targetCLocalPc?.copyWith.$chain((v) => call(targetCLocalPc: v));
  @override
  OffsetModelCopyWith<$R, OffsetModel, OffsetModel>? get btnCLocalPosPc =>
      $value.btnCLocalPosPc?.copyWith.$chain((v) => call(btnCLocalPosPc: v));
  @override
  AlignmentModelCopyWith<$R, AlignmentModel, AlignmentModel>? get tcAlignment =>
      $value.tcAlignment?.copyWith.$chain((v) => call(tcAlignment: v));
  @override
  SizeModelCopyWith<$R, SizeModel, SizeModel>? get calloutSize =>
      $value.calloutSize?.copyWith.$chain((v) => call(calloutSize: v));
  @override
  UpTo6ColorsCopyWith<$R, UpTo6Colors, UpTo6Colors>? get calloutFillColors =>
      $value.calloutFillColors?.copyWith.$chain(
        (v) => call(calloutFillColors: v),
      );
  @override
  UpTo6ColorsCopyWith<$R, UpTo6Colors, UpTo6Colors>? get calloutBorderColors =>
      $value.calloutBorderColors?.copyWith.$chain(
        (v) => call(calloutBorderColors: v),
      );
  @override
  ColorModelCopyWith<$R, ColorModel, ColorModel>?
  get bubbleOrTargetPointerColor => $value.bubbleOrTargetPointerColor?.copyWith
      .$chain((v) => call(bubbleOrTargetPointerColor: v));
  @override
  $R call({
    Object? targetCLocalPc = $none,
    Object? btnCLocalPosPc = $none,
    Object? targetRadiusPC = $none,
    Object? btnRadiusPc = $none,
    Object? btnIcon = $none,
    bool? showCover,
    bool? showBtn,
    int? uid,
    Object? tcAlignment = $none,
    Object? calloutSize = $none,
    int? calloutDurationMs,
    Object? calloutFillColors = $none,
    Object? calloutBorderColors = $none,
    Object? calloutDecorationShapeEnum = $none,
    Object? calloutBorderRadius = $none,
    Object? calloutBorderThickness = $none,
    Object? starPoints = $none,
    Object? targetPointerTypeEnum = $none,
    Object? bubbleOrTargetPointerColor = $none,
    Object? animatePointer = $none,
    bool? autoPlay,
  }) => $apply(
    FieldCopyWithData({
      if (targetCLocalPc != $none) #targetCLocalPc: targetCLocalPc,
      if (btnCLocalPosPc != $none) #btnCLocalPosPc: btnCLocalPosPc,
      if (targetRadiusPC != $none) #targetRadiusPC: targetRadiusPC,
      if (btnRadiusPc != $none) #btnRadiusPc: btnRadiusPc,
      if (btnIcon != $none) #btnIcon: btnIcon,
      if (showCover != null) #showCover: showCover,
      if (showBtn != null) #showBtn: showBtn,
      if (uid != null) #uid: uid,
      if (tcAlignment != $none) #tcAlignment: tcAlignment,
      if (calloutSize != $none) #calloutSize: calloutSize,
      if (calloutDurationMs != null) #calloutDurationMs: calloutDurationMs,
      if (calloutFillColors != $none) #calloutFillColors: calloutFillColors,
      if (calloutBorderColors != $none)
        #calloutBorderColors: calloutBorderColors,
      if (calloutDecorationShapeEnum != $none)
        #calloutDecorationShapeEnum: calloutDecorationShapeEnum,
      if (calloutBorderRadius != $none)
        #calloutBorderRadius: calloutBorderRadius,
      if (calloutBorderThickness != $none)
        #calloutBorderThickness: calloutBorderThickness,
      if (starPoints != $none) #starPoints: starPoints,
      if (targetPointerTypeEnum != $none)
        #targetPointerTypeEnum: targetPointerTypeEnum,
      if (bubbleOrTargetPointerColor != $none)
        #bubbleOrTargetPointerColor: bubbleOrTargetPointerColor,
      if (animatePointer != $none) #animatePointer: animatePointer,
      if (autoPlay != null) #autoPlay: autoPlay,
    }),
  );
  @override
  HotspotTargetModel $make(CopyWithData data) => HotspotTargetModel(
    targetCLocalPc: data.get(#targetCLocalPc, or: $value.targetCLocalPc),
    btnCLocalPosPc: data.get(#btnCLocalPosPc, or: $value.btnCLocalPosPc),
    targetRadiusPC: data.get(#targetRadiusPC, or: $value.targetRadiusPC),
    btnRadiusPc: data.get(#btnRadiusPc, or: $value.btnRadiusPc),
    btnIcon: data.get(#btnIcon, or: $value.btnIcon),
    showCover: data.get(#showCover, or: $value.showCover),
    showBtn: data.get(#showBtn, or: $value.showBtn),
    uid: data.get(#uid, or: $value.uid),
    tcAlignment: data.get(#tcAlignment, or: $value.tcAlignment),
    calloutSize: data.get(#calloutSize, or: $value.calloutSize),
    calloutDurationMs: data.get(
      #calloutDurationMs,
      or: $value.calloutDurationMs,
    ),
    calloutFillColors: data.get(
      #calloutFillColors,
      or: $value.calloutFillColors,
    ),
    calloutBorderColors: data.get(
      #calloutBorderColors,
      or: $value.calloutBorderColors,
    ),
    calloutDecorationShapeEnum: data.get(
      #calloutDecorationShapeEnum,
      or: $value.calloutDecorationShapeEnum,
    ),
    calloutBorderRadius: data.get(
      #calloutBorderRadius,
      or: $value.calloutBorderRadius,
    ),
    calloutBorderThickness: data.get(
      #calloutBorderThickness,
      or: $value.calloutBorderThickness,
    ),
    starPoints: data.get(#starPoints, or: $value.starPoints),
    targetPointerTypeEnum: data.get(
      #targetPointerTypeEnum,
      or: $value.targetPointerTypeEnum,
    ),
    bubbleOrTargetPointerColor: data.get(
      #bubbleOrTargetPointerColor,
      or: $value.bubbleOrTargetPointerColor,
    ),
    animatePointer: data.get(#animatePointer, or: $value.animatePointer),
    autoPlay: data.get(#autoPlay, or: $value.autoPlay),
  );

  @override
  HotspotTargetModelCopyWith<$R2, HotspotTargetModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _HotspotTargetModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

