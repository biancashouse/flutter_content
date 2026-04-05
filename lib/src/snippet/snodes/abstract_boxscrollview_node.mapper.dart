// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'abstract_boxscrollview_node.dart';

class BoxScrollViewNodeMapper extends SubClassMapperBase<BoxScrollViewNode> {
  BoxScrollViewNodeMapper._();

  static BoxScrollViewNodeMapper? _instance;
  static BoxScrollViewNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BoxScrollViewNodeMapper._());
      ScrollViewNodeMapper.ensureInitialized().addSubMapper(_instance!);
      ListViewNodeMapper.ensureInitialized();
      GridViewNodeMapper.ensureInitialized();
      AxisEnumMapper.ensureInitialized();
      EdgeInsetsValueMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'BoxScrollViewNode';

  static AxisEnum _$scrollDirection(BoxScrollViewNode v) => v.scrollDirection;
  static const Field<BoxScrollViewNode, AxisEnum> _f$scrollDirection = Field(
    'scrollDirection',
    _$scrollDirection,
    opt: true,
    def: AxisEnum.vertical,
  );
  static bool? _$shrinkWrap(BoxScrollViewNode v) => v.shrinkWrap;
  static const Field<BoxScrollViewNode, bool> _f$shrinkWrap = Field(
    'shrinkWrap',
    _$shrinkWrap,
    opt: true,
  );
  static EdgeInsetsValue? _$padding(BoxScrollViewNode v) => v.padding;
  static const Field<BoxScrollViewNode, EdgeInsetsValue> _f$padding = Field(
    'padding',
    _$padding,
    opt: true,
  );
  static String _$uid(BoxScrollViewNode v) => v.uid;
  static const Field<BoxScrollViewNode, String> _f$uid = Field(
    'uid',
    _$uid,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$treeNodeGK(BoxScrollViewNode v) =>
      v.treeNodeGK;
  static const Field<BoxScrollViewNode, GlobalKey<State<StatefulWidget>>>
  _f$treeNodeGK = Field('treeNodeGK', _$treeNodeGK, mode: FieldMode.member);
  static bool _$isExpanded(BoxScrollViewNode v) => v.isExpanded;
  static const Field<BoxScrollViewNode, bool> _f$isExpanded = Field(
    'isExpanded',
    _$isExpanded,
    mode: FieldMode.member,
  );
  static bool? _$hidePropertiesWhileDragging(BoxScrollViewNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<BoxScrollViewNode, bool> _f$hidePropertiesWhileDragging =
      Field(
        'hidePropertiesWhileDragging',
        _$hidePropertiesWhileDragging,
        mode: FieldMode.member,
      );
  static GlobalKey<State<StatefulWidget>>? _$nodeGK(BoxScrollViewNode v) =>
      v.nodeGK;
  static const Field<BoxScrollViewNode, GlobalKey<State<StatefulWidget>>>
  _f$nodeGK = Field('nodeGK', _$nodeGK, mode: FieldMode.member);
  static ScrollController _$sc(BoxScrollViewNode v) => v.sc;
  static const Field<BoxScrollViewNode, ScrollController> _f$sc = Field(
    'sc',
    _$sc,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<BoxScrollViewNode> fields = const {
    #scrollDirection: _f$scrollDirection,
    #shrinkWrap: _f$shrinkWrap,
    #padding: _f$padding,
    #uid: _f$uid,
    #treeNodeGK: _f$treeNodeGK,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeGK: _f$nodeGK,
    #sc: _f$sc,
  };

  @override
  final String discriminatorKey = 'DK:scrollview';
  @override
  final dynamic discriminatorValue = 'BoxScrollViewNode';
  @override
  late final ClassMapperBase superMapper =
      ScrollViewNodeMapper.ensureInitialized();

  @override
  final MappingHook superHook = ChainedHook([
    PropertyRenameHook('cl', 'DK:cl'),
    PropertyRenameHook('snode', 'DK:snode'),
  ]);

  static BoxScrollViewNode _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
      'BoxScrollViewNode',
      'DK:boxscrollview',
      '${data.value['DK:boxscrollview']}',
    );
  }

  @override
  final Function instantiate = _instantiate;

  static BoxScrollViewNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BoxScrollViewNode>(map);
  }

  static BoxScrollViewNode fromJson(String json) {
    return ensureInitialized().decodeJson<BoxScrollViewNode>(json);
  }
}

mixin BoxScrollViewNodeMappable {
  String toJson();
  Map<String, dynamic> toMap();
  BoxScrollViewNodeCopyWith<
    BoxScrollViewNode,
    BoxScrollViewNode,
    BoxScrollViewNode
  >
  get copyWith;
}

abstract class BoxScrollViewNodeCopyWith<
  $R,
  $In extends BoxScrollViewNode,
  $Out
>
    implements ScrollViewNodeCopyWith<$R, $In, $Out> {
  EdgeInsetsValueCopyWith<$R, EdgeInsetsValue, EdgeInsetsValue>? get padding;
  @override
  $R call({bool? shrinkWrap, EdgeInsetsValue? padding});
  BoxScrollViewNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

