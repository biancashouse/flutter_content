import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter_content/flutter_content.dart';

part 'snippet_info_model.mapper.dart';

@MappableClass()
class SnippetInfoModel with SnippetInfoModelMappable {
  SnippetName name; // snippet name == route name
  RoutePath? routePath; // route path
  VersionId? editingVersionId;
  VersionId? publishedVersionId;
  bool? autoPublish;

  SnippetInfoModel(this.name, {this.editingVersionId, this.publishedVersionId, this.autoPublish, this.routePath});

  bool get isAPageSnippet => routePath != null;

  VersionId? get currentVersionId => FContent().canEditContent ? editingVersionId : publishedVersionId;
}
