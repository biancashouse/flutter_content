// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'named_single_child_node.dart';

class NamedSCMapper extends SubClassMapperBase<NamedSC> {
  NamedSCMapper._();

  static NamedSCMapper? _instance;
  static NamedSCMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NamedSCMapper._());
      SCMapper.ensureInitialized().addSubMapper(_instance!);
      SNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'NamedSC';

  static String _$propertyName(NamedSC v) => v.propertyName;
  static const Field<NamedSC, String> _f$propertyName = Field(
    'propertyName',
    _$propertyName,
  );
  static SNode? _$child(NamedSC v) => v.child;
  static const Field<NamedSC, SNode> _f$child = Field(
    'child',
    _$child,
    opt: true,
  );
  static String _$uid(NamedSC v) => v.uid;
  static const Field<NamedSC, String> _f$uid = Field(
    'uid',
    _$uid,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$treeNodeGK(NamedSC v) =>
      v.treeNodeGK;
  static const Field<NamedSC, GlobalKey<State<StatefulWidget>>> _f$treeNodeGK =
      Field('treeNodeGK', _$treeNodeGK, mode: FieldMode.member);
  static bool _$isExpanded(NamedSC v) => v.isExpanded;
  static const Field<NamedSC, bool> _f$isExpanded = Field(
    'isExpanded',
    _$isExpanded,
    mode: FieldMode.member,
  );
  static bool? _$hidePropertiesWhileDragging(NamedSC v) =>
      v.hidePropertiesWhileDragging;
  static const Field<NamedSC, bool> _f$hidePropertiesWhileDragging = Field(
    'hidePropertiesWhileDragging',
    _$hidePropertiesWhileDragging,
    mode: FieldMode.member,
  );
  static bool _$canShowTappableNodeWidgetOverlay(NamedSC v) =>
      v.canShowTappableNodeWidgetOverlay;
  static const Field<NamedSC, bool> _f$canShowTappableNodeWidgetOverlay = Field(
    'canShowTappableNodeWidgetOverlay',
    _$canShowTappableNodeWidgetOverlay,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(NamedSC v) =>
      v.nodeWidgetGK;
  static const Field<NamedSC, GlobalKey<State<StatefulWidget>>>
  _f$nodeWidgetGK = Field(
    'nodeWidgetGK',
    _$nodeWidgetGK,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<NamedSC> fields = const {
    #propertyName: _f$propertyName,
    #child: _f$child,
    #uid: _f$uid,
    #treeNodeGK: _f$treeNodeGK,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #canShowTappableNodeWidgetOverlay: _f$canShowTappableNodeWidgetOverlay,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'sc';
  @override
  final dynamic discriminatorValue = 'NamedSC';
  @override
  late final ClassMapperBase superMapper = SCMapper.ensureInitialized();

  static NamedSC _instantiate(DecodingData data) {
    return NamedSC(
      propertyName: data.dec(_f$propertyName),
      child: data.dec(_f$child),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static NamedSC fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NamedSC>(map);
  }

  static NamedSC fromJson(String json) {
    return ensureInitialized().decodeJson<NamedSC>(json);
  }
}

mixin NamedSCMappable {
  String toJson() {
    return NamedSCMapper.ensureInitialized().encodeJson<NamedSC>(
      this as NamedSC,
    );
  }

  Map<String, dynamic> toMap() {
    return NamedSCMapper.ensureInitialized().encodeMap<NamedSC>(
      this as NamedSC,
    );
  }

  NamedSCCopyWith<NamedSC, NamedSC, NamedSC> get copyWith =>
      _NamedSCCopyWithImpl<NamedSC, NamedSC>(
        this as NamedSC,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return NamedSCMapper.ensureInitialized().stringifyValue(this as NamedSC);
  }

  @override
  bool operator ==(Object other) {
    return NamedSCMapper.ensureInitialized().equalsValue(
      this as NamedSC,
      other,
    );
  }

  @override
  int get hashCode {
    return NamedSCMapper.ensureInitialized().hashValue(this as NamedSC);
  }
}

extension NamedSCValueCopy<$R, $Out> on ObjectCopyWith<$R, NamedSC, $Out> {
  NamedSCCopyWith<$R, NamedSC, $Out> get $asNamedSC =>
      $base.as((v, t, t2) => _NamedSCCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class NamedSCCopyWith<$R, $In extends NamedSC, $Out>
    implements SCCopyWith<$R, $In, $Out> {
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child;
  @override
  $R call({String? propertyName, SNode? child});
  NamedSCCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _NamedSCCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NamedSC, $Out>
    implements NamedSCCopyWith<$R, NamedSC, $Out> {
  _NamedSCCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NamedSC> $mapper =
      NamedSCMapper.ensureInitialized();
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child =>
      $value.child?.copyWith.$chain((v) => call(child: v));
  @override
  $R call({String? propertyName, Object? child = $none}) => $apply(
    FieldCopyWithData({
      if (propertyName != null) #propertyName: propertyName,
      if (child != $none) #child: child,
    }),
  );
  @override
  NamedSC $make(CopyWithData data) => NamedSC(
    propertyName: data.get(#propertyName, or: $value.propertyName),
    child: data.get(#child, or: $value.child),
  );

  @override
  NamedSCCopyWith<$R2, NamedSC, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _NamedSCCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

