// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'enum_corner.dart';

class BadgePositionEnumMapper extends EnumMapper<BadgePositionEnum> {
  BadgePositionEnumMapper._();

  static BadgePositionEnumMapper? _instance;
  static BadgePositionEnumMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BadgePositionEnumMapper._());
    }
    return _instance!;
  }

  static BadgePositionEnum fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  BadgePositionEnum decode(dynamic value) {
    switch (value) {
      case 'topLeft':
        return BadgePositionEnum.topLeft;
      case 'topRight':
        return BadgePositionEnum.topRight;
      case 'bottomLeft':
        return BadgePositionEnum.bottomLeft;
      case 'bottomRight':
        return BadgePositionEnum.bottomRight;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(BadgePositionEnum self) {
    switch (self) {
      case BadgePositionEnum.topLeft:
        return 'topLeft';
      case BadgePositionEnum.topRight:
        return 'topRight';
      case BadgePositionEnum.bottomLeft:
        return 'bottomLeft';
      case BadgePositionEnum.bottomRight:
        return 'bottomRight';
    }
  }
}

extension BadgePositionEnumMapperExtension on BadgePositionEnum {
  String toValue() {
    BadgePositionEnumMapper.ensureInitialized();
    return MapperContainer.globals.toValue<BadgePositionEnum>(this) as String;
  }
}
