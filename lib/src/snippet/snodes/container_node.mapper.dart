// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'container_node.dart';

class ContainerNodeMapper extends SubClassMapperBase<ContainerNode> {
  ContainerNodeMapper._();

  static ContainerNodeMapper? _instance;
  static ContainerNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ContainerNodeMapper._());
      SCMapper.ensureInitialized().addSubMapper(_instance!);
      UpTo6ColorValuesMapper.ensureInitialized();
      EdgeInsetsValueMapper.ensureInitialized();
      AlignmentEnumMapper.ensureInitialized();
      DecorationShapeEnumMapper.ensureInitialized();
      BadgePositionEnumMapper.ensureInitialized();
      OutlinedBorderGroupMapper.ensureInitialized();
      STreeNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ContainerNode';

  static UpTo6ColorValues? _$fillColorValues(ContainerNode v) =>
      v.fillColorValues;
  static const Field<ContainerNode, UpTo6ColorValues> _f$fillColorValues =
      Field('fillColorValues', _$fillColorValues, opt: true);
  static EdgeInsetsValue? _$margin(ContainerNode v) => v.margin;
  static const Field<ContainerNode, EdgeInsetsValue> _f$margin =
      Field('margin', _$margin, opt: true);
  static EdgeInsetsValue? _$padding(ContainerNode v) => v.padding;
  static const Field<ContainerNode, EdgeInsetsValue> _f$padding =
      Field('padding', _$padding, opt: true);
  static double? _$width(ContainerNode v) => v.width;
  static const Field<ContainerNode, double> _f$width =
      Field('width', _$width, opt: true);
  static double? _$height(ContainerNode v) => v.height;
  static const Field<ContainerNode, double> _f$height =
      Field('height', _$height, opt: true);
  static AlignmentEnum? _$alignment(ContainerNode v) => v.alignment;
  static const Field<ContainerNode, AlignmentEnum> _f$alignment =
      Field('alignment', _$alignment, opt: true);
  static DecorationShapeEnum _$decoration(ContainerNode v) => v.decoration;
  static const Field<ContainerNode, DecorationShapeEnum> _f$decoration = Field(
      'decoration', _$decoration,
      opt: true, def: DecorationShapeEnum.rectangle);
  static double? _$borderThickness(ContainerNode v) => v.borderThickness;
  static const Field<ContainerNode, double> _f$borderThickness =
      Field('borderThickness', _$borderThickness, opt: true);
  static UpTo6ColorValues? _$borderColorValues(ContainerNode v) =>
      v.borderColorValues;
  static const Field<ContainerNode, UpTo6ColorValues> _f$borderColorValues =
      Field('borderColorValues', _$borderColorValues, opt: true);
  static double? _$borderRadius(ContainerNode v) => v.borderRadius;
  static const Field<ContainerNode, double> _f$borderRadius =
      Field('borderRadius', _$borderRadius, opt: true);
  static int? _$starPoints(ContainerNode v) => v.starPoints;
  static const Field<ContainerNode, int> _f$starPoints =
      Field('starPoints', _$starPoints, opt: true);
  static int? _$dash(ContainerNode v) => v.dash;
  static const Field<ContainerNode, int> _f$dash =
      Field('dash', _$dash, opt: true);
  static int? _$gap(ContainerNode v) => v.gap;
  static const Field<ContainerNode, int> _f$gap =
      Field('gap', _$gap, opt: true);
  static double? _$badgeWidth(ContainerNode v) => v.badgeWidth;
  static const Field<ContainerNode, double> _f$badgeWidth =
      Field('badgeWidth', _$badgeWidth, opt: true);
  static double? _$badgeHeight(ContainerNode v) => v.badgeHeight;
  static const Field<ContainerNode, double> _f$badgeHeight =
      Field('badgeHeight', _$badgeHeight, opt: true);
  static BadgePositionEnum? _$badgeCorner(ContainerNode v) => v.badgeCorner;
  static const Field<ContainerNode, BadgePositionEnum> _f$badgeCorner =
      Field('badgeCorner', _$badgeCorner, opt: true);
  static String? _$badgeText(ContainerNode v) => v.badgeText;
  static const Field<ContainerNode, String> _f$badgeText =
      Field('badgeText', _$badgeText, opt: true);
  static OutlinedBorderGroup? _$outlinedBorderGroup(ContainerNode v) =>
      v.outlinedBorderGroup;
  static const Field<ContainerNode, OutlinedBorderGroup>
      _f$outlinedBorderGroup =
      Field('outlinedBorderGroup', _$outlinedBorderGroup, opt: true);
  static STreeNode? _$child(ContainerNode v) => v.child;
  static const Field<ContainerNode, STreeNode> _f$child =
      Field('child', _$child, opt: true);
  static bool _$isExpanded(ContainerNode v) => v.isExpanded;
  static const Field<ContainerNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(ContainerNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<ContainerNode, bool> _f$hidePropertiesWhileDragging =
      Field('hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
          mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(ContainerNode v) =>
      v.nodeWidgetGK;
  static const Field<ContainerNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);
  static int? _$borderColor2Value(ContainerNode v) => v.borderColor2Value;
  static const Field<ContainerNode, int> _f$borderColor2Value =
      Field('borderColor2Value', _$borderColor2Value, mode: FieldMode.member);
  static int? _$borderColor3Value(ContainerNode v) => v.borderColor3Value;
  static const Field<ContainerNode, int> _f$borderColor3Value =
      Field('borderColor3Value', _$borderColor3Value, mode: FieldMode.member);
  static int? _$borderColor4Value(ContainerNode v) => v.borderColor4Value;
  static const Field<ContainerNode, int> _f$borderColor4Value =
      Field('borderColor4Value', _$borderColor4Value, mode: FieldMode.member);
  static int? _$borderColor5Value(ContainerNode v) => v.borderColor5Value;
  static const Field<ContainerNode, int> _f$borderColor5Value =
      Field('borderColor5Value', _$borderColor5Value, mode: FieldMode.member);
  static int? _$borderColor6Value(ContainerNode v) => v.borderColor6Value;
  static const Field<ContainerNode, int> _f$borderColor6Value =
      Field('borderColor6Value', _$borderColor6Value, mode: FieldMode.member);

  @override
  final MappableFields<ContainerNode> fields = const {
    #fillColorValues: _f$fillColorValues,
    #margin: _f$margin,
    #padding: _f$padding,
    #width: _f$width,
    #height: _f$height,
    #alignment: _f$alignment,
    #decoration: _f$decoration,
    #borderThickness: _f$borderThickness,
    #borderColorValues: _f$borderColorValues,
    #borderRadius: _f$borderRadius,
    #starPoints: _f$starPoints,
    #dash: _f$dash,
    #gap: _f$gap,
    #badgeWidth: _f$badgeWidth,
    #badgeHeight: _f$badgeHeight,
    #badgeCorner: _f$badgeCorner,
    #badgeText: _f$badgeText,
    #outlinedBorderGroup: _f$outlinedBorderGroup,
    #child: _f$child,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
    #borderColor2Value: _f$borderColor2Value,
    #borderColor3Value: _f$borderColor3Value,
    #borderColor4Value: _f$borderColor4Value,
    #borderColor5Value: _f$borderColor5Value,
    #borderColor6Value: _f$borderColor6Value,
  };

  @override
  final String discriminatorKey = 'sc';
  @override
  final dynamic discriminatorValue = 'ContainerNode';
  @override
  late final ClassMapperBase superMapper = SCMapper.ensureInitialized();

  static ContainerNode _instantiate(DecodingData data) {
    return ContainerNode(
        fillColorValues: data.dec(_f$fillColorValues),
        margin: data.dec(_f$margin),
        padding: data.dec(_f$padding),
        width: data.dec(_f$width),
        height: data.dec(_f$height),
        alignment: data.dec(_f$alignment),
        decoration: data.dec(_f$decoration),
        borderThickness: data.dec(_f$borderThickness),
        borderColorValues: data.dec(_f$borderColorValues),
        borderRadius: data.dec(_f$borderRadius),
        starPoints: data.dec(_f$starPoints),
        dash: data.dec(_f$dash),
        gap: data.dec(_f$gap),
        badgeWidth: data.dec(_f$badgeWidth),
        badgeHeight: data.dec(_f$badgeHeight),
        badgeCorner: data.dec(_f$badgeCorner),
        badgeText: data.dec(_f$badgeText),
        outlinedBorderGroup: data.dec(_f$outlinedBorderGroup),
        child: data.dec(_f$child));
  }

  @override
  final Function instantiate = _instantiate;

  static ContainerNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ContainerNode>(map);
  }

  static ContainerNode fromJson(String json) {
    return ensureInitialized().decodeJson<ContainerNode>(json);
  }
}

