// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'text_style_properties.dart';

class TextStylePropertiesMapper extends ClassMapperBase<TextStyleProperties> {
  TextStylePropertiesMapper._();

  static TextStylePropertiesMapper? _instance;
  static TextStylePropertiesMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TextStylePropertiesMapper._());
      Material3TextSizeEnumMapper.ensureInitialized();
      FontStyleEnumMapper.ensureInitialized();
      FontWeightEnumMapper.ensureInitialized();
      ColorModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TextStyleProperties';

  static String? _$fontFamily(TextStyleProperties v) => v.fontFamily;
  static const Field<TextStyleProperties, String> _f$fontFamily = Field(
    'fontFamily',
    _$fontFamily,
    opt: true,
  );
  static double? _$fontSize(TextStyleProperties v) => v.fontSize;
  static const Field<TextStyleProperties, double> _f$fontSize = Field(
    'fontSize',
    _$fontSize,
    opt: true,
  );
  static Material3TextSizeEnum? _$fontSizeName(TextStyleProperties v) =>
      v.fontSizeName;
  static const Field<TextStyleProperties, Material3TextSizeEnum>
  _f$fontSizeName = Field('fontSizeName', _$fontSizeName, opt: true);
  static FontStyleEnum? _$fontStyle(TextStyleProperties v) => v.fontStyle;
  static const Field<TextStyleProperties, FontStyleEnum> _f$fontStyle = Field(
    'fontStyle',
    _$fontStyle,
    opt: true,
  );
  static FontWeightEnum? _$fontWeight(TextStyleProperties v) => v.fontWeight;
  static const Field<TextStyleProperties, FontWeightEnum> _f$fontWeight = Field(
    'fontWeight',
    _$fontWeight,
    opt: true,
  );
  static double? _$lineHeight(TextStyleProperties v) => v.lineHeight;
  static const Field<TextStyleProperties, double> _f$lineHeight = Field(
    'lineHeight',
    _$lineHeight,
    opt: true,
  );
  static double? _$letterSpacing(TextStyleProperties v) => v.letterSpacing;
  static const Field<TextStyleProperties, double> _f$letterSpacing = Field(
    'letterSpacing',
    _$letterSpacing,
    opt: true,
  );
  static ColorModel? _$color(TextStyleProperties v) => v.color;
  static const Field<TextStyleProperties, ColorModel> _f$color = Field(
    'color',
    _$color,
    opt: true,
  );
  static String? _$lastHoveredSuggestion(TextStyleProperties v) =>
      v.lastHoveredSuggestion;
  static const Field<TextStyleProperties, String> _f$lastHoveredSuggestion =
      Field(
        'lastHoveredSuggestion',
        _$lastHoveredSuggestion,
        mode: FieldMode.member,
      );
  static String? _$lastSearchString(TextStyleProperties v) =>
      v.lastSearchString;
  static const Field<TextStyleProperties, String> _f$lastSearchString = Field(
    'lastSearchString',
    _$lastSearchString,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<TextStyleProperties> fields = const {
    #fontFamily: _f$fontFamily,
    #fontSize: _f$fontSize,
    #fontSizeName: _f$fontSizeName,
    #fontStyle: _f$fontStyle,
    #fontWeight: _f$fontWeight,
    #lineHeight: _f$lineHeight,
    #letterSpacing: _f$letterSpacing,
    #color: _f$color,
    #lastHoveredSuggestion: _f$lastHoveredSuggestion,
    #lastSearchString: _f$lastSearchString,
  };

  static TextStyleProperties _instantiate(DecodingData data) {
    return TextStyleProperties(
      fontFamily: data.dec(_f$fontFamily),
      fontSize: data.dec(_f$fontSize),
      fontSizeName: data.dec(_f$fontSizeName),
      fontStyle: data.dec(_f$fontStyle),
      fontWeight: data.dec(_f$fontWeight),
      lineHeight: data.dec(_f$lineHeight),
      letterSpacing: data.dec(_f$letterSpacing),
      color: data.dec(_f$color),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static TextStyleProperties fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TextStyleProperties>(map);
  }

  static TextStyleProperties fromJson(String json) {
    return ensureInitialized().decodeJson<TextStyleProperties>(json);
  }
}

mixin TextStylePropertiesMappable {
  String toJson() {
    return TextStylePropertiesMapper.ensureInitialized()
        .encodeJson<TextStyleProperties>(this as TextStyleProperties);
  }

  Map<String, dynamic> toMap() {
    return TextStylePropertiesMapper.ensureInitialized()
        .encodeMap<TextStyleProperties>(this as TextStyleProperties);
  }

  TextStylePropertiesCopyWith<
    TextStyleProperties,
    TextStyleProperties,
    TextStyleProperties
  >
  get copyWith =>
      _TextStylePropertiesCopyWithImpl<
        TextStyleProperties,
        TextStyleProperties
      >(this as TextStyleProperties, $identity, $identity);
  @override
  String toString() {
    return TextStylePropertiesMapper.ensureInitialized().stringifyValue(
      this as TextStyleProperties,
    );
  }

  @override
  bool operator ==(Object other) {
    return TextStylePropertiesMapper.ensureInitialized().equalsValue(
      this as TextStyleProperties,
      other,
    );
  }

  @override
  int get hashCode {
    return TextStylePropertiesMapper.ensureInitialized().hashValue(
      this as TextStyleProperties,
    );
  }
}

extension TextStylePropertiesValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TextStyleProperties, $Out> {
  TextStylePropertiesCopyWith<$R, TextStyleProperties, $Out>
  get $asTextStyleProperties => $base.as(
    (v, t, t2) => _TextStylePropertiesCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class TextStylePropertiesCopyWith<
  $R,
  $In extends TextStyleProperties,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ColorModelCopyWith<$R, ColorModel, ColorModel>? get color;
  $R call({
    String? fontFamily,
    double? fontSize,
    Material3TextSizeEnum? fontSizeName,
    FontStyleEnum? fontStyle,
    FontWeightEnum? fontWeight,
    double? lineHeight,
    double? letterSpacing,
    ColorModel? color,
  });
  TextStylePropertiesCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _TextStylePropertiesCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TextStyleProperties, $Out>
    implements TextStylePropertiesCopyWith<$R, TextStyleProperties, $Out> {
  _TextStylePropertiesCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TextStyleProperties> $mapper =
      TextStylePropertiesMapper.ensureInitialized();
  @override
  ColorModelCopyWith<$R, ColorModel, ColorModel>? get color =>
      $value.color?.copyWith.$chain((v) => call(color: v));
  @override
  $R call({
    Object? fontFamily = $none,
    Object? fontSize = $none,
    Object? fontSizeName = $none,
    Object? fontStyle = $none,
    Object? fontWeight = $none,
    Object? lineHeight = $none,
    Object? letterSpacing = $none,
    Object? color = $none,
  }) => $apply(
    FieldCopyWithData({
      if (fontFamily != $none) #fontFamily: fontFamily,
      if (fontSize != $none) #fontSize: fontSize,
      if (fontSizeName != $none) #fontSizeName: fontSizeName,
      if (fontStyle != $none) #fontStyle: fontStyle,
      if (fontWeight != $none) #fontWeight: fontWeight,
      if (lineHeight != $none) #lineHeight: lineHeight,
      if (letterSpacing != $none) #letterSpacing: letterSpacing,
      if (color != $none) #color: color,
    }),
  );
  @override
  TextStyleProperties $make(CopyWithData data) => TextStyleProperties(
    fontFamily: data.get(#fontFamily, or: $value.fontFamily),
    fontSize: data.get(#fontSize, or: $value.fontSize),
    fontSizeName: data.get(#fontSizeName, or: $value.fontSizeName),
    fontStyle: data.get(#fontStyle, or: $value.fontStyle),
    fontWeight: data.get(#fontWeight, or: $value.fontWeight),
    lineHeight: data.get(#lineHeight, or: $value.lineHeight),
    letterSpacing: data.get(#letterSpacing, or: $value.letterSpacing),
    color: data.get(#color, or: $value.color),
  );

  @override
  TextStylePropertiesCopyWith<$R2, TextStyleProperties, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _TextStylePropertiesCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

