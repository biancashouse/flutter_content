// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'default_text_style_node.dart';

class DefaultTextStyleNodeMapper
    extends SubClassMapperBase<DefaultTextStyleNode> {
  DefaultTextStyleNodeMapper._();

  static DefaultTextStyleNodeMapper? _instance;
  static DefaultTextStyleNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DefaultTextStyleNodeMapper._());
      SCMapper.ensureInitialized().addSubMapper(_instance!);
      TextStyleGroupMapper.ensureInitialized();
      TextAlignEnumMapper.ensureInitialized();
      STreeNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'DefaultTextStyleNode';

  static TextStyleGroup? _$textStyleGroup(DefaultTextStyleNode v) =>
      v.textStyleGroup;
  static const Field<DefaultTextStyleNode, TextStyleGroup> _f$textStyleGroup =
      Field('textStyleGroup', _$textStyleGroup, opt: true);
  static String? _$namedTextStyle(DefaultTextStyleNode v) => v.namedTextStyle;
  static const Field<DefaultTextStyleNode, String> _f$namedTextStyle =
      Field('namedTextStyle', _$namedTextStyle, opt: true);
  static TextAlignEnum? _$textAlign(DefaultTextStyleNode v) => v.textAlign;
  static const Field<DefaultTextStyleNode, TextAlignEnum> _f$textAlign =
      Field('textAlign', _$textAlign, opt: true);
  static STreeNode? _$child(DefaultTextStyleNode v) => v.child;
  static const Field<DefaultTextStyleNode, STreeNode> _f$child =
      Field('child', _$child, opt: true);
  static bool _$isExpanded(DefaultTextStyleNode v) => v.isExpanded;
  static const Field<DefaultTextStyleNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static PTreeNodeTreeController? _$pTreeC(DefaultTextStyleNode v) => v.pTreeC;
  static const Field<DefaultTextStyleNode, PTreeNodeTreeController> _f$pTreeC =
      Field('pTreeC', _$pTreeC, mode: FieldMode.member);
  static double? _$propertiesPaneScrollPos(DefaultTextStyleNode v) =>
      v.propertiesPaneScrollPos;
  static const Field<DefaultTextStyleNode, double> _f$propertiesPaneScrollPos =
      Field('propertiesPaneScrollPos', _$propertiesPaneScrollPos,
          mode: FieldMode.member);
  static ScrollController? _$propertiesPaneSC(DefaultTextStyleNode v) =>
      v.propertiesPaneSC;
  static const Field<DefaultTextStyleNode, ScrollController>
      _f$propertiesPaneSC =
      Field('propertiesPaneSC', _$propertiesPaneSC, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(DefaultTextStyleNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<DefaultTextStyleNode, bool>
      _f$hidePropertiesWhileDragging = Field(
          'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
          mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(
          DefaultTextStyleNode v) =>
      v.nodeWidgetGK;
  static const Field<DefaultTextStyleNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<DefaultTextStyleNode> fields = const {
    #textStyleGroup: _f$textStyleGroup,
    #namedTextStyle: _f$namedTextStyle,
    #textAlign: _f$textAlign,
    #child: _f$child,
    #isExpanded: _f$isExpanded,
    #pTreeC: _f$pTreeC,
    #propertiesPaneScrollPos: _f$propertiesPaneScrollPos,
    #propertiesPaneSC: _f$propertiesPaneSC,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'sc';
  @override
  final dynamic discriminatorValue = 'DefaultTextStyleNode';
  @override
  late final ClassMapperBase superMapper = SCMapper.ensureInitialized();

  static DefaultTextStyleNode _instantiate(DecodingData data) {
    return DefaultTextStyleNode(
        textStyleGroup: data.dec(_f$textStyleGroup),
        namedTextStyle: data.dec(_f$namedTextStyle),
        textAlign: data.dec(_f$textAlign),
        child: data.dec(_f$child));
  }

  @override
  final Function instantiate = _instantiate;

  static DefaultTextStyleNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DefaultTextStyleNode>(map);
  }

  static DefaultTextStyleNode fromJson(String json) {
    return ensureInitialized().decodeJson<DefaultTextStyleNode>(json);
  }
}

mixin DefaultTextStyleNodeMappable {
  String toJson() {
    return DefaultTextStyleNodeMapper.ensureInitialized()
        .encodeJson<DefaultTextStyleNode>(this as DefaultTextStyleNode);
  }

  Map<String, dynamic> toMap() {
    return DefaultTextStyleNodeMapper.ensureInitialized()
        .encodeMap<DefaultTextStyleNode>(this as DefaultTextStyleNode);
  }

  DefaultTextStyleNodeCopyWith<DefaultTextStyleNode, DefaultTextStyleNode,
          DefaultTextStyleNode>
      get copyWith => _DefaultTextStyleNodeCopyWithImpl(
          this as DefaultTextStyleNode, $identity, $identity);
  @override
  String toString() {
    return DefaultTextStyleNodeMapper.ensureInitialized()
        .stringifyValue(this as DefaultTextStyleNode);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            DefaultTextStyleNodeMapper.ensureInitialized()
                .isValueEqual(this as DefaultTextStyleNode, other));
  }

  @override
  int get hashCode {
    return DefaultTextStyleNodeMapper.ensureInitialized()
        .hashValue(this as DefaultTextStyleNode);
  }
}

extension DefaultTextStyleNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DefaultTextStyleNode, $Out> {
  DefaultTextStyleNodeCopyWith<$R, DefaultTextStyleNode, $Out>
      get $asDefaultTextStyleNode =>
          $base.as((v, t, t2) => _DefaultTextStyleNodeCopyWithImpl(v, t, t2));
}

abstract class DefaultTextStyleNodeCopyWith<
    $R,
    $In extends DefaultTextStyleNode,
    $Out> implements SCCopyWith<$R, $In, $Out> {
  TextStyleGroupCopyWith<$R, TextStyleGroup, TextStyleGroup>?
      get textStyleGroup;
  @override
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get child;
  @override
  $R call(
      {TextStyleGroup? textStyleGroup,
      String? namedTextStyle,
      TextAlignEnum? textAlign,
      STreeNode? child});
  DefaultTextStyleNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _DefaultTextStyleNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DefaultTextStyleNode, $Out>
    implements DefaultTextStyleNodeCopyWith<$R, DefaultTextStyleNode, $Out> {
  _DefaultTextStyleNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DefaultTextStyleNode> $mapper =
      DefaultTextStyleNodeMapper.ensureInitialized();
  @override
  TextStyleGroupCopyWith<$R, TextStyleGroup, TextStyleGroup>?
      get textStyleGroup => $value.textStyleGroup?.copyWith
          .$chain((v) => call(textStyleGroup: v));
  @override
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get child =>
      $value.child?.copyWith.$chain((v) => call(child: v));
  @override
  $R call(
          {Object? textStyleGroup = $none,
          Object? namedTextStyle = $none,
          Object? textAlign = $none,
          Object? child = $none}) =>
      $apply(FieldCopyWithData({
        if (textStyleGroup != $none) #textStyleGroup: textStyleGroup,
        if (namedTextStyle != $none) #namedTextStyle: namedTextStyle,
        if (textAlign != $none) #textAlign: textAlign,
        if (child != $none) #child: child
      }));
  @override
  DefaultTextStyleNode $make(CopyWithData data) => DefaultTextStyleNode(
      textStyleGroup: data.get(#textStyleGroup, or: $value.textStyleGroup),
      namedTextStyle: data.get(#namedTextStyle, or: $value.namedTextStyle),
      textAlign: data.get(#textAlign, or: $value.textAlign),
      child: data.get(#child, or: $value.child));

  @override
  DefaultTextStyleNodeCopyWith<$R2, DefaultTextStyleNode, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _DefaultTextStyleNodeCopyWithImpl($value, $cast, t);
}