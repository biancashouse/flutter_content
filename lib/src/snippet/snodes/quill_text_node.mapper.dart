// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'quill_text_node.dart';

class QuillTextNodeMapper extends SubClassMapperBase<QuillTextNode> {
  QuillTextNodeMapper._();

  static QuillTextNodeMapper? _instance;
  static QuillTextNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = QuillTextNodeMapper._());
      CLMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'QuillTextNode';

  static String _$deltaJsonString(QuillTextNode v) => v.deltaJsonString;
  static const Field<QuillTextNode, String> _f$deltaJsonString = Field(
    'deltaJsonString',
    _$deltaJsonString,
    opt: true,
    def: k_sampleDeltaJsonString,
  );
  static String _$uid(QuillTextNode v) => v.uid;
  static const Field<QuillTextNode, String> _f$uid = Field(
    'uid',
    _$uid,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$treeNodeGK(QuillTextNode v) =>
      v.treeNodeGK;
  static const Field<QuillTextNode, GlobalKey<State<StatefulWidget>>>
  _f$treeNodeGK = Field('treeNodeGK', _$treeNodeGK, mode: FieldMode.member);
  static bool _$isExpanded(QuillTextNode v) => v.isExpanded;
  static const Field<QuillTextNode, bool> _f$isExpanded = Field(
    'isExpanded',
    _$isExpanded,
    mode: FieldMode.member,
  );
  static bool? _$hidePropertiesWhileDragging(QuillTextNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<QuillTextNode, bool> _f$hidePropertiesWhileDragging =
      Field(
        'hidePropertiesWhileDragging',
        _$hidePropertiesWhileDragging,
        mode: FieldMode.member,
      );
  static bool _$canShowTappableNodeWidgetOverlay(QuillTextNode v) =>
      v.canShowTappableNodeWidgetOverlay;
  static const Field<QuillTextNode, bool> _f$canShowTappableNodeWidgetOverlay =
      Field(
        'canShowTappableNodeWidgetOverlay',
        _$canShowTappableNodeWidgetOverlay,
        mode: FieldMode.member,
      );
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(QuillTextNode v) =>
      v.nodeWidgetGK;
  static const Field<QuillTextNode, GlobalKey<State<StatefulWidget>>>
  _f$nodeWidgetGK = Field(
    'nodeWidgetGK',
    _$nodeWidgetGK,
    mode: FieldMode.member,
  );
  static QuillController _$roQC(QuillTextNode v) => v.roQC;
  static const Field<QuillTextNode, QuillController> _f$roQC = Field(
    'roQC',
    _$roQC,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<QuillTextNode> fields = const {
    #deltaJsonString: _f$deltaJsonString,
    #uid: _f$uid,
    #treeNodeGK: _f$treeNodeGK,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #canShowTappableNodeWidgetOverlay: _f$canShowTappableNodeWidgetOverlay,
    #nodeWidgetGK: _f$nodeWidgetGK,
    #roQC: _f$roQC,
  };

  @override
  final String discriminatorKey = 'cl';
  @override
  final dynamic discriminatorValue = 'QuillTextNode';
  @override
  late final ClassMapperBase superMapper = CLMapper.ensureInitialized();

  static QuillTextNode _instantiate(DecodingData data) {
    return QuillTextNode(deltaJsonString: data.dec(_f$deltaJsonString));
  }

  @override
  final Function instantiate = _instantiate;

  static QuillTextNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<QuillTextNode>(map);
  }

  static QuillTextNode fromJson(String json) {
    return ensureInitialized().decodeJson<QuillTextNode>(json);
  }
}

mixin QuillTextNodeMappable {
  String toJson() {
    return QuillTextNodeMapper.ensureInitialized().encodeJson<QuillTextNode>(
      this as QuillTextNode,
    );
  }

  Map<String, dynamic> toMap() {
    return QuillTextNodeMapper.ensureInitialized().encodeMap<QuillTextNode>(
      this as QuillTextNode,
    );
  }

  QuillTextNodeCopyWith<QuillTextNode, QuillTextNode, QuillTextNode>
  get copyWith => _QuillTextNodeCopyWithImpl<QuillTextNode, QuillTextNode>(
    this as QuillTextNode,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return QuillTextNodeMapper.ensureInitialized().stringifyValue(
      this as QuillTextNode,
    );
  }

  @override
  bool operator ==(Object other) {
    return QuillTextNodeMapper.ensureInitialized().equalsValue(
      this as QuillTextNode,
      other,
    );
  }

  @override
  int get hashCode {
    return QuillTextNodeMapper.ensureInitialized().hashValue(
      this as QuillTextNode,
    );
  }
}

extension QuillTextNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, QuillTextNode, $Out> {
  QuillTextNodeCopyWith<$R, QuillTextNode, $Out> get $asQuillTextNode =>
      $base.as((v, t, t2) => _QuillTextNodeCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class QuillTextNodeCopyWith<$R, $In extends QuillTextNode, $Out>
    implements CLCopyWith<$R, $In, $Out> {
  @override
  $R call({String? deltaJsonString});
  QuillTextNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _QuillTextNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, QuillTextNode, $Out>
    implements QuillTextNodeCopyWith<$R, QuillTextNode, $Out> {
  _QuillTextNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<QuillTextNode> $mapper =
      QuillTextNodeMapper.ensureInitialized();
  @override
  $R call({String? deltaJsonString}) => $apply(
    FieldCopyWithData({
      if (deltaJsonString != null) #deltaJsonString: deltaJsonString,
    }),
  );
  @override
  QuillTextNode $make(CopyWithData data) => QuillTextNode(
    deltaJsonString: data.get(#deltaJsonString, or: $value.deltaJsonString),
  );

  @override
  QuillTextNodeCopyWith<$R2, QuillTextNode, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _QuillTextNodeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

