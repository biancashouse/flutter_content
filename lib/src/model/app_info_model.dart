import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter_content/flutter_content.dart';

part 'app_info_model.mapper.dart';

@MappableClass()
class AppInfoModel with AppInfoModelMappable {
  VersionId? publishedVersionId;

  VersionId? editingVersionId;
  List<VersionId> versionIds;
  EncodedJson? clipboard;
  AppInfoModel({
    this.publishedVersionId,
    this.editingVersionId,
    this.versionIds = const [],
    this.clipboard,
  });
}
