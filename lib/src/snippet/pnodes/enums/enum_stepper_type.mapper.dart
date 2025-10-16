// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'enum_stepper_type.dart';

class StepperTypeEnumMapper extends EnumMapper<StepperTypeEnum> {
  StepperTypeEnumMapper._();

  static StepperTypeEnumMapper? _instance;
  static StepperTypeEnumMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StepperTypeEnumMapper._());
    }
    return _instance!;
  }

  static StepperTypeEnum fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  StepperTypeEnum decode(dynamic value) {
    switch (value) {
      case r'horizontal':
        return StepperTypeEnum.horizontal;
      case r'vertical':
        return StepperTypeEnum.vertical;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(StepperTypeEnum self) {
    switch (self) {
      case StepperTypeEnum.horizontal:
        return r'horizontal';
      case StepperTypeEnum.vertical:
        return r'vertical';
    }
  }
}

extension StepperTypeEnumMapperExtension on StepperTypeEnum {
  String toValue() {
    StepperTypeEnumMapper.ensureInitialized();
    return MapperContainer.globals.toValue<StepperTypeEnum>(this) as String;
  }
}

