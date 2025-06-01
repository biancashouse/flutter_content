// ignore_for_file: camel_case_types

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:go_router/go_router.dart';

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
  }) : snippetRootNode = null;

  static SnippetPanelState? of(BuildContext context) =>
      context.findAncestorStateOfType<SnippetPanelState>();

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

class SnippetPanelState extends State<SnippetPanel>
    with TickerProviderStateMixin {
  Map<String, TabBarNode> tabBars = {};

  // will be snippetName or rootNode name
  String snippetName() => widget.snippetName ?? widget.snippetRootNode!.name;

  late bool showBanner;

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

    showBanner = true;
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
    return ValueListenableBuilder<bool>(
        valueListenable: fco.inEditMode,
        builder: (context, inEditModeValue, child) {
          print('${snippetName()} inEditMode:$inEditModeValue}');
          return BlocBuilder<CAPIBloC, CAPIState>(
              key: widget.panelName != null
                  ? fco.panelGkMap[widget.panelName!] =
                      GlobalKey(debugLabel: 'Panel[${widget.panelName}]')
                  : null,
              buildWhen: (previous, current) {
                // fco.logger.i(
                //     'BlocBuilder - current.onlyTargetsWrappers: ${current.onlyTargetsWrappers}');
                return !current.onlyTargetsWrappers;
              },
              builder: (blocContext, state) {
                // fco.logger.d('\nSnippetPanel builder:\n');

                return FutureBuilder<SnippetRootNode?>(
                    future: SnippetRootNode
                        .loadSnippetFromCacheOrFromFBOrCreateFromTemplate(
                      snippetName: snippetName(),
                      snippetRootNode: widget.snippetRootNode,
                    ),
                    builder: (futureContext, snapshot) {
                      if (snapshot.connectionState != ConnectionState.done) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      // SnippetInfoModel.debug();
                      // SnippetInfoModel? snippetInfo = SnippetInfoModel.snippetInfoCache[snippetName()];
                      // SnippetInfoModel.debug();

                      if (snapshot.data == null) {
                        return Error("SnippetPanel",
                            color: Colors.red,
                            size: 32,
                            errorMsg: "null snippet!",
                            key: GlobalKey());
                      }

                      bool isPublishedVersion =
                          fco.isEditingVersionPublished(snippetName());

                      SnippetRootNode snippet = snapshot.data!;

                      // test whether snippet is in the cache
                      // bool namePresent = fco.appInfo.snippetNames.contains(snippetName());

                      Color triangleColor = Colors.purpleAccent; // in edit mode
                      if (!isPublishedVersion)
                        triangleColor = Colors.deepOrange;

                      snippet.validateTree();
                      // SnippetRootNode? snippetRoot = cache?[editingVersionId];

                      bool playing = widget.justPlaying;
                      bool canEdit = fco.authenticated.isTrue;

                      final isCID = int.tryParse(snippetName()) != null ||
                          snippetName().startsWith('T-');

                      // is it part of a CalloutContentEditablePage rather than a normal EditablePage
                      // var parent = CalloutContentEditablePage.of(context);
                      // bool isOnANormalPage = parent == null;

                      // final currentPage = fco.currentEditablePagePath;

                      final snippetInEditMode = fco.inEditModeForSnippetName;
                      final hideSnippetPanel =
                          inEditModeValue && snippetName() != snippetInEditMode;

                      Widget snippetWidget = Stack(
                        children: [
                          snippet.toWidget(futureContext, null),
                          if (!widget.justPlaying &&
                              !isPublishedVersion &&
                              !canEdit)
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                  color: Colors.deepOrange,
                                  height: 6,
                                  width: double.infinity),
                            ),
                          if (!playing && canEdit && showBanner)
                            Align(
                                alignment: Alignment.topRight,
                                child: Tooltip(
                                  message: isCID // && isOnANormalPage
                                      ? 'tap here to edit Callout Content on another page...'
                                      : FlutterContentApp.snippetBeingEdited ==
                                              null
                                          ? 'tap here to enter EDIT mode'
                                          : '',
                                  child: GestureDetector(
                                    onTap: () {
                                      if (FlutterContentApp
                                              .snippetBeingEdited !=
                                          null) {
                                        return;
                                      }

                                      fco.dismiss(CalloutConfigToolbar.CID);

                                      // TBD? trying new approach: goto page(content snippet)
                                      if (false &&
                                          isCID /* && isOnANormalPage */) {
                                        fco.addSubRoute(
                                            newPath: snippetName(),
                                            template:
                                                SnippetTemplateEnum.empty);
                                        // context.replace('/${snippetName()}/spank=abc');
                                        final currentUrl = GoRouter.of(context)
                                            .routerDelegate
                                            .currentConfiguration
                                            .uri
                                            .toString();
                                        context.go('/callout-content-editor',
                                            extra: (widget.tc, currentUrl));
                                        return;
                                        // TBD?
                                      }

                                      // var savedOffsets =
                                      //     fco.saveScrollOffsets();
                                      // bool test = fco.inEditMode.value;
                                      setState(() {
                                        fco.inEditModeForSnippetName =
                                            widget.snippetName ??
                                                widget.snippetRootNode!.name;
                                        fco.inEditMode.value = true;
                                        showBanner = false;
                                        showSnippetNodeWidgetOverlays(
                                            context, widget.scName);
                                        // fco.afterMsDelayDo(100, (){
                                        // fco.restoreScrollOffsets(
                                        //     savedOffsets);
                                        // });
                                      });
                                    },
                                    child: CustomPaint(
                                      size: const Size(40, 40),
                                      painter: TRTriangle(triangleColor),
                                    ),
                                  ),
                                )),
                        ],
                      );

                      return canEdit && showBanner
                          ? Banner(
                              message: isPublishedVersion
                                  ? 'published'
                                  : 'not published',
                              location: BannerLocation.topEnd,
                              color: isPublishedVersion
                                  ? Colors.limeAccent.withValues(alpha: .5)
                                  : Colors.pink.shade100,
                              textStyle:
                                  TextStyle(color: Colors.black, fontSize: 10),
                              child: !inEditModeValue
                                  ? snippetWidget
                                  : IgnorePointer(child: snippetWidget))
                          : canEdit
                              ? IgnorePointer(child: snippetWidget)
                              : snippetWidget;
                    });
              });
        });
  }

  static void showSnippetNodeWidgetOverlays(
    BuildContext context,
    ScrollControllerName? scName,
  ) {
    // no need to de-reigister once set up
    fco.registerKeystrokeHandler('tappable-widget-overlays', (KeyEvent event) {
      if (event.logicalKey == LogicalKeyboardKey.escape) {
        if (fco.inEditMode.value &&
            FlutterContentApp.snippetBeingEdited == null) {
          fco.dismissAll();
        }
      }
      return false;
    });

    bool barrierApplied = false;
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
          Rect? r = gk.globalPaintBounds(
              skipWidthConstraintWarning: true,
              skipHeightConstraintWarning: true);
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
            barrierApplied = true;
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
