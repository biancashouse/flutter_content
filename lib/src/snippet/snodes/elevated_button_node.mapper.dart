// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'elevated_button_node.dart';

class ElevatedButtonNodeMapper extends SubClassMapperBase<ElevatedButtonNode> {
  ElevatedButtonNodeMapper._();

  static ElevatedButtonNodeMapper? _instance;
  static ElevatedButtonNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ElevatedButtonNodeMapper._());
      ButtonNodeMapper.ensureInitialized().addSubMapper(_instance!);
      ButtonStylePropertiesMapper.ensureInitialized();
      SNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ElevatedButtonNode';

  static String? _$destinationRoutePathSnippetName(ElevatedButtonNode v) =>
      v.destinationRoutePathSnippetName;
  static const Field<ElevatedButtonNode, String>
  _f$destinationRoutePathSnippetName = Field(
    'destinationRoutePathSnippetName',
    _$destinationRoutePathSnippetName,
    opt: true,
  );
  static ButtonStyleProperties _$bsPropGroup(ElevatedButtonNode v) =>
      v.bsPropGroup;
  static const Field<ElevatedButtonNode, ButtonStyleProperties> _f$bsPropGroup =
      Field('bsPropGroup', _$bsPropGroup, hook: ButtonStyleHook());
  static String? _$onTapHandlerName(ElevatedButtonNode v) => v.onTapHandlerName;
  static const Field<ElevatedButtonNode, String> _f$onTapHandlerName = Field(
    'onTapHandlerName',
    _$onTapHandlerName,
    opt: true,
  );
  static SNode? _$child(ElevatedButtonNode v) => v.child;
  static const Field<ElevatedButtonNode, SNode> _f$child = Field(
    'child',
    _$child,
    opt: true,
  );
  static String _$uid(ElevatedButtonNode v) => v.uid;
  static const Field<ElevatedButtonNode, String> _f$uid = Field(
    'uid',
    _$uid,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$treeNodeGK(ElevatedButtonNode v) =>
      v.treeNodeGK;
  static const Field<ElevatedButtonNode, GlobalKey<State<StatefulWidget>>>
  _f$treeNodeGK = Field('treeNodeGK', _$treeNodeGK, mode: FieldMode.member);
  static bool _$isExpanded(ElevatedButtonNode v) => v.isExpanded;
  static const Field<ElevatedButtonNode, bool> _f$isExpanded = Field(
    'isExpanded',
    _$isExpanded,
    mode: FieldMode.member,
  );
  static bool? _$hidePropertiesWhileDragging(ElevatedButtonNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<ElevatedButtonNode, bool> _f$hidePropertiesWhileDragging =
      Field(
        'hidePropertiesWhileDragging',
        _$hidePropertiesWhileDragging,
        mode: FieldMode.member,
      );
  static bool _$canShowTappableNodeWidgetOverlay(ElevatedButtonNode v) =>
      v.canShowTappableNodeWidgetOverlay;
  static const Field<ElevatedButtonNode, bool>
  _f$canShowTappableNodeWidgetOverlay = Field(
    'canShowTappableNodeWidgetOverlay',
    _$canShowTappableNodeWidgetOverlay,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(
    ElevatedButtonNode v,
  ) => v.nodeWidgetGK;
  static const Field<ElevatedButtonNode, GlobalKey<State<StatefulWidget>>>
  _f$nodeWidgetGK = Field(
    'nodeWidgetGK',
    _$nodeWidgetGK,
    mode: FieldMode.member,
  );
  static Size _$nodeAddersAndPropertiesCalloutSize(ElevatedButtonNode v) =>
      v.nodeAddersAndPropertiesCalloutSize;
  static const Field<ElevatedButtonNode, Size>
  _f$nodeAddersAndPropertiesCalloutSize = Field(
    'nodeAddersAndPropertiesCalloutSize',
    _$nodeAddersAndPropertiesCalloutSize,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<ElevatedButtonNode> fields = const {
    #destinationRoutePathSnippetName: _f$destinationRoutePathSnippetName,
    #bsPropGroup: _f$bsPropGroup,
    #onTapHandlerName: _f$onTapHandlerName,
    #child: _f$child,
    #uid: _f$uid,
    #treeNodeGK: _f$treeNodeGK,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #canShowTappableNodeWidgetOverlay: _f$canShowTappableNodeWidgetOverlay,
    #nodeWidgetGK: _f$nodeWidgetGK,
    #nodeAddersAndPropertiesCalloutSize: _f$nodeAddersAndPropertiesCalloutSize,
  };

  @override
  final String discriminatorKey = 'button';
  @override
  final dynamic discriminatorValue = 'ElevatedButtonNode';
  @override
  late final ClassMapperBase superMapper = ButtonNodeMapper.ensureInitialized();

  static ElevatedButtonNode _instantiate(DecodingData data) {
    return ElevatedButtonNode(
      destinationRoutePathSnippetName: data.dec(
        _f$destinationRoutePathSnippetName,
      ),
      bsPropGroup: data.dec(_f$bsPropGroup),
      onTapHandlerName: data.dec(_f$onTapHandlerName),
      child: data.dec(_f$child),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ElevatedButtonNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ElevatedButtonNode>(map);
  }

  static ElevatedButtonNode fromJson(String json) {
    return ensureInitialized().decodeJson<ElevatedButtonNode>(json);
  }
}

mixin ElevatedButtonNodeMappable {
  String toJson() {
    return ElevatedButtonNodeMapper.ensureInitialized()
        .encodeJson<ElevatedButtonNode>(this as ElevatedButtonNode);
  }

  Map<String, dynamic> toMap() {
    return ElevatedButtonNodeMapper.ensureInitialized()
        .encodeMap<ElevatedButtonNode>(this as ElevatedButtonNode);
  }

  ElevatedButtonNodeCopyWith<
    ElevatedButtonNode,
    ElevatedButtonNode,
    ElevatedButtonNode
  >
  get copyWith =>
      _ElevatedButtonNodeCopyWithImpl<ElevatedButtonNode, ElevatedButtonNode>(
        this as ElevatedButtonNode,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ElevatedButtonNodeMapper.ensureInitialized().stringifyValue(
      this as ElevatedButtonNode,
    );
  }

  @override
  bool operator ==(Object other) {
    return ElevatedButtonNodeMapper.ensureInitialized().equalsValue(
      this as ElevatedButtonNode,
      other,
    );
  }

  @override
  int get hashCode {
    return ElevatedButtonNodeMapper.ensureInitialized().hashValue(
      this as ElevatedButtonNode,
    );
  }
}

extension ElevatedButtonNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ElevatedButtonNode, $Out> {
  ElevatedButtonNodeCopyWith<$R, ElevatedButtonNode, $Out>
  get $asElevatedButtonNode => $base.as(
    (v, t, t2) => _ElevatedButtonNodeCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ElevatedButtonNodeCopyWith<
  $R,
  $In extends ElevatedButtonNode,
  $Out
>
    implements ButtonNodeCopyWith<$R, $In, $Out> {
  @override
  ButtonStylePropertiesCopyWith<
    $R,
    ButtonStyleProperties,
    ButtonStyleProperties
  >
  get bsPropGroup;
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child;
  @override
  $R call({
    String? destinationRoutePathSnippetName,
    ButtonStyleProperties? bsPropGroup,
    String? onTapHandlerName,
    SNode? child,
  });
  ElevatedButtonNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ElevatedButtonNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ElevatedButtonNode, $Out>
    implements ElevatedButtonNodeCopyWith<$R, ElevatedButtonNode, $Out> {
  _ElevatedButtonNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ElevatedButtonNode> $mapper =
      ElevatedButtonNodeMapper.ensureInitialized();
  @override
  ButtonStylePropertiesCopyWith<
    $R,
    ButtonStyleProperties,
    ButtonStyleProperties
  >
  get bsPropGroup =>
      $value.bsPropGroup.copyWith.$chain((v) => call(bsPropGroup: v));
  @override
  SNodeCopyWith<$R, SNode, SNode>? get child =>
      $value.child?.copyWith.$chain((v) => call(child: v));
  @override
  $R call({
    Object? destinationRoutePathSnippetName = $none,
    ButtonStyleProperties? bsPropGroup,
    Object? onTapHandlerName = $none,
    Object? child = $none,
  }) => $apply(
    FieldCopyWithData({
      if (destinationRoutePathSnippetName != $none)
        #destinationRoutePathSnippetName: destinationRoutePathSnippetName,
      if (bsPropGroup != null) #bsPropGroup: bsPropGroup,
      if (onTapHandlerName != $none) #onTapHandlerName: onTapHandlerName,
      if (child != $none) #child: child,
    }),
  );
  @override
  ElevatedButtonNode $make(CopyWithData data) => ElevatedButtonNode(
    destinationRoutePathSnippetName: data.get(
      #destinationRoutePathSnippetName,
      or: $value.destinationRoutePathSnippetName,
    ),
    bsPropGroup: data.get(#bsPropGroup, or: $value.bsPropGroup),
    onTapHandlerName: data.get(#onTapHandlerName, or: $value.onTapHandlerName),
    child: data.get(#child, or: $value.child),
  );

  @override
  ElevatedButtonNodeCopyWith<$R2, ElevatedButtonNode, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ElevatedButtonNodeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

