// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'enum_material3_text_size.dart';

class Material3TextSizeEnumMapper extends EnumMapper<Material3TextSizeEnum> {
  Material3TextSizeEnumMapper._();

  static Material3TextSizeEnumMapper? _instance;
  static Material3TextSizeEnumMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = Material3TextSizeEnumMapper._());
    }
    return _instance!;
  }

  static Material3TextSizeEnum fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  Material3TextSizeEnum decode(dynamic value) {
    switch (value) {
      case 'displayL':
        return Material3TextSizeEnum.displayL;
      case 'displayM':
        return Material3TextSizeEnum.displayM;
      case 'displayS':
        return Material3TextSizeEnum.displayS;
      case 'headlineL':
        return Material3TextSizeEnum.headlineL;
      case 'headlineM':
        return Material3TextSizeEnum.headlineM;
      case 'headlineS':
        return Material3TextSizeEnum.headlineS;
      case 'titleL':
        return Material3TextSizeEnum.titleL;
      case 'titleM':
        return Material3TextSizeEnum.titleM;
      case 'titleS':
        return Material3TextSizeEnum.titleS;
      case 'bodyL':
        return Material3TextSizeEnum.bodyL;
      case 'bodyM':
        return Material3TextSizeEnum.bodyM;
      case 'bodyS':
        return Material3TextSizeEnum.bodyS;
      case 'labelL':
        return Material3TextSizeEnum.labelL;
      case 'labelM':
        return Material3TextSizeEnum.labelM;
      case 'labelS':
        return Material3TextSizeEnum.labelS;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(Material3TextSizeEnum self) {
    switch (self) {
      case Material3TextSizeEnum.displayL:
        return 'displayL';
      case Material3TextSizeEnum.displayM:
        return 'displayM';
      case Material3TextSizeEnum.displayS:
        return 'displayS';
      case Material3TextSizeEnum.headlineL:
        return 'headlineL';
      case Material3TextSizeEnum.headlineM:
        return 'headlineM';
      case Material3TextSizeEnum.headlineS:
        return 'headlineS';
      case Material3TextSizeEnum.titleL:
        return 'titleL';
      case Material3TextSizeEnum.titleM:
        return 'titleM';
      case Material3TextSizeEnum.titleS:
        return 'titleS';
      case Material3TextSizeEnum.bodyL:
        return 'bodyL';
      case Material3TextSizeEnum.bodyM:
        return 'bodyM';
      case Material3TextSizeEnum.bodyS:
        return 'bodyS';
      case Material3TextSizeEnum.labelL:
        return 'labelL';
      case Material3TextSizeEnum.labelM:
        return 'labelM';
      case Material3TextSizeEnum.labelS:
        return 'labelS';
    }
  }
}

extension Material3TextSizeEnumMapperExtension on Material3TextSizeEnum {
  String toValue() {
    Material3TextSizeEnumMapper.ensureInitialized();
    return MapperContainer.globals.toValue<Material3TextSizeEnum>(this)
        as String;
  }
}
