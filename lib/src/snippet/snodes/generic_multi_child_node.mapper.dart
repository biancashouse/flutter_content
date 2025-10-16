// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'generic_multi_child_node.dart';

class NamedMCMapper extends SubClassMapperBase<NamedMC> {
  NamedMCMapper._();

  static NamedMCMapper? _instance;
  static NamedMCMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NamedMCMapper._());
      MCMapper.ensureInitialized().addSubMapper(_instance!);
      SNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'NamedMC';

  static String _$propertyName(NamedMC v) => v.propertyName;
  static const Field<NamedMC, String> _f$propertyName = Field(
    'propertyName',
    _$propertyName,
  );
  static List<SNode> _$children(NamedMC v) => v.children;
  static const Field<NamedMC, List<SNode>> _f$children = Field(
    'children',
    _$children,
  );
  static String _$uid(NamedMC v) => v.uid;
  static const Field<NamedMC, String> _f$uid = Field(
    'uid',
    _$uid,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$treeNodeGK(NamedMC v) =>
      v.treeNodeGK;
  static const Field<NamedMC, GlobalKey<State<StatefulWidget>>> _f$treeNodeGK =
      Field('treeNodeGK', _$treeNodeGK, mode: FieldMode.member);
  static bool _$isExpanded(NamedMC v) => v.isExpanded;
  static const Field<NamedMC, bool> _f$isExpanded = Field(
    'isExpanded',
    _$isExpanded,
    mode: FieldMode.member,
  );
  static bool? _$hidePropertiesWhileDragging(NamedMC v) =>
      v.hidePropertiesWhileDragging;
  static const Field<NamedMC, bool> _f$hidePropertiesWhileDragging = Field(
    'hidePropertiesWhileDragging',
    _$hidePropertiesWhileDragging,
    mode: FieldMode.member,
  );
  static bool _$canShowTappableNodeWidgetOverlay(NamedMC v) =>
      v.canShowTappableNodeWidgetOverlay;
  static const Field<NamedMC, bool> _f$canShowTappableNodeWidgetOverlay = Field(
    'canShowTappableNodeWidgetOverlay',
    _$canShowTappableNodeWidgetOverlay,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(NamedMC v) =>
      v.nodeWidgetGK;
  static const Field<NamedMC, GlobalKey<State<StatefulWidget>>>
  _f$nodeWidgetGK = Field(
    'nodeWidgetGK',
    _$nodeWidgetGK,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<NamedMC> fields = const {
    #propertyName: _f$propertyName,
    #children: _f$children,
    #uid: _f$uid,
    #treeNodeGK: _f$treeNodeGK,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #canShowTappableNodeWidgetOverlay: _f$canShowTappableNodeWidgetOverlay,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'mc';
  @override
  final dynamic discriminatorValue = 'NamedMC';
  @override
  late final ClassMapperBase superMapper = MCMapper.ensureInitialized();

  static NamedMC _instantiate(DecodingData data) {
    return NamedMC(
      propertyName: data.dec(_f$propertyName),
      children: data.dec(_f$children),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static NamedMC fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NamedMC>(map);
  }

  static NamedMC fromJson(String json) {
    return ensureInitialized().decodeJson<NamedMC>(json);
  }
}

mixin NamedMCMappable {
  String toJson() {
    return NamedMCMapper.ensureInitialized().encodeJson<NamedMC>(
      this as NamedMC,
    );
  }

  Map<String, dynamic> toMap() {
    return NamedMCMapper.ensureInitialized().encodeMap<NamedMC>(
      this as NamedMC,
    );
  }

  NamedMCCopyWith<NamedMC, NamedMC, NamedMC> get copyWith =>
      _NamedMCCopyWithImpl<NamedMC, NamedMC>(
        this as NamedMC,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return NamedMCMapper.ensureInitialized().stringifyValue(this as NamedMC);
  }

  @override
  bool operator ==(Object other) {
    return NamedMCMapper.ensureInitialized().equalsValue(
      this as NamedMC,
      other,
    );
  }

  @override
  int get hashCode {
    return NamedMCMapper.ensureInitialized().hashValue(this as NamedMC);
  }
}

extension NamedMCValueCopy<$R, $Out> on ObjectCopyWith<$R, NamedMC, $Out> {
  NamedMCCopyWith<$R, NamedMC, $Out> get $asNamedMC =>
      $base.as((v, t, t2) => _NamedMCCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class NamedMCCopyWith<$R, $In extends NamedMC, $Out>
    implements MCCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, SNode, SNodeCopyWith<$R, SNode, SNode>> get children;
  @override
  $R call({String? propertyName, List<SNode>? children});
  NamedMCCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _NamedMCCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NamedMC, $Out>
    implements NamedMCCopyWith<$R, NamedMC, $Out> {
  _NamedMCCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NamedMC> $mapper =
      NamedMCMapper.ensureInitialized();
  @override
  ListCopyWith<$R, SNode, SNodeCopyWith<$R, SNode, SNode>> get children =>
      ListCopyWith(
        $value.children,
        (v, t) => v.copyWith.$chain(t),
        (v) => call(children: v),
      );
  @override
  $R call({String? propertyName, List<SNode>? children}) => $apply(
    FieldCopyWithData({
      if (propertyName != null) #propertyName: propertyName,
      if (children != null) #children: children,
    }),
  );
  @override
  NamedMC $make(CopyWithData data) => NamedMC(
    propertyName: data.get(#propertyName, or: $value.propertyName),
    children: data.get(#children, or: $value.children),
  );

  @override
  NamedMCCopyWith<$R2, NamedMC, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _NamedMCCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

