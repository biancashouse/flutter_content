import 'dart:async';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'snippet_info_model.mapper.dart';

@MappableClass()
class SnippetInfoModel with SnippetInfoModelMappable {
  SnippetName name; // snippet name == route name
  RoutePath? routePath; // route path
  VersionId editingVersionId;
  VersionId publishedVersionId;
  bool? autoPublish;

  static Map<SnippetName, SnippetInfoModel> snippetInfoCache = {};

  static void debug() {
    var snippetInfoCache = SnippetInfoModel.snippetInfoCache;
    for (SnippetName name in snippetInfoCache.keys) {
      List<VersionId> versionIds = snippetInfoCache[name]?.cachedVersionIds ?? [];
      debugPrint('$name: ${versionIds.toString()}');
      for (VersionId versionId in versionIds) {
        SnippetRootNode? rootNode = snippetInfoCache[name]?.cachedVersions[versionId];
        debugPrint('$versionId: ${rootNode?.child.toString()}');
      }
      debugPrint('$name: ${versionIds.toString()}');
    }
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  List<VersionId> cachedVersionIds = [];
  @JsonKey(includeFromJson: false, includeToJson: false)
  Map<VersionId, SnippetRootNode?> cachedVersions = {};


  SnippetInfoModel(this.name,
      {required this.editingVersionId,
      required this.publishedVersionId,
      this.autoPublish,
      this.routePath});

  bool get isAPageSnippet => routePath != null;

  VersionId? currentVersionId() =>
      fco.canEditContent.value ? editingVersionId : publishedVersionId;

  Future<SnippetRootNode?> currentVersionFromCacheOrFB() async {
    SnippetRootNode? rootNode;
    VersionId? versionId = currentVersionId();
    if (versionId != null) {
      // pull version from cachedVersions[] or from FB
      rootNode = cachedVersions[versionId];
      if (rootNode == null) {
        return await fco.modelRepo.loadVersionFromFBIntoCache(
          snippetInfo: this,
          versionId: versionId,
        );
      }
    }
    return rootNode;
  }

  SnippetRootNode? currentVersionFromCache() =>
      cachedVersions[currentVersionId()];

  List<VersionId> versionIds() => cachedVersionIds;

  VersionId? previousVersionId() {
    List<VersionId> ids = versionIds();
    int i = ids.indexOf(editingVersionId);
    return i == 0 ? null : ids[i - 1];
  }

  VersionId? nextVersionId() {
    List<VersionId> ids = versionIds();
    int i = ids.indexOf(editingVersionId);
    return i == ids.length - 1 ? null : ids[i + 1];
  }

  VersionId? earliestVersionId() => versionIds().first;

  VersionId? latestVersionId() => versionIds().last;

  bool isFirstVersion() => editingVersionId == earliestVersionId();

  bool isLatestVersion() => editingVersionId == latestVersionId();
}
