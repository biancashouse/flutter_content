// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'enum_wrap_cross_alignment.dart';

class WrapCrossAlignmentEnumModelMapper
    extends EnumMapper<WrapCrossAlignmentEnumModel> {
  WrapCrossAlignmentEnumModelMapper._();

  static WrapCrossAlignmentEnumModelMapper? _instance;
  static WrapCrossAlignmentEnumModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = WrapCrossAlignmentEnumModelMapper._());
    }
    return _instance!;
  }

  static WrapCrossAlignmentEnumModel fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  WrapCrossAlignmentEnumModel decode(dynamic value) {
    switch (value) {
      case r'start':
        return WrapCrossAlignmentEnumModel.start;
      case r'end':
        return WrapCrossAlignmentEnumModel.end;
      case r'center':
        return WrapCrossAlignmentEnumModel.center;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(WrapCrossAlignmentEnumModel self) {
    switch (self) {
      case WrapCrossAlignmentEnumModel.start:
        return r'start';
      case WrapCrossAlignmentEnumModel.end:
        return r'end';
      case WrapCrossAlignmentEnumModel.center:
        return r'center';
    }
  }
}

extension WrapCrossAlignmentEnumModelMapperExtension
    on WrapCrossAlignmentEnumModel {
  String toValue() {
    WrapCrossAlignmentEnumModelMapper.ensureInitialized();
    return MapperContainer.globals.toValue<WrapCrossAlignmentEnumModel>(this)
        as String;
  }
}
