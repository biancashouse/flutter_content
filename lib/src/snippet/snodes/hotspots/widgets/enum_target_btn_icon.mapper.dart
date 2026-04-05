// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'enum_target_btn_icon.dart';

class TargetButtonIconEnumMapper extends EnumMapper<TargetButtonIconEnum> {
  TargetButtonIconEnumMapper._();

  static TargetButtonIconEnumMapper? _instance;
  static TargetButtonIconEnumMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TargetButtonIconEnumMapper._());
    }
    return _instance!;
  }

  static TargetButtonIconEnum fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  TargetButtonIconEnum decode(dynamic value) {
    switch (value) {
      case r'question':
        return TargetButtonIconEnum.question;
      case r'pin':
        return TargetButtonIconEnum.pin;
      case r'phone':
        return TargetButtonIconEnum.phone;
      case r'contact':
        return TargetButtonIconEnum.contact;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(TargetButtonIconEnum self) {
    switch (self) {
      case TargetButtonIconEnum.question:
        return r'question';
      case TargetButtonIconEnum.pin:
        return r'pin';
      case TargetButtonIconEnum.phone:
        return r'phone';
      case TargetButtonIconEnum.contact:
        return r'contact';
    }
  }
}

extension TargetButtonIconEnumMapperExtension on TargetButtonIconEnum {
  String toValue() {
    TargetButtonIconEnumMapper.ensureInitialized();
    return MapperContainer.globals.toValue<TargetButtonIconEnum>(this)
        as String;
  }
}

