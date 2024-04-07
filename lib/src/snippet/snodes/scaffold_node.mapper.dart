// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'scaffold_node.dart';

class ScaffoldNodeMapper extends SubClassMapperBase<ScaffoldNode> {
  ScaffoldNodeMapper._();

  static ScaffoldNodeMapper? _instance;
  static ScaffoldNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ScaffoldNodeMapper._());
      STreeNodeMapper.ensureInitialized().addSubMapper(_instance!);
      AppBarNodeMapper.ensureInitialized();
      GenericSingleChildNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ScaffoldNode';

  static int? _$bgColorValue(ScaffoldNode v) => v.bgColorValue;
  static const Field<ScaffoldNode, int> _f$bgColorValue =
      Field('bgColorValue', _$bgColorValue, opt: true);
  static AppBarNode? _$appBar(ScaffoldNode v) => v.appBar;
  static const Field<ScaffoldNode, AppBarNode> _f$appBar =
      Field('appBar', _$appBar, opt: true);
  static GenericSingleChildNode _$body(ScaffoldNode v) => v.body;
  static const Field<ScaffoldNode, GenericSingleChildNode> _f$body =
      Field('body', _$body);
  static bool _$isExpanded(ScaffoldNode v) => v.isExpanded;
  static const Field<ScaffoldNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(ScaffoldNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<ScaffoldNode, bool> _f$hidePropertiesWhileDragging = Field(
      'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
      mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(ScaffoldNode v) =>
      v.nodeWidgetGK;
  static const Field<ScaffoldNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<ScaffoldNode> fields = const {
    #bgColorValue: _f$bgColorValue,
    #appBar: _f$appBar,
    #body: _f$body,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'snode';
  @override
  final dynamic discriminatorValue = 'ScaffoldNode';
  @override
  late final ClassMapperBase superMapper = STreeNodeMapper.ensureInitialized();

  static ScaffoldNode _instantiate(DecodingData data) {
    return ScaffoldNode(
        bgColorValue: data.dec(_f$bgColorValue),
        appBar: data.dec(_f$appBar),
        body: data.dec(_f$body));
  }

  @override
  final Function instantiate = _instantiate;

  static ScaffoldNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ScaffoldNode>(map);
  }

  static ScaffoldNode fromJson(String json) {
    return ensureInitialized().decodeJson<ScaffoldNode>(json);
  }
}

mixin ScaffoldNodeMappable {
  String toJson() {
    return ScaffoldNodeMapper.ensureInitialized()
        .encodeJson<ScaffoldNode>(this as ScaffoldNode);
  }

  Map<String, dynamic> toMap() {
    return ScaffoldNodeMapper.ensureInitialized()
        .encodeMap<ScaffoldNode>(this as ScaffoldNode);
  }

  ScaffoldNodeCopyWith<ScaffoldNode, ScaffoldNode, ScaffoldNode> get copyWith =>
      _ScaffoldNodeCopyWithImpl(this as ScaffoldNode, $identity, $identity);
  @override
  String toString() {
    return ScaffoldNodeMapper.ensureInitialized()
        .stringifyValue(this as ScaffoldNode);
  }

  @override
  bool operator ==(Object other) {
    return ScaffoldNodeMapper.ensureInitialized()
        .equalsValue(this as ScaffoldNode, other);
  }

  @override
  int get hashCode {
    return ScaffoldNodeMapper.ensureInitialized()
        .hashValue(this as ScaffoldNode);
  }
}

extension ScaffoldNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ScaffoldNode, $Out> {
  ScaffoldNodeCopyWith<$R, ScaffoldNode, $Out> get $asScaffoldNode =>
      $base.as((v, t, t2) => _ScaffoldNodeCopyWithImpl(v, t, t2));
}

abstract class ScaffoldNodeCopyWith<$R, $In extends ScaffoldNode, $Out>
    implements STreeNodeCopyWith<$R, $In, $Out> {
  AppBarNodeCopyWith<$R, AppBarNode, AppBarNode>? get appBar;
  GenericSingleChildNodeCopyWith<$R, GenericSingleChildNode,
      GenericSingleChildNode> get body;
  @override
  $R call(
      {int? bgColorValue, AppBarNode? appBar, GenericSingleChildNode? body});
  ScaffoldNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ScaffoldNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ScaffoldNode, $Out>
    implements ScaffoldNodeCopyWith<$R, ScaffoldNode, $Out> {
  _ScaffoldNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ScaffoldNode> $mapper =
      ScaffoldNodeMapper.ensureInitialized();
  @override
  AppBarNodeCopyWith<$R, AppBarNode, AppBarNode>? get appBar =>
      $value.appBar?.copyWith.$chain((v) => call(appBar: v));
  @override
  GenericSingleChildNodeCopyWith<$R, GenericSingleChildNode,
          GenericSingleChildNode>
      get body => $value.body.copyWith.$chain((v) => call(body: v));
  @override
  $R call(
          {Object? bgColorValue = $none,
          Object? appBar = $none,
          GenericSingleChildNode? body}) =>
      $apply(FieldCopyWithData({
        if (bgColorValue != $none) #bgColorValue: bgColorValue,
        if (appBar != $none) #appBar: appBar,
        if (body != null) #body: body
      }));
  @override
  ScaffoldNode $make(CopyWithData data) => ScaffoldNode(
      bgColorValue: data.get(#bgColorValue, or: $value.bgColorValue),
      appBar: data.get(#appBar, or: $value.appBar),
      body: data.get(#body, or: $value.body));

  @override
  ScaffoldNodeCopyWith<$R2, ScaffoldNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ScaffoldNodeCopyWithImpl($value, $cast, t);
}
