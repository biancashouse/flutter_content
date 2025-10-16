// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'sliver_to_box_adapter_node.dart';

class SliverToBoxAdapterNodeMapper
    extends SubClassMapperBase<SliverToBoxAdapterNode> {
  SliverToBoxAdapterNodeMapper._();

  static SliverToBoxAdapterNodeMapper? _instance;
  static SliverToBoxAdapterNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SliverToBoxAdapterNodeMapper._());
      SCMapper.ensureInitialized().addSubMapper(_instance!);
      SNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SliverToBoxAdapterNode';

  static SNode? _$child(SliverToBoxAdapterNode v) => v.child;
  static const Field<SliverToBoxAdapterNode, SNode> _f$child = Field(
    'child',
    _$child,
    opt: true,
  );
  static String _$uid(SliverToBoxAdapterNode v) => v.uid;
  static const Field<SliverToBoxAdapterNode, String> _f$uid = Field(
    'uid',
    _$uid,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$treeNodeGK(
    SliverToBoxAdapterNode v,
  ) => v.treeNodeGK;
  static const Field<SliverToBoxAdapterNode, GlobalKey<State<StatefulWidget>>>
  _f$treeNodeGK = Field('treeNodeGK', _$treeNodeGK, mode: FieldMode.member);
  static bool _$isExpanded(SliverToBoxAdapterNode v) => v.isExpanded;
  static const Field<SliverToBoxAdapterNode, bool> _f$isExpanded = Field(
    'isExpanded',
    _$isExpanded,
    mode: FieldMode.member,
  );
  static bool? _$hidePropertiesWhileDragging(SliverToBoxAdapterNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<SliverToBoxAdapterNode, bool>
  _f$hidePropertiesWhileDragging = Field(
    'hidePropertiesWhileDragging',
    _$hidePropertiesWhileDragging,
    mode: FieldMode.member,
  );
  static bool _$canShowTappableNodeWidgetOverlay(SliverToBoxAdapterNode v) =>
      v.canShowTappableNodeWidgetOverlay;
  static const Field<SliverToBoxAdapterNode, bool>
  _f$canShowTappableNodeWidgetOverlay = Field(
    'canShowTappableNodeWidgetOverlay',
    _$canShowTappableNodeWidgetOverlay,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(
    SliverToBoxAdapterNode v,
  ) => v.nodeWidgetGK;
  static const Field<SliverToBoxAdapterNode, GlobalKey<State<StatefulWidget>>>
  _f$nodeWidgetGK = Field(
    'nodeWidgetGK',
    _$nodeWidgetGK,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<SliverToBoxAdapterNode> fields = const {
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
  final dynamic discriminatorValue = 'SliverToBoxAdapterNode';
  @override
  late final ClassMapperBase superMapper = SCMapper.ensureInitialized();

  static SliverToBoxAdapterNode _instantiate(DecodingData data) {
    return SliverToBoxAdapterNode(child: data.dec(_f$child));
  }

  @override
  final Function instantiate = _instantiate;

  static SliverToBoxAdapterNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SliverToBoxAdapterNode>(map);
  }

  static SliverToBoxAdapterNode fromJson(String json) {
    return ensureInitialized().decodeJson<SliverToBoxAdapterNode>(json);
  }
}

mixin SliverToBoxAdapterNodeMappable {
  String toJson() {
    return SliverToBoxAdapterNodeMapper.ensureInitialized()
        .encodeJson<SliverToBoxAdapterNode>(this as SliverToBoxAdapterNode);
  }

  Map<String, dynamic> toMap() {
    return SliverToBoxAdapterNodeMapper.ensureInitialized()
        .encodeMap<SliverToBoxAdapterNode>(this as SliverToBoxAdapterNode);
  }

  SliverToBoxAdapterNodeCopyWith<
    SliverToBoxAdapterNode,
    SliverToBoxAdapterNode,
    SliverToBoxAdapterNode
  >
  get copyWith =>
      _SliverToBoxAdapterNodeCopyWithImpl<
        SliverToBoxAdapterNode,
        SliverToBoxAdapterNode
      >(this as SliverToBoxAdapterNode, $identity, $identity);
  @override
  String toString() {
    return SliverToBoxAdapterNodeMapper.ensureInitialized().stringifyValue(
      this as SliverToBoxAdapterNode,
    );
  }

  @override
  bool operator ==(Object other) {
    return SliverToBoxAdapterNodeMapper.ensureInitialized().equalsValue(
      this as SliverToBoxAdapterNode,
      other,
    );
  }

  @override
  int get hashCode {
    return SliverToBoxAdapterNodeMapper.ensureInitialized().hashValue(
      this as SliverToBoxAdapterNode,
    );
  }
}

extension SliverToBoxAdapterNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SliverToBoxAdapterNode, $Out> {
  SliverToBoxAdapterNodeCopyWith<$R, SliverToBoxAdapterNode, $Out>
  get $asSliverToBoxAdapterNode => $base.as(
    (v, t, t2) => _SliverToBoxAdapterNodeCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class SliverToBoxAdapterNodeCopyWith<
  $R,
  $In extends SliverToBoxAdapterNode,
  $Out
>
    implements SCCopyWith<$R, $In, $Out> {
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child;
  @override
  $R call({SNode? child});
  SliverToBoxAdapterNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SliverToBoxAdapterNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SliverToBoxAdapterNode, $Out>
    implements
        SliverToBoxAdapterNodeCopyWith<$R, SliverToBoxAdapterNode, $Out> {
  _SliverToBoxAdapterNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SliverToBoxAdapterNode> $mapper =
      SliverToBoxAdapterNodeMapper.ensureInitialized();
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child =>
      $value.child?.copyWith.$chain((v) => call(child: v));
  @override
  $R call({Object? child = $none}) =>
      $apply(FieldCopyWithData({if (child != $none) #child: child}));
  @override
  SliverToBoxAdapterNode $make(CopyWithData data) =>
      SliverToBoxAdapterNode(child: data.get(#child, or: $value.child));

  @override
  SliverToBoxAdapterNodeCopyWith<$R2, SliverToBoxAdapterNode, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SliverToBoxAdapterNodeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

