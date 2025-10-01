// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'tab_node.dart';

class TabNodeMapper extends SubClassMapperBase<TabNode> {
  TabNodeMapper._();

  static TabNodeMapper? _instance;
  static TabNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TabNodeMapper._());
      SCMapper.ensureInitialized().addSubMapper(_instance!);
      EdgeInsetsValueMapper.ensureInitialized();
      SNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TabNode';

  static String _$text(TabNode v) => v.text;
  static const Field<TabNode, String> _f$text =
      Field('text', _$text, opt: true, def: '');
  static Widget? _$icon(TabNode v) => v.icon;
  static const Field<TabNode, Widget> _f$icon =
      Field('icon', _$icon, opt: true);
  static EdgeInsetsValue? _$iconMargin(TabNode v) => v.iconMargin;
  static const Field<TabNode, EdgeInsetsValue> _f$iconMargin =
      Field('iconMargin', _$iconMargin, opt: true);
  static double? _$height(TabNode v) => v.height;
  static const Field<TabNode, double> _f$height =
      Field('height', _$height, opt: true);
  static SNode? _$child(TabNode v) => v.child;
  static const Field<TabNode, SNode> _f$child =
      Field('child', _$child, opt: true);
  static String _$uid(TabNode v) => v.uid;
  static const Field<TabNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$treeNodeGK(TabNode v) =>
      v.treeNodeGK;
  static const Field<TabNode, GlobalKey<State<StatefulWidget>>> _f$treeNodeGK =
      Field('treeNodeGK', _$treeNodeGK, mode: FieldMode.member);
  static bool _$isExpanded(TabNode v) => v.isExpanded;
  static const Field<TabNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(TabNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<TabNode, bool> _f$hidePropertiesWhileDragging = Field(
      'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
      mode: FieldMode.member);

  @override
  final MappableFields<TabNode> fields = const {
    #text: _f$text,
    #icon: _f$icon,
    #iconMargin: _f$iconMargin,
    #height: _f$height,
    #child: _f$child,
    #uid: _f$uid,
    #treeNodeGK: _f$treeNodeGK,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
  };

  @override
  final String discriminatorKey = 'sc';
  @override
  final dynamic discriminatorValue = 'TabNode';
  @override
  late final ClassMapperBase superMapper = SCMapper.ensureInitialized();

  static TabNode _instantiate(DecodingData data) {
    return TabNode(
        text: data.dec(_f$text),
        icon: data.dec(_f$icon),
        iconMargin: data.dec(_f$iconMargin),
        height: data.dec(_f$height),
        child: data.dec(_f$child));
  }

  @override
  final Function instantiate = _instantiate;

  static TabNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TabNode>(map);
  }

  static TabNode fromJson(String json) {
    return ensureInitialized().decodeJson<TabNode>(json);
  }
}

mixin TabNodeMappable {
  String toJson() {
    return TabNodeMapper.ensureInitialized()
        .encodeJson<TabNode>(this as TabNode);
  }

  Map<String, dynamic> toMap() {
    return TabNodeMapper.ensureInitialized()
        .encodeMap<TabNode>(this as TabNode);
  }

  TabNodeCopyWith<TabNode, TabNode, TabNode> get copyWith =>
      _TabNodeCopyWithImpl<TabNode, TabNode>(
          this as TabNode, $identity, $identity);
  @override
  String toString() {
    return TabNodeMapper.ensureInitialized().stringifyValue(this as TabNode);
  }

  @override
  bool operator ==(Object other) {
    return TabNodeMapper.ensureInitialized()
        .equalsValue(this as TabNode, other);
  }

  @override
  int get hashCode {
    return TabNodeMapper.ensureInitialized().hashValue(this as TabNode);
  }
}

extension TabNodeValueCopy<$R, $Out> on ObjectCopyWith<$R, TabNode, $Out> {
  TabNodeCopyWith<$R, TabNode, $Out> get $asTabNode =>
      $base.as((v, t, t2) => _TabNodeCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TabNodeCopyWith<$R, $In extends TabNode, $Out>
    implements SCCopyWith<$R, $In, $Out> {
  EdgeInsetsValueCopyWith<$R, EdgeInsetsValue, EdgeInsetsValue>? get iconMargin;
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child;
  @override
  $R call(
      {String? text,
      Widget? icon,
      EdgeInsetsValue? iconMargin,
      double? height,
      SNode? child});
  TabNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TabNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TabNode, $Out>
    implements TabNodeCopyWith<$R, TabNode, $Out> {
  _TabNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TabNode> $mapper =
      TabNodeMapper.ensureInitialized();
  @override
  EdgeInsetsValueCopyWith<$R, EdgeInsetsValue, EdgeInsetsValue>?
      get iconMargin =>
          $value.iconMargin?.copyWith.$chain((v) => call(iconMargin: v));
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child =>
      $value.child?.copyWith.$chain((v) => call(child: v));
  @override
  $R call(
          {String? text,
          Object? icon = $none,
          Object? iconMargin = $none,
          Object? height = $none,
          Object? child = $none}) =>
      $apply(FieldCopyWithData({
        if (text != null) #text: text,
        if (icon != $none) #icon: icon,
        if (iconMargin != $none) #iconMargin: iconMargin,
        if (height != $none) #height: height,
        if (child != $none) #child: child
      }));
  @override
  TabNode $make(CopyWithData data) => TabNode(
      text: data.get(#text, or: $value.text),
      icon: data.get(#icon, or: $value.icon),
      iconMargin: data.get(#iconMargin, or: $value.iconMargin),
      height: data.get(#height, or: $value.height),
      child: data.get(#child, or: $value.child));

  @override
  TabNodeCopyWith<$R2, TabNode, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _TabNodeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
