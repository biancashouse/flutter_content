// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'hotspots_node.dart';

class TargetsWrapperNodeMapper extends SubClassMapperBase<TargetsWrapperNode> {
  TargetsWrapperNodeMapper._();

  static TargetsWrapperNodeMapper? _instance;
  static TargetsWrapperNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TargetsWrapperNodeMapper._());
      SCMapper.ensureInitialized().addSubMapper(_instance!);
      TargetModelMapper.ensureInitialized();
      SNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TargetsWrapperNode';

  static double? _$aspectRatio(TargetsWrapperNode v) => v.aspectRatio;
  static const Field<TargetsWrapperNode, double> _f$aspectRatio =
      Field('aspectRatio', _$aspectRatio, opt: true);
  static double? _$width(TargetsWrapperNode v) => v.width;
  static const Field<TargetsWrapperNode, double> _f$width =
      Field('width', _$width, opt: true);
  static double? _$height(TargetsWrapperNode v) => v.height;
  static const Field<TargetsWrapperNode, double> _f$height =
      Field('height', _$height, opt: true);
  static double _$borderRadius(TargetsWrapperNode v) => v.borderRadius;
  static const Field<TargetsWrapperNode, double> _f$borderRadius =
      Field('borderRadius', _$borderRadius, opt: true, def: 0);
  static List<TargetModel> _$targets(TargetsWrapperNode v) => v.targets;
  static const Field<TargetsWrapperNode, List<TargetModel>> _f$targets =
      Field('targets', _$targets, opt: true, def: const []);
  static List<TargetModel> _$playList(TargetsWrapperNode v) => v.playList;
  static const Field<TargetsWrapperNode, List<TargetModel>> _f$playList =
      Field('playList', _$playList, opt: true, def: const []);
  static SNode? _$child(TargetsWrapperNode v) => v.child;
  static const Field<TargetsWrapperNode, SNode> _f$child =
      Field('child', _$child, opt: true);
  static String _$uid(TargetsWrapperNode v) => v.uid;
  static const Field<TargetsWrapperNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$treeNodeGK(TargetsWrapperNode v) =>
      v.treeNodeGK;
  static const Field<TargetsWrapperNode, GlobalKey<State<StatefulWidget>>>
      _f$treeNodeGK = Field('treeNodeGK', _$treeNodeGK, mode: FieldMode.member);
  static bool _$isExpanded(TargetsWrapperNode v) => v.isExpanded;
  static const Field<TargetsWrapperNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(TargetsWrapperNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<TargetsWrapperNode, bool> _f$hidePropertiesWhileDragging =
      Field('hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
          mode: FieldMode.member);

  @override
  final MappableFields<TargetsWrapperNode> fields = const {
    #aspectRatio: _f$aspectRatio,
    #width: _f$width,
    #height: _f$height,
    #borderRadius: _f$borderRadius,
    #targets: _f$targets,
    #playList: _f$playList,
    #child: _f$child,
    #uid: _f$uid,
    #treeNodeGK: _f$treeNodeGK,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
  };

  @override
  final String discriminatorKey = 'sc';
  @override
  final dynamic discriminatorValue = 'TargetsWrapperNode';
  @override
  late final ClassMapperBase superMapper = SCMapper.ensureInitialized();

  static TargetsWrapperNode _instantiate(DecodingData data) {
    return TargetsWrapperNode(
        aspectRatio: data.dec(_f$aspectRatio),
        width: data.dec(_f$width),
        height: data.dec(_f$height),
        borderRadius: data.dec(_f$borderRadius),
        targets: data.dec(_f$targets),
        playList: data.dec(_f$playList),
        child: data.dec(_f$child));
  }

  @override
  final Function instantiate = _instantiate;

  static TargetsWrapperNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TargetsWrapperNode>(map);
  }

  static TargetsWrapperNode fromJson(String json) {
    return ensureInitialized().decodeJson<TargetsWrapperNode>(json);
  }
}

