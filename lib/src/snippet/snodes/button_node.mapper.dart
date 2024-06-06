// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'button_node.dart';

class ButtonNodeMapper extends SubClassMapperBase<ButtonNode> {
  ButtonNodeMapper._();

  static ButtonNodeMapper? _instance;
  static ButtonNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ButtonNodeMapper._());
      SCMapper.ensureInitialized().addSubMapper(_instance!);
      ElevatedButtonNodeMapper.ensureInitialized();
      OutlinedButtonNodeMapper.ensureInitialized();
      TextButtonNodeMapper.ensureInitialized();
      FilledButtonNodeMapper.ensureInitialized();
      IconButtonNodeMapper.ensureInitialized();
      MenuItemButtonNodeMapper.ensureInitialized();
      SnippetTemplateEnumMapper.ensureInitialized();
      ButtonStyleGroupMapper.ensureInitialized();
      CalloutConfigGroupMapper.ensureInitialized();
      STreeNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ButtonNode';

  static String? _$destinationPanelOrPlaceholderName(ButtonNode v) =>
      v.destinationPanelOrPlaceholderName;
  static const Field<ButtonNode, String> _f$destinationPanelOrPlaceholderName =
      Field('destinationPanelOrPlaceholderName',
          _$destinationPanelOrPlaceholderName,
          opt: true);
  static String? _$destinationSnippetName(ButtonNode v) =>
      v.destinationSnippetName;
  static const Field<ButtonNode, String> _f$destinationSnippetName =
      Field('destinationSnippetName', _$destinationSnippetName, opt: true);
  static String? _$destinationRoutePathSnippetName(ButtonNode v) =>
      v.destinationRoutePathSnippetName;
  static const Field<ButtonNode, String> _f$destinationRoutePathSnippetName =
      Field(
          'destinationRoutePathSnippetName', _$destinationRoutePathSnippetName,
          opt: true);
  static SnippetTemplateEnum? _$template(ButtonNode v) => v.template;
  static const Field<ButtonNode, SnippetTemplateEnum> _f$template =
      Field('template', _$template, opt: true);
  static ButtonStyleGroup? _$buttonStyle(ButtonNode v) => v.buttonStyle;
  static const Field<ButtonNode, ButtonStyleGroup> _f$buttonStyle =
      Field('buttonStyle', _$buttonStyle, opt: true);
  static String? _$onTapHandlerName(ButtonNode v) => v.onTapHandlerName;
  static const Field<ButtonNode, String> _f$onTapHandlerName =
      Field('onTapHandlerName', _$onTapHandlerName, opt: true);
  static CalloutConfigGroup? _$calloutConfigGroup(ButtonNode v) =>
      v.calloutConfigGroup;
  static const Field<ButtonNode, CalloutConfigGroup> _f$calloutConfigGroup =
      Field('calloutConfigGroup', _$calloutConfigGroup, opt: true);
  static STreeNode? _$child(ButtonNode v) => v.child;
  static const Field<ButtonNode, STreeNode> _f$child =
      Field('child', _$child, opt: true);
  static String _$uid(ButtonNode v) => v.uid;
  static const Field<ButtonNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static bool _$isExpanded(ButtonNode v) => v.isExpanded;
  static const Field<ButtonNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(ButtonNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<ButtonNode, bool> _f$hidePropertiesWhileDragging = Field(
      'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
      mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(ButtonNode v) =>
      v.nodeWidgetGK;
  static const Field<ButtonNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<ButtonNode> fields = const {
    #destinationPanelOrPlaceholderName: _f$destinationPanelOrPlaceholderName,
    #destinationSnippetName: _f$destinationSnippetName,
    #destinationRoutePathSnippetName: _f$destinationRoutePathSnippetName,
    #template: _f$template,
    #buttonStyle: _f$buttonStyle,
    #onTapHandlerName: _f$onTapHandlerName,
    #calloutConfigGroup: _f$calloutConfigGroup,
    #child: _f$child,
    #uid: _f$uid,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'sc';
  @override
  final dynamic discriminatorValue = 'ButtonNode';
  @override
  late final ClassMapperBase superMapper = SCMapper.ensureInitialized();

  static ButtonNode _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'ButtonNode', 'button', '${data.value['button']}');
  }

  @override
  final Function instantiate = _instantiate;

  static ButtonNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ButtonNode>(map);
  }

  static ButtonNode fromJson(String json) {
    return ensureInitialized().decodeJson<ButtonNode>(json);
  }
}

mixin ButtonNodeMappable {
  String toJson();
  Map<String, dynamic> toMap();
  ButtonNodeCopyWith<ButtonNode, ButtonNode, ButtonNode> get copyWith;
}

abstract class ButtonNodeCopyWith<$R, $In extends ButtonNode, $Out>
    implements SCCopyWith<$R, $In, $Out> {
  ButtonStyleGroupCopyWith<$R, ButtonStyleGroup, ButtonStyleGroup>?
      get buttonStyle;
  CalloutConfigGroupCopyWith<$R, CalloutConfigGroup, CalloutConfigGroup>?
      get calloutConfigGroup;
  @override
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get child;
  @override
  $R call(
      {String? destinationPanelOrPlaceholderName,
      String? destinationSnippetName,
      String? destinationRoutePathSnippetName,
      SnippetTemplateEnum? template,
      ButtonStyleGroup? buttonStyle,
      String? onTapHandlerName,
      CalloutConfigGroup? calloutConfigGroup,
      STreeNode? child});
  ButtonNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}
