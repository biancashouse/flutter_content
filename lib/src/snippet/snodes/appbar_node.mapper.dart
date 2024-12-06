// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'appbar_node.dart';

class AppBarNodeMapper extends SubClassMapperBase<AppBarNode> {
  AppBarNodeMapper._();

  static AppBarNodeMapper? _instance;
  static AppBarNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AppBarNodeMapper._());
      STreeNodeMapper.ensureInitialized().addSubMapper(_instance!);
      GenericSingleChildNodeMapper.ensureInitialized();
      GenericMultiChildNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AppBarNode';

  static int? _$bgColorValue(AppBarNode v) => v.bgColorValue;
  static const Field<AppBarNode, int> _f$bgColorValue =
      Field('bgColorValue', _$bgColorValue, opt: true);
  static int? _$fgColorValue(AppBarNode v) => v.fgColorValue;
  static const Field<AppBarNode, int> _f$fgColorValue =
      Field('fgColorValue', _$fgColorValue, opt: true);
  static double? _$height(AppBarNode v) => v.height;
  static const Field<AppBarNode, double> _f$height =
      Field('height', _$height, opt: true);
  static GenericSingleChildNode? _$leading(AppBarNode v) => v.leading;
  static const Field<AppBarNode, GenericSingleChildNode> _f$leading =
      Field('leading', _$leading, opt: true);
  static GenericSingleChildNode? _$title(AppBarNode v) => v.title;
  static const Field<AppBarNode, GenericSingleChildNode> _f$title =
      Field('title', _$title, opt: true);
  static GenericSingleChildNode? _$bottom(AppBarNode v) => v.bottom;
  static const Field<AppBarNode, GenericSingleChildNode> _f$bottom =
      Field('bottom', _$bottom, opt: true);
  static GenericMultiChildNode? _$actions(AppBarNode v) => v.actions;
  static const Field<AppBarNode, GenericMultiChildNode> _f$actions =
      Field('actions', _$actions, opt: true);
  static String _$uid(AppBarNode v) => v.uid;
  static const Field<AppBarNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static bool _$isExpanded(AppBarNode v) => v.isExpanded;
  static const Field<AppBarNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(AppBarNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<AppBarNode, bool> _f$hidePropertiesWhileDragging = Field(
      'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
      mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(AppBarNode v) =>
      v.nodeWidgetGK;
  static const Field<AppBarNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<AppBarNode> fields = const {
    #bgColorValue: _f$bgColorValue,
    #fgColorValue: _f$fgColorValue,
    #height: _f$height,
    #leading: _f$leading,
    #title: _f$title,
    #bottom: _f$bottom,
    #actions: _f$actions,
    #uid: _f$uid,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'snode';
  @override
  final dynamic discriminatorValue = 'AppBarNode';
  @override
  late final ClassMapperBase superMapper = STreeNodeMapper.ensureInitialized();

  static AppBarNode _instantiate(DecodingData data) {
    return AppBarNode(
        bgColorValue: data.dec(_f$bgColorValue),
        fgColorValue: data.dec(_f$fgColorValue),
        height: data.dec(_f$height),
        leading: data.dec(_f$leading),
        title: data.dec(_f$title),
        bottom: data.dec(_f$bottom),
        actions: data.dec(_f$actions));
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
    return AppBarNodeMapper.ensureInitialized()
        .encodeJson<AppBarNode>(this as AppBarNode);
  }

  Map<String, dynamic> toMap() {
    return AppBarNodeMapper.ensureInitialized()
        .encodeMap<AppBarNode>(this as AppBarNode);
  }

  AppBarNodeCopyWith<AppBarNode, AppBarNode, AppBarNode> get copyWith =>
      _AppBarNodeCopyWithImpl(this as AppBarNode, $identity, $identity);
  @override
  String toString() {
    return AppBarNodeMapper.ensureInitialized()
        .stringifyValue(this as AppBarNode);
  }

  @override
  bool operator ==(Object other) {
    return AppBarNodeMapper.ensureInitialized()
        .equalsValue(this as AppBarNode, other);
  }

  @override
  int get hashCode {
    return AppBarNodeMapper.ensureInitialized().hashValue(this as AppBarNode);
  }
}

extension AppBarNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AppBarNode, $Out> {
  AppBarNodeCopyWith<$R, AppBarNode, $Out> get $asAppBarNode =>
      $base.as((v, t, t2) => _AppBarNodeCopyWithImpl(v, t, t2));
}

abstract class AppBarNodeCopyWith<$R, $In extends AppBarNode, $Out>
    implements STreeNodeCopyWith<$R, $In, $Out> {
  GenericSingleChildNodeCopyWith<$R, GenericSingleChildNode,
      GenericSingleChildNode>? get leading;
  GenericSingleChildNodeCopyWith<$R, GenericSingleChildNode,
      GenericSingleChildNode>? get title;
  GenericSingleChildNodeCopyWith<$R, GenericSingleChildNode,
      GenericSingleChildNode>? get bottom;
  GenericMultiChildNodeCopyWith<$R, GenericMultiChildNode,
      GenericMultiChildNode>? get actions;
  @override
  $R call(
      {int? bgColorValue,
      int? fgColorValue,
      double? height,
      GenericSingleChildNode? leading,
      GenericSingleChildNode? title,
      GenericSingleChildNode? bottom,
      GenericMultiChildNode? actions});
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
  GenericSingleChildNodeCopyWith<$R, GenericSingleChildNode,
          GenericSingleChildNode>?
      get leading => $value.leading?.copyWith.$chain((v) => call(leading: v));
  @override
  GenericSingleChildNodeCopyWith<$R, GenericSingleChildNode,
          GenericSingleChildNode>?
      get title => $value.title?.copyWith.$chain((v) => call(title: v));
  @override
  GenericSingleChildNodeCopyWith<$R, GenericSingleChildNode,
          GenericSingleChildNode>?
      get bottom => $value.bottom?.copyWith.$chain((v) => call(bottom: v));
  @override
  GenericMultiChildNodeCopyWith<$R, GenericMultiChildNode,
          GenericMultiChildNode>?
      get actions => $value.actions?.copyWith.$chain((v) => call(actions: v));
  @override
  $R call(
          {Object? bgColorValue = $none,
          Object? fgColorValue = $none,
          Object? height = $none,
          Object? leading = $none,
          Object? title = $none,
          Object? bottom = $none,
          Object? actions = $none}) =>
      $apply(FieldCopyWithData({
        if (bgColorValue != $none) #bgColorValue: bgColorValue,
        if (fgColorValue != $none) #fgColorValue: fgColorValue,
        if (height != $none) #height: height,
        if (leading != $none) #leading: leading,
        if (title != $none) #title: title,
        if (bottom != $none) #bottom: bottom,
        if (actions != $none) #actions: actions
      }));
  @override
  AppBarNode $make(CopyWithData data) => AppBarNode(
      bgColorValue: data.get(#bgColorValue, or: $value.bgColorValue),
      fgColorValue: data.get(#fgColorValue, or: $value.fgColorValue),
      height: data.get(#height, or: $value.height),
      leading: data.get(#leading, or: $value.leading),
      title: data.get(#title, or: $value.title),
      bottom: data.get(#bottom, or: $value.bottom),
      actions: data.get(#actions, or: $value.actions));

  @override
  AppBarNodeCopyWith<$R2, AppBarNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AppBarNodeCopyWithImpl($value, $cast, t);
}
