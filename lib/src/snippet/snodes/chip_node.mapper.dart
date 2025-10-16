// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'chip_node.dart';

class ChipNodeMapper extends SubClassMapperBase<ChipNode> {
  ChipNodeMapper._();

  static ChipNodeMapper? _instance;
  static ChipNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChipNodeMapper._());
      CLMapper.ensureInitialized().addSubMapper(_instance!);
      TextStylePropertiesMapper.ensureInitialized();
      EdgeInsetsValueMapper.ensureInitialized();
      ColorModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ChipNode';

  static String _$label(ChipNode v) => v.label;
  static const Field<ChipNode, String> _f$label = Field(
    'label',
    _$label,
    opt: true,
    def: 'chip-name?',
  );
  static TextStyleProperties _$labelTSPropGroup(ChipNode v) =>
      v.labelTSPropGroup;
  static const Field<ChipNode, TextStyleProperties> _f$labelTSPropGroup = Field(
    'labelTSPropGroup',
    _$labelTSPropGroup,
  );
  static EdgeInsetsValue? _$labelPadding(ChipNode v) => v.labelPadding;
  static const Field<ChipNode, EdgeInsetsValue> _f$labelPadding = Field(
    'labelPadding',
    _$labelPadding,
    opt: true,
  );
  static ColorModel? _$bgColor(ChipNode v) => v.bgColor;
  static const Field<ChipNode, ColorModel> _f$bgColor = Field(
    'bgColor',
    _$bgColor,
    opt: true,
  );
  static ColorModel? _$disabledColor(ChipNode v) => v.disabledColor;
  static const Field<ChipNode, ColorModel> _f$disabledColor = Field(
    'disabledColor',
    _$disabledColor,
    opt: true,
  );
  static ColorModel? _$selectedColor(ChipNode v) => v.selectedColor;
  static const Field<ChipNode, ColorModel> _f$selectedColor = Field(
    'selectedColor',
    _$selectedColor,
    opt: true,
  );
  static bool _$enabled(ChipNode v) => v.enabled;
  static const Field<ChipNode, bool> _f$enabled = Field(
    'enabled',
    _$enabled,
    opt: true,
    def: false,
  );
  static String? _$destinationPanelOrPlaceholderName(ChipNode v) =>
      v.destinationPanelOrPlaceholderName;
  static const Field<ChipNode, String> _f$destinationPanelOrPlaceholderName =
      Field(
        'destinationPanelOrPlaceholderName',
        _$destinationPanelOrPlaceholderName,
        opt: true,
      );
  static String? _$destinationSnippetName(ChipNode v) =>
      v.destinationSnippetName;
  static const Field<ChipNode, String> _f$destinationSnippetName = Field(
    'destinationSnippetName',
    _$destinationSnippetName,
    opt: true,
  );
  static String? _$destinationRoutePathSnippetName(ChipNode v) =>
      v.destinationRoutePathSnippetName;
  static const Field<ChipNode, String> _f$destinationRoutePathSnippetName =
      Field(
        'destinationRoutePathSnippetName',
        _$destinationRoutePathSnippetName,
        opt: true,
      );
  static String? _$onTapHandlerName(ChipNode v) => v.onTapHandlerName;
  static const Field<ChipNode, String> _f$onTapHandlerName = Field(
    'onTapHandlerName',
    _$onTapHandlerName,
    opt: true,
  );
  static String _$uid(ChipNode v) => v.uid;
  static const Field<ChipNode, String> _f$uid = Field(
    'uid',
    _$uid,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$treeNodeGK(ChipNode v) =>
      v.treeNodeGK;
  static const Field<ChipNode, GlobalKey<State<StatefulWidget>>> _f$treeNodeGK =
      Field('treeNodeGK', _$treeNodeGK, mode: FieldMode.member);
  static bool _$isExpanded(ChipNode v) => v.isExpanded;
  static const Field<ChipNode, bool> _f$isExpanded = Field(
    'isExpanded',
    _$isExpanded,
    mode: FieldMode.member,
  );
  static bool? _$hidePropertiesWhileDragging(ChipNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<ChipNode, bool> _f$hidePropertiesWhileDragging = Field(
    'hidePropertiesWhileDragging',
    _$hidePropertiesWhileDragging,
    mode: FieldMode.member,
  );
  static bool _$canShowTappableNodeWidgetOverlay(ChipNode v) =>
      v.canShowTappableNodeWidgetOverlay;
  static const Field<ChipNode, bool> _f$canShowTappableNodeWidgetOverlay =
      Field(
        'canShowTappableNodeWidgetOverlay',
        _$canShowTappableNodeWidgetOverlay,
        mode: FieldMode.member,
      );
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(ChipNode v) =>
      v.nodeWidgetGK;
  static const Field<ChipNode, GlobalKey<State<StatefulWidget>>>
  _f$nodeWidgetGK = Field(
    'nodeWidgetGK',
    _$nodeWidgetGK,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<ChipNode> fields = const {
    #label: _f$label,
    #labelTSPropGroup: _f$labelTSPropGroup,
    #labelPadding: _f$labelPadding,
    #bgColor: _f$bgColor,
    #disabledColor: _f$disabledColor,
    #selectedColor: _f$selectedColor,
    #enabled: _f$enabled,
    #destinationPanelOrPlaceholderName: _f$destinationPanelOrPlaceholderName,
    #destinationSnippetName: _f$destinationSnippetName,
    #destinationRoutePathSnippetName: _f$destinationRoutePathSnippetName,
    #onTapHandlerName: _f$onTapHandlerName,
    #uid: _f$uid,
    #treeNodeGK: _f$treeNodeGK,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #canShowTappableNodeWidgetOverlay: _f$canShowTappableNodeWidgetOverlay,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'cl';
  @override
  final dynamic discriminatorValue = 'ChipNode';
  @override
  late final ClassMapperBase superMapper = CLMapper.ensureInitialized();

  static ChipNode _instantiate(DecodingData data) {
    return ChipNode(
      label: data.dec(_f$label),
      labelTSPropGroup: data.dec(_f$labelTSPropGroup),
      labelPadding: data.dec(_f$labelPadding),
      bgColor: data.dec(_f$bgColor),
      disabledColor: data.dec(_f$disabledColor),
      selectedColor: data.dec(_f$selectedColor),
      enabled: data.dec(_f$enabled),
      destinationPanelOrPlaceholderName: data.dec(
        _f$destinationPanelOrPlaceholderName,
      ),
      destinationSnippetName: data.dec(_f$destinationSnippetName),
      destinationRoutePathSnippetName: data.dec(
        _f$destinationRoutePathSnippetName,
      ),
      onTapHandlerName: data.dec(_f$onTapHandlerName),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ChipNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ChipNode>(map);
  }

  static ChipNode fromJson(String json) {
    return ensureInitialized().decodeJson<ChipNode>(json);
  }
}

mixin ChipNodeMappable {
  String toJson() {
    return ChipNodeMapper.ensureInitialized().encodeJson<ChipNode>(
      this as ChipNode,
    );
  }

  Map<String, dynamic> toMap() {
    return ChipNodeMapper.ensureInitialized().encodeMap<ChipNode>(
      this as ChipNode,
    );
  }

  ChipNodeCopyWith<ChipNode, ChipNode, ChipNode> get copyWith =>
      _ChipNodeCopyWithImpl<ChipNode, ChipNode>(
        this as ChipNode,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ChipNodeMapper.ensureInitialized().stringifyValue(this as ChipNode);
  }

  @override
  bool operator ==(Object other) {
    return ChipNodeMapper.ensureInitialized().equalsValue(
      this as ChipNode,
      other,
    );
  }

  @override
  int get hashCode {
    return ChipNodeMapper.ensureInitialized().hashValue(this as ChipNode);
  }
}

extension ChipNodeValueCopy<$R, $Out> on ObjectCopyWith<$R, ChipNode, $Out> {
  ChipNodeCopyWith<$R, ChipNode, $Out> get $asChipNode =>
      $base.as((v, t, t2) => _ChipNodeCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ChipNodeCopyWith<$R, $In extends ChipNode, $Out>
    implements CLCopyWith<$R, $In, $Out> {
  TextStylePropertiesCopyWith<$R, TextStyleProperties, TextStyleProperties>
  get labelTSPropGroup;
  EdgeInsetsValueCopyWith<$R, EdgeInsetsValue, EdgeInsetsValue>?
  get labelPadding;
  ColorModelCopyWith<$R, ColorModel, ColorModel>? get bgColor;
  ColorModelCopyWith<$R, ColorModel, ColorModel>? get disabledColor;
  ColorModelCopyWith<$R, ColorModel, ColorModel>? get selectedColor;
  @override
  $R call({
    String? label,
    TextStyleProperties? labelTSPropGroup,
    EdgeInsetsValue? labelPadding,
    ColorModel? bgColor,
    ColorModel? disabledColor,
    ColorModel? selectedColor,
    bool? enabled,
    String? destinationPanelOrPlaceholderName,
    String? destinationSnippetName,
    String? destinationRoutePathSnippetName,
    String? onTapHandlerName,
  });
  ChipNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ChipNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ChipNode, $Out>
    implements ChipNodeCopyWith<$R, ChipNode, $Out> {
  _ChipNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ChipNode> $mapper =
      ChipNodeMapper.ensureInitialized();
  @override
  TextStylePropertiesCopyWith<$R, TextStyleProperties, TextStyleProperties>
  get labelTSPropGroup =>
      $value.labelTSPropGroup.copyWith.$chain((v) => call(labelTSPropGroup: v));
  @override
  EdgeInsetsValueCopyWith<$R, EdgeInsetsValue, EdgeInsetsValue>?
  get labelPadding =>
      $value.labelPadding?.copyWith.$chain((v) => call(labelPadding: v));
  @override
  ColorModelCopyWith<$R, ColorModel, ColorModel>? get bgColor =>
      $value.bgColor?.copyWith.$chain((v) => call(bgColor: v));
  @override
  ColorModelCopyWith<$R, ColorModel, ColorModel>? get disabledColor =>
      $value.disabledColor?.copyWith.$chain((v) => call(disabledColor: v));
  @override
  ColorModelCopyWith<$R, ColorModel, ColorModel>? get selectedColor =>
      $value.selectedColor?.copyWith.$chain((v) => call(selectedColor: v));
  @override
  $R call({
    String? label,
    TextStyleProperties? labelTSPropGroup,
    Object? labelPadding = $none,
    Object? bgColor = $none,
    Object? disabledColor = $none,
    Object? selectedColor = $none,
    bool? enabled,
    Object? destinationPanelOrPlaceholderName = $none,
    Object? destinationSnippetName = $none,
    Object? destinationRoutePathSnippetName = $none,
    Object? onTapHandlerName = $none,
  }) => $apply(
    FieldCopyWithData({
      if (label != null) #label: label,
      if (labelTSPropGroup != null) #labelTSPropGroup: labelTSPropGroup,
      if (labelPadding != $none) #labelPadding: labelPadding,
      if (bgColor != $none) #bgColor: bgColor,
      if (disabledColor != $none) #disabledColor: disabledColor,
      if (selectedColor != $none) #selectedColor: selectedColor,
      if (enabled != null) #enabled: enabled,
      if (destinationPanelOrPlaceholderName != $none)
        #destinationPanelOrPlaceholderName: destinationPanelOrPlaceholderName,
      if (destinationSnippetName != $none)
        #destinationSnippetName: destinationSnippetName,
      if (destinationRoutePathSnippetName != $none)
        #destinationRoutePathSnippetName: destinationRoutePathSnippetName,
      if (onTapHandlerName != $none) #onTapHandlerName: onTapHandlerName,
    }),
  );
  @override
  ChipNode $make(CopyWithData data) => ChipNode(
    label: data.get(#label, or: $value.label),
    labelTSPropGroup: data.get(#labelTSPropGroup, or: $value.labelTSPropGroup),
    labelPadding: data.get(#labelPadding, or: $value.labelPadding),
    bgColor: data.get(#bgColor, or: $value.bgColor),
    disabledColor: data.get(#disabledColor, or: $value.disabledColor),
    selectedColor: data.get(#selectedColor, or: $value.selectedColor),
    enabled: data.get(#enabled, or: $value.enabled),
    destinationPanelOrPlaceholderName: data.get(
      #destinationPanelOrPlaceholderName,
      or: $value.destinationPanelOrPlaceholderName,
    ),
    destinationSnippetName: data.get(
      #destinationSnippetName,
      or: $value.destinationSnippetName,
    ),
    destinationRoutePathSnippetName: data.get(
      #destinationRoutePathSnippetName,
      or: $value.destinationRoutePathSnippetName,
    ),
    onTapHandlerName: data.get(#onTapHandlerName, or: $value.onTapHandlerName),
  );

  @override
  ChipNodeCopyWith<$R2, ChipNode, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ChipNodeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

