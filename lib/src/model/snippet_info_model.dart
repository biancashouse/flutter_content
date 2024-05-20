import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter_content/flutter_content.dart';

part 'snippet_info_model.mapper.dart';

@MappableClass()
class SnippetInfoModel with SnippetInfoModelMappable {
  SnippetName name; // snippet name == route name
  String? pagePath;
  VersionId? editingVersionId;
  VersionId? publishedVersionId;
  bool? autoPublish;

  SnippetInfoModel(this.name, {this.editingVersionId, this.publishedVersionId, this.autoPublish, this.pagePath});

  bool get isAPageSnippet => pagePath != null;

  VersionId? get currentVersionId => FC().canEditContent ? editingVersionId : publishedVersionId;
}
