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
      case 'left':
        return TextAlignEnum.left;
      case 'right':
        return TextAlignEnum.right;
      case 'center':
        return TextAlignEnum.center;
      case 'justify':
        return TextAlignEnum.justify;
      case 'start':
        return TextAlignEnum.start;
      case 'end':
        return TextAlignEnum.end;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(TextAlignEnum self) {
    switch (self) {
      case TextAlignEnum.left:
        return 'left';
      case TextAlignEnum.right:
        return 'right';
      case TextAlignEnum.center:
        return 'center';
      case TextAlignEnum.justify:
        return 'justify';
      case TextAlignEnum.start:
        return 'start';
      case TextAlignEnum.end:
        return 'end';
    }
  }
}

extension TextAlignEnumMapperExtension on TextAlignEnum {
  String toValue() {
    TextAlignEnumMapper.ensureInitialized();
    return MapperContainer.globals.toValue<TextAlignEnum>(this) as String;
  }
}
