// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
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
      OffsetModelMapper.ensureInitialized();
      AlignmentModelMapper.ensureInitialized();
      SizeModelMapper.ensureInitialized();
      TargetButtonIconEnumMapper.ensureInitialized();
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
  static const Field<TargetModel, double> _f$transformScale = Field(
    'transformScale',
    _$transformScale,
    opt: true,
    def: 1.0,
  );
  static OffsetModel? _$targetCLocalPc(TargetModel v) => v.targetCLocalPc;
  static const Field<TargetModel, OffsetModel> _f$targetCLocalPc = Field(
    'targetCLocalPc',
    _$targetCLocalPc,
    opt: true,
  );
  static OffsetModel? _$btnCLocalPosPc(TargetModel v) => v.btnCLocalPosPc;
  static const Field<TargetModel, OffsetModel> _f$btnCLocalPosPc = Field(
    'btnCLocalPosPc',
    _$btnCLocalPosPc,
    opt: true,
  );
  static double? _$targetRadiusPC(TargetModel v) => v.targetRadiusPC;
  static const Field<TargetModel, double> _f$targetRadiusPC = Field(
    'targetRadiusPC',
    _$targetRadiusPC,
    opt: true,
  );
  static double? _$btnRadiusPc(TargetModel v) => v.btnRadiusPc;
  static const Field<TargetModel, double> _f$btnRadiusPc = Field(
    'btnRadiusPc',
    _$btnRadiusPc,
    opt: true,
  );
  static AlignmentModel? _$tcAlignment(TargetModel v) => v.tcAlignment;
  static const Field<TargetModel, AlignmentModel> _f$tcAlignment = Field(
    'tcAlignment',
    _$tcAlignment,
    opt: true,
  );
  static SizeModel? _$calloutSize(TargetModel v) => v.calloutSize;
  static const Field<TargetModel, SizeModel> _f$calloutSize = Field(
    'calloutSize',
    _$calloutSize,
    opt: true,
  );
  static int _$calloutDurationMs(TargetModel v) => v.calloutDurationMs;
  static const Field<TargetModel, int> _f$calloutDurationMs = Field(
    'calloutDurationMs',
    _$calloutDurationMs,
    opt: true,
    def: 1500,
  );
  static TargetButtonIconEnum? _$btnIcon(TargetModel v) => v.btnIcon;
  static const Field<TargetModel, TargetButtonIconEnum> _f$btnIcon = Field(
    'btnIcon',
    _$btnIcon,
    opt: true,
  );
  static bool _$showCover(TargetModel v) => v.showCover;
  static const Field<TargetModel, bool> _f$showCover = Field(
    'showCover',
    _$showCover,
    opt: true,
    def: true,
  );
  static bool _$showBtn(TargetModel v) => v.showBtn;
  static const Field<TargetModel, bool> _f$showBtn = Field(
    'showBtn',
    _$showBtn,
    opt: true,
    def: true,
  );
  static bool _$canResizeH(TargetModel v) => v.canResizeH;
  static const Field<TargetModel, bool> _f$canResizeH = Field(
    'canResizeH',
    _$canResizeH,
    opt: true,
    def: true,
  );
  static bool _$canResizeV(TargetModel v) => v.canResizeV;
  static const Field<TargetModel, bool> _f$canResizeV = Field(
    'canResizeV',
    _$canResizeV,
    opt: true,
    def: true,
  );
  static bool _$followScroll(TargetModel v) => v.followScroll;
  static const Field<TargetModel, bool> _f$followScroll = Field(
    'followScroll',
    _$followScroll,
    opt: true,
    def: true,
  );
  static UpTo6Colors? _$calloutFillColors(TargetModel v) => v.calloutFillColors;
  static const Field<TargetModel, UpTo6Colors> _f$calloutFillColors = Field(
    'calloutFillColors',
    _$calloutFillColors,
    opt: true,
  );
  static UpTo6Colors? _$calloutBorderColors(TargetModel v) =>
      v.calloutBorderColors;
  static const Field<TargetModel, UpTo6Colors> _f$calloutBorderColors = Field(
    'calloutBorderColors',
    _$calloutBorderColors,
    opt: true,
  );
  static DecorationShapeEnum? _$calloutDecorationShapeEnum(TargetModel v) =>
      v.calloutDecorationShapeEnum;
  static const Field<TargetModel, DecorationShapeEnum>
  _f$calloutDecorationShapeEnum = Field(
    'calloutDecorationShapeEnum',
    _$calloutDecorationShapeEnum,
    opt: true,
  );
  static double _$calloutBorderRadius(TargetModel v) => v.calloutBorderRadius;
  static const Field<TargetModel, double> _f$calloutBorderRadius = Field(
    'calloutBorderRadius',
    _$calloutBorderRadius,
    opt: true,
    def: 30,
  );
  static double _$calloutBorderThickness(TargetModel v) =>
      v.calloutBorderThickness;
  static const Field<TargetModel, double> _f$calloutBorderThickness = Field(
    'calloutBorderThickness',
    _$calloutBorderThickness,
    opt: true,
    def: 1,
  );
  static int? _$starPoints(TargetModel v) => v.starPoints;
  static const Field<TargetModel, int> _f$starPoints = Field(
    'starPoints',
    _$starPoints,
    opt: true,
  );
  static TargetPointerTypeEnum? _$targetPointerTypeEnum(TargetModel v) =>
      v.targetPointerTypeEnum;
  static const Field<TargetModel, TargetPointerTypeEnum>
  _f$targetPointerTypeEnum = Field(
    'targetPointerTypeEnum',
    _$targetPointerTypeEnum,
    opt: true,
  );
  static ColorModel? _$bubbleOrTargetPointerColor(TargetModel v) =>
      v.bubbleOrTargetPointerColor;
  static const Field<TargetModel, ColorModel> _f$bubbleOrTargetPointerColor =
      Field(
        'bubbleOrTargetPointerColor',
        _$bubbleOrTargetPointerColor,
        opt: true,
      );
  static bool? _$animatePointer(TargetModel v) => v.animatePointer;
  static const Field<TargetModel, bool> _f$animatePointer = Field(
    'animatePointer',
    _$animatePointer,
    opt: true,
    def: false,
  );
  static bool _$autoPlay(TargetModel v) => v.autoPlay;
  static const Field<TargetModel, bool> _f$autoPlay = Field(
    'autoPlay',
    _$autoPlay,
    opt: true,
    def: false,
  );
  static GlobalKey<State<StatefulWidget>>? _$gk(TargetModel v) => v.gk;
  static const Field<TargetModel, GlobalKey<State<StatefulWidget>>> _f$gk =
      Field('gk', _$gk, mode: FieldMode.member);
  static String _$contentCId(TargetModel v) => v.contentCId;
  static const Field<TargetModel, String> _f$contentCId = Field(
    'contentCId',
    _$contentCId,
    mode: FieldMode.member,
  );
  static int _$hashCode(TargetModel v) => v.hashCode;
  static const Field<TargetModel, int> _f$hashCode = Field(
    'hashCode',
    _$hashCode,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<TargetModel> fields = const {
    #uid: _f$uid,
    #transformScale: _f$transformScale,
    #targetCLocalPc: _f$targetCLocalPc,
    #btnCLocalPosPc: _f$btnCLocalPosPc,
    #targetRadiusPC: _f$targetRadiusPC,
    #btnRadiusPc: _f$btnRadiusPc,
    #tcAlignment: _f$tcAlignment,
    #calloutSize: _f$calloutSize,
    #calloutDurationMs: _f$calloutDurationMs,
    #btnIcon: _f$btnIcon,
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
    #gk: _f$gk,
    #contentCId: _f$contentCId,
    #hashCode: _f$hashCode,
  };

  @override
  final MappingHook hook = const TargetModelHook();
  static TargetModel _instantiate(DecodingData data) {
    return TargetModel(
      uid: data.dec(_f$uid),
      transformScale: data.dec(_f$transformScale),
      targetCLocalPc: data.dec(_f$targetCLocalPc),
      btnCLocalPosPc: data.dec(_f$btnCLocalPosPc),
      targetRadiusPC: data.dec(_f$targetRadiusPC),
      btnRadiusPc: data.dec(_f$btnRadiusPc),
      tcAlignment: data.dec(_f$tcAlignment),
      calloutSize: data.dec(_f$calloutSize),
      calloutDurationMs: data.dec(_f$calloutDurationMs),
      btnIcon: data.dec(_f$btnIcon),
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
      autoPlay: data.dec(_f$autoPlay),
    );
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
    return TargetModelMapper.ensureInitialized().encodeJson<TargetModel>(
      this as TargetModel,
    );
  }

  Map<String, dynamic> toMap() {
    return TargetModelMapper.ensureInitialized().encodeMap<TargetModel>(
      this as TargetModel,
    );
  }

  TargetModelCopyWith<TargetModel, TargetModel, TargetModel> get copyWith =>
      _TargetModelCopyWithImpl<TargetModel, TargetModel>(
        this as TargetModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return TargetModelMapper.ensureInitialized().stringifyValue(
      this as TargetModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return TargetModelMapper.ensureInitialized().equalsValue(
      this as TargetModel,
      other,
    );
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
  OffsetModelCopyWith<$R, OffsetModel, OffsetModel>? get targetCLocalPc;
  OffsetModelCopyWith<$R, OffsetModel, OffsetModel>? get btnCLocalPosPc;
  AlignmentModelCopyWith<$R, AlignmentModel, AlignmentModel>? get tcAlignment;
  SizeModelCopyWith<$R, SizeModel, SizeModel>? get calloutSize;
  UpTo6ColorsCopyWith<$R, UpTo6Colors, UpTo6Colors>? get calloutFillColors;
  UpTo6ColorsCopyWith<$R, UpTo6Colors, UpTo6Colors>? get calloutBorderColors;
  ColorModelCopyWith<$R, ColorModel, ColorModel>?
  get bubbleOrTargetPointerColor;
  $R call({
    int? uid,
    double? transformScale,
    OffsetModel? targetCLocalPc,
    OffsetModel? btnCLocalPosPc,
    double? targetRadiusPC,
    double? btnRadiusPc,
    AlignmentModel? tcAlignment,
    SizeModel? calloutSize,
    int? calloutDurationMs,
    TargetButtonIconEnum? btnIcon,
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
    bool? autoPlay,
  });
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
    int? uid,
    double? transformScale,
    Object? targetCLocalPc = $none,
    Object? btnCLocalPosPc = $none,
    Object? targetRadiusPC = $none,
    Object? btnRadiusPc = $none,
    Object? tcAlignment = $none,
    Object? calloutSize = $none,
    int? calloutDurationMs,
    Object? btnIcon = $none,
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
    bool? autoPlay,
  }) => $apply(
    FieldCopyWithData({
      if (uid != null) #uid: uid,
      if (transformScale != null) #transformScale: transformScale,
      if (targetCLocalPc != $none) #targetCLocalPc: targetCLocalPc,
      if (btnCLocalPosPc != $none) #btnCLocalPosPc: btnCLocalPosPc,
      if (targetRadiusPC != $none) #targetRadiusPC: targetRadiusPC,
      if (btnRadiusPc != $none) #btnRadiusPc: btnRadiusPc,
      if (tcAlignment != $none) #tcAlignment: tcAlignment,
      if (calloutSize != $none) #calloutSize: calloutSize,
      if (calloutDurationMs != null) #calloutDurationMs: calloutDurationMs,
      if (btnIcon != $none) #btnIcon: btnIcon,
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
      if (autoPlay != null) #autoPlay: autoPlay,
    }),
  );
  @override
  TargetModel $make(CopyWithData data) => TargetModel(
    uid: data.get(#uid, or: $value.uid),
    transformScale: data.get(#transformScale, or: $value.transformScale),
    targetCLocalPc: data.get(#targetCLocalPc, or: $value.targetCLocalPc),
    btnCLocalPosPc: data.get(#btnCLocalPosPc, or: $value.btnCLocalPosPc),
    targetRadiusPC: data.get(#targetRadiusPC, or: $value.targetRadiusPC),
    btnRadiusPc: data.get(#btnRadiusPc, or: $value.btnRadiusPc),
    tcAlignment: data.get(#tcAlignment, or: $value.tcAlignment),
    calloutSize: data.get(#calloutSize, or: $value.calloutSize),
    calloutDurationMs: data.get(
      #calloutDurationMs,
      or: $value.calloutDurationMs,
    ),
    btnIcon: data.get(#btnIcon, or: $value.btnIcon),
    showCover: data.get(#showCover, or: $value.showCover),
    showBtn: data.get(#showBtn, or: $value.showBtn),
    canResizeH: data.get(#canResizeH, or: $value.canResizeH),
    canResizeV: data.get(#canResizeV, or: $value.canResizeV),
    followScroll: data.get(#followScroll, or: $value.followScroll),
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
  TargetModelCopyWith<$R2, TargetModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _TargetModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

