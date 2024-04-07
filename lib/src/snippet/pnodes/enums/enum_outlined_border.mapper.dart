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
      case 'beveledRectangleBorder':
        return OutlinedBorderEnum.beveledRectangleBorder;
      case 'circleBorder':
        return OutlinedBorderEnum.circleBorder;
      case 'continuousRectangleBorder':
        return OutlinedBorderEnum.continuousRectangleBorder;
      case 'linearBorder':
        return OutlinedBorderEnum.linearBorder;
      case 'roundedRectangleBorder':
        return OutlinedBorderEnum.roundedRectangleBorder;
      case 'stadiumBorder':
        return OutlinedBorderEnum.stadiumBorder;
      case 'starBorder':
        return OutlinedBorderEnum.starBorder;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(OutlinedBorderEnum self) {
    switch (self) {
      case OutlinedBorderEnum.beveledRectangleBorder:
        return 'beveledRectangleBorder';
      case OutlinedBorderEnum.circleBorder:
        return 'circleBorder';
      case OutlinedBorderEnum.continuousRectangleBorder:
        return 'continuousRectangleBorder';
      case OutlinedBorderEnum.linearBorder:
        return 'linearBorder';
      case OutlinedBorderEnum.roundedRectangleBorder:
        return 'roundedRectangleBorder';
      case OutlinedBorderEnum.stadiumBorder:
        return 'stadiumBorder';
      case OutlinedBorderEnum.starBorder:
        return 'starBorder';
    }
  }
}

extension OutlinedBorderEnumMapperExtension on OutlinedBorderEnum {
  String toValue() {
    OutlinedBorderEnumMapper.ensureInitialized();
    return MapperContainer.globals.toValue<OutlinedBorderEnum>(this) as String;
  }
}
