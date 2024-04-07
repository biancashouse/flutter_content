import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter_content/flutter_content.dart';

part 'snippet_map_model.mapper.dart';

@MappableClass()
class SnippetMapModel with SnippetMapModelMappable {
  SnippetMap snippets;
  SnippetMapModel(
    this.snippets,
  );
}
