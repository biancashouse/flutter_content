// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'enum_arrow_type.dart';

class ArrowTypeEnumMapper extends EnumMapper<ArrowTypeEnum> {
  ArrowTypeEnumMapper._();

  static ArrowTypeEnumMapper? _instance;
  static ArrowTypeEnumMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ArrowTypeEnumMapper._());
    }
    return _instance!;
  }

  static ArrowTypeEnum fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ArrowTypeEnum decode(dynamic value) {
    switch (value) {
      case 'NO_CONNECTOR':
        return ArrowTypeEnum.NO_CONNECTOR;
      case 'POINTY':
        return ArrowTypeEnum.POINTY;
      case 'VERY_THIN':
        return ArrowTypeEnum.VERY_THIN;
      case 'VERY_THIN_REVERSED':
        return ArrowTypeEnum.VERY_THIN_REVERSED;
      case 'THIN':
        return ArrowTypeEnum.THIN;
      case 'THIN_REVERSED':
        return ArrowTypeEnum.THIN_REVERSED;
      case 'MEDIUM':
        return ArrowTypeEnum.MEDIUM;
      case 'MEDIUM_REVERSED':
        return ArrowTypeEnum.MEDIUM_REVERSED;
      case 'LARGE':
        return ArrowTypeEnum.LARGE;
      case 'LARGE_REVERSED':
        return ArrowTypeEnum.LARGE_REVERSED;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ArrowTypeEnum self) {
    switch (self) {
      case ArrowTypeEnum.NO_CONNECTOR:
        return 'NO_CONNECTOR';
      case ArrowTypeEnum.POINTY:
        return 'POINTY';
      case ArrowTypeEnum.VERY_THIN:
        return 'VERY_THIN';
      case ArrowTypeEnum.VERY_THIN_REVERSED:
        return 'VERY_THIN_REVERSED';
      case ArrowTypeEnum.THIN:
        return 'THIN';
      case ArrowTypeEnum.THIN_REVERSED:
        return 'THIN_REVERSED';
      case ArrowTypeEnum.MEDIUM:
        return 'MEDIUM';
      case ArrowTypeEnum.MEDIUM_REVERSED:
        return 'MEDIUM_REVERSED';
      case ArrowTypeEnum.LARGE:
        return 'LARGE';
      case ArrowTypeEnum.LARGE_REVERSED:
        return 'LARGE_REVERSED';
    }
  }
}

extension ArrowTypeEnumMapperExtension on ArrowTypeEnum {
  String toValue() {
    ArrowTypeEnumMapper.ensureInitialized();
    return MapperContainer.globals.toValue<ArrowTypeEnum>(this) as String;
  }
}
