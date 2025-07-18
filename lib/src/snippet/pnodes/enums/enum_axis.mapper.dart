// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'enum_axis.dart';

class AxisEnumMapper extends EnumMapper<AxisEnum> {
  AxisEnumMapper._();

  static AxisEnumMapper? _instance;
  static AxisEnumMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AxisEnumMapper._());
    }
    return _instance!;
  }

  static AxisEnum fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  AxisEnum decode(dynamic value) {
    switch (value) {
      case r'horizontal':
        return AxisEnum.horizontal;
      case r'vertical':
        return AxisEnum.vertical;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(AxisEnum self) {
    switch (self) {
      case AxisEnum.horizontal:
        return r'horizontal';
      case AxisEnum.vertical:
        return r'vertical';
    }
  }
}

extension AxisEnumMapperExtension on AxisEnum {
  String toValue() {
    AxisEnumMapper.ensureInitialized();
    return MapperContainer.globals.toValue<AxisEnum>(this) as String;
  }
}
