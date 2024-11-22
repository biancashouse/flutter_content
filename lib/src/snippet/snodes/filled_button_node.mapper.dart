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
      SnippetTemplateEnumMapper.ensureInitialized();
      ButtonStyleGroupMapper.ensureInitialized();
      CalloutConfigGroupMapper.ensureInitialized();
      STreeNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'FilledButtonNode';

  static String? _$destinationRoutePathSnippetName(FilledButtonNode v) =>
      v.destinationRoutePathSnippetName;
  static const Field<FilledButtonNode, String>
      _f$destinationRoutePathSnippetName = Field(
          'destinationRoutePathSnippetName', _$destinationRoutePathSnippetName,
          opt: true);
  static SnippetTemplateEnum? _$template(FilledButtonNode v) => v.template;
  static const Field<FilledButtonNode, SnippetTemplateEnum> _f$template =
      Field('template', _$template, opt: true);
  static String? _$destinationPanelOrPlaceholderName(FilledButtonNode v) =>
      v.destinationPanelOrPlaceholderName;
  static const Field<FilledButtonNode, String>
      _f$destinationPanelOrPlaceholderName = Field(
          'destinationPanelOrPlaceholderName',
          _$destinationPanelOrPlaceholderName,
          opt: true);
  static String? _$destinationSnippetName(FilledButtonNode v) =>
      v.destinationSnippetName;
  static const Field<FilledButtonNode, String> _f$destinationSnippetName =
      Field('destinationSnippetName', _$destinationSnippetName, opt: true);
  static ButtonStyleGroup? _$buttonStyle(FilledButtonNode v) => v.buttonStyle;
  static const Field<FilledButtonNode, ButtonStyleGroup> _f$buttonStyle =
      Field('buttonStyle', _$buttonStyle, opt: true);
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
  static String _$uid(FilledButtonNode v) => v.uid;
  static const Field<FilledButtonNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$gk(FilledButtonNode v) => v.gk;
  static const Field<FilledButtonNode, GlobalKey<State<StatefulWidget>>> _f$gk =
      Field('gk', _$gk, mode: FieldMode.member);
  static bool _$isExpanded(FilledButtonNode v) => v.isExpanded;
  static const Field<FilledButtonNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
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

  @override
  final MappableFields<FilledButtonNode> fields = const {
    #destinationRoutePathSnippetName: _f$destinationRoutePathSnippetName,
    #template: _f$template,
    #destinationPanelOrPlaceholderName: _f$destinationPanelOrPlaceholderName,
    #destinationSnippetName: _f$destinationSnippetName,
    #buttonStyle: _f$buttonStyle,
    #onTapHandlerName: _f$onTapHandlerName,
    #calloutConfigGroup: _f$calloutConfigGroup,
    #child: _f$child,
    #uid: _f$uid,
    #gk: _f$gk,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'button';
  @override
  final dynamic discriminatorValue = 'FilledButtonNode';
  @override
  late final ClassMapperBase superMapper = ButtonNodeMapper.ensureInitialized();

  static FilledButtonNode _instantiate(DecodingData data) {
    return FilledButtonNode(
        destinationRoutePathSnippetName:
            data.dec(_f$destinationRoutePathSnippetName),
        template: data.dec(_f$template),
        destinationPanelOrPlaceholderName:
            data.dec(_f$destinationPanelOrPlaceholderName),
        destinationSnippetName: data.dec(_f$destinationSnippetName),
        buttonStyle: data.dec(_f$buttonStyle),
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
    return FilledButtonNodeMapper.ensureInitialized()
        .equalsValue(this as FilledButtonNode, other);
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
      get buttonStyle;
  @override
  CalloutConfigGroupCopyWith<$R, CalloutConfigGroup, CalloutConfigGroup>?
      get calloutConfigGroup;
  @override
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get child;
  @override
  $R call(
      {String? destinationRoutePathSnippetName,
      SnippetTemplateEnum? template,
      String? destinationPanelOrPlaceholderName,
      String? destinationSnippetName,
      ButtonStyleGroup? buttonStyle,
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
      get buttonStyle =>
          $value.buttonStyle?.copyWith.$chain((v) => call(buttonStyle: v));
  @override
  CalloutConfigGroupCopyWith<$R, CalloutConfigGroup, CalloutConfigGroup>?
      get calloutConfigGroup => $value.calloutConfigGroup?.copyWith
          .$chain((v) => call(calloutConfigGroup: v));
  @override
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get child =>
      $value.child?.copyWith.$chain((v) => call(child: v));
  @override
  $R call(
          {Object? destinationRoutePathSnippetName = $none,
          Object? template = $none,
          Object? destinationPanelOrPlaceholderName = $none,
          Object? destinationSnippetName = $none,
          Object? buttonStyle = $none,
          Object? onTapHandlerName = $none,
          Object? calloutConfigGroup = $none,
          Object? child = $none}) =>
      $apply(FieldCopyWithData({
        if (destinationRoutePathSnippetName != $none)
          #destinationRoutePathSnippetName: destinationRoutePathSnippetName,
        if (template != $none) #template: template,
        if (destinationPanelOrPlaceholderName != $none)
          #destinationPanelOrPlaceholderName: destinationPanelOrPlaceholderName,
        if (destinationSnippetName != $none)
          #destinationSnippetName: destinationSnippetName,
        if (buttonStyle != $none) #buttonStyle: buttonStyle,
        if (onTapHandlerName != $none) #onTapHandlerName: onTapHandlerName,
        if (calloutConfigGroup != $none)
          #calloutConfigGroup: calloutConfigGroup,
        if (child != $none) #child: child
      }));
  @override
  FilledButtonNode $make(CopyWithData data) => FilledButtonNode(
      destinationRoutePathSnippetName: data.get(
          #destinationRoutePathSnippetName,
          or: $value.destinationRoutePathSnippetName),
      template: data.get(#template, or: $value.template),
      destinationPanelOrPlaceholderName: data.get(
          #destinationPanelOrPlaceholderName,
          or: $value.destinationPanelOrPlaceholderName),
      destinationSnippetName:
          data.get(#destinationSnippetName, or: $value.destinationSnippetName),
      buttonStyle: data.get(#buttonStyle, or: $value.buttonStyle),
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
