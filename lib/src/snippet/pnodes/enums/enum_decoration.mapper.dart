// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'enum_decoration.dart';

class DecorationShapeEnumMapper extends EnumMapper<DecorationShapeEnum> {
  DecorationShapeEnumMapper._();

  static DecorationShapeEnumMapper? _instance;
  static DecorationShapeEnumMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DecorationShapeEnumMapper._());
    }
    return _instance!;
  }

  static DecorationShapeEnum fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  DecorationShapeEnum decode(dynamic value) {
    switch (value) {
      case 'rectangle':
        return DecorationShapeEnum.rectangle;
      case 'rounded_rectangle':
        return DecorationShapeEnum.rounded_rectangle;
      case 'rectangle_dotted':
        return DecorationShapeEnum.rectangle_dotted;
      case 'rounded_rectangle_dotted':
        return DecorationShapeEnum.rounded_rectangle_dotted;
      case 'circle':
        return DecorationShapeEnum.circle;
      case 'bevelled':
        return DecorationShapeEnum.bevelled;
      case 'stadium':
        return DecorationShapeEnum.stadium;
      case 'star':
        return DecorationShapeEnum.star;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(DecorationShapeEnum self) {
    switch (self) {
      case DecorationShapeEnum.rectangle:
        return 'rectangle';
      case DecorationShapeEnum.rounded_rectangle:
        return 'rounded_rectangle';
      case DecorationShapeEnum.rectangle_dotted:
        return 'rectangle_dotted';
      case DecorationShapeEnum.rounded_rectangle_dotted:
        return 'rounded_rectangle_dotted';
      case DecorationShapeEnum.circle:
        return 'circle';
      case DecorationShapeEnum.bevelled:
        return 'bevelled';
      case DecorationShapeEnum.stadium:
        return 'stadium';
      case DecorationShapeEnum.star:
        return 'star';
    }
  }
}

extension DecorationShapeEnumMapperExtension on DecorationShapeEnum {
  String toValue() {
    DecorationShapeEnumMapper.ensureInitialized();
    return MapperContainer.globals.toValue<DecorationShapeEnum>(this) as String;
  }
}
