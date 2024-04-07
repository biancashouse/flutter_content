// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'snippet_map_model.dart';

class SnippetMapModelMapper extends ClassMapperBase<SnippetMapModel> {
  SnippetMapModelMapper._();

  static SnippetMapModelMapper? _instance;
  static SnippetMapModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SnippetMapModelMapper._());
      SnippetRootNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SnippetMapModel';

  static Map<String, SnippetRootNode> _$snippets(SnippetMapModel v) =>
      v.snippets;
  static const Field<SnippetMapModel, Map<String, SnippetRootNode>>
      _f$snippets = Field('snippets', _$snippets);

  @override
  final MappableFields<SnippetMapModel> fields = const {
    #snippets: _f$snippets,
  };

  static SnippetMapModel _instantiate(DecodingData data) {
    return SnippetMapModel(data.dec(_f$snippets));
  }

  @override
  final Function instantiate = _instantiate;

  static SnippetMapModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SnippetMapModel>(map);
  }

  static SnippetMapModel fromJson(String json) {
    return ensureInitialized().decodeJson<SnippetMapModel>(json);
  }
}

mixin SnippetMapModelMappable {
  String toJson() {
    return SnippetMapModelMapper.ensureInitialized()
        .encodeJson<SnippetMapModel>(this as SnippetMapModel);
  }

  Map<String, dynamic> toMap() {
    return SnippetMapModelMapper.ensureInitialized()
        .encodeMap<SnippetMapModel>(this as SnippetMapModel);
  }

  SnippetMapModelCopyWith<SnippetMapModel, SnippetMapModel, SnippetMapModel>
      get copyWith => _SnippetMapModelCopyWithImpl(
          this as SnippetMapModel, $identity, $identity);
  @override
  String toString() {
    return SnippetMapModelMapper.ensureInitialized()
        .stringifyValue(this as SnippetMapModel);
  }

  @override
  bool operator ==(Object other) {
    return SnippetMapModelMapper.ensureInitialized()
        .equalsValue(this as SnippetMapModel, other);
  }

  @override
  int get hashCode {
    return SnippetMapModelMapper.ensureInitialized()
        .hashValue(this as SnippetMapModel);
  }
}

extension SnippetMapModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SnippetMapModel, $Out> {
  SnippetMapModelCopyWith<$R, SnippetMapModel, $Out> get $asSnippetMapModel =>
      $base.as((v, t, t2) => _SnippetMapModelCopyWithImpl(v, t, t2));
}

abstract class SnippetMapModelCopyWith<$R, $In extends SnippetMapModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, SnippetRootNode,
          SnippetRootNodeCopyWith<$R, SnippetRootNode, SnippetRootNode>>
      get snippets;
  $R call({Map<String, SnippetRootNode>? snippets});
  SnippetMapModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SnippetMapModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SnippetMapModel, $Out>
    implements SnippetMapModelCopyWith<$R, SnippetMapModel, $Out> {
  _SnippetMapModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SnippetMapModel> $mapper =
      SnippetMapModelMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, SnippetRootNode,
          SnippetRootNodeCopyWith<$R, SnippetRootNode, SnippetRootNode>>
      get snippets => MapCopyWith($value.snippets,
          (v, t) => v.copyWith.$chain(t), (v) => call(snippets: v));
  @override
  $R call({Map<String, SnippetRootNode>? snippets}) =>
      $apply(FieldCopyWithData({if (snippets != null) #snippets: snippets}));
  @override
  SnippetMapModel $make(CopyWithData data) =>
      SnippetMapModel(data.get(#snippets, or: $value.snippets));

  @override
  SnippetMapModelCopyWith<$R2, SnippetMapModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SnippetMapModelCopyWithImpl($value, $cast, t);
}
