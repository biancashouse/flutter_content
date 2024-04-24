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
      STreeNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AppInfoModel';

  static Map<String, String> _$publishedVersionIds(AppInfoModel v) =>
      v.publishedVersionIds;
  static const Field<AppInfoModel, Map<String, String>> _f$publishedVersionIds =
      Field('publishedVersionIds', _$publishedVersionIds,
          opt: true, def: const {});
  static Map<String, String> _$editingVersionIds(AppInfoModel v) =>
      v.editingVersionIds;
  static const Field<AppInfoModel, Map<String, String>> _f$editingVersionIds =
      Field('editingVersionIds', _$editingVersionIds, opt: true, def: const {});
  static Map<String, List<String>> _$versionIds(AppInfoModel v) => v.versionIds;
  static const Field<AppInfoModel, Map<String, List<String>>> _f$versionIds =
      Field('versionIds', _$versionIds, opt: true, def: const {});
  static STreeNode? _$clipboard(AppInfoModel v) => v.clipboard;
  static const Field<AppInfoModel, STreeNode> _f$clipboard =
      Field('clipboard', _$clipboard, opt: true);
  static bool _$autoPublish(AppInfoModel v) => v.autoPublish;
  static const Field<AppInfoModel, bool> _f$autoPublish =
      Field('autoPublish', _$autoPublish, opt: true, def: true);

  @override
  final MappableFields<AppInfoModel> fields = const {
    #publishedVersionIds: _f$publishedVersionIds,
    #editingVersionIds: _f$editingVersionIds,
    #versionIds: _f$versionIds,
    #clipboard: _f$clipboard,
    #autoPublish: _f$autoPublish,
  };

  static AppInfoModel _instantiate(DecodingData data) {
    return AppInfoModel(
        publishedVersionIds: data.dec(_f$publishedVersionIds),
        editingVersionIds: data.dec(_f$editingVersionIds),
        versionIds: data.dec(_f$versionIds),
        clipboard: data.dec(_f$clipboard),
        autoPublish: data.dec(_f$autoPublish));
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
  MapCopyWith<$R, String, String, ObjectCopyWith<$R, String, String>>
      get publishedVersionIds;
  MapCopyWith<$R, String, String, ObjectCopyWith<$R, String, String>>
      get editingVersionIds;
  MapCopyWith<$R, String, List<String>,
      ObjectCopyWith<$R, List<String>, List<String>>> get versionIds;
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get clipboard;
  $R call(
      {Map<String, String>? publishedVersionIds,
      Map<String, String>? editingVersionIds,
      Map<String, List<String>>? versionIds,
      STreeNode? clipboard,
      bool? autoPublish});
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
  MapCopyWith<$R, String, String, ObjectCopyWith<$R, String, String>>
      get publishedVersionIds => MapCopyWith(
          $value.publishedVersionIds,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(publishedVersionIds: v));
  @override
  MapCopyWith<$R, String, String, ObjectCopyWith<$R, String, String>>
      get editingVersionIds => MapCopyWith(
          $value.editingVersionIds,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(editingVersionIds: v));
  @override
  MapCopyWith<$R, String, List<String>,
          ObjectCopyWith<$R, List<String>, List<String>>>
      get versionIds => MapCopyWith(
          $value.versionIds,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(versionIds: v));
  @override
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get clipboard =>
      $value.clipboard?.copyWith.$chain((v) => call(clipboard: v));
  @override
  $R call(
          {Map<String, String>? publishedVersionIds,
          Map<String, String>? editingVersionIds,
          Map<String, List<String>>? versionIds,
          Object? clipboard = $none,
          bool? autoPublish}) =>
      $apply(FieldCopyWithData({
        if (publishedVersionIds != null)
          #publishedVersionIds: publishedVersionIds,
        if (editingVersionIds != null) #editingVersionIds: editingVersionIds,
        if (versionIds != null) #versionIds: versionIds,
        if (clipboard != $none) #clipboard: clipboard,
        if (autoPublish != null) #autoPublish: autoPublish
      }));
  @override
  AppInfoModel $make(CopyWithData data) => AppInfoModel(
      publishedVersionIds:
          data.get(#publishedVersionIds, or: $value.publishedVersionIds),
      editingVersionIds:
          data.get(#editingVersionIds, or: $value.editingVersionIds),
      versionIds: data.get(#versionIds, or: $value.versionIds),
      clipboard: data.get(#clipboard, or: $value.clipboard),
      autoPublish: data.get(#autoPublish, or: $value.autoPublish));

  @override
  AppInfoModelCopyWith<$R2, AppInfoModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AppInfoModelCopyWithImpl($value, $cast, t);
}
