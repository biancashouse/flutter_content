// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
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

  static STreeNode? _$clipboard(AppInfoModel v) => v.clipboard;
  static const Field<AppInfoModel, STreeNode> _f$clipboard =
      Field('clipboard', _$clipboard, opt: true);
  static bool _$autoPublishDefault(AppInfoModel v) => v.autoPublishDefault;
  static const Field<AppInfoModel, bool> _f$autoPublishDefault =
      Field('autoPublishDefault', _$autoPublishDefault, opt: true, def: false);
  static List<String> _$snippetNames(AppInfoModel v) => v.snippetNames;
  static const Field<AppInfoModel, List<String>> _f$snippetNames =
      Field('snippetNames', _$snippetNames, opt: true, def: const []);

  @override
  final MappableFields<AppInfoModel> fields = const {
    #clipboard: _f$clipboard,
    #autoPublishDefault: _f$autoPublishDefault,
    #snippetNames: _f$snippetNames,
  };

  static AppInfoModel _instantiate(DecodingData data) {
    return AppInfoModel(
        clipboard: data.dec(_f$clipboard),
        autoPublishDefault: data.dec(_f$autoPublishDefault),
        snippetNames: data.dec(_f$snippetNames));
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
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get clipboard;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get snippetNames;
  $R call(
      {STreeNode? clipboard,
      bool? autoPublishDefault,
      List<String>? snippetNames});
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
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get clipboard =>
      $value.clipboard?.copyWith.$chain((v) => call(clipboard: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
      get snippetNames => ListCopyWith(
          $value.snippetNames,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(snippetNames: v));
  @override
  $R call(
          {Object? clipboard = $none,
          bool? autoPublishDefault,
          List<String>? snippetNames}) =>
      $apply(FieldCopyWithData({
        if (clipboard != $none) #clipboard: clipboard,
        if (autoPublishDefault != null) #autoPublishDefault: autoPublishDefault,
        if (snippetNames != null) #snippetNames: snippetNames
      }));
  @override
  AppInfoModel $make(CopyWithData data) => AppInfoModel(
      clipboard: data.get(#clipboard, or: $value.clipboard),
      autoPublishDefault:
          data.get(#autoPublishDefault, or: $value.autoPublishDefault),
      snippetNames: data.get(#snippetNames, or: $value.snippetNames));

  @override
  AppInfoModelCopyWith<$R2, AppInfoModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AppInfoModelCopyWithImpl($value, $cast, t);
}
