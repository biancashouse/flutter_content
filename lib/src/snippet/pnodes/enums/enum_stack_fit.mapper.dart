// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'enum_stack_fit.dart';

class StackFitEnumMapper extends EnumMapper<StackFitEnum> {
  StackFitEnumMapper._();

  static StackFitEnumMapper? _instance;
  static StackFitEnumMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StackFitEnumMapper._());
    }
    return _instance!;
  }

  static StackFitEnum fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  StackFitEnum decode(dynamic value) {
    switch (value) {
      case 'loose':
        return StackFitEnum.loose;
      case 'expand':
        return StackFitEnum.expand;
      case 'passthrough':
        return StackFitEnum.passthrough;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(StackFitEnum self) {
    switch (self) {
      case StackFitEnum.loose:
        return 'loose';
      case StackFitEnum.expand:
        return 'expand';
      case StackFitEnum.passthrough:
        return 'passthrough';
    }
  }
}

extension StackFitEnumMapperExtension on StackFitEnum {
  String toValue() {
    StackFitEnumMapper.ensureInitialized();
    return MapperContainer.globals.toValue<StackFitEnum>(this) as String;
  }
}
