// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'enum_clip.dart';

class ClipEnumMapper extends EnumMapper<ClipEnum> {
  ClipEnumMapper._();

  static ClipEnumMapper? _instance;
  static ClipEnumMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ClipEnumMapper._());
    }
    return _instance!;
  }

  static ClipEnum fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ClipEnum decode(dynamic value) {
    switch (value) {
      case 'hardEdge':
        return ClipEnum.hardEdge;
      case 'antiAlias':
        return ClipEnum.antiAlias;
      case 'antiAliasWithSaveLayer':
        return ClipEnum.antiAliasWithSaveLayer;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ClipEnum self) {
    switch (self) {
      case ClipEnum.hardEdge:
        return 'hardEdge';
      case ClipEnum.antiAlias:
        return 'antiAlias';
      case ClipEnum.antiAliasWithSaveLayer:
        return 'antiAliasWithSaveLayer';
    }
  }
}

extension ClipEnumMapperExtension on ClipEnum {
  String toValue() {
    ClipEnumMapper.ensureInitialized();
    return MapperContainer.globals.toValue<ClipEnum>(this) as String;
  }
}
