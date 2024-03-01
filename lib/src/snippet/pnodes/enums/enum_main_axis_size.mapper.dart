// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'enum_main_axis_size.dart';

class MainAxisSizeEnumMapper extends EnumMapper<MainAxisSizeEnum> {
  MainAxisSizeEnumMapper._();

  static MainAxisSizeEnumMapper? _instance;
  static MainAxisSizeEnumMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MainAxisSizeEnumMapper._());
    }
    return _instance!;
  }

  static MainAxisSizeEnum fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  MainAxisSizeEnum decode(dynamic value) {
    switch (value) {
      case 'min':
        return MainAxisSizeEnum.min;
      case 'max':
        return MainAxisSizeEnum.max;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(MainAxisSizeEnum self) {
    switch (self) {
      case MainAxisSizeEnum.min:
        return 'min';
      case MainAxisSizeEnum.max:
        return 'max';
    }
  }
}

extension MainAxisSizeEnumMapperExtension on MainAxisSizeEnum {
  String toValue() {
    MainAxisSizeEnumMapper.ensureInitialized();
    return MapperContainer.globals.toValue<MainAxisSizeEnum>(this) as String;
  }
}
