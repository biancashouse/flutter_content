// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'snode.dart';

class SNodeMapper extends ClassMapperBase<SNode> {
  SNodeMapper._();

  static SNodeMapper? _instance;
  static SNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SNodeMapper._());
      ScaffoldNodeMapper.ensureInitialized();
      AppBarNodeMapper.ensureInitialized();
      SCMapper.ensureInitialized();
      MCMapper.ensureInitialized();
      CLMapper.ensureInitialized();
      InlineSpanNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SNode';

  static String _$uid(SNode v) => v.uid;
  static const Field<SNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static bool _$isExpanded(SNode v) => v.isExpanded;
  static const Field<SNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(SNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<SNode, bool> _f$hidePropertiesWhileDragging = Field(
      'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
      mode: FieldMode.member);

  @override
  final MappableFields<SNode> fields = const {
    #uid: _f$uid,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
  };

  static SNode _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'SNode', 'snode', '${data.value['snode']}');
  }

  @override
  final Function instantiate = _instantiate;

  static SNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SNode>(map);
  }

  static SNode fromJson(String json) {
    return ensureInitialized().decodeJson<SNode>(json);
  }
}

mixin SNodeMappable {
  String toJson();
  Map<String, dynamic> toMap();
  SNodeCopyWith<SNode, SNode, SNode> get copyWith;
}

abstract class SNodeCopyWith<$R, $In extends SNode, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  SNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}
