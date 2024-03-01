// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'aspect_ratio_node.dart';

class AspectRatioNodeMapper extends SubClassMapperBase<AspectRatioNode> {
  AspectRatioNodeMapper._();

  static AspectRatioNodeMapper? _instance;
  static AspectRatioNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AspectRatioNodeMapper._());
      SCMapper.ensureInitialized().addSubMapper(_instance!);
      STreeNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AspectRatioNode';

  static double _$aspectRatio(AspectRatioNode v) => v.aspectRatio;
  static const Field<AspectRatioNode, double> _f$aspectRatio =
      Field('aspectRatio', _$aspectRatio, opt: true, def: 1.0);
  static STreeNode? _$child(AspectRatioNode v) => v.child;
  static const Field<AspectRatioNode, STreeNode> _f$child =
      Field('child', _$child, opt: true);
  static bool _$isExpanded(AspectRatioNode v) => v.isExpanded;
  static const Field<AspectRatioNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static PTreeNodeTreeController? _$pTreeC(AspectRatioNode v) => v.pTreeC;
  static const Field<AspectRatioNode, PTreeNodeTreeController> _f$pTreeC =
      Field('pTreeC', _$pTreeC, mode: FieldMode.member);
  static double? _$propertiesPaneScrollPos(AspectRatioNode v) =>
      v.propertiesPaneScrollPos;
  static const Field<AspectRatioNode, double> _f$propertiesPaneScrollPos =
      Field('propertiesPaneScrollPos', _$propertiesPaneScrollPos,
          mode: FieldMode.member);
  static ScrollController? _$propertiesPaneSC(AspectRatioNode v) =>
      v.propertiesPaneSC;
  static const Field<AspectRatioNode, ScrollController> _f$propertiesPaneSC =
      Field('propertiesPaneSC', _$propertiesPaneSC, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(AspectRatioNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<AspectRatioNode, bool> _f$hidePropertiesWhileDragging =
      Field('hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
          mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(AspectRatioNode v) =>
      v.nodeWidgetGK;
  static const Field<AspectRatioNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<AspectRatioNode> fields = const {
    #aspectRatio: _f$aspectRatio,
    #child: _f$child,
    #isExpanded: _f$isExpanded,
    #pTreeC: _f$pTreeC,
    #propertiesPaneScrollPos: _f$propertiesPaneScrollPos,
    #propertiesPaneSC: _f$propertiesPaneSC,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'sc';
  @override
  final dynamic discriminatorValue = 'AspectRatioNode';
  @override
  late final ClassMapperBase superMapper = SCMapper.ensureInitialized();

  static AspectRatioNode _instantiate(DecodingData data) {
    return AspectRatioNode(
        aspectRatio: data.dec(_f$aspectRatio), child: data.dec(_f$child));
  }

  @override
  final Function instantiate = _instantiate;

  static AspectRatioNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AspectRatioNode>(map);
  }

  static AspectRatioNode fromJson(String json) {
    return ensureInitialized().decodeJson<AspectRatioNode>(json);
  }
}

mixin AspectRatioNodeMappable {
  String toJson() {
    return AspectRatioNodeMapper.ensureInitialized()
        .encodeJson<AspectRatioNode>(this as AspectRatioNode);
  }

  Map<String, dynamic> toMap() {
    return AspectRatioNodeMapper.ensureInitialized()
        .encodeMap<AspectRatioNode>(this as AspectRatioNode);
  }

  AspectRatioNodeCopyWith<AspectRatioNode, AspectRatioNode, AspectRatioNode>
      get copyWith => _AspectRatioNodeCopyWithImpl(
          this as AspectRatioNode, $identity, $identity);
  @override
  String toString() {
    return AspectRatioNodeMapper.ensureInitialized()
        .stringifyValue(this as AspectRatioNode);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AspectRatioNodeMapper.ensureInitialized()
                .isValueEqual(this as AspectRatioNode, other));
  }

  @override
  int get hashCode {
    return AspectRatioNodeMapper.ensureInitialized()
        .hashValue(this as AspectRatioNode);
  }
}

extension AspectRatioNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AspectRatioNode, $Out> {
  AspectRatioNodeCopyWith<$R, AspectRatioNode, $Out> get $asAspectRatioNode =>
      $base.as((v, t, t2) => _AspectRatioNodeCopyWithImpl(v, t, t2));
}

abstract class AspectRatioNodeCopyWith<$R, $In extends AspectRatioNode, $Out>
    implements SCCopyWith<$R, $In, $Out> {
  @override
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get child;
  @override
  $R call({double? aspectRatio, STreeNode? child});
  AspectRatioNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AspectRatioNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AspectRatioNode, $Out>
    implements AspectRatioNodeCopyWith<$R, AspectRatioNode, $Out> {
  _AspectRatioNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AspectRatioNode> $mapper =
      AspectRatioNodeMapper.ensureInitialized();
  @override
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get child =>
      $value.child?.copyWith.$chain((v) => call(child: v));
  @override
  $R call({double? aspectRatio, Object? child = $none}) =>
      $apply(FieldCopyWithData({
        if (aspectRatio != null) #aspectRatio: aspectRatio,
        if (child != $none) #child: child
      }));
  @override
  AspectRatioNode $make(CopyWithData data) => AspectRatioNode(
      aspectRatio: data.get(#aspectRatio, or: $value.aspectRatio),
      child: data.get(#child, or: $value.child));

  @override
  AspectRatioNodeCopyWith<$R2, AspectRatioNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AspectRatioNodeCopyWithImpl($value, $cast, t);
}
