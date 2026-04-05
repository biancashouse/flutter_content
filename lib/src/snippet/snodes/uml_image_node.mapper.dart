// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'uml_image_node.dart';

class UMLImageNodeMapper extends SubClassMapperBase<UMLImageNode> {
  UMLImageNodeMapper._();

  static UMLImageNodeMapper? _instance;
  static UMLImageNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UMLImageNodeMapper._());
      CLMapper.ensureInitialized().addSubMapper(_instance!);
      BoxFitEnumMapper.ensureInitialized();
      AlignmentEnumMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UMLImageNode';

  static String? _$name(UMLImageNode v) => v.name;
  static const Field<UMLImageNode, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
  );
  static String? _$diagramText(UMLImageNode v) => v.diagramText;
  static const Field<UMLImageNode, String> _f$diagramText = Field(
    'diagramText',
    _$diagramText,
    opt: true,
  );
  static double? _$width(UMLImageNode v) => v.width;
  static const Field<UMLImageNode, double> _f$width = Field(
    'width',
    _$width,
    opt: true,
  );
  static double? _$height(UMLImageNode v) => v.height;
  static const Field<UMLImageNode, double> _f$height = Field(
    'height',
    _$height,
    opt: true,
  );
  static double _$scale(UMLImageNode v) => v.scale;
  static const Field<UMLImageNode, double> _f$scale = Field(
    'scale',
    _$scale,
    opt: true,
    def: 1.0,
  );
  static BoxFitEnum? _$fit(UMLImageNode v) => v.fit;
  static const Field<UMLImageNode, BoxFitEnum> _f$fit = Field(
    'fit',
    _$fit,
    opt: true,
  );
  static AlignmentEnum? _$alignment(UMLImageNode v) => v.alignment;
  static const Field<UMLImageNode, AlignmentEnum> _f$alignment = Field(
    'alignment',
    _$alignment,
    opt: true,
  );
  static String _$uid(UMLImageNode v) => v.uid;
  static const Field<UMLImageNode, String> _f$uid = Field(
    'uid',
    _$uid,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$treeNodeGK(UMLImageNode v) =>
      v.treeNodeGK;
  static const Field<UMLImageNode, GlobalKey<State<StatefulWidget>>>
  _f$treeNodeGK = Field('treeNodeGK', _$treeNodeGK, mode: FieldMode.member);
  static bool _$isExpanded(UMLImageNode v) => v.isExpanded;
  static const Field<UMLImageNode, bool> _f$isExpanded = Field(
    'isExpanded',
    _$isExpanded,
    mode: FieldMode.member,
  );
  static bool? _$hidePropertiesWhileDragging(UMLImageNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<UMLImageNode, bool> _f$hidePropertiesWhileDragging = Field(
    'hidePropertiesWhileDragging',
    _$hidePropertiesWhileDragging,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$nodeGK(UMLImageNode v) => v.nodeGK;
  static const Field<UMLImageNode, GlobalKey<State<StatefulWidget>>> _f$nodeGK =
      Field('nodeGK', _$nodeGK, mode: FieldMode.member);

  @override
  final MappableFields<UMLImageNode> fields = const {
    #name: _f$name,
    #diagramText: _f$diagramText,
    #width: _f$width,
    #height: _f$height,
    #scale: _f$scale,
    #fit: _f$fit,
    #alignment: _f$alignment,
    #uid: _f$uid,
    #treeNodeGK: _f$treeNodeGK,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeGK: _f$nodeGK,
  };

  @override
  final String discriminatorKey = 'DK:cl';
  @override
  final dynamic discriminatorValue = 'UMLImageNode';
  @override
  late final ClassMapperBase superMapper = CLMapper.ensureInitialized();

  @override
  final MappingHook superHook = ChainedHook([
    PropertyRenameHook('cl', 'DK:cl'),
    PropertyRenameHook('snode', 'DK:snode'),
  ]);

  static UMLImageNode _instantiate(DecodingData data) {
    return UMLImageNode(
      name: data.dec(_f$name),
      diagramText: data.dec(_f$diagramText),
      width: data.dec(_f$width),
      height: data.dec(_f$height),
      scale: data.dec(_f$scale),
      fit: data.dec(_f$fit),
      alignment: data.dec(_f$alignment),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static UMLImageNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UMLImageNode>(map);
  }

  static UMLImageNode fromJson(String json) {
    return ensureInitialized().decodeJson<UMLImageNode>(json);
  }
}

mixin UMLImageNodeMappable {
  String toJson() {
    return UMLImageNodeMapper.ensureInitialized().encodeJson<UMLImageNode>(
      this as UMLImageNode,
    );
  }

  Map<String, dynamic> toMap() {
    return UMLImageNodeMapper.ensureInitialized().encodeMap<UMLImageNode>(
      this as UMLImageNode,
    );
  }

  UMLImageNodeCopyWith<UMLImageNode, UMLImageNode, UMLImageNode> get copyWith =>
      _UMLImageNodeCopyWithImpl<UMLImageNode, UMLImageNode>(
        this as UMLImageNode,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return UMLImageNodeMapper.ensureInitialized().stringifyValue(
      this as UMLImageNode,
    );
  }

  @override
  bool operator ==(Object other) {
    return UMLImageNodeMapper.ensureInitialized().equalsValue(
      this as UMLImageNode,
      other,
    );
  }

  @override
  int get hashCode {
    return UMLImageNodeMapper.ensureInitialized().hashValue(
      this as UMLImageNode,
    );
  }
}

extension UMLImageNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UMLImageNode, $Out> {
  UMLImageNodeCopyWith<$R, UMLImageNode, $Out> get $asUMLImageNode =>
      $base.as((v, t, t2) => _UMLImageNodeCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UMLImageNodeCopyWith<$R, $In extends UMLImageNode, $Out>
    implements CLCopyWith<$R, $In, $Out> {
  @override
  $R call({
    String? name,
    String? diagramText,
    double? width,
    double? height,
    double? scale,
    BoxFitEnum? fit,
    AlignmentEnum? alignment,
  });
  UMLImageNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UMLImageNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UMLImageNode, $Out>
    implements UMLImageNodeCopyWith<$R, UMLImageNode, $Out> {
  _UMLImageNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UMLImageNode> $mapper =
      UMLImageNodeMapper.ensureInitialized();
  @override
  $R call({
    Object? name = $none,
    Object? diagramText = $none,
    Object? width = $none,
    Object? height = $none,
    double? scale,
    Object? fit = $none,
    Object? alignment = $none,
  }) => $apply(
    FieldCopyWithData({
      if (name != $none) #name: name,
      if (diagramText != $none) #diagramText: diagramText,
      if (width != $none) #width: width,
      if (height != $none) #height: height,
      if (scale != null) #scale: scale,
      if (fit != $none) #fit: fit,
      if (alignment != $none) #alignment: alignment,
    }),
  );
  @override
  UMLImageNode $make(CopyWithData data) => UMLImageNode(
    name: data.get(#name, or: $value.name),
    diagramText: data.get(#diagramText, or: $value.diagramText),
    width: data.get(#width, or: $value.width),
    height: data.get(#height, or: $value.height),
    scale: data.get(#scale, or: $value.scale),
    fit: data.get(#fit, or: $value.fit),
    alignment: data.get(#alignment, or: $value.alignment),
  );

  @override
  UMLImageNodeCopyWith<$R2, UMLImageNode, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _UMLImageNodeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

