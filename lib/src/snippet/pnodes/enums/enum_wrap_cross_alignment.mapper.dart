// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'enum_wrap_cross_alignment.dart';

class WrapCrossAlignmentEnumMapper extends EnumMapper<WrapCrossAlignmentEnum> {
  WrapCrossAlignmentEnumMapper._();

  static WrapCrossAlignmentEnumMapper? _instance;
  static WrapCrossAlignmentEnumMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WrapCrossAlignmentEnumMapper._());
    }
    return _instance!;
  }

  static WrapCrossAlignmentEnum fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  WrapCrossAlignmentEnum decode(dynamic value) {
    switch (value) {
      case r'start':
        return WrapCrossAlignmentEnum.start;
      case r'end':
        return WrapCrossAlignmentEnum.end;
      case r'center':
        return WrapCrossAlignmentEnum.center;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(WrapCrossAlignmentEnum self) {
    switch (self) {
      case WrapCrossAlignmentEnum.start:
        return r'start';
      case WrapCrossAlignmentEnum.end:
        return r'end';
      case WrapCrossAlignmentEnum.center:
        return r'center';
    }
  }
}

extension WrapCrossAlignmentEnumMapperExtension on WrapCrossAlignmentEnum {
  String toValue() {
    WrapCrossAlignmentEnumMapper.ensureInitialized();
    return MapperContainer.globals.toValue<WrapCrossAlignmentEnum>(this)
        as String;
  }
}
