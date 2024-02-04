// ignore_for_file: camel_case_types

import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/api/wrapper/transformable_scaffold.dart';
import 'package:flutter_content/src/bloc/capi_state.dart';

const BODY_PLACEHOLDER = 'body-placeholder';

// TODO rename SnippetPanel to SnippetWidget
class SnippetPanel extends StatefulWidget {
  final String panelName;
  final String snippetName;
  final String? fromTemplate;
  final Map<String, void Function(BuildContext)>? handlers;
  final bool allowButtonCallouts;
  final bool justPlaying;

  // final Icon? icon;
  // final Color? iconColor;
  // final double? iconSize;
  // final VoidCallback? onPressed;
  // final VoidCallback? onLongPress;
  final ScrollController? ancestorHScrollController;
  final ScrollController? ancestorVScrollController;

  SnippetPanel({
    required this.panelName,
    required this.snippetName,
    this.fromTemplate,
    this.handlers,
    this.allowButtonCallouts = true,
    this.justPlaying = true,
    // this.onPressed,
    // this.onLongPress,
    // this.icon,
    // this.iconColor,
    // this.iconSize,
    this.ancestorHScrollController,
    this.ancestorVScrollController,
    super.key,
  }) {
    handlers?.forEach((key, value) {
      SnippetPanel.registerHandler(key, value);
      print("registered handler '$key'");
    });
  }

  static SnippetPanelState? of(BuildContext context) => context.findAncestorStateOfType<SnippetPanelState>();

  @override
  State<SnippetPanel> createState() => SnippetPanelState();

  static Map<HandlerName, void Function(BuildContext)> _handlers = {};

  static registerHandler(HandlerName name, void Function(BuildContext) f) => _handlers[name] = f;

  static void Function(BuildContext)? namedHandler(HandlerName name) => _handlers[name];

  static List<SnippetRootNode> templates = [
    // Scaffold with a TabBar in its AppBar bottom
    SnippetRootNode(
      name: 'scaffold-with-tabs',
      child: TransformableScaffoldNode(
        scaffold: ScaffoldNode(
          appBar: AppBarNode(
            bgColorValue: Colors.black.value,
            title: GenericSingleChildNode(propertyName: 'title', child: TextNode(text: 'my title')),
            bottom: GenericSingleChildNode(
              propertyName: 'bottom',
              child: TabBarNode(
                children: [
                  TextNode(text: 'tab 1'),
                  TextNode(text: 'Tab 2'),
                ],
              ),
            ),
          ),
          body: GenericSingleChildNode(
            propertyName: 'body',
            child: TabBarViewNode(
              children: [
                PlaceholderNode(centredLabel: 'page 1', colorValue: Colors.yellow.value),
                PlaceholderNode(centredLabel: 'page 2', colorValue: Colors.blueAccent.value),
              ],
            ),
          ),
        ),
      ),
    ),
    // Scaffold with a MenuBar in its AppBar bottom
    SnippetRootNode(
        name: 'scaffold-with-menubar',
        child: TransformableScaffoldNode(
            scaffold: ScaffoldNode(
          appBar: AppBarNode(
            bgColorValue: Colors.black.value,
            title: GenericSingleChildNode(propertyName: 'title', child: TextNode(text: 'my title')),
            bottom: GenericSingleChildNode(
              propertyName: 'bottom',
              child: MenuBarNode(children: [
                MenuItemButtonNode(itemLabel: 'item 1'),
                MenuItemButtonNode(itemLabel: 'item 2'),
                MenuItemButtonNode(itemLabel: 'item 3'),
              ]),
            ),
          ),
          body: GenericSingleChildNode(
            propertyName: 'body',
            child: PlaceholderNode(name: 'body-placeholder', centredLabel: 'menu item destination'),
          ),
        ))),
    SnippetRootNode(
        name: 'scaffold-with-actions',
        child: TransformableScaffoldNode(
            scaffold: ScaffoldNode(
          appBar: AppBarNode(
            bgColorValue: Colors.black.value,
            title: GenericSingleChildNode(propertyName: 'title', child: TextNode(text: 'my title')),
            actions: GenericMultiChildNode(propertyName: 'actions', children: [
              FilledButtonNode(child: TextNode(text: 'action 1')),
              FilledButtonNode(child: TextNode(text: 'action 2')),
              FilledButtonNode(child: TextNode(text: 'action 3')),
            ]),
          ),
          body: GenericSingleChildNode(
            propertyName: 'body',
            child: PlaceholderNode(name: BODY_PLACEHOLDER, centredLabel: 'menu item destination'),
          ),
        ))),
  ];

