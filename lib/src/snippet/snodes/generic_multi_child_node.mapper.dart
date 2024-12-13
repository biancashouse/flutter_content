// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'generic_multi_child_node.dart';

class GenericMultiChildNodeMapper
    extends SubClassMapperBase<GenericMultiChildNode> {
  GenericMultiChildNodeMapper._();

  static GenericMultiChildNodeMapper? _instance;
  static GenericMultiChildNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GenericMultiChildNodeMapper._());
      MCMapper.ensureInitialized().addSubMapper(_instance!);
      STreeNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'GenericMultiChildNode';

  static String _$propertyName(GenericMultiChildNode v) => v.propertyName;
  static const Field<GenericMultiChildNode, String> _f$propertyName =
      Field('propertyName', _$propertyName);
  static List<STreeNode> _$children(GenericMultiChildNode v) => v.children;
  static const Field<GenericMultiChildNode, List<STreeNode>> _f$children =
      Field('children', _$children);
  static String _$uid(GenericMultiChildNode v) => v.uid;
  static const Field<GenericMultiChildNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static bool _$isExpanded(GenericMultiChildNode v) => v.isExpanded;
  static const Field<GenericMultiChildNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static Rect? _$measuredRect(GenericMultiChildNode v) => v.measuredRect;
  static const Field<GenericMultiChildNode, Rect> _f$measuredRect =
      Field('measuredRect', _$measuredRect, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(GenericMultiChildNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<GenericMultiChildNode, bool>
      _f$hidePropertiesWhileDragging = Field(
          'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
          mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(
          GenericMultiChildNode v) =>
      v.nodeWidgetGK;
  static const Field<GenericMultiChildNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<GenericMultiChildNode> fields = const {
    #propertyName: _f$propertyName,
    #children: _f$children,
    #uid: _f$uid,
    #isExpanded: _f$isExpanded,
    #measuredRect: _f$measuredRect,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'mc';
  @override
  final dynamic discriminatorValue = 'GenericMultiChildNode';
  @override
  late final ClassMapperBase superMapper = MCMapper.ensureInitialized();

  static GenericMultiChildNode _instantiate(DecodingData data) {
    return GenericMultiChildNode(
        propertyName: data.dec(_f$propertyName),
        children: data.dec(_f$children));
  }

  @override
  final Function instantiate = _instantiate;

  static GenericMultiChildNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GenericMultiChildNode>(map);
  }

  static GenericMultiChildNode fromJson(String json) {
    return ensureInitialized().decodeJson<GenericMultiChildNode>(json);
  }
}

mixin GenericMultiChildNodeMappable {
  String toJson() {
    return GenericMultiChildNodeMapper.ensureInitialized()
        .encodeJson<GenericMultiChildNode>(this as GenericMultiChildNode);
  }

  Map<String, dynamic> toMap() {
    return GenericMultiChildNodeMapper.ensureInitialized()
        .encodeMap<GenericMultiChildNode>(this as GenericMultiChildNode);
  }

  GenericMultiChildNodeCopyWith<GenericMultiChildNode, GenericMultiChildNode,
          GenericMultiChildNode>
      get copyWith => _GenericMultiChildNodeCopyWithImpl(
          this as GenericMultiChildNode, $identity, $identity);
  @override
  String toString() {
    return GenericMultiChildNodeMapper.ensureInitialized()
        .stringifyValue(this as GenericMultiChildNode);
  }

  @override
  bool operator ==(Object other) {
    return GenericMultiChildNodeMapper.ensureInitialized()
        .equalsValue(this as GenericMultiChildNode, other);
  }

  @override
  int get hashCode {
    return GenericMultiChildNodeMapper.ensureInitialized()
        .hashValue(this as GenericMultiChildNode);
  }
}

extension GenericMultiChildNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GenericMultiChildNode, $Out> {
  GenericMultiChildNodeCopyWith<$R, GenericMultiChildNode, $Out>
      get $asGenericMultiChildNode =>
          $base.as((v, t, t2) => _GenericMultiChildNodeCopyWithImpl(v, t, t2));
}

abstract class GenericMultiChildNodeCopyWith<
    $R,
    $In extends GenericMultiChildNode,
    $Out> implements MCCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, STreeNode, STreeNodeCopyWith<$R, STreeNode, STreeNode>>
      get children;
  @override
  $R call({String? propertyName, List<STreeNode>? children});
  GenericMultiChildNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _GenericMultiChildNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GenericMultiChildNode, $Out>
    implements GenericMultiChildNodeCopyWith<$R, GenericMultiChildNode, $Out> {
  _GenericMultiChildNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GenericMultiChildNode> $mapper =
      GenericMultiChildNodeMapper.ensureInitialized();
  @override
  ListCopyWith<$R, STreeNode, STreeNodeCopyWith<$R, STreeNode, STreeNode>>
      get children => ListCopyWith($value.children,
          (v, t) => v.copyWith.$chain(t), (v) => call(children: v));
  @override
  $R call({String? propertyName, List<STreeNode>? children}) =>
      $apply(FieldCopyWithData({
        if (propertyName != null) #propertyName: propertyName,
        if (children != null) #children: children
      }));
  @override
  GenericMultiChildNode $make(CopyWithData data) => GenericMultiChildNode(
      propertyName: data.get(#propertyName, or: $value.propertyName),
      children: data.get(#children, or: $value.children));

  @override
  GenericMultiChildNodeCopyWith<$R2, GenericMultiChildNode, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _GenericMultiChildNodeCopyWithImpl($value, $cast, t);
}
