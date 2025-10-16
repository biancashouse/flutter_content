// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'enum_font_weight.dart';

class FontWeightEnumMapper extends EnumMapper<FontWeightEnum> {
  FontWeightEnumMapper._();

  static FontWeightEnumMapper? _instance;
  static FontWeightEnumMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FontWeightEnumMapper._());
    }
    return _instance!;
  }

  static FontWeightEnum fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  FontWeightEnum decode(dynamic value) {
    switch (value) {
      case r'thin_100':
        return FontWeightEnum.thin_100;
      case r'extraLight_200':
        return FontWeightEnum.extraLight_200;
      case r'light_300':
        return FontWeightEnum.light_300;
      case r'normal_400':
        return FontWeightEnum.normal_400;
      case r'medium_500':
        return FontWeightEnum.medium_500;
      case r'semiBold_600':
        return FontWeightEnum.semiBold_600;
      case r'bold_700':
        return FontWeightEnum.bold_700;
      case r'extraBold_800':
        return FontWeightEnum.extraBold_800;
      case r'thickest_900':
        return FontWeightEnum.thickest_900;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(FontWeightEnum self) {
    switch (self) {
      case FontWeightEnum.thin_100:
        return r'thin_100';
      case FontWeightEnum.extraLight_200:
        return r'extraLight_200';
      case FontWeightEnum.light_300:
        return r'light_300';
      case FontWeightEnum.normal_400:
        return r'normal_400';
      case FontWeightEnum.medium_500:
        return r'medium_500';
      case FontWeightEnum.semiBold_600:
        return r'semiBold_600';
      case FontWeightEnum.bold_700:
        return r'bold_700';
      case FontWeightEnum.extraBold_800:
        return r'extraBold_800';
      case FontWeightEnum.thickest_900:
        return r'thickest_900';
    }
  }
}

extension FontWeightEnumMapperExtension on FontWeightEnum {
  String toValue() {
    FontWeightEnumMapper.ensureInitialized();
    return MapperContainer.globals.toValue<FontWeightEnum>(this) as String;
  }
}

