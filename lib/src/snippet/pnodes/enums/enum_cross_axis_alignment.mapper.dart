// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'enum_cross_axis_alignment.dart';

class CrossAxisAlignmentEnumMapper extends EnumMapper<CrossAxisAlignmentEnum> {
  CrossAxisAlignmentEnumMapper._();

  static CrossAxisAlignmentEnumMapper? _instance;
  static CrossAxisAlignmentEnumMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CrossAxisAlignmentEnumMapper._());
    }
    return _instance!;
  }

  static CrossAxisAlignmentEnum fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  CrossAxisAlignmentEnum decode(dynamic value) {
    switch (value) {
      case 'start':
        return CrossAxisAlignmentEnum.start;
      case 'end':
        return CrossAxisAlignmentEnum.end;
      case 'center':
        return CrossAxisAlignmentEnum.center;
      case 'stretch':
        return CrossAxisAlignmentEnum.stretch;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(CrossAxisAlignmentEnum self) {
    switch (self) {
      case CrossAxisAlignmentEnum.start:
        return 'start';
      case CrossAxisAlignmentEnum.end:
        return 'end';
      case CrossAxisAlignmentEnum.center:
        return 'center';
      case CrossAxisAlignmentEnum.stretch:
        return 'stretch';
    }
  }
}

extension CrossAxisAlignmentEnumMapperExtension on CrossAxisAlignmentEnum {
  String toValue() {
    CrossAxisAlignmentEnumMapper.ensureInitialized();
    return MapperContainer.globals.toValue<CrossAxisAlignmentEnum>(this)
        as String;
  }
}
