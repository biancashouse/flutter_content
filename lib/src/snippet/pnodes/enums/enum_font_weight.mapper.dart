// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
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
      case 'thin_100':
        return FontWeightEnum.thin_100;
      case 'extraLight_200':
        return FontWeightEnum.extraLight_200;
      case 'light_300':
        return FontWeightEnum.light_300;
      case 'normal_400':
        return FontWeightEnum.normal_400;
      case 'medium_500':
        return FontWeightEnum.medium_500;
      case 'semiBold_600':
        return FontWeightEnum.semiBold_600;
      case 'bold_700':
        return FontWeightEnum.bold_700;
      case 'extraBold_800':
        return FontWeightEnum.extraBold_800;
      case 'thickest_900':
        return FontWeightEnum.thickest_900;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(FontWeightEnum self) {
    switch (self) {
      case FontWeightEnum.thin_100:
        return 'thin_100';
      case FontWeightEnum.extraLight_200:
        return 'extraLight_200';
      case FontWeightEnum.light_300:
        return 'light_300';
      case FontWeightEnum.normal_400:
        return 'normal_400';
      case FontWeightEnum.medium_500:
        return 'medium_500';
      case FontWeightEnum.semiBold_600:
        return 'semiBold_600';
      case FontWeightEnum.bold_700:
        return 'bold_700';
      case FontWeightEnum.extraBold_800:
        return 'extraBold_800';
      case FontWeightEnum.thickest_900:
        return 'thickest_900';
    }
  }
}

extension FontWeightEnumMapperExtension on FontWeightEnum {
  String toValue() {
    FontWeightEnumMapper.ensureInitialized();
    return MapperContainer.globals.toValue<FontWeightEnum>(this) as String;
  }
}
