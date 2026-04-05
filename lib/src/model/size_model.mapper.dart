// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'size_model.dart';

class SizeModelMapper extends ClassMapperBase<SizeModel> {
  SizeModelMapper._();

  static SizeModelMapper? _instance;
  static SizeModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SizeModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SizeModel';

  static double _$width(SizeModel v) => v.width;
  static const Field<SizeModel, double> _f$width = Field('width', _$width);
  static double _$height(SizeModel v) => v.height;
  static const Field<SizeModel, double> _f$height = Field('height', _$height);

  @override
  final MappableFields<SizeModel> fields = const {
    #width: _f$width,
    #height: _f$height,
  };

  static SizeModel _instantiate(DecodingData data) {
    return SizeModel(data.dec(_f$width), data.dec(_f$height));
  }

  @override
  final Function instantiate = _instantiate;

  static SizeModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SizeModel>(map);
  }

  static SizeModel fromJson(String json) {
    return ensureInitialized().decodeJson<SizeModel>(json);
  }
}

mixin SizeModelMappable {
  String toJson() {
    return SizeModelMapper.ensureInitialized().encodeJson<SizeModel>(
      this as SizeModel,
    );
  }

  Map<String, dynamic> toMap() {
    return SizeModelMapper.ensureInitialized().encodeMap<SizeModel>(
      this as SizeModel,
    );
  }

  SizeModelCopyWith<SizeModel, SizeModel, SizeModel> get copyWith =>
      _SizeModelCopyWithImpl<SizeModel, SizeModel>(
        this as SizeModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return SizeModelMapper.ensureInitialized().stringifyValue(
      this as SizeModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return SizeModelMapper.ensureInitialized().equalsValue(
      this as SizeModel,
      other,
    );
  }

  @override
  int get hashCode {
    return SizeModelMapper.ensureInitialized().hashValue(this as SizeModel);
  }
}

extension SizeModelValueCopy<$R, $Out> on ObjectCopyWith<$R, SizeModel, $Out> {
  SizeModelCopyWith<$R, SizeModel, $Out> get $asSizeModel =>
      $base.as((v, t, t2) => _SizeModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SizeModelCopyWith<$R, $In extends SizeModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({double? width, double? height});
  SizeModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SizeModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SizeModel, $Out>
    implements SizeModelCopyWith<$R, SizeModel, $Out> {
  _SizeModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SizeModel> $mapper =
      SizeModelMapper.ensureInitialized();
  @override
  $R call({double? width, double? height}) => $apply(
    FieldCopyWithData({
      if (width != null) #width: width,
      if (height != null) #height: height,
    }),
  );
  @override
  SizeModel $make(CopyWithData data) => SizeModel(
    data.get(#width, or: $value.width),
    data.get(#height, or: $value.height),
  );

  @override
  SizeModelCopyWith<$R2, SizeModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _SizeModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

