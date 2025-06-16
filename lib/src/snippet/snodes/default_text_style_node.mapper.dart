// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
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
      TextStylePropertiesMapper.ensureInitialized();
      TextAlignEnumMapper.ensureInitialized();
      SNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'DefaultTextStyleNode';

  static TextStyleProperties _$tsPropGroup(DefaultTextStyleNode v) =>
      v.tsPropGroup;
  static const Field<DefaultTextStyleNode, TextStyleProperties> _f$tsPropGroup =
      Field('tsPropGroup', _$tsPropGroup);
  static TextAlignEnum? _$textAlign(DefaultTextStyleNode v) => v.textAlign;
  static const Field<DefaultTextStyleNode, TextAlignEnum> _f$textAlign =
      Field('textAlign', _$textAlign, opt: true);
  static SNode? _$child(DefaultTextStyleNode v) => v.child;
  static const Field<DefaultTextStyleNode, SNode> _f$child =
      Field('child', _$child, opt: true);
  static String _$uid(DefaultTextStyleNode v) => v.uid;
  static const Field<DefaultTextStyleNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static bool _$isExpanded(DefaultTextStyleNode v) => v.isExpanded;
  static const Field<DefaultTextStyleNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(DefaultTextStyleNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<DefaultTextStyleNode, bool>
      _f$hidePropertiesWhileDragging = Field(
          'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
          mode: FieldMode.member);

  @override
  final MappableFields<DefaultTextStyleNode> fields = const {
    #tsPropGroup: _f$tsPropGroup,
    #textAlign: _f$textAlign,
    #child: _f$child,
    #uid: _f$uid,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
  };

  @override
  final String discriminatorKey = 'sc';
  @override
  final dynamic discriminatorValue = 'DefaultTextStyleNode';
  @override
  late final ClassMapperBase superMapper = SCMapper.ensureInitialized();

  static DefaultTextStyleNode _instantiate(DecodingData data) {
    return DefaultTextStyleNode(
        tsPropGroup: data.dec(_f$tsPropGroup),
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
      DefaultTextStyleNode> get copyWith => _DefaultTextStyleNodeCopyWithImpl<
          DefaultTextStyleNode, DefaultTextStyleNode>(
      this as DefaultTextStyleNode, $identity, $identity);
  @override
  String toString() {
    return DefaultTextStyleNodeMapper.ensureInitialized()
        .stringifyValue(this as DefaultTextStyleNode);
  }

  @override
  bool operator ==(Object other) {
    return DefaultTextStyleNodeMapper.ensureInitialized()
        .equalsValue(this as DefaultTextStyleNode, other);
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
      get $asDefaultTextStyleNode => $base.as(
          (v, t, t2) => _DefaultTextStyleNodeCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class DefaultTextStyleNodeCopyWith<
    $R,
    $In extends DefaultTextStyleNode,
    $Out> implements SCCopyWith<$R, $In, $Out> {
  TextStylePropertiesCopyWith<$R, TextStyleProperties, TextStyleProperties>
      get tsPropGroup;
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child;
  @override
  $R call(
      {TextStyleProperties? tsPropGroup,
      TextAlignEnum? textAlign,
      SNode? child});
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
  TextStylePropertiesCopyWith<$R, TextStyleProperties, TextStyleProperties>
      get tsPropGroup =>
          $value.tsPropGroup.copyWith.$chain((v) => call(tsPropGroup: v));
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child =>
      $value.child?.copyWith.$chain((v) => call(child: v));
  @override
  $R call(
          {TextStyleProperties? tsPropGroup,
          Object? textAlign = $none,
          Object? child = $none}) =>
      $apply(FieldCopyWithData({
        if (tsPropGroup != null) #tsPropGroup: tsPropGroup,
        if (textAlign != $none) #textAlign: textAlign,
        if (child != $none) #child: child
      }));
  @override
  DefaultTextStyleNode $make(CopyWithData data) => DefaultTextStyleNode(
      tsPropGroup: data.get(#tsPropGroup, or: $value.tsPropGroup),
      textAlign: data.get(#textAlign, or: $value.textAlign),
      child: data.get(#child, or: $value.child));

  @override
  DefaultTextStyleNodeCopyWith<$R2, DefaultTextStyleNode, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _DefaultTextStyleNodeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
