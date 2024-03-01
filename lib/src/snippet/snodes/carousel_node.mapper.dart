// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'carousel_node.dart';

class CarouselNodeMapper extends SubClassMapperBase<CarouselNode> {
  CarouselNodeMapper._();

  static CarouselNodeMapper? _instance;
  static CarouselNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CarouselNodeMapper._());
      MCMapper.ensureInitialized().addSubMapper(_instance!);
      AxisEnumMapper.ensureInitialized();
      STreeNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CarouselNode';

  static bool _$autoPlay(CarouselNode v) => v.autoPlay;
  static const Field<CarouselNode, bool> _f$autoPlay =
      Field('autoPlay', _$autoPlay, opt: true, def: true);
  static int _$autoPlayIntervalSecs(CarouselNode v) => v.autoPlayIntervalSecs;
  static const Field<CarouselNode, int> _f$autoPlayIntervalSecs =
      Field('autoPlayIntervalSecs', _$autoPlayIntervalSecs, opt: true, def: 2);
  static bool _$enlargeCenterPage(CarouselNode v) => v.enlargeCenterPage;
  static const Field<CarouselNode, bool> _f$enlargeCenterPage =
      Field('enlargeCenterPage', _$enlargeCenterPage, opt: true, def: true);
  static double _$aspectRatio(CarouselNode v) => v.aspectRatio;
  static const Field<CarouselNode, double> _f$aspectRatio =
      Field('aspectRatio', _$aspectRatio, opt: true, def: 1.0);
  static double? _$height(CarouselNode v) => v.height;
  static const Field<CarouselNode, double> _f$height =
      Field('height', _$height, opt: true);
  static AxisEnum _$axis(CarouselNode v) => v.axis;
  static const Field<CarouselNode, AxisEnum> _f$axis =
      Field('axis', _$axis, opt: true, def: AxisEnum.horizontal);
  static List<STreeNode> _$children(CarouselNode v) => v.children;
  static const Field<CarouselNode, List<STreeNode>> _f$children =
      Field('children', _$children);
  static bool _$isExpanded(CarouselNode v) => v.isExpanded;
  static const Field<CarouselNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static PTreeNodeTreeController? _$pTreeC(CarouselNode v) => v.pTreeC;
  static const Field<CarouselNode, PTreeNodeTreeController> _f$pTreeC =
      Field('pTreeC', _$pTreeC, mode: FieldMode.member);
  static double? _$propertiesPaneScrollPos(CarouselNode v) =>
      v.propertiesPaneScrollPos;
  static const Field<CarouselNode, double> _f$propertiesPaneScrollPos = Field(
      'propertiesPaneScrollPos', _$propertiesPaneScrollPos,
      mode: FieldMode.member);
  static ScrollController? _$propertiesPaneSC(CarouselNode v) =>
      v.propertiesPaneSC;
  static const Field<CarouselNode, ScrollController> _f$propertiesPaneSC =
      Field('propertiesPaneSC', _$propertiesPaneSC, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(CarouselNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<CarouselNode, bool> _f$hidePropertiesWhileDragging = Field(
      'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
      mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(CarouselNode v) =>
      v.nodeWidgetGK;
  static const Field<CarouselNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<CarouselNode> fields = const {
    #autoPlay: _f$autoPlay,
    #autoPlayIntervalSecs: _f$autoPlayIntervalSecs,
    #enlargeCenterPage: _f$enlargeCenterPage,
    #aspectRatio: _f$aspectRatio,
    #height: _f$height,
    #axis: _f$axis,
    #children: _f$children,
    #isExpanded: _f$isExpanded,
    #pTreeC: _f$pTreeC,
    #propertiesPaneScrollPos: _f$propertiesPaneScrollPos,
    #propertiesPaneSC: _f$propertiesPaneSC,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'mc';
  @override
  final dynamic discriminatorValue = 'CarouselNode';
  @override
  late final ClassMapperBase superMapper = MCMapper.ensureInitialized();

  static CarouselNode _instantiate(DecodingData data) {
    return CarouselNode(
        autoPlay: data.dec(_f$autoPlay),
        autoPlayIntervalSecs: data.dec(_f$autoPlayIntervalSecs),
        enlargeCenterPage: data.dec(_f$enlargeCenterPage),
        aspectRatio: data.dec(_f$aspectRatio),
        height: data.dec(_f$height),
        axis: data.dec(_f$axis),
        children: data.dec(_f$children));
  }

  @override
  final Function instantiate = _instantiate;

  static CarouselNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CarouselNode>(map);
  }

  static CarouselNode fromJson(String json) {
    return ensureInitialized().decodeJson<CarouselNode>(json);
  }
}

mixin CarouselNodeMappable {
  String toJson() {
    return CarouselNodeMapper.ensureInitialized()
        .encodeJson<CarouselNode>(this as CarouselNode);
  }

  Map<String, dynamic> toMap() {
    return CarouselNodeMapper.ensureInitialized()
        .encodeMap<CarouselNode>(this as CarouselNode);
  }

  CarouselNodeCopyWith<CarouselNode, CarouselNode, CarouselNode> get copyWith =>
      _CarouselNodeCopyWithImpl(this as CarouselNode, $identity, $identity);
  @override
  String toString() {
    return CarouselNodeMapper.ensureInitialized()
        .stringifyValue(this as CarouselNode);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            CarouselNodeMapper.ensureInitialized()
                .isValueEqual(this as CarouselNode, other));
  }

  @override
  int get hashCode {
    return CarouselNodeMapper.ensureInitialized()
        .hashValue(this as CarouselNode);
  }
}

extension CarouselNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CarouselNode, $Out> {
  CarouselNodeCopyWith<$R, CarouselNode, $Out> get $asCarouselNode =>
      $base.as((v, t, t2) => _CarouselNodeCopyWithImpl(v, t, t2));
}

abstract class CarouselNodeCopyWith<$R, $In extends CarouselNode, $Out>
    implements MCCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, STreeNode, STreeNodeCopyWith<$R, STreeNode, STreeNode>>
      get children;
  @override
  $R call(
      {bool? autoPlay,
      int? autoPlayIntervalSecs,
      bool? enlargeCenterPage,
      double? aspectRatio,
      double? height,
      AxisEnum? axis,
      List<STreeNode>? children});
  CarouselNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CarouselNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CarouselNode, $Out>
    implements CarouselNodeCopyWith<$R, CarouselNode, $Out> {
  _CarouselNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CarouselNode> $mapper =
      CarouselNodeMapper.ensureInitialized();
  @override
  ListCopyWith<$R, STreeNode, STreeNodeCopyWith<$R, STreeNode, STreeNode>>
      get children => ListCopyWith($value.children,
          (v, t) => v.copyWith.$chain(t), (v) => call(children: v));
  @override
  $R call(
          {bool? autoPlay,
          int? autoPlayIntervalSecs,
          bool? enlargeCenterPage,
          double? aspectRatio,
          Object? height = $none,
          AxisEnum? axis,
          List<STreeNode>? children}) =>
      $apply(FieldCopyWithData({
        if (autoPlay != null) #autoPlay: autoPlay,
        if (autoPlayIntervalSecs != null)
          #autoPlayIntervalSecs: autoPlayIntervalSecs,
        if (enlargeCenterPage != null) #enlargeCenterPage: enlargeCenterPage,
        if (aspectRatio != null) #aspectRatio: aspectRatio,
        if (height != $none) #height: height,
        if (axis != null) #axis: axis,
        if (children != null) #children: children
      }));
  @override
  CarouselNode $make(CopyWithData data) => CarouselNode(
      autoPlay: data.get(#autoPlay, or: $value.autoPlay),
      autoPlayIntervalSecs:
          data.get(#autoPlayIntervalSecs, or: $value.autoPlayIntervalSecs),
      enlargeCenterPage:
          data.get(#enlargeCenterPage, or: $value.enlargeCenterPage),
      aspectRatio: data.get(#aspectRatio, or: $value.aspectRatio),
      height: data.get(#height, or: $value.height),
      axis: data.get(#axis, or: $value.axis),
      children: data.get(#children, or: $value.children));

  @override
  CarouselNodeCopyWith<$R2, CarouselNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CarouselNodeCopyWithImpl($value, $cast, t);
}
