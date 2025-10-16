// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'named_preferredsize_single_child_node.dart';

class NamedPSMapper extends SubClassMapperBase<NamedPS> {
  NamedPSMapper._();

  static NamedPSMapper? _instance;
  static NamedPSMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NamedPSMapper._());
      SCMapper.ensureInitialized().addSubMapper(_instance!);
      SNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'NamedPS';

  static String _$propertyName(NamedPS v) => v.propertyName;
  static const Field<NamedPS, String> _f$propertyName = Field(
    'propertyName',
    _$propertyName,
  );
  static SNode? _$child(NamedPS v) => v.child;
  static const Field<NamedPS, SNode> _f$child = Field(
    'child',
    _$child,
    opt: true,
  );
  static String _$uid(NamedPS v) => v.uid;
  static const Field<NamedPS, String> _f$uid = Field(
    'uid',
    _$uid,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$treeNodeGK(NamedPS v) =>
      v.treeNodeGK;
  static const Field<NamedPS, GlobalKey<State<StatefulWidget>>> _f$treeNodeGK =
      Field('treeNodeGK', _$treeNodeGK, mode: FieldMode.member);
  static bool _$isExpanded(NamedPS v) => v.isExpanded;
  static const Field<NamedPS, bool> _f$isExpanded = Field(
    'isExpanded',
    _$isExpanded,
    mode: FieldMode.member,
  );
  static bool? _$hidePropertiesWhileDragging(NamedPS v) =>
      v.hidePropertiesWhileDragging;
  static const Field<NamedPS, bool> _f$hidePropertiesWhileDragging = Field(
    'hidePropertiesWhileDragging',
    _$hidePropertiesWhileDragging,
    mode: FieldMode.member,
  );
  static bool _$canShowTappableNodeWidgetOverlay(NamedPS v) =>
      v.canShowTappableNodeWidgetOverlay;
  static const Field<NamedPS, bool> _f$canShowTappableNodeWidgetOverlay = Field(
    'canShowTappableNodeWidgetOverlay',
    _$canShowTappableNodeWidgetOverlay,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(NamedPS v) =>
      v.nodeWidgetGK;
  static const Field<NamedPS, GlobalKey<State<StatefulWidget>>>
  _f$nodeWidgetGK = Field(
    'nodeWidgetGK',
    _$nodeWidgetGK,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<NamedPS> fields = const {
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
  final dynamic discriminatorValue = 'NamedPS';
  @override
  late final ClassMapperBase superMapper = SCMapper.ensureInitialized();

  static NamedPS _instantiate(DecodingData data) {
    return NamedPS(
      propertyName: data.dec(_f$propertyName),
      child: data.dec(_f$child),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static NamedPS fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NamedPS>(map);
  }

  static NamedPS fromJson(String json) {
    return ensureInitialized().decodeJson<NamedPS>(json);
  }
}

mixin NamedPSMappable {
  String toJson() {
    return NamedPSMapper.ensureInitialized().encodeJson<NamedPS>(
      this as NamedPS,
    );
  }

  Map<String, dynamic> toMap() {
    return NamedPSMapper.ensureInitialized().encodeMap<NamedPS>(
      this as NamedPS,
    );
  }

  NamedPSCopyWith<NamedPS, NamedPS, NamedPS> get copyWith =>
      _NamedPSCopyWithImpl<NamedPS, NamedPS>(
        this as NamedPS,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return NamedPSMapper.ensureInitialized().stringifyValue(this as NamedPS);
  }

  @override
  bool operator ==(Object other) {
    return NamedPSMapper.ensureInitialized().equalsValue(
      this as NamedPS,
      other,
    );
  }

  @override
  int get hashCode {
    return NamedPSMapper.ensureInitialized().hashValue(this as NamedPS);
  }
}

extension NamedPSValueCopy<$R, $Out> on ObjectCopyWith<$R, NamedPS, $Out> {
  NamedPSCopyWith<$R, NamedPS, $Out> get $asNamedPS =>
      $base.as((v, t, t2) => _NamedPSCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class NamedPSCopyWith<$R, $In extends NamedPS, $Out>
    implements SCCopyWith<$R, $In, $Out> {
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child;
  @override
  $R call({String? propertyName, SNode? child});
  NamedPSCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _NamedPSCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NamedPS, $Out>
    implements NamedPSCopyWith<$R, NamedPS, $Out> {
  _NamedPSCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NamedPS> $mapper =
      NamedPSMapper.ensureInitialized();
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
  NamedPS $make(CopyWithData data) => NamedPS(
    propertyName: data.get(#propertyName, or: $value.propertyName),
    child: data.get(#child, or: $value.child),
  );

  @override
  NamedPSCopyWith<$R2, NamedPS, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _NamedPSCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

