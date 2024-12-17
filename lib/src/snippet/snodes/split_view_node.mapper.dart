// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'split_view_node.dart';

class SplitViewNodeMapper extends SubClassMapperBase<SplitViewNode> {
  SplitViewNodeMapper._();

  static SplitViewNodeMapper? _instance;
  static SplitViewNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SplitViewNodeMapper._());
      MCMapper.ensureInitialized().addSubMapper(_instance!);
      AxisEnumMapper.ensureInitialized();
      STreeNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SplitViewNode';

  static AxisEnum _$axis(SplitViewNode v) => v.axis;
  static const Field<SplitViewNode, AxisEnum> _f$axis =
      Field('axis', _$axis, opt: true, def: AxisEnum.horizontal);
  static bool _$resizeable(SplitViewNode v) => v.resizeable;
  static const Field<SplitViewNode, bool> _f$resizeable =
      Field('resizeable', _$resizeable, opt: true, def: true);
  static List<STreeNode> _$children(SplitViewNode v) => v.children;
  static const Field<SplitViewNode, List<STreeNode>> _f$children =
      Field('children', _$children);
  static String _$uid(SplitViewNode v) => v.uid;
  static const Field<SplitViewNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static bool _$isExpanded(SplitViewNode v) => v.isExpanded;
  static const Field<SplitViewNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(SplitViewNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<SplitViewNode, bool> _f$hidePropertiesWhileDragging =
      Field('hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
          mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(SplitViewNode v) =>
      v.nodeWidgetGK;
  static const Field<SplitViewNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<SplitViewNode> fields = const {
    #axis: _f$axis,
    #resizeable: _f$resizeable,
    #children: _f$children,
    #uid: _f$uid,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'mc';
  @override
  final dynamic discriminatorValue = 'SplitViewNode';
  @override
  late final ClassMapperBase superMapper = MCMapper.ensureInitialized();

  static SplitViewNode _instantiate(DecodingData data) {
    return SplitViewNode(
        axis: data.dec(_f$axis),
        resizeable: data.dec(_f$resizeable),
        children: data.dec(_f$children));
  }

  @override
  final Function instantiate = _instantiate;

  static SplitViewNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SplitViewNode>(map);
  }

  static SplitViewNode fromJson(String json) {
    return ensureInitialized().decodeJson<SplitViewNode>(json);
  }
}

mixin SplitViewNodeMappable {
  String toJson() {
    return SplitViewNodeMapper.ensureInitialized()
        .encodeJson<SplitViewNode>(this as SplitViewNode);
  }

  Map<String, dynamic> toMap() {
    return SplitViewNodeMapper.ensureInitialized()
        .encodeMap<SplitViewNode>(this as SplitViewNode);
  }

  SplitViewNodeCopyWith<SplitViewNode, SplitViewNode, SplitViewNode>
      get copyWith => _SplitViewNodeCopyWithImpl(
          this as SplitViewNode, $identity, $identity);
  @override
  String toString() {
    return SplitViewNodeMapper.ensureInitialized()
        .stringifyValue(this as SplitViewNode);
  }

  @override
  bool operator ==(Object other) {
    return SplitViewNodeMapper.ensureInitialized()
        .equalsValue(this as SplitViewNode, other);
  }

  @override
  int get hashCode {
    return SplitViewNodeMapper.ensureInitialized()
        .hashValue(this as SplitViewNode);
  }
}

extension SplitViewNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SplitViewNode, $Out> {
  SplitViewNodeCopyWith<$R, SplitViewNode, $Out> get $asSplitViewNode =>
      $base.as((v, t, t2) => _SplitViewNodeCopyWithImpl(v, t, t2));
}

abstract class SplitViewNodeCopyWith<$R, $In extends SplitViewNode, $Out>
    implements MCCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, STreeNode, STreeNodeCopyWith<$R, STreeNode, STreeNode>>
      get children;
  @override
  $R call({AxisEnum? axis, bool? resizeable, List<STreeNode>? children});
  SplitViewNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SplitViewNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SplitViewNode, $Out>
    implements SplitViewNodeCopyWith<$R, SplitViewNode, $Out> {
  _SplitViewNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SplitViewNode> $mapper =
      SplitViewNodeMapper.ensureInitialized();
  @override
  ListCopyWith<$R, STreeNode, STreeNodeCopyWith<$R, STreeNode, STreeNode>>
      get children => ListCopyWith($value.children,
          (v, t) => v.copyWith.$chain(t), (v) => call(children: v));
  @override
  $R call({AxisEnum? axis, bool? resizeable, List<STreeNode>? children}) =>
      $apply(FieldCopyWithData({
        if (axis != null) #axis: axis,
        if (resizeable != null) #resizeable: resizeable,
        if (children != null) #children: children
      }));
  @override
  SplitViewNode $make(CopyWithData data) => SplitViewNode(
      axis: data.get(#axis, or: $value.axis),
      resizeable: data.get(#resizeable, or: $value.resizeable),
      children: data.get(#children, or: $value.children));

  @override
  SplitViewNodeCopyWith<$R2, SplitViewNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SplitViewNodeCopyWithImpl($value, $cast, t);
}
