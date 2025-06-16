// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'enum_text_align.dart';

class TextAlignEnumMapper extends EnumMapper<TextAlignEnum> {
  TextAlignEnumMapper._();

  static TextAlignEnumMapper? _instance;
  static TextAlignEnumMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TextAlignEnumMapper._());
    }
    return _instance!;
  }

  static TextAlignEnum fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  TextAlignEnum decode(dynamic value) {
    switch (value) {
      case r'left':
        return TextAlignEnum.left;
      case r'right':
        return TextAlignEnum.right;
      case r'center':
        return TextAlignEnum.center;
      case r'justify':
        return TextAlignEnum.justify;
      case r'start':
        return TextAlignEnum.start;
      case r'end':
        return TextAlignEnum.end;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(TextAlignEnum self) {
    switch (self) {
      case TextAlignEnum.left:
        return r'left';
      case TextAlignEnum.right:
        return r'right';
      case TextAlignEnum.center:
        return r'center';
      case TextAlignEnum.justify:
        return r'justify';
      case TextAlignEnum.start:
        return r'start';
      case TextAlignEnum.end:
        return r'end';
    }
  }
}

extension TextAlignEnumMapperExtension on TextAlignEnum {
  String toValue() {
    TextAlignEnumMapper.ensureInitialized();
    return MapperContainer.globals.toValue<TextAlignEnum>(this) as String;
  }
}
