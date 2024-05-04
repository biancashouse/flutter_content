// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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

  static String? _$editingVersionId(SnippetInfoModel v) => v.editingVersionId;
  static const Field<SnippetInfoModel, String> _f$editingVersionId =
      Field('editingVersionId', _$editingVersionId, opt: true);
  static String? _$publishedVersionId(SnippetInfoModel v) =>
      v.publishedVersionId;
  static const Field<SnippetInfoModel, String> _f$publishedVersionId =
      Field('publishedVersionId', _$publishedVersionId, opt: true);
  static bool? _$autoPublish(SnippetInfoModel v) => v.autoPublish;
  static const Field<SnippetInfoModel, bool> _f$autoPublish =
      Field('autoPublish', _$autoPublish, opt: true);

  @override
  final MappableFields<SnippetInfoModel> fields = const {
    #editingVersionId: _f$editingVersionId,
    #publishedVersionId: _f$publishedVersionId,
    #autoPublish: _f$autoPublish,
  };

  static SnippetInfoModel _instantiate(DecodingData data) {
    return SnippetInfoModel(
        editingVersionId: data.dec(_f$editingVersionId),
        publishedVersionId: data.dec(_f$publishedVersionId),
        autoPublish: data.dec(_f$autoPublish));
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
      get copyWith => _SnippetInfoModelCopyWithImpl(
          this as SnippetInfoModel, $identity, $identity);
  @override
  String toString() {
    return SnippetInfoModelMapper.ensureInitialized()
        .stringifyValue(this as SnippetInfoModel);
  }

  @override
  bool operator ==(Object other) {
    return SnippetInfoModelMapper.ensureInitialized()
        .equalsValue(this as SnippetInfoModel, other);
  }

  @override
  int get hashCode {
    return SnippetInfoModelMapper.ensureInitialized()
        .hashValue(this as SnippetInfoModel);
  }
}

extension SnippetInfoModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SnippetInfoModel, $Out> {
  SnippetInfoModelCopyWith<$R, SnippetInfoModel, $Out>
      get $asSnippetInfoModel =>
          $base.as((v, t, t2) => _SnippetInfoModelCopyWithImpl(v, t, t2));
}

abstract class SnippetInfoModelCopyWith<$R, $In extends SnippetInfoModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? editingVersionId,
      String? publishedVersionId,
      bool? autoPublish});
  SnippetInfoModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SnippetInfoModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SnippetInfoModel, $Out>
    implements SnippetInfoModelCopyWith<$R, SnippetInfoModel, $Out> {
  _SnippetInfoModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SnippetInfoModel> $mapper =
      SnippetInfoModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? editingVersionId = $none,
          Object? publishedVersionId = $none,
          Object? autoPublish = $none}) =>
      $apply(FieldCopyWithData({
        if (editingVersionId != $none) #editingVersionId: editingVersionId,
        if (publishedVersionId != $none)
          #publishedVersionId: publishedVersionId,
        if (autoPublish != $none) #autoPublish: autoPublish
      }));
  @override
  SnippetInfoModel $make(CopyWithData data) => SnippetInfoModel(
      editingVersionId:
          data.get(#editingVersionId, or: $value.editingVersionId),
      publishedVersionId:
          data.get(#publishedVersionId, or: $value.publishedVersionId),
      autoPublish: data.get(#autoPublish, or: $value.autoPublish));

  @override
  SnippetInfoModelCopyWith<$R2, SnippetInfoModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SnippetInfoModelCopyWithImpl($value, $cast, t);
}
