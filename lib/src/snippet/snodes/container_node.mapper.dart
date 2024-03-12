// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'container_node.dart';

class ContainerNodeMapper extends SubClassMapperBase<ContainerNode> {
  ContainerNodeMapper._();

  static ContainerNodeMapper? _instance;
  static ContainerNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ContainerNodeMapper._());
      SCMapper.ensureInitialized().addSubMapper(_instance!);
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

  static int? _$fillColor1Value(ContainerNode v) => v.fillColor1Value;
  static const Field<ContainerNode, int> _f$fillColor1Value =
      Field('fillColor1Value', _$fillColor1Value, opt: true);
  static int? _$fillColor2Value(ContainerNode v) => v.fillColor2Value;
  static const Field<ContainerNode, int> _f$fillColor2Value =
      Field('fillColor2Value', _$fillColor2Value, opt: true);
  static int? _$fillColor3Value(ContainerNode v) => v.fillColor3Value;
  static const Field<ContainerNode, int> _f$fillColor3Value =
      Field('fillColor3Value', _$fillColor3Value, opt: true);
  static int? _$fillColor4Value(ContainerNode v) => v.fillColor4Value;
  static const Field<ContainerNode, int> _f$fillColor4Value =
      Field('fillColor4Value', _$fillColor4Value, opt: true);
  static int? _$fillColor5Value(ContainerNode v) => v.fillColor5Value;
  static const Field<ContainerNode, int> _f$fillColor5Value =
      Field('fillColor5Value', _$fillColor5Value, opt: true);
  static int? _$fillColor6Value(ContainerNode v) => v.fillColor6Value;
  static const Field<ContainerNode, int> _f$fillColor6Value =
      Field('fillColor6Value', _$fillColor6Value, opt: true);
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
  static int? _$borderColor1Value(ContainerNode v) => v.borderColor1Value;
  static const Field<ContainerNode, int> _f$borderColor1Value =
      Field('borderColor1Value', _$borderColor1Value, opt: true);
  static int? _$borderColor2Value(ContainerNode v) => v.borderColor2Value;
  static const Field<ContainerNode, int> _f$borderColor2Value =
      Field('borderColor2Value', _$borderColor2Value, opt: true);
  static int? _$borderColor3Value(ContainerNode v) => v.borderColor3Value;
  static const Field<ContainerNode, int> _f$borderColor3Value =
      Field('borderColor3Value', _$borderColor3Value, opt: true);
  static int? _$borderColor4Value(ContainerNode v) => v.borderColor4Value;
  static const Field<ContainerNode, int> _f$borderColor4Value =
      Field('borderColor4Value', _$borderColor4Value, opt: true);
  static int? _$borderColor5Value(ContainerNode v) => v.borderColor5Value;
  static const Field<ContainerNode, int> _f$borderColor5Value =
      Field('borderColor5Value', _$borderColor5Value, opt: true);
  static int? _$borderColor6Value(ContainerNode v) => v.borderColor6Value;
  static const Field<ContainerNode, int> _f$borderColor6Value =
      Field('borderColor6Value', _$borderColor6Value, opt: true);
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

  @override
  final MappableFields<ContainerNode> fields = const {
    #fillColor1Value: _f$fillColor1Value,
    #fillColor2Value: _f$fillColor2Value,
    #fillColor3Value: _f$fillColor3Value,
    #fillColor4Value: _f$fillColor4Value,
    #fillColor5Value: _f$fillColor5Value,
    #fillColor6Value: _f$fillColor6Value,
    #margin: _f$margin,
    #padding: _f$padding,
    #width: _f$width,
    #height: _f$height,
    #alignment: _f$alignment,
    #decoration: _f$decoration,
    #borderThickness: _f$borderThickness,
    #borderColor1Value: _f$borderColor1Value,
    #borderColor2Value: _f$borderColor2Value,
    #borderColor3Value: _f$borderColor3Value,
    #borderColor4Value: _f$borderColor4Value,
    #borderColor5Value: _f$borderColor5Value,
    #borderColor6Value: _f$borderColor6Value,
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
  };

  @override
  final String discriminatorKey = 'sc';
  @override
  final dynamic discriminatorValue = 'ContainerNode';
  @override
  late final ClassMapperBase superMapper = SCMapper.ensureInitialized();

  static ContainerNode _instantiate(DecodingData data) {
    return ContainerNode(
        fillColor1Value: data.dec(_f$fillColor1Value),
        fillColor2Value: data.dec(_f$fillColor2Value),
        fillColor3Value: data.dec(_f$fillColor3Value),
        fillColor4Value: data.dec(_f$fillColor4Value),
        fillColor5Value: data.dec(_f$fillColor5Value),
        fillColor6Value: data.dec(_f$fillColor6Value),
        margin: data.dec(_f$margin),
        padding: data.dec(_f$padding),
        width: data.dec(_f$width),
        height: data.dec(_f$height),
        alignment: data.dec(_f$alignment),
        decoration: data.dec(_f$decoration),
        borderThickness: data.dec(_f$borderThickness),
        borderColor1Value: data.dec(_f$borderColor1Value),
        borderColor2Value: data.dec(_f$borderColor2Value),
        borderColor3Value: data.dec(_f$borderColor3Value),
        borderColor4Value: data.dec(_f$borderColor4Value),
        borderColor5Value: data.dec(_f$borderColor5Value),
        borderColor6Value: data.dec(_f$borderColor6Value),
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
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ContainerNodeMapper.ensureInitialized()
                .isValueEqual(this as ContainerNode, other));
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
  EdgeInsetsValueCopyWith<$R, EdgeInsetsValue, EdgeInsetsValue>? get margin;
  EdgeInsetsValueCopyWith<$R, EdgeInsetsValue, EdgeInsetsValue>? get padding;
  OutlinedBorderGroupCopyWith<$R, OutlinedBorderGroup, OutlinedBorderGroup>?
      get outlinedBorderGroup;
  @override
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get child;
  @override
  $R call(
      {int? fillColor1Value,
      int? fillColor2Value,
      int? fillColor3Value,
      int? fillColor4Value,
      int? fillColor5Value,
      int? fillColor6Value,
      EdgeInsetsValue? margin,
      EdgeInsetsValue? padding,
      double? width,
      double? height,
      AlignmentEnum? alignment,
      DecorationShapeEnum? decoration,
      double? borderThickness,
      int? borderColor1Value,
      int? borderColor2Value,
      int? borderColor3Value,
      int? borderColor4Value,
      int? borderColor5Value,
      int? borderColor6Value,
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
  EdgeInsetsValueCopyWith<$R, EdgeInsetsValue, EdgeInsetsValue>? get margin =>
      $value.margin?.copyWith.$chain((v) => call(margin: v));
  @override
  EdgeInsetsValueCopyWith<$R, EdgeInsetsValue, EdgeInsetsValue>? get padding =>
      $value.padding?.copyWith.$chain((v) => call(padding: v));
  @override
  OutlinedBorderGroupCopyWith<$R, OutlinedBorderGroup, OutlinedBorderGroup>?
      get outlinedBorderGroup => $value.outlinedBorderGroup?.copyWith
          .$chain((v) => call(outlinedBorderGroup: v));
  @override
  STreeNodeCopyWith<$R, STreeNode, STreeNode>? get child =>
      $value.child?.copyWith.$chain((v) => call(child: v));
  @override
  $R call(
          {Object? fillColor1Value = $none,
          Object? fillColor2Value = $none,
          Object? fillColor3Value = $none,
          Object? fillColor4Value = $none,
          Object? fillColor5Value = $none,
          Object? fillColor6Value = $none,
          Object? margin = $none,
          Object? padding = $none,
          Object? width = $none,
          Object? height = $none,
          Object? alignment = $none,
          DecorationShapeEnum? decoration,
          Object? borderThickness = $none,
          Object? borderColor1Value = $none,
          Object? borderColor2Value = $none,
          Object? borderColor3Value = $none,
          Object? borderColor4Value = $none,
          Object? borderColor5Value = $none,
          Object? borderColor6Value = $none,
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
        if (fillColor1Value != $none) #fillColor1Value: fillColor1Value,
        if (fillColor2Value != $none) #fillColor2Value: fillColor2Value,
        if (fillColor3Value != $none) #fillColor3Value: fillColor3Value,
        if (fillColor4Value != $none) #fillColor4Value: fillColor4Value,
        if (fillColor5Value != $none) #fillColor5Value: fillColor5Value,
        if (fillColor6Value != $none) #fillColor6Value: fillColor6Value,
        if (margin != $none) #margin: margin,
        if (padding != $none) #padding: padding,
        if (width != $none) #width: width,
        if (height != $none) #height: height,
        if (alignment != $none) #alignment: alignment,
        if (decoration != null) #decoration: decoration,
        if (borderThickness != $none) #borderThickness: borderThickness,
        if (borderColor1Value != $none) #borderColor1Value: borderColor1Value,
        if (borderColor2Value != $none) #borderColor2Value: borderColor2Value,
        if (borderColor3Value != $none) #borderColor3Value: borderColor3Value,
        if (borderColor4Value != $none) #borderColor4Value: borderColor4Value,
        if (borderColor5Value != $none) #borderColor5Value: borderColor5Value,
        if (borderColor6Value != $none) #borderColor6Value: borderColor6Value,
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
      fillColor1Value: data.get(#fillColor1Value, or: $value.fillColor1Value),
      fillColor2Value: data.get(#fillColor2Value, or: $value.fillColor2Value),
      fillColor3Value: data.get(#fillColor3Value, or: $value.fillColor3Value),
      fillColor4Value: data.get(#fillColor4Value, or: $value.fillColor4Value),
      fillColor5Value: data.get(#fillColor5Value, or: $value.fillColor5Value),
      fillColor6Value: data.get(#fillColor6Value, or: $value.fillColor6Value),
      margin: data.get(#margin, or: $value.margin),
      padding: data.get(#padding, or: $value.padding),
      width: data.get(#width, or: $value.width),
      height: data.get(#height, or: $value.height),
      alignment: data.get(#alignment, or: $value.alignment),
      decoration: data.get(#decoration, or: $value.decoration),
      borderThickness: data.get(#borderThickness, or: $value.borderThickness),
      borderColor1Value:
          data.get(#borderColor1Value, or: $value.borderColor1Value),
      borderColor2Value:
          data.get(#borderColor2Value, or: $value.borderColor2Value),
      borderColor3Value:
          data.get(#borderColor3Value, or: $value.borderColor3Value),
      borderColor4Value:
          data.get(#borderColor4Value, or: $value.borderColor4Value),
      borderColor5Value:
          data.get(#borderColor5Value, or: $value.borderColor5Value),
      borderColor6Value:
          data.get(#borderColor6Value, or: $value.borderColor6Value),
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
