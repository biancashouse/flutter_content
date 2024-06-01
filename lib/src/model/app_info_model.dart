import 'dart:collection';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter_content/flutter_content.dart';

part 'app_info_model.mapper.dart';

@MappableClass()
class AppInfoModel with AppInfoModelMappable {
  bool autoPublishDefault;
  STreeNode? clipboard;
  List<SnippetName> snippetNames; // a snippet may be a Page snippet; i.e. also has a Route Path property

  AppInfoModel({
    this.clipboard,
    this.autoPublishDefault = false,
    this.snippetNames = const [],
  });
}

/// we don't persist this linked list
final class VersionEntryItem extends LinkedListEntry<VersionEntryItem> {
  final VersionId versionId;
  VersionEntryItem(this.versionId);

  @override
  String toString() {
    return versionId;
  }
}
