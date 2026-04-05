// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'storage_image_node.dart';

class StorageImageNodeMapper extends SubClassMapperBase<StorageImageNode> {
  StorageImageNodeMapper._();

  static StorageImageNodeMapper? _instance;
  static StorageImageNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StorageImageNodeMapper._());
      CLMapper.ensureInitialized().addSubMapper(_instance!);
      BoxFitEnumMapper.ensureInitialized();
      AlignmentEnumMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'StorageImageNode';

  static String? _$fsFullPath(StorageImageNode v) => v.fsFullPath;
  static const Field<StorageImageNode, String> _f$fsFullPath = Field(
    'fsFullPath',
    _$fsFullPath,
    opt: true,
  );
  static BoxFitEnum? _$fit(StorageImageNode v) => v.fit;
  static const Field<StorageImageNode, BoxFitEnum> _f$fit = Field(
    'fit',
    _$fit,
    opt: true,
  );
  static AlignmentEnum? _$alignment(StorageImageNode v) => v.alignment;
  static const Field<StorageImageNode, AlignmentEnum> _f$alignment = Field(
    'alignment',
    _$alignment,
    opt: true,
  );
  static double? _$width(StorageImageNode v) => v.width;
  static const Field<StorageImageNode, double> _f$width = Field(
    'width',
    _$width,
    opt: true,
  );
  static double? _$height(StorageImageNode v) => v.height;
  static const Field<StorageImageNode, double> _f$height = Field(
    'height',
    _$height,
    opt: true,
  );
  static double? _$scale(StorageImageNode v) => v.scale;
  static const Field<StorageImageNode, double> _f$scale = Field(
    'scale',
    _$scale,
    opt: true,
  );
  static String _$uid(StorageImageNode v) => v.uid;
  static const Field<StorageImageNode, String> _f$uid = Field(
    'uid',
    _$uid,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$treeNodeGK(StorageImageNode v) =>
      v.treeNodeGK;
  static const Field<StorageImageNode, GlobalKey<State<StatefulWidget>>>
  _f$treeNodeGK = Field('treeNodeGK', _$treeNodeGK, mode: FieldMode.member);
  static bool _$isExpanded(StorageImageNode v) => v.isExpanded;
  static const Field<StorageImageNode, bool> _f$isExpanded = Field(
    'isExpanded',
    _$isExpanded,
    mode: FieldMode.member,
  );
  static bool? _$hidePropertiesWhileDragging(StorageImageNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<StorageImageNode, bool> _f$hidePropertiesWhileDragging =
      Field(
        'hidePropertiesWhileDragging',
        _$hidePropertiesWhileDragging,
        mode: FieldMode.member,
      );
  static GlobalKey<State<StatefulWidget>>? _$nodeGK(StorageImageNode v) =>
      v.nodeGK;
  static const Field<StorageImageNode, GlobalKey<State<StatefulWidget>>>
  _f$nodeGK = Field('nodeGK', _$nodeGK, mode: FieldMode.member);

  @override
  final MappableFields<StorageImageNode> fields = const {
    #fsFullPath: _f$fsFullPath,
    #fit: _f$fit,
    #alignment: _f$alignment,
    #width: _f$width,
    #height: _f$height,
    #scale: _f$scale,
    #uid: _f$uid,
    #treeNodeGK: _f$treeNodeGK,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeGK: _f$nodeGK,
  };

  @override
  final String discriminatorKey = 'DK:cl';
  @override
  final dynamic discriminatorValue = 'StorageImageNode';
  @override
  late final ClassMapperBase superMapper = CLMapper.ensureInitialized();

  @override
  final MappingHook hook = const StorageImageRenameHook();
  @override
  final MappingHook superHook = ChainedHook([
    PropertyRenameHook('cl', 'DK:cl'),
    PropertyRenameHook('snode', 'DK:snode'),
  ]);

  static StorageImageNode _instantiate(DecodingData data) {
    return StorageImageNode(
      fsFullPath: data.dec(_f$fsFullPath),
      fit: data.dec(_f$fit),
      alignment: data.dec(_f$alignment),
      width: data.dec(_f$width),
      height: data.dec(_f$height),
      scale: data.dec(_f$scale),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static StorageImageNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StorageImageNode>(map);
  }

  static StorageImageNode fromJson(String json) {
    return ensureInitialized().decodeJson<StorageImageNode>(json);
  }
}

mixin StorageImageNodeMappable {
  String toJson() {
    return StorageImageNodeMapper.ensureInitialized()
        .encodeJson<StorageImageNode>(this as StorageImageNode);
  }

  Map<String, dynamic> toMap() {
    return StorageImageNodeMapper.ensureInitialized()
        .encodeMap<StorageImageNode>(this as StorageImageNode);
  }

  StorageImageNodeCopyWith<StorageImageNode, StorageImageNode, StorageImageNode>
  get copyWith =>
      _StorageImageNodeCopyWithImpl<StorageImageNode, StorageImageNode>(
        this as StorageImageNode,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return StorageImageNodeMapper.ensureInitialized().stringifyValue(
      this as StorageImageNode,
    );
  }

  @override
  bool operator ==(Object other) {
    return StorageImageNodeMapper.ensureInitialized().equalsValue(
      this as StorageImageNode,
      other,
    );
  }

  @override
  int get hashCode {
    return StorageImageNodeMapper.ensureInitialized().hashValue(
      this as StorageImageNode,
    );
  }
}

extension StorageImageNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StorageImageNode, $Out> {
  StorageImageNodeCopyWith<$R, StorageImageNode, $Out>
  get $asStorageImageNode =>
      $base.as((v, t, t2) => _StorageImageNodeCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class StorageImageNodeCopyWith<$R, $In extends StorageImageNode, $Out>
    implements CLCopyWith<$R, $In, $Out> {
  @override
  $R call({
    String? fsFullPath,
    BoxFitEnum? fit,
    AlignmentEnum? alignment,
    double? width,
    double? height,
    double? scale,
  });
  StorageImageNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _StorageImageNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StorageImageNode, $Out>
    implements StorageImageNodeCopyWith<$R, StorageImageNode, $Out> {
  _StorageImageNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StorageImageNode> $mapper =
      StorageImageNodeMapper.ensureInitialized();
  @override
  $R call({
    Object? fsFullPath = $none,
    Object? fit = $none,
    Object? alignment = $none,
    Object? width = $none,
    Object? height = $none,
    Object? scale = $none,
  }) => $apply(
    FieldCopyWithData({
      if (fsFullPath != $none) #fsFullPath: fsFullPath,
      if (fit != $none) #fit: fit,
      if (alignment != $none) #alignment: alignment,
      if (width != $none) #width: width,
      if (height != $none) #height: height,
      if (scale != $none) #scale: scale,
    }),
  );
  @override
  StorageImageNode $make(CopyWithData data) => StorageImageNode(
    fsFullPath: data.get(#fsFullPath, or: $value.fsFullPath),
    fit: data.get(#fit, or: $value.fit),
    alignment: data.get(#alignment, or: $value.alignment),
    width: data.get(#width, or: $value.width),
    height: data.get(#height, or: $value.height),
    scale: data.get(#scale, or: $value.scale),
  );

  @override
  StorageImageNodeCopyWith<$R2, StorageImageNode, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _StorageImageNodeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

