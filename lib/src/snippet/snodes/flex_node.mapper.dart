// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'flex_node.dart';

class FlexNodeMapper extends SubClassMapperBase<FlexNode> {
  FlexNodeMapper._();

  static FlexNodeMapper? _instance;
  static FlexNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FlexNodeMapper._());
      MCMapper.ensureInitialized().addSubMapper(_instance!);
      RowNodeMapper.ensureInitialized();
      ColumnNodeMapper.ensureInitialized();
      MainAxisAlignmentEnumMapper.ensureInitialized();
      MainAxisSizeEnumMapper.ensureInitialized();
      CrossAxisAlignmentEnumMapper.ensureInitialized();
      SNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'FlexNode';

  static MainAxisAlignmentEnum? _$mainAxisAlignment(FlexNode v) =>
      v.mainAxisAlignment;
  static const Field<FlexNode, MainAxisAlignmentEnum> _f$mainAxisAlignment =
      Field('mainAxisAlignment', _$mainAxisAlignment, opt: true);
  static MainAxisSizeEnum? _$mainAxisSize(FlexNode v) => v.mainAxisSize;
  static const Field<FlexNode, MainAxisSizeEnum> _f$mainAxisSize =
      Field('mainAxisSize', _$mainAxisSize, opt: true);
  static CrossAxisAlignmentEnum? _$crossAxisAlignment(FlexNode v) =>
      v.crossAxisAlignment;
  static const Field<FlexNode, CrossAxisAlignmentEnum> _f$crossAxisAlignment =
      Field('crossAxisAlignment', _$crossAxisAlignment, opt: true);
  static List<SNode> _$children(FlexNode v) => v.children;
  static const Field<FlexNode, List<SNode>> _f$children =
      Field('children', _$children);
  static String _$uid(FlexNode v) => v.uid;
  static const Field<FlexNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static bool _$isExpanded(FlexNode v) => v.isExpanded;
  static const Field<FlexNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(FlexNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<FlexNode, bool> _f$hidePropertiesWhileDragging = Field(
      'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
      mode: FieldMode.member);

  @override
  final MappableFields<FlexNode> fields = const {
    #mainAxisAlignment: _f$mainAxisAlignment,
    #mainAxisSize: _f$mainAxisSize,
    #crossAxisAlignment: _f$crossAxisAlignment,
    #children: _f$children,
    #uid: _f$uid,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
  };

  @override
  final String discriminatorKey = 'mc';
  @override
  final dynamic discriminatorValue = 'FlexNode';
  @override
  late final ClassMapperBase superMapper = MCMapper.ensureInitialized();

  static FlexNode _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'FlexNode', 'flex', '${data.value['flex']}');
  }

  @override
  final Function instantiate = _instantiate;

  static FlexNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FlexNode>(map);
  }

  static FlexNode fromJson(String json) {
    return ensureInitialized().decodeJson<FlexNode>(json);
  }
}

mixin FlexNodeMappable {
  String toJson();
  Map<String, dynamic> toMap();
  FlexNodeCopyWith<FlexNode, FlexNode, FlexNode> get copyWith;
}

abstract class FlexNodeCopyWith<$R, $In extends FlexNode, $Out>
    implements MCCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, SNode, SNodeCopyWith<$R, SNode, SNode>> get children;
  @override
  $R call(
      {MainAxisAlignmentEnum? mainAxisAlignment,
      MainAxisSizeEnum? mainAxisSize,
      CrossAxisAlignmentEnum? crossAxisAlignment,
      List<SNode>? children});
  FlexNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}
