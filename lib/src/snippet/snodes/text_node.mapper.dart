// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'text_node.dart';

class TextNodeMapper extends SubClassMapperBase<TextNode> {
  TextNodeMapper._();

  static TextNodeMapper? _instance;
  static TextNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TextNodeMapper._());
      CLMapper.ensureInitialized().addSubMapper(_instance!);
      TextStylePropertiesMapper.ensureInitialized();
      TextAlignEnumMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TextNode';

  static String _$text(TextNode v) => v.text;
  static const Field<TextNode, String> _f$text =
      Field('text', _$text, opt: true, def: '');
  static TextStyleProperties _$tsPropGroup(TextNode v) => v.tsPropGroup;
  static const Field<TextNode, TextStyleProperties> _f$tsPropGroup =
      Field('tsPropGroup', _$tsPropGroup, hook: TextStyleHook());
  static TextAlignEnum? _$textAlign(TextNode v) => v.textAlign;
  static const Field<TextNode, TextAlignEnum> _f$textAlign =
      Field('textAlign', _$textAlign, opt: true);
  static String _$uid(TextNode v) => v.uid;
  static const Field<TextNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static bool _$isExpanded(TextNode v) => v.isExpanded;
  static const Field<TextNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(TextNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<TextNode, bool> _f$hidePropertiesWhileDragging = Field(
      'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
      mode: FieldMode.member);

  @override
  final MappableFields<TextNode> fields = const {
    #text: _f$text,
    #tsPropGroup: _f$tsPropGroup,
    #textAlign: _f$textAlign,
    #uid: _f$uid,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
  };

  @override
  final String discriminatorKey = 'cl';
  @override
  final dynamic discriminatorValue = 'TextNode';
  @override
  late final ClassMapperBase superMapper = CLMapper.ensureInitialized();

  static TextNode _instantiate(DecodingData data) {
    return TextNode(
        text: data.dec(_f$text),
        tsPropGroup: data.dec(_f$tsPropGroup),
        textAlign: data.dec(_f$textAlign));
  }

  @override
  final Function instantiate = _instantiate;

  static TextNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TextNode>(map);
  }

  static TextNode fromJson(String json) {
    return ensureInitialized().decodeJson<TextNode>(json);
  }
}

mixin TextNodeMappable {
  String toJson() {
    return TextNodeMapper.ensureInitialized()
        .encodeJson<TextNode>(this as TextNode);
  }

  Map<String, dynamic> toMap() {
    return TextNodeMapper.ensureInitialized()
        .encodeMap<TextNode>(this as TextNode);
  }

  TextNodeCopyWith<TextNode, TextNode, TextNode> get copyWith =>
      _TextNodeCopyWithImpl(this as TextNode, $identity, $identity);
  @override
  String toString() {
    return TextNodeMapper.ensureInitialized().stringifyValue(this as TextNode);
  }

  @override
  bool operator ==(Object other) {
    return TextNodeMapper.ensureInitialized()
        .equalsValue(this as TextNode, other);
  }

  @override
  int get hashCode {
    return TextNodeMapper.ensureInitialized().hashValue(this as TextNode);
  }
}

extension TextNodeValueCopy<$R, $Out> on ObjectCopyWith<$R, TextNode, $Out> {
  TextNodeCopyWith<$R, TextNode, $Out> get $asTextNode =>
      $base.as((v, t, t2) => _TextNodeCopyWithImpl(v, t, t2));
}

abstract class TextNodeCopyWith<$R, $In extends TextNode, $Out>
    implements CLCopyWith<$R, $In, $Out> {
  TextStylePropertiesCopyWith<$R, TextStyleProperties, TextStyleProperties>
      get tsPropGroup;
  @override
  $R call(
      {String? text,
      TextStyleProperties? tsPropGroup,
      TextAlignEnum? textAlign});
  TextNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TextNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TextNode, $Out>
    implements TextNodeCopyWith<$R, TextNode, $Out> {
  _TextNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TextNode> $mapper =
      TextNodeMapper.ensureInitialized();
  @override
  TextStylePropertiesCopyWith<$R, TextStyleProperties, TextStyleProperties>
      get tsPropGroup =>
          $value.tsPropGroup.copyWith.$chain((v) => call(tsPropGroup: v));
  @override
  $R call(
          {String? text,
          TextStyleProperties? tsPropGroup,
          Object? textAlign = $none}) =>
      $apply(FieldCopyWithData({
        if (text != null) #text: text,
        if (tsPropGroup != null) #tsPropGroup: tsPropGroup,
        if (textAlign != $none) #textAlign: textAlign
      }));
  @override
  TextNode $make(CopyWithData data) => TextNode(
      text: data.get(#text, or: $value.text),
      tsPropGroup: data.get(#tsPropGroup, or: $value.tsPropGroup),
      textAlign: data.get(#textAlign, or: $value.textAlign));

  @override
  TextNodeCopyWith<$R2, TextNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TextNodeCopyWithImpl($value, $cast, t);
}
