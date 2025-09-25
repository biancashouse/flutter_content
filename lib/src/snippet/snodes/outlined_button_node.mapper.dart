// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'outlined_button_node.dart';

class OutlinedButtonNodeMapper extends SubClassMapperBase<OutlinedButtonNode> {
  OutlinedButtonNodeMapper._();

  static OutlinedButtonNodeMapper? _instance;
  static OutlinedButtonNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OutlinedButtonNodeMapper._());
      ButtonNodeMapper.ensureInitialized().addSubMapper(_instance!);
      ButtonStylePropertiesMapper.ensureInitialized();
      SNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'OutlinedButtonNode';

  static String? _$destinationRoutePathSnippetName(OutlinedButtonNode v) =>
      v.destinationRoutePathSnippetName;
  static const Field<OutlinedButtonNode, String>
      _f$destinationRoutePathSnippetName = Field(
          'destinationRoutePathSnippetName', _$destinationRoutePathSnippetName,
          opt: true);
  static ButtonStyleProperties _$bsPropGroup(OutlinedButtonNode v) =>
      v.bsPropGroup;
  static const Field<OutlinedButtonNode, ButtonStyleProperties> _f$bsPropGroup =
      Field('bsPropGroup', _$bsPropGroup, hook: ButtonStyleHook());
  static String? _$onTapHandlerName(OutlinedButtonNode v) => v.onTapHandlerName;
  static const Field<OutlinedButtonNode, String> _f$onTapHandlerName =
      Field('onTapHandlerName', _$onTapHandlerName, opt: true);
  static SNode? _$child(OutlinedButtonNode v) => v.child;
  static const Field<OutlinedButtonNode, SNode> _f$child =
      Field('child', _$child, opt: true);
  static String _$uid(OutlinedButtonNode v) => v.uid;
  static const Field<OutlinedButtonNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$treeNodeGK(OutlinedButtonNode v) =>
      v.treeNodeGK;
  static const Field<OutlinedButtonNode, GlobalKey<State<StatefulWidget>>>
      _f$treeNodeGK = Field('treeNodeGK', _$treeNodeGK, mode: FieldMode.member);
  static bool _$isExpanded(OutlinedButtonNode v) => v.isExpanded;
  static const Field<OutlinedButtonNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(OutlinedButtonNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<OutlinedButtonNode, bool> _f$hidePropertiesWhileDragging =
      Field('hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
          mode: FieldMode.member);

  @override
  final MappableFields<OutlinedButtonNode> fields = const {
    #destinationRoutePathSnippetName: _f$destinationRoutePathSnippetName,
    #bsPropGroup: _f$bsPropGroup,
    #onTapHandlerName: _f$onTapHandlerName,
    #child: _f$child,
    #uid: _f$uid,
    #treeNodeGK: _f$treeNodeGK,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
  };

  @override
  final String discriminatorKey = 'button';
  @override
  final dynamic discriminatorValue = 'OutlinedButtonNode';
  @override
  late final ClassMapperBase superMapper = ButtonNodeMapper.ensureInitialized();

  static OutlinedButtonNode _instantiate(DecodingData data) {
    return OutlinedButtonNode(
        destinationRoutePathSnippetName:
            data.dec(_f$destinationRoutePathSnippetName),
        bsPropGroup: data.dec(_f$bsPropGroup),
        onTapHandlerName: data.dec(_f$onTapHandlerName),
        child: data.dec(_f$child));
  }

  @override
  final Function instantiate = _instantiate;

  static OutlinedButtonNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<OutlinedButtonNode>(map);
  }

  static OutlinedButtonNode fromJson(String json) {
    return ensureInitialized().decodeJson<OutlinedButtonNode>(json);
  }
}

mixin OutlinedButtonNodeMappable {
  String toJson() {
    return OutlinedButtonNodeMapper.ensureInitialized()
        .encodeJson<OutlinedButtonNode>(this as OutlinedButtonNode);
  }

  Map<String, dynamic> toMap() {
    return OutlinedButtonNodeMapper.ensureInitialized()
        .encodeMap<OutlinedButtonNode>(this as OutlinedButtonNode);
  }

  OutlinedButtonNodeCopyWith<OutlinedButtonNode, OutlinedButtonNode,
          OutlinedButtonNode>
      get copyWith => _OutlinedButtonNodeCopyWithImpl<OutlinedButtonNode,
          OutlinedButtonNode>(this as OutlinedButtonNode, $identity, $identity);
  @override
  String toString() {
    return OutlinedButtonNodeMapper.ensureInitialized()
        .stringifyValue(this as OutlinedButtonNode);
  }

  @override
  bool operator ==(Object other) {
    return OutlinedButtonNodeMapper.ensureInitialized()
        .equalsValue(this as OutlinedButtonNode, other);
  }

  @override
  int get hashCode {
    return OutlinedButtonNodeMapper.ensureInitialized()
        .hashValue(this as OutlinedButtonNode);
  }
}

extension OutlinedButtonNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, OutlinedButtonNode, $Out> {
  OutlinedButtonNodeCopyWith<$R, OutlinedButtonNode, $Out>
      get $asOutlinedButtonNode => $base.as(
          (v, t, t2) => _OutlinedButtonNodeCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class OutlinedButtonNodeCopyWith<$R, $In extends OutlinedButtonNode,
    $Out> implements ButtonNodeCopyWith<$R, $In, $Out> {
  @override
  ButtonStylePropertiesCopyWith<$R, ButtonStyleProperties,
      ButtonStyleProperties> get bsPropGroup;
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child;
  @override
  $R call(
      {String? destinationRoutePathSnippetName,
      ButtonStyleProperties? bsPropGroup,
      String? onTapHandlerName,
      SNode? child});
  OutlinedButtonNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _OutlinedButtonNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, OutlinedButtonNode, $Out>
    implements OutlinedButtonNodeCopyWith<$R, OutlinedButtonNode, $Out> {
  _OutlinedButtonNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<OutlinedButtonNode> $mapper =
      OutlinedButtonNodeMapper.ensureInitialized();
  @override
  ButtonStylePropertiesCopyWith<$R, ButtonStyleProperties,
          ButtonStyleProperties>
      get bsPropGroup =>
          $value.bsPropGroup.copyWith.$chain((v) => call(bsPropGroup: v));
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child =>
      $value.child?.copyWith.$chain((v) => call(child: v));
  @override
  $R call(
          {Object? destinationRoutePathSnippetName = $none,
          ButtonStyleProperties? bsPropGroup,
          Object? onTapHandlerName = $none,
          Object? child = $none}) =>
      $apply(FieldCopyWithData({
        if (destinationRoutePathSnippetName != $none)
          #destinationRoutePathSnippetName: destinationRoutePathSnippetName,
        if (bsPropGroup != null) #bsPropGroup: bsPropGroup,
        if (onTapHandlerName != $none) #onTapHandlerName: onTapHandlerName,
        if (child != $none) #child: child
      }));
  @override
  OutlinedButtonNode $make(CopyWithData data) => OutlinedButtonNode(
      destinationRoutePathSnippetName: data.get(
          #destinationRoutePathSnippetName,
          or: $value.destinationRoutePathSnippetName),
      bsPropGroup: data.get(#bsPropGroup, or: $value.bsPropGroup),
      onTapHandlerName:
          data.get(#onTapHandlerName, or: $value.onTapHandlerName),
      child: data.get(#child, or: $value.child));

  @override
  OutlinedButtonNodeCopyWith<$R2, OutlinedButtonNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _OutlinedButtonNodeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
