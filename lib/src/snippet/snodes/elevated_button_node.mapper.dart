// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'elevated_button_node.dart';

class ElevatedButtonNodeMapper extends SubClassMapperBase<ElevatedButtonNode> {
  ElevatedButtonNodeMapper._();

  static ElevatedButtonNodeMapper? _instance;
  static ElevatedButtonNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ElevatedButtonNodeMapper._());
      ButtonNodeMapper.ensureInitialized().addSubMapper(_instance!);
      ButtonStyleGroupMapper.ensureInitialized();
      CalloutConfigGroupMapper.ensureInitialized();
      STreeNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ElevatedButtonNode';

  static ButtonStyleGroup? _$buttonStyleGroup(ElevatedButtonNode v) =>
      v.buttonStyleGroup;
  static const Field<ElevatedButtonNode, ButtonStyleGroup> _f$buttonStyleGroup =
      Field('buttonStyleGroup', _$buttonStyleGroup, opt: true);
  static String? _$onTapHandlerName(ElevatedButtonNode v) => v.onTapHandlerName;
  static const Field<ElevatedButtonNode, String> _f$onTapHandlerName =
      Field('onTapHandlerName', _$onTapHandlerName, opt: true);
  static CalloutConfigGroup? _$calloutConfigGroup(ElevatedButtonNode v) =>
      v.calloutConfigGroup;
  static const Field<ElevatedButtonNode, CalloutConfigGroup>
      _f$calloutConfigGroup =
      Field('calloutConfigGroup', _$calloutConfigGroup, opt: true);
  static STreeNode? _$child(ElevatedButtonNode v) => v.child;
  static const Field<ElevatedButtonNode, STreeNode> _f$child =
      Field('child', _$child, opt: true);
  static bool _$isExpanded(ElevatedButtonNode v) => v.isExpanded;
  static const Field<ElevatedButtonNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static PTreeNodeTreeController? _$pTreeC(ElevatedButtonNode v) => v.pTreeC;
  static const Field<ElevatedButtonNode, PTreeNodeTreeController> _f$pTreeC =
      Field('pTreeC', _$pTreeC, mode: FieldMode.member);
  static double? _$propertiesPaneScrollPos(ElevatedButtonNode v) =>
      v.propertiesPaneScrollPos;
  static const Field<ElevatedButtonNode, double> _f$propertiesPaneScrollPos =
      Field('propertiesPaneScrollPos', _$propertiesPaneScrollPos,
          mode: FieldMode.member);
  static ScrollController? _$propertiesPaneSC(ElevatedButtonNode v) =>
      v.propertiesPaneSC;
  static const Field<ElevatedButtonNode, ScrollController> _f$propertiesPaneSC =
      Field('propertiesPaneSC', _$propertiesPaneSC, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(ElevatedButtonNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<ElevatedButtonNode, bool> _f$hidePropertiesWhileDragging =
      Field('hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
          mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(
          ElevatedButtonNode v) =>
      v.nodeWidgetGK;
  static const Field<ElevatedButtonNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);
  static String? _$namedButtonStyle(ElevatedButtonNode v) => v.namedButtonStyle;
  static const Field<ElevatedButtonNode, String> _f$namedButtonStyle =
      Field('namedButtonStyle', _$namedButtonStyle, mode: FieldMode.member);

  @override
  final MappableFields<ElevatedButtonNode> fields = const {
    #buttonStyleGroup: _f$buttonStyleGroup,
    #onTapHandlerName: _f$onTapHandlerName,
    #calloutConfigGroup: _f$calloutConfigGroup,
    #child: _f$child,
    #isExpanded: _f$isExpanded,
    #pTreeC: _f$pTreeC,
    #propertiesPaneScrollPos: _f$propertiesPaneScrollPos,
    #propertiesPaneSC: _f$propertiesPaneSC,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
    #namedButtonStyle: _f$namedButtonStyle,
  };

  @override
  final String discriminatorKey = 'button';
  @override
  final dynamic discriminatorValue = 'ElevatedButtonNode';
  @override
  late final ClassMapperBase superMapper = ButtonNodeMapper.ensureInitialized();

  static ElevatedButtonNode _instantiate(DecodingData data) {
    return ElevatedButtonNode(
        buttonStyleGroup: data.dec(_f$buttonStyleGroup),
        onTapHandlerName: data.dec(_f$onTapHandlerName),
        calloutConfigGroup: data.dec(_f$calloutConfigGroup),
        child: data.dec(_f$child));
  }

  @override
  final Function instantiate = _instantiate;

  static ElevatedButtonNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ElevatedButtonNode>(map);
  }

  static ElevatedButtonNode fromJson(String json) {
    return ensureInitialized().decodeJson<ElevatedButtonNode>(json);
  }
}

