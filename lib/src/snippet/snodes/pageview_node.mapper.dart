// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'pageview_node.dart';

class PageViewNodeMapper extends SubClassMapperBase<PageViewNode> {
  PageViewNodeMapper._();

  static PageViewNodeMapper? _instance;
  static PageViewNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PageViewNodeMapper._());
      MCMapper.ensureInitialized().addSubMapper(_instance!);
      SNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PageViewNode';

  static List<SNode> _$children(PageViewNode v) => v.children;
  static const Field<PageViewNode, List<SNode>> _f$children = Field(
    'children',
    _$children,
  );
  static String _$uid(PageViewNode v) => v.uid;
  static const Field<PageViewNode, String> _f$uid = Field(
    'uid',
    _$uid,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$treeNodeGK(PageViewNode v) =>
      v.treeNodeGK;
  static const Field<PageViewNode, GlobalKey<State<StatefulWidget>>>
  _f$treeNodeGK = Field('treeNodeGK', _$treeNodeGK, mode: FieldMode.member);
  static bool _$isExpanded(PageViewNode v) => v.isExpanded;
  static const Field<PageViewNode, bool> _f$isExpanded = Field(
    'isExpanded',
    _$isExpanded,
    mode: FieldMode.member,
  );
  static bool? _$hidePropertiesWhileDragging(PageViewNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<PageViewNode, bool> _f$hidePropertiesWhileDragging = Field(
    'hidePropertiesWhileDragging',
    _$hidePropertiesWhileDragging,
    mode: FieldMode.member,
  );
  static bool _$canShowTappableNodeWidgetOverlay(PageViewNode v) =>
      v.canShowTappableNodeWidgetOverlay;
  static const Field<PageViewNode, bool> _f$canShowTappableNodeWidgetOverlay =
      Field(
        'canShowTappableNodeWidgetOverlay',
        _$canShowTappableNodeWidgetOverlay,
        mode: FieldMode.member,
      );
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(PageViewNode v) =>
      v.nodeWidgetGK;
  static const Field<PageViewNode, GlobalKey<State<StatefulWidget>>>
  _f$nodeWidgetGK = Field(
    'nodeWidgetGK',
    _$nodeWidgetGK,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<PageViewNode> fields = const {
    #children: _f$children,
    #uid: _f$uid,
    #treeNodeGK: _f$treeNodeGK,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #canShowTappableNodeWidgetOverlay: _f$canShowTappableNodeWidgetOverlay,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'DK:mc';
  @override
  final dynamic discriminatorValue = 'PageViewNode';
  @override
  late final ClassMapperBase superMapper = MCMapper.ensureInitialized();

  @override
  final MappingHook superHook = ChainedHook([
    PropertyRenameHook('mc', 'DK:mc'),
    PropertyRenameHook('snode', 'DK:snode'),
  ]);

  static PageViewNode _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('PageViewNode');
  }

  @override
  final Function instantiate = _instantiate;

  static PageViewNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PageViewNode>(map);
  }

  static PageViewNode fromJson(String json) {
    return ensureInitialized().decodeJson<PageViewNode>(json);
  }
}

mixin PageViewNodeMappable {
  String toJson();
  Map<String, dynamic> toMap();
  PageViewNodeCopyWith<PageViewNode, PageViewNode, PageViewNode> get copyWith;
}

abstract class PageViewNodeCopyWith<$R, $In extends PageViewNode, $Out>
    implements MCCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, SNode, SNodeCopyWith<$R, SNode, SNode>> get children;
  @override
  $R call({List<SNode>? children});
  PageViewNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

