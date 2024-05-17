import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter_content/flutter_content.dart';

part 'snippet_info_model.mapper.dart';

@MappableClass()
class SnippetInfoModel with SnippetInfoModelMappable {
  VersionId? editingVersionId;
  VersionId? publishedVersionId;
  bool? autoPublish;
  String? pagePath;

  SnippetInfoModel({this.editingVersionId, this.publishedVersionId, this.autoPublish, this.pagePath});

  bool get isAPageSnippet => pagePath != null;

  VersionId? get currentVersionId => FC().canEditContent ? editingVersionId : publishedVersionId;
}
