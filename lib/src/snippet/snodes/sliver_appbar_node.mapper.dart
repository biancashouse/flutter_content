// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'sliver_appbar_node.dart';

class SliverAppBarNodeMapper extends SubClassMapperBase<SliverAppBarNode> {
  SliverAppBarNodeMapper._();

  static SliverAppBarNodeMapper? _instance;
  static SliverAppBarNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SliverAppBarNodeMapper._());
      AppBarNodeMapper.ensureInitialized().addSubMapper(_instance!);
      NamedSCMapper.ensureInitialized();
      ColorModelMapper.ensureInitialized();
      TextStylePropertiesMapper.ensureInitialized();
      NamedPSMapper.ensureInitialized();
      NamedMCMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SliverAppBarNode';

  static double? _$collapsedHeight(SliverAppBarNode v) => v.collapsedHeight;
  static const Field<SliverAppBarNode, double> _f$collapsedHeight = Field(
    'collapsedHeight',
    _$collapsedHeight,
    opt: true,
  );
  static double? _$expandedHeight(SliverAppBarNode v) => v.expandedHeight;
  static const Field<SliverAppBarNode, double> _f$expandedHeight = Field(
    'expandedHeight',
    _$expandedHeight,
    opt: true,
  );
  static NamedSC? _$flexibleSpace(SliverAppBarNode v) => v.flexibleSpace;
  static const Field<SliverAppBarNode, NamedSC> _f$flexibleSpace = Field(
    'flexibleSpace',
    _$flexibleSpace,
    opt: true,
  );
  static ColorModel? _$bgColor(SliverAppBarNode v) => v.bgColor;
  static const Field<SliverAppBarNode, ColorModel> _f$bgColor = Field(
    'bgColor',
    _$bgColor,
    opt: true,
  );
  static ColorModel? _$fgColor(SliverAppBarNode v) => v.fgColor;
  static const Field<SliverAppBarNode, ColorModel> _f$fgColor = Field(
    'fgColor',
    _$fgColor,
    opt: true,
  );
  static double? _$toolbarHeight(SliverAppBarNode v) => v.toolbarHeight;
  static const Field<SliverAppBarNode, double> _f$toolbarHeight = Field(
    'toolbarHeight',
    _$toolbarHeight,
    opt: true,
  );
  static TextStyleProperties _$titleTextStyle(SliverAppBarNode v) =>
      v.titleTextStyle;
  static const Field<SliverAppBarNode, TextStyleProperties> _f$titleTextStyle =
      Field('titleTextStyle', _$titleTextStyle, hook: TextStyleHook2());
  static NamedSC _$leading(SliverAppBarNode v) => v.leading;
  static const Field<SliverAppBarNode, NamedSC> _f$leading = Field(
    'leading',
    _$leading,
  );
  static NamedSC _$title(SliverAppBarNode v) => v.title;
  static const Field<SliverAppBarNode, NamedSC> _f$title = Field(
    'title',
    _$title,
  );
  static NamedPS _$bottom(SliverAppBarNode v) => v.bottom;
  static const Field<SliverAppBarNode, NamedPS> _f$bottom = Field(
    'bottom',
    _$bottom,
  );
  static NamedMC _$actions(SliverAppBarNode v) => v.actions;
  static const Field<SliverAppBarNode, NamedMC> _f$actions = Field(
    'actions',
    _$actions,
  );
  static String _$uid(SliverAppBarNode v) => v.uid;
  static const Field<SliverAppBarNode, String> _f$uid = Field(
    'uid',
    _$uid,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$treeNodeGK(SliverAppBarNode v) =>
      v.treeNodeGK;
  static const Field<SliverAppBarNode, GlobalKey<State<StatefulWidget>>>
  _f$treeNodeGK = Field('treeNodeGK', _$treeNodeGK, mode: FieldMode.member);
  static bool _$isExpanded(SliverAppBarNode v) => v.isExpanded;
  static const Field<SliverAppBarNode, bool> _f$isExpanded = Field(
    'isExpanded',
    _$isExpanded,
    mode: FieldMode.member,
  );
  static bool? _$hidePropertiesWhileDragging(SliverAppBarNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<SliverAppBarNode, bool> _f$hidePropertiesWhileDragging =
      Field(
        'hidePropertiesWhileDragging',
        _$hidePropertiesWhileDragging,
        mode: FieldMode.member,
      );
  static bool _$canShowTappableNodeWidgetOverlay(SliverAppBarNode v) =>
      v.canShowTappableNodeWidgetOverlay;
  static const Field<SliverAppBarNode, bool>
  _f$canShowTappableNodeWidgetOverlay = Field(
    'canShowTappableNodeWidgetOverlay',
    _$canShowTappableNodeWidgetOverlay,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(SliverAppBarNode v) =>
      v.nodeWidgetGK;
  static const Field<SliverAppBarNode, GlobalKey<State<StatefulWidget>>>
  _f$nodeWidgetGK = Field(
    'nodeWidgetGK',
    _$nodeWidgetGK,
    mode: FieldMode.member,
  );
  static bool? _$centerTitle(SliverAppBarNode v) => v.centerTitle;
  static const Field<SliverAppBarNode, bool> _f$centerTitle = Field(
    'centerTitle',
    _$centerTitle,
    mode: FieldMode.member,
  );
  static bool? _$large(SliverAppBarNode v) => v.large;
  static const Field<SliverAppBarNode, bool> _f$large = Field(
    'large',
    _$large,
    mode: FieldMode.member,
  );
  static bool? _$medium(SliverAppBarNode v) => v.medium;
  static const Field<SliverAppBarNode, bool> _f$medium = Field(
    'medium',
    _$medium,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<SliverAppBarNode> fields = const {
    #collapsedHeight: _f$collapsedHeight,
    #expandedHeight: _f$expandedHeight,
    #flexibleSpace: _f$flexibleSpace,
    #bgColor: _f$bgColor,
    #fgColor: _f$fgColor,
    #toolbarHeight: _f$toolbarHeight,
    #titleTextStyle: _f$titleTextStyle,
    #leading: _f$leading,
    #title: _f$title,
    #bottom: _f$bottom,
    #actions: _f$actions,
    #uid: _f$uid,
    #treeNodeGK: _f$treeNodeGK,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #canShowTappableNodeWidgetOverlay: _f$canShowTappableNodeWidgetOverlay,
    #nodeWidgetGK: _f$nodeWidgetGK,
    #centerTitle: _f$centerTitle,
    #large: _f$large,
    #medium: _f$medium,
  };

  @override
  final String discriminatorKey = 'appbar';
  @override
  final dynamic discriminatorValue = 'SliverAppBarNode';
  @override
  late final ClassMapperBase superMapper = AppBarNodeMapper.ensureInitialized();

  static SliverAppBarNode _instantiate(DecodingData data) {
    return SliverAppBarNode(
      collapsedHeight: data.dec(_f$collapsedHeight),
      expandedHeight: data.dec(_f$expandedHeight),
      flexibleSpace: data.dec(_f$flexibleSpace),
      bgColor: data.dec(_f$bgColor),
      fgColor: data.dec(_f$fgColor),
      toolbarHeight: data.dec(_f$toolbarHeight),
      titleTextStyle: data.dec(_f$titleTextStyle),
      leading: data.dec(_f$leading),
      title: data.dec(_f$title),
      bottom: data.dec(_f$bottom),
      actions: data.dec(_f$actions),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static SliverAppBarNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SliverAppBarNode>(map);
  }

  static SliverAppBarNode fromJson(String json) {
    return ensureInitialized().decodeJson<SliverAppBarNode>(json);
  }
}

mixin SliverAppBarNodeMappable {
  String toJson() {
    return SliverAppBarNodeMapper.ensureInitialized()
        .encodeJson<SliverAppBarNode>(this as SliverAppBarNode);
  }

  Map<String, dynamic> toMap() {
    return SliverAppBarNodeMapper.ensureInitialized()
        .encodeMap<SliverAppBarNode>(this as SliverAppBarNode);
  }

  SliverAppBarNodeCopyWith<SliverAppBarNode, SliverAppBarNode, SliverAppBarNode>
  get copyWith =>
      _SliverAppBarNodeCopyWithImpl<SliverAppBarNode, SliverAppBarNode>(
        this as SliverAppBarNode,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return SliverAppBarNodeMapper.ensureInitialized().stringifyValue(
      this as SliverAppBarNode,
    );
  }

  @override
  bool operator ==(Object other) {
    return SliverAppBarNodeMapper.ensureInitialized().equalsValue(
      this as SliverAppBarNode,
      other,
    );
  }

  @override
  int get hashCode {
    return SliverAppBarNodeMapper.ensureInitialized().hashValue(
      this as SliverAppBarNode,
    );
  }
}

extension SliverAppBarNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SliverAppBarNode, $Out> {
  SliverAppBarNodeCopyWith<$R, SliverAppBarNode, $Out>
  get $asSliverAppBarNode =>
      $base.as((v, t, t2) => _SliverAppBarNodeCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SliverAppBarNodeCopyWith<$R, $In extends SliverAppBarNode, $Out>
    implements AppBarNodeCopyWith<$R, $In, $Out> {
  NamedSCCopyWith<$R, NamedSC, NamedSC>? get flexibleSpace;
  @override
  ColorModelCopyWith<$R, ColorModel, ColorModel>? get bgColor;
  @override
  ColorModelCopyWith<$R, ColorModel, ColorModel>? get fgColor;
  @override
  TextStylePropertiesCopyWith<$R, TextStyleProperties, TextStyleProperties>
  get titleTextStyle;
  @override
  NamedSCCopyWith<$R, NamedSC, NamedSC> get leading;
  @override
  NamedSCCopyWith<$R, NamedSC, NamedSC> get title;
  @override
  NamedPSCopyWith<$R, NamedPS, NamedPS> get bottom;
  @override
  NamedMCCopyWith<$R, NamedMC, NamedMC> get actions;
  @override
  $R call({
    double? collapsedHeight,
    double? expandedHeight,
    NamedSC? flexibleSpace,
    ColorModel? bgColor,
    ColorModel? fgColor,
    double? toolbarHeight,
    TextStyleProperties? titleTextStyle,
    NamedSC? leading,
    NamedSC? title,
    NamedPS? bottom,
    NamedMC? actions,
  });
  SliverAppBarNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SliverAppBarNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SliverAppBarNode, $Out>
    implements SliverAppBarNodeCopyWith<$R, SliverAppBarNode, $Out> {
  _SliverAppBarNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SliverAppBarNode> $mapper =
      SliverAppBarNodeMapper.ensureInitialized();
  @override
  NamedSCCopyWith<$R, NamedSC, NamedSC>? get flexibleSpace =>
      $value.flexibleSpace?.copyWith.$chain((v) => call(flexibleSpace: v));
  @override
  ColorModelCopyWith<$R, ColorModel, ColorModel>? get bgColor =>
      $value.bgColor?.copyWith.$chain((v) => call(bgColor: v));
  @override
  ColorModelCopyWith<$R, ColorModel, ColorModel>? get fgColor =>
      $value.fgColor?.copyWith.$chain((v) => call(fgColor: v));
  @override
  TextStylePropertiesCopyWith<$R, TextStyleProperties, TextStyleProperties>
  get titleTextStyle =>
      $value.titleTextStyle.copyWith.$chain((v) => call(titleTextStyle: v));
  @override
  NamedSCCopyWith<$R, NamedSC, NamedSC> get leading =>
      $value.leading.copyWith.$chain((v) => call(leading: v));
  @override
  NamedSCCopyWith<$R, NamedSC, NamedSC> get title =>
      $value.title.copyWith.$chain((v) => call(title: v));
  @override
  NamedPSCopyWith<$R, NamedPS, NamedPS> get bottom =>
      $value.bottom.copyWith.$chain((v) => call(bottom: v));
  @override
  NamedMCCopyWith<$R, NamedMC, NamedMC> get actions =>
      $value.actions.copyWith.$chain((v) => call(actions: v));
  @override
  $R call({
    Object? collapsedHeight = $none,
    Object? expandedHeight = $none,
    Object? flexibleSpace = $none,
    Object? bgColor = $none,
    Object? fgColor = $none,
    Object? toolbarHeight = $none,
    TextStyleProperties? titleTextStyle,
    NamedSC? leading,
    NamedSC? title,
    NamedPS? bottom,
    NamedMC? actions,
  }) => $apply(
    FieldCopyWithData({
      if (collapsedHeight != $none) #collapsedHeight: collapsedHeight,
      if (expandedHeight != $none) #expandedHeight: expandedHeight,
      if (flexibleSpace != $none) #flexibleSpace: flexibleSpace,
      if (bgColor != $none) #bgColor: bgColor,
      if (fgColor != $none) #fgColor: fgColor,
      if (toolbarHeight != $none) #toolbarHeight: toolbarHeight,
      if (titleTextStyle != null) #titleTextStyle: titleTextStyle,
      if (leading != null) #leading: leading,
      if (title != null) #title: title,
      if (bottom != null) #bottom: bottom,
      if (actions != null) #actions: actions,
    }),
  );
  @override
  SliverAppBarNode $make(CopyWithData data) => SliverAppBarNode(
    collapsedHeight: data.get(#collapsedHeight, or: $value.collapsedHeight),
    expandedHeight: data.get(#expandedHeight, or: $value.expandedHeight),
    flexibleSpace: data.get(#flexibleSpace, or: $value.flexibleSpace),
    bgColor: data.get(#bgColor, or: $value.bgColor),
    fgColor: data.get(#fgColor, or: $value.fgColor),
    toolbarHeight: data.get(#toolbarHeight, or: $value.toolbarHeight),
    titleTextStyle: data.get(#titleTextStyle, or: $value.titleTextStyle),
    leading: data.get(#leading, or: $value.leading),
    title: data.get(#title, or: $value.title),
    bottom: data.get(#bottom, or: $value.bottom),
    actions: data.get(#actions, or: $value.actions),
  );

  @override
  SliverAppBarNodeCopyWith<$R2, SliverAppBarNode, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _SliverAppBarNodeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

