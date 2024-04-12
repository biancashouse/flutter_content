import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter_content/flutter_content.dart';

part 'snippet_model.mapper.dart';

@MappableClass()
class SnippetModel with SnippetModelMappable {
  Map<VersionId, SnippetRootNode> versionMap;
  SnippetModel(this.versionMap);
}
