import 'dart:async';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'snippet_info_model.mapper.dart';

@MappableClass()
class SnippetInfoModel with SnippetInfoModelMappable {
  final SnippetName name; // snippet name == route name if starts with a /
  // a snippet will have multiple versions (not stored in this collection)
  List<VersionId> versionIds = [];

  // the version used when signed in
  VersionId editingVersionId;

  // the version used when not signed in
  VersionId publishedVersionId;

  // whether to automatically publish the latest version when editing
  bool? autoPublish;

  // a snippet can be completely hidden from users who are not signed in
  bool? hide;

  // whenever a version is read from Firestore, we cache it
  final Map<VersionId, SnippetRootNode?> _cachedVersions = {};

  bool changesPending(String? latestJson) {
    if (latestJson == null || latestJson.isEmpty) return false;
    if (_originalEditingJson == null) return false;
    return latestJson != _originalEditingJson;
  }

  // original editing version used to detect changes
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? _originalEditingJson;

  // whenever snippet gets updated, the new json copied here
  // used by changesPending
  @JsonKey(includeFromJson: false, includeToJson: false)
  final _jsonValueNotifier = ValueNotifier<String>('');

  ValueNotifier<String> getChangeNotifier() => _jsonValueNotifier;

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

  SnippetInfoModel(this.name, {
    required this.editingVersionId,
    required this.publishedVersionId,
    this.autoPublish,
    this.hide = false,
    // this.routePath,
    this.versionIds = const [],
  }) {
    autoPublish ??= fco.appInfo.autoPublishDefault;
  }

  // bool get isAPageSnippet => name.startsWith("/");

  VersionId? currentVersionId() =>
      fco.canEditContent() ? editingVersionId : publishedVersionId;

  Future<SnippetRootNode?> currentVersionFromCacheOrFB() async {
    SnippetRootNode? rootNode;
    VersionId? versionId = currentVersionId();
    if (versionId != null) {
      // pull version from cachedVersions[] or from FB
      rootNode = _cachedVersions[versionId] ??= await fco.modelRepo
          .loadVersionFromFBIntoCache(snippetInfo: this, versionId: versionId);
    }
    return rootNode?..validateTree();
  }

  SnippetRootNode? currentVersionInCache() =>
      _cachedVersions[currentVersionId()];

  // called whenever a version is read from Firestore
  // or is created
  void cacheVersion(VersionId versionId, SnippetRootNode rootNode) {
    _cachedVersions[versionId] = rootNode;
    // so we can determine whether any changes are pending
    _originalEditingJson = rootNode.toJson();
  }

  SnippetRootNode? cachedVersion(VersionId versionId) =>
      _cachedVersions[versionId];

  void removeVersionFromCache(VersionId versionId) {
    _cachedVersions.remove(versionId);
  }

  //)
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

  static VersionId createNewVersion(SnippetRootNode snippet) {
    // may require a new SnippetInfo
    fco.modelRepo.ensureSnippetInfoCached(snippetName: snippet.name);
    SnippetInfoModel? snippetInfo = fco.appInfo.cachedSnippetInfo(snippet.name);

    if (snippetInfo != null) {
      // remove all subsequent versions following the current version
      // before saving new version
      List<VersionId> newIdCache = [];
      List<VersionId> tbd = [];
      for (VersionId v in snippetInfo.versionIds ?? []) {
        try {
          if (int.parse(v.isEmpty ? "0" : v) >
              int.parse(snippetInfo.currentVersionId() ?? "-1")) {
            tbd.add(v);
          } else {
            newIdCache.add(v);
          }
        } catch (e) {
          fco.logger.e('$e');
        }
      }
      if (tbd.isNotEmpty) {
        // delete from FB and also from cache
        for (VersionId vId in tbd) {
          snippetInfo.versionIds?.remove(vId);
          snippetInfo._cachedVersions.remove(vId);
        }
      }
    }

    VersionId newVersionId = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();

    // update FB appInfo
    // jsArray issue
    // List<String> newList = appInfo.snippetNames;
    if (!fco.appInfo.snippetNames.contains(snippet.name)) {
      fco.appInfo.snippetNames = [...fco.appInfo.snippetNames, snippet.name];
      AppInfoModel.needToSave = true;
    }
    snippetInfo ??= ensureSnippetInfoPresent(
      snippetName: snippet.name,
      firstSnippetVersion: SnippetRootNode(
        name: snippet.name,
        child: PlaceholderNode(),
      ),
    );

    snippetInfo.editingVersionId = newVersionId;
    if (snippetInfo.autoPublish ?? fco.appInfo.autoPublishDefault) {
      snippetInfo.publishedVersionId = newVersionId;
    }

    (snippetInfo.versionIds ??= []).add(newVersionId);
    snippetInfo.cacheVersion(newVersionId, snippet);
    return newVersionId;
  }

  //
  static SnippetInfoModel ensureSnippetInfoPresent({
    required String snippetName,
    required SnippetRootNode firstSnippetVersion,
  }) {
    SnippetInfoModel? snippetInfo = fco.appInfo.cachedSnippetInfo(snippetName);
    // only uses firstVersion if snippet does not already exist
    if (snippetInfo == null) {
      // create a first version of the content, then it's snippetInfo
      VersionId firstVersionId = DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();

      final newSnippetInfo = SnippetInfoModel(
        snippetName,
        editingVersionId: firstVersionId,
        publishedVersionId: firstVersionId,
        autoPublish: fco.appInfo.autoPublishDefault,
        versionIds: [firstVersionId],
      );
      // cache SnippetINFO
      fco.appInfo.cacheSnippetInfo(snippetName, newSnippetInfo);
      // cache snippet root node (initial version)
      newSnippetInfo.cacheVersion(firstVersionId, firstSnippetVersion);
      return newSnippetInfo;
    }
    return snippetInfo;
  }
}