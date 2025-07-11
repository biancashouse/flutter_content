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
      case r'displayL':
        return Material3TextSizeEnum.displayL;
      case r'displayM':
        return Material3TextSizeEnum.displayM;
      case r'displayS':
        return Material3TextSizeEnum.displayS;
      case r'headlineL':
        return Material3TextSizeEnum.headlineL;
      case r'headlineM':
        return Material3TextSizeEnum.headlineM;
      case r'headlineS':
        return Material3TextSizeEnum.headlineS;
      case r'titleL':
        return Material3TextSizeEnum.titleL;
      case r'titleM':
        return Material3TextSizeEnum.titleM;
      case r'titleS':
        return Material3TextSizeEnum.titleS;
      case r'bodyL':
        return Material3TextSizeEnum.bodyL;
      case r'bodyM':
        return Material3TextSizeEnum.bodyM;
      case r'bodyS':
        return Material3TextSizeEnum.bodyS;
      case r'labelL':
        return Material3TextSizeEnum.labelL;
      case r'labelM':
        return Material3TextSizeEnum.labelM;
      case r'labelS':
        return Material3TextSizeEnum.labelS;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(Material3TextSizeEnum self) {
    switch (self) {
      case Material3TextSizeEnum.displayL:
        return r'displayL';
      case Material3TextSizeEnum.displayM:
        return r'displayM';
      case Material3TextSizeEnum.displayS:
        return r'displayS';
      case Material3TextSizeEnum.headlineL:
        return r'headlineL';
      case Material3TextSizeEnum.headlineM:
        return r'headlineM';
      case Material3TextSizeEnum.headlineS:
        return r'headlineS';
      case Material3TextSizeEnum.titleL:
        return r'titleL';
      case Material3TextSizeEnum.titleM:
        return r'titleM';
      case Material3TextSizeEnum.titleS:
        return r'titleS';
      case Material3TextSizeEnum.bodyL:
        return r'bodyL';
      case Material3TextSizeEnum.bodyM:
        return r'bodyM';
      case Material3TextSizeEnum.bodyS:
        return r'bodyS';
      case Material3TextSizeEnum.labelL:
        return r'labelL';
      case Material3TextSizeEnum.labelM:
        return r'labelM';
      case Material3TextSizeEnum.labelS:
        return r'labelS';
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
