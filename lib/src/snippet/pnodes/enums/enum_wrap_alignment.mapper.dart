// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'enum_wrap_alignment.dart';

class WrapAlignmentEnumModelMapper extends EnumMapper<WrapAlignmentEnumModel> {
  WrapAlignmentEnumModelMapper._();

  static WrapAlignmentEnumModelMapper? _instance;
  static WrapAlignmentEnumModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WrapAlignmentEnumModelMapper._());
    }
    return _instance!;
  }

  static WrapAlignmentEnumModel fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  WrapAlignmentEnumModel decode(dynamic value) {
    switch (value) {
      case r'start':
        return WrapAlignmentEnumModel.start;
      case r'end':
        return WrapAlignmentEnumModel.end;
      case r'center':
        return WrapAlignmentEnumModel.center;
      case r'space_between':
        return WrapAlignmentEnumModel.space_between;
      case r'space_around':
        return WrapAlignmentEnumModel.space_around;
      case r'space_evenly':
        return WrapAlignmentEnumModel.space_evenly;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(WrapAlignmentEnumModel self) {
    switch (self) {
      case WrapAlignmentEnumModel.start:
        return r'start';
      case WrapAlignmentEnumModel.end:
        return r'end';
      case WrapAlignmentEnumModel.center:
        return r'center';
      case WrapAlignmentEnumModel.space_between:
        return r'space_between';
      case WrapAlignmentEnumModel.space_around:
        return r'space_around';
      case WrapAlignmentEnumModel.space_evenly:
        return r'space_evenly';
    }
  }
}

extension WrapAlignmentEnumModelMapperExtension on WrapAlignmentEnumModel {
  String toValue() {
    WrapAlignmentEnumModelMapper.ensureInitialized();
    return MapperContainer.globals.toValue<WrapAlignmentEnumModel>(this)
        as String;
  }
}

