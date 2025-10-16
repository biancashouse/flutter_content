// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'enum_target_pointer_type.dart';

class TargetPointerTypeEnumMapper extends EnumMapper<TargetPointerTypeEnum> {
  TargetPointerTypeEnumMapper._();

  static TargetPointerTypeEnumMapper? _instance;
  static TargetPointerTypeEnumMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TargetPointerTypeEnumMapper._());
    }
    return _instance!;
  }

  static TargetPointerTypeEnum fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  TargetPointerTypeEnum decode(dynamic value) {
    switch (value) {
      case r'NONE':
        return TargetPointerTypeEnum.NONE;
      case r'POINTY':
        return TargetPointerTypeEnum.POINTY;
      case r'VERY_THIN':
        return TargetPointerTypeEnum.VERY_THIN;
      case r'VERY_THIN_REVERSED':
        return TargetPointerTypeEnum.VERY_THIN_REVERSED;
      case r'THIN':
        return TargetPointerTypeEnum.THIN;
      case r'THIN_REVERSED':
        return TargetPointerTypeEnum.THIN_REVERSED;
      case r'MEDIUM':
        return TargetPointerTypeEnum.MEDIUM;
      case r'MEDIUM_REVERSED':
        return TargetPointerTypeEnum.MEDIUM_REVERSED;
      case r'LARGE':
        return TargetPointerTypeEnum.LARGE;
      case r'LARGE_REVERSED':
        return TargetPointerTypeEnum.LARGE_REVERSED;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(TargetPointerTypeEnum self) {
    switch (self) {
      case TargetPointerTypeEnum.NONE:
        return r'NONE';
      case TargetPointerTypeEnum.POINTY:
        return r'POINTY';
      case TargetPointerTypeEnum.VERY_THIN:
        return r'VERY_THIN';
      case TargetPointerTypeEnum.VERY_THIN_REVERSED:
        return r'VERY_THIN_REVERSED';
      case TargetPointerTypeEnum.THIN:
        return r'THIN';
      case TargetPointerTypeEnum.THIN_REVERSED:
        return r'THIN_REVERSED';
      case TargetPointerTypeEnum.MEDIUM:
        return r'MEDIUM';
      case TargetPointerTypeEnum.MEDIUM_REVERSED:
        return r'MEDIUM_REVERSED';
      case TargetPointerTypeEnum.LARGE:
        return r'LARGE';
      case TargetPointerTypeEnum.LARGE_REVERSED:
        return r'LARGE_REVERSED';
    }
  }
}

extension TargetPointerTypeEnumMapperExtension on TargetPointerTypeEnum {
  String toValue() {
    TargetPointerTypeEnumMapper.ensureInitialized();
    return MapperContainer.globals.toValue<TargetPointerTypeEnum>(this)
        as String;
  }
}