  // static SnippetNode getRootNode(SnippetName snippetName) {
  //   SnippetNode? sNode = CAPIBloC.I.state.rootNode(snippetName);
  //   if (sNode == null) {
  //     // print("sNode is null");
  //     sNode = SnippetNode(name: snippetName, child: PlaceholderNode());
  //     // Snippet.reg(widget.onPressed, widget.onLongPress);
  //     CAPIBloC.I.add(CAPIEvent.createdSnippet(
  //       newNode: sNode,
  //     ));
  //   }
  //   return sNode;
  // }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('sName', snippetName, defaultValue: ''));
  }
}

class SnippetPanelState extends State<SnippetPanel> with TickerProviderStateMixin {
  late String snippetNameToUse;
  TabController? tabC; // used when a TabBar and TabBarView are used in a snippet's Scaffold
  late Queue<int> _tabQ;

  TransformableScaffoldState? get parentTSState => TransformableScaffold.of(context);

  // if root already exists, return it.
  // If not, and a template name supplied, create a named copy of that template.
  // If not, just create a snippet that comprises a PlaceholderNode.
  SnippetRootNode getOrCreateSnippetFromTemplate() {
    SnippetRootNode? snippetRootNode = CAPIState.rootNodeOfNamedSnippet(widget.snippetName);
    // possibly create new root snippet, which will have a scaffold, appbar and a tabbar for a main menu
    if (snippetRootNode == null && (widget.fromTemplate?.isNotEmpty ?? false)) {
      snippetRootNode = SnippetPanel.templates.firstWhere((rootNode) => rootNode.name == widget.fromTemplate).cloneSnippet();
      snippetRootNode.name = widget.snippetName;
    } else {
      snippetRootNode ??= SnippetRootNode(name: widget.snippetName, child: PlaceholderNode()).cloneSnippet();
      snippetRootNode.name = widget.snippetName;
    }
    CAPIState.snippetsMap[widget.snippetName] = snippetRootNode;
    // CAPIBloC.I.add(CAPIEvent.createdSnippet(newSnippetNode: rootNode));

    return snippetRootNode;
  }

  // int countTabs() {
  //   SnippetRootNode? rootNode = CAPIBloC.I.state.rootNode("root");
  //   if (rootNode == null) return 0;
  //   TabBarNode? tabBarNode = CAPIBloC.I.state.snippetBeingEdited?.treeC.findNodeTypeInTree(rootNode, TabBarNode) as TabBarNode?;
  //   return tabBarNode?.children.length ?? 0;
  // }

  void createTabController(int numTabs) {
    tabC?.dispose();
    tabC = TabController(vsync: this, length: numTabs);
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

    snippetNameToUse = widget.snippetName;

    // register snippet? with panel
    CAPIState.snippetPlacementMap[widget.panelName] = snippetNameToUse;

    _tabQ = Queue<int>();
  }

  // @override
  // void didChangeDependencies() {
  //   Useful.instance.initWithContext(context, force: true);
  //   super.didChangeDependencies();
  // }

