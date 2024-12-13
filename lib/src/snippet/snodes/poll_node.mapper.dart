// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'poll_node.dart';

class PollNodeMapper extends SubClassMapperBase<PollNode> {
  PollNodeMapper._();

  static PollNodeMapper? _instance;
  static PollNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PollNodeMapper._());
      MCMapper.ensureInitialized().addSubMapper(_instance!);
      STreeNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PollNode';

  static String _$name(PollNode v) => v.name;
  static const Field<PollNode, String> _f$name =
      Field('name', _$name, opt: true, def: '');
  static String _$title(PollNode v) => v.title;
  static const Field<PollNode, String> _f$title =
      Field('title', _$title, opt: true, def: '');
  static int? _$startDate(PollNode v) => v.startDate;
  static const Field<PollNode, int> _f$startDate =
      Field('startDate', _$startDate, opt: true);
  static int? _$endDate(PollNode v) => v.endDate;
  static const Field<PollNode, int> _f$endDate =
      Field('endDate', _$endDate, opt: true);
  static String? _$createdBy(PollNode v) => v.createdBy;
  static const Field<PollNode, String> _f$createdBy =
      Field('createdBy', _$createdBy, opt: true);
  static List<String> _$voterPool(PollNode v) => v.voterPool;
  static const Field<PollNode, List<String>> _f$voterPool =
      Field('voterPool', _$voterPool, opt: true, def: const []);
  static bool _$locked(PollNode v) => v.locked;
  static const Field<PollNode, bool> _f$locked =
      Field('locked', _$locked, opt: true, def: false);
  static List<STreeNode> _$children(PollNode v) => v.children;
  static const Field<PollNode, List<STreeNode>> _f$children =
      Field('children', _$children);
  static String _$uid(PollNode v) => v.uid;
  static const Field<PollNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static bool _$isExpanded(PollNode v) => v.isExpanded;
  static const Field<PollNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static Rect? _$measuredRect(PollNode v) => v.measuredRect;
  static const Field<PollNode, Rect> _f$measuredRect =
      Field('measuredRect', _$measuredRect, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(PollNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<PollNode, bool> _f$hidePropertiesWhileDragging = Field(
      'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
      mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(PollNode v) =>
      v.nodeWidgetGK;
  static const Field<PollNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<PollNode> fields = const {
    #name: _f$name,
    #title: _f$title,
    #startDate: _f$startDate,
    #endDate: _f$endDate,
    #createdBy: _f$createdBy,
    #voterPool: _f$voterPool,
    #locked: _f$locked,
    #children: _f$children,
    #uid: _f$uid,
    #isExpanded: _f$isExpanded,
    #measuredRect: _f$measuredRect,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'mc';
  @override
  final dynamic discriminatorValue = 'PollNode';
  @override
  late final ClassMapperBase superMapper = MCMapper.ensureInitialized();

  static PollNode _instantiate(DecodingData data) {
    return PollNode(
        name: data.dec(_f$name),
        title: data.dec(_f$title),
        startDate: data.dec(_f$startDate),
        endDate: data.dec(_f$endDate),
        createdBy: data.dec(_f$createdBy),
        voterPool: data.dec(_f$voterPool),
        locked: data.dec(_f$locked),
        children: data.dec(_f$children));
  }

  @override
  final Function instantiate = _instantiate;

  static PollNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PollNode>(map);
  }

  static PollNode fromJson(String json) {
    return ensureInitialized().decodeJson<PollNode>(json);
  }
}

mixin PollNodeMappable {
  String toJson() {
    return PollNodeMapper.ensureInitialized()
        .encodeJson<PollNode>(this as PollNode);
  }

  Map<String, dynamic> toMap() {
    return PollNodeMapper.ensureInitialized()
        .encodeMap<PollNode>(this as PollNode);
  }

  PollNodeCopyWith<PollNode, PollNode, PollNode> get copyWith =>
      _PollNodeCopyWithImpl(this as PollNode, $identity, $identity);
  @override
  String toString() {
    return PollNodeMapper.ensureInitialized().stringifyValue(this as PollNode);
  }

  @override
  bool operator ==(Object other) {
    return PollNodeMapper.ensureInitialized()
        .equalsValue(this as PollNode, other);
  }

  @override
  int get hashCode {
    return PollNodeMapper.ensureInitialized().hashValue(this as PollNode);
  }
}

extension PollNodeValueCopy<$R, $Out> on ObjectCopyWith<$R, PollNode, $Out> {
  PollNodeCopyWith<$R, PollNode, $Out> get $asPollNode =>
      $base.as((v, t, t2) => _PollNodeCopyWithImpl(v, t, t2));
}

abstract class PollNodeCopyWith<$R, $In extends PollNode, $Out>
    implements MCCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get voterPool;
  @override
  ListCopyWith<$R, STreeNode, STreeNodeCopyWith<$R, STreeNode, STreeNode>>
      get children;
  @override
  $R call(
      {String? name,
      String? title,
      int? startDate,
      int? endDate,
      String? createdBy,
      List<String>? voterPool,
      bool? locked,
      List<STreeNode>? children});
  PollNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PollNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PollNode, $Out>
    implements PollNodeCopyWith<$R, PollNode, $Out> {
  _PollNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PollNode> $mapper =
      PollNodeMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get voterPool =>
      ListCopyWith($value.voterPool, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(voterPool: v));
  @override
  ListCopyWith<$R, STreeNode, STreeNodeCopyWith<$R, STreeNode, STreeNode>>
      get children => ListCopyWith($value.children,
          (v, t) => v.copyWith.$chain(t), (v) => call(children: v));
  @override
  $R call(
          {String? name,
          String? title,
          Object? startDate = $none,
          Object? endDate = $none,
          Object? createdBy = $none,
          List<String>? voterPool,
          bool? locked,
          List<STreeNode>? children}) =>
      $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (title != null) #title: title,
        if (startDate != $none) #startDate: startDate,
        if (endDate != $none) #endDate: endDate,
        if (createdBy != $none) #createdBy: createdBy,
        if (voterPool != null) #voterPool: voterPool,
        if (locked != null) #locked: locked,
        if (children != null) #children: children
      }));
  @override
  PollNode $make(CopyWithData data) => PollNode(
      name: data.get(#name, or: $value.name),
      title: data.get(#title, or: $value.title),
      startDate: data.get(#startDate, or: $value.startDate),
      endDate: data.get(#endDate, or: $value.endDate),
      createdBy: data.get(#createdBy, or: $value.createdBy),
      voterPool: data.get(#voterPool, or: $value.voterPool),
      locked: data.get(#locked, or: $value.locked),
      children: data.get(#children, or: $value.children));

  @override
  PollNodeCopyWith<$R2, PollNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PollNodeCopyWithImpl($value, $cast, t);
}
