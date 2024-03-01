// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'target_wrapper_node.dart';

class TargetWrapperNodeMapper extends SubClassMapperBase<TargetWrapperNode> {
  TargetWrapperNodeMapper._();

  static TargetWrapperNodeMapper? _instance;
  static TargetWrapperNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TargetWrapperNodeMapper._());
      SCMapper.ensureInitialized().addSubMapper(_instance!);
      STreeNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TargetWrapperNode';

  static String _$snippetName(TargetWrapperNode v) => v.snippetName;
  static const Field<TargetWrapperNode, String> _f$snippetName =
      Field('snippetName', _$snippetName);
  static STreeNode? _$child(TargetWrapperNode v) => v.child;
  static const Field<TargetWrapperNode, STreeNode> _f$child =
      Field('child', _$child, opt: true);
  static bool _$isExpanded(TargetWrapperNode v) => v.isExpanded;
  static const Field<TargetWrapperNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static PTreeNodeTreeController? _$pTreeC(TargetWrapperNode v) => v.pTreeC;
  static const Field<TargetWrapperNode, PTreeNodeTreeController> _f$pTreeC =
      Field('pTreeC', _$pTreeC, mode: FieldMode.member);
  static double? _$propertiesPaneScrollPos(TargetWrapperNode v) =>
      v.propertiesPaneScrollPos;
  static const Field<TargetWrapperNode, double> _f$propertiesPaneScrollPos =
      Field('propertiesPaneScrollPos', _$propertiesPaneScrollPos,
          mode: FieldMode.member);
  static ScrollController? _$propertiesPaneSC(TargetWrapperNode v) =>
      v.propertiesPaneSC;
  static const Field<TargetWrapperNode, ScrollController> _f$propertiesPaneSC =
      Field('propertiesPaneSC', _$propertiesPaneSC, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(TargetWrapperNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<TargetWrapperNode, bool> _f$hidePropertiesWhileDragging =
      Field('hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
          mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(
          TargetWrapperNode v) =>
      v.nodeWidgetGK;
  static const Field<TargetWrapperNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<TargetWrapperNode> fields = const {
    #snippetName: _f$snippetName,
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
  final dynamic discriminatorValue = 'TargetWrapperNode';
  @override
  late final ClassMapperBase superMapper = SCMapper.ensureInitialized();

  static TargetWrapperNode _instantiate(DecodingData data) {
    return TargetWrapperNode(
        snippetName: data.dec(_f$snippetName), child: data.dec(_f$child));
  }

  @override
  final Function instantiate = _instantiate;

  static TargetWrapperNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TargetWrapperNode>(map);
  }

  static TargetWrapperNode fromJson(String json) {
    return ensureInitialized().decodeJson<TargetWrapperNode>(json);
  }
}

mixin TargetWrapperNodeMappable {
  String toJson() {
    return TargetWrapperNodeMapper.ensureInitialized()
        .encodeJson<TargetWrapperNode>(this as TargetWrapperNode);
  }

  Map<String, dynamic> toMap() {
    return TargetWrapperNodeMapper.ensureInitialized()
        .encodeMap<TargetWrapperNode>(this as TargetWrapperNode);
  }

  TargetWrapperNodeCopyWith<TargetWrapperNode, TargetWrapperNode,
          TargetWrapperNode>
      get copyWith => _TargetWrapperNodeCopyWithImpl(
          this as TargetWrapperNode, $identity, $identity);
  @override
  String toString() {
    return TargetWrapperNodeMapper.ensureInitialized()
        .stringifyValue(this as TargetWrapperNode);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            TargetWrapperNodeMapper.ensureInitialized()
                .isValueEqual(this as TargetWrapperNode, other));
  }

  @override
  int get hashCode {
    return TargetWrapperNodeMapper.ensureInitialized()
        .hashValue(this as TargetWrapperNode);
  }
}

extension TargetWrapperNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TargetWrapperNode, $Out> {
  TargetWrapperNodeCopyWith<$R, TargetWrapperNode, $Out>
      get $asTargetWrapperNode =>
          $base.as((v, t, t2) => _TargetWrapperNodeCopyWithImpl(v, t, t2));
}

abstract class TargetWrapperNodeCopyWith<$R, $In extends TargetWrapperNode,
    $Out> implements SCCopyWith<$R, $In, $Out> {
  @override
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get child;
  @override
  $R call({String? snippetName, STreeNode? child});
  TargetWrapperNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TargetWrapperNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TargetWrapperNode, $Out>
    implements TargetWrapperNodeCopyWith<$R, TargetWrapperNode, $Out> {
  _TargetWrapperNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TargetWrapperNode> $mapper =
      TargetWrapperNodeMapper.ensureInitialized();
  @override
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get child =>
      $value.child?.copyWith.$chain((v) => call(child: v));
  @override
  $R call({String? snippetName, Object? child = $none}) =>
      $apply(FieldCopyWithData({
        if (snippetName != null) #snippetName: snippetName,
        if (child != $none) #child: child
      }));
  @override
  TargetWrapperNode $make(CopyWithData data) => TargetWrapperNode(
      snippetName: data.get(#snippetName, or: $value.snippetName),
      child: data.get(#child, or: $value.child));

  @override
  TargetWrapperNodeCopyWith<$R2, TargetWrapperNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TargetWrapperNodeCopyWithImpl($value, $cast, t);
}