  // Widget _pencilIconButton(BuildContext ctx) => Positioned(
  //       top: 2,
  //       right: 2,
  //       child: Container(
  //         width: 20,
  //         height: 20,
  //         color: Colors.white.withOpacity(.5),
  //         child: Center(
  //           child: IconButton(
  //             onPressed: () {
  //               if (CAPIBloC.I.state.snippetsBeingEdited.isEmpty) {
  //                 //   Node.unhighlightSelectedNode();
  //                 //   //CAPIBloc.I.add(CAPIEvent.hideSnippetTree(save: true));
  //                 //   if (Callout.anyPresent([widget.sName.hashCode])) {
  //                 //     removeSnippetTreeCallout(widget.sName);
  //                 //   }
  //                 // } else {
  //                 hideAllSingleTargetBtns();
  //                 // CAPIBloc.I.add(const CAPIEvent.hideAllTargetGroupBtns());
  //                 // CAPIBloc.I.add(const CAPIEvent.hideTargetGroupsExcept());
  //                 CAPIBloC.I.add(CAPIEvent.pushSnippetTree(snippetBloc: snippetBloc));
  //                 //possibly show snippet tree in a callout
  //                 // showSnippetTreeCallout(
  //                 //   // context: context,
  //                 //   snippetName: widget.sName,
  //                 //   targetGKF: () => snippetPanelGK,
  //                 //   onChangedF: () {},
  //                 //   allowButtonCallouts: widget.allowButtonCallouts,
  //                 // );
  //                 CalloutState? state = Callout.of(ctx);
  //                 state?.toggle();
  //               }
  //             },
  //             padding: EdgeInsets.zero,
  //             icon: CAPIBloC.I.state.hideSnippetPencilIcons
  //                 ? const Offstage()
  //                 : Tooltip(
  //                     message: widget.sName,
  //                     child: const Icon(
  //                       Icons.edit,
  //                       color: Colors.purpleAccent,
  //                       size: 20,
  //                     ),
  //                   ),
  //           ),
  //         ),
  //       ),
  //     );

  // static CalloutConfig snippetTreeCalloutConfig(SnippetBloC snippetBloc) {
  //   double width() {
  //     // if (root?.child == null) return 190;
  //     double w = min(CAPIBloC.I.state.snippetTreeCalloutW ?? 400, 600);
  //     return w > 0 ? w : 400;
  //   }
  //
  //   double height() {
  //     // if (root?.child == null) return 60;
  //     // int numNodes = root != null ? bloc.state.snippetTreeC.countNodesInTree(root) : 0;
  //     // double h = numNodes == 0 ? min(bloc.state.snippetTreeCalloutH ?? 400, 600) : numNodes * 60;
  //     double h = min(CAPIBloC.I.state.snippetTreeCalloutH ?? 400, Useful.scrH - 50);
  //     return h > 0 ? h : 400;
  //   }
  //
  //   return CalloutConfig(
  //     feature: snippetBloc.rootNode?.name ?? "snippet name ?!",
  //     // frameTarget: true,
  //     // barrier: CalloutBarrier(
  //     //   opacity: .1,
  //     //   // closeOnTapped: false,
  //     //   // hideOnTapped: true,
  //     // ),
  //     // onDismissedF: () {
  //     //   CAPIState.snippetStateMap[snippetBloc.snippetName] = snippetBloc.state;
  //     //   STreeNode.unhighlightSelectedNode();
  //     //   Callout.dismiss('selected-panel-border-overlay');
  //     //   CAPIBloC.I.add(const CAPIEvent.unhideAllTargetGroups());
  //     //   CAPIBloC.I.add(const CAPIEvent.popSnippetBloc());
  //     //   // removeNodePropertiesCallout();
  //     //   Callout.dismiss(TREENODE_MENU_CALLOUT);
  //     //   MaterialAppWrapper.showAllPinkSnippetOverlays();
  //     //   if (snippetBloc.state.canUndo()) {
  //     //     CAPIBloC.I.add(const CAPIEvent.saveModel());
  //     //   }
  //     // },
  //     // onHiddenF: () {
  //     //   STreeNode.unhighlightSelectedNode();
  //     //   CAPIBloC.I.add(const CAPIEvent.unhideAllTargetGroups());
  //     //   Callout.dismiss(TREENODE_MENU_CALLOUT);
  //     //   MaterialAppWrapper.showAllPinkSnippetOverlays();
  //     //   if (snippetBloc.state.canUndo()) {
  //     //     CAPIBloC.I.add(const CAPIEvent.saveModel());
  //     //   }
  //     // },
  //     suppliedCalloutW: width(),
  //     suppliedCalloutH: height(),
  //     //calloutH ?? 500,
  //     // barrierOpacity: .1,
  //     // arrowType: ArrowType.POINTY,
  //     // color: Colors.purpleAccent.shade100,
  //     roundedCorners: 16,
  //     // initialCalloutPos: bloc.state.snippetTreeCalloutInitialPos,
  //     finalSeparation: 40,
  //     // onBarrierTappedF: () async {
  //     //   // also check whether any snippet change
  //     //   var newSnippetMap = CAPIBloc.getSnippetJsonsFromTree(bloc.state.snippetTreeC);
  //     //   bool changeOccurred = true || !mapEquals(originalSnippetMap, newSnippetMap) || originalClipboardJson != bloc.state.jsonClipboard;
  //     //   bloc.add(CAPIEvent.hideSnippetTree(save: changeOccurred));
  //     //   removeSnippetTreeCallout(snippetName);
  //     //   onClosedF.call();
  //     // },
  //     // draggable: false,
  //     dragHandleHeight: 40,
  //     resizeableH: true,
  //     resizeableV: true,
  //     onResize: (newSize) {
  //       //TODO - fix
  //       // bloc.add(CAPIEvent.changedSnippetTreeCalloutSize(newW: newSize.width, newH: newSize.height));
  //     },
  //     onDragStartedF: () {
  //       snippetBloc.state.selectedNode?.hidePropertiesWhileDragging = true;
  //     },
  //     onDragEndedF: (_) {
  //       snippetBloc.state.selectedNode?.hidePropertiesWhileDragging = false;
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // panel name is always supplied, but snippet name can be omitted,
    // in which case a default snippet name is used: Snippet[pName].
    // But first, see if there's an entry in the placement map, in which case we use that snippet name.
    if (CAPIState.snippetPlacementMap.containsKey(widget.panelName)) {
      snippetNameToUse = CAPIState.snippetPlacementMap[widget.panelName]!;
    }
    // in case no entry found in panel map nor a snippet name supplied, use/create a default snipper for this panel.
    SnippetRootNode snippetRoot = getOrCreateSnippetFromTemplate();

