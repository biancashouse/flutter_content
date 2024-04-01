// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'branch_model.dart';

class BranchModelMapper extends ClassMapperBase<BranchModel> {
  BranchModelMapper._();

  static BranchModelMapper? _instance;
  static BranchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BranchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'BranchModel';

  static String _$name(BranchModel v) => v.name;
  static const Field<BranchModel, String> _f$name = Field('name', _$name);
  static int? _$latestVersionId(BranchModel v) => v.latestVersionId;
  static const Field<BranchModel, int> _f$latestVersionId =
      Field('latestVersionId', _$latestVersionId, opt: true);
  static List<int> _$undos(BranchModel v) => v.undos;
  static const Field<BranchModel, List<int>> _f$undos =
      Field('undos', _$undos, opt: true, def: const []);
  static List<int> _$redos(BranchModel v) => v.redos;
  static const Field<BranchModel, List<int>> _f$redos =
      Field('redos', _$redos, opt: true, def: const []);
  static List<int> _$discardeds(BranchModel v) => v.discardeds;
  static const Field<BranchModel, List<int>> _f$discardeds =
      Field('discardeds', _$discardeds, opt: true, def: const []);

  @override
  final MappableFields<BranchModel> fields = const {
    #name: _f$name,
    #latestVersionId: _f$latestVersionId,
    #undos: _f$undos,
    #redos: _f$redos,
    #discardeds: _f$discardeds,
  };

  static BranchModel _instantiate(DecodingData data) {
    return BranchModel(
        name: data.dec(_f$name),
        latestVersionId: data.dec(_f$latestVersionId),
        undos: data.dec(_f$undos),
        redos: data.dec(_f$redos),
        discardeds: data.dec(_f$discardeds));
  }

  @override
  final Function instantiate = _instantiate;

  static BranchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BranchModel>(map);
  }

  static BranchModel fromJson(String json) {
    return ensureInitialized().decodeJson<BranchModel>(json);
  }
}

mixin BranchModelMappable {
  String toJson() {
    return BranchModelMapper.ensureInitialized()
        .encodeJson<BranchModel>(this as BranchModel);
  }

  Map<String, dynamic> toMap() {
    return BranchModelMapper.ensureInitialized()
        .encodeMap<BranchModel>(this as BranchModel);
  }

  BranchModelCopyWith<BranchModel, BranchModel, BranchModel> get copyWith =>
      _BranchModelCopyWithImpl(this as BranchModel, $identity, $identity);
  @override
  String toString() {
    return BranchModelMapper.ensureInitialized()
        .stringifyValue(this as BranchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            BranchModelMapper.ensureInitialized()
                .isValueEqual(this as BranchModel, other));
  }

  @override
  int get hashCode {
    return BranchModelMapper.ensureInitialized().hashValue(this as BranchModel);
  }
}

extension BranchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, BranchModel, $Out> {
  BranchModelCopyWith<$R, BranchModel, $Out> get $asBranchModel =>
      $base.as((v, t, t2) => _BranchModelCopyWithImpl(v, t, t2));
}

abstract class BranchModelCopyWith<$R, $In extends BranchModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get undos;
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get redos;
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get discardeds;
  $R call(
      {String? name,
      int? latestVersionId,
      List<int>? undos,
      List<int>? redos,
      List<int>? discardeds});
  BranchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BranchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BranchModel, $Out>
    implements BranchModelCopyWith<$R, BranchModel, $Out> {
  _BranchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BranchModel> $mapper =
      BranchModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get undos => ListCopyWith(
      $value.undos,
      (v, t) => ObjectCopyWith(v, $identity, t),
      (v) => call(undos: v));
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get redos => ListCopyWith(
      $value.redos,
      (v, t) => ObjectCopyWith(v, $identity, t),
      (v) => call(redos: v));
  @override
  ListCopyWith<$R, int, ObjectCopyWith<$R, int, int>> get discardeds =>
      ListCopyWith($value.discardeds, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(discardeds: v));
  @override
  $R call(
          {String? name,
          Object? latestVersionId = $none,
          List<int>? undos,
          List<int>? redos,
          List<int>? discardeds}) =>
      $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (latestVersionId != $none) #latestVersionId: latestVersionId,
        if (undos != null) #undos: undos,
        if (redos != null) #redos: redos,
        if (discardeds != null) #discardeds: discardeds
      }));
  @override
  BranchModel $make(CopyWithData data) => BranchModel(
      name: data.get(#name, or: $value.name),
      latestVersionId: data.get(#latestVersionId, or: $value.latestVersionId),
      undos: data.get(#undos, or: $value.undos),
      redos: data.get(#redos, or: $value.redos),
      discardeds: data.get(#discardeds, or: $value.discardeds));

  @override
  BranchModelCopyWith<$R2, BranchModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _BranchModelCopyWithImpl($value, $cast, t);
}
