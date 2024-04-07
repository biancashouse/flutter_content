// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'text_style_group.dart';

class TextStyleGroupMapper extends ClassMapperBase<TextStyleGroup> {
  TextStyleGroupMapper._();

  static TextStyleGroupMapper? _instance;
  static TextStyleGroupMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TextStyleGroupMapper._());
      Material3TextSizeEnumMapper.ensureInitialized();
      FontStyleEnumMapper.ensureInitialized();
      FontWeightEnumMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TextStyleGroup';

  static String? _$fontFamily(TextStyleGroup v) => v.fontFamily;
  static const Field<TextStyleGroup, String> _f$fontFamily =
      Field('fontFamily', _$fontFamily, opt: true);
  static double? _$fontSize(TextStyleGroup v) => v.fontSize;
  static const Field<TextStyleGroup, double> _f$fontSize =
      Field('fontSize', _$fontSize, opt: true);
  static Material3TextSizeEnum? _$fontSizeName(TextStyleGroup v) =>
      v.fontSizeName;
  static const Field<TextStyleGroup, Material3TextSizeEnum> _f$fontSizeName =
      Field('fontSizeName', _$fontSizeName, opt: true);
  static FontStyleEnum? _$fontStyle(TextStyleGroup v) => v.fontStyle;
  static const Field<TextStyleGroup, FontStyleEnum> _f$fontStyle =
      Field('fontStyle', _$fontStyle, opt: true);
  static FontWeightEnum? _$fontWeight(TextStyleGroup v) => v.fontWeight;
  static const Field<TextStyleGroup, FontWeightEnum> _f$fontWeight =
      Field('fontWeight', _$fontWeight, opt: true);
  static double? _$lineHeight(TextStyleGroup v) => v.lineHeight;
  static const Field<TextStyleGroup, double> _f$lineHeight =
      Field('lineHeight', _$lineHeight, opt: true);
  static double? _$letterSpacing(TextStyleGroup v) => v.letterSpacing;
  static const Field<TextStyleGroup, double> _f$letterSpacing =
      Field('letterSpacing', _$letterSpacing, opt: true);
  static int? _$colorValue(TextStyleGroup v) => v.colorValue;
  static const Field<TextStyleGroup, int> _f$colorValue =
      Field('colorValue', _$colorValue, opt: true);

  @override
  final MappableFields<TextStyleGroup> fields = const {
    #fontFamily: _f$fontFamily,
    #fontSize: _f$fontSize,
    #fontSizeName: _f$fontSizeName,
    #fontStyle: _f$fontStyle,
    #fontWeight: _f$fontWeight,
    #lineHeight: _f$lineHeight,
    #letterSpacing: _f$letterSpacing,
    #colorValue: _f$colorValue,
  };

  static TextStyleGroup _instantiate(DecodingData data) {
    return TextStyleGroup(
        fontFamily: data.dec(_f$fontFamily),
        fontSize: data.dec(_f$fontSize),
        fontSizeName: data.dec(_f$fontSizeName),
        fontStyle: data.dec(_f$fontStyle),
        fontWeight: data.dec(_f$fontWeight),
        lineHeight: data.dec(_f$lineHeight),
        letterSpacing: data.dec(_f$letterSpacing),
        colorValue: data.dec(_f$colorValue));
  }

  @override
  final Function instantiate = _instantiate;

  static TextStyleGroup fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TextStyleGroup>(map);
  }

  static TextStyleGroup fromJson(String json) {
    return ensureInitialized().decodeJson<TextStyleGroup>(json);
  }
}

mixin TextStyleGroupMappable {
  String toJson() {
    return TextStyleGroupMapper.ensureInitialized()
        .encodeJson<TextStyleGroup>(this as TextStyleGroup);
  }

  Map<String, dynamic> toMap() {
    return TextStyleGroupMapper.ensureInitialized()
        .encodeMap<TextStyleGroup>(this as TextStyleGroup);
  }

  TextStyleGroupCopyWith<TextStyleGroup, TextStyleGroup, TextStyleGroup>
      get copyWith => _TextStyleGroupCopyWithImpl(
          this as TextStyleGroup, $identity, $identity);
  @override
  String toString() {
    return TextStyleGroupMapper.ensureInitialized()
        .stringifyValue(this as TextStyleGroup);
  }

  @override
  bool operator ==(Object other) {
    return TextStyleGroupMapper.ensureInitialized()
        .equalsValue(this as TextStyleGroup, other);
  }

  @override
  int get hashCode {
    return TextStyleGroupMapper.ensureInitialized()
        .hashValue(this as TextStyleGroup);
  }
}

extension TextStyleGroupValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TextStyleGroup, $Out> {
  TextStyleGroupCopyWith<$R, TextStyleGroup, $Out> get $asTextStyleGroup =>
      $base.as((v, t, t2) => _TextStyleGroupCopyWithImpl(v, t, t2));
}

abstract class TextStyleGroupCopyWith<$R, $In extends TextStyleGroup, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? fontFamily,
      double? fontSize,
      Material3TextSizeEnum? fontSizeName,
      FontStyleEnum? fontStyle,
      FontWeightEnum? fontWeight,
      double? lineHeight,
      double? letterSpacing,
      int? colorValue});
  TextStyleGroupCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TextStyleGroupCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TextStyleGroup, $Out>
    implements TextStyleGroupCopyWith<$R, TextStyleGroup, $Out> {
  _TextStyleGroupCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TextStyleGroup> $mapper =
      TextStyleGroupMapper.ensureInitialized();
  @override
  $R call(
          {Object? fontFamily = $none,
          Object? fontSize = $none,
          Object? fontSizeName = $none,
          Object? fontStyle = $none,
          Object? fontWeight = $none,
          Object? lineHeight = $none,
          Object? letterSpacing = $none,
          Object? colorValue = $none}) =>
      $apply(FieldCopyWithData({
        if (fontFamily != $none) #fontFamily: fontFamily,
        if (fontSize != $none) #fontSize: fontSize,
        if (fontSizeName != $none) #fontSizeName: fontSizeName,
        if (fontStyle != $none) #fontStyle: fontStyle,
        if (fontWeight != $none) #fontWeight: fontWeight,
        if (lineHeight != $none) #lineHeight: lineHeight,
        if (letterSpacing != $none) #letterSpacing: letterSpacing,
        if (colorValue != $none) #colorValue: colorValue
      }));
  @override
  TextStyleGroup $make(CopyWithData data) => TextStyleGroup(
      fontFamily: data.get(#fontFamily, or: $value.fontFamily),
      fontSize: data.get(#fontSize, or: $value.fontSize),
      fontSizeName: data.get(#fontSizeName, or: $value.fontSizeName),
      fontStyle: data.get(#fontStyle, or: $value.fontStyle),
      fontWeight: data.get(#fontWeight, or: $value.fontWeight),
      lineHeight: data.get(#lineHeight, or: $value.lineHeight),
      letterSpacing: data.get(#letterSpacing, or: $value.letterSpacing),
      colorValue: data.get(#colorValue, or: $value.colorValue));

  @override
  TextStyleGroupCopyWith<$R2, TextStyleGroup, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TextStyleGroupCopyWithImpl($value, $cast, t);
}
