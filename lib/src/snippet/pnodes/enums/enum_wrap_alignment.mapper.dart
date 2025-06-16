// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'enum_wrap_alignment.dart';

class WrapAlignmentEnumMapper extends EnumMapper<WrapAlignmentEnum> {
  WrapAlignmentEnumMapper._();

  static WrapAlignmentEnumMapper? _instance;
  static WrapAlignmentEnumMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WrapAlignmentEnumMapper._());
    }
    return _instance!;
  }

  static WrapAlignmentEnum fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  WrapAlignmentEnum decode(dynamic value) {
    switch (value) {
      case r'start':
        return WrapAlignmentEnum.start;
      case r'end':
        return WrapAlignmentEnum.end;
      case r'center':
        return WrapAlignmentEnum.center;
      case r'space_between':
        return WrapAlignmentEnum.space_between;
      case r'space_around':
        return WrapAlignmentEnum.space_around;
      case r'space_evenly':
        return WrapAlignmentEnum.space_evenly;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(WrapAlignmentEnum self) {
    switch (self) {
      case WrapAlignmentEnum.start:
        return r'start';
      case WrapAlignmentEnum.end:
        return r'end';
      case WrapAlignmentEnum.center:
        return r'center';
      case WrapAlignmentEnum.space_between:
        return r'space_between';
      case WrapAlignmentEnum.space_around:
        return r'space_around';
      case WrapAlignmentEnum.space_evenly:
        return r'space_evenly';
    }
  }
}

extension WrapAlignmentEnumMapperExtension on WrapAlignmentEnum {
  String toValue() {
    WrapAlignmentEnumMapper.ensureInitialized();
    return MapperContainer.globals.toValue<WrapAlignmentEnum>(this) as String;
  }
}
