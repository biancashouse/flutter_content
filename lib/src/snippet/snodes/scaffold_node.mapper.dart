// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
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
      CLMapper.ensureInitialized().addSubMapper(_instance!);
      ColorModelMapper.ensureInitialized();
      NamedPSMapper.ensureInitialized();
      NamedSCMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ScaffoldNode';

  static ColorModel? _$bgColor(ScaffoldNode v) => v.bgColor;
  static const Field<ScaffoldNode, ColorModel> _f$bgColor = Field(
    'bgColor',
    _$bgColor,
    opt: true,
  );
  static NamedPS _$appBar(ScaffoldNode v) => v.appBar;
  static const Field<ScaffoldNode, NamedPS> _f$appBar = Field(
    'appBar',
    _$appBar,
    hook: AppBarHook(),
  );
  static NamedSC _$body(ScaffoldNode v) => v.body;
  static const Field<ScaffoldNode, NamedSC> _f$body = Field('body', _$body);
  static bool? _$canShowEditorLoginBtn(ScaffoldNode v) =>
      v.canShowEditorLoginBtn;
  static const Field<ScaffoldNode, bool> _f$canShowEditorLoginBtn = Field(
    'canShowEditorLoginBtn',
    _$canShowEditorLoginBtn,
    opt: true,
  );
  static String _$uid(ScaffoldNode v) => v.uid;
  static const Field<ScaffoldNode, String> _f$uid = Field(
    'uid',
    _$uid,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$treeNodeGK(ScaffoldNode v) =>
      v.treeNodeGK;
  static const Field<ScaffoldNode, GlobalKey<State<StatefulWidget>>>
  _f$treeNodeGK = Field('treeNodeGK', _$treeNodeGK, mode: FieldMode.member);
  static bool _$isExpanded(ScaffoldNode v) => v.isExpanded;
  static const Field<ScaffoldNode, bool> _f$isExpanded = Field(
    'isExpanded',
    _$isExpanded,
    mode: FieldMode.member,
  );
  static bool? _$hidePropertiesWhileDragging(ScaffoldNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<ScaffoldNode, bool> _f$hidePropertiesWhileDragging = Field(
    'hidePropertiesWhileDragging',
    _$hidePropertiesWhileDragging,
    mode: FieldMode.member,
  );
  static bool _$canShowTappableNodeWidgetOverlay(ScaffoldNode v) =>
      v.canShowTappableNodeWidgetOverlay;
  static const Field<ScaffoldNode, bool> _f$canShowTappableNodeWidgetOverlay =
      Field(
        'canShowTappableNodeWidgetOverlay',
        _$canShowTappableNodeWidgetOverlay,
        mode: FieldMode.member,
      );
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(ScaffoldNode v) =>
      v.nodeWidgetGK;
  static const Field<ScaffoldNode, GlobalKey<State<StatefulWidget>>>
  _f$nodeWidgetGK = Field(
    'nodeWidgetGK',
    _$nodeWidgetGK,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<ScaffoldNode> fields = const {
    #bgColor: _f$bgColor,
    #appBar: _f$appBar,
    #body: _f$body,
    #canShowEditorLoginBtn: _f$canShowEditorLoginBtn,
    #uid: _f$uid,
    #treeNodeGK: _f$treeNodeGK,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #canShowTappableNodeWidgetOverlay: _f$canShowTappableNodeWidgetOverlay,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'cl';
  @override
  final dynamic discriminatorValue = 'ScaffoldNode';
  @override
  late final ClassMapperBase superMapper = CLMapper.ensureInitialized();

  static ScaffoldNode _instantiate(DecodingData data) {
    return ScaffoldNode(
      bgColor: data.dec(_f$bgColor),
      appBar: data.dec(_f$appBar),
      body: data.dec(_f$body),
      canShowEditorLoginBtn: data.dec(_f$canShowEditorLoginBtn),
    );
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
    return ScaffoldNodeMapper.ensureInitialized().encodeJson<ScaffoldNode>(
      this as ScaffoldNode,
    );
  }

  Map<String, dynamic> toMap() {
    return ScaffoldNodeMapper.ensureInitialized().encodeMap<ScaffoldNode>(
      this as ScaffoldNode,
    );
  }

  ScaffoldNodeCopyWith<ScaffoldNode, ScaffoldNode, ScaffoldNode> get copyWith =>
      _ScaffoldNodeCopyWithImpl<ScaffoldNode, ScaffoldNode>(
        this as ScaffoldNode,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ScaffoldNodeMapper.ensureInitialized().stringifyValue(
      this as ScaffoldNode,
    );
  }

  @override
  bool operator ==(Object other) {
    return ScaffoldNodeMapper.ensureInitialized().equalsValue(
      this as ScaffoldNode,
      other,
    );
  }

  @override
  int get hashCode {
    return ScaffoldNodeMapper.ensureInitialized().hashValue(
      this as ScaffoldNode,
    );
  }
}

extension ScaffoldNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ScaffoldNode, $Out> {
  ScaffoldNodeCopyWith<$R, ScaffoldNode, $Out> get $asScaffoldNode =>
      $base.as((v, t, t2) => _ScaffoldNodeCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ScaffoldNodeCopyWith<$R, $In extends ScaffoldNode, $Out>
    implements CLCopyWith<$R, $In, $Out> {
  ColorModelCopyWith<$R, ColorModel, ColorModel>? get bgColor;
  NamedPSCopyWith<$R, NamedPS, NamedPS> get appBar;
  NamedSCCopyWith<$R, NamedSC, NamedSC> get body;
  @override
  $R call({
    ColorModel? bgColor,
    NamedPS? appBar,
    NamedSC? body,
    bool? canShowEditorLoginBtn,
  });
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
  ColorModelCopyWith<$R, ColorModel, ColorModel>? get bgColor =>
      $value.bgColor?.copyWith.$chain((v) => call(bgColor: v));
  @override
  NamedPSCopyWith<$R, NamedPS, NamedPS> get appBar =>
      $value.appBar.copyWith.$chain((v) => call(appBar: v));
  @override
  NamedSCCopyWith<$R, NamedSC, NamedSC> get body =>
      $value.body.copyWith.$chain((v) => call(body: v));
  @override
  $R call({
    Object? bgColor = $none,
    NamedPS? appBar,
    NamedSC? body,
    Object? canShowEditorLoginBtn = $none,
  }) => $apply(
    FieldCopyWithData({
      if (bgColor != $none) #bgColor: bgColor,
      if (appBar != null) #appBar: appBar,
      if (body != null) #body: body,
      if (canShowEditorLoginBtn != $none)
        #canShowEditorLoginBtn: canShowEditorLoginBtn,
    }),
  );
  @override
  ScaffoldNode $make(CopyWithData data) => ScaffoldNode(
    bgColor: data.get(#bgColor, or: $value.bgColor),
    appBar: data.get(#appBar, or: $value.appBar),
    body: data.get(#body, or: $value.body),
    canShowEditorLoginBtn: data.get(
      #canShowEditorLoginBtn,
      or: $value.canShowEditorLoginBtn,
    ),
  );

  @override
  ScaffoldNodeCopyWith<$R2, ScaffoldNode, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ScaffoldNodeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

