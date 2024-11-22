// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'wrap_node.dart';

class WrapNodeMapper extends SubClassMapperBase<WrapNode> {
  WrapNodeMapper._();

  static WrapNodeMapper? _instance;
  static WrapNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WrapNodeMapper._());
      MCMapper.ensureInitialized().addSubMapper(_instance!);
      AxisEnumMapper.ensureInitialized();
      WrapAlignmentEnumMapper.ensureInitialized();
      WrapCrossAlignmentEnumMapper.ensureInitialized();
      STreeNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'WrapNode';

  static AxisEnum _$direction(WrapNode v) => v.direction;
  static const Field<WrapNode, AxisEnum> _f$direction =
      Field('direction', _$direction, opt: true, def: AxisEnum.horizontal);
  static double? _$spacing(WrapNode v) => v.spacing;
  static const Field<WrapNode, double> _f$spacing =
      Field('spacing', _$spacing, opt: true);
  static double? _$runSpacing(WrapNode v) => v.runSpacing;
  static const Field<WrapNode, double> _f$runSpacing =
      Field('runSpacing', _$runSpacing, opt: true);
  static WrapAlignmentEnum? _$alignment(WrapNode v) => v.alignment;
  static const Field<WrapNode, WrapAlignmentEnum> _f$alignment =
      Field('alignment', _$alignment, opt: true);
  static WrapAlignmentEnum? _$runAlignment(WrapNode v) => v.runAlignment;
  static const Field<WrapNode, WrapAlignmentEnum> _f$runAlignment =
      Field('runAlignment', _$runAlignment, opt: true);
  static WrapCrossAlignmentEnum? _$crossAxisAlignment(WrapNode v) =>
      v.crossAxisAlignment;
  static const Field<WrapNode, WrapCrossAlignmentEnum> _f$crossAxisAlignment =
      Field('crossAxisAlignment', _$crossAxisAlignment, opt: true);
  static List<STreeNode> _$children(WrapNode v) => v.children;
  static const Field<WrapNode, List<STreeNode>> _f$children =
      Field('children', _$children);
  static String _$uid(WrapNode v) => v.uid;
  static const Field<WrapNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$gk(WrapNode v) => v.gk;
  static const Field<WrapNode, GlobalKey<State<StatefulWidget>>> _f$gk =
      Field('gk', _$gk, mode: FieldMode.member);
  static bool _$isExpanded(WrapNode v) => v.isExpanded;
  static const Field<WrapNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(WrapNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<WrapNode, bool> _f$hidePropertiesWhileDragging = Field(
      'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
      mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(WrapNode v) =>
      v.nodeWidgetGK;
  static const Field<WrapNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<WrapNode> fields = const {
    #direction: _f$direction,
    #spacing: _f$spacing,
    #runSpacing: _f$runSpacing,
    #alignment: _f$alignment,
    #runAlignment: _f$runAlignment,
    #crossAxisAlignment: _f$crossAxisAlignment,
    #children: _f$children,
    #uid: _f$uid,
    #gk: _f$gk,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'mc';
  @override
  final dynamic discriminatorValue = 'WrapNode';
  @override
  late final ClassMapperBase superMapper = MCMapper.ensureInitialized();

  static WrapNode _instantiate(DecodingData data) {
    return WrapNode(
        direction: data.dec(_f$direction),
        spacing: data.dec(_f$spacing),
        runSpacing: data.dec(_f$runSpacing),
        alignment: data.dec(_f$alignment),
        runAlignment: data.dec(_f$runAlignment),
        crossAxisAlignment: data.dec(_f$crossAxisAlignment),
        children: data.dec(_f$children));
  }

  @override
  final Function instantiate = _instantiate;

  static WrapNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<WrapNode>(map);
  }

  static WrapNode fromJson(String json) {
    return ensureInitialized().decodeJson<WrapNode>(json);
  }
}

mixin WrapNodeMappable {
  String toJson() {
    return WrapNodeMapper.ensureInitialized()
        .encodeJson<WrapNode>(this as WrapNode);
  }

  Map<String, dynamic> toMap() {
    return WrapNodeMapper.ensureInitialized()
        .encodeMap<WrapNode>(this as WrapNode);
  }

  WrapNodeCopyWith<WrapNode, WrapNode, WrapNode> get copyWith =>
      _WrapNodeCopyWithImpl(this as WrapNode, $identity, $identity);
  @override
  String toString() {
    return WrapNodeMapper.ensureInitialized().stringifyValue(this as WrapNode);
  }

  @override
  bool operator ==(Object other) {
    return WrapNodeMapper.ensureInitialized()
        .equalsValue(this as WrapNode, other);
  }

  @override
  int get hashCode {
    return WrapNodeMapper.ensureInitialized().hashValue(this as WrapNode);
  }
}

extension WrapNodeValueCopy<$R, $Out> on ObjectCopyWith<$R, WrapNode, $Out> {
  WrapNodeCopyWith<$R, WrapNode, $Out> get $asWrapNode =>
      $base.as((v, t, t2) => _WrapNodeCopyWithImpl(v, t, t2));
}

abstract class WrapNodeCopyWith<$R, $In extends WrapNode, $Out>
    implements MCCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, STreeNode, STreeNodeCopyWith<$R, STreeNode, STreeNode>>
      get children;
  @override
  $R call(
      {AxisEnum? direction,
      double? spacing,
      double? runSpacing,
      WrapAlignmentEnum? alignment,
      WrapAlignmentEnum? runAlignment,
      WrapCrossAlignmentEnum? crossAxisAlignment,
      List<STreeNode>? children});
  WrapNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _WrapNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, WrapNode, $Out>
    implements WrapNodeCopyWith<$R, WrapNode, $Out> {
  _WrapNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<WrapNode> $mapper =
      WrapNodeMapper.ensureInitialized();
  @override
  ListCopyWith<$R, STreeNode, STreeNodeCopyWith<$R, STreeNode, STreeNode>>
      get children => ListCopyWith($value.children,
          (v, t) => v.copyWith.$chain(t), (v) => call(children: v));
  @override
  $R call(
          {AxisEnum? direction,
          Object? spacing = $none,
          Object? runSpacing = $none,
          Object? alignment = $none,
          Object? runAlignment = $none,
          Object? crossAxisAlignment = $none,
          List<STreeNode>? children}) =>
      $apply(FieldCopyWithData({
        if (direction != null) #direction: direction,
        if (spacing != $none) #spacing: spacing,
        if (runSpacing != $none) #runSpacing: runSpacing,
        if (alignment != $none) #alignment: alignment,
        if (runAlignment != $none) #runAlignment: runAlignment,
        if (crossAxisAlignment != $none)
          #crossAxisAlignment: crossAxisAlignment,
        if (children != null) #children: children
      }));
  @override
  WrapNode $make(CopyWithData data) => WrapNode(
      direction: data.get(#direction, or: $value.direction),
      spacing: data.get(#spacing, or: $value.spacing),
      runSpacing: data.get(#runSpacing, or: $value.runSpacing),
      alignment: data.get(#alignment, or: $value.alignment),
      runAlignment: data.get(#runAlignment, or: $value.runAlignment),
      crossAxisAlignment:
          data.get(#crossAxisAlignment, or: $value.crossAxisAlignment),
      children: data.get(#children, or: $value.children));

  @override
  WrapNodeCopyWith<$R2, WrapNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _WrapNodeCopyWithImpl($value, $cast, t);
}
