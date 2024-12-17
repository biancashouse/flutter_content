// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'childless_node.dart';

class CLMapper extends SubClassMapperBase<CL> {
  CLMapper._();

  static CLMapper? _instance;
  static CLMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CLMapper._());
      STreeNodeMapper.ensureInitialized().addSubMapper(_instance!);
      AlgCNodeMapper.ensureInitialized();
      AssetImageNodeMapper.ensureInitialized();
      ChipNodeMapper.ensureInitialized();
      FileNodeMapper.ensureInitialized();
      FirebaseStorageImageNodeMapper.ensureInitialized();
      FSImageNodeMapper.ensureInitialized();
      GapNodeMapper.ensureInitialized();
      GoogleDriveIFrameNodeMapper.ensureInitialized();
      IFrameNodeMapper.ensureInitialized();
      MarkdownNodeMapper.ensureInitialized();
      PlaceholderNodeMapper.ensureInitialized();
      PollOptionNodeMapper.ensureInitialized();
      RichTextNodeMapper.ensureInitialized();
      StepNodeMapper.ensureInitialized();
      TextNodeMapper.ensureInitialized();
      UMLImageNodeMapper.ensureInitialized();
      YTNodeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CL';

  static String _$uid(CL v) => v.uid;
  static const Field<CL, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static bool _$isExpanded(CL v) => v.isExpanded;
  static const Field<CL, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(CL v) =>
      v.hidePropertiesWhileDragging;
  static const Field<CL, bool> _f$hidePropertiesWhileDragging = Field(
      'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
      mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(CL v) =>
      v.nodeWidgetGK;
  static const Field<CL, GlobalKey<State<StatefulWidget>>> _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<CL> fields = const {
    #uid: _f$uid,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'snode';
  @override
  final dynamic discriminatorValue = 'CL';
  @override
  late final ClassMapperBase superMapper = STreeNodeMapper.ensureInitialized();

  static CL _instantiate(DecodingData data) {
    throw MapperException.missingSubclass('CL', 'cl', '${data.value['cl']}');
  }

  @override
  final Function instantiate = _instantiate;

  static CL fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CL>(map);
  }

  static CL fromJson(String json) {
    return ensureInitialized().decodeJson<CL>(json);
  }
}

mixin CLMappable {
  String toJson();
  Map<String, dynamic> toMap();
  CLCopyWith<CL, CL, CL> get copyWith;
}

abstract class CLCopyWith<$R, $In extends CL, $Out>
    implements STreeNodeCopyWith<$R, $In, $Out> {
  @override
  $R call();
  CLCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}
