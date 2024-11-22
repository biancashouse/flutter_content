// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'singlechildscrollview_node.dart';

class SingleChildScrollViewNodeMapper
    extends SubClassMapperBase<SingleChildScrollViewNode> {
  SingleChildScrollViewNodeMapper._();

  static SingleChildScrollViewNodeMapper? _instance;
  static SingleChildScrollViewNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = SingleChildScrollViewNodeMapper._());
      SCMapper.ensureInitialized().addSubMapper(_instance!);
      EdgeInsetsValueMapper.ensureInitialized();
      STreeNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SingleChildScrollViewNode';

  static EdgeInsetsValue? _$padding(SingleChildScrollViewNode v) => v.padding;
  static const Field<SingleChildScrollViewNode, EdgeInsetsValue> _f$padding =
      Field('padding', _$padding, opt: true);
  static STreeNode? _$child(SingleChildScrollViewNode v) => v.child;
  static const Field<SingleChildScrollViewNode, STreeNode> _f$child =
      Field('child', _$child, opt: true);
  static String _$uid(SingleChildScrollViewNode v) => v.uid;
  static const Field<SingleChildScrollViewNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$gk(SingleChildScrollViewNode v) =>
      v.gk;
  static const Field<SingleChildScrollViewNode,
          GlobalKey<State<StatefulWidget>>> _f$gk =
      Field('gk', _$gk, mode: FieldMode.member);
  static bool _$isExpanded(SingleChildScrollViewNode v) => v.isExpanded;
  static const Field<SingleChildScrollViewNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(SingleChildScrollViewNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<SingleChildScrollViewNode, bool>
      _f$hidePropertiesWhileDragging = Field(
          'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
          mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(
          SingleChildScrollViewNode v) =>
      v.nodeWidgetGK;
  static const Field<SingleChildScrollViewNode,
          GlobalKey<State<StatefulWidget>>> _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<SingleChildScrollViewNode> fields = const {
    #padding: _f$padding,
    #child: _f$child,
    #uid: _f$uid,
    #gk: _f$gk,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'sc';
  @override
  final dynamic discriminatorValue = 'SingleChildScrollViewNode';
  @override
  late final ClassMapperBase superMapper = SCMapper.ensureInitialized();

  static SingleChildScrollViewNode _instantiate(DecodingData data) {
    return SingleChildScrollViewNode(
        padding: data.dec(_f$padding), child: data.dec(_f$child));
  }

  @override
  final Function instantiate = _instantiate;

  static SingleChildScrollViewNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SingleChildScrollViewNode>(map);
  }

  static SingleChildScrollViewNode fromJson(String json) {
    return ensureInitialized().decodeJson<SingleChildScrollViewNode>(json);
  }
}

mixin SingleChildScrollViewNodeMappable {
  String toJson() {
    return SingleChildScrollViewNodeMapper.ensureInitialized()
        .encodeJson<SingleChildScrollViewNode>(
            this as SingleChildScrollViewNode);
  }

  Map<String, dynamic> toMap() {
    return SingleChildScrollViewNodeMapper.ensureInitialized()
        .encodeMap<SingleChildScrollViewNode>(
            this as SingleChildScrollViewNode);
  }

  SingleChildScrollViewNodeCopyWith<SingleChildScrollViewNode,
          SingleChildScrollViewNode, SingleChildScrollViewNode>
      get copyWith => _SingleChildScrollViewNodeCopyWithImpl(
          this as SingleChildScrollViewNode, $identity, $identity);
  @override
  String toString() {
    return SingleChildScrollViewNodeMapper.ensureInitialized()
        .stringifyValue(this as SingleChildScrollViewNode);
  }

  @override
  bool operator ==(Object other) {
    return SingleChildScrollViewNodeMapper.ensureInitialized()
        .equalsValue(this as SingleChildScrollViewNode, other);
  }

  @override
  int get hashCode {
    return SingleChildScrollViewNodeMapper.ensureInitialized()
        .hashValue(this as SingleChildScrollViewNode);
  }
}

extension SingleChildScrollViewNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SingleChildScrollViewNode, $Out> {
  SingleChildScrollViewNodeCopyWith<$R, SingleChildScrollViewNode, $Out>
      get $asSingleChildScrollViewNode => $base
          .as((v, t, t2) => _SingleChildScrollViewNodeCopyWithImpl(v, t, t2));
}

abstract class SingleChildScrollViewNodeCopyWith<
    $R,
    $In extends SingleChildScrollViewNode,
    $Out> implements SCCopyWith<$R, $In, $Out> {
  EdgeInsetsValueCopyWith<$R, EdgeInsetsValue, EdgeInsetsValue>? get padding;
  @override
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get child;
  @override
  $R call({EdgeInsetsValue? padding, STreeNode? child});
  SingleChildScrollViewNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SingleChildScrollViewNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SingleChildScrollViewNode, $Out>
    implements
        SingleChildScrollViewNodeCopyWith<$R, SingleChildScrollViewNode, $Out> {
  _SingleChildScrollViewNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SingleChildScrollViewNode> $mapper =
      SingleChildScrollViewNodeMapper.ensureInitialized();
  @override
  EdgeInsetsValueCopyWith<$R, EdgeInsetsValue, EdgeInsetsValue>? get padding =>
      $value.padding?.copyWith.$chain((v) => call(padding: v));
  @override
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get child =>
      $value.child?.copyWith.$chain((v) => call(child: v));
  @override
  $R call({Object? padding = $none, Object? child = $none}) =>
      $apply(FieldCopyWithData({
        if (padding != $none) #padding: padding,
        if (child != $none) #child: child
      }));
  @override
  SingleChildScrollViewNode $make(CopyWithData data) =>
      SingleChildScrollViewNode(
          padding: data.get(#padding, or: $value.padding),
          child: data.get(#child, or: $value.child));

  @override
  SingleChildScrollViewNodeCopyWith<$R2, SingleChildScrollViewNode, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _SingleChildScrollViewNodeCopyWithImpl($value, $cast, t);
}
