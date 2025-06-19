// ignore_for_file: camel_case_types

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_content/flutter_content.dart';

import 'tr_triangle_painter.dart';

const BODY_PLACEHOLDER = 'body-placeholder';

class SnippetPanel extends StatefulWidget {
  final String? panelName;

  // from canned snippet
  final String? snippetName;

  // or by providing tree of nodes
  final SnippetRootNode? snippetRootNode;

  // final Map<String, void Function(BuildContext)>? handlers;

  final bool justPlaying;

  final TargetModel? tc; // for when called to create a hotspot callout

  // final bool allowButtonCallouts;
  // final bool justPlaying;

  // final Icon? icon;
  // final Color? iconColor;
  // final double? iconSize;
  // final VoidCallback? onPressed;
  // final VoidCallback? onLongPress;
  // parent widget may be scrollable
  final ScrollControllerName? scName;

  // effectively from a Template
  const SnippetPanel.fromNodes({
    this.panelName,
    required this.snippetRootNode,
    // this.handlers,
    // this.allowButtonCallouts = true,
    // this.justPlaying = true,
    required this.scName, // force dev to be scroll aware
    this.justPlaying = false,
    this.tc,
    super.key,
  }) : snippetName = null;

  const SnippetPanel.fromSnippet({
    this.panelName,
    required this.snippetName,
    this.snippetRootNode,
    // this.handlers,
    // this.allowButtonCallouts = true,
    // this.justPlaying = true,
    // this.onPressed,
    // this.onLongPress,
    // this.icon,
    // this.iconColor,
    // this.iconSize,
    required this.scName, // force dev to be scroll aware
    this.justPlaying = false,
    this.tc,
    super.key,
  });

  static SnippetPanelState? of(BuildContext context) => context.findAncestorStateOfType<SnippetPanelState>();

  @override
  State<SnippetPanel> createState() => SnippetPanelState();

  // static SnippetRootNode createSnippetFromTemplateNodes(SnippetRootNode rootNode, String snippetName) {
  //   rootNode.validateTree();
  //   rootNode.name = snippetName;
  //   return rootNode;
  // }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('sName', snippetName, defaultValue: ''));
  }
}

class SnippetPanelState extends State<SnippetPanel> with TickerProviderStateMixin {
  Map<String, TabBarNode> tabBars = {};

  late Future<SnippetRootNode?> fEnsureSnippetInCache;

  // will be snippetName or rootNode name
  String snippetName() => widget.snippetName ?? widget.snippetRootNode!.name;

  // ZoomerState? get parentTSState => Zoomer.of(context);

  // int countTabs() {
  //   SnippetRootNode? rootNode = FCO.capiBloc.state.rootNode("root");
  //   if (rootNode == null) return 0;
  //   TabBarNode? tabBarNode = FCO.capiBloc.state.snippetBeingEdited?.treeC.findNodeTypeInTree(rootNode, TabBarNode) as TabBarNode?;
  //   return tabBarNode?.children.length ?? 0;
  // }

  @override
  void initState() {
    super.initState();

    fEnsureSnippetInCache = _ensureSnippetInCache();

    // widget.handlers?.forEach((key, value) {
    //   fco.registerHandler(key, value);
    //   fco.logger.i("registered handler '$key'");
    // });

    // removed snippet place naming functionality - use tab bar instead
    // if (widget.panelName != null &&
    //     !fco.placeNames.contains(widget.panelName)) {
    //   fco.placeNames.add(widget.panelName!);
    // }
  }

  // removed snippet place naming functionality - use tab bar instead
  // @override
  // void dispose() {
  //   if (widget.panelName != null && fco.placeNames.contains(widget.panelName)) {
  //     fco.placeNames.remove(widget.panelName!);
  //   }
  //   super.dispose();
  // }

  Future<SnippetRootNode?> _ensureSnippetInCache() async {
    // may already be in memory
    var appInfo = fco.appInfo;
    if (appInfo.snippetNames.contains(snippetName())) {
      SnippetInfoModel? snippetInfo = SnippetInfoModel.cachedSnippetInfo(snippetName());
      if (snippetInfo != null) {
        return await snippetInfo.currentVersionFromCacheOrFB();
      }
    }
    return await SnippetRootNode.loadSnippetFromCacheOrFromFBOrCreateFromTemplate(
      snippetName: snippetName(),
      snippetRootNode: widget.snippetRootNode,
    );
  }

