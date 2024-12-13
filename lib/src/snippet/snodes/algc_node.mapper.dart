// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'algc_node.dart';

class AlgCNodeMapper extends SubClassMapperBase<AlgCNode> {
  AlgCNodeMapper._();

  static AlgCNodeMapper? _instance;
  static AlgCNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AlgCNodeMapper._());
      CLMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'AlgCNode';

  static String? _$ea(AlgCNode v) => v.ea;
  static const Field<AlgCNode, String> _f$ea = Field('ea', _$ea, opt: true);
  static String? _$fId(AlgCNode v) => v.fId;
  static const Field<AlgCNode, String> _f$fId = Field('fId', _$fId, opt: true);
  static String? _$flowchartJsonString(AlgCNode v) => v.flowchartJsonString;
  static const Field<AlgCNode, String> _f$flowchartJsonString =
      Field('flowchartJsonString', _$flowchartJsonString, opt: true);
  static String _$uid(AlgCNode v) => v.uid;
  static const Field<AlgCNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static bool _$isExpanded(AlgCNode v) => v.isExpanded;
  static const Field<AlgCNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static Rect? _$measuredRect(AlgCNode v) => v.measuredRect;
  static const Field<AlgCNode, Rect> _f$measuredRect =
      Field('measuredRect', _$measuredRect, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(AlgCNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<AlgCNode, bool> _f$hidePropertiesWhileDragging = Field(
      'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
      mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(AlgCNode v) =>
      v.nodeWidgetGK;
  static const Field<AlgCNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<AlgCNode> fields = const {
    #ea: _f$ea,
    #fId: _f$fId,
    #flowchartJsonString: _f$flowchartJsonString,
    #uid: _f$uid,
    #isExpanded: _f$isExpanded,
    #measuredRect: _f$measuredRect,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'cl';
  @override
  final dynamic discriminatorValue = 'AlgCNode';
  @override
  late final ClassMapperBase superMapper = CLMapper.ensureInitialized();

  static AlgCNode _instantiate(DecodingData data) {
    return AlgCNode(
        ea: data.dec(_f$ea),
        fId: data.dec(_f$fId),
        flowchartJsonString: data.dec(_f$flowchartJsonString));
  }

  @override
  final Function instantiate = _instantiate;

  static AlgCNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AlgCNode>(map);
  }

  static AlgCNode fromJson(String json) {
    return ensureInitialized().decodeJson<AlgCNode>(json);
  }
}

mixin AlgCNodeMappable {
  String toJson() {
    return AlgCNodeMapper.ensureInitialized()
        .encodeJson<AlgCNode>(this as AlgCNode);
  }

  Map<String, dynamic> toMap() {
    return AlgCNodeMapper.ensureInitialized()
        .encodeMap<AlgCNode>(this as AlgCNode);
  }

  AlgCNodeCopyWith<AlgCNode, AlgCNode, AlgCNode> get copyWith =>
      _AlgCNodeCopyWithImpl(this as AlgCNode, $identity, $identity);
  @override
  String toString() {
    return AlgCNodeMapper.ensureInitialized().stringifyValue(this as AlgCNode);
  }

  @override
  bool operator ==(Object other) {
    return AlgCNodeMapper.ensureInitialized()
        .equalsValue(this as AlgCNode, other);
  }

  @override
  int get hashCode {
    return AlgCNodeMapper.ensureInitialized().hashValue(this as AlgCNode);
  }
}

extension AlgCNodeValueCopy<$R, $Out> on ObjectCopyWith<$R, AlgCNode, $Out> {
  AlgCNodeCopyWith<$R, AlgCNode, $Out> get $asAlgCNode =>
      $base.as((v, t, t2) => _AlgCNodeCopyWithImpl(v, t, t2));
}

abstract class AlgCNodeCopyWith<$R, $In extends AlgCNode, $Out>
    implements CLCopyWith<$R, $In, $Out> {
  @override
  $R call({String? ea, String? fId, String? flowchartJsonString});
  AlgCNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AlgCNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AlgCNode, $Out>
    implements AlgCNodeCopyWith<$R, AlgCNode, $Out> {
  _AlgCNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AlgCNode> $mapper =
      AlgCNodeMapper.ensureInitialized();
  @override
  $R call(
          {Object? ea = $none,
          Object? fId = $none,
          Object? flowchartJsonString = $none}) =>
      $apply(FieldCopyWithData({
        if (ea != $none) #ea: ea,
        if (fId != $none) #fId: fId,
        if (flowchartJsonString != $none)
          #flowchartJsonString: flowchartJsonString
      }));
  @override
  AlgCNode $make(CopyWithData data) => AlgCNode(
      ea: data.get(#ea, or: $value.ea),
      fId: data.get(#fId, or: $value.fId),
      flowchartJsonString:
          data.get(#flowchartJsonString, or: $value.flowchartJsonString));

  @override
  AlgCNodeCopyWith<$R2, AlgCNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AlgCNodeCopyWithImpl($value, $cast, t);
}
