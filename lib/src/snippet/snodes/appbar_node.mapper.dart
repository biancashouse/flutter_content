// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'appbar_node.dart';

class AppBarNodeMapper extends SubClassMapperBase<AppBarNode> {
  AppBarNodeMapper._();

  static AppBarNodeMapper? _instance;
  static AppBarNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AppBarNodeMapper._());
      CLMapper.ensureInitialized().addSubMapper(_instance!);
      SliverAppBarNodeMapper.ensureInitialized();
      ColorModelMapper.ensureInitialized();
      TextStylePropertiesMapper.ensureInitialized();
      NamedSCMapper.ensureInitialized();
      NamedPSMapper.ensureInitialized();
      NamedMCMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AppBarNode';

  static ColorModel? _$bgColor(AppBarNode v) => v.bgColor;
  static const Field<AppBarNode, ColorModel> _f$bgColor = Field(
    'bgColor',
    _$bgColor,
    opt: true,
  );
  static ColorModel? _$fgColor(AppBarNode v) => v.fgColor;
  static const Field<AppBarNode, ColorModel> _f$fgColor = Field(
    'fgColor',
    _$fgColor,
    opt: true,
  );
  static double? _$toolbarHeight(AppBarNode v) => v.toolbarHeight;
  static const Field<AppBarNode, double> _f$toolbarHeight = Field(
    'toolbarHeight',
    _$toolbarHeight,
    opt: true,
  );
  static TextStyleProperties _$titleTextStyle(AppBarNode v) => v.titleTextStyle;
  static const Field<AppBarNode, TextStyleProperties> _f$titleTextStyle = Field(
    'titleTextStyle',
    _$titleTextStyle,
    hook: TextStyleHook2(),
  );
  static bool? _$centerTitle(AppBarNode v) => v.centerTitle;
  static const Field<AppBarNode, bool> _f$centerTitle = Field(
    'centerTitle',
    _$centerTitle,
    opt: true,
  );
  static NamedSC _$leading(AppBarNode v) => v.leading;
  static const Field<AppBarNode, NamedSC> _f$leading = Field(
    'leading',
    _$leading,
  );
  static NamedSC _$title(AppBarNode v) => v.title;
  static const Field<AppBarNode, NamedSC> _f$title = Field('title', _$title);
  static NamedPS _$bottom(AppBarNode v) => v.bottom;
  static const Field<AppBarNode, NamedPS> _f$bottom = Field('bottom', _$bottom);
  static NamedMC _$actions(AppBarNode v) => v.actions;
  static const Field<AppBarNode, NamedMC> _f$actions = Field(
    'actions',
    _$actions,
  );
  static String _$uid(AppBarNode v) => v.uid;
  static const Field<AppBarNode, String> _f$uid = Field(
    'uid',
    _$uid,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$treeNodeGK(AppBarNode v) =>
      v.treeNodeGK;
  static const Field<AppBarNode, GlobalKey<State<StatefulWidget>>>
  _f$treeNodeGK = Field('treeNodeGK', _$treeNodeGK, mode: FieldMode.member);
  static bool _$isExpanded(AppBarNode v) => v.isExpanded;
  static const Field<AppBarNode, bool> _f$isExpanded = Field(
    'isExpanded',
    _$isExpanded,
    mode: FieldMode.member,
  );
  static bool? _$hidePropertiesWhileDragging(AppBarNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<AppBarNode, bool> _f$hidePropertiesWhileDragging = Field(
    'hidePropertiesWhileDragging',
    _$hidePropertiesWhileDragging,
    mode: FieldMode.member,
  );
  static bool _$canShowTappableNodeWidgetOverlay(AppBarNode v) =>
      v.canShowTappableNodeWidgetOverlay;
  static const Field<AppBarNode, bool> _f$canShowTappableNodeWidgetOverlay =
      Field(
        'canShowTappableNodeWidgetOverlay',
        _$canShowTappableNodeWidgetOverlay,
        mode: FieldMode.member,
      );
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(AppBarNode v) =>
      v.nodeWidgetGK;
  static const Field<AppBarNode, GlobalKey<State<StatefulWidget>>>
  _f$nodeWidgetGK = Field(
    'nodeWidgetGK',
    _$nodeWidgetGK,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<AppBarNode> fields = const {
    #bgColor: _f$bgColor,
    #fgColor: _f$fgColor,
    #toolbarHeight: _f$toolbarHeight,
    #titleTextStyle: _f$titleTextStyle,
    #centerTitle: _f$centerTitle,
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
  };

  @override
  final String discriminatorKey = 'cl';
  @override
  final dynamic discriminatorValue = 'AppBarNode';
  @override
  late final ClassMapperBase superMapper = CLMapper.ensureInitialized();

  static AppBarNode _instantiate(DecodingData data) {
    return AppBarNode(
      bgColor: data.dec(_f$bgColor),
      fgColor: data.dec(_f$fgColor),
      toolbarHeight: data.dec(_f$toolbarHeight),
      titleTextStyle: data.dec(_f$titleTextStyle),
      centerTitle: data.dec(_f$centerTitle),
      leading: data.dec(_f$leading),
      title: data.dec(_f$title),
      bottom: data.dec(_f$bottom),
      actions: data.dec(_f$actions),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AppBarNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AppBarNode>(map);
  }

  static AppBarNode fromJson(String json) {
    return ensureInitialized().decodeJson<AppBarNode>(json);
  }
}

mixin AppBarNodeMappable {
  String toJson() {
    return AppBarNodeMapper.ensureInitialized().encodeJson<AppBarNode>(
      this as AppBarNode,
    );
  }

  Map<String, dynamic> toMap() {
    return AppBarNodeMapper.ensureInitialized().encodeMap<AppBarNode>(
      this as AppBarNode,
    );
  }

  AppBarNodeCopyWith<AppBarNode, AppBarNode, AppBarNode> get copyWith =>
      _AppBarNodeCopyWithImpl<AppBarNode, AppBarNode>(
        this as AppBarNode,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return AppBarNodeMapper.ensureInitialized().stringifyValue(
      this as AppBarNode,
    );
  }

  @override
  bool operator ==(Object other) {
    return AppBarNodeMapper.ensureInitialized().equalsValue(
      this as AppBarNode,
      other,
    );
  }

  @override
  int get hashCode {
    return AppBarNodeMapper.ensureInitialized().hashValue(this as AppBarNode);
  }
}

extension AppBarNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AppBarNode, $Out> {
  AppBarNodeCopyWith<$R, AppBarNode, $Out> get $asAppBarNode =>
      $base.as((v, t, t2) => _AppBarNodeCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AppBarNodeCopyWith<$R, $In extends AppBarNode, $Out>
    implements CLCopyWith<$R, $In, $Out> {
  ColorModelCopyWith<$R, ColorModel, ColorModel>? get bgColor;
  ColorModelCopyWith<$R, ColorModel, ColorModel>? get fgColor;
  TextStylePropertiesCopyWith<$R, TextStyleProperties, TextStyleProperties>
  get titleTextStyle;
  NamedSCCopyWith<$R, NamedSC, NamedSC> get leading;
  NamedSCCopyWith<$R, NamedSC, NamedSC> get title;
  NamedPSCopyWith<$R, NamedPS, NamedPS> get bottom;
  NamedMCCopyWith<$R, NamedMC, NamedMC> get actions;
  @override
  $R call({
    ColorModel? bgColor,
    ColorModel? fgColor,
    double? toolbarHeight,
    TextStyleProperties? titleTextStyle,
    NamedSC? leading,
    NamedSC? title,
    NamedPS? bottom,
    NamedMC? actions,
  });
  AppBarNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AppBarNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AppBarNode, $Out>
    implements AppBarNodeCopyWith<$R, AppBarNode, $Out> {
  _AppBarNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AppBarNode> $mapper =
      AppBarNodeMapper.ensureInitialized();
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
  AppBarNode $make(CopyWithData data) => AppBarNode(
    bgColor: data.get(#bgColor, or: $value.bgColor),
    fgColor: data.get(#fgColor, or: $value.fgColor),
    toolbarHeight: data.get(#toolbarHeight, or: $value.toolbarHeight),
    titleTextStyle: data.get(#titleTextStyle, or: $value.titleTextStyle),
    centerTitle: data.get(#centerTitle, or: $value.centerTitle),
    leading: data.get(#leading, or: $value.leading),
    title: data.get(#title, or: $value.title),
    bottom: data.get(#bottom, or: $value.bottom),
    actions: data.get(#actions, or: $value.actions),
  );

  @override
  AppBarNodeCopyWith<$R2, AppBarNode, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _AppBarNodeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

