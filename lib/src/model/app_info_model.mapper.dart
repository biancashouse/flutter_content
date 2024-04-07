// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'app_info_model.dart';

class AppInfoModelMapper extends ClassMapperBase<AppInfoModel> {
  AppInfoModelMapper._();

  static AppInfoModelMapper? _instance;
  static AppInfoModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AppInfoModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AppInfoModel';

  static String? _$publishedVersionId(AppInfoModel v) => v.publishedVersionId;
  static const Field<AppInfoModel, String> _f$publishedVersionId =
      Field('publishedVersionId', _$publishedVersionId, opt: true);
  static String? _$editingVersionId(AppInfoModel v) => v.editingVersionId;
  static const Field<AppInfoModel, String> _f$editingVersionId =
      Field('editingVersionId', _$editingVersionId, opt: true);
  static List<String> _$versionIds(AppInfoModel v) => v.versionIds;
  static const Field<AppInfoModel, List<String>> _f$versionIds =
      Field('versionIds', _$versionIds, opt: true, def: const []);
  static String? _$clipboard(AppInfoModel v) => v.clipboard;
  static const Field<AppInfoModel, String> _f$clipboard =
      Field('clipboard', _$clipboard, opt: true);

  @override
  final MappableFields<AppInfoModel> fields = const {
    #publishedVersionId: _f$publishedVersionId,
    #editingVersionId: _f$editingVersionId,
    #versionIds: _f$versionIds,
    #clipboard: _f$clipboard,
  };

  static AppInfoModel _instantiate(DecodingData data) {
    return AppInfoModel(
        publishedVersionId: data.dec(_f$publishedVersionId),
        editingVersionId: data.dec(_f$editingVersionId),
        versionIds: data.dec(_f$versionIds),
        clipboard: data.dec(_f$clipboard));
  }

  @override
  final Function instantiate = _instantiate;

  static AppInfoModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AppInfoModel>(map);
  }

  static AppInfoModel fromJson(String json) {
    return ensureInitialized().decodeJson<AppInfoModel>(json);
  }
}

mixin AppInfoModelMappable {
  String toJson() {
    return AppInfoModelMapper.ensureInitialized()
        .encodeJson<AppInfoModel>(this as AppInfoModel);
  }

  Map<String, dynamic> toMap() {
    return AppInfoModelMapper.ensureInitialized()
        .encodeMap<AppInfoModel>(this as AppInfoModel);
  }

  AppInfoModelCopyWith<AppInfoModel, AppInfoModel, AppInfoModel> get copyWith =>
      _AppInfoModelCopyWithImpl(this as AppInfoModel, $identity, $identity);
  @override
  String toString() {
    return AppInfoModelMapper.ensureInitialized()
        .stringifyValue(this as AppInfoModel);
  }

  @override
  bool operator ==(Object other) {
    return AppInfoModelMapper.ensureInitialized()
        .equalsValue(this as AppInfoModel, other);
  }

  @override
  int get hashCode {
    return AppInfoModelMapper.ensureInitialized()
        .hashValue(this as AppInfoModel);
  }
}

extension AppInfoModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AppInfoModel, $Out> {
  AppInfoModelCopyWith<$R, AppInfoModel, $Out> get $asAppInfoModel =>
      $base.as((v, t, t2) => _AppInfoModelCopyWithImpl(v, t, t2));
}

abstract class AppInfoModelCopyWith<$R, $In extends AppInfoModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get versionIds;
  $R call(
      {String? publishedVersionId,
      String? editingVersionId,
      List<String>? versionIds,
      String? clipboard});
  AppInfoModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AppInfoModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AppInfoModel, $Out>
    implements AppInfoModelCopyWith<$R, AppInfoModel, $Out> {
  _AppInfoModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AppInfoModel> $mapper =
      AppInfoModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get versionIds =>
      ListCopyWith($value.versionIds, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(versionIds: v));
  @override
  $R call(
          {Object? publishedVersionId = $none,
          Object? editingVersionId = $none,
          List<String>? versionIds,
          Object? clipboard = $none}) =>
      $apply(FieldCopyWithData({
        if (publishedVersionId != $none)
          #publishedVersionId: publishedVersionId,
        if (editingVersionId != $none) #editingVersionId: editingVersionId,
        if (versionIds != null) #versionIds: versionIds,
        if (clipboard != $none) #clipboard: clipboard
      }));
  @override
  AppInfoModel $make(CopyWithData data) => AppInfoModel(
      publishedVersionId:
          data.get(#publishedVersionId, or: $value.publishedVersionId),
      editingVersionId:
          data.get(#editingVersionId, or: $value.editingVersionId),
      versionIds: data.get(#versionIds, or: $value.versionIds),
      clipboard: data.get(#clipboard, or: $value.clipboard));

  @override
  AppInfoModelCopyWith<$R2, AppInfoModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AppInfoModelCopyWithImpl($value, $cast, t);
}
