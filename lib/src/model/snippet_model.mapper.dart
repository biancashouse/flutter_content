// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'snippet_model.dart';

class SnippetModelMapper extends ClassMapperBase<SnippetModel> {
  SnippetModelMapper._();

  static SnippetModelMapper? _instance;
  static SnippetModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SnippetModelMapper._());
      SnippetRootNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SnippetModel';

  static Map<String, SnippetRootNode> _$versionMap(SnippetModel v) =>
      v.versionMap;
  static const Field<SnippetModel, Map<String, SnippetRootNode>> _f$versionMap =
      Field('versionMap', _$versionMap);

  @override
  final MappableFields<SnippetModel> fields = const {
    #versionMap: _f$versionMap,
  };

  static SnippetModel _instantiate(DecodingData data) {
    return SnippetModel(data.dec(_f$versionMap));
  }

  @override
  final Function instantiate = _instantiate;

  static SnippetModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SnippetModel>(map);
  }

  static SnippetModel fromJson(String json) {
    return ensureInitialized().decodeJson<SnippetModel>(json);
  }
}

mixin SnippetModelMappable {
  String toJson() {
    return SnippetModelMapper.ensureInitialized()
        .encodeJson<SnippetModel>(this as SnippetModel);
  }

  Map<String, dynamic> toMap() {
    return SnippetModelMapper.ensureInitialized()
        .encodeMap<SnippetModel>(this as SnippetModel);
  }

  SnippetModelCopyWith<SnippetModel, SnippetModel, SnippetModel> get copyWith =>
      _SnippetModelCopyWithImpl(this as SnippetModel, $identity, $identity);
  @override
  String toString() {
    return SnippetModelMapper.ensureInitialized()
        .stringifyValue(this as SnippetModel);
  }

  @override
  bool operator ==(Object other) {
    return SnippetModelMapper.ensureInitialized()
        .equalsValue(this as SnippetModel, other);
  }

  @override
  int get hashCode {
    return SnippetModelMapper.ensureInitialized()
        .hashValue(this as SnippetModel);
  }
}

extension SnippetModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SnippetModel, $Out> {
  SnippetModelCopyWith<$R, SnippetModel, $Out> get $asSnippetModel =>
      $base.as((v, t, t2) => _SnippetModelCopyWithImpl(v, t, t2));
}

abstract class SnippetModelCopyWith<$R, $In extends SnippetModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, SnippetRootNode,
          SnippetRootNodeCopyWith<$R, SnippetRootNode, SnippetRootNode>>
      get versionMap;
  $R call({Map<String, SnippetRootNode>? versionMap});
  SnippetModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SnippetModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SnippetModel, $Out>
    implements SnippetModelCopyWith<$R, SnippetModel, $Out> {
  _SnippetModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SnippetModel> $mapper =
      SnippetModelMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, SnippetRootNode,
          SnippetRootNodeCopyWith<$R, SnippetRootNode, SnippetRootNode>>
      get versionMap => MapCopyWith($value.versionMap,
          (v, t) => v.copyWith.$chain(t), (v) => call(versionMap: v));
  @override
  $R call({Map<String, SnippetRootNode>? versionMap}) => $apply(
      FieldCopyWithData({if (versionMap != null) #versionMap: versionMap}));
  @override
  SnippetModel $make(CopyWithData data) =>
      SnippetModel(data.get(#versionMap, or: $value.versionMap));

  @override
  SnippetModelCopyWith<$R2, SnippetModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SnippetModelCopyWithImpl($value, $cast, t);
}
