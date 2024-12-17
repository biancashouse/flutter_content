// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'file_node.dart';

class FileNodeMapper extends SubClassMapperBase<FileNode> {
  FileNodeMapper._();

  static FileNodeMapper? _instance;
  static FileNodeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FileNodeMapper._());
      CLMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'FileNode';

  static String _$name(FileNode v) => v.name;
  static const Field<FileNode, String> _f$name = Field('name', _$name);
  static String _$src(FileNode v) => v.src;
  static const Field<FileNode, String> _f$src = Field('src', _$src);
  static String _$uid(FileNode v) => v.uid;
  static const Field<FileNode, String> _f$uid =
      Field('uid', _$uid, mode: FieldMode.member);
  static bool _$isExpanded(FileNode v) => v.isExpanded;
  static const Field<FileNode, bool> _f$isExpanded =
      Field('isExpanded', _$isExpanded, mode: FieldMode.member);
  static bool? _$hidePropertiesWhileDragging(FileNode v) =>
      v.hidePropertiesWhileDragging;
  static const Field<FileNode, bool> _f$hidePropertiesWhileDragging = Field(
      'hidePropertiesWhileDragging', _$hidePropertiesWhileDragging,
      mode: FieldMode.member);
  static GlobalKey<State<StatefulWidget>>? _$nodeWidgetGK(FileNode v) =>
      v.nodeWidgetGK;
  static const Field<FileNode, GlobalKey<State<StatefulWidget>>>
      _f$nodeWidgetGK =
      Field('nodeWidgetGK', _$nodeWidgetGK, mode: FieldMode.member);

  @override
  final MappableFields<FileNode> fields = const {
    #name: _f$name,
    #src: _f$src,
    #uid: _f$uid,
    #isExpanded: _f$isExpanded,
    #hidePropertiesWhileDragging: _f$hidePropertiesWhileDragging,
    #nodeWidgetGK: _f$nodeWidgetGK,
  };

  @override
  final String discriminatorKey = 'cl';
  @override
  final dynamic discriminatorValue = 'FileNode';
  @override
  late final ClassMapperBase superMapper = CLMapper.ensureInitialized();

  static FileNode _instantiate(DecodingData data) {
    return FileNode(name: data.dec(_f$name), src: data.dec(_f$src));
  }

  @override
  final Function instantiate = _instantiate;

  static FileNode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FileNode>(map);
  }

  static FileNode fromJson(String json) {
    return ensureInitialized().decodeJson<FileNode>(json);
  }
}

mixin FileNodeMappable {
  String toJson() {
    return FileNodeMapper.ensureInitialized()
        .encodeJson<FileNode>(this as FileNode);
  }

  Map<String, dynamic> toMap() {
    return FileNodeMapper.ensureInitialized()
        .encodeMap<FileNode>(this as FileNode);
  }

  FileNodeCopyWith<FileNode, FileNode, FileNode> get copyWith =>
      _FileNodeCopyWithImpl(this as FileNode, $identity, $identity);
  @override
  String toString() {
    return FileNodeMapper.ensureInitialized().stringifyValue(this as FileNode);
  }

  @override
  bool operator ==(Object other) {
    return FileNodeMapper.ensureInitialized()
        .equalsValue(this as FileNode, other);
  }

  @override
  int get hashCode {
    return FileNodeMapper.ensureInitialized().hashValue(this as FileNode);
  }
}

extension FileNodeValueCopy<$R, $Out> on ObjectCopyWith<$R, FileNode, $Out> {
  FileNodeCopyWith<$R, FileNode, $Out> get $asFileNode =>
      $base.as((v, t, t2) => _FileNodeCopyWithImpl(v, t, t2));
}

abstract class FileNodeCopyWith<$R, $In extends FileNode, $Out>
    implements CLCopyWith<$R, $In, $Out> {
  @override
  $R call({String? name, String? src});
  FileNodeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _FileNodeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FileNode, $Out>
    implements FileNodeCopyWith<$R, FileNode, $Out> {
  _FileNodeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FileNode> $mapper =
      FileNodeMapper.ensureInitialized();
  @override
  $R call({String? name, String? src}) => $apply(FieldCopyWithData(
      {if (name != null) #name: name, if (src != null) #src: src}));
  @override
  FileNode $make(CopyWithData data) => FileNode(
      name: data.get(#name, or: $value.name),
      src: data.get(#src, or: $value.src));

  @override
  FileNodeCopyWith<$R2, FileNode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _FileNodeCopyWithImpl($value, $cast, t);
}
