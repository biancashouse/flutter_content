// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'enum_text_direction.dart';

class TextDirectionEnumMapper extends EnumMapper<TextDirectionEnum> {
  TextDirectionEnumMapper._();

  static TextDirectionEnumMapper? _instance;
  static TextDirectionEnumMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TextDirectionEnumMapper._());
    }
    return _instance!;
  }

  static TextDirectionEnum fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  TextDirectionEnum decode(dynamic value) {
    switch (value) {
      case 'rtl':
        return TextDirectionEnum.rtl;
      case 'ltr':
        return TextDirectionEnum.ltr;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(TextDirectionEnum self) {
    switch (self) {
      case TextDirectionEnum.rtl:
        return 'rtl';
      case TextDirectionEnum.ltr:
        return 'ltr';
    }
  }
}

extension TextDirectionEnumMapperExtension on TextDirectionEnum {
  String toValue() {
    TextDirectionEnumMapper.ensureInitialized();
    return MapperContainer.globals.toValue<TextDirectionEnum>(this) as String;
  }
}
