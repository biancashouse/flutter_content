// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'intrinsic_width_node.dart';

class IntrinsicWidthNodeMapper extends SubClassMapperBase<IntrinsicWidthNode> {
  IntrinsicWidthNodeMapper._();

  static IntrinsicWidthNodeMapper? _instance;
  static IntrinsicWidthNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = IntrinsicWidthNodeMapper._());
      SCMapper.ensureInitialized().addSubMapper(_instance!);
      SNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'IntrinsicWidthNode';

  static SNode? _$child(IntrinsicWidthNode v) => v.child;
  static const Field<IntrinsicWidthNode, SNode> _f$child = Field(
    'child',
    _$child,
    opt: true,
  );
  static String _$uid(IntrinsicWidthNode v) => v.uid;
  static const Field<IntrinsicWidthNode, String> _f$uid = Field(
    'uid',
    _$uid,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$treeNodeGK(IntrinsicWidthNode v) =>
      v.treeNodeGK;
  static const Field<IntrinsicWidthNode, GlobalKey<State<StatefulWidget>>>
  _f$treeNodeGK = Field('treeNodeGK', _$treeNodeGK, mode: FieldMode.member);
  static bool _$isExpanded(IntrinsicWidthNode v) => v.isExpanded;
  static const Field<IntrinsicWidthNode, bool> _f$isExpanded = Field(
    'isExpanded',
    _$isExpanded,
    mode: FieldMode.member,
  );
  static bool? _$hidePropertiesWhileDragging(IntrinsicWidthNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<IntrinsicWidthNode, bool> _f$hidePropertiesWhileDragging =
      Field(
        'hidePropertiesWhileDragging',
        _$hidePropertiesWhileDragging,
        mode: FieldMode.member,
      );
  static bool _$canShowTappableNodeWidgetOverlay(IntrinsicWidthNode v) =>
      v.canShowTappableNodeWidgetOverlay;
  static const Field<IntrinsicWidthNode, bool>
  _f$canShowTappableNodeWidgetOverlay = Field(
    'canShowTappableNodeWidgetOverlay',
    _$canShowTappableNodeWidgetOverlay,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(
    IntrinsicWidthNode v,
  ) => v.nodeWidgetGK;
  static const Field<IntrinsicWidthNode, GlobalKey<State<StatefulWidget>>>
  _f$nodeWidgetGK = Field(
    'nodeWidgetGK',
    _$nodeWidgetGK,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<IntrinsicWidthNode> fields = const {
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
  final dynamic discriminatorValue = 'IntrinsicWidthNode';
  @override
  late final ClassMapperBase superMapper = SCMapper.ensureInitialized();

  static IntrinsicWidthNode _instantiate(DecodingData data) {
    return IntrinsicWidthNode(child: data.dec(_f$child));
  }

  @override
  final Function instantiate = _instantiate;

  static IntrinsicWidthNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<IntrinsicWidthNode>(map);
  }

  static IntrinsicWidthNode fromJson(String json) {
    return ensureInitialized().decodeJson<IntrinsicWidthNode>(json);
  }
}

mixin IntrinsicWidthNodeMappable {
  String toJson() {
    return IntrinsicWidthNodeMapper.ensureInitialized()
        .encodeJson<IntrinsicWidthNode>(this as IntrinsicWidthNode);
  }

  Map<String, dynamic> toMap() {
    return IntrinsicWidthNodeMapper.ensureInitialized()
        .encodeMap<IntrinsicWidthNode>(this as IntrinsicWidthNode);
  }

  IntrinsicWidthNodeCopyWith<
    IntrinsicWidthNode,
    IntrinsicWidthNode,
    IntrinsicWidthNode
  >
  get copyWith =>
      _IntrinsicWidthNodeCopyWithImpl<IntrinsicWidthNode, IntrinsicWidthNode>(
        this as IntrinsicWidthNode,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return IntrinsicWidthNodeMapper.ensureInitialized().stringifyValue(
      this as IntrinsicWidthNode,
    );
  }

  @override
  bool operator ==(Object other) {
    return IntrinsicWidthNodeMapper.ensureInitialized().equalsValue(
      this as IntrinsicWidthNode,
      other,
    );
  }

  @override
  int get hashCode {
    return IntrinsicWidthNodeMapper.ensureInitialized().hashValue(
      this as IntrinsicWidthNode,
    );
  }
}

extension IntrinsicWidthNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, IntrinsicWidthNode, $Out> {
  IntrinsicWidthNodeCopyWith<$R, IntrinsicWidthNode, $Out>
  get $asIntrinsicWidthNode => $base.as(
    (v, t, t2) => _IntrinsicWidthNodeCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class IntrinsicWidthNodeCopyWith<
  $R,
  $In extends IntrinsicWidthNode,
  $Out
>
    implements SCCopyWith<$R, $In, $Out> {
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child;
  @override
  $R call({SNode? child});
  IntrinsicWidthNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _IntrinsicWidthNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, IntrinsicWidthNode, $Out>
    implements IntrinsicWidthNodeCopyWith<$R, IntrinsicWidthNode, $Out> {
  _IntrinsicWidthNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<IntrinsicWidthNode> $mapper =
      IntrinsicWidthNodeMapper.ensureInitialized();
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child =>
      $value.child?.copyWith.$chain((v) => call(child: v));
  @override
  $R call({Object? child = $none}) =>
      $apply(FieldCopyWithData({if (child != $none) #child: child}));
  @override
  IntrinsicWidthNode $make(CopyWithData data) =>
      IntrinsicWidthNode(child: data.get(#child, or: $value.child));

  @override
  IntrinsicWidthNodeCopyWith<$R2, IntrinsicWidthNode, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _IntrinsicWidthNodeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

