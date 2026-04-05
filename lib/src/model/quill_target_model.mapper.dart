// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'quill_target_model.dart';

class QuillTargetModelMapper extends ClassMapperBase<QuillTargetModel> {
  QuillTargetModelMapper._();

  static QuillTargetModelMapper? _instance;
  static QuillTargetModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = QuillTargetModelMapper._());
      TargetButtonIconEnumMapper.ensureInitialized();
      SizeModelMapper.ensureInitialized();
      UpTo6ColorsMapper.ensureInitialized();
      DecorationShapeEnumMapper.ensureInitialized();
      TargetPointerTypeEnumMapper.ensureInitialized();
      ColorModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'QuillTargetModel';

  static double? _$iconSize(QuillTargetModel v) => v.iconSize;
  static const Field<QuillTargetModel, double> _f$iconSize = Field(
    'iconSize',
    _$iconSize,
    opt: true,
  );
  static TargetButtonIconEnum? _$iconEnum(QuillTargetModel v) => v.iconEnum;
  static const Field<QuillTargetModel, TargetButtonIconEnum> _f$iconEnum =
      Field('iconEnum', _$iconEnum, opt: true);
  static int _$uid(QuillTargetModel v) => v.uid;
  static const Field<QuillTargetModel, int> _f$uid = Field('uid', _$uid);
  static SizeModel _$calloutSize(QuillTargetModel v) => v.calloutSize;
  static const Field<QuillTargetModel, SizeModel> _f$calloutSize = Field(
    'calloutSize',
    _$calloutSize,
    opt: true,
    def: const SizeModel(200, 80),
  );
  static int _$calloutDurationMs(QuillTargetModel v) => v.calloutDurationMs;
  static const Field<QuillTargetModel, int> _f$calloutDurationMs = Field(
    'calloutDurationMs',
    _$calloutDurationMs,
    opt: true,
    def: 1500,
  );
  static UpTo6Colors? _$calloutFillColors(QuillTargetModel v) =>
      v.calloutFillColors;
  static const Field<QuillTargetModel, UpTo6Colors> _f$calloutFillColors =
      Field('calloutFillColors', _$calloutFillColors, opt: true);
  static UpTo6Colors? _$calloutBorderColors(QuillTargetModel v) =>
      v.calloutBorderColors;
  static const Field<QuillTargetModel, UpTo6Colors> _f$calloutBorderColors =
      Field('calloutBorderColors', _$calloutBorderColors, opt: true);
  static DecorationShapeEnum? _$calloutDecorationShapeEnum(
    QuillTargetModel v,
  ) => v.calloutDecorationShapeEnum;
  static const Field<QuillTargetModel, DecorationShapeEnum>
  _f$calloutDecorationShapeEnum = Field(
    'calloutDecorationShapeEnum',
    _$calloutDecorationShapeEnum,
    opt: true,
  );
  static double? _$calloutBorderRadius(QuillTargetModel v) =>
      v.calloutBorderRadius;
  static const Field<QuillTargetModel, double> _f$calloutBorderRadius = Field(
    'calloutBorderRadius',
    _$calloutBorderRadius,
    opt: true,
  );
  static double? _$calloutBorderThickness(QuillTargetModel v) =>
      v.calloutBorderThickness;
  static const Field<QuillTargetModel, double> _f$calloutBorderThickness =
      Field('calloutBorderThickness', _$calloutBorderThickness, opt: true);
  static int? _$starPoints(QuillTargetModel v) => v.starPoints;
  static const Field<QuillTargetModel, int> _f$starPoints = Field(
    'starPoints',
    _$starPoints,
    opt: true,
  );
  static TargetPointerTypeEnum? _$targetPointerTypeEnum(QuillTargetModel v) =>
      v.targetPointerTypeEnum;
  static const Field<QuillTargetModel, TargetPointerTypeEnum>
  _f$targetPointerTypeEnum = Field(
    'targetPointerTypeEnum',
    _$targetPointerTypeEnum,
    opt: true,
  );
  static ColorModel? _$bubbleOrTargetPointerColor(QuillTargetModel v) =>
      v.bubbleOrTargetPointerColor;
  static const Field<QuillTargetModel, ColorModel>
  _f$bubbleOrTargetPointerColor = Field(
    'bubbleOrTargetPointerColor',
    _$bubbleOrTargetPointerColor,
    opt: true,
  );
  static bool? _$animatePointer(QuillTargetModel v) => v.animatePointer;
  static const Field<QuillTargetModel, bool> _f$animatePointer = Field(
    'animatePointer',
    _$animatePointer,
    opt: true,
    def: false,
  );
  static bool _$autoPlay(QuillTargetModel v) => v.autoPlay;
  static const Field<QuillTargetModel, bool> _f$autoPlay = Field(
    'autoPlay',
    _$autoPlay,
    opt: true,
    def: false,
  );

  @override
  final MappableFields<QuillTargetModel> fields = const {
    #iconSize: _f$iconSize,
    #iconEnum: _f$iconEnum,
    #uid: _f$uid,
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
  };

  static QuillTargetModel _instantiate(DecodingData data) {
    return QuillTargetModel(
      iconSize: data.dec(_f$iconSize),
      iconEnum: data.dec(_f$iconEnum),
      uid: data.dec(_f$uid),
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

  static QuillTargetModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<QuillTargetModel>(map);
  }

  static QuillTargetModel fromJson(String json) {
    return ensureInitialized().decodeJson<QuillTargetModel>(json);
  }
}

