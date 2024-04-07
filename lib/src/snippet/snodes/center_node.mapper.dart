// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'center_node.dart';

class CenterNodeMapper extends SubClassMapperBase<CenterNode> {
  CenterNodeMapper._();

  static CenterNodeMapper? _instance;
  static CenterNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CenterNodeMapper._());
      SCMapper.ensureInitialized().addSubMapper(_instance!);
      STreeNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CenterNode';

  static STreeNode? _$child(CenterNode v) => v.child;
  static const Field<CenterNode, STreeNode> _f$child =
      Field('child', _$child, opt: true);
  static bool _$isExpanded(CenterNode v) => v.isExpanded;
  static const Field<CenterNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(CenterNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<CenterNode, bool> _f$hidePropertiesWhileDragging = Field(
      'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
      mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(CenterNode v) =>
      v.nodeWidgetGK;
  static const Field<CenterNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<CenterNode> fields = const {
    #child: _f$child,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'sc';
  @override
  final dynamic discriminatorValue = 'CenterNode';
  @override
  late final ClassMapperBase superMapper = SCMapper.ensureInitialized();

  static CenterNode _instantiate(DecodingData data) {
    return CenterNode(child: data.dec(_f$child));
  }

  @override
  final Function instantiate = _instantiate;

  static CenterNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CenterNode>(map);
  }

  static CenterNode fromJson(String json) {
    return ensureInitialized().decodeJson<CenterNode>(json);
  }
}

mixin CenterNodeMappable {
  String toJson() {
    return CenterNodeMapper.ensureInitialized()
        .encodeJson<CenterNode>(this as CenterNode);
  }

  Map<String, dynamic> toMap() {
    return CenterNodeMapper.ensureInitialized()
        .encodeMap<CenterNode>(this as CenterNode);
  }

  CenterNodeCopyWith<CenterNode, CenterNode, CenterNode> get copyWith =>
      _CenterNodeCopyWithImpl(this as CenterNode, $identity, $identity);
  @override
  String toString() {
    return CenterNodeMapper.ensureInitialized()
        .stringifyValue(this as CenterNode);
  }

  @override
  bool operator ==(Object other) {
    return CenterNodeMapper.ensureInitialized()
        .equalsValue(this as CenterNode, other);
  }

  @override
  int get hashCode {
    return CenterNodeMapper.ensureInitialized().hashValue(this as CenterNode);
  }
}

extension CenterNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CenterNode, $Out> {
  CenterNodeCopyWith<$R, CenterNode, $Out> get $asCenterNode =>
      $base.as((v, t, t2) => _CenterNodeCopyWithImpl(v, t, t2));
}

abstract class CenterNodeCopyWith<$R, $In extends CenterNode, $Out>
    implements SCCopyWith<$R, $In, $Out> {
  @override
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get child;
  @override
  $R call({STreeNode? child});
  CenterNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CenterNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CenterNode, $Out>
    implements CenterNodeCopyWith<$R, CenterNode, $Out> {
  _CenterNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CenterNode> $mapper =
      CenterNodeMapper.ensureInitialized();
  @override
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get child =>
      $value.child?.copyWith.$chain((v) => call(child: v));
  @override
  $R call({Object? child = $none}) =>
      $apply(FieldCopyWithData({if (child != $none) #child: child}));
  @override
  CenterNode $make(CopyWithData data) =>
      CenterNode(child: data.get(#child, or: $value.child));

  @override
  CenterNodeCopyWith<$R2, CenterNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CenterNodeCopyWithImpl($value, $cast, t);
}
