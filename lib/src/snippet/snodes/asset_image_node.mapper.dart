// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'asset_image_node.dart';

class AssetImageNodeMapper extends SubClassMapperBase<AssetImageNode> {
  AssetImageNodeMapper._();

  static AssetImageNodeMapper? _instance;
  static AssetImageNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AssetImageNodeMapper._());
      CLMapper.ensureInitialized().addSubMapper(_instance!);
      BoxFitEnumMapper.ensureInitialized();
      AlignmentEnumMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AssetImageNode';

  static String? _$name(AssetImageNode v) => v.name;
  static const Field<AssetImageNode, String> _f$name =
      Field('name', _$name, opt: true);
  static BoxFitEnum? _$fit(AssetImageNode v) => v.fit;
  static const Field<AssetImageNode, BoxFitEnum> _f$fit =
      Field('fit', _$fit, opt: true);
  static AlignmentEnum? _$alignment(AssetImageNode v) => v.alignment;
  static const Field<AssetImageNode, AlignmentEnum> _f$alignment =
      Field('alignment', _$alignment, opt: true);
  static double? _$width(AssetImageNode v) => v.width;
  static const Field<AssetImageNode, double> _f$width =
      Field('width', _$width, opt: true);
  static double? _$height(AssetImageNode v) => v.height;
  static const Field<AssetImageNode, double> _f$height =
      Field('height', _$height, opt: true);
  static double _$scale(AssetImageNode v) => v.scale;
  static const Field<AssetImageNode, double> _f$scale =
      Field('scale', _$scale, opt: true, def: 1.0);
  static String _$uid(AssetImageNode v) => v.uid;
  static const Field<AssetImageNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static bool _$isExpanded(AssetImageNode v) => v.isExpanded;
  static const Field<AssetImageNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(AssetImageNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<AssetImageNode, bool> _f$hidePropertiesWhileDragging =
      Field('hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
          mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(AssetImageNode v) =>
      v.nodeWidgetGK;
  static const Field<AssetImageNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<AssetImageNode> fields = const {
    #name: _f$name,
    #fit: _f$fit,
    #alignment: _f$alignment,
    #width: _f$width,
    #height: _f$height,
    #scale: _f$scale,
    #uid: _f$uid,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'cl';
  @override
  final dynamic discriminatorValue = 'AssetImageNode';
  @override
  late final ClassMapperBase superMapper = CLMapper.ensureInitialized();

  static AssetImageNode _instantiate(DecodingData data) {
    return AssetImageNode(
        name: data.dec(_f$name),
        fit: data.dec(_f$fit),
        alignment: data.dec(_f$alignment),
        width: data.dec(_f$width),
        height: data.dec(_f$height),
        scale: data.dec(_f$scale));
  }

  @override
  final Function instantiate = _instantiate;

  static AssetImageNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AssetImageNode>(map);
  }

  static AssetImageNode fromJson(String json) {
    return ensureInitialized().decodeJson<AssetImageNode>(json);
  }
}

mixin AssetImageNodeMappable {
  String toJson() {
    return AssetImageNodeMapper.ensureInitialized()
        .encodeJson<AssetImageNode>(this as AssetImageNode);
  }

  Map<String, dynamic> toMap() {
    return AssetImageNodeMapper.ensureInitialized()
        .encodeMap<AssetImageNode>(this as AssetImageNode);
  }

  AssetImageNodeCopyWith<AssetImageNode, AssetImageNode, AssetImageNode>
      get copyWith => _AssetImageNodeCopyWithImpl(
          this as AssetImageNode, $identity, $identity);
  @override
  String toString() {
    return AssetImageNodeMapper.ensureInitialized()
        .stringifyValue(this as AssetImageNode);
  }

  @override
  bool operator ==(Object other) {
    return AssetImageNodeMapper.ensureInitialized()
        .equalsValue(this as AssetImageNode, other);
  }

  @override
  int get hashCode {
    return AssetImageNodeMapper.ensureInitialized()
        .hashValue(this as AssetImageNode);
  }
}

extension AssetImageNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AssetImageNode, $Out> {
  AssetImageNodeCopyWith<$R, AssetImageNode, $Out> get $asAssetImageNode =>
      $base.as((v, t, t2) => _AssetImageNodeCopyWithImpl(v, t, t2));
}

abstract class AssetImageNodeCopyWith<$R, $In extends AssetImageNode, $Out>
    implements CLCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {String? name,
      BoxFitEnum? fit,
      AlignmentEnum? alignment,
      double? width,
      double? height,
      double? scale});
  AssetImageNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AssetImageNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AssetImageNode, $Out>
    implements AssetImageNodeCopyWith<$R, AssetImageNode, $Out> {
  _AssetImageNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AssetImageNode> $mapper =
      AssetImageNodeMapper.ensureInitialized();
  @override
  $R call(
          {Object? name = $none,
          Object? fit = $none,
          Object? alignment = $none,
          Object? width = $none,
          Object? height = $none,
          double? scale}) =>
      $apply(FieldCopyWithData({
        if (name != $none) #name: name,
        if (fit != $none) #fit: fit,
        if (alignment != $none) #alignment: alignment,
        if (width != $none) #width: width,
        if (height != $none) #height: height,
        if (scale != null) #scale: scale
      }));
  @override
  AssetImageNode $make(CopyWithData data) => AssetImageNode(
      name: data.get(#name, or: $value.name),
      fit: data.get(#fit, or: $value.fit),
      alignment: data.get(#alignment, or: $value.alignment),
      width: data.get(#width, or: $value.width),
      height: data.get(#height, or: $value.height),
      scale: data.get(#scale, or: $value.scale));

  @override
  AssetImageNodeCopyWith<$R2, AssetImageNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AssetImageNodeCopyWithImpl($value, $cast, t);
}
