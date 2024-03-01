// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'enum_boxfit.dart';

class BoxFitEnumMapper extends EnumMapper<BoxFitEnum> {
  BoxFitEnumMapper._();

  static BoxFitEnumMapper? _instance;
  static BoxFitEnumMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BoxFitEnumMapper._());
    }
    return _instance!;
  }

  static BoxFitEnum fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  BoxFitEnum decode(dynamic value) {
    switch (value) {
      case 'fill':
        return BoxFitEnum.fill;
      case 'contain':
        return BoxFitEnum.contain;
      case 'cover':
        return BoxFitEnum.cover;
      case 'fitWidth':
        return BoxFitEnum.fitWidth;
      case 'fitHeight':
        return BoxFitEnum.fitHeight;
      case 'none':
        return BoxFitEnum.none;
      case 'scaleDown':
        return BoxFitEnum.scaleDown;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(BoxFitEnum self) {
    switch (self) {
      case BoxFitEnum.fill:
        return 'fill';
      case BoxFitEnum.contain:
        return 'contain';
      case BoxFitEnum.cover:
        return 'cover';
      case BoxFitEnum.fitWidth:
        return 'fitWidth';
      case BoxFitEnum.fitHeight:
        return 'fitHeight';
      case BoxFitEnum.none:
        return 'none';
      case BoxFitEnum.scaleDown:
        return 'scaleDown';
    }
  }
}

extension BoxFitEnumMapperExtension on BoxFitEnum {
  String toValue() {
    BoxFitEnumMapper.ensureInitialized();
    return MapperContainer.globals.toValue<BoxFitEnum>(this) as String;
  }
}