    // TODO no BloC when user not able to edit ?
    return BlocBuilder<CAPIBloC, CAPIState>(
      key: CAPIState.panelGkMap[widget.panelName] = GlobalKey(debugLabel: 'Panel[${widget.panelName}]'),
      // buildWhen: (previous, current) => current.snippetBeingEdited?.snippetName == widget.sName,
      builder: (innerContext, state) {
        try {
          return snippetRoot.toWidget(innerContext, null);
        } catch (e) {
          print('snippetRoot.toWidget() failed!');
          return Material(
            textStyle: const TextStyle(fontFamily: 'monospace', fontSize: 12),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const Icon(Icons.error, color: Colors.redAccent),
                  hspacer(10),
                  Useful.coloredText(e.toString()),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

//   @override
//   Widget build2(BuildContext context) {
//     return FutureBuilder<Widget?>(
//       future: snippetWidgetFuture,
//       builder: (context, snapshot) => snapshot.connectionState != ConnectionState.done
//           ? const Placeholder(
//               fallbackWidth: 595,
//               fallbackHeight: 842,
//             )
// //      Offstage() //const CircularProgressIndicator(backgroundColor: Colors.purpleAccent)
//           : snapshot.hasData
//               ? NotificationListener<SizeChangedLayoutNotification>(
//                   onNotification: (SizeChangedLayoutNotification notification) {
//                     // print("Snippet SizeChangedLayoutNotification - ${widget.sName}");
//                     return true;
//                   },
//                   child: SizeChangedLayoutNotifier(
//                     child: BlocBuilder<CAPIBloc, CAPIState>(builder: (context, state) {
//                       // either get snippet node from treeC, or create it now
//                       Widget snippetW = snapshot.data ?? const Icon(Icons.report_problem, color: Colors.red);
//                       return Stack(
//                         children: [
//                           ConstrainedBox(
//                             constraints: const BoxConstraints(
//                               minWidth: 40,
//                               minHeight: 40,
//                             ),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 border: Border.all(width: 1, color: Colors.purpleAccent, style: BorderStyle.solid),
//                               ),
//                               child: snippetW,
//                             ),
//                           ),
//                           if (kDebugMode) _pencilIconButton(),
//                         ],
//                       );
//                     }),
//                   ),
//                 )
//               : const Icon(Icons.report_problem, color: Colors.red),
//     );
//   }
