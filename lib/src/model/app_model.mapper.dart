// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'app_model.dart';

class AppModelMapper extends ClassMapperBase<AppModel> {
  AppModelMapper._();

  static AppModelMapper? _instance;
  static AppModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AppModelMapper._());
      BranchModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AppModel';

  static String _$currentBranchName(AppModel v) => v.currentBranchName;
  static const Field<AppModel, String> _f$currentBranchName = Field(
      'currentBranchName', _$currentBranchName,
      opt: true, def: 'staging');
  static Map<String, BranchModel> _$branches(AppModel v) => v.branches;
  static const Field<AppModel, Map<String, BranchModel>> _f$branches =
      Field('branches', _$branches, opt: true, def: const {});
  static String? _$clipboard(AppModel v) => v.clipboard;
  static const Field<AppModel, String> _f$clipboard =
      Field('clipboard', _$clipboard, opt: true);

  @override
  final MappableFields<AppModel> fields = const {
    #currentBranchName: _f$currentBranchName,
    #branches: _f$branches,
    #clipboard: _f$clipboard,
  };

  static AppModel _instantiate(DecodingData data) {
    return AppModel(
        currentBranchName: data.dec(_f$currentBranchName),
        branches: data.dec(_f$branches),
        clipboard: data.dec(_f$clipboard));
  }

  @override
  final Function instantiate = _instantiate;

  static AppModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AppModel>(map);
  }

  static AppModel fromJson(String json) {
    return ensureInitialized().decodeJson<AppModel>(json);
  }
}

mixin AppModelMappable {
  String toJson() {
    return AppModelMapper.ensureInitialized()
        .encodeJson<AppModel>(this as AppModel);
  }

  Map<String, dynamic> toMap() {
    return AppModelMapper.ensureInitialized()
        .encodeMap<AppModel>(this as AppModel);
  }

  AppModelCopyWith<AppModel, AppModel, AppModel> get copyWith =>
      _AppModelCopyWithImpl(this as AppModel, $identity, $identity);
  @override
  String toString() {
    return AppModelMapper.ensureInitialized().stringifyValue(this as AppModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AppModelMapper.ensureInitialized()
                .isValueEqual(this as AppModel, other));
  }

  @override
  int get hashCode {
    return AppModelMapper.ensureInitialized().hashValue(this as AppModel);
  }
}

extension AppModelValueCopy<$R, $Out> on ObjectCopyWith<$R, AppModel, $Out> {
  AppModelCopyWith<$R, AppModel, $Out> get $asAppModel =>
      $base.as((v, t, t2) => _AppModelCopyWithImpl(v, t, t2));
}

abstract class AppModelCopyWith<$R, $In extends AppModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, BranchModel,
      BranchModelCopyWith<$R, BranchModel, BranchModel>> get branches;
  $R call(
      {String? currentBranchName,
      Map<String, BranchModel>? branches,
      String? clipboard});
  AppModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AppModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AppModel, $Out>
    implements AppModelCopyWith<$R, AppModel, $Out> {
  _AppModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AppModel> $mapper =
      AppModelMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, BranchModel,
          BranchModelCopyWith<$R, BranchModel, BranchModel>>
      get branches => MapCopyWith($value.branches,
          (v, t) => v.copyWith.$chain(t), (v) => call(branches: v));
  @override
  $R call(
          {String? currentBranchName,
          Map<String, BranchModel>? branches,
          Object? clipboard = $none}) =>
      $apply(FieldCopyWithData({
        if (currentBranchName != null) #currentBranchName: currentBranchName,
        if (branches != null) #branches: branches,
        if (clipboard != $none) #clipboard: clipboard
      }));
  @override
  AppModel $make(CopyWithData data) => AppModel(
      currentBranchName:
          data.get(#currentBranchName, or: $value.currentBranchName),
      branches: data.get(#branches, or: $value.branches),
      clipboard: data.get(#clipboard, or: $value.clipboard));

  @override
  AppModelCopyWith<$R2, AppModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AppModelCopyWithImpl($value, $cast, t);
}
