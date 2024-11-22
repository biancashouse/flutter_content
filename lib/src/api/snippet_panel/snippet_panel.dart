// ignore_for_file: camel_case_types

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_content/flutter_content.dart';

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
  final ScrollController? scrollController;

  // effectively from a Template
  const SnippetPanel.fromNodes({
    this.panelName,
    required this.snippetRootNode,
    this.handlers,
    // this.allowButtonCallouts = true,
    // this.justPlaying = true,
    this.scrollController,
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
    this.scrollController,
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
          return FutureBuilder<SnippetRootNode?>(
              future: SnippetRootNode.loadSnippetFromCacheOrFromFBOrCreateFromTemplate(
                snippetName: snippetName() ?? 'unnamed snippet',
                snippetRootNode: widget.snippetRootNode,
              ),
              builder: (futureContext, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Center(child: CircularProgressIndicator());
                }

                // SnippetInfoModel.debug();
                SnippetInfoModel? snippetInfo = SnippetInfoModel.snippetInfoCache[snippetName()];
                // SnippetInfoModel.debug();

                Widget snippetWidget;
                try {
                  // in case did a revert, ignore snapshot data and use the AppInfo instead
                  // String sName = snippetName();

                  SnippetRootNode? snippet = snapshot.data; //fco.currentSnippetVersion(sName);

                  // var cache = fco.snippetInfoCache;
                  // SnippetInfoModel? snippetInfo = cache[sName];
                  // VersionId? currentVersionId = snippetInfo?.currentVersionId;

                  snippet?.validateTree();
                  // SnippetRootNode? snippetRoot = cache?[editingVersionId];
                  snippetWidget = snippet == null
                      ? Error("SnippetPanel",
                          color: Colors.red,
                          size: 32,
                          errorMsg: "null snippet!",
                          key: GlobalKey())
                      : snippet.child?.toWidget(futureContext, snippet) ??
                          const Placeholder();
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
                return snippetWidget;
                // return BlocListener<CAPIBloC, CAPIState>(
                //   listenWhen: (CAPIState previous, CAPIState current) {
                //     return previous.snippetBeingEdited?.rootNode !=
                //         current.snippetBeingEdited?.rootNode
                //     && fco.anyPresent([snippetName()]);
                //   },
                //   listener: (context, state) {
                //     print("ROOT CHANGED");
                //   },
                //   child: snippetWidget,
                // );
              });
        });
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
