// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'enum_main_axis_alignment.dart';

class MainAxisAlignmentEnumMapper extends EnumMapper<MainAxisAlignmentEnum> {
  MainAxisAlignmentEnumMapper._();

  static MainAxisAlignmentEnumMapper? _instance;
  static MainAxisAlignmentEnumMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MainAxisAlignmentEnumMapper._());
    }
    return _instance!;
  }

  static MainAxisAlignmentEnum fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  MainAxisAlignmentEnum decode(dynamic value) {
    switch (value) {
      case r'start':
        return MainAxisAlignmentEnum.start;
      case r'end':
        return MainAxisAlignmentEnum.end;
      case r'center':
        return MainAxisAlignmentEnum.center;
      case r'space_between':
        return MainAxisAlignmentEnum.space_between;
      case r'space_around':
        return MainAxisAlignmentEnum.space_around;
      case r'space_evenly':
        return MainAxisAlignmentEnum.space_evenly;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(MainAxisAlignmentEnum self) {
    switch (self) {
      case MainAxisAlignmentEnum.start:
        return r'start';
      case MainAxisAlignmentEnum.end:
        return r'end';
      case MainAxisAlignmentEnum.center:
        return r'center';
      case MainAxisAlignmentEnum.space_between:
        return r'space_between';
      case MainAxisAlignmentEnum.space_around:
        return r'space_around';
      case MainAxisAlignmentEnum.space_evenly:
        return r'space_evenly';
    }
  }
}

extension MainAxisAlignmentEnumMapperExtension on MainAxisAlignmentEnum {
  String toValue() {
    MainAxisAlignmentEnumMapper.ensureInitialized();
    return MapperContainer.globals.toValue<MainAxisAlignmentEnum>(this)
        as String;
  }
}
