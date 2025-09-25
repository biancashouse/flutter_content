// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'enum_main_axis_alignment.dart';

class MainAxisAlignmentEnumModelMapper
    extends EnumMapper<MainAxisAlignmentEnumModel> {
  MainAxisAlignmentEnumModelMapper._();

  static MainAxisAlignmentEnumModelMapper? _instance;
  static MainAxisAlignmentEnumModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = MainAxisAlignmentEnumModelMapper._());
    }
    return _instance!;
  }

  static MainAxisAlignmentEnumModel fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  MainAxisAlignmentEnumModel decode(dynamic value) {
    switch (value) {
      case r'start':
        return MainAxisAlignmentEnumModel.start;
      case r'end':
        return MainAxisAlignmentEnumModel.end;
      case r'center':
        return MainAxisAlignmentEnumModel.center;
      case r'space_between':
        return MainAxisAlignmentEnumModel.space_between;
      case r'space_around':
        return MainAxisAlignmentEnumModel.space_around;
      case r'space_evenly':
        return MainAxisAlignmentEnumModel.space_evenly;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(MainAxisAlignmentEnumModel self) {
    switch (self) {
      case MainAxisAlignmentEnumModel.start:
        return r'start';
      case MainAxisAlignmentEnumModel.end:
        return r'end';
      case MainAxisAlignmentEnumModel.center:
        return r'center';
      case MainAxisAlignmentEnumModel.space_between:
        return r'space_between';
      case MainAxisAlignmentEnumModel.space_around:
        return r'space_around';
      case MainAxisAlignmentEnumModel.space_evenly:
        return r'space_evenly';
    }
  }
}

extension MainAxisAlignmentEnumModelMapperExtension
    on MainAxisAlignmentEnumModel {
  String toValue() {
    MainAxisAlignmentEnumModelMapper.ensureInitialized();
    return MapperContainer.globals.toValue<MainAxisAlignmentEnumModel>(this)
        as String;
  }
}
