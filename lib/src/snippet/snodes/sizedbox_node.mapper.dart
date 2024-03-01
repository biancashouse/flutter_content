// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'sizedbox_node.dart';

class SizedBoxNodeMapper extends SubClassMapperBase<SizedBoxNode> {
  SizedBoxNodeMapper._();

  static SizedBoxNodeMapper? _instance;
  static SizedBoxNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SizedBoxNodeMapper._());
      SCMapper.ensureInitialized().addSubMapper(_instance!);
      STreeNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SizedBoxNode';

  static double? _$width(SizedBoxNode v) => v.width;
  static const Field<SizedBoxNode, double> _f$width =
      Field('width', _$width, opt: true);
  static double? _$height(SizedBoxNode v) => v.height;
  static const Field<SizedBoxNode, double> _f$height =
      Field('height', _$height, opt: true);
  static STreeNode? _$child(SizedBoxNode v) => v.child;
  static const Field<SizedBoxNode, STreeNode> _f$child =
      Field('child', _$child, opt: true);
  static bool _$isExpanded(SizedBoxNode v) => v.isExpanded;
  static const Field<SizedBoxNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static PTreeNodeTreeController? _$pTreeC(SizedBoxNode v) => v.pTreeC;
  static const Field<SizedBoxNode, PTreeNodeTreeController> _f$pTreeC =
      Field('pTreeC', _$pTreeC, mode: FieldMode.member);
  static double? _$propertiesPaneScrollPos(SizedBoxNode v) =>
      v.propertiesPaneScrollPos;
  static const Field<SizedBoxNode, double> _f$propertiesPaneScrollPos = Field(
      'propertiesPaneScrollPos', _$propertiesPaneScrollPos,
      mode: FieldMode.member);
  static ScrollController? _$propertiesPaneSC(SizedBoxNode v) =>
      v.propertiesPaneSC;
  static const Field<SizedBoxNode, ScrollController> _f$propertiesPaneSC =
      Field('propertiesPaneSC', _$propertiesPaneSC, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(SizedBoxNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<SizedBoxNode, bool> _f$hidePropertiesWhileDragging = Field(
      'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
      mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(SizedBoxNode v) =>
      v.nodeWidgetGK;
  static const Field<SizedBoxNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<SizedBoxNode> fields = const {
    #width: _f$width,
    #height: _f$height,
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
  final dynamic discriminatorValue = 'SizedBoxNode';
  @override
  late final ClassMapperBase superMapper = SCMapper.ensureInitialized();

  static SizedBoxNode _instantiate(DecodingData data) {
    return SizedBoxNode(
        width: data.dec(_f$width),
        height: data.dec(_f$height),
        child: data.dec(_f$child));
  }

  @override
  final Function instantiate = _instantiate;

  static SizedBoxNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SizedBoxNode>(map);
  }

  static SizedBoxNode fromJson(String json) {
    return ensureInitialized().decodeJson<SizedBoxNode>(json);
  }
}

mixin SizedBoxNodeMappable {
  String toJson() {
    return SizedBoxNodeMapper.ensureInitialized()
        .encodeJson<SizedBoxNode>(this as SizedBoxNode);
  }

  Map<String, dynamic> toMap() {
    return SizedBoxNodeMapper.ensureInitialized()
        .encodeMap<SizedBoxNode>(this as SizedBoxNode);
  }

  SizedBoxNodeCopyWith<SizedBoxNode, SizedBoxNode, SizedBoxNode> get copyWith =>
      _SizedBoxNodeCopyWithImpl(this as SizedBoxNode, $identity, $identity);
  @override
  String toString() {
    return SizedBoxNodeMapper.ensureInitialized()
        .stringifyValue(this as SizedBoxNode);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            SizedBoxNodeMapper.ensureInitialized()
                .isValueEqual(this as SizedBoxNode, other));
  }

  @override
  int get hashCode {
    return SizedBoxNodeMapper.ensureInitialized()
        .hashValue(this as SizedBoxNode);
  }
}

extension SizedBoxNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SizedBoxNode, $Out> {
  SizedBoxNodeCopyWith<$R, SizedBoxNode, $Out> get $asSizedBoxNode =>
      $base.as((v, t, t2) => _SizedBoxNodeCopyWithImpl(v, t, t2));
}

abstract class SizedBoxNodeCopyWith<$R, $In extends SizedBoxNode, $Out>
    implements SCCopyWith<$R, $In, $Out> {
  @override
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get child;
  @override
  $R call({double? width, double? height, STreeNode? child});
  SizedBoxNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SizedBoxNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SizedBoxNode, $Out>
    implements SizedBoxNodeCopyWith<$R, SizedBoxNode, $Out> {
  _SizedBoxNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SizedBoxNode> $mapper =
      SizedBoxNodeMapper.ensureInitialized();
  @override
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get child =>
      $value.child?.copyWith.$chain((v) => call(child: v));
  @override
  $R call(
          {Object? width = $none,
          Object? height = $none,
          Object? child = $none}) =>
      $apply(FieldCopyWithData({
        if (width != $none) #width: width,
        if (height != $none) #height: height,
        if (child != $none) #child: child
      }));
  @override
  SizedBoxNode $make(CopyWithData data) => SizedBoxNode(
      width: data.get(#width, or: $value.width),
      height: data.get(#height, or: $value.height),
      child: data.get(#child, or: $value.child));

  @override
  SizedBoxNodeCopyWith<$R2, SizedBoxNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SizedBoxNodeCopyWithImpl($value, $cast, t);
}