mixin ElevatedButtonNodeMappable {
  String toJson() {
    return ElevatedButtonNodeMapper.ensureInitialized()
        .encodeJson<ElevatedButtonNode>(this as ElevatedButtonNode);
  }

  Map<String, dynamic> toMap() {
    return ElevatedButtonNodeMapper.ensureInitialized()
        .encodeMap<ElevatedButtonNode>(this as ElevatedButtonNode);
  }

  ElevatedButtonNodeCopyWith<ElevatedButtonNode, ElevatedButtonNode,
          ElevatedButtonNode>
      get copyWith => _ElevatedButtonNodeCopyWithImpl(
          this as ElevatedButtonNode, $identity, $identity);
  @override
  String toString() {
    return ElevatedButtonNodeMapper.ensureInitialized()
        .stringifyValue(this as ElevatedButtonNode);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ElevatedButtonNodeMapper.ensureInitialized()
                .isValueEqual(this as ElevatedButtonNode, other));
  }

  @override
  int get hashCode {
    return ElevatedButtonNodeMapper.ensureInitialized()
        .hashValue(this as ElevatedButtonNode);
  }
}

extension ElevatedButtonNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ElevatedButtonNode, $Out> {
  ElevatedButtonNodeCopyWith<$R, ElevatedButtonNode, $Out>
      get $asElevatedButtonNode =>
          $base.as((v, t, t2) => _ElevatedButtonNodeCopyWithImpl(v, t, t2));
}

abstract class ElevatedButtonNodeCopyWith<$R, $In extends ElevatedButtonNode,
    $Out> implements ButtonNodeCopyWith<$R, $In, $Out> {
  @override
  ButtonStyleGroupCopyWith<$R, ButtonStyleGroup, ButtonStyleGroup>?
      get buttonStyleGroup;
  @override
  CalloutConfigGroupCopyWith<$R, CalloutConfigGroup, CalloutConfigGroup>?
      get calloutConfigGroup;
  @override
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get child;
  @override
  $R call(
      {ButtonStyleGroup? buttonStyleGroup,
      String? onTapHandlerName,
      CalloutConfigGroup? calloutConfigGroup,
      STreeNode? child});
  ElevatedButtonNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ElevatedButtonNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ElevatedButtonNode, $Out>
    implements ElevatedButtonNodeCopyWith<$R, ElevatedButtonNode, $Out> {
  _ElevatedButtonNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ElevatedButtonNode> $mapper =
      ElevatedButtonNodeMapper.ensureInitialized();
  @override
  ButtonStyleGroupCopyWith<$R, ButtonStyleGroup, ButtonStyleGroup>?
      get buttonStyleGroup => $value.buttonStyleGroup?.copyWith
          .$chain((v) => call(buttonStyleGroup: v));
  @override
  CalloutConfigGroupCopyWith<$R, CalloutConfigGroup, CalloutConfigGroup>?
      get calloutConfigGroup => $value.calloutConfigGroup?.copyWith
          .$chain((v) => call(calloutConfigGroup: v));
  @override
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get child =>
      $value.child?.copyWith.$chain((v) => call(child: v));
  @override
  $R call(
          {Object? buttonStyleGroup = $none,
          Object? onTapHandlerName = $none,
          Object? calloutConfigGroup = $none,
          Object? child = $none}) =>
      $apply(FieldCopyWithData({
        if (buttonStyleGroup != $none) #buttonStyleGroup: buttonStyleGroup,
        if (onTapHandlerName != $none) #onTapHandlerName: onTapHandlerName,
        if (calloutConfigGroup != $none)
          #calloutConfigGroup: calloutConfigGroup,
        if (child != $none) #child: child
      }));
  @override
  ElevatedButtonNode $make(CopyWithData data) => ElevatedButtonNode(
      buttonStyleGroup:
          data.get(#buttonStyleGroup, or: $value.buttonStyleGroup),
      onTapHandlerName:
          data.get(#onTapHandlerName, or: $value.onTapHandlerName),
      calloutConfigGroup:
          data.get(#calloutConfigGroup, or: $value.calloutConfigGroup),
      child: data.get(#child, or: $value.child));

  @override
  ElevatedButtonNodeCopyWith<$R2, ElevatedButtonNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ElevatedButtonNodeCopyWithImpl($value, $cast, t);
}
