// ignore_for_file: camel_case_types

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
  final Map<String, void Function(BuildContext)>? handlers;

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
    this.handlers,
    // this.allowButtonCallouts = true,
    // this.justPlaying = true,
    required this.scName, // force dev to be scroll aware
    super.key,
  }) : snippetName = null;

  const SnippetPanel.fromSnippet({
    this.panelName,
    required this.snippetName,
    this.handlers,
    // this.allowButtonCallouts = true,
    // this.justPlaying = true,
    // this.onPressed,
    // this.onLongPress,
    // this.icon,
    // this.iconColor,
    // this.iconSize,
    required this.scName, // force dev to be scroll aware
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
  // late String snippetNameToUse;
  // NOTE - tabcontroller will only be instantiated if a TabBar calls createTabController
  TabController?
      tabC; // used when a TabBar and TabBarView are used in a snippet's Scaffold
  GlobalKey? tabBarGK;
  late List<int> prevTabQ;
  bool?
      backBtnPressed; // allow the listener to know when to skip adding index back onto Q after a back btn
  final prevTabQSize = ValueNotifier<int>(0);

  String? snippetName() => widget.snippetName ?? widget.snippetRootNode?.name;

  // ZoomerState? get parentTSState => Zoomer.of(context);

  // int countTabs() {
  //   SnippetRootNode? rootNode = FCO.capiBloc.state.rootNode("root");
  //   if (rootNode == null) return 0;
  //   TabBarNode? tabBarNode = FCO.capiBloc.state.snippetBeingEdited?.treeC.findNodeTypeInTree(rootNode, TabBarNode) as TabBarNode?;
  //   return tabBarNode?.children.length ?? 0;
  // }

  void createTabController(int numTabs) {
    tabC?.dispose();
    tabC = TabController(vsync: this, length: numTabs);

    tabC!.addListener(() {
      if (!(tabC?.indexIsChanging ?? true)) {
        if (tabBarGK != null) {
          TabBarNode? tbNode = fco.gkSTreeNodeMap[tabBarGK] as TabBarNode?;
          if (tbNode != null && !(backBtnPressed ?? false)) {
            prevTabQ.add(tbNode.selection ?? 0);
            tbNode.selection = tabC!.index;
            prevTabQSize.value = prevTabQ.length;
            fco.logi("tab pressed: ${tabC!.index}, Q: ${prevTabQ.toString()}");
          } else {
            tbNode?.selection = tabC!.index;
            backBtnPressed = false;
          }
        }
      }
    });

    // tabC!.addListener(() {
    //   setState(() {
    //     _tabQ.clear();
    //     tabC?.animateTo(tabC?.index??0);
    //   });
    // });
  }

  @override
  void initState() {
    super.initState();

    widget.handlers?.forEach((key, value) {
      fco.registerHandler(key, value);
      fco.logi("registered handler '$key'");
    });

    if (widget.panelName != null &&
        !fco.placeNames.contains(widget.panelName)) {
      fco.placeNames.add(widget.panelName!);
    }

    prevTabQ = [];
  }

  void resetTabQandC() {
    prevTabQ = [];
    if (tabBarGK != null) {
      TabBarNode? tbNode = fco.gkSTreeNodeMap[tabBarGK] as TabBarNode?;
      tbNode?.selection = 0;
      tabC?.index = 0;
    }
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

    return BlocBuilder<CAPIBloC, CAPIState>(
        key: widget.panelName != null
            ? fco.panelGkMap[widget.panelName!] =
                GlobalKey(debugLabel: 'Panel[${widget.panelName}]')
            : null,
        buildWhen: (previous, current) => !current.onlyTargetsWrappers,
        builder: (blocContext, state) {
          var snippetInfo = SnippetInfoModel.cachedSnippet(snippetName()!);
          bool isPublishedVersion = snippetInfo?.publishedVersionId == snippetInfo?.editingVersionId;
          return FutureBuilder<SnippetRootNode?>(
              future: SnippetRootNode
                  .loadSnippetFromCacheOrFromFBOrCreateFromTemplate(
                snippetName: snippetName() ?? 'unnamed snippet',
                snippetRootNode: widget.snippetRootNode,
              ),
              builder: (futureContext, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Center(child: CircularProgressIndicator());
                }

                // SnippetInfoModel.debug();
                // SnippetInfoModel? snippetInfo = SnippetInfoModel.snippetInfoCache[snippetName()];
                // SnippetInfoModel.debug();

                Widget snippetWidget;
                try {
                  // in case did a revert, ignore snapshot data and use the AppInfo instead
                  // String sName = snippetName();

                  SnippetRootNode? snippet = snapshot.data;

                  Color triangleColor = Colors.purpleAccent;  // in edit mode
                  if (!isPublishedVersion) triangleColor = Colors.deepOrange;

                  snippet?.validateTree();
                  // SnippetRootNode? snippetRoot = cache?[editingVersionId];
                  snippetWidget = snippet == null
                      ? Error("SnippetPanel",
                          color: Colors.red,
                          size: 32,
                          errorMsg: "null snippet!",
                          key: GlobalKey())
                      : ValueListenableBuilder<bool>(
                          valueListenable: fco.inEditMode,
                          builder: (context, value, child) {
                            print('inEditMode: ${fco.inEditMode.value}');
                            return Stack(
                              children: [
                                snippet.child
                                        ?.toWidget(futureContext, snippet) ??
                                    const Placeholder(),
                                if (!isPublishedVersion && !fco.canEditContent.value)
                                  Align(alignment: Alignment.topLeft,
                                  child: Container(color:Colors.deepOrange, height:6, width:double.infinity),),
                                if (fco.canEditContent.value)
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: Tooltip(
                                        message: 'tap here to enter EDIT mode',
                                        child: GestureDetector(
                                          onTap: () {
                                            fco.inEditMode.value = true;
                                            showSnippetNodeWidgetOverlays();
                                          },
                                          child: fco.inEditMode.value
                                              ? fco.blink(CustomPaint(
                                                  size: const Size(40, 40),
                                                  painter: TRTriangle(
                                                      triangleColor),
                                                ))
                                              : CustomPaint(
                                                  size: const Size(40, 40),
                                                  painter: TRTriangle(
                                                      triangleColor),
                                                ),
                                        ),
                                      )),
                              ],
                            );
                          });
                } catch (e) {
                  fco.logi('snippetRootNode.toWidget() failed!');
                  snippetWidget = Material(
                    textStyle:
                        const TextStyle(fontFamily: 'monospace', fontSize: 12),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Error("FlowchartWidget",
                          color: Colors.red,
                          size: 32,
                          errorMsg: e.toString(),
                          key: GlobalKey()),
                    ),
                  );
                }
                return fco.canEditContent.value
                    ? Banner(
                        message:
                            isPublishedVersion ? 'published' : 'not published',
                        location: BannerLocation.topEnd,
                        color: isPublishedVersion
                            ? Colors.limeAccent.withOpacity(.5)
                            : Colors.pink.shade100,
                        textStyle: TextStyle(color: Colors.black, fontSize: 10),
                        child: snippetWidget)
                    : snippetWidget;
              });
        });
  }

  void showSnippetNodeWidgetOverlays() {
    bool barrierApplied = false;
    void traverseAndMeasure(BuildContext el) {
      if ((fco.gkSTreeNodeMap.containsKey(el.widget.key))) {
        // || (el.widget.key != null && gkSTreeNodeMap[el.widget.key]?.rootNodeOfSnippet() == FCO.targetSnippetBeingConfigured)) {
        GlobalKey gk = el.widget.key as GlobalKey;
        STreeNode? node = fco.gkSTreeNodeMap[gk];
        // fco.logi("traverseAndMeasure: ${node.toString()}");
        if (node != null && node.canShowTappableNodeWidgetOverlay) {
          // if (node.rootNodeOfSnippet() == FCO.targetSnippetBeingConfigured) {
          // fco.logi("targetSnippetBeingConfigured: ${node.toString()}");
          // }
          // fco.logi('Rect? r = gk.globalPaintBounds...');
// measure node
          Rect? r = gk.globalPaintBounds(
              skipWidthConstraintWarning: true,
              skipHeightConstraintWarning: true);
          // if (node is PlaceholderNode) {
          //   fco.logi('PlaceholderNode');
          // }
          if (r != null) {
            node.measuredRect = Rect.fromLTWH(r.left, r.top, r.width, r.height);
            r = fco.restrictRectToScreen(r);
            // fco.logi("========>  r restricted to ${r.toString()}");
            // fco.logi('${node.runtimeType.toString()} - size: (${r != null ? r.size.toString() : ""})');
            // node.setParent(parent);
            // parent = node;
            // fco.logi('_showNodeWidgetOverlay...');
            // removeAllNodeWidgetOverlays();
            // pass possible ancestor scrollcontroller to overlay
            node.showTappableNodeWidgetOverlay(
              whiteBarrier: !barrierApplied,
              scName: widget.scName,
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
    traverseAndMeasure(pageContext);  // root node overlay must have barrier
    fco.showingNodeBoundaryOverlays = true;
    // fco.logi('traverseAndMeasure(context) finished.');
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
//           fco.logi('snippetRootNode.toWidget() failed!');
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
