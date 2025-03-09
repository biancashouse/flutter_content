// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'fs_image_node.dart';

class FSImageNodeMapper extends SubClassMapperBase<FSImageNode> {
  FSImageNodeMapper._();

  static FSImageNodeMapper? _instance;
  static FSImageNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FSImageNodeMapper._());
      CLMapper.ensureInitialized().addSubMapper(_instance!);
      BoxFitEnumMapper.ensureInitialized();
      AlignmentEnumMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'FSImageNode';

  static String? _$fsFullPath(FSImageNode v) => v.fsFullPath;
  static const Field<FSImageNode, String> _f$fsFullPath =
      Field('fsFullPath', _$fsFullPath, opt: true);
  static BoxFitEnum? _$fit(FSImageNode v) => v.fit;
  static const Field<FSImageNode, BoxFitEnum> _f$fit =
      Field('fit', _$fit, opt: true);
  static AlignmentEnum? _$alignment(FSImageNode v) => v.alignment;
  static const Field<FSImageNode, AlignmentEnum> _f$alignment =
      Field('alignment', _$alignment, opt: true);
  static double? _$width(FSImageNode v) => v.width;
  static const Field<FSImageNode, double> _f$width =
      Field('width', _$width, opt: true);
  static double? _$height(FSImageNode v) => v.height;
  static const Field<FSImageNode, double> _f$height =
      Field('height', _$height, opt: true);
  static double? _$scale(FSImageNode v) => v.scale;
  static const Field<FSImageNode, double> _f$scale =
      Field('scale', _$scale, opt: true);
  static String _$uid(FSImageNode v) => v.uid;
  static const Field<FSImageNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static bool _$isExpanded(FSImageNode v) => v.isExpanded;
  static const Field<FSImageNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(FSImageNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<FSImageNode, bool> _f$hidePropertiesWhileDragging = Field(
      'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
      mode: FieldMode.member);

  @override
  final MappableFields<FSImageNode> fields = const {
    #fsFullPath: _f$fsFullPath,
    #fit: _f$fit,
    #alignment: _f$alignment,
    #width: _f$width,
    #height: _f$height,
    #scale: _f$scale,
    #uid: _f$uid,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
  };

  @override
  final String discriminatorKey = 'cl';
  @override
  final dynamic discriminatorValue = 'FSImageNode';
  @override
  late final ClassMapperBase superMapper = CLMapper.ensureInitialized();

  static FSImageNode _instantiate(DecodingData data) {
    return FSImageNode(
        fsFullPath: data.dec(_f$fsFullPath),
        fit: data.dec(_f$fit),
        alignment: data.dec(_f$alignment),
        width: data.dec(_f$width),
        height: data.dec(_f$height),
        scale: data.dec(_f$scale));
  }

  @override
  final Function instantiate = _instantiate;

  static FSImageNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FSImageNode>(map);
  }

  static FSImageNode fromJson(String json) {
    return ensureInitialized().decodeJson<FSImageNode>(json);
  }
}

mixin FSImageNodeMappable {
  String toJson() {
    return FSImageNodeMapper.ensureInitialized()
        .encodeJson<FSImageNode>(this as FSImageNode);
  }

  Map<String, dynamic> toMap() {
    return FSImageNodeMapper.ensureInitialized()
        .encodeMap<FSImageNode>(this as FSImageNode);
  }

  FSImageNodeCopyWith<FSImageNode, FSImageNode, FSImageNode> get copyWith =>
      _FSImageNodeCopyWithImpl(this as FSImageNode, $identity, $identity);
  @override
  String toString() {
    return FSImageNodeMapper.ensureInitialized()
        .stringifyValue(this as FSImageNode);
  }

  @override
  bool operator ==(Object other) {
    return FSImageNodeMapper.ensureInitialized()
        .equalsValue(this as FSImageNode, other);
  }

  @override
  int get hashCode {
    return FSImageNodeMapper.ensureInitialized().hashValue(this as FSImageNode);
  }
}

extension FSImageNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FSImageNode, $Out> {
  FSImageNodeCopyWith<$R, FSImageNode, $Out> get $asFSImageNode =>
      $base.as((v, t, t2) => _FSImageNodeCopyWithImpl(v, t, t2));
}

abstract class FSImageNodeCopyWith<$R, $In extends FSImageNode, $Out>
    implements CLCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {String? fsFullPath,
      BoxFitEnum? fit,
      AlignmentEnum? alignment,
      double? width,
      double? height,
      double? scale});
  FSImageNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _FSImageNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FSImageNode, $Out>
    implements FSImageNodeCopyWith<$R, FSImageNode, $Out> {
  _FSImageNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FSImageNode> $mapper =
      FSImageNodeMapper.ensureInitialized();
  @override
  $R call(
          {Object? fsFullPath = $none,
          Object? fit = $none,
          Object? alignment = $none,
          Object? width = $none,
          Object? height = $none,
          Object? scale = $none}) =>
      $apply(FieldCopyWithData({
        if (fsFullPath != $none) #fsFullPath: fsFullPath,
        if (fit != $none) #fit: fit,
        if (alignment != $none) #alignment: alignment,
        if (width != $none) #width: width,
        if (height != $none) #height: height,
        if (scale != $none) #scale: scale
      }));
  @override
  FSImageNode $make(CopyWithData data) => FSImageNode(
      fsFullPath: data.get(#fsFullPath, or: $value.fsFullPath),
      fit: data.get(#fit, or: $value.fit),
      alignment: data.get(#alignment, or: $value.alignment),
      width: data.get(#width, or: $value.width),
      height: data.get(#height, or: $value.height),
      scale: data.get(#scale, or: $value.scale));

  @override
  FSImageNodeCopyWith<$R2, FSImageNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _FSImageNodeCopyWithImpl($value, $cast, t);
}
