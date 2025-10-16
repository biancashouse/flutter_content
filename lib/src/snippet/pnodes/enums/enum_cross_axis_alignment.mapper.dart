// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'enum_cross_axis_alignment.dart';

class CrossAxisAlignmentEnumModelMapper
    extends EnumMapper<CrossAxisAlignmentEnumModel> {
  CrossAxisAlignmentEnumModelMapper._();

  static CrossAxisAlignmentEnumModelMapper? _instance;
  static CrossAxisAlignmentEnumModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = CrossAxisAlignmentEnumModelMapper._(),
      );
    }
    return _instance!;
  }

  static CrossAxisAlignmentEnumModel fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  CrossAxisAlignmentEnumModel decode(dynamic value) {
    switch (value) {
      case r'start':
        return CrossAxisAlignmentEnumModel.start;
      case r'end':
        return CrossAxisAlignmentEnumModel.end;
      case r'center':
        return CrossAxisAlignmentEnumModel.center;
      case r'stretch':
        return CrossAxisAlignmentEnumModel.stretch;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(CrossAxisAlignmentEnumModel self) {
    switch (self) {
      case CrossAxisAlignmentEnumModel.start:
        return r'start';
      case CrossAxisAlignmentEnumModel.end:
        return r'end';
      case CrossAxisAlignmentEnumModel.center:
        return r'center';
      case CrossAxisAlignmentEnumModel.stretch:
        return r'stretch';
    }
  }
}

extension CrossAxisAlignmentEnumModelMapperExtension
    on CrossAxisAlignmentEnumModel {
  String toValue() {
    CrossAxisAlignmentEnumModelMapper.ensureInitialized();
    return MapperContainer.globals.toValue<CrossAxisAlignmentEnumModel>(this)
        as String;
  }
}

