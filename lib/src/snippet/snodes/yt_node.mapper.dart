// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'yt_node.dart';

class YTNodeMapper extends SubClassMapperBase<YTNode> {
  YTNodeMapper._();

  static YTNodeMapper? _instance;
  static YTNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = YTNodeMapper._());
      CLMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'YTNode';

  static String? _$ytUrl(YTNode v) => v.ytUrl;
  static const Field<YTNode, String> _f$ytUrl =
      Field('ytUrl', _$ytUrl, opt: true);
  static int? _$startAtSecs(YTNode v) => v.startAtSecs;
  static const Field<YTNode, int> _f$startAtSecs =
      Field('startAtSecs', _$startAtSecs, opt: true);
  static int? _$endAtSecs(YTNode v) => v.endAtSecs;
  static const Field<YTNode, int> _f$endAtSecs =
      Field('endAtSecs', _$endAtSecs, opt: true);
  static double _$iframeWidth(YTNode v) => v.iframeWidth;
  static const Field<YTNode, double> _f$iframeWidth =
      Field('iframeWidth', _$iframeWidth, opt: true, def: 560);
  static double _$iframeHeight(YTNode v) => v.iframeHeight;
  static const Field<YTNode, double> _f$iframeHeight =
      Field('iframeHeight', _$iframeHeight, opt: true, def: 316);
  static String _$uid(YTNode v) => v.uid;
  static const Field<YTNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static bool _$isExpanded(YTNode v) => v.isExpanded;
  static const Field<YTNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(YTNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<YTNode, bool> _f$hidePropertiesWhileDragging = Field(
      'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
      mode: FieldMode.member);

  @override
  final MappableFields<YTNode> fields = const {
    #ytUrl: _f$ytUrl,
    #startAtSecs: _f$startAtSecs,
    #endAtSecs: _f$endAtSecs,
    #iframeWidth: _f$iframeWidth,
    #iframeHeight: _f$iframeHeight,
    #uid: _f$uid,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
  };

  @override
  final String discriminatorKey = 'cl';
  @override
  final dynamic discriminatorValue = 'YTNode';
  @override
  late final ClassMapperBase superMapper = CLMapper.ensureInitialized();

  static YTNode _instantiate(DecodingData data) {
    return YTNode(
        ytUrl: data.dec(_f$ytUrl),
        startAtSecs: data.dec(_f$startAtSecs),
        endAtSecs: data.dec(_f$endAtSecs),
        iframeWidth: data.dec(_f$iframeWidth),
        iframeHeight: data.dec(_f$iframeHeight));
  }

  @override
  final Function instantiate = _instantiate;

  static YTNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<YTNode>(map);
  }

  static YTNode fromJson(String json) {
    return ensureInitialized().decodeJson<YTNode>(json);
  }
}

mixin YTNodeMappable {
  String toJson() {
    return YTNodeMapper.ensureInitialized().encodeJson<YTNode>(this as YTNode);
  }

  Map<String, dynamic> toMap() {
    return YTNodeMapper.ensureInitialized().encodeMap<YTNode>(this as YTNode);
  }

  YTNodeCopyWith<YTNode, YTNode, YTNode> get copyWith =>
      _YTNodeCopyWithImpl(this as YTNode, $identity, $identity);
  @override
  String toString() {
    return YTNodeMapper.ensureInitialized().stringifyValue(this as YTNode);
  }

  @override
  bool operator ==(Object other) {
    return YTNodeMapper.ensureInitialized().equalsValue(this as YTNode, other);
  }

  @override
  int get hashCode {
    return YTNodeMapper.ensureInitialized().hashValue(this as YTNode);
  }
}

extension YTNodeValueCopy<$R, $Out> on ObjectCopyWith<$R, YTNode, $Out> {
  YTNodeCopyWith<$R, YTNode, $Out> get $asYTNode =>
      $base.as((v, t, t2) => _YTNodeCopyWithImpl(v, t, t2));
}

abstract class YTNodeCopyWith<$R, $In extends YTNode, $Out>
    implements CLCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {String? ytUrl,
      int? startAtSecs,
      int? endAtSecs,
      double? iframeWidth,
      double? iframeHeight});
  YTNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _YTNodeCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, YTNode, $Out>
    implements YTNodeCopyWith<$R, YTNode, $Out> {
  _YTNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<YTNode> $mapper = YTNodeMapper.ensureInitialized();
  @override
  $R call(
          {Object? ytUrl = $none,
          Object? startAtSecs = $none,
          Object? endAtSecs = $none,
          double? iframeWidth,
          double? iframeHeight}) =>
      $apply(FieldCopyWithData({
        if (ytUrl != $none) #ytUrl: ytUrl,
        if (startAtSecs != $none) #startAtSecs: startAtSecs,
        if (endAtSecs != $none) #endAtSecs: endAtSecs,
        if (iframeWidth != null) #iframeWidth: iframeWidth,
        if (iframeHeight != null) #iframeHeight: iframeHeight
      }));
  @override
  YTNode $make(CopyWithData data) => YTNode(
      ytUrl: data.get(#ytUrl, or: $value.ytUrl),
      startAtSecs: data.get(#startAtSecs, or: $value.startAtSecs),
      endAtSecs: data.get(#endAtSecs, or: $value.endAtSecs),
      iframeWidth: data.get(#iframeWidth, or: $value.iframeWidth),
      iframeHeight: data.get(#iframeHeight, or: $value.iframeHeight));

  @override
  YTNodeCopyWith<$R2, YTNode, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _YTNodeCopyWithImpl($value, $cast, t);
}
