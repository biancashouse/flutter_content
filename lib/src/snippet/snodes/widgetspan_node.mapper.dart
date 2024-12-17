// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'widgetspan_node.dart';

class WidgetSpanNodeMapper extends SubClassMapperBase<WidgetSpanNode> {
  WidgetSpanNodeMapper._();

  static WidgetSpanNodeMapper? _instance;
  static WidgetSpanNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WidgetSpanNodeMapper._());
      InlineSpanNodeMapper.ensureInitialized().addSubMapper(_instance!);
      STreeNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'WidgetSpanNode';

  static STreeNode? _$child(WidgetSpanNode v) => v.child;
  static const Field<WidgetSpanNode, STreeNode> _f$child =
      Field('child', _$child, opt: true);
  static String _$uid(WidgetSpanNode v) => v.uid;
  static const Field<WidgetSpanNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static bool _$isExpanded(WidgetSpanNode v) => v.isExpanded;
  static const Field<WidgetSpanNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(WidgetSpanNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<WidgetSpanNode, bool> _f$hidePropertiesWhileDragging =
      Field('hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
          mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(WidgetSpanNode v) =>
      v.nodeWidgetGK;
  static const Field<WidgetSpanNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<WidgetSpanNode> fields = const {
    #child: _f$child,
    #uid: _f$uid,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'is';
  @override
  final dynamic discriminatorValue = 'WidgetSpanNode';
  @override
  late final ClassMapperBase superMapper =
      InlineSpanNodeMapper.ensureInitialized();

  static WidgetSpanNode _instantiate(DecodingData data) {
    return WidgetSpanNode(child: data.dec(_f$child));
  }

  @override
  final Function instantiate = _instantiate;

  static WidgetSpanNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<WidgetSpanNode>(map);
  }

  static WidgetSpanNode fromJson(String json) {
    return ensureInitialized().decodeJson<WidgetSpanNode>(json);
  }
}

mixin WidgetSpanNodeMappable {
  String toJson() {
    return WidgetSpanNodeMapper.ensureInitialized()
        .encodeJson<WidgetSpanNode>(this as WidgetSpanNode);
  }

  Map<String, dynamic> toMap() {
    return WidgetSpanNodeMapper.ensureInitialized()
        .encodeMap<WidgetSpanNode>(this as WidgetSpanNode);
  }

  WidgetSpanNodeCopyWith<WidgetSpanNode, WidgetSpanNode, WidgetSpanNode>
      get copyWith => _WidgetSpanNodeCopyWithImpl(
          this as WidgetSpanNode, $identity, $identity);
  @override
  String toString() {
    return WidgetSpanNodeMapper.ensureInitialized()
        .stringifyValue(this as WidgetSpanNode);
  }

  @override
  bool operator ==(Object other) {
    return WidgetSpanNodeMapper.ensureInitialized()
        .equalsValue(this as WidgetSpanNode, other);
  }

  @override
  int get hashCode {
    return WidgetSpanNodeMapper.ensureInitialized()
        .hashValue(this as WidgetSpanNode);
  }
}

extension WidgetSpanNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, WidgetSpanNode, $Out> {
  WidgetSpanNodeCopyWith<$R, WidgetSpanNode, $Out> get $asWidgetSpanNode =>
      $base.as((v, t, t2) => _WidgetSpanNodeCopyWithImpl(v, t, t2));
}

abstract class WidgetSpanNodeCopyWith<$R, $In extends WidgetSpanNode, $Out>
    implements InlineSpanNodeCopyWith<$R, $In, $Out> {
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get child;
  @override
  $R call({STreeNode? child});
  WidgetSpanNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _WidgetSpanNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, WidgetSpanNode, $Out>
    implements WidgetSpanNodeCopyWith<$R, WidgetSpanNode, $Out> {
  _WidgetSpanNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<WidgetSpanNode> $mapper =
      WidgetSpanNodeMapper.ensureInitialized();
  @override
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get child =>
      $value.child?.copyWith.$chain((v) => call(child: v));
  @override
  $R call({Object? child = $none}) =>
      $apply(FieldCopyWithData({if (child != $none) #child: child}));
  @override
  WidgetSpanNode $make(CopyWithData data) =>
      WidgetSpanNode(child: data.get(#child, or: $value.child));

  @override
  WidgetSpanNodeCopyWith<$R2, WidgetSpanNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _WidgetSpanNodeCopyWithImpl($value, $cast, t);
}
