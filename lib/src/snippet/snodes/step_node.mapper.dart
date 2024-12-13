// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'step_node.dart';

class StepNodeMapper extends SubClassMapperBase<StepNode> {
  StepNodeMapper._();

  static StepNodeMapper? _instance;
  static StepNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StepNodeMapper._());
      CLMapper.ensureInitialized().addSubMapper(_instance!);
      GenericSingleChildNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'StepNode';

  static GenericSingleChildNode _$title(StepNode v) => v.title;
  static const Field<StepNode, GenericSingleChildNode> _f$title =
      Field('title', _$title);
  static GenericSingleChildNode? _$subtitle(StepNode v) => v.subtitle;
  static const Field<StepNode, GenericSingleChildNode> _f$subtitle =
      Field('subtitle', _$subtitle, opt: true);
  static GenericSingleChildNode _$content(StepNode v) => v.content;
  static const Field<StepNode, GenericSingleChildNode> _f$content =
      Field('content', _$content);
  static String _$uid(StepNode v) => v.uid;
  static const Field<StepNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static bool _$isExpanded(StepNode v) => v.isExpanded;
  static const Field<StepNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static Rect? _$measuredRect(StepNode v) => v.measuredRect;
  static const Field<StepNode, Rect> _f$measuredRect =
      Field('measuredRect', _$measuredRect, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(StepNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<StepNode, bool> _f$hidePropertiesWhileDragging = Field(
      'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
      mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(StepNode v) =>
      v.nodeWidgetGK;
  static const Field<StepNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<StepNode> fields = const {
    #title: _f$title,
    #subtitle: _f$subtitle,
    #content: _f$content,
    #uid: _f$uid,
    #isExpanded: _f$isExpanded,
    #measuredRect: _f$measuredRect,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'cl';
  @override
  final dynamic discriminatorValue = 'StepNode';
  @override
  late final ClassMapperBase superMapper = CLMapper.ensureInitialized();

  static StepNode _instantiate(DecodingData data) {
    return StepNode(
        title: data.dec(_f$title),
        subtitle: data.dec(_f$subtitle),
        content: data.dec(_f$content));
  }

  @override
  final Function instantiate = _instantiate;

  static StepNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StepNode>(map);
  }

  static StepNode fromJson(String json) {
    return ensureInitialized().decodeJson<StepNode>(json);
  }
}

mixin StepNodeMappable {
  String toJson() {
    return StepNodeMapper.ensureInitialized()
        .encodeJson<StepNode>(this as StepNode);
  }

  Map<String, dynamic> toMap() {
    return StepNodeMapper.ensureInitialized()
        .encodeMap<StepNode>(this as StepNode);
  }

  StepNodeCopyWith<StepNode, StepNode, StepNode> get copyWith =>
      _StepNodeCopyWithImpl(this as StepNode, $identity, $identity);
  @override
  String toString() {
    return StepNodeMapper.ensureInitialized().stringifyValue(this as StepNode);
  }

  @override
  bool operator ==(Object other) {
    return StepNodeMapper.ensureInitialized()
        .equalsValue(this as StepNode, other);
  }

  @override
  int get hashCode {
    return StepNodeMapper.ensureInitialized().hashValue(this as StepNode);
  }
}

extension StepNodeValueCopy<$R, $Out> on ObjectCopyWith<$R, StepNode, $Out> {
  StepNodeCopyWith<$R, StepNode, $Out> get $asStepNode =>
      $base.as((v, t, t2) => _StepNodeCopyWithImpl(v, t, t2));
}

abstract class StepNodeCopyWith<$R, $In extends StepNode, $Out>
    implements CLCopyWith<$R, $In, $Out> {
  GenericSingleChildNodeCopyWith<$R, GenericSingleChildNode,
      GenericSingleChildNode> get title;
  GenericSingleChildNodeCopyWith<$R, GenericSingleChildNode,
      GenericSingleChildNode>? get subtitle;
  GenericSingleChildNodeCopyWith<$R, GenericSingleChildNode,
      GenericSingleChildNode> get content;
  @override
  $R call(
      {GenericSingleChildNode? title,
      GenericSingleChildNode? subtitle,
      GenericSingleChildNode? content});
  StepNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _StepNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StepNode, $Out>
    implements StepNodeCopyWith<$R, StepNode, $Out> {
  _StepNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StepNode> $mapper =
      StepNodeMapper.ensureInitialized();
  @override
  GenericSingleChildNodeCopyWith<$R, GenericSingleChildNode,
          GenericSingleChildNode>
      get title => $value.title.copyWith.$chain((v) => call(title: v));
  @override
  GenericSingleChildNodeCopyWith<$R, GenericSingleChildNode,
          GenericSingleChildNode>?
      get subtitle =>
          $value.subtitle?.copyWith.$chain((v) => call(subtitle: v));
  @override
  GenericSingleChildNodeCopyWith<$R, GenericSingleChildNode,
          GenericSingleChildNode>
      get content => $value.content.copyWith.$chain((v) => call(content: v));
  @override
  $R call(
          {GenericSingleChildNode? title,
          Object? subtitle = $none,
          GenericSingleChildNode? content}) =>
      $apply(FieldCopyWithData({
        if (title != null) #title: title,
        if (subtitle != $none) #subtitle: subtitle,
        if (content != null) #content: content
      }));
  @override
  StepNode $make(CopyWithData data) => StepNode(
      title: data.get(#title, or: $value.title),
      subtitle: data.get(#subtitle, or: $value.subtitle),
      content: data.get(#content, or: $value.content));

  @override
  StepNodeCopyWith<$R2, StepNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _StepNodeCopyWithImpl($value, $cast, t);
}
