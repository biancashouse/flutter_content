// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'padding_node.dart';

class PaddingNodeMapper extends SubClassMapperBase<PaddingNode> {
  PaddingNodeMapper._();

  static PaddingNodeMapper? _instance;
  static PaddingNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PaddingNodeMapper._());
      SCMapper.ensureInitialized().addSubMapper(_instance!);
      EdgeInsetsValueMapper.ensureInitialized();
      SNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PaddingNode';

  static EdgeInsetsValue? _$padding(PaddingNode v) => v.padding;
  static const Field<PaddingNode, EdgeInsetsValue> _f$padding =
      Field('padding', _$padding, opt: true);
  static SNode? _$child(PaddingNode v) => v.child;
  static const Field<PaddingNode, SNode> _f$child =
      Field('child', _$child, opt: true);
  static String _$uid(PaddingNode v) => v.uid;
  static const Field<PaddingNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static bool _$isExpanded(PaddingNode v) => v.isExpanded;
  static const Field<PaddingNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(PaddingNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<PaddingNode, bool> _f$hidePropertiesWhileDragging = Field(
      'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
      mode: FieldMode.member);

  @override
  final MappableFields<PaddingNode> fields = const {
    #padding: _f$padding,
    #child: _f$child,
    #uid: _f$uid,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
  };

  @override
  final String discriminatorKey = 'sc';
  @override
  final dynamic discriminatorValue = 'PaddingNode';
  @override
  late final ClassMapperBase superMapper = SCMapper.ensureInitialized();

  static PaddingNode _instantiate(DecodingData data) {
    return PaddingNode(
        padding: data.dec(_f$padding), child: data.dec(_f$child));
  }

  @override
  final Function instantiate = _instantiate;

  static PaddingNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PaddingNode>(map);
  }

  static PaddingNode fromJson(String json) {
    return ensureInitialized().decodeJson<PaddingNode>(json);
  }
}

mixin PaddingNodeMappable {
  String toJson() {
    return PaddingNodeMapper.ensureInitialized()
        .encodeJson<PaddingNode>(this as PaddingNode);
  }

  Map<String, dynamic> toMap() {
    return PaddingNodeMapper.ensureInitialized()
        .encodeMap<PaddingNode>(this as PaddingNode);
  }

  PaddingNodeCopyWith<PaddingNode, PaddingNode, PaddingNode> get copyWith =>
      _PaddingNodeCopyWithImpl<PaddingNode, PaddingNode>(
          this as PaddingNode, $identity, $identity);
  @override
  String toString() {
    return PaddingNodeMapper.ensureInitialized()
        .stringifyValue(this as PaddingNode);
  }

  @override
  bool operator ==(Object other) {
    return PaddingNodeMapper.ensureInitialized()
        .equalsValue(this as PaddingNode, other);
  }

  @override
  int get hashCode {
    return PaddingNodeMapper.ensureInitialized().hashValue(this as PaddingNode);
  }
}

extension PaddingNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PaddingNode, $Out> {
  PaddingNodeCopyWith<$R, PaddingNode, $Out> get $asPaddingNode =>
      $base.as((v, t, t2) => _PaddingNodeCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PaddingNodeCopyWith<$R, $In extends PaddingNode, $Out>
    implements SCCopyWith<$R, $In, $Out> {
  EdgeInsetsValueCopyWith<$R, EdgeInsetsValue, EdgeInsetsValue>? get padding;
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child;
  @override
  $R call({EdgeInsetsValue? padding, SNode? child});
  PaddingNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PaddingNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PaddingNode, $Out>
    implements PaddingNodeCopyWith<$R, PaddingNode, $Out> {
  _PaddingNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PaddingNode> $mapper =
      PaddingNodeMapper.ensureInitialized();
  @override
  EdgeInsetsValueCopyWith<$R, EdgeInsetsValue, EdgeInsetsValue>? get padding =>
      $value.padding?.copyWith.$chain((v) => call(padding: v));
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child =>
      $value.child?.copyWith.$chain((v) => call(child: v));
  @override
  $R call({Object? padding = $none, Object? child = $none}) =>
      $apply(FieldCopyWithData({
        if (padding != $none) #padding: padding,
        if (child != $none) #child: child
      }));
  @override
  PaddingNode $make(CopyWithData data) => PaddingNode(
      padding: data.get(#padding, or: $value.padding),
      child: data.get(#child, or: $value.child));

  @override
  PaddingNodeCopyWith<$R2, PaddingNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PaddingNodeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
