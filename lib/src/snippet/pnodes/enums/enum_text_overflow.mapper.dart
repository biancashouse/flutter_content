// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'enum_text_overflow.dart';

class TextOverflowEnumMapper extends EnumMapper<TextOverflowEnum> {
  TextOverflowEnumMapper._();

  static TextOverflowEnumMapper? _instance;
  static TextOverflowEnumMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TextOverflowEnumMapper._());
    }
    return _instance!;
  }

  static TextOverflowEnum fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  TextOverflowEnum decode(dynamic value) {
    switch (value) {
      case 'clip':
        return TextOverflowEnum.clip;
      case 'fade':
        return TextOverflowEnum.fade;
      case 'ellipsis':
        return TextOverflowEnum.ellipsis;
      case 'visible':
        return TextOverflowEnum.visible;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(TextOverflowEnum self) {
    switch (self) {
      case TextOverflowEnum.clip:
        return 'clip';
      case TextOverflowEnum.fade:
        return 'fade';
      case TextOverflowEnum.ellipsis:
        return 'ellipsis';
      case TextOverflowEnum.visible:
        return 'visible';
    }
  }
}

extension TextOverflowEnumMapperExtension on TextOverflowEnum {
  String toValue() {
    TextOverflowEnumMapper.ensureInitialized();
    return MapperContainer.globals.toValue<TextOverflowEnum>(this) as String;
  }
}
