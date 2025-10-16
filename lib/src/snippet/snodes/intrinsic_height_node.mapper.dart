// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'intrinsic_height_node.dart';

class IntrinsicHeightNodeMapper
    extends SubClassMapperBase<IntrinsicHeightNode> {
  IntrinsicHeightNodeMapper._();

  static IntrinsicHeightNodeMapper? _instance;
  static IntrinsicHeightNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = IntrinsicHeightNodeMapper._());
      SCMapper.ensureInitialized().addSubMapper(_instance!);
      SNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'IntrinsicHeightNode';

  static SNode? _$child(IntrinsicHeightNode v) => v.child;
  static const Field<IntrinsicHeightNode, SNode> _f$child = Field(
    'child',
    _$child,
    opt: true,
  );
  static String _$uid(IntrinsicHeightNode v) => v.uid;
  static const Field<IntrinsicHeightNode, String> _f$uid = Field(
    'uid',
    _$uid,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$treeNodeGK(
    IntrinsicHeightNode v,
  ) => v.treeNodeGK;
  static const Field<IntrinsicHeightNode, GlobalKey<State<StatefulWidget>>>
  _f$treeNodeGK = Field('treeNodeGK', _$treeNodeGK, mode: FieldMode.member);
  static bool _$isExpanded(IntrinsicHeightNode v) => v.isExpanded;
  static const Field<IntrinsicHeightNode, bool> _f$isExpanded = Field(
    'isExpanded',
    _$isExpanded,
    mode: FieldMode.member,
  );
  static bool? _$hidePropertiesWhileDragging(IntrinsicHeightNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<IntrinsicHeightNode, bool> _f$hidePropertiesWhileDragging =
      Field(
        'hidePropertiesWhileDragging',
        _$hidePropertiesWhileDragging,
        mode: FieldMode.member,
      );
  static bool _$canShowTappableNodeWidgetOverlay(IntrinsicHeightNode v) =>
      v.canShowTappableNodeWidgetOverlay;
  static const Field<IntrinsicHeightNode, bool>
  _f$canShowTappableNodeWidgetOverlay = Field(
    'canShowTappableNodeWidgetOverlay',
    _$canShowTappableNodeWidgetOverlay,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(
    IntrinsicHeightNode v,
  ) => v.nodeWidgetGK;
  static const Field<IntrinsicHeightNode, GlobalKey<State<StatefulWidget>>>
  _f$nodeWidgetGK = Field(
    'nodeWidgetGK',
    _$nodeWidgetGK,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<IntrinsicHeightNode> fields = const {
    #child: _f$child,
    #uid: _f$uid,
    #treeNodeGK: _f$treeNodeGK,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #canShowTappableNodeWidgetOverlay: _f$canShowTappableNodeWidgetOverlay,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'sc';
  @override
  final dynamic discriminatorValue = 'IntrinsicHeightNode';
  @override
  late final ClassMapperBase superMapper = SCMapper.ensureInitialized();

  static IntrinsicHeightNode _instantiate(DecodingData data) {
    return IntrinsicHeightNode(child: data.dec(_f$child));
  }

  @override
  final Function instantiate = _instantiate;

  static IntrinsicHeightNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<IntrinsicHeightNode>(map);
  }

  static IntrinsicHeightNode fromJson(String json) {
    return ensureInitialized().decodeJson<IntrinsicHeightNode>(json);
  }
}

mixin IntrinsicHeightNodeMappable {
  String toJson() {
    return IntrinsicHeightNodeMapper.ensureInitialized()
        .encodeJson<IntrinsicHeightNode>(this as IntrinsicHeightNode);
  }

  Map<String, dynamic> toMap() {
    return IntrinsicHeightNodeMapper.ensureInitialized()
        .encodeMap<IntrinsicHeightNode>(this as IntrinsicHeightNode);
  }

  IntrinsicHeightNodeCopyWith<
    IntrinsicHeightNode,
    IntrinsicHeightNode,
    IntrinsicHeightNode
  >
  get copyWith =>
      _IntrinsicHeightNodeCopyWithImpl<
        IntrinsicHeightNode,
        IntrinsicHeightNode
      >(this as IntrinsicHeightNode, $identity, $identity);
  @override
  String toString() {
    return IntrinsicHeightNodeMapper.ensureInitialized().stringifyValue(
      this as IntrinsicHeightNode,
    );
  }

  @override
  bool operator ==(Object other) {
    return IntrinsicHeightNodeMapper.ensureInitialized().equalsValue(
      this as IntrinsicHeightNode,
      other,
    );
  }

  @override
  int get hashCode {
    return IntrinsicHeightNodeMapper.ensureInitialized().hashValue(
      this as IntrinsicHeightNode,
    );
  }
}

extension IntrinsicHeightNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, IntrinsicHeightNode, $Out> {
  IntrinsicHeightNodeCopyWith<$R, IntrinsicHeightNode, $Out>
  get $asIntrinsicHeightNode => $base.as(
    (v, t, t2) => _IntrinsicHeightNodeCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class IntrinsicHeightNodeCopyWith<
  $R,
  $In extends IntrinsicHeightNode,
  $Out
>
    implements SCCopyWith<$R, $In, $Out> {
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child;
  @override
  $R call({SNode? child});
  IntrinsicHeightNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _IntrinsicHeightNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, IntrinsicHeightNode, $Out>
    implements IntrinsicHeightNodeCopyWith<$R, IntrinsicHeightNode, $Out> {
  _IntrinsicHeightNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<IntrinsicHeightNode> $mapper =
      IntrinsicHeightNodeMapper.ensureInitialized();
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child =>
      $value.child?.copyWith.$chain((v) => call(child: v));
  @override
  $R call({Object? child = $none}) =>
      $apply(FieldCopyWithData({if (child != $none) #child: child}));
  @override
  IntrinsicHeightNode $make(CopyWithData data) =>
      IntrinsicHeightNode(child: data.get(#child, or: $value.child));

  @override
  IntrinsicHeightNodeCopyWith<$R2, IntrinsicHeightNode, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _IntrinsicHeightNodeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