  @override
  Widget build(BuildContext context) {
    // bool nodeTreeSupplied = widget.rootNode != null;
    // if (nodeTreeSupplied) {
    //   SnippetRootNode newSnippet = SnippetPanel.createSnippetFromTemplateNodes(
    //     widget.rootNode!,
    //     widget.rootNode!.name,
    //   );
    // }

    // panel name is always supplied, but snippet name can be omitted,
    // in which case a default snippet name is used: Snippet[pName].
    // But first, see if there's an entry in the placement map, in which case we use that snippet name.
    // if (FCO.snippetPlacementMap.containsKey(widget.panelName)) {
    //   snippetNameToUse = FCO.snippetPlacementMap[widget.panelName]!;
    // }

    // SnippetInfoModel.debug();

    // if a snippet passed in, don't need a futurebuilder
    return BlocConsumer<CAPIBloC, CAPIState>(
      key: widget.panelName != null ? fco.panelGkMap[widget.panelName!] = GlobalKey(debugLabel: 'Panel[${widget.panelName}]') : null,
      // show pink overlays if state variable set with this snippet's name
      listenWhen: (context, state) => state.snippetNameShowingPinkOverlaysFor == snippetName(),
      listener: (context, state) {
        // NON-null name means show pink overlays, otherwise ignore (editing ended)
        if (state.snippetNameShowingPinkOverlaysFor != null) {
          showSnippetNodeWidgetOverlays(context, widget.scName);
        }
      },
      buildWhen: (previous, current) {
        // fco.logger.i(
        //     'BlocBuilder - current.onlyTargetsWrappers: ${current.onlyTargetsWrappers}');
        return !current.onlyTargetsWrappers && current.snippetNameShowingPinkOverlaysFor == null;
      },
      builder: (blocContext, state) {
        // fco.logger.d('\nSnippetPanel builder:\n');

        return FutureBuilder<SnippetRootNode?>(
          future: fEnsureSnippetInCache,
          builder: (futureContext, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            }

            // SnippetInfoModel.debug();
            // SnippetInfoModel? snippetInfo = SnippetInfoModel.snippetInfoCache[snippetName()];
            // SnippetInfoModel.debug();

            if (snapshot.data == null) {
              return Error("SnippetPanel", color: Colors.red, size: 32, errorMsg: "null snippet!", key: GlobalKey());
            }

            bool isPublishedVersion = fco.isEditingVersionPublished(snippetName());

            SnippetRootNode snippet = snapshot.data!;

            // test whether snippet is in the cache
            // bool namePresent = fco.appInfo.snippetNames.contains(snippetName());

            Color triangleColor = Colors.purpleAccent; // in edit mode
            if (!isPublishedVersion) triangleColor = Colors.deepOrange;

            snippet.validateTree();
            // SnippetRootNode? snippetRoot = cache?[editingVersionId];

            bool playing = widget.justPlaying;
            bool canEdit = fco.authenticated.isTrue;

            // cId as a number means it's a hotspot content callout
            final isCID = int.tryParse(snippetName()) != null || snippetName().startsWith('T-');

            // is it part of a CalloutContentEditablePage rather than a normal EditablePage
            // var parent = CalloutContentEditablePage.of(context);
            // bool isOnANormalPage = parent == null;

            // final currentPage = fco.currentEditablePagePath;

            // final snippetInEditMode = fco.inEditModeForSnippetName;
            // final hideSnippetPanel =
            //     inEditModeValue && snippetName() != snippetInEditMode;

            Widget snippetWidget = Stack(
              children: [
                snippet.toWidget(futureContext, null),
                if (!widget.justPlaying && !isPublishedVersion && !canEdit)
                  Align(alignment: Alignment.topLeft, child: Container(color: Colors.deepOrange, height: 6, width: double.infinity)),
                if (!playing && canEdit && !state.inSelectWidgetMode)
                  Align(
                    alignment: Alignment.topRight,
                    child: Tooltip(
                      message:
                          isCID // && isOnANormalPage
                              ? 'tap here to enter Select Widget Mode'
                              : FlutterContentApp.snippetBeingEdited == null
                              ? 'tap here to enter Select Widget Mode'
                              : '',
                      child: InkWell(
                        onTap: () {
                          if (FlutterContentApp.snippetBeingEdited != null) {
                            return;
                          }

                          // event
                          // fco.inEditMode.value = true;
                          FlutterContentApp.capiBloc.add(
                            CAPIEvent.enterSelectWidgetMode(snippetName: widget.snippetName ?? widget.snippetRootNode!.name),
                          );
                          // fco.afterNextBuildDo((){
                          // });
                          // setState(() {
                          //   fco.inEditModeForSnippetName =
                          //       widget.snippetName ??
                          //           widget.snippetRootNode!.name;
                          //   fco.inEditMode.value = true;
                          //   showBanner = false;
                          //   showSnippetNodeWidgetOverlays(
                          //       context, widget.scName);
                          //   // fco.afterMsDelayDo(100, (){
                          //   // fco.restoreScrollOffsets(
                          //   //     savedOffsets);
                          //   // });
                          // });
                        },
                        child: CustomPaint(
                          size: const Size(40, 40),
                          painter: TRTriangle(triangleColor),
                          child: Container(
                            width: 40,
                            height: 40,
                            alignment: Alignment.topRight,
                            child: Icon(Icons.select_all, size: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            );

            return canEdit && state.inSelectWidgetMode
                ? Banner(
                  message: isPublishedVersion ? 'published' : 'not published',
                  location: BannerLocation.topEnd,
                  color: isPublishedVersion ? Colors.limeAccent.withValues(alpha: .5) : Colors.pink.shade100,
                  textStyle: TextStyle(color: Colors.black, fontSize: 10),
                  child: !state.inSelectWidgetMode ? snippetWidget : IgnorePointer(child: snippetWidget),
                )
                : canEdit && false
                ? IgnorePointer(child: snippetWidget)
                : snippetWidget;
          },
        );
      },
    );
  }

  static void showSnippetNodeWidgetOverlays(BuildContext context, ScrollControllerName? scName) {
    // no need to de-reigister once set up
    fco.registerKeystrokeHandler('exit-Select-Widget-Mode', (KeyEvent event) {
      if (event.logicalKey == LogicalKeyboardKey.escape) {
        if (FlutterContentApp.capiState.inSelectWidgetMode) {
          FlutterContentApp.capiBloc.add(CAPIEvent.exitSelectWidgetMode());
        }
      }
      return false;
    });

    // bool barrierApplied = false;
    void traverseAndMeasure(BuildContext el) {
      if ((fco.nodesByGK.containsKey(el.widget.key))) {
        // || (el.widget.key != null && gkSTreeNodeMap[el.widget.key]?.rootNodeOfSnippet() == FCO.targetSnippetBeingConfigured)) {
        GlobalKey gk = el.widget.key as GlobalKey;
        SNode? node = fco.nodesByGK[gk];
        // fco.logger.i("traverseAndMeasure: ${node.toString()}");
        if (node != null && node.canShowTappableNodeWidgetOverlay) {
          // if (node.rootNodeOfSnippet() == FCO.targetSnippetBeingConfigured) {
          // fco.logger.i("targetSnippetBeingConfigured: ${node.toString()}");
          // }
          // fco.logger.i('Rect? r = gk.globalPaintBounds...');
          // measure node
          Rect? r = gk.globalPaintBounds(skipWidthConstraintWarning: true, skipHeightConstraintWarning: true);
          // if (node is PlaceholderNode) {
          //   fco.logger.i('PlaceholderNode');
          // }
          if (r != null) {
            // node.measuredRect = Rect.fromLTWH(r.left, r.top, r.width, r.height);
            r = fco.restrictRectToScreen(r);
            // fco.logger.i("========>  r restricted to ${r.toString()}");
            // fco.logger.i('${node.runtimeType.toString()} - size: (${r != null ? r.size.toString() : ""})');
            // node.setParent(parent);
            // parent = node;
            // fco.logger.i('_showNodeWidgetOverlay...');
            // removeAllNodeWidgetOverlays();
            // pass possible ancestor scrollcontroller to overlay
            node.showTappableNodeWidgetOverlay(
              //whiteBarrier: !barrierApplied,
              scName: scName,
            );
            // barrierApplied = true;
          }
        }
      }
      el.visitChildElements((innerEl) {
        traverseAndMeasure(innerEl);
      });
    }

    var pageContext = context;
    traverseAndMeasure(pageContext); // root node overlay must have barrier
    fco.showingNodeBoundaryOverlays = true;
    // fco.logger.i('traverseAndMeasure(context) finished.');
  }

  // _renderSnippet(context) {
  //   return FutureBuilder<void>(
  //
  //     future: SnippetRootNode.loadSnippetFromCacheOrFromFBOrCreateFromTemplate(snippetName: snippetName()),
  //     builder: (futureContext, snapshot) {
  //       if (snapshot.connectionState == ConnectionState.done) {
  //         Widget snippetWidget;
  //         try {
  //           // in case did a revert, ignore snapshot data and use the AppInfo instead
  //           SnippetRootNode? snippet = FCO.currentSnippet(snippetName());
  //           snippet?.validateTree();
  //           // SnippetRootNode? snippetRoot = cache?[editingVersionId];
  //           snippetWidget =
  //               snippet == null ? const Icon(Icons.error, color: Colors.redAccent) : snippet.child?.toWidget(futureContext, snippet) ?? const Placeholder();
  //         } catch (e) {
  //           fco.logger.i('snippetRootNode.toWidget() failed!');
  //           snippetWidget = Material(
  //             textStyle: const TextStyle(fontFamily: 'monospace', fontSize: 12),
  //             child: SingleChildScrollView(
  //               scrollDirection: Axis.horizontal,
  //               child: Row(
  //                 children: [
  //                   const Icon(Icons.error, color: Colors.redAccent),
  //                   Gap(10),
  //                   FCO.coloredText(e.toString()),
  //                 ],
  //               ),
  //             ),
  //           );
  //         }
  //         return snippetWidget;
  //       } else {
  //         return const Center(child: CircularProgressIndicator());
  //       }
  //     });
  // }
}
