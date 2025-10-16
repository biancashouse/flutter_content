// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'markdown_node.dart';

class MarkdownNodeMapper extends SubClassMapperBase<MarkdownNode> {
  MarkdownNodeMapper._();

  static MarkdownNodeMapper? _instance;
  static MarkdownNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MarkdownNodeMapper._());
      CLMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'MarkdownNode';

  static String? _$data(MarkdownNode v) => v.data;
  static const Field<MarkdownNode, String> _f$data = Field(
    'data',
    _$data,
    opt: true,
  );
  static String _$uid(MarkdownNode v) => v.uid;
  static const Field<MarkdownNode, String> _f$uid = Field(
    'uid',
    _$uid,
    mode: FieldMode.member,
  );
  static GlobalKey<State<StatefulWidget>>? _$treeNodeGK(MarkdownNode v) =>
      v.treeNodeGK;
  static const Field<MarkdownNode, GlobalKey<State<StatefulWidget>>>
  _f$treeNodeGK = Field('treeNodeGK', _$treeNodeGK, mode: FieldMode.member);
  static bool _$isExpanded(MarkdownNode v) => v.isExpanded;
  static const Field<MarkdownNode, bool> _f$isExpanded = Field(
    'isExpanded',
    _$isExpanded,
    mode: FieldMode.member,
  );
  static bool? _$hidePropertiesWhileDragging(MarkdownNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<MarkdownNode, bool> _f$hidePropertiesWhileDragging = Field(
    'hidePropertiesWhileDragging',
    _$hidePropertiesWhileDragging,
    mode: FieldMode.member,
  );
  static bool _$canShowTappableNodeWidgetOverlay(MarkdownNode v) =>
      v.canShowTappableNodeWidgetOverlay;
  static const Field<MarkdownNode, bool> _f$canShowTappableNodeWidgetOverlay =
      Field(
        'canShowTappableNodeWidgetOverlay',
        _$canShowTappableNodeWidgetOverlay,
        mode: FieldMode.member,
      );
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(MarkdownNode v) =>
      v.nodeWidgetGK;
  static const Field<MarkdownNode, GlobalKey<State<StatefulWidget>>>
  _f$nodeWidgetGK = Field(
    'nodeWidgetGK',
    _$nodeWidgetGK,
    mode: FieldMode.member,
  );
  static String _$SAMPLE_MD(MarkdownNode v) => v.SAMPLE_MD;
  static const Field<MarkdownNode, String> _f$SAMPLE_MD = Field(
    'SAMPLE_MD',
    _$SAMPLE_MD,
    mode: FieldMode.member,
  );

  @override
  final MappableFields<MarkdownNode> fields = const {
    #data: _f$data,
    #uid: _f$uid,
    #treeNodeGK: _f$treeNodeGK,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #canShowTappableNodeWidgetOverlay: _f$canShowTappableNodeWidgetOverlay,
    #nodeWidgetGK: _f$nodeWidgetGK,
    #SAMPLE_MD: _f$SAMPLE_MD,
  };

  @override
  final String discriminatorKey = 'cl';
  @override
  final dynamic discriminatorValue = 'MarkdownNode';
  @override
  late final ClassMapperBase superMapper = CLMapper.ensureInitialized();

  static MarkdownNode _instantiate(DecodingData data) {
    return MarkdownNode(data: data.dec(_f$data));
  }

  @override
  final Function instantiate = _instantiate;

  static MarkdownNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MarkdownNode>(map);
  }

  static MarkdownNode fromJson(String json) {
    return ensureInitialized().decodeJson<MarkdownNode>(json);
  }
}

mixin MarkdownNodeMappable {
  String toJson() {
    return MarkdownNodeMapper.ensureInitialized().encodeJson<MarkdownNode>(
      this as MarkdownNode,
    );
  }

  Map<String, dynamic> toMap() {
    return MarkdownNodeMapper.ensureInitialized().encodeMap<MarkdownNode>(
      this as MarkdownNode,
    );
  }

  MarkdownNodeCopyWith<MarkdownNode, MarkdownNode, MarkdownNode> get copyWith =>
      _MarkdownNodeCopyWithImpl<MarkdownNode, MarkdownNode>(
        this as MarkdownNode,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return MarkdownNodeMapper.ensureInitialized().stringifyValue(
      this as MarkdownNode,
    );
  }

  @override
  bool operator ==(Object other) {
    return MarkdownNodeMapper.ensureInitialized().equalsValue(
      this as MarkdownNode,
      other,
    );
  }

  @override
  int get hashCode {
    return MarkdownNodeMapper.ensureInitialized().hashValue(
      this as MarkdownNode,
    );
  }
}

extension MarkdownNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MarkdownNode, $Out> {
  MarkdownNodeCopyWith<$R, MarkdownNode, $Out> get $asMarkdownNode =>
      $base.as((v, t, t2) => _MarkdownNodeCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class MarkdownNodeCopyWith<$R, $In extends MarkdownNode, $Out>
    implements CLCopyWith<$R, $In, $Out> {
  @override
  $R call({String? data});
  MarkdownNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MarkdownNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MarkdownNode, $Out>
    implements MarkdownNodeCopyWith<$R, MarkdownNode, $Out> {
  _MarkdownNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MarkdownNode> $mapper =
      MarkdownNodeMapper.ensureInitialized();
  @override
  $R call({Object? data = $none}) =>
      $apply(FieldCopyWithData({if (data != $none) #data: data}));
  @override
  MarkdownNode $make(CopyWithData data) =>
      MarkdownNode(data: data.get(#data, or: $value.data));

  @override
  MarkdownNodeCopyWith<$R2, MarkdownNode, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _MarkdownNodeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

