// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'column_node.dart';

class ColumnNodeMapper extends SubClassMapperBase<ColumnNode> {
  ColumnNodeMapper._();

  static ColumnNodeMapper? _instance;
  static ColumnNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ColumnNodeMapper._());
      FlexNodeMapper.ensureInitialized().addSubMapper(_instance!);
      MainAxisAlignmentEnumModelMapper.ensureInitialized();
      MainAxisSizeEnumMapper.ensureInitialized();
      CrossAxisAlignmentEnumModelMapper.ensureInitialized();
      SNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ColumnNode';

  static MainAxisAlignmentEnumModel? _$mainAxisAlignment(ColumnNode v) =>
      v.mainAxisAlignment;
  static const Field<ColumnNode, MainAxisAlignmentEnumModel>
      _f$mainAxisAlignment =
      Field('mainAxisAlignment', _$mainAxisAlignment, opt: true);
  static MainAxisSizeEnum? _$mainAxisSize(ColumnNode v) => v.mainAxisSize;
  static const Field<ColumnNode, MainAxisSizeEnum> _f$mainAxisSize =
      Field('mainAxisSize', _$mainAxisSize, opt: true);
  static CrossAxisAlignmentEnumModel? _$crossAxisAlignment(ColumnNode v) =>
      v.crossAxisAlignment;
  static const Field<ColumnNode, CrossAxisAlignmentEnumModel>
      _f$crossAxisAlignment =
      Field('crossAxisAlignment', _$crossAxisAlignment, opt: true);
  static List<SNode> _$children(ColumnNode v) => v.children;
  static const Field<ColumnNode, List<SNode>> _f$children =
      Field('children', _$children);
  static String _$uid(ColumnNode v) => v.uid;
  static const Field<ColumnNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$treeNodeGK(ColumnNode v) =>
      v.treeNodeGK;
  static const Field<ColumnNode, GlobalKey<State<StatefulWidget>>>
      _f$treeNodeGK = Field('treeNodeGK', _$treeNodeGK, mode: FieldMode.member);
  static bool _$isExpanded(ColumnNode v) => v.isExpanded;
  static const Field<ColumnNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(ColumnNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<ColumnNode, bool> _f$hidePropertiesWhileDragging = Field(
      'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
      mode: FieldMode.member);

  @override
  final MappableFields<ColumnNode> fields = const {
    #mainAxisAlignment: _f$mainAxisAlignment,
    #mainAxisSize: _f$mainAxisSize,
    #crossAxisAlignment: _f$crossAxisAlignment,
    #children: _f$children,
    #uid: _f$uid,
    #treeNodeGK: _f$treeNodeGK,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
  };

  @override
  final String discriminatorKey = 'flex';
  @override
  final dynamic discriminatorValue = 'ColumnNode';
  @override
  late final ClassMapperBase superMapper = FlexNodeMapper.ensureInitialized();

  static ColumnNode _instantiate(DecodingData data) {
    return ColumnNode(
        mainAxisAlignment: data.dec(_f$mainAxisAlignment),
        mainAxisSize: data.dec(_f$mainAxisSize),
        crossAxisAlignment: data.dec(_f$crossAxisAlignment),
        children: data.dec(_f$children));
  }

  @override
  final Function instantiate = _instantiate;

  static ColumnNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ColumnNode>(map);
  }

  static ColumnNode fromJson(String json) {
    return ensureInitialized().decodeJson<ColumnNode>(json);
  }
}

mixin ColumnNodeMappable {
  String toJson() {
    return ColumnNodeMapper.ensureInitialized()
        .encodeJson<ColumnNode>(this as ColumnNode);
  }

  Map<String, dynamic> toMap() {
    return ColumnNodeMapper.ensureInitialized()
        .encodeMap<ColumnNode>(this as ColumnNode);
  }

  ColumnNodeCopyWith<ColumnNode, ColumnNode, ColumnNode> get copyWith =>
      _ColumnNodeCopyWithImpl<ColumnNode, ColumnNode>(
          this as ColumnNode, $identity, $identity);
  @override
  String toString() {
    return ColumnNodeMapper.ensureInitialized()
        .stringifyValue(this as ColumnNode);
  }

  @override
  bool operator ==(Object other) {
    return ColumnNodeMapper.ensureInitialized()
        .equalsValue(this as ColumnNode, other);
  }

  @override
  int get hashCode {
    return ColumnNodeMapper.ensureInitialized().hashValue(this as ColumnNode);
  }
}

extension ColumnNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ColumnNode, $Out> {
  ColumnNodeCopyWith<$R, ColumnNode, $Out> get $asColumnNode =>
      $base.as((v, t, t2) => _ColumnNodeCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ColumnNodeCopyWith<$R, $In extends ColumnNode, $Out>
    implements FlexNodeCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, SNode, SNodeCopyWith<$R, SNode, SNode>> get children;
  @override
  $R call(
      {MainAxisAlignmentEnumModel? mainAxisAlignment,
      MainAxisSizeEnum? mainAxisSize,
      CrossAxisAlignmentEnumModel? crossAxisAlignment,
      List<SNode>? children});
  ColumnNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ColumnNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ColumnNode, $Out>
    implements ColumnNodeCopyWith<$R, ColumnNode, $Out> {
  _ColumnNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ColumnNode> $mapper =
      ColumnNodeMapper.ensureInitialized();
  @override
  ListCopyWith<$R, SNode, SNodeCopyWith<$R, SNode, SNode>> get children =>
      ListCopyWith($value.children, (v, t) => v.copyWith.$chain(t),
          (v) => call(children: v));
  @override
  $R call(
          {Object? mainAxisAlignment = $none,
          Object? mainAxisSize = $none,
          Object? crossAxisAlignment = $none,
          List<SNode>? children}) =>
      $apply(FieldCopyWithData({
        if (mainAxisAlignment != $none) #mainAxisAlignment: mainAxisAlignment,
        if (mainAxisSize != $none) #mainAxisSize: mainAxisSize,
        if (crossAxisAlignment != $none)
          #crossAxisAlignment: crossAxisAlignment,
        if (children != null) #children: children
      }));
  @override
  ColumnNode $make(CopyWithData data) => ColumnNode(
      mainAxisAlignment:
          data.get(#mainAxisAlignment, or: $value.mainAxisAlignment),
      mainAxisSize: data.get(#mainAxisSize, or: $value.mainAxisSize),
      crossAxisAlignment:
          data.get(#crossAxisAlignment, or: $value.crossAxisAlignment),
      children: data.get(#children, or: $value.children));

  @override
  ColumnNodeCopyWith<$R2, ColumnNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ColumnNodeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
