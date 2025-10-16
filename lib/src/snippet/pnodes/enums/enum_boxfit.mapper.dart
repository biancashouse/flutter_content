// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
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
      case r'fill':
        return BoxFitEnum.fill;
      case r'contain':
        return BoxFitEnum.contain;
      case r'cover':
        return BoxFitEnum.cover;
      case r'fitWidth':
        return BoxFitEnum.fitWidth;
      case r'fitHeight':
        return BoxFitEnum.fitHeight;
      case r'none':
        return BoxFitEnum.none;
      case r'scaleDown':
        return BoxFitEnum.scaleDown;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(BoxFitEnum self) {
    switch (self) {
      case BoxFitEnum.fill:
        return r'fill';
      case BoxFitEnum.contain:
        return r'contain';
      case BoxFitEnum.cover:
        return r'cover';
      case BoxFitEnum.fitWidth:
        return r'fitWidth';
      case BoxFitEnum.fitHeight:
        return r'fitHeight';
      case BoxFitEnum.none:
        return r'none';
      case BoxFitEnum.scaleDown:
        return r'scaleDown';
    }
  }
}

extension BoxFitEnumMapperExtension on BoxFitEnum {
  String toValue() {
    BoxFitEnumMapper.ensureInitialized();
    return MapperContainer.globals.toValue<BoxFitEnum>(this) as String;
  }
}

