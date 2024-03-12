// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'poll_option_node.dart';

class PollOptionNodeMapper extends SubClassMapperBase<PollOptionNode> {
  PollOptionNodeMapper._();

  static PollOptionNodeMapper? _instance;
  static PollOptionNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PollOptionNodeMapper._());
      CLMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'PollOptionNode';

  static String _$optionId(PollOptionNode v) => v.optionId;
  static const Field<PollOptionNode, String> _f$optionId =
      Field('optionId', _$optionId);
  static String _$text(PollOptionNode v) => v.text;
  static const Field<PollOptionNode, String> _f$text = Field('text', _$text);
  static bool _$isExpanded(PollOptionNode v) => v.isExpanded;
  static const Field<PollOptionNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(PollOptionNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<PollOptionNode, bool> _f$hidePropertiesWhileDragging =
      Field('hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
          mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(PollOptionNode v) =>
      v.nodeWidgetGK;
  static const Field<PollOptionNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<PollOptionNode> fields = const {
    #optionId: _f$optionId,
    #text: _f$text,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'cl';
  @override
  final dynamic discriminatorValue = 'PollOptionNode';
  @override
  late final ClassMapperBase superMapper = CLMapper.ensureInitialized();

  static PollOptionNode _instantiate(DecodingData data) {
    return PollOptionNode(
        optionId: data.dec(_f$optionId), text: data.dec(_f$text));
  }

  @override
  final Function instantiate = _instantiate;

  static PollOptionNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PollOptionNode>(map);
  }

  static PollOptionNode fromJson(String json) {
    return ensureInitialized().decodeJson<PollOptionNode>(json);
  }
}

mixin PollOptionNodeMappable {
  String toJson() {
    return PollOptionNodeMapper.ensureInitialized()
        .encodeJson<PollOptionNode>(this as PollOptionNode);
  }

  Map<String, dynamic> toMap() {
    return PollOptionNodeMapper.ensureInitialized()
        .encodeMap<PollOptionNode>(this as PollOptionNode);
  }

  PollOptionNodeCopyWith<PollOptionNode, PollOptionNode, PollOptionNode>
      get copyWith => _PollOptionNodeCopyWithImpl(
          this as PollOptionNode, $identity, $identity);
  @override
  String toString() {
    return PollOptionNodeMapper.ensureInitialized()
        .stringifyValue(this as PollOptionNode);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            PollOptionNodeMapper.ensureInitialized()
                .isValueEqual(this as PollOptionNode, other));
  }

  @override
  int get hashCode {
    return PollOptionNodeMapper.ensureInitialized()
        .hashValue(this as PollOptionNode);
  }
}

extension PollOptionNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PollOptionNode, $Out> {
  PollOptionNodeCopyWith<$R, PollOptionNode, $Out> get $asPollOptionNode =>
      $base.as((v, t, t2) => _PollOptionNodeCopyWithImpl(v, t, t2));
}

abstract class PollOptionNodeCopyWith<$R, $In extends PollOptionNode, $Out>
    implements CLCopyWith<$R, $In, $Out> {
  @override
  $R call({String? optionId, String? text});
  PollOptionNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PollOptionNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PollOptionNode, $Out>
    implements PollOptionNodeCopyWith<$R, PollOptionNode, $Out> {
  _PollOptionNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PollOptionNode> $mapper =
      PollOptionNodeMapper.ensureInitialized();
  @override
  $R call({String? optionId, String? text}) => $apply(FieldCopyWithData({
        if (optionId != null) #optionId: optionId,
        if (text != null) #text: text
      }));
  @override
  PollOptionNode $make(CopyWithData data) => PollOptionNode(
      optionId: data.get(#optionId, or: $value.optionId),
      text: data.get(#text, or: $value.text));

  @override
  PollOptionNodeCopyWith<$R2, PollOptionNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PollOptionNodeCopyWithImpl($value, $cast, t);
}
