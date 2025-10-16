// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'container_node.dart';

class ContainerNodeMapper extends SubClassMapperBase<ContainerNode> {
  ContainerNodeMapper._();

  static ContainerNodeMapper? _instance;
  static ContainerNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ContainerNodeMapper._());
      SCMapper.ensureInitialized().addSubMapper(_instance!);
      ContainerStylePropertiesMapper.ensureInitialized();
      SNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ContainerNode';

  static ContainerStyleProperties _$csPropGroup(ContainerNode v) =>
      v.csPropGroup;
  static const Field<ContainerNode, ContainerStyleProperties> _f$csPropGroup =
      Field('csPropGroup', _$csPropGroup, hook: ContainerStyleHook());
  static SNode? _$child(ContainerNode v) => v.child;
  static const Field<ContainerNode, SNode> _f$child = Field(
    'child',
    _$child,
    opt: true,
  );
  static String _$uid(ContainerNode v) => v.uid;
  static const Field<ContainerNode, String> _f$uid = Field(
    'uid',
    _$uid,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$treeNodeGK(ContainerNode v) =>
      v.treeNodeGK;
  static const Field<ContainerNode, GlobalKey<State<StatefulWidget>>>
  _f$treeNodeGK = Field('treeNodeGK', _$treeNodeGK, mode: FieldMode.member);
  static bool _$isExpanded(ContainerNode v) => v.isExpanded;
  static const Field<ContainerNode, bool> _f$isExpanded = Field(
    'isExpanded',
    _$isExpanded,
    mode: FieldMode.member,
  );
  static bool? _$hidePropertiesWhileDragging(ContainerNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<ContainerNode, bool> _f$hidePropertiesWhileDragging =
      Field(
        'hidePropertiesWhileDragging',
        _$hidePropertiesWhileDragging,
        mode: FieldMode.member,
      );
  static bool _$canShowTappableNodeWidgetOverlay(ContainerNode v) =>
      v.canShowTappableNodeWidgetOverlay;
  static const Field<ContainerNode, bool> _f$canShowTappableNodeWidgetOverlay =
      Field(
        'canShowTappableNodeWidgetOverlay',
        _$canShowTappableNodeWidgetOverlay,
        mode: FieldMode.member,
      );
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(ContainerNode v) =>
      v.nodeWidgetGK;
  static const Field<ContainerNode, GlobalKey<State<StatefulWidget>>>
  _f$nodeWidgetGK = Field(
    'nodeWidgetGK',
    _$nodeWidgetGK,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<ContainerNode> fields = const {
    #csPropGroup: _f$csPropGroup,
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
  final dynamic discriminatorValue = 'ContainerNode';
  @override
  late final ClassMapperBase superMapper = SCMapper.ensureInitialized();

  static ContainerNode _instantiate(DecodingData data) {
    return ContainerNode(
      csPropGroup: data.dec(_f$csPropGroup),
      child: data.dec(_f$child),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ContainerNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ContainerNode>(map);
  }

  static ContainerNode fromJson(String json) {
    return ensureInitialized().decodeJson<ContainerNode>(json);
  }
}

mixin ContainerNodeMappable {
  String toJson() {
    return ContainerNodeMapper.ensureInitialized().encodeJson<ContainerNode>(
      this as ContainerNode,
    );
  }

  Map<String, dynamic> toMap() {
    return ContainerNodeMapper.ensureInitialized().encodeMap<ContainerNode>(
      this as ContainerNode,
    );
  }

  ContainerNodeCopyWith<ContainerNode, ContainerNode, ContainerNode>
  get copyWith => _ContainerNodeCopyWithImpl<ContainerNode, ContainerNode>(
    this as ContainerNode,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return ContainerNodeMapper.ensureInitialized().stringifyValue(
      this as ContainerNode,
    );
  }

  @override
  bool operator ==(Object other) {
    return ContainerNodeMapper.ensureInitialized().equalsValue(
      this as ContainerNode,
      other,
    );
  }

  @override
  int get hashCode {
    return ContainerNodeMapper.ensureInitialized().hashValue(
      this as ContainerNode,
    );
  }
}

extension ContainerNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ContainerNode, $Out> {
  ContainerNodeCopyWith<$R, ContainerNode, $Out> get $asContainerNode =>
      $base.as((v, t, t2) => _ContainerNodeCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ContainerNodeCopyWith<$R, $In extends ContainerNode, $Out>
    implements SCCopyWith<$R, $In, $Out> {
  ContainerStylePropertiesCopyWith<
    $R,
    ContainerStyleProperties,
    ContainerStyleProperties
  >
  get csPropGroup;
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child;
  @override
  $R call({ContainerStyleProperties? csPropGroup, SNode? child});
  ContainerNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ContainerNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ContainerNode, $Out>
    implements ContainerNodeCopyWith<$R, ContainerNode, $Out> {
  _ContainerNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ContainerNode> $mapper =
      ContainerNodeMapper.ensureInitialized();
  @override
  ContainerStylePropertiesCopyWith<
    $R,
    ContainerStyleProperties,
    ContainerStyleProperties
  >
  get csPropGroup =>
      $value.csPropGroup.copyWith.$chain((v) => call(csPropGroup: v));
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child =>
      $value.child?.copyWith.$chain((v) => call(child: v));
  @override
  $R call({ContainerStyleProperties? csPropGroup, Object? child = $none}) =>
      $apply(
        FieldCopyWithData({
          if (csPropGroup != null) #csPropGroup: csPropGroup,
          if (child != $none) #child: child,
        }),
      );
  @override
  ContainerNode $make(CopyWithData data) => ContainerNode(
    csPropGroup: data.get(#csPropGroup, or: $value.csPropGroup),
    child: data.get(#child, or: $value.child),
  );

  @override
  ContainerNodeCopyWith<$R2, ContainerNode, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ContainerNodeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

