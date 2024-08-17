import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:gap/gap.dart';

part 'snippet_root_node.mapper.dart';

class SnippetRootNodeHook extends MappingHook {
  const SnippetRootNodeHook();

  @override
  Object? beforeDecode(Object? value) {
    fco.logi('before');
    return value;
  }

  @override
  Object? afterDecode(Object? value) {
    fco.logi('after');
    return value;
  }

}
@MappableClass(hook: SnippetRootNodeHook()) //discriminatorKey: 'sr', includeSubClasses: [TitleSnippetRootNode, SubtitleSnippetRootNode, ContentSnippetRootNode])
class SnippetRootNode extends SC with SnippetRootNodeMappable {
  SnippetName name;
  RoutePath? routePath;
  // bool isEmbedded;
  String tags;

  SnippetRootNode({
    required this.name,
    this.routePath,
    // this.isEmbedded = false,
    this.tags = '',
    super.child,
  });

  @override
  List<PTreeNode> properties(BuildContext context) => [
        StringPropertyValueNode(
          snode: this,
          name: 'Snippet Name',
          stringValue: name,
          onStringChange: (newValue) => refreshWithUpdate(() => name = newValue??''),
          calloutButtonSize: const Size(280, 70),
          calloutWidth: 280,
        ),
        PropertyGroup(
          snode: this,
          name: 'Page Snippet...',
          children: [
            StringPropertyValueNode(
              snode: this,
              name: 'Snippet Name',
              stringValue: name,
              onStringChange: (newValue) => refreshWithUpdate(() => name = newValue??''),
              calloutButtonSize: const Size(280, 70),
              calloutWidth: 280,
            ),
            StringPropertyValueNode(
              snode: this,
              name: 'Route Path',
              stringValue: routePath,
              onStringChange: (newValue) => refreshWithUpdate(() => routePath = newValue),
              calloutButtonSize: const Size(280, 70),
              calloutWidth: 280,
            ),
          ],
        ),
        // BoolPropertyValueNode(
        //   snode: this,
        //   name: 'isEmbedded',
        //   boolValue: isEmbedded,
        //   onBoolChange: (newValue) => refreshWithUpdate(() => isEmbedded = newValue ?? false),
        // ),
        StringPropertyValueNode(
          snode: this,
          name: 'tags',
          stringValue: tags.toString(),
          onStringChange: (newValue) {
            refreshWithUpdate(() => tags = newValue??'');
          },
          calloutButtonSize: const Size(280, 70),
          calloutWidth: 280,
        ),
      ];
  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    fco.logi("SnippetRootNode.toWidget()...");
    if (findDescendant(SnippetRootNode) != null) {}
    setParent(parentNode);
    return FutureBuilder<void>(
        future: SnippetRootNode.loadSnippetFromCacheOrFromFBOrCreateFromTemplate(snippetName: name),
        builder: (futureContext, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            fco.logi("FutureBuilder<void> Ensuring $name present");
            try {
              // in case did a revert, ignore snapshot data and use the AppInfo instead
              SnippetRootNode? snippet = fco.currentSnippetVersion(name);
              // SnippetRootNode? snippetRoot = cache?[editingVersionId];
              return snippet == null ? fco.errorIcon(Colors.red) : snippet.child?.toWidget(futureContext, this) ?? const Placeholder();
            } catch (e) {
              fco.logi('snippetRootNode.toWidget() failed!');
              return Material(
                textStyle: const TextStyle(fontFamily: 'monospace', fontSize: 12),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      fco.errorIcon(Colors.red),
                      Gap(10),
                      fco.coloredText(e.toString()),
                    ],
                  ),
                ),
              );
            }
          } else {
            return const CircularProgressIndicator();
          }
        });
  }

  // if root already exists, return it.
  // If not, and a template name supplied, create a named copy of that template.
  // If not, just create a snippet that comprises a PlaceholderNode.
  static Future<void> loadSnippetFromCacheOrFromFBOrCreateFromTemplate({
    SnippetRootNode? snippetRootNode,
    required SnippetName snippetName,
  }) async {
    AppInfoModel appInfo = fco.appInfo;

    // if not yet in AppInfo, must be a BRAND NEW snippet
    if (!appInfo.snippetNames.contains(snippetName) && snippetRootNode != null) {
      await fco.cacheAndSaveANewSnippetVersion(
        snippetName: snippetName,
        rootNode: snippetRootNode,
        publish: true,
      );
      return;
    }

    // snippet was definitely previously created (because snippetName present in appInfo)
    // may already have a read in progress (app may start with >1 builds!
    // if (fco.snippetsBeingReadFromFB.contains(snippetName)) return;

    SnippetInfoModel? snippetInfo = await fco.modelRepo.getSnippetInfoFromCacheOrFB(snippetName: snippetName);
    if (snippetInfo != null) {
      VersionId? currentVersionId = snippetInfo.currentVersionId;
      // may already be in snippet cache
      SnippetRootNode? rootNode = fco.currentSnippetVersion(snippetName);
      //
      if (rootNode == null && currentVersionId != null) {
        // snippet version was not already in cache
        await fco.modelRepo.possiblyLoadSnippetIntoCache(
              snippetName: snippetName,
              versionId: currentVersionId,
            );
      }
    }
  }

  // static Future<void> ensureSnippetInCache({
  //   required SnippetName snippetName,
  //   SnippetTemplate fromTemplate = SnippetTemplate.empty_snippet,
  // }) async {
  //   // var appInfo = FCO.appInfoAsMap;
  //   VersionId? editingOrPublishedVersionId = FCO.canEditContent
  //       ? FCO.snippetCache[snippetName]?.editingVersionId
  //       : FCO.snippetCache[snippetName]?.publishedVersionId;
  //   if (editingOrPublishedVersionId != null) {
  //     // exists in AppInfo, so make sure it has been fetched from FB
  //     await FCO.modelRepo.possiblyLoadSnippetIntoCache(
  //         snippetName: snippetName, versionId: editingOrPublishedVersionId);
  //     var rootNode = FCO.snippetCache[snippetName]?.versions?[editingOrPublishedVersionId];
  //     fco.logi('ensured snippet: ${rootNode?.name} ensured present.');
  //   } else {
  //     // snippet does not yet exist in FB
  //     SnippetRootNode rootNode = SnippetPanel.createSnippetFromTemplate(fromTemplate, snippetName);
  //     FCO.possiblyCacheAndSaveNewSnippetVersion(snippetName: snippetName, rootNode: rootNode);
  //   }
  //   // // finally ensure any descendant snippet ref nodes are also loaded
  //   // List<STreeNode> descSnippets = rootNode?.findDescendantsOfType(SnippetRefNode) ?? [];
  //   // await Future.forEach<STreeNode>(descSnippets, (snippetRefNode) async {
  //   //   await SnippetPanelState.ensureSnippetInCache(snippetName: (snippetRefNode as SnippetRefNode).snippetName);
  //   // });
  // }

  @override
  String toSource(BuildContext context) {
    return child?.toSource(context) ?? 'Icon(Icons.warning, color: Colors.red, size: 24,)';
  }

  @override
  /// optional clone name, witha default
  SnippetRootNode clone({String? cloneName}) {
    SnippetRootNode copiedNode = super.clone() as SnippetRootNode;
    copiedNode..name = (cloneName??'$name-copy')..nodeWidgetGK = GlobalKey();
    return copiedNode;
  }

  @override
  String toString() => FLUTTER_TYPE;

  @override
  Widget? logoSrc() => null;

  static const String FLUTTER_TYPE = "Snippet";
}
