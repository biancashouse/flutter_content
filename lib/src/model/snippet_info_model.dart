import 'dart:async';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'snippet_info_model.mapper.dart';

@MappableClass()
class SnippetInfoModel with SnippetInfoModelMappable {
  final SnippetName name; // snippet name == route name
  final RoutePath? routePath; // route path
  VersionId editingVersionId;
  VersionId publishedVersionId;
  bool? autoPublish;

  // not final and nullable, because previous model did not contain the list of versionIds
  List<VersionId>? versionIds;

  static final Map<SnippetName, SnippetInfoModel> _snippetInfoCache = {};

  static SnippetInfoModel? cachedSnippetInfo(String snippetName) {
    return _snippetInfoCache[snippetName];
  }

  static void cacheSnippetInfo(String snippetName, SnippetInfoModel sni) {
    // _snippetInfoCache[snippetName.startsWith('/') ? snippetName.substring(1) : snippetName] = sni;
    _snippetInfoCache[snippetName] = sni;
  }

  static List<String> cachedSnippetNames() => _snippetInfoCache.keys.toList();

  static void removeFromCache(String snippetName) => _snippetInfoCache.remove(snippetName);

  // static void debug() {
  //   var snippetInfoCache = SnippetInfoModel._snippetInfoCache;
  //   for (SnippetName name in snippetInfoCache.keys) {
  //     List<VersionId> versionIds = snippetInfoCache[name]?.versionIds ?? [];
  //     // fco.logger.d('$name: ${versionIds.toString()}');
  //     for (VersionId versionId in versionIds) {
  //       SnippetRootNode? rootNode = snippetInfoCache[name]?.cachedVersions[versionId];
  //       // fco.logger.d('$versionId: ${rootNode?.child.toString()}');
  //     }
  //     // fco.logger.d('$name: ${versionIds.toString()}');
  //   }
  // }

  @JsonKey(includeFromJson: false, includeToJson: false)
  Map<VersionId, SnippetRootNode?> cachedVersions = {};

  SnippetInfoModel(
    this.name, {
    required this.editingVersionId,
    required this.publishedVersionId,
    this.autoPublish,
    this.routePath,
    this.versionIds = const [],
  }) {
    autoPublish ??= fco.appInfo.autoPublishDefault;
  }

  bool get isAPageSnippet => routePath != null;

  VersionId? currentVersionId() => fco.canEditContent() ? editingVersionId : publishedVersionId;

  Future<SnippetRootNode?> currentVersionFromCacheOrFB() async {
    SnippetRootNode? rootNode;
    VersionId? versionId = currentVersionId();
    if (versionId != null) {
      // pull version from cachedVersions[] or from FB
      rootNode = cachedVersions[versionId] ??= await fco.modelRepo.loadVersionFromFBIntoCache(snippetInfo: this, versionId: versionId);
    }
    return rootNode?..validateTree();
  }

  SnippetRootNode? currentVersionFromCache() => cachedVersions[currentVersionId()];

  VersionId? previousVersionId() {
    List<VersionId> ids = versionIds ?? [];
    int i = ids.indexOf(editingVersionId);
    return i == 0 ? null : ids[i - 1];
  }

  VersionId? nextVersionId() {
    List<VersionId> ids = versionIds ?? [];
    int i = ids.indexOf(editingVersionId);
    return i == ids.length - 1 ? null : ids[i + 1];
  }

  VersionId? earliestVersionId() => versionIds?.first;

  VersionId? latestVersionId() => versionIds?.last;

  bool isFirstVersion() => editingVersionId == earliestVersionId();

  bool isLatestVersion() => editingVersionId == latestVersionId();
}
