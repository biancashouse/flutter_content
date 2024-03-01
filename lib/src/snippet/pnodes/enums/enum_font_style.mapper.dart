// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'enum_font_style.dart';

class FontStyleEnumMapper extends EnumMapper<FontStyleEnum> {
  FontStyleEnumMapper._();

  static FontStyleEnumMapper? _instance;
  static FontStyleEnumMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FontStyleEnumMapper._());
    }
    return _instance!;
  }

  static FontStyleEnum fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  FontStyleEnum decode(dynamic value) {
    switch (value) {
      case 'normal':
        return FontStyleEnum.normal;
      case 'italic':
        return FontStyleEnum.italic;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(FontStyleEnum self) {
    switch (self) {
      case FontStyleEnum.normal:
        return 'normal';
      case FontStyleEnum.italic:
        return 'italic';
    }
  }
}

extension FontStyleEnumMapperExtension on FontStyleEnum {
  String toValue() {
    FontStyleEnumMapper.ensureInitialized();
    return MapperContainer.globals.toValue<FontStyleEnum>(this) as String;
  }
}
