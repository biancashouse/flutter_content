// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'inlinespan_node.dart';

class InlineSpanNodeMapper extends SubClassMapperBase<InlineSpanNode> {
  InlineSpanNodeMapper._();

  static InlineSpanNodeMapper? _instance;
  static InlineSpanNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = InlineSpanNodeMapper._());
      STreeNodeMapper.ensureInitialized().addSubMapper(_instance!);
      TextSpanNodeMapper.ensureInitialized();
      WidgetSpanNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'InlineSpanNode';

  static String _$uid(InlineSpanNode v) => v.uid;
  static const Field<InlineSpanNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static bool _$isExpanded(InlineSpanNode v) => v.isExpanded;
  static const Field<InlineSpanNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static Rect? _$measuredRect(InlineSpanNode v) => v.measuredRect;
  static const Field<InlineSpanNode, Rect> _f$measuredRect =
      Field('measuredRect', _$measuredRect, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(InlineSpanNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<InlineSpanNode, bool> _f$hidePropertiesWhileDragging =
      Field('hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
          mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(InlineSpanNode v) =>
      v.nodeWidgetGK;
  static const Field<InlineSpanNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<InlineSpanNode> fields = const {
    #uid: _f$uid,
    #isExpanded: _f$isExpanded,
    #measuredRect: _f$measuredRect,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'snode';
  @override
  final dynamic discriminatorValue = 'InlineSpanNode';
  @override
  late final ClassMapperBase superMapper = STreeNodeMapper.ensureInitialized();

  static InlineSpanNode _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'InlineSpanNode', 'is', '${data.value['is']}');
  }

  @override
  final Function instantiate = _instantiate;

  static InlineSpanNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<InlineSpanNode>(map);
  }

  static InlineSpanNode fromJson(String json) {
    return ensureInitialized().decodeJson<InlineSpanNode>(json);
  }
}

mixin InlineSpanNodeMappable {
  String toJson();
  Map<String, dynamic> toMap();
  InlineSpanNodeCopyWith<InlineSpanNode, InlineSpanNode, InlineSpanNode>
      get copyWith;
}

abstract class InlineSpanNodeCopyWith<$R, $In extends InlineSpanNode, $Out>
    implements STreeNodeCopyWith<$R, $In, $Out> {
  @override
  $R call();
  InlineSpanNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}
