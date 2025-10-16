// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'single_child_node.dart';

class SCMapper extends SubClassMapperBase<SC> {
  SCMapper._();

  static SCMapper? _instance;
  static SCMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SCMapper._());
      SNodeMapper.ensureInitialized().addSubMapper(_instance!);
      NamedSCMapper.ensureInitialized();
      NamedPSMapper.ensureInitialized();
      AlignNodeMapper.ensureInitialized();
      AspectRatioNodeMapper.ensureInitialized();
      ButtonNodeMapper.ensureInitialized();
      CenterNodeMapper.ensureInitialized();
      ContainerNodeMapper.ensureInitialized();
      DefaultTextStyleNodeMapper.ensureInitialized();
      ExpandedNodeMapper.ensureInitialized();
      FlexibleNodeMapper.ensureInitialized();
      IntrinsicWidthNodeMapper.ensureInitialized();
      IntrinsicHeightNodeMapper.ensureInitialized();
      PaddingNodeMapper.ensureInitialized();
      PinnedHeaderSliverNodeMapper.ensureInitialized();
      PositionedNodeMapper.ensureInitialized();
      SingleChildScrollViewNodeMapper.ensureInitialized();
      SizedBoxNodeMapper.ensureInitialized();
      SliverFloatingHeaderNodeMapper.ensureInitialized();
      SliverResizingHeaderNodeMapper.ensureInitialized();
      SliverToBoxAdapterNodeMapper.ensureInitialized();
      SnippetRootNodeMapper.ensureInitialized();
      TabNodeMapper.ensureInitialized();
      TargetsWrapperNodeMapper.ensureInitialized();
      SNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SC';

  static SNode? _$child(SC v) => v.child;
  static const Field<SC, SNode> _f$child = Field('child', _$child, opt: true);

  @override
  final MappableFields<SC> fields = const {#child: _f$child};

  @override
  final String discriminatorKey = 'snode';
  @override
  final dynamic discriminatorValue = 'SC';
  @override
  late final ClassMapperBase superMapper = SNodeMapper.ensureInitialized();

  static SC _instantiate(DecodingData data) {
    throw MapperException.missingSubclass('SC', 'sc', '${data.value['sc']}');
  }

  @override
  final Function instantiate = _instantiate;

  static SC fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SC>(map);
  }

  static SC fromJson(String json) {
    return ensureInitialized().decodeJson<SC>(json);
  }
}

mixin SCMappable {
  String toJson();
  Map<String, dynamic> toMap();
  SCCopyWith<SC, SC, SC> get copyWith;
}

abstract class SCCopyWith<$R, $In extends SC, $Out>
    implements SNodeCopyWith<$R, $In, $Out> {
  SNodeCopyWith<$R, SNode, SNode>? get child;
  @override
  $R call({SNode? child});
  SCCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

