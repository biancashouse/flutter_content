// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
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
      case 'start':
        return WrapAlignmentEnum.start;
      case 'end':
        return WrapAlignmentEnum.end;
      case 'center':
        return WrapAlignmentEnum.center;
      case 'space_between':
        return WrapAlignmentEnum.space_between;
      case 'space_around':
        return WrapAlignmentEnum.space_around;
      case 'space_evenly':
        return WrapAlignmentEnum.space_evenly;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(WrapAlignmentEnum self) {
    switch (self) {
      case WrapAlignmentEnum.start:
        return 'start';
      case WrapAlignmentEnum.end:
        return 'end';
      case WrapAlignmentEnum.center:
        return 'center';
      case WrapAlignmentEnum.space_between:
        return 'space_between';
      case WrapAlignmentEnum.space_around:
        return 'space_around';
      case WrapAlignmentEnum.space_evenly:
        return 'space_evenly';
    }
  }
}

extension WrapAlignmentEnumMapperExtension on WrapAlignmentEnum {
  String toValue() {
    WrapAlignmentEnumMapper.ensureInitialized();
    return MapperContainer.globals.toValue<WrapAlignmentEnum>(this) as String;
  }
}
