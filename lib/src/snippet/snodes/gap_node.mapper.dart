// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'gap_node.dart';

class GapNodeMapper extends SubClassMapperBase<GapNode> {
  GapNodeMapper._();

  static GapNodeMapper? _instance;
  static GapNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GapNodeMapper._());
      CLMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'GapNode';

  static double _$gap(GapNode v) => v.gap;
  static const Field<GapNode, double> _f$gap = Field('gap', _$gap);
  static String _$uid(GapNode v) => v.uid;
  static const Field<GapNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static bool _$isExpanded(GapNode v) => v.isExpanded;
  static const Field<GapNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static Rect? _$measuredRect(GapNode v) => v.measuredRect;
  static const Field<GapNode, Rect> _f$measuredRect =
      Field('measuredRect', _$measuredRect, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(GapNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<GapNode, bool> _f$hidePropertiesWhileDragging = Field(
      'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
      mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(GapNode v) =>
      v.nodeWidgetGK;
  static const Field<GapNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<GapNode> fields = const {
    #gap: _f$gap,
    #uid: _f$uid,
    #isExpanded: _f$isExpanded,
    #measuredRect: _f$measuredRect,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'cl';
  @override
  final dynamic discriminatorValue = 'GapNode';
  @override
  late final ClassMapperBase superMapper = CLMapper.ensureInitialized();

  static GapNode _instantiate(DecodingData data) {
    return GapNode(gap: data.dec(_f$gap));
  }

  @override
  final Function instantiate = _instantiate;

  static GapNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GapNode>(map);
  }

  static GapNode fromJson(String json) {
    return ensureInitialized().decodeJson<GapNode>(json);
  }
}

mixin GapNodeMappable {
  String toJson() {
    return GapNodeMapper.ensureInitialized()
        .encodeJson<GapNode>(this as GapNode);
  }

  Map<String, dynamic> toMap() {
    return GapNodeMapper.ensureInitialized()
        .encodeMap<GapNode>(this as GapNode);
  }

  GapNodeCopyWith<GapNode, GapNode, GapNode> get copyWith =>
      _GapNodeCopyWithImpl(this as GapNode, $identity, $identity);
  @override
  String toString() {
    return GapNodeMapper.ensureInitialized().stringifyValue(this as GapNode);
  }

  @override
  bool operator ==(Object other) {
    return GapNodeMapper.ensureInitialized()
        .equalsValue(this as GapNode, other);
  }

  @override
  int get hashCode {
    return GapNodeMapper.ensureInitialized().hashValue(this as GapNode);
  }
}

extension GapNodeValueCopy<$R, $Out> on ObjectCopyWith<$R, GapNode, $Out> {
  GapNodeCopyWith<$R, GapNode, $Out> get $asGapNode =>
      $base.as((v, t, t2) => _GapNodeCopyWithImpl(v, t, t2));
}

abstract class GapNodeCopyWith<$R, $In extends GapNode, $Out>
    implements CLCopyWith<$R, $In, $Out> {
  @override
  $R call({double? gap});
  GapNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _GapNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GapNode, $Out>
    implements GapNodeCopyWith<$R, GapNode, $Out> {
  _GapNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GapNode> $mapper =
      GapNodeMapper.ensureInitialized();
  @override
  $R call({double? gap}) =>
      $apply(FieldCopyWithData({if (gap != null) #gap: gap}));
  @override
  GapNode $make(CopyWithData data) =>
      GapNode(gap: data.get(#gap, or: $value.gap));

  @override
  GapNodeCopyWith<$R2, GapNode, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _GapNodeCopyWithImpl($value, $cast, t);
}
