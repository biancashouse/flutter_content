// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'enum_outlined_border.dart';

class OutlinedBorderEnumMapper extends EnumMapper<OutlinedBorderEnum> {
  OutlinedBorderEnumMapper._();

  static OutlinedBorderEnumMapper? _instance;
  static OutlinedBorderEnumMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OutlinedBorderEnumMapper._());
    }
    return _instance!;
  }

  static OutlinedBorderEnum fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  OutlinedBorderEnum decode(dynamic value) {
    switch (value) {
      case r'beveledRectangleBorder':
        return OutlinedBorderEnum.beveledRectangleBorder;
      case r'circleBorder':
        return OutlinedBorderEnum.circleBorder;
      case r'continuousRectangleBorder':
        return OutlinedBorderEnum.continuousRectangleBorder;
      case r'linearBorder':
        return OutlinedBorderEnum.linearBorder;
      case r'roundedRectangleBorder':
        return OutlinedBorderEnum.roundedRectangleBorder;
      case r'stadiumBorder':
        return OutlinedBorderEnum.stadiumBorder;
      case r'starBorder':
        return OutlinedBorderEnum.starBorder;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(OutlinedBorderEnum self) {
    switch (self) {
      case OutlinedBorderEnum.beveledRectangleBorder:
        return r'beveledRectangleBorder';
      case OutlinedBorderEnum.circleBorder:
        return r'circleBorder';
      case OutlinedBorderEnum.continuousRectangleBorder:
        return r'continuousRectangleBorder';
      case OutlinedBorderEnum.linearBorder:
        return r'linearBorder';
      case OutlinedBorderEnum.roundedRectangleBorder:
        return r'roundedRectangleBorder';
      case OutlinedBorderEnum.stadiumBorder:
        return r'stadiumBorder';
      case OutlinedBorderEnum.starBorder:
        return r'starBorder';
    }
  }
}

extension OutlinedBorderEnumMapperExtension on OutlinedBorderEnum {
  String toValue() {
    OutlinedBorderEnumMapper.ensureInitialized();
    return MapperContainer.globals.toValue<OutlinedBorderEnum>(this) as String;
  }
}
