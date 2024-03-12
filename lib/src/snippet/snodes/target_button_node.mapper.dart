// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'target_button_node.dart';

class TargetButtonNodeMapper extends SubClassMapperBase<TargetButtonNode> {
  TargetButtonNodeMapper._();

  static TargetButtonNodeMapper? _instance;
  static TargetButtonNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TargetButtonNodeMapper._());
      ButtonNodeMapper.ensureInitialized().addSubMapper(_instance!);
      AlignmentEnumMapper.ensureInitialized();
      ButtonStyleGroupMapper.ensureInitialized();
      CalloutConfigGroupMapper.ensureInitialized();
      STreeNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TargetButtonNode';

  static String _$name(TargetButtonNode v) => v.name;
  static const Field<TargetButtonNode, String> _f$name = Field('name', _$name);
  static AlignmentEnum? _$playButtonAlignment(TargetButtonNode v) =>
      v.playButtonAlignment;
  static const Field<TargetButtonNode, AlignmentEnum> _f$playButtonAlignment =
      Field('playButtonAlignment', _$playButtonAlignment, opt: true);
  static ButtonStyleGroup? _$buttonStyleGroup(TargetButtonNode v) =>
      v.buttonStyleGroup;
  static const Field<TargetButtonNode, ButtonStyleGroup> _f$buttonStyleGroup =
      Field('buttonStyleGroup', _$buttonStyleGroup, opt: true);
  static String? _$onTapHandlerName(TargetButtonNode v) => v.onTapHandlerName;
  static const Field<TargetButtonNode, String> _f$onTapHandlerName =
      Field('onTapHandlerName', _$onTapHandlerName, opt: true);
  static CalloutConfigGroup? _$calloutConfigGroup(TargetButtonNode v) =>
      v.calloutConfigGroup;
  static const Field<TargetButtonNode, CalloutConfigGroup>
      _f$calloutConfigGroup =
      Field('calloutConfigGroup', _$calloutConfigGroup, opt: true);
  static STreeNode? _$child(TargetButtonNode v) => v.child;
  static const Field<TargetButtonNode, STreeNode> _f$child =
      Field('child', _$child, opt: true);
  static bool _$isExpanded(TargetButtonNode v) => v.isExpanded;
  static const Field<TargetButtonNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(TargetButtonNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<TargetButtonNode, bool> _f$hidePropertiesWhileDragging =
      Field('hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
          mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(TargetButtonNode v) =>
      v.nodeWidgetGK;
  static const Field<TargetButtonNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);
  static String? _$namedButtonStyle(TargetButtonNode v) => v.namedButtonStyle;
  static const Field<TargetButtonNode, String> _f$namedButtonStyle =
      Field('namedButtonStyle', _$namedButtonStyle, mode: FieldMode.member);

  @override
  final MappableFields<TargetButtonNode> fields = const {
    #name: _f$name,
    #playButtonAlignment: _f$playButtonAlignment,
    #buttonStyleGroup: _f$buttonStyleGroup,
    #onTapHandlerName: _f$onTapHandlerName,
    #calloutConfigGroup: _f$calloutConfigGroup,
    #child: _f$child,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
    #namedButtonStyle: _f$namedButtonStyle,
  };

  @override
  final String discriminatorKey = 'button';
  @override
  final dynamic discriminatorValue = 'TargetButtonNode';
  @override
  late final ClassMapperBase superMapper = ButtonNodeMapper.ensureInitialized();

  static TargetButtonNode _instantiate(DecodingData data) {
    return TargetButtonNode(
        name: data.dec(_f$name),
        playButtonAlignment: data.dec(_f$playButtonAlignment),
        buttonStyleGroup: data.dec(_f$buttonStyleGroup),
        onTapHandlerName: data.dec(_f$onTapHandlerName),
        calloutConfigGroup: data.dec(_f$calloutConfigGroup),
        child: data.dec(_f$child));
  }

  @override
  final Function instantiate = _instantiate;

  static TargetButtonNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TargetButtonNode>(map);
  }

  static TargetButtonNode fromJson(String json) {
    return ensureInitialized().decodeJson<TargetButtonNode>(json);
  }
}

mixin TargetButtonNodeMappable {
  String toJson() {
    return TargetButtonNodeMapper.ensureInitialized()
        .encodeJson<TargetButtonNode>(this as TargetButtonNode);
  }

  Map<String, dynamic> toMap() {
    return TargetButtonNodeMapper.ensureInitialized()
        .encodeMap<TargetButtonNode>(this as TargetButtonNode);
  }

  TargetButtonNodeCopyWith<TargetButtonNode, TargetButtonNode, TargetButtonNode>
      get copyWith => _TargetButtonNodeCopyWithImpl(
          this as TargetButtonNode, $identity, $identity);
  @override
  String toString() {
    return TargetButtonNodeMapper.ensureInitialized()
        .stringifyValue(this as TargetButtonNode);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            TargetButtonNodeMapper.ensureInitialized()
                .isValueEqual(this as TargetButtonNode, other));
  }

  @override
  int get hashCode {
    return TargetButtonNodeMapper.ensureInitialized()
        .hashValue(this as TargetButtonNode);
  }
}

extension TargetButtonNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TargetButtonNode, $Out> {
  TargetButtonNodeCopyWith<$R, TargetButtonNode, $Out>
      get $asTargetButtonNode =>
          $base.as((v, t, t2) => _TargetButtonNodeCopyWithImpl(v, t, t2));
}

abstract class TargetButtonNodeCopyWith<$R, $In extends TargetButtonNode, $Out>
    implements ButtonNodeCopyWith<$R, $In, $Out> {
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
      {String? name,
      AlignmentEnum? playButtonAlignment,
      ButtonStyleGroup? buttonStyleGroup,
      String? onTapHandlerName,
      CalloutConfigGroup? calloutConfigGroup,
      STreeNode? child});
  TargetButtonNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TargetButtonNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TargetButtonNode, $Out>
    implements TargetButtonNodeCopyWith<$R, TargetButtonNode, $Out> {
  _TargetButtonNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TargetButtonNode> $mapper =
      TargetButtonNodeMapper.ensureInitialized();
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
          {String? name,
          Object? playButtonAlignment = $none,
          Object? buttonStyleGroup = $none,
          Object? onTapHandlerName = $none,
          Object? calloutConfigGroup = $none,
          Object? child = $none}) =>
      $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (playButtonAlignment != $none)
          #playButtonAlignment: playButtonAlignment,
        if (buttonStyleGroup != $none) #buttonStyleGroup: buttonStyleGroup,
        if (onTapHandlerName != $none) #onTapHandlerName: onTapHandlerName,
        if (calloutConfigGroup != $none)
          #calloutConfigGroup: calloutConfigGroup,
        if (child != $none) #child: child
      }));
  @override
  TargetButtonNode $make(CopyWithData data) => TargetButtonNode(
      name: data.get(#name, or: $value.name),
      playButtonAlignment:
          data.get(#playButtonAlignment, or: $value.playButtonAlignment),
      buttonStyleGroup:
          data.get(#buttonStyleGroup, or: $value.buttonStyleGroup),
      onTapHandlerName:
          data.get(#onTapHandlerName, or: $value.onTapHandlerName),
      calloutConfigGroup:
          data.get(#calloutConfigGroup, or: $value.calloutConfigGroup),
      child: data.get(#child, or: $value.child));

  @override
  TargetButtonNodeCopyWith<$R2, TargetButtonNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TargetButtonNodeCopyWithImpl($value, $cast, t);
}
