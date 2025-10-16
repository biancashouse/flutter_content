// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'snippet_info_model.dart';

class SnippetInfoModelMapper extends ClassMapperBase<SnippetInfoModel> {
  SnippetInfoModelMapper._();

  static SnippetInfoModelMapper? _instance;
  static SnippetInfoModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SnippetInfoModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SnippetInfoModel';

  static String _$name(SnippetInfoModel v) => v.name;
  static const Field<SnippetInfoModel, String> _f$name = Field('name', _$name);
  static String _$editingVersionId(SnippetInfoModel v) => v.editingVersionId;
  static const Field<SnippetInfoModel, String> _f$editingVersionId = Field(
    'editingVersionId',
    _$editingVersionId,
  );
  static String _$publishedVersionId(SnippetInfoModel v) =>
      v.publishedVersionId;
  static const Field<SnippetInfoModel, String> _f$publishedVersionId = Field(
    'publishedVersionId',
    _$publishedVersionId,
  );
  static bool? _$autoPublish(SnippetInfoModel v) => v.autoPublish;
  static const Field<SnippetInfoModel, bool> _f$autoPublish = Field(
    'autoPublish',
    _$autoPublish,
    opt: true,
  );
  static bool? _$hide(SnippetInfoModel v) => v.hide;
  static const Field<SnippetInfoModel, bool> _f$hide = Field(
    'hide',
    _$hide,
    opt: true,
    def: false,
  );
  static List<String>? _$versionIds(SnippetInfoModel v) => v.versionIds;
  static const Field<SnippetInfoModel, List<String>> _f$versionIds = Field(
    'versionIds',
    _$versionIds,
    opt: true,
    def: const [],
  );
  static Map<String, SnippetRootNode?> _$cachedVersions(SnippetInfoModel v) =>
      v.cachedVersions;
  static const Field<SnippetInfoModel, Map<String, SnippetRootNode?>>
  _f$cachedVersions = Field(
    'cachedVersions',
    _$cachedVersions,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<SnippetInfoModel> fields = const {
    #name: _f$name,
    #editingVersionId: _f$editingVersionId,
    #publishedVersionId: _f$publishedVersionId,
    #autoPublish: _f$autoPublish,
    #hide: _f$hide,
    #versionIds: _f$versionIds,
    #cachedVersions: _f$cachedVersions,
  };

  static SnippetInfoModel _instantiate(DecodingData data) {
    return SnippetInfoModel(
      data.dec(_f$name),
      editingVersionId: data.dec(_f$editingVersionId),
      publishedVersionId: data.dec(_f$publishedVersionId),
      autoPublish: data.dec(_f$autoPublish),
      hide: data.dec(_f$hide),
      versionIds: data.dec(_f$versionIds),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static SnippetInfoModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SnippetInfoModel>(map);
  }

  static SnippetInfoModel fromJson(String json) {
    return ensureInitialized().decodeJson<SnippetInfoModel>(json);
  }
}

mixin SnippetInfoModelMappable {
  String toJson() {
    return SnippetInfoModelMapper.ensureInitialized()
        .encodeJson<SnippetInfoModel>(this as SnippetInfoModel);
  }

  Map<String, dynamic> toMap() {
    return SnippetInfoModelMapper.ensureInitialized()
        .encodeMap<SnippetInfoModel>(this as SnippetInfoModel);
  }

  SnippetInfoModelCopyWith<SnippetInfoModel, SnippetInfoModel, SnippetInfoModel>
  get copyWith =>
      _SnippetInfoModelCopyWithImpl<SnippetInfoModel, SnippetInfoModel>(
        this as SnippetInfoModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return SnippetInfoModelMapper.ensureInitialized().stringifyValue(
      this as SnippetInfoModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return SnippetInfoModelMapper.ensureInitialized().equalsValue(
      this as SnippetInfoModel,
      other,
    );
  }

  @override
  int get hashCode {
    return SnippetInfoModelMapper.ensureInitialized().hashValue(
      this as SnippetInfoModel,
    );
  }
}

extension SnippetInfoModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SnippetInfoModel, $Out> {
  SnippetInfoModelCopyWith<$R, SnippetInfoModel, $Out>
  get $asSnippetInfoModel =>
      $base.as((v, t, t2) => _SnippetInfoModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SnippetInfoModelCopyWith<$R, $In extends SnippetInfoModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get versionIds;
  $R call({
    String? name,
    String? editingVersionId,
    String? publishedVersionId,
    bool? autoPublish,
    bool? hide,
    List<String>? versionIds,
  });
  SnippetInfoModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SnippetInfoModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SnippetInfoModel, $Out>
    implements SnippetInfoModelCopyWith<$R, SnippetInfoModel, $Out> {
  _SnippetInfoModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SnippetInfoModel> $mapper =
      SnippetInfoModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
  get versionIds => $value.versionIds != null
      ? ListCopyWith(
          $value.versionIds!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(versionIds: v),
        )
      : null;
  @override
  $R call({
    String? name,
    String? editingVersionId,
    String? publishedVersionId,
    Object? autoPublish = $none,
    Object? hide = $none,
    Object? versionIds = $none,
  }) => $apply(
    FieldCopyWithData({
      if (name != null) #name: name,
      if (editingVersionId != null) #editingVersionId: editingVersionId,
      if (publishedVersionId != null) #publishedVersionId: publishedVersionId,
      if (autoPublish != $none) #autoPublish: autoPublish,
      if (hide != $none) #hide: hide,
      if (versionIds != $none) #versionIds: versionIds,
    }),
  );
  @override
  SnippetInfoModel $make(CopyWithData data) => SnippetInfoModel(
    data.get(#name, or: $value.name),
    editingVersionId: data.get(#editingVersionId, or: $value.editingVersionId),
    publishedVersionId: data.get(
      #publishedVersionId,
      or: $value.publishedVersionId,
    ),
    autoPublish: data.get(#autoPublish, or: $value.autoPublish),
    hide: data.get(#hide, or: $value.hide),
    versionIds: data.get(#versionIds, or: $value.versionIds),
  );

  @override
  SnippetInfoModelCopyWith<$R2, SnippetInfoModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _SnippetInfoModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

