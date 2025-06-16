// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'iframe_node.dart';

class IFrameNodeMapper extends SubClassMapperBase<IFrameNode> {
  IFrameNodeMapper._();

  static IFrameNodeMapper? _instance;
  static IFrameNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = IFrameNodeMapper._());
      CLMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'IFrameNode';

  static String? _$src(IFrameNode v) => v.src;
  static const Field<IFrameNode, String> _f$src =
      Field('src', _$src, opt: true);
  static double _$iframeWidth(IFrameNode v) => v.iframeWidth;
  static const Field<IFrameNode, double> _f$iframeWidth =
      Field('iframeWidth', _$iframeWidth, opt: true, def: 800);
  static double _$iframeHeight(IFrameNode v) => v.iframeHeight;
  static const Field<IFrameNode, double> _f$iframeHeight =
      Field('iframeHeight', _$iframeHeight, opt: true, def: 800);
  static String _$uid(IFrameNode v) => v.uid;
  static const Field<IFrameNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static bool _$isExpanded(IFrameNode v) => v.isExpanded;
  static const Field<IFrameNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(IFrameNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<IFrameNode, bool> _f$hidePropertiesWhileDragging = Field(
      'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
      mode: FieldMode.member);

  @override
  final MappableFields<IFrameNode> fields = const {
    #src: _f$src,
    #iframeWidth: _f$iframeWidth,
    #iframeHeight: _f$iframeHeight,
    #uid: _f$uid,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
  };

  @override
  final String discriminatorKey = 'cl';
  @override
  final dynamic discriminatorValue = 'IFrameNode';
  @override
  late final ClassMapperBase superMapper = CLMapper.ensureInitialized();

  static IFrameNode _instantiate(DecodingData data) {
    return IFrameNode(
        src: data.dec(_f$src),
        iframeWidth: data.dec(_f$iframeWidth),
        iframeHeight: data.dec(_f$iframeHeight));
  }

  @override
  final Function instantiate = _instantiate;

  static IFrameNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<IFrameNode>(map);
  }

  static IFrameNode fromJson(String json) {
    return ensureInitialized().decodeJson<IFrameNode>(json);
  }
}

mixin IFrameNodeMappable {
  String toJson() {
    return IFrameNodeMapper.ensureInitialized()
        .encodeJson<IFrameNode>(this as IFrameNode);
  }

  Map<String, dynamic> toMap() {
    return IFrameNodeMapper.ensureInitialized()
        .encodeMap<IFrameNode>(this as IFrameNode);
  }

  IFrameNodeCopyWith<IFrameNode, IFrameNode, IFrameNode> get copyWith =>
      _IFrameNodeCopyWithImpl<IFrameNode, IFrameNode>(
          this as IFrameNode, $identity, $identity);
  @override
  String toString() {
    return IFrameNodeMapper.ensureInitialized()
        .stringifyValue(this as IFrameNode);
  }

  @override
  bool operator ==(Object other) {
    return IFrameNodeMapper.ensureInitialized()
        .equalsValue(this as IFrameNode, other);
  }

  @override
  int get hashCode {
    return IFrameNodeMapper.ensureInitialized().hashValue(this as IFrameNode);
  }
}

extension IFrameNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, IFrameNode, $Out> {
  IFrameNodeCopyWith<$R, IFrameNode, $Out> get $asIFrameNode =>
      $base.as((v, t, t2) => _IFrameNodeCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class IFrameNodeCopyWith<$R, $In extends IFrameNode, $Out>
    implements CLCopyWith<$R, $In, $Out> {
  @override
  $R call({String? src, double? iframeWidth, double? iframeHeight});
  IFrameNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _IFrameNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, IFrameNode, $Out>
    implements IFrameNodeCopyWith<$R, IFrameNode, $Out> {
  _IFrameNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<IFrameNode> $mapper =
      IFrameNodeMapper.ensureInitialized();
  @override
  $R call({Object? src = $none, double? iframeWidth, double? iframeHeight}) =>
      $apply(FieldCopyWithData({
        if (src != $none) #src: src,
        if (iframeWidth != null) #iframeWidth: iframeWidth,
        if (iframeHeight != null) #iframeHeight: iframeHeight
      }));
  @override
  IFrameNode $make(CopyWithData data) => IFrameNode(
      src: data.get(#src, or: $value.src),
      iframeWidth: data.get(#iframeWidth, or: $value.iframeWidth),
      iframeHeight: data.get(#iframeHeight, or: $value.iframeHeight));

  @override
  IFrameNodeCopyWith<$R2, IFrameNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _IFrameNodeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
