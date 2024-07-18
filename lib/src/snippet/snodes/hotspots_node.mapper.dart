// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'hotspots_node.dart';

class HotspotsNodeMapper extends SubClassMapperBase<HotspotsNode> {
  HotspotsNodeMapper._();

  static HotspotsNodeMapper? _instance;
  static HotspotsNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HotspotsNodeMapper._());
      SCMapper.ensureInitialized().addSubMapper(_instance!);
      TargetModelMapper.ensureInitialized();
      STreeNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'HotspotsNode';

  static double? _$aspectRatio(HotspotsNode v) => v.aspectRatio;
  static const Field<HotspotsNode, double> _f$aspectRatio =
      Field('aspectRatio', _$aspectRatio, opt: true);
  static List<TargetModel> _$targets(HotspotsNode v) => v.targets;
  static const Field<HotspotsNode, List<TargetModel>> _f$targets =
      Field('targets', _$targets, opt: true, def: const []);
  static List<TargetModel> _$playList(HotspotsNode v) => v.playList;
  static const Field<HotspotsNode, List<TargetModel>> _f$playList =
      Field('playList', _$playList, opt: true, def: const []);
  static STreeNode? _$child(HotspotsNode v) => v.child;
  static const Field<HotspotsNode, STreeNode> _f$child =
      Field('child', _$child, opt: true);
  static String _$uid(HotspotsNode v) => v.uid;
  static const Field<HotspotsNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static bool _$isExpanded(HotspotsNode v) => v.isExpanded;
  static const Field<HotspotsNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(HotspotsNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<HotspotsNode, bool> _f$hidePropertiesWhileDragging = Field(
      'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
      mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(HotspotsNode v) =>
      v.nodeWidgetGK;
  static const Field<HotspotsNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<HotspotsNode> fields = const {
    #aspectRatio: _f$aspectRatio,
    #targets: _f$targets,
    #playList: _f$playList,
    #child: _f$child,
    #uid: _f$uid,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'sc';
  @override
  final dynamic discriminatorValue = 'HotspotsNode';
  @override
  late final ClassMapperBase superMapper = SCMapper.ensureInitialized();

  static HotspotsNode _instantiate(DecodingData data) {
    return HotspotsNode(
        aspectRatio: data.dec(_f$aspectRatio),
        targets: data.dec(_f$targets),
        playList: data.dec(_f$playList),
        child: data.dec(_f$child));
  }

  @override
  final Function instantiate = _instantiate;

  static HotspotsNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HotspotsNode>(map);
  }

  static HotspotsNode fromJson(String json) {
    return ensureInitialized().decodeJson<HotspotsNode>(json);
  }
}

mixin HotspotsNodeMappable {
  String toJson() {
    return HotspotsNodeMapper.ensureInitialized()
        .encodeJson<HotspotsNode>(this as HotspotsNode);
  }

  Map<String, dynamic> toMap() {
    return HotspotsNodeMapper.ensureInitialized()
        .encodeMap<HotspotsNode>(this as HotspotsNode);
  }

  HotspotsNodeCopyWith<HotspotsNode, HotspotsNode, HotspotsNode> get copyWith =>
      _HotspotsNodeCopyWithImpl(this as HotspotsNode, $identity, $identity);
  @override
  String toString() {
    return HotspotsNodeMapper.ensureInitialized()
        .stringifyValue(this as HotspotsNode);
  }

  @override
  bool operator ==(Object other) {
    return HotspotsNodeMapper.ensureInitialized()
        .equalsValue(this as HotspotsNode, other);
  }

  @override
  int get hashCode {
    return HotspotsNodeMapper.ensureInitialized()
        .hashValue(this as HotspotsNode);
  }
}

extension HotspotsNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HotspotsNode, $Out> {
  HotspotsNodeCopyWith<$R, HotspotsNode, $Out> get $asHotspotsNode =>
      $base.as((v, t, t2) => _HotspotsNodeCopyWithImpl(v, t, t2));
}

abstract class HotspotsNodeCopyWith<$R, $In extends HotspotsNode, $Out>
    implements SCCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, TargetModel,
      TargetModelCopyWith<$R, TargetModel, TargetModel>> get targets;
  ListCopyWith<$R, TargetModel,
      TargetModelCopyWith<$R, TargetModel, TargetModel>> get playList;
  @override
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get child;
  @override
  $R call(
      {double? aspectRatio,
      List<TargetModel>? targets,
      List<TargetModel>? playList,
      STreeNode? child});
  HotspotsNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _HotspotsNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HotspotsNode, $Out>
    implements HotspotsNodeCopyWith<$R, HotspotsNode, $Out> {
  _HotspotsNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HotspotsNode> $mapper =
      HotspotsNodeMapper.ensureInitialized();
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
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get child =>
      $value.child?.copyWith.$chain((v) => call(child: v));
  @override
  $R call(
          {Object? aspectRatio = $none,
          List<TargetModel>? targets,
          List<TargetModel>? playList,
          Object? child = $none}) =>
      $apply(FieldCopyWithData({
        if (aspectRatio != $none) #aspectRatio: aspectRatio,
        if (targets != null) #targets: targets,
        if (playList != null) #playList: playList,
        if (child != $none) #child: child
      }));
  @override
  HotspotsNode $make(CopyWithData data) => HotspotsNode(
      aspectRatio: data.get(#aspectRatio, or: $value.aspectRatio),
      targets: data.get(#targets, or: $value.targets),
      playList: data.get(#playList, or: $value.playList),
      child: data.get(#child, or: $value.child));

  @override
  HotspotsNodeCopyWith<$R2, HotspotsNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _HotspotsNodeCopyWithImpl($value, $cast, t);
}
