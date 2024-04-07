// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'enum_alignment.dart';

class AlignmentEnumMapper extends EnumMapper<AlignmentEnum> {
  AlignmentEnumMapper._();

  static AlignmentEnumMapper? _instance;
  static AlignmentEnumMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AlignmentEnumMapper._());
    }
    return _instance!;
  }

  static AlignmentEnum fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  AlignmentEnum decode(dynamic value) {
    switch (value) {
      case 'topLeft':
        return AlignmentEnum.topLeft;
      case 'topCenter':
        return AlignmentEnum.topCenter;
      case 'topRight':
        return AlignmentEnum.topRight;
      case 'centerLeft':
        return AlignmentEnum.centerLeft;
      case 'center':
        return AlignmentEnum.center;
      case 'centerRight':
        return AlignmentEnum.centerRight;
      case 'bottomLeft':
        return AlignmentEnum.bottomLeft;
      case 'bottomCenter':
        return AlignmentEnum.bottomCenter;
      case 'bottomRight':
        return AlignmentEnum.bottomRight;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(AlignmentEnum self) {
    switch (self) {
      case AlignmentEnum.topLeft:
        return 'topLeft';
      case AlignmentEnum.topCenter:
        return 'topCenter';
      case AlignmentEnum.topRight:
        return 'topRight';
      case AlignmentEnum.centerLeft:
        return 'centerLeft';
      case AlignmentEnum.center:
        return 'center';
      case AlignmentEnum.centerRight:
        return 'centerRight';
      case AlignmentEnum.bottomLeft:
        return 'bottomLeft';
      case AlignmentEnum.bottomCenter:
        return 'bottomCenter';
      case AlignmentEnum.bottomRight:
        return 'bottomRight';
    }
  }
}

extension AlignmentEnumMapperExtension on AlignmentEnum {
  String toValue() {
    AlignmentEnumMapper.ensureInitialized();
    return MapperContainer.globals.toValue<AlignmentEnum>(this) as String;
  }
}
