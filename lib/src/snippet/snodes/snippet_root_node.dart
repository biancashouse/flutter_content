import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/api/snippet_builder/tr_triangle_painter.dart' show TRTriangle;
import 'package:flutter_content/src/snippet/pnodes/string_pnode.dart';

part 'snippet_root_node.mapper.dart';

class SnippetRootNodeHook extends MappingHook {
  const SnippetRootNodeHook();

  @override
  Object? beforeDecode(Object? value) {
    // fco.logger.i('before');
    return value;
  }

  @override
  Object? afterDecode(Object? value) {
    // fco.logger.i('after');
    return value;
  }
}

@MappableClass(
  hook: SnippetRootNodeHook(),
) //discriminatorKey: 'sr', includeSubClasses: [TitleSnippetRootNode, SubtitleSnippetRootNode, ContentSnippetRootNode])
class SnippetRootNode extends SC with SnippetRootNodeMappable {
  SnippetName name;

  // RoutePath? routePath;
  // bool isEmbedded;
  String tags;

  SnippetRootNode({
    required this.name,
    // this.routePath,
    // this.isEmbedded = false,
    this.tags = '',
    super.child,
  }) {
    // fco.logger.i('SnippetRootNode created with uid: $uid');
  }

  static bool isHotspotCalloutContent(String sname) => int.tryParse(sname) != null || /*legacy*/ sname.startsWith('T-');

  @override
  List<PNode> propertyNodes(BuildContext context, SNode? parentSNode) => [
    StringPNode(
      snode: this,
      name: 'tags',
      stringValue: tags.toString(),
      onStringChange: (newValue) {
        refreshWithUpdate(context, () => tags = newValue ?? '');
      },
      calloutButtonSize: const Size(280, 70),
      calloutWidth: 280,
    ),
    // StringPNode(
    //   snode: this,
    //   name: 'Snippet Name',
    //   stringValue: name,
    //   onStringChange: (newValue) => refreshWithUpdate(context,() => name = newValue??''),
    //   calloutButtonSize: const Size(280, 70),
    //   calloutWidth: 280,
    // ),
    // PropertyGroup(
    //   snode: this,
    //   name: 'Page Snippet...',
    //   children: [
    //     StringPNode(
    //       snode: this,
    //       name: 'Snippet Name',
    //       stringValue: name,
    //       onStringChange: (newValue) => refreshWithUpdate(context,() => name = newValue??''),
    //       calloutButtonSize: const Size(280, 70),
    //       calloutWidth: 280,
    //     ),
    // StringPNode(
    //   snode: this,
    //   name: 'Route Path',
    //   stringValue: routePath,
    //   onStringChange: (newValue) => refreshWithUpdate(context,() => routePath = newValue),
    //   calloutButtonSize: const Size(280, 70),
    //   calloutWidth: 280,
    // ),
    //   ],
    // ),
    // BoolPNode(
    //   snode: this,
    //   name: 'isEmbedded',
    //   boolValue: isEmbedded,
    //   onBoolChange: (newValue) => refreshWithUpdate(context,() => isEmbedded = newValue ?? false),
    // ),
  ];

  @override
  Widget buildFlutterWidget(BuildContext context, SNode? parentNode) {
    try {
      // fco.logger.i("SnippetRootNode.toWidget($name)...");
      // if (findDescendant(SnippetRootNode) != null) {}
      setParent(parentNode);

      // SnippetInfoModel.debug();
      return FutureBuilder<SnippetRootNode?>(
        future: SnippetRootNode.loadSnippetFromCacheOrFromFB(snippetName: name),
        builder: (futureContext, snapshot) {
          var snippetInfo = SnippetInfoModel.cachedSnippetInfo(name);
          bool isPublishedVersion = snippetInfo?.publishedVersionId == snippetInfo?.editingVersionId;
          if (snapshot.connectionState == ConnectionState.done) {
            // fco.logger.i("FutureBuilder<void> Ensuring $name present");
            try {
              // in case did a revert, ignore snapshot data and use the AppInfo instead
              SnippetRootNode? snippet = snapshot.data; //fco.currentSnippetVersion(name);
              // SnippetRootNode? snippetRoot = cache?[editingVersionId];
              Widget snippetWidget =
                  snippet == null
                      ? Error(key: createNodeWidgetGK(), FLUTTER_TYPE, color: Colors.red, size: 16, errorMsg: "null snippet!")
                      : snippet.child?.buildFlutterWidget(futureContext, this) ?? const Placeholder();
              snippet?.validateTree();
              if (!(snippet?.isValid()??false)) {
                return const Offstage();
              }
              Widget snippetWidgetStack = Stack(
                children: [
                  snippetWidget,
                  if (fco.canEditContent())
                    Align(
                      alignment: Alignment.topRight,
                      child: SizedBox(width: 40, height: 40, child: CustomPaint(size: const Size(40, 40), painter: TRTriangle(Colors.black))),
                    ),
                ],
              );

              return fco.canEditContent()
                  ? Banner(
                    message: isPublishedVersion ? 'published' : 'not published',
                    location: BannerLocation.topEnd,
                    color: isPublishedVersion ? Colors.limeAccent.withValues(alpha: .5) : Colors.pink.shade100,
                    textStyle: TextStyle(color: Colors.black, fontSize: 10),
                    child: snippetWidgetStack,
                  )
                  //TODO warn user if in debug mode and snippet version does not match editing version
                  : !isPublishedVersion && kDebugMode
                  ? Container(color: Colors.red, padding: EdgeInsets.all(50), child: snippetWidget)
                  : snippetWidget;
            } catch (e) {
              return Error(key: createNodeWidgetGK(), FLUTTER_TYPE, color: Colors.red, size: 16, errorMsg: e.toString());
            }
          } else {
            return const CircularProgressIndicator();
          }
        },
      );
    } catch (e) {
      return Error(key: createNodeWidgetGK(), FLUTTER_TYPE, color: Colors.red, size: 16, errorMsg: e.toString());
    }
  }

