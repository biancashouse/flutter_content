// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'multi_child_node.dart';

class MCMapper extends SubClassMapperBase<MC> {
  MCMapper._();

  static MCMapper? _instance;
  static MCMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MCMapper._());
      SNodeMapper.ensureInitialized().addSubMapper(_instance!);
      GenericMultiChildNodeMapper.ensureInitialized();
      CarouselNodeMapper.ensureInitialized();
      DirectoryNodeMapper.ensureInitialized();
      FlexNodeMapper.ensureInitialized();
      MenuBarNodeMapper.ensureInitialized();
      PollNodeMapper.ensureInitialized();
      SplitViewNodeMapper.ensureInitialized();
      StackNodeMapper.ensureInitialized();
      StepperNodeMapper.ensureInitialized();
      SubmenuButtonNodeMapper.ensureInitialized();
      TabBarNodeMapper.ensureInitialized();
      TabBarViewNodeMapper.ensureInitialized();
      WrapNodeMapper.ensureInitialized();
      SNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MC';

  static List<SNode> _$children(MC v) => v.children;
  static const Field<MC, List<SNode>> _f$children =
      Field('children', _$children);

  @override
  final MappableFields<MC> fields = const {
    #children: _f$children,
  };

  @override
  final String discriminatorKey = 'snode';
  @override
  final dynamic discriminatorValue = 'MC';
  @override
  late final ClassMapperBase superMapper = SNodeMapper.ensureInitialized();

  static MC _instantiate(DecodingData data) {
    throw MapperException.missingSubclass('MC', 'mc', '${data.value['mc']}');
  }

  @override
  final Function instantiate = _instantiate;

  static MC fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MC>(map);
  }

  static MC fromJson(String json) {
    return ensureInitialized().decodeJson<MC>(json);
  }
}

mixin MCMappable {
  String toJson();
  Map<String, dynamic> toMap();
  MCCopyWith<MC, MC, MC> get copyWith;
}

abstract class MCCopyWith<$R, $In extends MC, $Out>
    implements SNodeCopyWith<$R, $In, $Out> {
  @override
  $R call();
  MCCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}
