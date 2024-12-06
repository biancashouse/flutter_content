// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'rich_text_node.dart';

class RichTextNodeMapper extends SubClassMapperBase<RichTextNode> {
  RichTextNodeMapper._();

  static RichTextNodeMapper? _instance;
  static RichTextNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RichTextNodeMapper._());
      CLMapper.ensureInitialized().addSubMapper(_instance!);
      TextAlignEnumMapper.ensureInitialized();
      TextDirectionEnumMapper.ensureInitialized();
      TextOverflowEnumMapper.ensureInitialized();
      InlineSpanNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'RichTextNode';

  static TextAlignEnum? _$textAlign(RichTextNode v) => v.textAlign;
  static const Field<RichTextNode, TextAlignEnum> _f$textAlign =
      Field('textAlign', _$textAlign, opt: true);
  static TextDirectionEnum? _$textDirection(RichTextNode v) => v.textDirection;
  static const Field<RichTextNode, TextDirectionEnum> _f$textDirection =
      Field('textDirection', _$textDirection, opt: true);
  static bool? _$softWrap(RichTextNode v) => v.softWrap;
  static const Field<RichTextNode, bool> _f$softWrap =
      Field('softWrap', _$softWrap, opt: true);
  static TextOverflowEnum? _$overflow(RichTextNode v) => v.overflow;
  static const Field<RichTextNode, TextOverflowEnum> _f$overflow =
      Field('overflow', _$overflow, opt: true);
  static double? _$textScaleFactor(RichTextNode v) => v.textScaleFactor;
  static const Field<RichTextNode, double> _f$textScaleFactor =
      Field('textScaleFactor', _$textScaleFactor, opt: true);
  static InlineSpanNode _$text(RichTextNode v) => v.text;
  static const Field<RichTextNode, InlineSpanNode> _f$text =
      Field('text', _$text);
  static String _$uid(RichTextNode v) => v.uid;
  static const Field<RichTextNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static bool _$isExpanded(RichTextNode v) => v.isExpanded;
  static const Field<RichTextNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(RichTextNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<RichTextNode, bool> _f$hidePropertiesWhileDragging = Field(
      'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
      mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(RichTextNode v) =>
      v.nodeWidgetGK;
  static const Field<RichTextNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<RichTextNode> fields = const {
    #textAlign: _f$textAlign,
    #textDirection: _f$textDirection,
    #softWrap: _f$softWrap,
    #overflow: _f$overflow,
    #textScaleFactor: _f$textScaleFactor,
    #text: _f$text,
    #uid: _f$uid,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'cl';
  @override
  final dynamic discriminatorValue = 'RichTextNode';
  @override
  late final ClassMapperBase superMapper = CLMapper.ensureInitialized();

  static RichTextNode _instantiate(DecodingData data) {
    return RichTextNode(
        textAlign: data.dec(_f$textAlign),
        textDirection: data.dec(_f$textDirection),
        softWrap: data.dec(_f$softWrap),
        overflow: data.dec(_f$overflow),
        textScaleFactor: data.dec(_f$textScaleFactor),
        text: data.dec(_f$text));
  }

  @override
  final Function instantiate = _instantiate;

  static RichTextNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RichTextNode>(map);
  }

  static RichTextNode fromJson(String json) {
    return ensureInitialized().decodeJson<RichTextNode>(json);
  }
}

mixin RichTextNodeMappable {
  String toJson() {
    return RichTextNodeMapper.ensureInitialized()
        .encodeJson<RichTextNode>(this as RichTextNode);
  }

  Map<String, dynamic> toMap() {
    return RichTextNodeMapper.ensureInitialized()
        .encodeMap<RichTextNode>(this as RichTextNode);
  }

  RichTextNodeCopyWith<RichTextNode, RichTextNode, RichTextNode> get copyWith =>
      _RichTextNodeCopyWithImpl(this as RichTextNode, $identity, $identity);
  @override
  String toString() {
    return RichTextNodeMapper.ensureInitialized()
        .stringifyValue(this as RichTextNode);
  }

  @override
  bool operator ==(Object other) {
    return RichTextNodeMapper.ensureInitialized()
        .equalsValue(this as RichTextNode, other);
  }

  @override
  int get hashCode {
    return RichTextNodeMapper.ensureInitialized()
        .hashValue(this as RichTextNode);
  }
}

extension RichTextNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RichTextNode, $Out> {
  RichTextNodeCopyWith<$R, RichTextNode, $Out> get $asRichTextNode =>
      $base.as((v, t, t2) => _RichTextNodeCopyWithImpl(v, t, t2));
}

abstract class RichTextNodeCopyWith<$R, $In extends RichTextNode, $Out>
    implements CLCopyWith<$R, $In, $Out> {
  InlineSpanNodeCopyWith<$R, InlineSpanNode, InlineSpanNode> get text;
  @override
  $R call(
      {TextAlignEnum? textAlign,
      TextDirectionEnum? textDirection,
      bool? softWrap,
      TextOverflowEnum? overflow,
      double? textScaleFactor,
      InlineSpanNode? text});
  RichTextNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RichTextNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RichTextNode, $Out>
    implements RichTextNodeCopyWith<$R, RichTextNode, $Out> {
  _RichTextNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RichTextNode> $mapper =
      RichTextNodeMapper.ensureInitialized();
  @override
  InlineSpanNodeCopyWith<$R, InlineSpanNode, InlineSpanNode> get text =>
      $value.text.copyWith.$chain((v) => call(text: v));
  @override
  $R call(
          {Object? textAlign = $none,
          Object? textDirection = $none,
          Object? softWrap = $none,
          Object? overflow = $none,
          Object? textScaleFactor = $none,
          InlineSpanNode? text}) =>
      $apply(FieldCopyWithData({
        if (textAlign != $none) #textAlign: textAlign,
        if (textDirection != $none) #textDirection: textDirection,
        if (softWrap != $none) #softWrap: softWrap,
        if (overflow != $none) #overflow: overflow,
        if (textScaleFactor != $none) #textScaleFactor: textScaleFactor,
        if (text != null) #text: text
      }));
  @override
  RichTextNode $make(CopyWithData data) => RichTextNode(
      textAlign: data.get(#textAlign, or: $value.textAlign),
      textDirection: data.get(#textDirection, or: $value.textDirection),
      softWrap: data.get(#softWrap, or: $value.softWrap),
      overflow: data.get(#overflow, or: $value.overflow),
      textScaleFactor: data.get(#textScaleFactor, or: $value.textScaleFactor),
      text: data.get(#text, or: $value.text));

  @override
  RichTextNodeCopyWith<$R2, RichTextNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _RichTextNodeCopyWithImpl($value, $cast, t);
}