  // if root already exists, return it.
  // If not, and a template name supplied, create a named copy of that template.
  // If not, just create a snippet that comprises a PlaceholderNode.
  static Future<SnippetRootNode?> loadSnippetFromCacheOrFromFBOrCreateFromTemplate({
    SnippetRootNode? templateSnippetRootNode,
    required SnippetName snippetName,
  }) async {
    // fco.logger.d(
    //     "SnippetRootNode.loadSnippetFromCacheOrFromFBOrCreateFromTemplate");

    // if not yet in AppInfo, must be a BRAND NEW snippet, so just return it as the template
    var appInfo = fco.appInfo;
    var snippetNames = appInfo.snippetNames;
    if (!snippetNames.contains(snippetName) && templateSnippetRootNode != null) {
      fco.pageList.add(snippetName);
      fco.capiBloc.add(CAPIEvent.forceRefresh());
      await fco.saveNewVersion(snippet: templateSnippetRootNode);
      // await fco.cacheAndSaveANewSnippetVersion(snippetName: snippetName, rootNode: snippetRootNode);
      return templateSnippetRootNode;
    }

    // snippet was definitely previously created (because snippetName present in appInfo)
    // may already have a read in progress (app may start with >1 builds!
    // if (fco.snippetsBeingReadFromFB.contains(snippetName)) return;

    SnippetRootNode? rootNode;
    SnippetInfoModel? snippetInfo = await fco.modelRepo.getSnippetInfoFromCacheOrFB(snippetName: snippetName);
    if (snippetInfo != null) {
      // may already be in snippet cache
      rootNode = await snippetInfo.currentVersionFromCacheOrFB();
    }
    // snippetInfo = SnippetInfoModel.cachedSnippet(snippetName);
    if (rootNode?.isValid() ?? false) {
      return rootNode;
    } else {
      return null;
    }
  }

  static Future<SnippetRootNode?> loadSnippetFromCacheOrFromFB({required SnippetName snippetName}) async {
    SnippetInfoModel? snippetInfo = await fco.modelRepo.getSnippetInfoFromCacheOrFB(snippetName: snippetName);
    return snippetInfo != null
        // may already be in snippet cache, or will be loaded from FB
        ? await snippetInfo.currentVersionFromCacheOrFB()
        : null;
  }

  // void showSnippetNodeWidgetOverlays(context) {
  //   void traverseAndMeasure(BuildContext el) {
  //     if ((fco.nodesByGK.containsKey(el.widget.key))) {
  //       // || (el.widget.key != null && gkSTreeNodeMap[el.widget.key]?.rootNodeOfSnippet() == FCO.targetSnippetBeingConfigured)) {
  //       GlobalKey gk = el.widget.key as GlobalKey;
  //       SNode? node = fco.nodesByGK[gk];
  //       // fco.logger.i("traverseAndMeasure: ${node.toString()}");
  //       if (node != null && node.canShowTappableNodeWidgetOverlay) {
  //         // if (node.rootNodeOfSnippet() == FCO.targetSnippetBeingConfigured) {
  //         // fco.logger.i("targetSnippetBeingConfigured: ${node.toString()}");
  //         // }
  //         // fco.logger.i('Rect? r = gk.globalPaintBounds...');
  //         // measure node
  //         Rect? r = gk.globalPaintBounds(skipWidthConstraintWarning: true, skipHeightConstraintWarning: true);
  //         // if (node is PlaceholderNode) {
  //         //   fco.logger.i('PlaceholderNode');
  //         // }
  //         if (r != null) {
  //           // node.measuredRect = Rect.fromLTWH(r.left, r.top, r.width, r.height);
  //           // fco.logger.i("========>  r restricted to ${r.toString()}");
  //           // fco.logger.i('${node.runtimeType.toString()} - size: (${r != null ? r.size.toString() : ""})');
  //           // node.setParent(parent);
  //           // parent = node;
  //           // fco.logger.i('_showNodeWidgetOverlay...');
  //           // removeAllNodeWidgetOverlays();
  //           // pass possible ancestor scrollcontroller to overlay
  //           node.showTappableNodeWidgetOverlay(
  //             // restrictedRect: r,
  //             // scName: widget.scName,
  //           );
  //         }
  //       }
  //     }
  //     el.visitChildElements((innerEl) {
  //       traverseAndMeasure(innerEl);
  //     });
  //   }
  //
  //   var pageContext = context;
  //   traverseAndMeasure(pageContext);
  //   fco.showingNodeBoundaryOverlays = true;
  //   // fco.logger.i('traverseAndMeasure(context) finished.');
  // }

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
  //     fco.logger.i('ensured snippet: ${rootNode?.name} ensured present.');
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
  /// optional clone name, with a default
  SnippetRootNode clone({String? cloneName}) {
    SnippetRootNode copiedNode = super.clone() as SnippetRootNode;
    copiedNode
      ..name = (cloneName ?? '$name-copy')
      ..nodeWidgetGK = GlobalKey();
    return copiedNode;
  }

  @override
  String toString() => FLUTTER_TYPE;

  @override
  Widget? widgetLogo() => Image.asset(fco.asset('lib/assets/images/pub.dev.png'), width: 16);

  static const String FLUTTER_TYPE = "Snippet";
}
