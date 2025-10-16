// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
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
      case r'topLeft':
        return BadgePositionEnum.topLeft;
      case r'topRight':
        return BadgePositionEnum.topRight;
      case r'bottomLeft':
        return BadgePositionEnum.bottomLeft;
      case r'bottomRight':
        return BadgePositionEnum.bottomRight;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(BadgePositionEnum self) {
    switch (self) {
      case BadgePositionEnum.topLeft:
        return r'topLeft';
      case BadgePositionEnum.topRight:
        return r'topRight';
      case BadgePositionEnum.bottomLeft:
        return r'bottomLeft';
      case BadgePositionEnum.bottomRight:
        return r'bottomRight';
    }
  }
}

extension BadgePositionEnumMapperExtension on BadgePositionEnum {
  String toValue() {
    BadgePositionEnumMapper.ensureInitialized();
    return MapperContainer.globals.toValue<BadgePositionEnum>(this) as String;
  }
}

