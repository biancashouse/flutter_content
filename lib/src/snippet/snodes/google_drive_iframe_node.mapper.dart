// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'google_drive_iframe_node.dart';

class GoogleDriveIFrameNodeMapper
    extends SubClassMapperBase<GoogleDriveIFrameNode> {
  GoogleDriveIFrameNodeMapper._();

  static GoogleDriveIFrameNodeMapper? _instance;
  static GoogleDriveIFrameNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GoogleDriveIFrameNodeMapper._());
      CLMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'GoogleDriveIFrameNode';

  static String _$name(GoogleDriveIFrameNode v) => v.name;
  static const Field<GoogleDriveIFrameNode, String> _f$name =
      Field('name', _$name, opt: true, def: '');
  static String _$folderId(GoogleDriveIFrameNode v) => v.folderId;
  static const Field<GoogleDriveIFrameNode, String> _f$folderId =
      Field('folderId', _$folderId, opt: true, def: '');
  static String _$resourceKey(GoogleDriveIFrameNode v) => v.resourceKey;
  static const Field<GoogleDriveIFrameNode, String> _f$resourceKey =
      Field('resourceKey', _$resourceKey, opt: true, def: '');
  static double? _$iframeWidth(GoogleDriveIFrameNode v) => v.iframeWidth;
  static const Field<GoogleDriveIFrameNode, double> _f$iframeWidth =
      Field('iframeWidth', _$iframeWidth, opt: true);
  static double? _$iframeHeight(GoogleDriveIFrameNode v) => v.iframeHeight;
  static const Field<GoogleDriveIFrameNode, double> _f$iframeHeight =
      Field('iframeHeight', _$iframeHeight, opt: true);
  static String _$uid(GoogleDriveIFrameNode v) => v.uid;
  static const Field<GoogleDriveIFrameNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$treeNodeGK(
          GoogleDriveIFrameNode v) =>
      v.treeNodeGK;
  static const Field<GoogleDriveIFrameNode, GlobalKey<State<StatefulWidget>>>
      _f$treeNodeGK = Field('treeNodeGK', _$treeNodeGK, mode: FieldMode.member);
  static bool _$isExpanded(GoogleDriveIFrameNode v) => v.isExpanded;
  static const Field<GoogleDriveIFrameNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(GoogleDriveIFrameNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<GoogleDriveIFrameNode, bool>
      _f$hidePropertiesWhileDragging = Field(
          'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
          mode: FieldMode.member);
  static Widget? _$savedWidget(GoogleDriveIFrameNode v) => v.savedWidget;
  static const Field<GoogleDriveIFrameNode, Widget> _f$savedWidget =
      Field('savedWidget', _$savedWidget, mode: FieldMode.member);

  @override
  final MappableFields<GoogleDriveIFrameNode> fields = const {
    #name: _f$name,
    #folderId: _f$folderId,
    #resourceKey: _f$resourceKey,
    #iframeWidth: _f$iframeWidth,
    #iframeHeight: _f$iframeHeight,
    #uid: _f$uid,
    #treeNodeGK: _f$treeNodeGK,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #savedWidget: _f$savedWidget,
  };

  @override
  final String discriminatorKey = 'cl';
  @override
  final dynamic discriminatorValue = 'GoogleDriveIFrameNode';
  @override
  late final ClassMapperBase superMapper = CLMapper.ensureInitialized();

  static GoogleDriveIFrameNode _instantiate(DecodingData data) {
    return GoogleDriveIFrameNode(
        name: data.dec(_f$name),
        folderId: data.dec(_f$folderId),
        resourceKey: data.dec(_f$resourceKey),
        iframeWidth: data.dec(_f$iframeWidth),
        iframeHeight: data.dec(_f$iframeHeight));
  }

  @override
  final Function instantiate = _instantiate;

  static GoogleDriveIFrameNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GoogleDriveIFrameNode>(map);
  }

  static GoogleDriveIFrameNode fromJson(String json) {
    return ensureInitialized().decodeJson<GoogleDriveIFrameNode>(json);
  }
}

mixin GoogleDriveIFrameNodeMappable {
  String toJson() {
    return GoogleDriveIFrameNodeMapper.ensureInitialized()
        .encodeJson<GoogleDriveIFrameNode>(this as GoogleDriveIFrameNode);
  }

  Map<String, dynamic> toMap() {
    return GoogleDriveIFrameNodeMapper.ensureInitialized()
        .encodeMap<GoogleDriveIFrameNode>(this as GoogleDriveIFrameNode);
  }

  GoogleDriveIFrameNodeCopyWith<GoogleDriveIFrameNode, GoogleDriveIFrameNode,
      GoogleDriveIFrameNode> get copyWith => _GoogleDriveIFrameNodeCopyWithImpl<
          GoogleDriveIFrameNode, GoogleDriveIFrameNode>(
      this as GoogleDriveIFrameNode, $identity, $identity);
  @override
  String toString() {
    return GoogleDriveIFrameNodeMapper.ensureInitialized()
        .stringifyValue(this as GoogleDriveIFrameNode);
  }

  @override
  bool operator ==(Object other) {
    return GoogleDriveIFrameNodeMapper.ensureInitialized()
        .equalsValue(this as GoogleDriveIFrameNode, other);
  }

  @override
  int get hashCode {
    return GoogleDriveIFrameNodeMapper.ensureInitialized()
        .hashValue(this as GoogleDriveIFrameNode);
  }
}

extension GoogleDriveIFrameNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GoogleDriveIFrameNode, $Out> {
  GoogleDriveIFrameNodeCopyWith<$R, GoogleDriveIFrameNode, $Out>
      get $asGoogleDriveIFrameNode => $base.as(
          (v, t, t2) => _GoogleDriveIFrameNodeCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class GoogleDriveIFrameNodeCopyWith<
    $R,
    $In extends GoogleDriveIFrameNode,
    $Out> implements CLCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {String? name,
      String? folderId,
      String? resourceKey,
      double? iframeWidth,
      double? iframeHeight});
  GoogleDriveIFrameNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _GoogleDriveIFrameNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GoogleDriveIFrameNode, $Out>
    implements GoogleDriveIFrameNodeCopyWith<$R, GoogleDriveIFrameNode, $Out> {
  _GoogleDriveIFrameNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GoogleDriveIFrameNode> $mapper =
      GoogleDriveIFrameNodeMapper.ensureInitialized();
  @override
  $R call(
          {String? name,
          String? folderId,
          String? resourceKey,
          Object? iframeWidth = $none,
          Object? iframeHeight = $none}) =>
      $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (folderId != null) #folderId: folderId,
        if (resourceKey != null) #resourceKey: resourceKey,
        if (iframeWidth != $none) #iframeWidth: iframeWidth,
        if (iframeHeight != $none) #iframeHeight: iframeHeight
      }));
  @override
  GoogleDriveIFrameNode $make(CopyWithData data) => GoogleDriveIFrameNode(
      name: data.get(#name, or: $value.name),
      folderId: data.get(#folderId, or: $value.folderId),
      resourceKey: data.get(#resourceKey, or: $value.resourceKey),
      iframeWidth: data.get(#iframeWidth, or: $value.iframeWidth),
      iframeHeight: data.get(#iframeHeight, or: $value.iframeHeight));

  @override
  GoogleDriveIFrameNodeCopyWith<$R2, GoogleDriveIFrameNode, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _GoogleDriveIFrameNodeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
