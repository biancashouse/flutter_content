// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'mappable_enum_decoration.dart';

class MappableDecorationShapeEnumMapper
    extends EnumMapper<MappableDecorationShapeEnum> {
  MappableDecorationShapeEnumMapper._();

  static MappableDecorationShapeEnumMapper? _instance;
  static MappableDecorationShapeEnumMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = MappableDecorationShapeEnumMapper._());
    }
    return _instance!;
  }

  static MappableDecorationShapeEnum fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  MappableDecorationShapeEnum decode(dynamic value) {
    switch (value) {
      case 'rectangle':
        return MappableDecorationShapeEnum.rectangle;
      case 'rounded_rectangle':
        return MappableDecorationShapeEnum.rounded_rectangle;
      case 'rectangle_dotted':
        return MappableDecorationShapeEnum.rectangle_dotted;
      case 'rounded_rectangle_dotted':
        return MappableDecorationShapeEnum.rounded_rectangle_dotted;
      case 'circle':
        return MappableDecorationShapeEnum.circle;
      case 'bevelled':
        return MappableDecorationShapeEnum.bevelled;
      case 'stadium':
        return MappableDecorationShapeEnum.stadium;
      case 'star':
        return MappableDecorationShapeEnum.star;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(MappableDecorationShapeEnum self) {
    switch (self) {
      case MappableDecorationShapeEnum.rectangle:
        return 'rectangle';
      case MappableDecorationShapeEnum.rounded_rectangle:
        return 'rounded_rectangle';
      case MappableDecorationShapeEnum.rectangle_dotted:
        return 'rectangle_dotted';
      case MappableDecorationShapeEnum.rounded_rectangle_dotted:
        return 'rounded_rectangle_dotted';
      case MappableDecorationShapeEnum.circle:
        return 'circle';
      case MappableDecorationShapeEnum.bevelled:
        return 'bevelled';
      case MappableDecorationShapeEnum.stadium:
        return 'stadium';
      case MappableDecorationShapeEnum.star:
        return 'star';
    }
  }
}

extension MappableDecorationShapeEnumMapperExtension
    on MappableDecorationShapeEnum {
  String toValue() {
    MappableDecorationShapeEnumMapper.ensureInitialized();
    return MapperContainer.globals.toValue<MappableDecorationShapeEnum>(this)
        as String;
  }
}
