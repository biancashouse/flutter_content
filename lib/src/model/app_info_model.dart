import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter_content/flutter_content.dart';

part 'app_info_model.mapper.dart';

@MappableClass()
class AppInfoModel with AppInfoModelMappable {
  bool autoPublishDefault;
  STreeNode? clipboard;
  List<SnippetName> snippetNames;

  AppInfoModel({
    this.clipboard,
    this.autoPublishDefault = false,
    this.snippetNames = const [],
  });
}
