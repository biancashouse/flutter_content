// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'preferredsize_node.dart';

class PreferredSizeNodeMapper extends SubClassMapperBase<PreferredSizeNode> {
  PreferredSizeNodeMapper._();

  static PreferredSizeNodeMapper? _instance;
  static PreferredSizeNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PreferredSizeNodeMapper._());
      SCMapper.ensureInitialized().addSubMapper(_instance!);
      SNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PreferredSizeNode';

  static double _$width(PreferredSizeNode v) => v.width;
  static const Field<PreferredSizeNode, double> _f$width =
      Field('width', _$width);
  static double _$height(PreferredSizeNode v) => v.height;
  static const Field<PreferredSizeNode, double> _f$height =
      Field('height', _$height);
  static SNode? _$child(PreferredSizeNode v) => v.child;
  static const Field<PreferredSizeNode, SNode> _f$child =
      Field('child', _$child, opt: true);
  static String _$uid(PreferredSizeNode v) => v.uid;
  static const Field<PreferredSizeNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static bool _$isExpanded(PreferredSizeNode v) => v.isExpanded;
  static const Field<PreferredSizeNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(PreferredSizeNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<PreferredSizeNode, bool> _f$hidePropertiesWhileDragging =
      Field('hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
          mode: FieldMode.member);

  @override
  final MappableFields<PreferredSizeNode> fields = const {
    #width: _f$width,
    #height: _f$height,
    #child: _f$child,
    #uid: _f$uid,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
  };

  @override
  final String discriminatorKey = 'sc';
  @override
  final dynamic discriminatorValue = 'PreferredSizeNode';
  @override
  late final ClassMapperBase superMapper = SCMapper.ensureInitialized();

  static PreferredSizeNode _instantiate(DecodingData data) {
    return PreferredSizeNode(
        width: data.dec(_f$width),
        height: data.dec(_f$height),
        child: data.dec(_f$child));
  }

  @override
  final Function instantiate = _instantiate;

  static PreferredSizeNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PreferredSizeNode>(map);
  }

  static PreferredSizeNode fromJson(String json) {
    return ensureInitialized().decodeJson<PreferredSizeNode>(json);
  }
}

mixin PreferredSizeNodeMappable {
  String toJson() {
    return PreferredSizeNodeMapper.ensureInitialized()
        .encodeJson<PreferredSizeNode>(this as PreferredSizeNode);
  }

  Map<String, dynamic> toMap() {
    return PreferredSizeNodeMapper.ensureInitialized()
        .encodeMap<PreferredSizeNode>(this as PreferredSizeNode);
  }

  PreferredSizeNodeCopyWith<PreferredSizeNode, PreferredSizeNode,
          PreferredSizeNode>
      get copyWith =>
          _PreferredSizeNodeCopyWithImpl<PreferredSizeNode, PreferredSizeNode>(
              this as PreferredSizeNode, $identity, $identity);
  @override
  String toString() {
    return PreferredSizeNodeMapper.ensureInitialized()
        .stringifyValue(this as PreferredSizeNode);
  }

  @override
  bool operator ==(Object other) {
    return PreferredSizeNodeMapper.ensureInitialized()
        .equalsValue(this as PreferredSizeNode, other);
  }

  @override
  int get hashCode {
    return PreferredSizeNodeMapper.ensureInitialized()
        .hashValue(this as PreferredSizeNode);
  }
}

extension PreferredSizeNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PreferredSizeNode, $Out> {
  PreferredSizeNodeCopyWith<$R, PreferredSizeNode, $Out>
      get $asPreferredSizeNode => $base
          .as((v, t, t2) => _PreferredSizeNodeCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PreferredSizeNodeCopyWith<$R, $In extends PreferredSizeNode,
    $Out> implements SCCopyWith<$R, $In, $Out> {
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child;
  @override
  $R call({double? width, double? height, SNode? child});
  PreferredSizeNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PreferredSizeNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PreferredSizeNode, $Out>
    implements PreferredSizeNodeCopyWith<$R, PreferredSizeNode, $Out> {
  _PreferredSizeNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PreferredSizeNode> $mapper =
      PreferredSizeNodeMapper.ensureInitialized();
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child =>
      $value.child?.copyWith.$chain((v) => call(child: v));
  @override
  $R call({double? width, double? height, Object? child = $none}) =>
      $apply(FieldCopyWithData({
        if (width != null) #width: width,
        if (height != null) #height: height,
        if (child != $none) #child: child
      }));
  @override
  PreferredSizeNode $make(CopyWithData data) => PreferredSizeNode(
      width: data.get(#width, or: $value.width),
      height: data.get(#height, or: $value.height),
      child: data.get(#child, or: $value.child));

  @override
  PreferredSizeNodeCopyWith<$R2, PreferredSizeNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PreferredSizeNodeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