mixin QuillTargetModelMappable {
  String toJson() {
    return QuillTargetModelMapper.ensureInitialized()
        .encodeJson<QuillTargetModel>(this as QuillTargetModel);
  }

  Map<String, dynamic> toMap() {
    return QuillTargetModelMapper.ensureInitialized()
        .encodeMap<QuillTargetModel>(this as QuillTargetModel);
  }

  QuillTargetModelCopyWith<QuillTargetModel, QuillTargetModel, QuillTargetModel>
  get copyWith =>
      _QuillTargetModelCopyWithImpl<QuillTargetModel, QuillTargetModel>(
        this as QuillTargetModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return QuillTargetModelMapper.ensureInitialized().stringifyValue(
      this as QuillTargetModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return QuillTargetModelMapper.ensureInitialized().equalsValue(
      this as QuillTargetModel,
      other,
    );
  }

  @override
  int get hashCode {
    return QuillTargetModelMapper.ensureInitialized().hashValue(
      this as QuillTargetModel,
    );
  }
}

extension QuillTargetModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, QuillTargetModel, $Out> {
  QuillTargetModelCopyWith<$R, QuillTargetModel, $Out>
  get $asQuillTargetModel =>
      $base.as((v, t, t2) => _QuillTargetModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class QuillTargetModelCopyWith<$R, $In extends QuillTargetModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  SizeModelCopyWith<$R, SizeModel, SizeModel> get calloutSize;
  UpTo6ColorsCopyWith<$R, UpTo6Colors, UpTo6Colors>? get calloutFillColors;
  UpTo6ColorsCopyWith<$R, UpTo6Colors, UpTo6Colors>? get calloutBorderColors;
  ColorModelCopyWith<$R, ColorModel, ColorModel>?
  get bubbleOrTargetPointerColor;
  $R call({
    double? iconSize,
    TargetButtonIconEnum? iconEnum,
    int? uid,
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
  QuillTargetModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _QuillTargetModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, QuillTargetModel, $Out>
    implements QuillTargetModelCopyWith<$R, QuillTargetModel, $Out> {
  _QuillTargetModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<QuillTargetModel> $mapper =
      QuillTargetModelMapper.ensureInitialized();
  @override
  SizeModelCopyWith<$R, SizeModel, SizeModel> get calloutSize =>
      $value.calloutSize.copyWith.$chain((v) => call(calloutSize: v));
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
    Object? iconSize = $none,
    Object? iconEnum = $none,
    int? uid,
    SizeModel? calloutSize,
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
      if (iconSize != $none) #iconSize: iconSize,
      if (iconEnum != $none) #iconEnum: iconEnum,
      if (uid != null) #uid: uid,
      if (calloutSize != null) #calloutSize: calloutSize,
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
  QuillTargetModel $make(CopyWithData data) => QuillTargetModel(
    iconSize: data.get(#iconSize, or: $value.iconSize),
    iconEnum: data.get(#iconEnum, or: $value.iconEnum),
    uid: data.get(#uid, or: $value.uid),
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
  QuillTargetModelCopyWith<$R2, QuillTargetModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _QuillTargetModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

