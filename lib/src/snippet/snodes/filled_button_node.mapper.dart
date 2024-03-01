// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'filled_button_node.dart';

class FilledButtonNodeMapper extends SubClassMapperBase<FilledButtonNode> {
  FilledButtonNodeMapper._();

  static FilledButtonNodeMapper? _instance;
  static FilledButtonNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FilledButtonNodeMapper._());
      ButtonNodeMapper.ensureInitialized().addSubMapper(_instance!);
      ButtonStyleGroupMapper.ensureInitialized();
      CalloutConfigGroupMapper.ensureInitialized();
      STreeNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'FilledButtonNode';

  static ButtonStyleGroup? _$buttonStyleGroup(FilledButtonNode v) =>
      v.buttonStyleGroup;
  static const Field<FilledButtonNode, ButtonStyleGroup> _f$buttonStyleGroup =
      Field('buttonStyleGroup', _$buttonStyleGroup, opt: true);
  static String? _$onTapHandlerName(FilledButtonNode v) => v.onTapHandlerName;
  static const Field<FilledButtonNode, String> _f$onTapHandlerName =
      Field('onTapHandlerName', _$onTapHandlerName, opt: true);
  static CalloutConfigGroup? _$calloutConfigGroup(FilledButtonNode v) =>
      v.calloutConfigGroup;
  static const Field<FilledButtonNode, CalloutConfigGroup>
      _f$calloutConfigGroup =
      Field('calloutConfigGroup', _$calloutConfigGroup, opt: true);
  static STreeNode? _$child(FilledButtonNode v) => v.child;
  static const Field<FilledButtonNode, STreeNode> _f$child =
      Field('child', _$child, opt: true);
  static bool _$isExpanded(FilledButtonNode v) => v.isExpanded;
  static const Field<FilledButtonNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static PTreeNodeTreeController? _$pTreeC(FilledButtonNode v) => v.pTreeC;
  static const Field<FilledButtonNode, PTreeNodeTreeController> _f$pTreeC =
      Field('pTreeC', _$pTreeC, mode: FieldMode.member);
  static double? _$propertiesPaneScrollPos(FilledButtonNode v) =>
      v.propertiesPaneScrollPos;
  static const Field<FilledButtonNode, double> _f$propertiesPaneScrollPos =
      Field('propertiesPaneScrollPos', _$propertiesPaneScrollPos,
          mode: FieldMode.member);
  static ScrollController? _$propertiesPaneSC(FilledButtonNode v) =>
      v.propertiesPaneSC;
  static const Field<FilledButtonNode, ScrollController> _f$propertiesPaneSC =
      Field('propertiesPaneSC', _$propertiesPaneSC, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(FilledButtonNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<FilledButtonNode, bool> _f$hidePropertiesWhileDragging =
      Field('hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
          mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(FilledButtonNode v) =>
      v.nodeWidgetGK;
  static const Field<FilledButtonNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);
  static String? _$namedButtonStyle(FilledButtonNode v) => v.namedButtonStyle;
  static const Field<FilledButtonNode, String> _f$namedButtonStyle =
      Field('namedButtonStyle', _$namedButtonStyle, mode: FieldMode.member);

  @override
  final MappableFields<FilledButtonNode> fields = const {
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
  final dynamic discriminatorValue = 'FilledButtonNode';
  @override
  late final ClassMapperBase superMapper = ButtonNodeMapper.ensureInitialized();

  static FilledButtonNode _instantiate(DecodingData data) {
    return FilledButtonNode(
        buttonStyleGroup: data.dec(_f$buttonStyleGroup),
        onTapHandlerName: data.dec(_f$onTapHandlerName),
        calloutConfigGroup: data.dec(_f$calloutConfigGroup),
        child: data.dec(_f$child));
  }

  @override
  final Function instantiate = _instantiate;

  static FilledButtonNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FilledButtonNode>(map);
  }

  static FilledButtonNode fromJson(String json) {
    return ensureInitialized().decodeJson<FilledButtonNode>(json);
  }
}

mixin FilledButtonNodeMappable {
  String toJson() {
    return FilledButtonNodeMapper.ensureInitialized()
        .encodeJson<FilledButtonNode>(this as FilledButtonNode);
  }

  Map<String, dynamic> toMap() {
    return FilledButtonNodeMapper.ensureInitialized()
        .encodeMap<FilledButtonNode>(this as FilledButtonNode);
  }

  FilledButtonNodeCopyWith<FilledButtonNode, FilledButtonNode, FilledButtonNode>
      get copyWith => _FilledButtonNodeCopyWithImpl(
          this as FilledButtonNode, $identity, $identity);
  @override
  String toString() {
    return FilledButtonNodeMapper.ensureInitialized()
        .stringifyValue(this as FilledButtonNode);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            FilledButtonNodeMapper.ensureInitialized()
                .isValueEqual(this as FilledButtonNode, other));
  }

  @override
  int get hashCode {
    return FilledButtonNodeMapper.ensureInitialized()
        .hashValue(this as FilledButtonNode);
  }
}

extension FilledButtonNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FilledButtonNode, $Out> {
  FilledButtonNodeCopyWith<$R, FilledButtonNode, $Out>
      get $asFilledButtonNode =>
          $base.as((v, t, t2) => _FilledButtonNodeCopyWithImpl(v, t, t2));
}

abstract class FilledButtonNodeCopyWith<$R, $In extends FilledButtonNode, $Out>
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
      {ButtonStyleGroup? buttonStyleGroup,
      String? onTapHandlerName,
      CalloutConfigGroup? calloutConfigGroup,
      STreeNode? child});
  FilledButtonNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _FilledButtonNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FilledButtonNode, $Out>
    implements FilledButtonNodeCopyWith<$R, FilledButtonNode, $Out> {
  _FilledButtonNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FilledButtonNode> $mapper =
      FilledButtonNodeMapper.ensureInitialized();
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
  FilledButtonNode $make(CopyWithData data) => FilledButtonNode(
      buttonStyleGroup:
          data.get(#buttonStyleGroup, or: $value.buttonStyleGroup),
      onTapHandlerName:
          data.get(#onTapHandlerName, or: $value.onTapHandlerName),
      calloutConfigGroup:
          data.get(#calloutConfigGroup, or: $value.calloutConfigGroup),
      child: data.get(#child, or: $value.child));

  @override
  FilledButtonNodeCopyWith<$R2, FilledButtonNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _FilledButtonNodeCopyWithImpl($value, $cast, t);
}