mixin TargetsWrapperNodeMappable {
  String toJson() {
    return TargetsWrapperNodeMapper.ensureInitialized()
        .encodeJson<TargetsWrapperNode>(this as TargetsWrapperNode);
  }

  Map<String, dynamic> toMap() {
    return TargetsWrapperNodeMapper.ensureInitialized()
        .encodeMap<TargetsWrapperNode>(this as TargetsWrapperNode);
  }

  TargetsWrapperNodeCopyWith<TargetsWrapperNode, TargetsWrapperNode,
          TargetsWrapperNode>
      get copyWith => _TargetsWrapperNodeCopyWithImpl<TargetsWrapperNode,
          TargetsWrapperNode>(this as TargetsWrapperNode, $identity, $identity);
  @override
  String toString() {
    return TargetsWrapperNodeMapper.ensureInitialized()
        .stringifyValue(this as TargetsWrapperNode);
  }

  @override
  bool operator ==(Object other) {
    return TargetsWrapperNodeMapper.ensureInitialized()
        .equalsValue(this as TargetsWrapperNode, other);
  }

  @override
  int get hashCode {
    return TargetsWrapperNodeMapper.ensureInitialized()
        .hashValue(this as TargetsWrapperNode);
  }
}

extension TargetsWrapperNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TargetsWrapperNode, $Out> {
  TargetsWrapperNodeCopyWith<$R, TargetsWrapperNode, $Out>
      get $asTargetsWrapperNode => $base.as(
          (v, t, t2) => _TargetsWrapperNodeCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TargetsWrapperNodeCopyWith<$R, $In extends TargetsWrapperNode,
    $Out> implements SCCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, TargetModel,
      TargetModelCopyWith<$R, TargetModel, TargetModel>> get targets;
  ListCopyWith<$R, TargetModel,
      TargetModelCopyWith<$R, TargetModel, TargetModel>> get playList;
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child;
  @override
  $R call(
      {double? aspectRatio,
      double? width,
      double? height,
      double? borderRadius,
      List<TargetModel>? targets,
      List<TargetModel>? playList,
      SNode? child});
  TargetsWrapperNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TargetsWrapperNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TargetsWrapperNode, $Out>
    implements TargetsWrapperNodeCopyWith<$R, TargetsWrapperNode, $Out> {
  _TargetsWrapperNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TargetsWrapperNode> $mapper =
      TargetsWrapperNodeMapper.ensureInitialized();
  @override
  ListCopyWith<$R, TargetModel,
          TargetModelCopyWith<$R, TargetModel, TargetModel>>
      get targets => ListCopyWith($value.targets,
          (v, t) => v.copyWith.$chain(t), (v) => call(targets: v));
  @override
  ListCopyWith<$R, TargetModel,
          TargetModelCopyWith<$R, TargetModel, TargetModel>>
      get playList => ListCopyWith($value.playList,
          (v, t) => v.copyWith.$chain(t), (v) => call(playList: v));
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child =>
      $value.child?.copyWith.$chain((v) => call(child: v));
  @override
  $R call(
          {Object? aspectRatio = $none,
          Object? width = $none,
          Object? height = $none,
          double? borderRadius,
          List<TargetModel>? targets,
          List<TargetModel>? playList,
          Object? child = $none}) =>
      $apply(FieldCopyWithData({
        if (aspectRatio != $none) #aspectRatio: aspectRatio,
        if (width != $none) #width: width,
        if (height != $none) #height: height,
        if (borderRadius != null) #borderRadius: borderRadius,
        if (targets != null) #targets: targets,
        if (playList != null) #playList: playList,
        if (child != $none) #child: child
      }));
  @override
  TargetsWrapperNode $make(CopyWithData data) => TargetsWrapperNode(
      aspectRatio: data.get(#aspectRatio, or: $value.aspectRatio),
      width: data.get(#width, or: $value.width),
      height: data.get(#height, or: $value.height),
      borderRadius: data.get(#borderRadius, or: $value.borderRadius),
      targets: data.get(#targets, or: $value.targets),
      playList: data.get(#playList, or: $value.playList),
      child: data.get(#child, or: $value.child));

  @override
  TargetsWrapperNodeCopyWith<$R2, TargetsWrapperNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TargetsWrapperNodeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