mixin ContainerNodeMappable {
  String toJson() {
    return ContainerNodeMapper.ensureInitialized()
        .encodeJson<ContainerNode>(this as ContainerNode);
  }

  Map<String, dynamic> toMap() {
    return ContainerNodeMapper.ensureInitialized()
        .encodeMap<ContainerNode>(this as ContainerNode);
  }

  ContainerNodeCopyWith<ContainerNode, ContainerNode, ContainerNode>
      get copyWith => _ContainerNodeCopyWithImpl(
          this as ContainerNode, $identity, $identity);
  @override
  String toString() {
    return ContainerNodeMapper.ensureInitialized()
        .stringifyValue(this as ContainerNode);
  }

  @override
  bool operator ==(Object other) {
    return ContainerNodeMapper.ensureInitialized()
        .equalsValue(this as ContainerNode, other);
  }

  @override
  int get hashCode {
    return ContainerNodeMapper.ensureInitialized()
        .hashValue(this as ContainerNode);
  }
}

extension ContainerNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ContainerNode, $Out> {
  ContainerNodeCopyWith<$R, ContainerNode, $Out> get $asContainerNode =>
      $base.as((v, t, t2) => _ContainerNodeCopyWithImpl(v, t, t2));
}

abstract class ContainerNodeCopyWith<$R, $In extends ContainerNode, $Out>
    implements SCCopyWith<$R, $In, $Out> {
  UpTo6ColorValuesCopyWith<$R, UpTo6ColorValues, UpTo6ColorValues>?
      get fillColorValues;
  EdgeInsetsValueCopyWith<$R, EdgeInsetsValue, EdgeInsetsValue>? get margin;
  EdgeInsetsValueCopyWith<$R, EdgeInsetsValue, EdgeInsetsValue>? get padding;
  UpTo6ColorValuesCopyWith<$R, UpTo6ColorValues, UpTo6ColorValues>?
      get borderColorValues;
  OutlinedBorderGroupCopyWith<$R, OutlinedBorderGroup, OutlinedBorderGroup>?
      get outlinedBorderGroup;
  @override
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get child;
  @override
  $R call(
      {UpTo6ColorValues? fillColorValues,
      EdgeInsetsValue? margin,
      EdgeInsetsValue? padding,
      double? width,
      double? height,
      AlignmentEnum? alignment,
      DecorationShapeEnum? decoration,
      double? borderThickness,
      UpTo6ColorValues? borderColorValues,
      double? borderRadius,
      int? starPoints,
      int? dash,
      int? gap,
      double? badgeWidth,
      double? badgeHeight,
      BadgePositionEnum? badgeCorner,
      String? badgeText,
      OutlinedBorderGroup? outlinedBorderGroup,
      STreeNode? child});
  ContainerNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ContainerNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ContainerNode, $Out>
    implements ContainerNodeCopyWith<$R, ContainerNode, $Out> {
  _ContainerNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ContainerNode> $mapper =
      ContainerNodeMapper.ensureInitialized();
  @override
  UpTo6ColorValuesCopyWith<$R, UpTo6ColorValues, UpTo6ColorValues>?
      get fillColorValues => $value.fillColorValues?.copyWith
          .$chain((v) => call(fillColorValues: v));
  @override
  EdgeInsetsValueCopyWith<$R, EdgeInsetsValue, EdgeInsetsValue>? get margin =>
      $value.margin?.copyWith.$chain((v) => call(margin: v));
  @override
  EdgeInsetsValueCopyWith<$R, EdgeInsetsValue, EdgeInsetsValue>? get padding =>
      $value.padding?.copyWith.$chain((v) => call(padding: v));
  @override
  UpTo6ColorValuesCopyWith<$R, UpTo6ColorValues, UpTo6ColorValues>?
      get borderColorValues => $value.borderColorValues?.copyWith
          .$chain((v) => call(borderColorValues: v));
  @override
  OutlinedBorderGroupCopyWith<$R, OutlinedBorderGroup, OutlinedBorderGroup>?
      get outlinedBorderGroup => $value.outlinedBorderGroup?.copyWith
          .$chain((v) => call(outlinedBorderGroup: v));
  @override
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get child =>
      $value.child?.copyWith.$chain((v) => call(child: v));
  @override
  $R call(
          {Object? fillColorValues = $none,
          Object? margin = $none,
          Object? padding = $none,
          Object? width = $none,
          Object? height = $none,
          Object? alignment = $none,
          DecorationShapeEnum? decoration,
          Object? borderThickness = $none,
          Object? borderColorValues = $none,
          Object? borderRadius = $none,
          Object? starPoints = $none,
          Object? dash = $none,
          Object? gap = $none,
          Object? badgeWidth = $none,
          Object? badgeHeight = $none,
          Object? badgeCorner = $none,
          Object? badgeText = $none,
          Object? outlinedBorderGroup = $none,
          Object? child = $none}) =>
      $apply(FieldCopyWithData({
        if (fillColorValues != $none) #fillColorValues: fillColorValues,
        if (margin != $none) #margin: margin,
        if (padding != $none) #padding: padding,
        if (width != $none) #width: width,
        if (height != $none) #height: height,
        if (alignment != $none) #alignment: alignment,
        if (decoration != null) #decoration: decoration,
        if (borderThickness != $none) #borderThickness: borderThickness,
        if (borderColorValues != $none) #borderColorValues: borderColorValues,
        if (borderRadius != $none) #borderRadius: borderRadius,
        if (starPoints != $none) #starPoints: starPoints,
        if (dash != $none) #dash: dash,
        if (gap != $none) #gap: gap,
        if (badgeWidth != $none) #badgeWidth: badgeWidth,
        if (badgeHeight != $none) #badgeHeight: badgeHeight,
        if (badgeCorner != $none) #badgeCorner: badgeCorner,
        if (badgeText != $none) #badgeText: badgeText,
        if (outlinedBorderGroup != $none)
          #outlinedBorderGroup: outlinedBorderGroup,
        if (child != $none) #child: child
      }));
  @override
  ContainerNode $make(CopyWithData data) => ContainerNode(
      fillColorValues: data.get(#fillColorValues, or: $value.fillColorValues),
      margin: data.get(#margin, or: $value.margin),
      padding: data.get(#padding, or: $value.padding),
      width: data.get(#width, or: $value.width),
      height: data.get(#height, or: $value.height),
      alignment: data.get(#alignment, or: $value.alignment),
      decoration: data.get(#decoration, or: $value.decoration),
      borderThickness: data.get(#borderThickness, or: $value.borderThickness),
      borderColorValues:
          data.get(#borderColorValues, or: $value.borderColorValues),
      borderRadius: data.get(#borderRadius, or: $value.borderRadius),
      starPoints: data.get(#starPoints, or: $value.starPoints),
      dash: data.get(#dash, or: $value.dash),
      gap: data.get(#gap, or: $value.gap),
      badgeWidth: data.get(#badgeWidth, or: $value.badgeWidth),
      badgeHeight: data.get(#badgeHeight, or: $value.badgeHeight),
      badgeCorner: data.get(#badgeCorner, or: $value.badgeCorner),
      badgeText: data.get(#badgeText, or: $value.badgeText),
      outlinedBorderGroup:
          data.get(#outlinedBorderGroup, or: $value.outlinedBorderGroup),
      child: data.get(#child, or: $value.child));

  @override
  ContainerNodeCopyWith<$R2, ContainerNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ContainerNodeCopyWithImpl($value, $cast, t);
}
