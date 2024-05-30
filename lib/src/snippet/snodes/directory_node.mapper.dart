// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'directory_node.dart';

class DirectoryNodeMapper extends SubClassMapperBase<DirectoryNode> {
  DirectoryNodeMapper._();

  static DirectoryNodeMapper? _instance;
  static DirectoryNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DirectoryNodeMapper._());
      MCMapper.ensureInitialized().addSubMapper(_instance!);
      STreeNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'DirectoryNode';

  static String? _$name(DirectoryNode v) => v.name;
  static const Field<DirectoryNode, String> _f$name =
      Field('name', _$name, opt: true);
  static List<STreeNode> _$children(DirectoryNode v) => v.children;
  static const Field<DirectoryNode, List<STreeNode>> _f$children =
      Field('children', _$children);
  static String _$uid(DirectoryNode v) => v.uid;
  static const Field<DirectoryNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static bool _$isExpanded(DirectoryNode v) => v.isExpanded;
  static const Field<DirectoryNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(DirectoryNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<DirectoryNode, bool> _f$hidePropertiesWhileDragging =
      Field('hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
          mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(DirectoryNode v) =>
      v.nodeWidgetGK;
  static const Field<DirectoryNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<DirectoryNode> fields = const {
    #name: _f$name,
    #children: _f$children,
    #uid: _f$uid,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'mc';
  @override
  final dynamic discriminatorValue = 'DirectoryNode';
  @override
  late final ClassMapperBase superMapper = MCMapper.ensureInitialized();

  static DirectoryNode _instantiate(DecodingData data) {
    return DirectoryNode(
        name: data.dec(_f$name), children: data.dec(_f$children));
  }

  @override
  final Function instantiate = _instantiate;

  static DirectoryNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DirectoryNode>(map);
  }

  static DirectoryNode fromJson(String json) {
    return ensureInitialized().decodeJson<DirectoryNode>(json);
  }
}

mixin DirectoryNodeMappable {
  String toJson() {
    return DirectoryNodeMapper.ensureInitialized()
        .encodeJson<DirectoryNode>(this as DirectoryNode);
  }

  Map<String, dynamic> toMap() {
    return DirectoryNodeMapper.ensureInitialized()
        .encodeMap<DirectoryNode>(this as DirectoryNode);
  }

  DirectoryNodeCopyWith<DirectoryNode, DirectoryNode, DirectoryNode>
      get copyWith => _DirectoryNodeCopyWithImpl(
          this as DirectoryNode, $identity, $identity);
  @override
  String toString() {
    return DirectoryNodeMapper.ensureInitialized()
        .stringifyValue(this as DirectoryNode);
  }

  @override
  bool operator ==(Object other) {
    return DirectoryNodeMapper.ensureInitialized()
        .equalsValue(this as DirectoryNode, other);
  }

  @override
  int get hashCode {
    return DirectoryNodeMapper.ensureInitialized()
        .hashValue(this as DirectoryNode);
  }
}

extension DirectoryNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DirectoryNode, $Out> {
  DirectoryNodeCopyWith<$R, DirectoryNode, $Out> get $asDirectoryNode =>
      $base.as((v, t, t2) => _DirectoryNodeCopyWithImpl(v, t, t2));
}

abstract class DirectoryNodeCopyWith<$R, $In extends DirectoryNode, $Out>
    implements MCCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, STreeNode, STreeNodeCopyWith<$R, STreeNode, STreeNode>>
      get children;
  @override
  $R call({String? name, List<STreeNode>? children});
  DirectoryNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _DirectoryNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DirectoryNode, $Out>
    implements DirectoryNodeCopyWith<$R, DirectoryNode, $Out> {
  _DirectoryNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DirectoryNode> $mapper =
      DirectoryNodeMapper.ensureInitialized();
  @override
  ListCopyWith<$R, STreeNode, STreeNodeCopyWith<$R, STreeNode, STreeNode>>
      get children => ListCopyWith($value.children,
          (v, t) => v.copyWith.$chain(t), (v) => call(children: v));
  @override
  $R call({Object? name = $none, List<STreeNode>? children}) =>
      $apply(FieldCopyWithData({
        if (name != $none) #name: name,
        if (children != null) #children: children
      }));
  @override
  DirectoryNode $make(CopyWithData data) => DirectoryNode(
      name: data.get(#name, or: $value.name),
      children: data.get(#children, or: $value.children));

  @override
  DirectoryNodeCopyWith<$R2, DirectoryNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _DirectoryNodeCopyWithImpl($value, $cast, t);
}
