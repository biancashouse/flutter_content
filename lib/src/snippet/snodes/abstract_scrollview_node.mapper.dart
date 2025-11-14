// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'abstract_scrollview_node.dart';

class ScrollViewNodeMapper extends SubClassMapperBase<ScrollViewNode> {
  ScrollViewNodeMapper._();

  static ScrollViewNodeMapper? _instance;
  static ScrollViewNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ScrollViewNodeMapper._());
      CLMapper.ensureInitialized().addSubMapper(_instance!);
      BoxScrollViewNodeMapper.ensureInitialized();
      CustomScrollViewNodeMapper.ensureInitialized();
      AxisEnumMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ScrollViewNode';

  static AxisEnum _$axis(ScrollViewNode v) => v.axis;
  static const Field<ScrollViewNode, AxisEnum> _f$axis = Field(
    'axis',
    _$axis,
    opt: true,
    def: AxisEnum.vertical,
  );
  static bool? _$shrinkWrap(ScrollViewNode v) => v.shrinkWrap;
  static const Field<ScrollViewNode, bool> _f$shrinkWrap = Field(
    'shrinkWrap',
    _$shrinkWrap,
    opt: true,
  );
  static String _$uid(ScrollViewNode v) => v.uid;
  static const Field<ScrollViewNode, String> _f$uid = Field(
    'uid',
    _$uid,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$treeNodeGK(ScrollViewNode v) =>
      v.treeNodeGK;
  static const Field<ScrollViewNode, GlobalKey<State<StatefulWidget>>>
  _f$treeNodeGK = Field('treeNodeGK', _$treeNodeGK, mode: FieldMode.member);
  static bool _$isExpanded(ScrollViewNode v) => v.isExpanded;
  static const Field<ScrollViewNode, bool> _f$isExpanded = Field(
    'isExpanded',
    _$isExpanded,
    mode: FieldMode.member,
  );
  static bool? _$hidePropertiesWhileDragging(ScrollViewNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<ScrollViewNode, bool> _f$hidePropertiesWhileDragging =
      Field(
        'hidePropertiesWhileDragging',
        _$hidePropertiesWhileDragging,
        mode: FieldMode.member,
      );
  static GlobalKey<State<StatefulWidget>>? _$nodeGK(ScrollViewNode v) =>
      v.nodeGK;
  static const Field<ScrollViewNode, GlobalKey<State<StatefulWidget>>>
  _f$nodeGK = Field('nodeGK', _$nodeGK, mode: FieldMode.member);
  static bool _$canShowTappableNodeWidgetOverlay(ScrollViewNode v) =>
      v.canShowTappableNodeWidgetOverlay;
  static const Field<ScrollViewNode, bool> _f$canShowTappableNodeWidgetOverlay =
      Field(
        'canShowTappableNodeWidgetOverlay',
        _$canShowTappableNodeWidgetOverlay,
        mode: FieldMode.member,
      );
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(ScrollViewNode v) =>
      v.nodeWidgetGK;
  static const Field<ScrollViewNode, GlobalKey<State<StatefulWidget>>>
  _f$nodeWidgetGK = Field(
    'nodeWidgetGK',
    _$nodeWidgetGK,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<ScrollViewNode> fields = const {
    #axis: _f$axis,
    #shrinkWrap: _f$shrinkWrap,
    #uid: _f$uid,
    #treeNodeGK: _f$treeNodeGK,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeGK: _f$nodeGK,
    #canShowTappableNodeWidgetOverlay: _f$canShowTappableNodeWidgetOverlay,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'DK:cl';
  @override
  final dynamic discriminatorValue = 'ScrollViewNode';
  @override
  late final ClassMapperBase superMapper = CLMapper.ensureInitialized();

  @override
  final MappingHook superHook = ChainedHook([
    PropertyRenameHook('cl', 'DK:cl'),
    PropertyRenameHook('snode', 'DK:snode'),
  ]);

  static ScrollViewNode _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
      'ScrollViewNode',
      'DK:scrollview',
      '${data.value['DK:scrollview']}',
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ScrollViewNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ScrollViewNode>(map);
  }

  static ScrollViewNode fromJson(String json) {
    return ensureInitialized().decodeJson<ScrollViewNode>(json);
  }
}

mixin ScrollViewNodeMappable {
  String toJson();
  Map<String, dynamic> toMap();
  ScrollViewNodeCopyWith<ScrollViewNode, ScrollViewNode, ScrollViewNode>
  get copyWith;
}

abstract class ScrollViewNodeCopyWith<$R, $In extends ScrollViewNode, $Out>
    implements CLCopyWith<$R, $In, $Out> {
  @override
  $R call({bool? shrinkWrap});
  ScrollViewNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

