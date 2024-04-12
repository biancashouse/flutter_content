import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/snode.dart';

part 'app_info_model.mapper.dart';

@MappableClass()
class AppInfoModel with AppInfoModelMappable {
  Map<SnippetName, VersionId> publishedVersionIds;
  Map<SnippetName, VersionId> editingVersionIds;
  Map<SnippetName, List<VersionId>> versionIds;
  STreeNode? clipboard;
  AppInfoModel({
    this.publishedVersionIds = const {},
    this.editingVersionIds = const {},
    this.versionIds = const {},
    this.clipboard,
  });

  factory AppInfoModel.fromFB(JsonMap data) => AppInfoModelMapper.fromMap(data);
}
