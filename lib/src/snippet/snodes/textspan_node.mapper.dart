// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'textspan_node.dart';

class TextSpanNodeMapper extends SubClassMapperBase<TextSpanNode> {
  TextSpanNodeMapper._();

  static TextSpanNodeMapper? _instance;
  static TextSpanNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TextSpanNodeMapper._());
      InlineSpanNodeMapper.ensureInitialized().addSubMapper(_instance!);
      TextStyleGroupMapper.ensureInitialized();
      InlineSpanNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TextSpanNode';

  static String? _$text(TextSpanNode v) => v.text;
  static const Field<TextSpanNode, String> _f$text =
      Field('text', _$text, opt: true);
  static bool _$isRootTextSpan(TextSpanNode v) => v.isRootTextSpan;
  static const Field<TextSpanNode, bool> _f$isRootTextSpan =
      Field('isRootTextSpan', _$isRootTextSpan, opt: true, def: false);
  static TextStyleGroup? _$textStyleGroup(TextSpanNode v) => v.textStyleGroup;
  static const Field<TextSpanNode, TextStyleGroup> _f$textStyleGroup =
      Field('textStyleGroup', _$textStyleGroup, opt: true);
  static String? _$namedTextStyle(TextSpanNode v) => v.namedTextStyle;
  static const Field<TextSpanNode, String> _f$namedTextStyle =
      Field('namedTextStyle', _$namedTextStyle, opt: true);
  static List<InlineSpanNode>? _$children(TextSpanNode v) => v.children;
  static const Field<TextSpanNode, List<InlineSpanNode>> _f$children =
      Field('children', _$children, opt: true);
  static bool _$isExpanded(TextSpanNode v) => v.isExpanded;
  static const Field<TextSpanNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(TextSpanNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<TextSpanNode, bool> _f$hidePropertiesWhileDragging = Field(
      'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
      mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(TextSpanNode v) =>
      v.nodeWidgetGK;
  static const Field<TextSpanNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<TextSpanNode> fields = const {
    #text: _f$text,
    #isRootTextSpan: _f$isRootTextSpan,
    #textStyleGroup: _f$textStyleGroup,
    #namedTextStyle: _f$namedTextStyle,
    #children: _f$children,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'is';
  @override
  final dynamic discriminatorValue = 'TextSpanNode';
  @override
  late final ClassMapperBase superMapper =
      InlineSpanNodeMapper.ensureInitialized();

  static TextSpanNode _instantiate(DecodingData data) {
    return TextSpanNode(
        text: data.dec(_f$text),
        isRootTextSpan: data.dec(_f$isRootTextSpan),
        textStyleGroup: data.dec(_f$textStyleGroup),
        namedTextStyle: data.dec(_f$namedTextStyle),
        children: data.dec(_f$children));
  }

  @override
  final Function instantiate = _instantiate;

  static TextSpanNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TextSpanNode>(map);
  }

  static TextSpanNode fromJson(String json) {
    return ensureInitialized().decodeJson<TextSpanNode>(json);
  }
}

mixin TextSpanNodeMappable {
  String toJson() {
    return TextSpanNodeMapper.ensureInitialized()
        .encodeJson<TextSpanNode>(this as TextSpanNode);
  }

  Map<String, dynamic> toMap() {
    return TextSpanNodeMapper.ensureInitialized()
        .encodeMap<TextSpanNode>(this as TextSpanNode);
  }

  TextSpanNodeCopyWith<TextSpanNode, TextSpanNode, TextSpanNode> get copyWith =>
      _TextSpanNodeCopyWithImpl(this as TextSpanNode, $identity, $identity);
  @override
  String toString() {
    return TextSpanNodeMapper.ensureInitialized()
        .stringifyValue(this as TextSpanNode);
  }

  @override
  bool operator ==(Object other) {
    return TextSpanNodeMapper.ensureInitialized()
        .equalsValue(this as TextSpanNode, other);
  }

  @override
  int get hashCode {
    return TextSpanNodeMapper.ensureInitialized()
        .hashValue(this as TextSpanNode);
  }
}

extension TextSpanNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TextSpanNode, $Out> {
  TextSpanNodeCopyWith<$R, TextSpanNode, $Out> get $asTextSpanNode =>
      $base.as((v, t, t2) => _TextSpanNodeCopyWithImpl(v, t, t2));
}

abstract class TextSpanNodeCopyWith<$R, $In extends TextSpanNode, $Out>
    implements InlineSpanNodeCopyWith<$R, $In, $Out> {
  TextStyleGroupCopyWith<$R, TextStyleGroup, TextStyleGroup>?
      get textStyleGroup;
  ListCopyWith<$R, InlineSpanNode,
      InlineSpanNodeCopyWith<$R, InlineSpanNode, InlineSpanNode>>? get children;
  @override
  $R call(
      {String? text,
      bool? isRootTextSpan,
      TextStyleGroup? textStyleGroup,
      String? namedTextStyle,
      List<InlineSpanNode>? children});
  TextSpanNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TextSpanNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TextSpanNode, $Out>
    implements TextSpanNodeCopyWith<$R, TextSpanNode, $Out> {
  _TextSpanNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TextSpanNode> $mapper =
      TextSpanNodeMapper.ensureInitialized();
  @override
  TextStyleGroupCopyWith<$R, TextStyleGroup, TextStyleGroup>?
      get textStyleGroup => $value.textStyleGroup?.copyWith
          .$chain((v) => call(textStyleGroup: v));
  @override
  ListCopyWith<$R, InlineSpanNode,
          InlineSpanNodeCopyWith<$R, InlineSpanNode, InlineSpanNode>>?
      get children => $value.children != null
          ? ListCopyWith($value.children!, (v, t) => v.copyWith.$chain(t),
              (v) => call(children: v))
          : null;
  @override
  $R call(
          {Object? text = $none,
          bool? isRootTextSpan,
          Object? textStyleGroup = $none,
          Object? namedTextStyle = $none,
          Object? children = $none}) =>
      $apply(FieldCopyWithData({
        if (text != $none) #text: text,
        if (isRootTextSpan != null) #isRootTextSpan: isRootTextSpan,
        if (textStyleGroup != $none) #textStyleGroup: textStyleGroup,
        if (namedTextStyle != $none) #namedTextStyle: namedTextStyle,
        if (children != $none) #children: children
      }));
  @override
  TextSpanNode $make(CopyWithData data) => TextSpanNode(
      text: data.get(#text, or: $value.text),
      isRootTextSpan: data.get(#isRootTextSpan, or: $value.isRootTextSpan),
      textStyleGroup: data.get(#textStyleGroup, or: $value.textStyleGroup),
      namedTextStyle: data.get(#namedTextStyle, or: $value.namedTextStyle),
      children: data.get(#children, or: $value.children));

  @override
  TextSpanNodeCopyWith<$R2, TextSpanNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TextSpanNodeCopyWithImpl($value, $cast, t);
}
