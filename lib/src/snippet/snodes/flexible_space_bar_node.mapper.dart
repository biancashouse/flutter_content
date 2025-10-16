// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'flexible_space_bar_node.dart';

class FlexibleSpaceBarNodeMapper
    extends SubClassMapperBase<FlexibleSpaceBarNode> {
  FlexibleSpaceBarNodeMapper._();

  static FlexibleSpaceBarNodeMapper? _instance;
  static FlexibleSpaceBarNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FlexibleSpaceBarNodeMapper._());
      CLMapper.ensureInitialized().addSubMapper(_instance!);
      NamedSCMapper.ensureInitialized();
      EdgeInsetsValueMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'FlexibleSpaceBarNode';

  static NamedSC _$title(FlexibleSpaceBarNode v) => v.title;
  static const Field<FlexibleSpaceBarNode, NamedSC> _f$title = Field(
    'title',
    _$title,
  );
  static NamedSC _$background(FlexibleSpaceBarNode v) => v.background;
  static const Field<FlexibleSpaceBarNode, NamedSC> _f$background = Field(
    'background',
    _$background,
  );
  static bool? _$centerTitle(FlexibleSpaceBarNode v) => v.centerTitle;
  static const Field<FlexibleSpaceBarNode, bool> _f$centerTitle = Field(
    'centerTitle',
    _$centerTitle,
    opt: true,
  );
  static EdgeInsetsValue? _$titlePadding(FlexibleSpaceBarNode v) =>
      v.titlePadding;
  static const Field<FlexibleSpaceBarNode, EdgeInsetsValue> _f$titlePadding =
      Field('titlePadding', _$titlePadding, opt: true);
  static String _$uid(FlexibleSpaceBarNode v) => v.uid;
  static const Field<FlexibleSpaceBarNode, String> _f$uid = Field(
    'uid',
    _$uid,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$treeNodeGK(
    FlexibleSpaceBarNode v,
  ) => v.treeNodeGK;
  static const Field<FlexibleSpaceBarNode, GlobalKey<State<StatefulWidget>>>
  _f$treeNodeGK = Field('treeNodeGK', _$treeNodeGK, mode: FieldMode.member);
  static bool _$isExpanded(FlexibleSpaceBarNode v) => v.isExpanded;
  static const Field<FlexibleSpaceBarNode, bool> _f$isExpanded = Field(
    'isExpanded',
    _$isExpanded,
    mode: FieldMode.member,
  );
  static bool? _$hidePropertiesWhileDragging(FlexibleSpaceBarNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<FlexibleSpaceBarNode, bool>
  _f$hidePropertiesWhileDragging = Field(
    'hidePropertiesWhileDragging',
    _$hidePropertiesWhileDragging,
    mode: FieldMode.member,
  );
  static bool _$canShowTappableNodeWidgetOverlay(FlexibleSpaceBarNode v) =>
      v.canShowTappableNodeWidgetOverlay;
  static const Field<FlexibleSpaceBarNode, bool>
  _f$canShowTappableNodeWidgetOverlay = Field(
    'canShowTappableNodeWidgetOverlay',
    _$canShowTappableNodeWidgetOverlay,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(
    FlexibleSpaceBarNode v,
  ) => v.nodeWidgetGK;
  static const Field<FlexibleSpaceBarNode, GlobalKey<State<StatefulWidget>>>
  _f$nodeWidgetGK = Field(
    'nodeWidgetGK',
    _$nodeWidgetGK,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<FlexibleSpaceBarNode> fields = const {
    #title: _f$title,
    #background: _f$background,
    #centerTitle: _f$centerTitle,
    #titlePadding: _f$titlePadding,
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
  final dynamic discriminatorValue = 'FlexibleSpaceBarNode';
  @override
  late final ClassMapperBase superMapper = CLMapper.ensureInitialized();

  static FlexibleSpaceBarNode _instantiate(DecodingData data) {
    return FlexibleSpaceBarNode(
      title: data.dec(_f$title),
      background: data.dec(_f$background),
      centerTitle: data.dec(_f$centerTitle),
      titlePadding: data.dec(_f$titlePadding),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static FlexibleSpaceBarNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FlexibleSpaceBarNode>(map);
  }

  static FlexibleSpaceBarNode fromJson(String json) {
    return ensureInitialized().decodeJson<FlexibleSpaceBarNode>(json);
  }
}

mixin FlexibleSpaceBarNodeMappable {
  String toJson() {
    return FlexibleSpaceBarNodeMapper.ensureInitialized()
        .encodeJson<FlexibleSpaceBarNode>(this as FlexibleSpaceBarNode);
  }

  Map<String, dynamic> toMap() {
    return FlexibleSpaceBarNodeMapper.ensureInitialized()
        .encodeMap<FlexibleSpaceBarNode>(this as FlexibleSpaceBarNode);
  }

  FlexibleSpaceBarNodeCopyWith<
    FlexibleSpaceBarNode,
    FlexibleSpaceBarNode,
    FlexibleSpaceBarNode
  >
  get copyWith =>
      _FlexibleSpaceBarNodeCopyWithImpl<
        FlexibleSpaceBarNode,
        FlexibleSpaceBarNode
      >(this as FlexibleSpaceBarNode, $identity, $identity);
  @override
  String toString() {
    return FlexibleSpaceBarNodeMapper.ensureInitialized().stringifyValue(
      this as FlexibleSpaceBarNode,
    );
  }

  @override
  bool operator ==(Object other) {
    return FlexibleSpaceBarNodeMapper.ensureInitialized().equalsValue(
      this as FlexibleSpaceBarNode,
      other,
    );
  }

  @override
  int get hashCode {
    return FlexibleSpaceBarNodeMapper.ensureInitialized().hashValue(
      this as FlexibleSpaceBarNode,
    );
  }
}

extension FlexibleSpaceBarNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FlexibleSpaceBarNode, $Out> {
  FlexibleSpaceBarNodeCopyWith<$R, FlexibleSpaceBarNode, $Out>
  get $asFlexibleSpaceBarNode => $base.as(
    (v, t, t2) => _FlexibleSpaceBarNodeCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class FlexibleSpaceBarNodeCopyWith<
  $R,
  $In extends FlexibleSpaceBarNode,
  $Out
>
    implements CLCopyWith<$R, $In, $Out> {
  NamedSCCopyWith<$R, NamedSC, NamedSC> get title;
  NamedSCCopyWith<$R, NamedSC, NamedSC> get background;
  EdgeInsetsValueCopyWith<$R, EdgeInsetsValue, EdgeInsetsValue>?
  get titlePadding;
  @override
  $R call({
    NamedSC? title,
    NamedSC? background,
    bool? centerTitle,
    EdgeInsetsValue? titlePadding,
  });
  FlexibleSpaceBarNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _FlexibleSpaceBarNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FlexibleSpaceBarNode, $Out>
    implements FlexibleSpaceBarNodeCopyWith<$R, FlexibleSpaceBarNode, $Out> {
  _FlexibleSpaceBarNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FlexibleSpaceBarNode> $mapper =
      FlexibleSpaceBarNodeMapper.ensureInitialized();
  @override
  NamedSCCopyWith<$R, NamedSC, NamedSC> get title =>
      $value.title.copyWith.$chain((v) => call(title: v));
  @override
  NamedSCCopyWith<$R, NamedSC, NamedSC> get background =>
      $value.background.copyWith.$chain((v) => call(background: v));
  @override
  EdgeInsetsValueCopyWith<$R, EdgeInsetsValue, EdgeInsetsValue>?
  get titlePadding =>
      $value.titlePadding?.copyWith.$chain((v) => call(titlePadding: v));
  @override
  $R call({
    NamedSC? title,
    NamedSC? background,
    Object? centerTitle = $none,
    Object? titlePadding = $none,
  }) => $apply(
    FieldCopyWithData({
      if (title != null) #title: title,
      if (background != null) #background: background,
      if (centerTitle != $none) #centerTitle: centerTitle,
      if (titlePadding != $none) #titlePadding: titlePadding,
    }),
  );
  @override
  FlexibleSpaceBarNode $make(CopyWithData data) => FlexibleSpaceBarNode(
    title: data.get(#title, or: $value.title),
    background: data.get(#background, or: $value.background),
    centerTitle: data.get(#centerTitle, or: $value.centerTitle),
    titlePadding: data.get(#titlePadding, or: $value.titlePadding),
  );

  @override
  FlexibleSpaceBarNodeCopyWith<$R2, FlexibleSpaceBarNode, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _FlexibleSpaceBarNodeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

