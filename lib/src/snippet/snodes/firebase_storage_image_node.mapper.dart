// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'firebase_storage_image_node.dart';

class FirebaseStorageImageNodeMapper
    extends SubClassMapperBase<FirebaseStorageImageNode> {
  FirebaseStorageImageNodeMapper._();

  static FirebaseStorageImageNodeMapper? _instance;
  static FirebaseStorageImageNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = FirebaseStorageImageNodeMapper._());
      CLMapper.ensureInitialized().addSubMapper(_instance!);
      BoxFitEnumMapper.ensureInitialized();
      AlignmentEnumMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'FirebaseStorageImageNode';

  static String _$name(FirebaseStorageImageNode v) => v.name;
  static const Field<FirebaseStorageImageNode, String> _f$name =
      Field('name', _$name, opt: true, def: '');
  static String _$fsUrl(FirebaseStorageImageNode v) => v.fsUrl;
  static const Field<FirebaseStorageImageNode, String> _f$fsUrl = Field(
      'fsUrl', _$fsUrl,
      opt: true,
      def: 'gs://flutter-content-2dc30.appspot.com/missing-image.PNG');
  static BoxFitEnum? _$fit(FirebaseStorageImageNode v) => v.fit;
  static const Field<FirebaseStorageImageNode, BoxFitEnum> _f$fit =
      Field('fit', _$fit, opt: true);
  static AlignmentEnum? _$alignment(FirebaseStorageImageNode v) => v.alignment;
  static const Field<FirebaseStorageImageNode, AlignmentEnum> _f$alignment =
      Field('alignment', _$alignment, opt: true);
  static double? _$width(FirebaseStorageImageNode v) => v.width;
  static const Field<FirebaseStorageImageNode, double> _f$width =
      Field('width', _$width, opt: true);
  static double? _$height(FirebaseStorageImageNode v) => v.height;
  static const Field<FirebaseStorageImageNode, double> _f$height =
      Field('height', _$height, opt: true);
  static bool _$isExpanded(FirebaseStorageImageNode v) => v.isExpanded;
  static const Field<FirebaseStorageImageNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(FirebaseStorageImageNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<FirebaseStorageImageNode, bool>
      _f$hidePropertiesWhileDragging = Field(
          'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
          mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(
          FirebaseStorageImageNode v) =>
      v.nodeWidgetGK;
  static const Field<FirebaseStorageImageNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<FirebaseStorageImageNode> fields = const {
    #name: _f$name,
    #fsUrl: _f$fsUrl,
    #fit: _f$fit,
    #alignment: _f$alignment,
    #width: _f$width,
    #height: _f$height,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'cl';
  @override
  final dynamic discriminatorValue = 'FirebaseStorageImageNode';
  @override
  late final ClassMapperBase superMapper = CLMapper.ensureInitialized();

  static FirebaseStorageImageNode _instantiate(DecodingData data) {
    return FirebaseStorageImageNode(
        name: data.dec(_f$name),
        fsUrl: data.dec(_f$fsUrl),
        fit: data.dec(_f$fit),
        alignment: data.dec(_f$alignment),
        width: data.dec(_f$width),
        height: data.dec(_f$height));
  }

  @override
  final Function instantiate = _instantiate;

  static FirebaseStorageImageNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FirebaseStorageImageNode>(map);
  }

  static FirebaseStorageImageNode fromJson(String json) {
    return ensureInitialized().decodeJson<FirebaseStorageImageNode>(json);
  }
}

mixin FirebaseStorageImageNodeMappable {
  String toJson() {
    return FirebaseStorageImageNodeMapper.ensureInitialized()
        .encodeJson<FirebaseStorageImageNode>(this as FirebaseStorageImageNode);
  }

  Map<String, dynamic> toMap() {
    return FirebaseStorageImageNodeMapper.ensureInitialized()
        .encodeMap<FirebaseStorageImageNode>(this as FirebaseStorageImageNode);
  }

  FirebaseStorageImageNodeCopyWith<FirebaseStorageImageNode,
          FirebaseStorageImageNode, FirebaseStorageImageNode>
      get copyWith => _FirebaseStorageImageNodeCopyWithImpl(
          this as FirebaseStorageImageNode, $identity, $identity);
  @override
  String toString() {
    return FirebaseStorageImageNodeMapper.ensureInitialized()
        .stringifyValue(this as FirebaseStorageImageNode);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            FirebaseStorageImageNodeMapper.ensureInitialized()
                .isValueEqual(this as FirebaseStorageImageNode, other));
  }

  @override
  int get hashCode {
    return FirebaseStorageImageNodeMapper.ensureInitialized()
        .hashValue(this as FirebaseStorageImageNode);
  }
}

extension FirebaseStorageImageNodeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FirebaseStorageImageNode, $Out> {
  FirebaseStorageImageNodeCopyWith<$R, FirebaseStorageImageNode, $Out>
      get $asFirebaseStorageImageNode => $base
          .as((v, t, t2) => _FirebaseStorageImageNodeCopyWithImpl(v, t, t2));
}

abstract class FirebaseStorageImageNodeCopyWith<
    $R,
    $In extends FirebaseStorageImageNode,
    $Out> implements CLCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {String? name,
      String? fsUrl,
      BoxFitEnum? fit,
      AlignmentEnum? alignment,
      double? width,
      double? height});
  FirebaseStorageImageNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _FirebaseStorageImageNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FirebaseStorageImageNode, $Out>
    implements
        FirebaseStorageImageNodeCopyWith<$R, FirebaseStorageImageNode, $Out> {
  _FirebaseStorageImageNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FirebaseStorageImageNode> $mapper =
      FirebaseStorageImageNodeMapper.ensureInitialized();
  @override
  $R call(
          {String? name,
          String? fsUrl,
          Object? fit = $none,
          Object? alignment = $none,
          Object? width = $none,
          Object? height = $none}) =>
      $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (fsUrl != null) #fsUrl: fsUrl,
        if (fit != $none) #fit: fit,
        if (alignment != $none) #alignment: alignment,
        if (width != $none) #width: width,
        if (height != $none) #height: height
      }));
  @override
  FirebaseStorageImageNode $make(CopyWithData data) => FirebaseStorageImageNode(
      name: data.get(#name, or: $value.name),
      fsUrl: data.get(#fsUrl, or: $value.fsUrl),
      fit: data.get(#fit, or: $value.fit),
      alignment: data.get(#alignment, or: $value.alignment),
      width: data.get(#width, or: $value.width),
      height: data.get(#height, or: $value.height));

  @override
  FirebaseStorageImageNodeCopyWith<$R2, FirebaseStorageImageNode, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _FirebaseStorageImageNodeCopyWithImpl($value, $cast, t);
}
