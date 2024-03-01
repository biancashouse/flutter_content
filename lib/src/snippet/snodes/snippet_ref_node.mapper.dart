// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'snippet_ref_node.dart';

class SnippetRefNodeMapper extends SubClassMapperBase<SnippetRefNode> {
  SnippetRefNodeMapper._();

  static SnippetRefNodeMapper? _instance;
  static SnippetRefNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SnippetRefNodeMapper._());
      CLMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'SnippetRefNode';

  static String _$snippetName(SnippetRefNode v) => v.snippetName;
  static const Field<SnippetRefNode, String> _f$snippetName =
      Field('snippetName', _$snippetName);
  static bool _$isExpanded(SnippetRefNode v) => v.isExpanded;
  static const Field<SnippetRefNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static PTreeNodeTreeController? _$pTreeC(SnippetRefNode v) => v.pTreeC;
  static const Field<SnippetRefNode, PTreeNodeTreeController> _f$pTreeC =
      Field('pTreeC', _$pTreeC, mode: FieldMode.member);
  static double? _$propertiesPaneScrollPos(SnippetRefNode v) =>
      v.propertiesPaneScrollPos;
  static const Field<SnippetRefNode, double> _f$propertiesPaneScrollPos = Field(
      'propertiesPaneScrollPos', _$propertiesPaneScrollPos,
      mode: FieldMode.member);
  static ScrollController? _$propertiesPaneSC(SnippetRefNode v) =>
      v.propertiesPaneSC;
  static const Field<SnippetRefNode, ScrollController> _f$propertiesPaneSC =
      Field('propertiesPaneSC', _$propertiesPaneSC, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(SnippetRefNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<SnippetRefNode, bool> _f$hidePropertiesWhileDragging =
      Field('hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
          mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(SnippetRefNode v) =>
      v.nodeWidgetGK;
  static const Field<SnippetRefNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<SnippetRefNode> fields = const {
    #snippetName: _f$snippetName,
    #isExpanded: _f$isExpanded,
    #pTreeC: _f$pTreeC,
    #propertiesPaneScrollPos: _f$propertiesPaneScrollPos,
    #propertiesPaneSC: _f$propertiesPaneSC,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'cl';
  @override
  final dynamic discriminatorValue = 'SnippetRefNode';
  @override
  late final ClassMapperBase superMapper = CLMapper.ensureInitialized();

  static SnippetRefNode _instantiate(DecodingData data) {
    return SnippetRefNode(snippetName: data.dec(_f$snippetName));
  }

  @override
  final Function instantiate = _instantiate;

  static SnippetRefNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SnippetRefNode>(map);
  }

  static SnippetRefNode fromJson(String json) {
    return ensureInitialized().decodeJson<SnippetRefNode>(json);
  }
}

mixin SnippetRefNodeMappable {
  String toJson() {
    return SnippetRefNodeMapper.ensureInitialized()
        .encodeJson<SnippetRefNode>(this as SnippetRefNode);
  }

  Map<String, dynamic> toMap() {
    return SnippetRefNodeMapper.ensureInitialized()
        .encodeMap<SnippetRefNode>(this as SnippetRefNode);
  }

  SnippetRefNodeCopyWith<SnippetRefNode, SnippetRefNode, SnippetRefNode>
      get copyWith => _SnippetRefNodeCopyWithImpl(
          this as SnippetRefNode, $identity, $identity);
  @override
  String toString() {
    return SnippetRefNodeMapper.ensureInitialized()
        .stringifyValue(this as SnippetRefNode);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            SnippetRefNodeMapper.ensureInitialized()
                .isValueEqual(this as SnippetRefNode, other));
  }

  @override
  int get hashCode {
    return SnippetRefNodeMapper.ensureInitialized()
        .hashValue(this as SnippetRefNode);
  }
}

extension SnippetRefNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SnippetRefNode, $Out> {
  SnippetRefNodeCopyWith<$R, SnippetRefNode, $Out> get $asSnippetRefNode =>
      $base.as((v, t, t2) => _SnippetRefNodeCopyWithImpl(v, t, t2));
}

abstract class SnippetRefNodeCopyWith<$R, $In extends SnippetRefNode, $Out>
    implements CLCopyWith<$R, $In, $Out> {
  @override
  $R call({String? snippetName});
  SnippetRefNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SnippetRefNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SnippetRefNode, $Out>
    implements SnippetRefNodeCopyWith<$R, SnippetRefNode, $Out> {
  _SnippetRefNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SnippetRefNode> $mapper =
      SnippetRefNodeMapper.ensureInitialized();
  @override
  $R call({String? snippetName}) => $apply(
      FieldCopyWithData({if (snippetName != null) #snippetName: snippetName}));
  @override
  SnippetRefNode $make(CopyWithData data) => SnippetRefNode(
      snippetName: data.get(#snippetName, or: $value.snippetName));

  @override
  SnippetRefNodeCopyWith<$R2, SnippetRefNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SnippetRefNodeCopyWithImpl($value, $cast, t);
}
