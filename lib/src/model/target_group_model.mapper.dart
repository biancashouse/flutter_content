// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'target_group_model.dart';

class TargetGroupModelMapper extends ClassMapperBase<TargetGroupModel> {
  TargetGroupModelMapper._();

  static TargetGroupModelMapper? _instance;
  static TargetGroupModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TargetGroupModelMapper._());
      TargetModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TargetGroupModel';

  static List<TargetModel> _$targets(TargetGroupModel v) => v.targets;
  static const Field<TargetGroupModel, List<TargetModel>> _f$targets =
      Field('targets', _$targets);

  @override
  final MappableFields<TargetGroupModel> fields = const {
    #targets: _f$targets,
  };

  static TargetGroupModel _instantiate(DecodingData data) {
    return TargetGroupModel(data.dec(_f$targets));
  }

  @override
  final Function instantiate = _instantiate;

  static TargetGroupModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TargetGroupModel>(map);
  }

  static TargetGroupModel fromJson(String json) {
    return ensureInitialized().decodeJson<TargetGroupModel>(json);
  }
}

mixin TargetGroupModelMappable {
  String toJson() {
    return TargetGroupModelMapper.ensureInitialized()
        .encodeJson<TargetGroupModel>(this as TargetGroupModel);
  }

  Map<String, dynamic> toMap() {
    return TargetGroupModelMapper.ensureInitialized()
        .encodeMap<TargetGroupModel>(this as TargetGroupModel);
  }

  TargetGroupModelCopyWith<TargetGroupModel, TargetGroupModel, TargetGroupModel>
      get copyWith => _TargetGroupModelCopyWithImpl(
          this as TargetGroupModel, $identity, $identity);
  @override
  String toString() {
    return TargetGroupModelMapper.ensureInitialized()
        .stringifyValue(this as TargetGroupModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            TargetGroupModelMapper.ensureInitialized()
                .isValueEqual(this as TargetGroupModel, other));
  }

  @override
  int get hashCode {
    return TargetGroupModelMapper.ensureInitialized()
        .hashValue(this as TargetGroupModel);
  }
}

extension TargetGroupModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TargetGroupModel, $Out> {
  TargetGroupModelCopyWith<$R, TargetGroupModel, $Out>
      get $asTargetGroupModel =>
          $base.as((v, t, t2) => _TargetGroupModelCopyWithImpl(v, t, t2));
}

abstract class TargetGroupModelCopyWith<$R, $In extends TargetGroupModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, TargetModel,
      TargetModelCopyWith<$R, TargetModel, TargetModel>> get targets;
  $R call({List<TargetModel>? targets});
  TargetGroupModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TargetGroupModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TargetGroupModel, $Out>
    implements TargetGroupModelCopyWith<$R, TargetGroupModel, $Out> {
  _TargetGroupModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TargetGroupModel> $mapper =
      TargetGroupModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, TargetModel,
          TargetModelCopyWith<$R, TargetModel, TargetModel>>
      get targets => ListCopyWith($value.targets,
          (v, t) => v.copyWith.$chain(t), (v) => call(targets: v));
  @override
  $R call({List<TargetModel>? targets}) =>
      $apply(FieldCopyWithData({if (targets != null) #targets: targets}));
  @override
  TargetGroupModel $make(CopyWithData data) =>
      TargetGroupModel(data.get(#targets, or: $value.targets));

  @override
  TargetGroupModelCopyWith<$R2, TargetGroupModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TargetGroupModelCopyWithImpl($value, $cast, t);
}
