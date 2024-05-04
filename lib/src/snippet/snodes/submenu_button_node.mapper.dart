// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'submenu_button_node.dart';

class SubmenuButtonNodeMapper extends SubClassMapperBase<SubmenuButtonNode> {
  SubmenuButtonNodeMapper._();

  static SubmenuButtonNodeMapper? _instance;
  static SubmenuButtonNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SubmenuButtonNodeMapper._());
      MCMapper.ensureInitialized().addSubMapper(_instance!);
      STreeNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SubmenuButtonNode';

  static String _$itemLabel(SubmenuButtonNode v) => v.itemLabel;
  static const Field<SubmenuButtonNode, String> _f$itemLabel =
      Field('itemLabel', _$itemLabel, opt: true, def: 'label?');
  static List<STreeNode> _$menuChildren(SubmenuButtonNode v) => v.menuChildren;
  static const Field<SubmenuButtonNode, List<STreeNode>> _f$menuChildren =
      Field('menuChildren', _$menuChildren);
  static String _$uid(SubmenuButtonNode v) => v.uid;
  static const Field<SubmenuButtonNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static bool _$isExpanded(SubmenuButtonNode v) => v.isExpanded;
  static const Field<SubmenuButtonNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(SubmenuButtonNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<SubmenuButtonNode, bool> _f$hidePropertiesWhileDragging =
      Field('hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
          mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(
          SubmenuButtonNode v) =>
      v.nodeWidgetGK;
  static const Field<SubmenuButtonNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);
  static List<STreeNode> _$children(SubmenuButtonNode v) => v.children;
  static const Field<SubmenuButtonNode, List<STreeNode>> _f$children =
      Field('children', _$children, mode: FieldMode.member);

  @override
  final MappableFields<SubmenuButtonNode> fields = const {
    #itemLabel: _f$itemLabel,
    #menuChildren: _f$menuChildren,
    #uid: _f$uid,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
    #children: _f$children,
  };

  @override
  final String discriminatorKey = 'mc';
  @override
  final dynamic discriminatorValue = 'SubmenuButtonNode';
  @override
  late final ClassMapperBase superMapper = MCMapper.ensureInitialized();

  static SubmenuButtonNode _instantiate(DecodingData data) {
    return SubmenuButtonNode(
        itemLabel: data.dec(_f$itemLabel),
        menuChildren: data.dec(_f$menuChildren));
  }

  @override
  final Function instantiate = _instantiate;

  static SubmenuButtonNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SubmenuButtonNode>(map);
  }

  static SubmenuButtonNode fromJson(String json) {
    return ensureInitialized().decodeJson<SubmenuButtonNode>(json);
  }
}

mixin SubmenuButtonNodeMappable {
  String toJson() {
    return SubmenuButtonNodeMapper.ensureInitialized()
        .encodeJson<SubmenuButtonNode>(this as SubmenuButtonNode);
  }

  Map<String, dynamic> toMap() {
    return SubmenuButtonNodeMapper.ensureInitialized()
        .encodeMap<SubmenuButtonNode>(this as SubmenuButtonNode);
  }

  SubmenuButtonNodeCopyWith<SubmenuButtonNode, SubmenuButtonNode,
          SubmenuButtonNode>
      get copyWith => _SubmenuButtonNodeCopyWithImpl(
          this as SubmenuButtonNode, $identity, $identity);
  @override
  String toString() {
    return SubmenuButtonNodeMapper.ensureInitialized()
        .stringifyValue(this as SubmenuButtonNode);
  }

  @override
  bool operator ==(Object other) {
    return SubmenuButtonNodeMapper.ensureInitialized()
        .equalsValue(this as SubmenuButtonNode, other);
  }

  @override
  int get hashCode {
    return SubmenuButtonNodeMapper.ensureInitialized()
        .hashValue(this as SubmenuButtonNode);
  }
}

extension SubmenuButtonNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SubmenuButtonNode, $Out> {
  SubmenuButtonNodeCopyWith<$R, SubmenuButtonNode, $Out>
      get $asSubmenuButtonNode =>
          $base.as((v, t, t2) => _SubmenuButtonNodeCopyWithImpl(v, t, t2));
}

abstract class SubmenuButtonNodeCopyWith<$R, $In extends SubmenuButtonNode,
    $Out> implements MCCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, STreeNode, STreeNodeCopyWith<$R, STreeNode, STreeNode>>
      get menuChildren;
  @override
  $R call({String? itemLabel, List<STreeNode>? menuChildren});
  SubmenuButtonNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SubmenuButtonNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SubmenuButtonNode, $Out>
    implements SubmenuButtonNodeCopyWith<$R, SubmenuButtonNode, $Out> {
  _SubmenuButtonNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SubmenuButtonNode> $mapper =
      SubmenuButtonNodeMapper.ensureInitialized();
  @override
  ListCopyWith<$R, STreeNode, STreeNodeCopyWith<$R, STreeNode, STreeNode>>
      get menuChildren => ListCopyWith($value.menuChildren,
          (v, t) => v.copyWith.$chain(t), (v) => call(menuChildren: v));
  @override
  $R call({String? itemLabel, List<STreeNode>? menuChildren}) =>
      $apply(FieldCopyWithData({
        if (itemLabel != null) #itemLabel: itemLabel,
        if (menuChildren != null) #menuChildren: menuChildren
      }));
  @override
  SubmenuButtonNode $make(CopyWithData data) => SubmenuButtonNode(
      itemLabel: data.get(#itemLabel, or: $value.itemLabel),
      menuChildren: data.get(#menuChildren, or: $value.menuChildren));

  @override
  SubmenuButtonNodeCopyWith<$R2, SubmenuButtonNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SubmenuButtonNodeCopyWithImpl($value, $cast, t);
}
