// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'enum_flex_fit.dart';

class FlexFitEnumMapper extends EnumMapper<FlexFitEnum> {
  FlexFitEnumMapper._();

  static FlexFitEnumMapper? _instance;
  static FlexFitEnumMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FlexFitEnumMapper._());
    }
    return _instance!;
  }

  static FlexFitEnum fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  FlexFitEnum decode(dynamic value) {
    switch (value) {
      case 'tight':
        return FlexFitEnum.tight;
      case 'loose':
        return FlexFitEnum.loose;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(FlexFitEnum self) {
    switch (self) {
      case FlexFitEnum.tight:
        return 'tight';
      case FlexFitEnum.loose:
        return 'loose';
    }
  }
}

extension FlexFitEnumMapperExtension on FlexFitEnum {
  String toValue() {
    FlexFitEnumMapper.ensureInitialized();
    return MapperContainer.globals.toValue<FlexFitEnum>(this) as String;
  }
}
