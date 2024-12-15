import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/snodes/algc_node.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gap/gap.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

import 'snodes/fs_image_node.dart';

part 'snode.mapper.dart';

// Map<Type, List<String>> nodeTypeTagMap = {
//   TextNode: ["sm-text"],
//   RichTextNode: ["sm-text"],
//   TextSpanNode: ["sm-text"],
//   WidgetSpanNode: ["sm-text"],
//   MenuItemButtonNode: ["sm-menu"],
//   AssetImageNode: ["sm-image"],
//   AspectRatioNode: ["sm-image"],
//   IFrameNode: ["sm-files"],
//   GoogleDriveIFrameNode: ["sm-files"],
//   FileNode: ["sm-files"],
//   TargetWrapperNode: ["mi"],
//   GapNode: ["sm-flex"],
//   //
//   ContainerNode: ["sm-containers"],
//   SizedBoxNode: ["sm-containers"],
//   CenterNode: ["sm-containers"],
//   PaddingNode: ["sm-containers"],
//   PlaceholderNode: ["sm-containers"],
//   DefaultTextStyleNode: ["sm-text"],
//
//   ExpandedNode: ["sm-flex"],
//   FlexibleNode: ["sm-flex"],
//   PositionedNode: ["sm-containers"],
//   AlignNode: ["mi"],
//   //SnippetNode: ["mi"],
//   SnippetRefNode: ["sm-snippets"],
//   //
//   ElevatedButtonNode: ["sm-button"],
//   OutlinedButtonNode: ["sm-button"],
//   TextButtonNode: ["sm-button"],
//   FilledButtonNode: ["sm-button"],
//   IconButtonNode: ["sm-button"],
//   //
//   RowNode: ["sm-flex"],
//   ColumnNode: ["sm-flex"],
//   StackNode: ["sm-containers"],
//   DirectoryNode: ["sm-files"],
//   SplitViewNode: ["mi"],
//   MenuBarNode: ["sm-menu"],
//   SubmenuButtonNode: ["sm-menu"],
//   CarouselNode: ["sm-image"],
//   //
//   PollNode: ['multi-child', 'mi'],
//   PollOptionNode: ['childless', 'mi'],
// };

// Map<Type, List<Type>> submenuTypes = {
//   FlexNode: flexSubClasses,
//   ButtonNode: buttonSubClasses,
//   MenuBarNode: [MenuBarNode, SubmenuButtonNode, MenuItemButtonNode],
//   RichTextNode: [RichTextNode, TextSpanNode, WidgetSpanNode],
// };

const List<Type> childlessSubClasses = [
  AlgCNode,
  AssetImageNode,
  ChipNode,
  FileNode,
  FirebaseStorageImageNode,
  FSImageNode,
  GapNode,
  GoogleDriveIFrameNode,
  IFrameNode,
  MarkdownNode,
  PlaceholderNode,
  PollOptionNode,
  RichTextNode,
  StepNode,
  TextNode,
  UMLImageNode,
  YTNode,
];

const List<Type> singleChildSubClasses = [
  AlignNode,
  AspectRatioNode,
  ButtonNode,
  CenterNode,
  ContainerNode,
  DefaultTextStyleNode,
  ExpandedNode,
  FlexibleNode,
  GenericSingleChildNode,
  HotspotsNode,
  PaddingNode,
  PositionedNode,
  SingleChildScrollViewNode,
  SizedBoxNode,
  SnippetRootNode,
];

const List<Type> multiChildSubClasses = [
  CarouselNode,
  DirectoryNode,
  FlexNode,
  GenericMultiChildNode,
  MenuBarNode,
  PollNode,
  SplitViewNode,
  StackNode,
  StepperNode,
  SubmenuButtonNode,
  TabBarNode,
  TabBarViewNode,
  WrapNode,
];

const List<Type> buttonSubClasses = [
  ElevatedButtonNode,
  OutlinedButtonNode,
  TextButtonNode,
  FilledButtonNode,
  IconButtonNode,
  MenuItemButtonNode,
  // // TargetButtonNode,
  // HotspotsNode,
];

const List<Type> flexSubClasses = [
  RowNode,
  ColumnNode,
];

enum NodeAction {
  replaceWith("replace with ..."),
  addChild("append child ..."),
  wrapWith("wrap with ..."),
  addSiblingBefore("insert sibling before ..."),
  addSiblingAfter("insert sibling after ...");

  const NodeAction(this.displayName);

  final String displayName;
}

@MappableClass(discriminatorKey: 'snode', includeSubClasses: [
  ScaffoldNode,
  AppBarNode,
  CL,
  SC,
  MC,
  InlineSpanNode,
])
abstract class STreeNode extends Node with STreeNodeMappable {
  String uid = UniqueKey().toString();

  // GlobalKey? gk;
  PTreeNodeTreeController? _pTreeC;
  ScrollController? _propertiesPaneSC;
  List<PTreeNode>? _properties;

  @JsonKey(includeFromJson: false, includeToJson: false)
  bool isExpanded = false;

  @JsonKey(includeFromJson: false, includeToJson: false)
  Rect? measuredRect;

  PTreeNodeTreeController pTreeC(BuildContext context) {
    // var prevExpansions = _pTreeC?.expandedNodes;
    // for (PTreeNode node in prevExpansions??[]) {
    //   fco.logi(node.name);
    // }
    _pTreeC ??= PTreeNodeTreeController(
      roots: _properties ??= properties(context),
      childrenProvider: Node.propertyTreeChildrenProvider,
    );
    // if (prevExpansions != null) {
    //   //_pTreeC!.expandedNodes = prevExpansions;
    //   for (PTreeNode node in prevExpansions) {
    //     _pTreeC!.setExpansionState(node, true);
    //   }
    // }
    _pTreeC!.rebuild;
    return _pTreeC!;
  }

  double propertiesPaneScrollPos() => propertiesPaneSC().offset;

  ScrollController propertiesPaneSC() =>
      _propertiesPaneSC ??= ScrollController();

  // FCO get fc => FCO;

  // ..addListener(() {
  //   propertiesPaneScrollPos =
  // });

  @JsonKey(includeFromJson: false, includeToJson: false)
  bool? hidePropertiesWhileDragging;

  @JsonKey(includeFromJson: false, includeToJson: false)
  GlobalKey? nodeWidgetGK; // gets used in toWidget()

  SnippetRootNode? rootNodeOfSnippet() =>
      findNearestAncestor<SnippetRootNode>();

  List<PTreeNode> properties(BuildContext context);

  // // selection always uses this gk
  // static GlobalKey get selectedWidgetGK {
  //   if (_selectedWidgetGK.currentState == null) return _selectedWidgetGK;
  //   fco.logi("selectionGK in use: ${_selectedWidgetGK.currentWidget.runtimeType}");
  //   return GlobalKey(debugLabel: 'selectionGK was in use');
  // }
  //
  // static final GlobalKey _selectedWidgetGK = GlobalKey(debugLabel: "selectionGK");

  static double BORDER = 4;

  void showTappableNodeWidgetOverlay({
    bool whiteBarrier = false,
    ScrollControllerName? scName,
  }) {
    if (measuredRect == null) return;

    // overlay rect with a transparent pink rect, and a 3px surround
    String feature = '${nodeWidgetGK.hashCode}-pink-overlay';
    Rect borderRect = measuredRect!; //_borderRect(measuredRect!);
    CalloutConfig cc = _cc(
      cId: feature,
      borderRect: borderRect,
      whiteBarrier: whiteBarrier,
      scName: scName,
    );
    fco.showOverlay(
      ensureLowestOverlay: false,
      calloutContent: PointerInterceptor(
        intercepting: true,
        child: Tooltip(
          message: 'tap to edit this ${toString()} node',
          child: InkWell(
            onTap: () => _tappedToEditSnipperNode(scName),
            child: Container(
              width: borderRect.width.abs(),
              height: borderRect.height.abs(),
              decoration: _decoration(transparent: true),
              // decoration: BoxDecoration(
              //   border: Border.all(
              //       width: 2,
              //       color: Colors.purpleAccent,
              //       style: BorderStyle.solid),
              // ),              // decoration: DottedDecoration(
              //   shape: Shape.box,
              //   dash: const <int>[4, 3],
              //   borderColor: Colors.purpleAccent,
              //   strokeWidth: 3,
              //   // fillColor: Colors.transparent,
              //   fillGradient: LinearGradient(colors: [Colors.white, Colors.yellowAccent]),
              // ),
            ),
          ),
        ),
      ),
      calloutConfig: cc,
      targetGkF: () => nodeWidgetGK,
    );
  }

  void _tappedToEditSnipperNode(ScrollControllerName? scName) {
    // fco.logi("${toString()} tapped");
    SnippetRootNode? rootNode = (this is SnippetRootNode)
        ? this as SnippetRootNode
        : rootNodeOfSnippet();
    SnippetName? snippetName = rootNode?.name;
    if (snippetName == null) return;
    // maybe a page snippet, so check name in appInfo: maybe prefix with /
    // var names = fco.appInfo.snippetNames;
    if (fco.appInfo.snippetNames.contains('/$snippetName')) {
      snippetName = '/$snippetName';
    }
    // var cc = nodeWidgetGK?.currentContext;
// edit the root snippet
//             hideAllSingleTargetBtns();
// FCO.capiBloc.add(const CAPIEvent.hideAllTargetGroupBtns());
// FCO.capiBloc.add(const CAPIEvent.hideTargetGroupsExcept());
    EditablePage.removeAllNodeWidgetOverlays();
// actually push node parent, then select node - more user-friendly
    // tapped a real widget with GlobalKey of nodeWidgetGK
    // var tappedNodeName = nodeTypeName;
    // var cs = nodeWidgetGK?.currentState;
    // var cc = nodeWidgetGK?.currentContext;
    // bool isMOunted = cc?.mounted ?? false;
    // var cw = nodeWidgetGK?.currentWidget;

    double savedOffset =
        NamedScrollController.scrollOffset(scName);

    pushThenShowNamedSnippetWithNodeSelected(
      snippetName,
      this,
      this,
      scName: scName,
    );
    fco.afterMsDelayDo(1300, () {
      // restore scroll offset
      NamedScrollController.restoreOffsetTo(scName, savedOffset);
    });
  }

  // void _tappedToExitEditMode() {
  //   fco.inEditMode.value = false;
  //   EditablePage.removeAllNodeWidgetOverlays();
  // }

  void showNodeWidgetOverlay({
    bool whiteBarrier = false,
    bool skipMeasure = false,
    ScrollControllerName? scName,
  }) {
    fco.dismiss('pink-border-overlay-non-tappable');
    Rect? r = !skipMeasure
        ? nodeWidgetGK?.globalPaintBounds(
            skipWidthConstraintWarning: true, skipHeightConstraintWarning: true)
        : measuredRect;
    if (r != null) {
      Rect borderRect = r; //_borderRect(r);
      CalloutConfig cc = _cc(
        cId: 'pink-border-overlay-non-tappable',
        borderRect: borderRect,
        whiteBarrier: whiteBarrier,
        scName: scName,
      );
      fco.showOverlay(
        ensureLowestOverlay: true,
        calloutContent: PointerInterceptor(
          child: Container(
            width: cc.calloutW,
            height: cc.calloutH,
            decoration: _decoration(transparent: false),
          ),
        ),
        calloutConfig: cc,
        targetGkF: () => nodeWidgetGK,
      );
    }
  }

  // Rect _borderRect(Rect nodeRect) {
  //   Rect restrictedRect = fco.restrictRectToScreen(nodeRect);
  //   double borderLeft = max(restrictedRect.left,;
  //   double borderTop = max(restrictedRect.top, 0);
  //   double borderRight = min(fco.scrW, restrictedRect.right + BORDER);
  //   double borderBottom = min(fco.scrH, restrictedRect.bottom + BORDER);
  //   return Rect.fromLTRB(borderLeft, borderTop, borderRight, borderBottom);
  // }

  CalloutConfig _cc({
    required String cId,
    required Rect borderRect,
    bool whiteBarrier = false,
    ScrollControllerName? scName,
  }) =>
      CalloutConfig(
        cId: cId,
        initialCalloutW: borderRect.width.abs(),
        // + BORDER,
        initialCalloutH: borderRect.height.abs(),
        // + BORDER,
        initialCalloutPos: borderRect.topLeft,
        //.translate(-BORDER, -BORDER),
        fillColor: Colors.transparent,
        arrowType: ArrowType.NONE,
        barrier: whiteBarrier
            ? CalloutBarrier(
                opacity: .5,
                color: Colors.white,
                onTappedF: () {
                  fco.dismissAll();
                },
              )
            : null,
        draggable: false,
        scrollControllerName: scName,
        skipOnScreenCheck: true,
      );

  Decoration _decoration({bool transparent = true}) => BoxDecoration(
        shape: BoxShape.rectangle,
        color: transparent
            ? Colors.transparent
            : Colors.purpleAccent.withOpacity(.2),
        border: GradientBoxBorder(
          gradient: LinearGradient(colors: [
            Colors.purpleAccent.withOpacity(.5),
            Colors.yellowAccent.withOpacity(.5),
            Colors.grey.withOpacity(.5),
            Colors.purpleAccent.withOpacity(.5),
            Colors.purpleAccent.withOpacity(.5),
            Colors.purpleAccent.withOpacity(.5),
            Colors.purpleAccent.withOpacity(.5),
            Colors.purpleAccent.withOpacity(.5),
            Colors.purpleAccent.withOpacity(.5),
            Colors.grey.withOpacity(.5),
            Colors.yellowAccent.withOpacity(.5),
            Colors.purpleAccent.withOpacity(.5),
          ]),
          width: BORDER,
        ),
      );

  // node is where the snippet tree starts (not necc the snippet's root node)
  // selection is poss a current (lower) selection in the tree
  static Future<void> pushThenShowNamedSnippetWithNodeSelected(
    SnippetName snippetName,
    STreeNode startingAtNode,
    STreeNode selectedNode, {
    TargetModel? targetBeingConfigured,
    ScrollControllerName? scName,
  }) async {
    debugPrint(
        "pushThenShowNamedSnippetWithNodeSelected($snippetName, ${selectedNode.toString()})");
    STreeNode? highestNode;
    if (startingAtNode is SnippetRootNode) {
      highestNode = startingAtNode.child; //JIC
    } else if (startingAtNode is ScaffoldNode) {
      highestNode = startingAtNode;
    } else {
      highestNode = (startingAtNode.getParent() ?? startingAtNode) as STreeNode;
    }
    // var b = startingAtNode.nodeWidgetGK?.currentContext?.mounted;

    SnippetInfoModel? snippetInfo = SnippetInfoModel.cachedSnippet(snippetName);
    if (snippetInfo == null) return;

    SnippetRootNode? rootNode = await snippetInfo.currentVersionFromCacheOrFB();
    if (rootNode == null) return;
    FlutterContentApp.capiBloc.add(CAPIEvent.pushSnippetEditor(
      rootNode: rootNode,
      visibleDecendantNode: highestNode,
    ));
    // fco.afterNextBuildDo(() {
    // });
    // return;
    // fco.logi('after pushSnippetBloc');
    // var b = startingAtNode.nodeWidgetGK?.currentContext?.mounted;
    fco.afterNextBuildDo(() {
      fco.inEditMode.value = true;
      // var nodeGK = startingAtNode.nodeWidgetGK;

      // var tappedNodeName = nodeGK;
      // var cs = nodeGK?.currentState;
      // var cc = nodeGK?.currentContext;
      // bool isMOunted = cc?.mounted ?? false;
      // var cw = nodeGK?.currentWidget;

      if (FlutterContentApp.snippetBeingEdited != null) {
        FlutterContentApp.snippetBeingEdited?.treeC.expandAll();
        FlutterContentApp.snippetBeingEdited?.treeC.rebuild();
        // possibly show clipboard
        if (!fco.clipboardIsEmpty) {
          fco.showFloatingClipboard(scName);
        }
        fco.hide(CalloutConfigToolbar.CID);
        fco.showSnippetTreeAndPropertiesCallout(
          targetGKF: () => startingAtNode.nodeWidgetGK,
          onDismissedF: () {
// CAPIState.snippetStateMap[snippetBloc.snippetName] = snippetBloc.state;
            STreeNode.unhighlightSelectedNode();
            // fco.printFeatures();
            var pinkOverlayFeature = 'pink-border-overlay-non-tappable';
            // var currPageState = fco.currentPageState;

            // currPageState?.unhideFAB();
            fco.dismiss(pinkOverlayFeature);
            // unhide if present
            fco.unhide(CalloutConfigToolbar.CID);
            // fco.printFeatures();
            // FCO.capiBloc.add(const CAPIEvent.popSnippetBloc());
            // fco.dismiss(TREENODE_MENU_CALLOUT);
            fco.hideClipboard();
            debugPrint(
                "onDismissedF - $snippetName, ${selectedNode.toString()})");
            fco.inEditMode.value = false;
            FlutterContentApp.capiBloc.add(const CAPIEvent.popSnippetEditor());
            fco.afterNextBuildDo(() {
              NamedScrollController.restoreOffset(scName);
            });
            // skip if no change
            // String? jsonBeforePush =
            //     FlutterContentApp.snippetBeingEdited?.jsonBeforePush;
            // String? currentJsonS =
            //     FlutterContentApp.snippetBeingEdited?.rootNode.toJson();
            // if (jsonBeforePush == currentJsonS) return;
            // if (FlutterContentApp.snippetBeingEdited?.rootNode != null) {
            //   fco.cacheAndSaveANewSnippetVersion(
            //     snippetName: snippetName,
            //     rootNode: FlutterContentApp.snippetBeingEdited!.rootNode,
            //   );
            // }
            // fco.afterNextBuildDo(() {
            // });
            // FCO.capiBloc.add(
            //       CAPIEvent.saveSnippet(
            //         snippetRootNode: FCO.snippetBeingEdited!.rootNode,
            //         newVersionId: newVersionId,
            //       ),
            //     );
            //  fco.afterMsDelayDo(2000, (){
            //   bool toolbarPresent = fco.anyPresent([CalloutConfigToolbar.CID]);
            //   if (toolbarPresent) {
            //     hideAllTargetBtns();
            //     hideAllTargetCovers();
            //   }
            // });
          },
          startingAtNode: startingAtNode,
          selectedNode: selectedNode,
          targetBeingConfigured: targetBeingConfigured,
          scName: scName,
        );

        // FlutterContentApp.capiBloc.add(CAPIEvent.selectNode(
        //   node: selectedNode,
        //   // imageTC: tc,
        //   // selectedWidgetGK: GlobalKey(debugLabel: 'selectedWidgetGK'),
        //   // selectedTreeNodeGK: GlobalKey(debugLabel: 'selectedTreeNodeGK'),
        // ));
        fco.afterNextBuildDo(() {
          EditablePage.removeAllNodeWidgetOverlays();
          selectedNode.showNodeWidgetOverlay(skipMeasure: true);
          // create selected node's properties tree
        });

        // set the properties tree
        // final List<PTreeNode> propertyNodes = sel.properties(context);
        // // get a new treeController only when snippet selected
        // sel.pTreeC ??= PTreeNodeTreeController(
        //   roots: propertyNodes,
        //   childrenProvider: Node.propertyTreeChildrenProvider,
        // );
        // //showTreeNodeMenu(context, () => STreeNode.selectionGK);
        // // snippetBloc.state.treeC.expand(snippetBloc.state.treeC.roots.first);
        // sel.propertiesPaneSC ??= ScrollController()
        //   ..addListener(() {
        //     sel.propertiesPaneScrollPos = sel.propertiesPaneSC?.offset ?? 0.0;
        //   });

// select node
        // TODO move to callout .onReady
        //capiBloc.add(const CAPIEvent.forceRefresh());
// var nodeCtx = node.nodeWidgetGK?.currentContext;
// Scrollable.ensureVisible(context);
      }
    });
  }

  void refreshWithUpdate(VoidCallback assignF,
      {bool alsoRefreshPropertiesView = false}) {
    // FlutterContentApp.capiState.snippetBeingEdited?.newVersion();

    assignF.call();
    fco.forceRefresh();
    fco.afterNextBuildDo(() {
      fco.saveNewVersion(snippet: rootNodeOfSnippet());
      FlutterContentApp.selectedNode?.showNodeWidgetOverlay();
    });
  }

  //
  // List<Widget> wrapWithCandidates(final BuildContext context, final STreeNode? parentNode, ValueChanged<Type> onPressed) {
  //   List<Type> candidateTypes = [];
  //   for (Type nodeType in nodeTypeTagMap.keys) {
  //     List<String>? typeTags = nodeTypeTagMap[nodeType];
  //     if (singleChildSubClasses.contains(nodeType) || multiChildSubClasses.contains(nodeType)) {
  //       candidateTypes.add(nodeType);
  //     }
  //   }
  //   // if (this is DirectoryNode && parentNode is DirectoryNode) {
  //   //   candidateTypes = [DirectoryNode];
  //   // } else if (this is FileNode) {
  //   //   candidateTypes = [DirectoryNode];
  //   // } else if (this is PositionedNode) {
  //   //   candidateTypes = [StackNode];
  //   // } else if (this is WidgetSpanNode) {
  //   //   candidateTypes = [TextSpanNode];
  //   // } else if (this is ExpandedNode || this is FlexibleNode) {
  //   //   candidateTypes = [RowNode, ColumnNode];
  //   // } else {
  //   //   candidateTypes.addAll([
  //   //     ...singleChildSubClasses,
  //   //     FlexNode,
  //   //     StackNode,
  //   //     DirectoryNode,
  //   //     SplitViewNode,
  //   //     MenuBarNode,
  //   //     RichTextNode,
  //   //   ]);
  //   // }
  //   if (parentNode is! FlexNode) {
  //     candidateTypes..remove(ExpandedNode)..remove(FlexibleNode);
  //   }
  //   if (this is MenuBarNode) {
  //     candidateTypes..remove(MenuBarNode)..remove(SubmenuButtonNode)..remove(MenuItemButton);
  //   }
  //   if (this is PollOptionNode) {
  //     candidateTypes = [];
  //   }
  //   return toMenuItems(context, nodeTypeCandidates: candidateTypes, onPressedF: onPressed);
  // }

  // List<Widget> siblingCandidates(final BuildContext context, final STreeNode? parentNode, AddAction action, ValueChanged<Type> onPressed) {
  //   List<Type> candidateTypes = [];
  //   MenuItemButton? pasteMI = _pasteMI(context, action);
  //   for (Type nodeType in nodeTypeTagMap.keys) {
  //        candidateTypes.add(nodeType);
  //   }
  //   if (parentNode is! FlexNode) candidateTypes.remove(ExpandedNode);
  //   if (this is MenuBarNode || parentNode is MenuBarNode) candidateTypes.remove(MenuBarNode);
  //   List<Widget> mis = toMenuItems(context, nodeTypeCandidates: candidateTypes, pasteMI: pasteMI, onPressedF: onPressed);
  //   _addSnippetsSubmenu(mis, action);
  //   return mis;
  // }

  // List<Widget> childCandidates(final BuildContext context, final STreeNode? parentNode, AddAction action, ValueChanged<Type> onPressed) {
  //   List<Type> candidateTypes = nodeTypeTagMap.keys.toList();
  //   MenuItemButton? pasteMI = _pasteMI(context, action);
  //   if (this is! FlexNode) {
  //     candidateTypes..remove(ExpandedNode)..remove(FlexibleNode);
  //   }
  //   if (this is! StackNode) candidateTypes.remove(PositionedNode);
  //   if (this is MenuBarNode || this is SubmenuButtonNode || this is MenuItemButtonNode) candidateTypes.remove(MenuBarNode);
  //   if (this is! PollNode) candidateTypes.remove(PollOptionNode);
  //   if (this is PollNode) candidateTypes = [PollOptionNode];
  //   List<Widget> mis = toMenuItems(context, nodeTypeCandidates: candidateTypes, pasteMI: pasteMI, onPressedF: onPressed);
  //   if (this is! PollNode) {
  //     _addSnippetsSubmenu(mis, action);
  //   }
  //   return mis;
  // }

  bool canBeDeleted() {
    if (this is StepNode) return true;
    if (this is PollOptionNode) return true;
    if (this is MC && (this as MC).children.length > 1) return false;
    ScaffoldNode? scaffold = findNearestAncestor<ScaffoldNode>();
    // if (this is RichTextNode) return false;
    if (scaffold?.appBar?.bottom?.child is TabBarNode) {
      TabBarNode? tabBar = scaffold?.appBar?.bottom?.child as TabBarNode?;
      TabBarViewNode? tabBarView = scaffold?.body?.child as TabBarViewNode?;
      var firstTab = tabBar?.children.firstOrNull;
      var firstTabView = tabBar?.children.firstOrNull;
      int numTabs = tabBar?.children.length ?? 99;
      int numTabBiews = tabBarView?.children.length ?? 99;
      if (firstTab == this && numTabs < 2) {
        return false;
      }
      if (firstTabView == this && numTabBiews < 2) {
        return false;
      }
    }
    if (this is MenuBarNode && scaffold?.appBar?.bottom?.child is MenuBarNode) {
      MenuBarNode menuBar = scaffold?.appBar?.bottom?.child as MenuBarNode;
      return menuBar.children.isEmpty;
    }
    return true;
  }

  bool get canShowTappableNodeWidgetOverlay => getParent() is! CarouselNode;

  bool hasChildren() =>
      (this is SC && (this as SC).child != null) ||
      (this is MC && (this as MC).children.isNotEmpty) ||
      (this is TextSpanNode &&
          ((this as TextSpanNode).children?.length ?? 0) > 0);

  // List<String> sensibleParents() => const [];

  GlobalKey createNodeGK() {
    // fco.logi('--- createNodeGK --- ${toString()}');
    nodeWidgetGK = GlobalKey(debugLabel: toString());
    if (fco.gkSTreeNodeMap.containsKey(nodeWidgetGK)) {
      print('Trying to use GlobalKey twice!');
    }
    fco.gkSTreeNodeMap[nodeWidgetGK!] = this;
    return nodeWidgetGK!;
  }

  void validateTree() {
    _setParents(null);
    //ensure no tabs have empty text
    if (this is TextNode &&
        (this as TextNode).text.isEmpty &&
        getParent() is TabBarNode) {
      (this as TextNode).text = 'new tab';
    }
    // ensure No. tabs matches No. tab views
    TabBarNode? tabBar = findDescendant(TabBarNode) as TabBarNode?;
    TabBarViewNode? tabBarView =
        findDescendant(TabBarViewNode) as TabBarViewNode?;
    if ((tabBar?.children.length ?? 0) > (tabBarView?.children.length ?? 0)) {
      tabBarView?.children.add(PlaceholderNode()..setParent(tabBarView));
    } else if ((tabBar?.children.length ?? 0) <
        (tabBarView?.children.length ?? 0)) {
      tabBar?.children.add(TextNode(text: ' fixed tab')..setParent(tabBar));
    }
    // bool doubleCheck = anyMissingParents();
    // fco.logi("missing parents: $doubleCheck");
    // if (tabBar != null) {
    //   fco.logi("TabBar: ${tabBar.children.length}, TabBarView: ${tabBarView?.children.length} views");
    // }
  }

  void _setParents(STreeNode? parent) {
    setParent(parent);
    var children = Node.snippetTreeChildrenProvider(this);
    for (STreeNode child in children) {
      child._setParents(this);
    }
  }

  bool anyMissingParents() {
    var children = Node.snippetTreeChildrenProvider(this);
    for (STreeNode child in children) {
      bool foundAMissingParent =
          child.getParent() != this || child.anyMissingParents();
      if (foundAMissingParent) {
        return true;
      }
    }
    return false;
  }

  bool isAScaffoldTabWidget() {
    return getParent() is TabBarNode &&
        getParent()?.getParent() is GenericSingleChildNode &&
        (getParent()?.getParent() as GenericSingleChildNode?)?.propertyName ==
            'bottom';
  }

  bool isAScaffoldTabViewWidget() =>
      getParent() is TabBarViewNode &&
      getParent()?.getParent() is GenericSingleChildNode &&
      (getParent()?.getParent() as GenericSingleChildNode?)?.propertyName ==
          'body';

  bool isAStepNodeTitleOrContentPropertyWidget() {
    var node = getParent()?.getParent();
    return node is StepNode && (node.title == this || node.content == this);
  }

  STreeNode? findDescendant(Type type) {
    //
    STreeNode? foundChild;

    void findMatchingChild(STreeNode parent) {
      bool keepSearching = true;
      for (STreeNode child in Node.snippetTreeChildrenProvider(parent)) {
        if (!keepSearching) return;
        if (child.runtimeType == type) {
          foundChild = child;
          keepSearching = false;
        } else {
          findMatchingChild(child);
        }
      }
    }

    //
    findMatchingChild(this);
    return foundChild;
  }

  List<STreeNode> findDescendantsOfType(Type type) {
    //
    List<STreeNode> foundNodes = [];

    void findMatchingDescendants(STreeNode node) {
      for (STreeNode child in Node.snippetTreeChildrenProvider(node)) {
        if (child.runtimeType == type) {
          foundNodes.add(child);
        } else {
          findMatchingDescendants(child);
        }
      }
    }

    //
    findMatchingDescendants(this);
    return foundNodes;
  }

  T? findNearestAncestor<T>() {
    //
    Node? node = getParent();

    while (node != null && node.runtimeType != T) {
      if (node != node.getParent()) {
        node = node.getParent();
      } else {
        return null;
      }
      // fco.logi(node.runtimeType.toString());
      // if (node.runtimeType == FSBucketNode) {
      //   print('x');
      // }
    }

    return node as T?;
  }

  static void hideAllTargetCovers({TargetModel? except}) {
    for (TargetModel tc in allTargets()) {
      tc.showCover = false;
      if (tc == except) {
        tc.showCover = true;
      }
    }
  }

  static void hideAllTargetBtns({TargetModel? except}) {
    for (TargetModel tc in allTargets()) {
      tc.showBtn = false;
      if (tc == except) {
        tc.showBtn = true;
      }
    }
  }

  static void showAllTargetCovers() {
    for (TargetModel tc in allTargets()) {
      tc.showCover = true;
    }
  }

  static void showAllTargetBtns() {
    for (TargetModel tc in allTargets()) {
      tc.showBtn = true;
    }
  }

  static List<TargetModel> allTargets() {
    // var fc = FC();
    List<TargetModel> foundTargets = [];
    for (SnippetName snippetName in SnippetInfoModel.cachedSnippetNames()) {
      // get published or editing version
      SnippetInfoModel? snippetInfo =
          SnippetInfoModel.cachedSnippet(snippetName);
      if (snippetInfo == null) return foundTargets;
      VersionId? versionId = snippetInfo.currentVersionId();
      if (versionId == null) return foundTargets;
      List<STreeNode> tws = snippetInfo
              .currentVersionFromCache()
              ?.findDescendantsOfType(HotspotsNode) ??
          [];
      for (STreeNode tw in tws) {
        foundTargets.addAll((tw as HotspotsNode).targets);
      }
    }
    return foundTargets;
  }

// check nodes are identical
  bool isSame(STreeNode otherNode) => toJson() == otherNode.toJson();

  Widget toWidget(BuildContext context, STreeNode? parentNode) =>
      const Placeholder();

  Widget possiblyCheckHeightConstraint(
      STreeNode? parentNode, Widget actualWidget) {
    /*
      use LayoutBuilder to check for infinite maxHeight error.
      skip the check if parent is a SizedBox or a SingleChildScrollView.
     */
    if (parentNode is SizedBoxNode || parentNode is SingleChildScrollViewNode) {
      return actualWidget;
    } else {
      return LayoutBuilder(
        builder: (context, constraints) {
          return constraints.maxHeight == double.infinity
              ? Row(
                  children: [
                    const Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                    const Gap(10),
                    Text('${toString()} has infinite maxHeight constraint!'),
                  ],
                )
              : actualWidget;
        },
      );
    }
  }

  static void unhighlightSelectedNode() =>
      fco.dismiss(SELECTED_NODE_BORDER_CALLOUT);

  Future<void> possiblyHighlightSelectedNode(ScrollControllerName? scName) async {
    return;
    if (FlutterContentApp.snippetBeingEdited?.selectedNode == this) {
      unhighlightSelectedNode();
      var gk = nodeWidgetGK;
      Rect? r = gk?.globalPaintBounds();
      if (r != null) {
        double thickness = 4;
        double w = r.width + thickness * 2;
        double h = r.height + thickness * 2;
        Offset translate = Offset(-thickness, -thickness);
        // fco.logi("Showing $SELECTED_NODE_BORDER_CALLOUT");
        fco.showOverlay(
          ensureLowestOverlay: true,
          calloutConfig: CalloutConfig(
            cId: SELECTED_NODE_BORDER_CALLOUT,
            initialCalloutPos: r.topLeft.translate(translate.dx, translate.dy),
            initialCalloutW: w,
            initialCalloutH: h,
            fillColor: Colors.transparent,
            arrowType: ArrowType.NONE,
            draggable: false,
            // transparentPointer: true,
            scrollControllerName: scName,
          ),
          calloutContent: InkWell(
            child: Container(
              width: w,
              height: h,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                    color: Colors.purpleAccent.withOpacity(.5),
                    width: thickness),
              ),
            ),
          ),
        );
        // FCO.snippetBeingEdited?.add(SnippetEvent.highlightNode(node: this));
      }
    }
  }

//   Future<void> possiblyHighlightSelectedNode() async {
//     if (FCO.selectedNode == this) {
//       if (true || FCO.highlightedNode != FCO.selectedNode) {
//         fco.afterNextBuildDo(() {
// // if (fco.anyPresent([SELECTED_NODE_BORDER_CALLOUT])) {
//           unhighlightSelectedNode();
// // }
//           SnippetBloC? snippetBloc = FCO.snippetBeingEdited;
//           var gk = snippetBloc?.state.selectedWidgetGK;
//           Rect? r = gk?.globalPaintBounds();
//           if (r != null) {
//             double thickness = 4;
//             double w = r.width + thickness * 2;
//             double h = r.height + thickness * 2;
//             Offset translate = Offset(-thickness, -thickness);
// // if (r.top < thickness || r.left < thickness || r.bottom < thickness || r.right < thickness) {
// //   w = r.width;
// //   h = r.height;
// //   thickness = 10;
// //   translate = Offset.zero;
// // }
//             fco.logi("Showing $SELECTED_NODE_BORDER_CALLOUT");
//             fco.showOverlay(
//               ensureLowestOverlay: true,
//               calloutConfig: CalloutConfig(
//                 cId: SELECTED_NODE_BORDER_CALLOUT,
//                 initialCalloutPos:
//                     r.topLeft.translate(translate.dx, translate.dy),
//                 initialCalloutW: w,
//                 initialCalloutH: h,
//                 fillColor: Colors.transparent,
//                 arrowType: ArrowType.NONE,
//                 draggable: false,
//                 transparentPointer: true,
//               ),
//               calloutContentF: (context) => InkWell(
// // onTap: () {
// //   // removeNodeMenuCallout();
// //   showNodePropertiesCallout(
// //     context: context,
// //     selectedNode: this,
// //     targetGKF: () => Node.selectionGK, //nodeGK,
// //   );
// // },
//                 child: Container(
//                   width: w,
//                   height: h,
//                   decoration: BoxDecoration(
//                     color: Colors.transparent,
//                     border: Border.all(
//                         color: Colors.purpleAccent.withOpacity(.5),
//                         width: thickness),
//                   ),
//                 ),
//               ),
//               // targetGkF: () => snippetBloc?.state.selectedWidgetGK!,
//             );
//             fc
//                 .snippetBeingEdited
//                 ?.add(SnippetEvent.highlightNode(node: this));
// // fco.afterMsDelayDo(1000, () {
// //   FCO.om.moveToTop("TreeNodeMenu".hashCode);
// // });
//           }
//         });
//       }
//     }
//   }

// can be a MenuItemButton (default) or a SubmenuButton (override)
// List<Widget> toMenuItems(BuildContext context, {
//   required List<Type> nodeTypeCandidates,
//   MenuItemButton? pasteMI,
//   ValueChanged<Type>? onPressedF,
// }) {
//   // fco.logi(nodeTypeCandidates.toString());
//   List<Widget> widgets = [];
//   //
//   if (pasteMI != null) widgets.add(pasteMI);
//   //
//   _addSubmenu(widgets, nodeTypeCandidates, "containers", onPressedF);
//   _addSubmenu(widgets, nodeTypeCandidates, "flex", onPressedF);
//   _addSubmenu(widgets, nodeTypeCandidates, "text", onPressedF);
//   _addSubmenu(widgets, nodeTypeCandidates, "menu", onPressedF);
//   _addSubmenu(widgets, nodeTypeCandidates, "files", onPressedF);
//   _addSubmenu(widgets, nodeTypeCandidates, "image", onPressedF);
//   _addSubmenu(widgets, nodeTypeCandidates, "button", onPressedF);
//   //
//   for (Type t in nodeTypeCandidates) {
//     if (nodeTypeTagMap[t]!.contains("mi")) {
//       widgets.add(MenuItemButton(
//         onPressed: () {
//           fco.dismiss(TREENODE_MENU_CALLOUT);
//           onPressedF?.call(t);
//         },
//         child: menuItemText(t, fontWeight: FontWeight.bold),
//       ));
//     }
//   }
//   return widgets;
// }

// void _addSubmenu(List<Widget> theWidgets, List<Type> nodeTypeCandidates, String tag, ValueChanged<Type>? onPressed) {
//   List<MenuItemButton> mis = [];
//   for (Type t in nodeTypeCandidates) {
//     if (nodeTypeTagMap[t]!.contains("sm-$tag")) {
//       mis.add(MenuItemButton(
//         onPressed: () => onPressed?.call(t),
//         child: menuItemText(t, fontWeight: FontWeight.bold),
//       ));
//     }
//   }
//   if (mis.length > 1) {
//     theWidgets.add(SubmenuButton(
//       menuChildren: mis,
//       child: Text(tag),
//     ));
//   } else if (mis.length == 1) {
//     theWidgets.add(mis.first);
//   }
// }

// void _addSnippetsSubmenu(List<Widget> theWidgets, AddAction action) {
//   List<MenuItemButton> snippetMIs = [];
//   List<String> snippetNames = capiBloc.state.snippetsMap.keys.toList()
//     ..sort();
//   for (String key in snippetNames) {
//     snippetMIs.add(
//       MenuItemButton(
//         onPressed: () {
//           SnippetBloC? snippetBloc = CAPIBloC.snippetBeingEdited;
//           if (action == AddAction.addSiblingBefore) {
//             snippetBloc?.add(SnippetEvent.addSiblingBefore(selectedNode: this, type: SnippetRefNode));
//             // removeNodePropertiesCallout();
//           } else if (action == AddAction.addSiblingAfter) {
//             snippetBloc?.add(SnippetEvent.addSiblingAfter(selectedNode: this, type: SnippetRefNode));
//             // removeNodePropertiesCallout();
//           } else if (action == AddAction.addChild) {
//             snippetBloc?.add(SnippetEvent.addChild(selectedNode: this, type: SnippetRefNode));
//             // removeNodePropertiesCallout();
//           }
//         },
//         child: Text(key),
//       ),
//     );
//   }
//   if (snippetMIs.length > 1) {
//     theWidgets.add(SubmenuButton(
//       menuChildren: snippetMIs,
//       child: const Text('Snippet'),
//     ));
//   } else if (snippetMIs.length == 1) {
//     theWidgets.add(snippetMIs.first);
//   }
// }

  String toSource(BuildContext context) => '';

// MenuItemButton? _pasteMI(BuildContext context, AddAction action) {
//   if (capiBloc.state.jsonClipboard != null && action != AddAction.wrapWith) {
//     return MenuItemButton(
//       onPressed: () {
//         CAPIBloC bloc = FCO.capiBloc;
//         String clipboardJson = bloc.state.jsonClipboard!;
//         STreeNode clipboardNode = STreeNodeMapper.fromJson(clipboardJson);
//         SnippetBloC? snippetBloc = bloc.state.snippetBeingEdited;
//         switch (action) {
//           case AddAction.addSiblingBefore:
//             snippetBloc?.add(SnippetEvent.pasteSiblingBefore(selectedNode: this, clipboardNode: clipboardNode));
//             break;
//           case AddAction.addSiblingAfter:
//             snippetBloc?.add(SnippetEvent.pasteSiblingAfter(selectedNode: this, clipboardNode: clipboardNode));
//             break;
//           case AddAction.addChild:
//             snippetBloc?.add(SnippetEvent.pasteChild(selectedNode: this, clipboardNode: clipboardNode));
//             break;
//           case AddAction.wrapWith:
//             break;
//         }
//         fco.dismiss(TREENODE_MENU_CALLOUT);
//       },
//       child: FCO.coloredText('paste from clipboard', color: Colors.blue),
//     );
//   }
//   return null;
// }

// MenuItemButton? _pasteMIOLD(BuildContext context, AddAction action) {
//   if (bloc.state.jsonClipboard != null && action != AddAction.wrapWith) {
//     return MenuItemButton(
//       onPressed: () {
//         CAPIBloc bloc = FCO.capiBloc;
//         String clipboardJson = bloc.state.jsonClipboard!;
//         Node clipboardNode = NodeMapper.fromJson(clipboardJson);
//         switch (action) {
//           case AddAction.addSiblingBefore:
//             bloc.add(CAPIEvent.pasteSiblingBefore(selectedNode: this, clipboardNode: clipboardNode));
//             break;
//           case AddAction.addSiblingAfter:
//             bloc.add(CAPIEvent.pasteSiblingBefore(selectedNode: this, clipboardNode: clipboardNode));
//             break;
//           case AddAction.addChild:
//             bloc.add(CAPIEvent.pasteChild(selectedNode: this, clipboardNode: clipboardNode));
//             break;
//           case AddAction.wrapWith:
//             break;
//         }
//         //fco.removeOverlayParentCallout(context, true);
//       },
//       child: Container(
//         margin: EdgeInsets.all(10),
//         width: 200,
//         height: 40,
//         child: boxChild(
//           bgColor: Colors.lightBlueAccent,
//           child: Center(
//             child: FCO.whiteText(
//               'paste from clipboard',
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//   return null;
// }

// Text menuItemText(Type type) {
//   String typeString = type.toString();
//   fco.logi(typeString);
//   return Text(typeString.substring(0, typeString.length - 4));
// }

// Widget menuItemText(Type type, {Color color = Colors.black, FontWeight? fontWeight}) => switch (type) {
//       const (AlignNode) => FCO.coloredText("Align", color: color, fontWeight: fontWeight),
//       const (AspectRatioNode) => FCO.coloredText("AspectRatio", color: color, fontWeight: fontWeight),
//       const (AssetImageNode) => FCO.coloredText("AssetImage", color: color, fontWeight: fontWeight),
//       const (CarouselNode) => FCO.coloredText("Carousel", color: color, fontWeight: fontWeight),
//       const (CenterNode) => FCO.coloredText("Center", color: color, fontWeight: fontWeight),
//       const (ColumnNode) => FCO.coloredText("Column", color: color, fontWeight: fontWeight),
//       const (ContainerNode) => FCO.coloredText("Container", color: color, fontWeight: fontWeight),
//       const (DefaultTextStyleNode) => FCO.coloredText("DefaultTextStyle", color: color, fontWeight: fontWeight),
//       const (DirectoryNode) => FCO.coloredText("Directory", color: color, fontWeight: fontWeight),
//       const (ElevatedButtonNode) => FCO.coloredText("ElevatedButton", color: color, fontWeight: fontWeight),
//       const (ExpandedNode) => FCO.coloredText("Expanded", color: color, fontWeight: fontWeight),
//       const (FileNode) => FCO.coloredText("File", color: color, fontWeight: fontWeight),
//       const (FilledButtonNode) => FCO.coloredText("FilledButton", color: color, fontWeight: fontWeight),
//       const (FlexibleNode) => FCO.coloredText("Flexible", color: color, fontWeight: fontWeight),
//       const (GapNode) => FCO.coloredText("Gap", color: color, fontWeight: fontWeight),
//       const (GoogleDriveIFrameNode) => FCO.coloredText("GoogleDriveIFrame", color: color, fontWeight: fontWeight),
//       const (IconButtonNode) => FCO.coloredText("IconButton", color: color, fontWeight: fontWeight),
//       const (IFrameNode) => FCO.coloredText("IFrame", color: color, fontWeight: fontWeight),
//       const (MenuBarNode) => FCO.coloredText("MenuBar", color: color, fontWeight: fontWeight),
//       const (MenuItemButtonNode) => FCO.coloredText("MenuItemButton", color: color, fontWeight: fontWeight),
//       // const (NetworkImageNode) =>  FCO.coloredText("NetworkImage", color: color, fontWeight: fontWeight),
//       const (OutlinedButtonNode) => FCO.coloredText("OutlinedButton", color: color, fontWeight: fontWeight),
//       const (PaddingNode) => FCO.coloredText("Padding", color: color, fontWeight: fontWeight),
//       const (PlaceholderNode) => FCO.coloredText("Placeholder", color: color, fontWeight: fontWeight),
//       const (PollNode) => FCO.coloredText("Poll", color: color, fontWeight: fontWeight),
//       const (PollOptionNode) => FCO.coloredText("PollOption", color: color, fontWeight: fontWeight),
//       const (PositionedNode) => FCO.coloredText("Positioned", color: color, fontWeight: fontWeight),
//       const (RichTextNode) => FCO.coloredText("RichText", color: color, fontWeight: fontWeight),
//       const (RowNode) => FCO.coloredText("Row", color: color, fontWeight: fontWeight),
//       const (SizedBoxNode) => FCO.coloredText("SizedBox", color: color, fontWeight: fontWeight),
//       const (SingleChildScrollViewNode) => FCO.coloredText("SingleChildScrollView", color: color, fontWeight: fontWeight),
//       const (SnippetRootNode) => FCO.coloredText("Snippet", color: color, fontWeight: fontWeight),
//       const (SnippetRefNode) => FCO.coloredText("SnippetRef", color: color, fontWeight: fontWeight),
//       const (SplitViewNode) => FCO.coloredText("SplitView", color: color, fontWeight: fontWeight),
//       const (StackNode) => FCO.coloredText("Stack", color: color, fontWeight: fontWeight),
//       const (StepNode) => FCO.coloredText("Step", color: color, fontWeight: fontWeight),
//       const (StepperNode) => FCO.coloredText("Stepper", color: color, fontWeight: fontWeight),
//       const (SubmenuButtonNode) => FCO.coloredText("SubmenuButton", color: color, fontWeight: fontWeight),
//       const (TargetWrapperNode) => FCO.coloredText("TargetWrapper", color: color, fontWeight: fontWeight),
//       const (TargetGroupWrapperNode) => FCO.coloredText("TargetGroupWrapper", color: color, fontWeight: fontWeight),
//       const (TextButtonNode) => FCO.coloredText("TextButton", color: color, fontWeight: fontWeight),
//       const (TextNode) => FCO.coloredText("Text", color: color, fontWeight: fontWeight),
//       const (TextSpanNode) => FCO.coloredText("TextSpan", color: color, fontWeight: fontWeight),
//       const (WidgetSpanNode) => FCO.coloredText("WidgetSpan", color: color, fontWeight: fontWeight),
//       _ => Text('unknown type'),
//     };

  bool canRemove() => true;

  Widget insertItemMenuAnchor(
      {required NodeAction action,
      String? label,
      Color? bgColor,
      String? tooltip,
      ScrollControllerName? scName,
      key}) {
    var title = action == NodeAction.replaceWith
        ? 'replace with...'
        : action == NodeAction.wrapWith
            ? 'wrap with...'
            : action == NodeAction.addSiblingBefore
                ? 'insert before...'
                : action == NodeAction.addSiblingAfter
                    ? 'insert after...'
                    : 'append child...';

    List<Widget> menuChildren = menuAnchorWidgets(action, scName);
    return MenuAnchor(
      menuChildren: menuChildren,
      builder:
          (BuildContext context, MenuController controller, Widget? child) {
        return label != null
            ? TextButton.icon(
                key: key,
                onPressed: () {
                  if (controller.isOpen) {
                    controller.close();
                  } else {
                    controller.open();
                  }
                },
                icon: const Icon(Icons.add),
                label: Text(title),
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                      bgColor ?? Colors.white.withOpacity(.9)),
                  //padding: WidgetStatePropertyAll(EdgeInsets.zero),
                ),
              )
            : IconButton(
                key: key,
                // hoverColor: bgColor?.withOpacity(.5),
                padding: EdgeInsets.zero,
                onPressed: () {
                  if (controller.isOpen) {
                    controller.close();
                  } else {
                    controller.open();
                  }
                },
                icon: Icon(
                  Icons.add_box,
                  color: bgColor,
                  size: 40,
                ),
                tooltip: title,
                // style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.white.withOpacity(.9),
                // ),
                //   //padding: WidgetStatePropertyAll(EdgeInsets.zero),
                // ),
              );
      },
      onOpen: () async {
        await Future.delayed(const Duration(milliseconds: 300));
      },
    );
  }

  List<Widget> menuAnchorWidgets(
    NodeAction action,
    ScrollControllerName? scName,
  ) {
    List<Widget> mis = [];
    if (action == NodeAction.wrapWith) {
      mis.addAll(menuAnchorWidgets_WrapWith(action, false, scName));
    }
    if (action == NodeAction.addChild) {
      mis.addAll(menuAnchorWidgets_Append(action, false, scName));
    }
    if (action == NodeAction.addSiblingBefore ||
        action == NodeAction.addSiblingAfter) {
      mis.addAll(menuAnchorWidgets_InsertSibling(action, false, scName));
    }
    if (action == NodeAction.replaceWith) {
      mis.addAll(menuAnchorWidgets_ReplaceWith(action, scName, false));
    }
    return mis;
  }

  List<Type> replaceWithOnly() => [];

  List<Type> replaceWithRecommendations() => [];

  List<Type> wrapCandidates() => [SC, MC];

  List<Type> wrapWithOnly() => [];

  List<Type> wrapWithRecommendations() => [
        if (getParent() is FlexNode) ExpandedNode,
        if (getParent() is FlexNode) FlexibleNode,
        if (getParent() is StackNode) PositionedNode,
        if (getParent() is StackNode) AlignNode,
      ];

  List<Type> addChildOnly() => [];

  List<Type> addChildRecommendations() => [];

  List<Type> insertSiblingOnly() => [];

  List<Type> insertSiblingRecommendations() => [];

  List<Widget> menuAnchorWidgets_WrapWith(
    NodeAction action,
    bool? skipHeading,
    ScrollControllerName? scName,
  ) {
    return [
      if (!(skipHeading ?? false)) ...menuAnchorWidgets_Heading(action, scName),
      SubmenuButton(
        menuChildren: [
          menuItemButton("Align", AlignNode, action, scName),
          menuItemButton("Center", CenterNode, action, scName),
          menuItemButton("Container", ContainerNode, action, scName),
          menuItemButton("Padding", PaddingNode, action, scName),
          menuItemButton("SizedBox", SizedBoxNode, action, scName),
          menuItemButton("SingleChildScrollView", SingleChildScrollViewNode,
              action, scName),
          const Divider(),
          menuItemButton("Column", ColumnNode, action, scName),
          menuItemButton("Row", RowNode, action, scName),
          menuItemButton("Wrap", WrapNode, action, scName),
          menuItemButton("Expanded", ExpandedNode, action, scName),
          menuItemButton("Flexible", FlexibleNode, action, scName),
          menuItemButton("Stack", StackNode, action, scName),
          menuItemButton("Positioned", PositionedNode, action, scName),
          const Divider(),
          menuItemButton("Scaffold", ScaffoldNode, action, scName),
        ],
        child: fco.coloredText("container", fontWeight: FontWeight.normal),
      ),
      menuItemButton("SplitView", SplitViewNode, action, scName),
      menuItemButton("Hotspots", HotspotsNode, action, scName),
      menuItemButton("DefaultTextStyle", DefaultTextStyleNode, action, scName),
      menuItemButton("Aspect Ratio", AspectRatioNode, action, scName),
    ];
  }

  List<Widget> menuAnchorWidgets_Append(
    NodeAction action,
    bool? skipHeading,
    ScrollControllerName? scName,
  ) {
    return [
      if (!(skipHeading ?? false)) ...menuAnchorWidgets_Heading(action, scName),
      SubmenuButton(
        menuChildren: [
          menuItemButton("Align", AlignNode, action, scName),
          menuItemButton("Center", CenterNode, action, scName),
          menuItemButton("Container", ContainerNode, action, scName),
          menuItemButton("Expanded", ExpandedNode, action, scName),
          // _addChildmenuItemButton("IntrinsicHeight", IntrinsicHeightNode, action, scName),
          // _addChildmenuItemButton("IntrinsicWidth", IntrinsicWidthNode, action, scName),
          menuItemButton("Padding", PaddingNode, action, scName),
          menuItemButton("SizedBox", SizedBoxNode, action, scName),
          menuItemButton("SingleChildScrollView", SingleChildScrollViewNode,
              action, scName),
          const Divider(),
          menuItemButton("Column", ColumnNode, action, scName),
          menuItemButton("Row", RowNode, action, scName),
          menuItemButton("Wrap", WrapNode, action, scName),
          menuItemButton("Stack", StackNode, action, scName),
          const Divider(),
          menuItemButton("Scaffold", ScaffoldNode, action, scName),
        ],
        child: fco.coloredText("container", fontWeight: FontWeight.normal),
      ),
      SubmenuButton(
        menuChildren: [
          menuItemButton(
              "DefaultTextStyle", DefaultTextStyleNode, action, scName),
          menuItemButton("Text", TextNode, action, scName),
          menuItemButton("RichText", RichTextNode, action, scName),
          menuItemButton("TextSpan", TextSpanNode, action, scName),
          menuItemButton("WidgetSpan", WidgetSpanNode, action, scName),
        ],
        child: fco.coloredText("text", fontWeight: FontWeight.normal),
      ),
      SubmenuButton(
        menuChildren: [
          SubmenuButton(
            menuChildren: [
              menuItemButton(
                  "MenuItemButton", MenuItemButtonNode, action, scName),
              menuItemButton(
                  "SubmenuButton", SubmenuButtonNode, action, scName),
              menuItemButton("MenuBar", MenuBarNode, action, scName),
            ],
            child: fco.coloredText("menu", fontWeight: FontWeight.normal),
          ),
          SubmenuButton(
            menuChildren: [
              menuItemButton("TabBar", TabBarNode, action, scName),
              menuItemButton("TabBarView", TabBarViewNode, action, scName),
            ],
            child: fco.coloredText("tab bar", fontWeight: FontWeight.normal),
          ),
          SubmenuButton(
            menuChildren: [
              menuItemButton(
                  "ElevatedButton", ElevatedButtonNode, action, scName),
              menuItemButton(
                  "OutlinedButton", OutlinedButtonNode, action, scName),
              menuItemButton("TextButton", TextButtonNode, action, scName),
              menuItemButton("FilledButton", FilledButtonNode, action, scName),
              menuItemButton("IconButton", IconButtonNode, action, scName),
            ],
            child: fco.coloredText("button", fontWeight: FontWeight.normal),
          ),
          menuItemButton("Chip", ChipNode, action, scName),
        ],
        child: fco.coloredText("navigation", fontWeight: FontWeight.normal),
      ),
      SubmenuButton(
        menuChildren: [
          menuItemButton("Asset Image", AssetImageNode, action, scName),
          menuItemButton("Algorithm", AlgCNode, action, scName),
          menuItemButton("UML", UMLImageNode, action, scName),
          menuItemButton("Firebase Storage Image", FSImageNode, action, scName),
          menuItemButton("Carousel", CarouselNode, action, scName),
          menuItemButton("Aspect Ratio", AspectRatioNode, action, scName),
        ],
        child: fco.coloredText("image", fontWeight: FontWeight.normal),
      ),
      SubmenuButton(
        menuChildren: [
          menuItemButton("ifrane", IFrameNode, action, scName),
          menuItemButton(
              "Google Drive iframe", GoogleDriveIFrameNode, action, scName),
          menuItemButton("File", FileNode, action, scName),
          menuItemButton("Directory", DirectoryNode, action, scName),
        ],
        child: fco.coloredText("file", fontWeight: FontWeight.normal),
      ),
      menuItemButton("SplitView", SplitViewNode, action, scName),
      menuItemButton("Stepper", StepperNode, action, scName),
      menuItemButton("Gap", GapNode, action, scName),
      menuItemButton("Hotspots", HotspotsNode, action, scName),
      menuItemButton("Poll", PollNode, action, scName),
      menuItemButton("Placeholder", PlaceholderNode, action, scName),
      menuItemButton("Youtube", YTNode, action, scName),
      menuItemButton("Markdown", MarkdownNode, action, scName),
      addSnippetsSubmenu(action, scName),
    ];
  }

  List<Widget> menuAnchorWidgets_InsertSibling(
    NodeAction action,
    bool? skipHeading,
    ScrollControllerName? scName,
  ) {
    return [
      if (!(skipHeading ?? false)) ...menuAnchorWidgets_Heading(action, scName),
      if (getParent() is FlexNode) ...[
        menuItemButton("Expanded", ExpandedNode, action, scName),
        menuItemButton("Flexible", FlexibleNode, action, scName),
      ],
      if (getParent() is StepperNode)
        menuItemButton("Step", StepNode, action, scName),
      if (getParent() is StackNode)
        menuItemButton("Positioned", PositionedNode, action, scName),
      if (getParent() is DirectoryNode) ...[
        menuItemButton("Directory", DirectoryNode, action, scName),
        menuItemButton("File", FileNode, action, scName),
      ],
      if (getParent() is MenuBarNode) ...[
        menuItemButton("SubMenuButton", SubmenuButtonNode, action, scName),
        menuItemButton("MenuItemButton", MenuItemButtonNode, action, scName),
      ],
      if (getParent() is SubmenuButtonNode) ...[
        menuItemButton("MenuItemButton", MenuItemButtonNode, action, scName),
      ],
      if (getParent() is CarouselNode) ...[
        menuItemButton("AssetImage", AssetImageNode, action, scName),
        menuItemButton("Algorithm", AlgCNode, action, scName),
        menuItemButton("UML", UMLImageNode, action, scName),
        menuItemButton("FirestoreStorageImage", FSImageNode, action, scName),
      ],
      if (getParent() is TextSpanNode) ...[
        menuItemButton("TextSpanN", TextSpanNode, action, scName),
        menuItemButton("WidgetSpan", WidgetSpanNode, action, scName),
      ],
      ...menuAnchorWidgets_Append(action, true, scName),
    ];
  }

  List<Widget> menuAnchorWidgets_ReplaceWith(
      NodeAction action, ScrollControllerName? scName, bool? skipHeading) {
    bool skipTheRest = false;
    List<Type> replaceTypes = replaceWithOnly();
    if (replaceWithOnly().isEmpty) {
      replaceTypes.addAll(replaceWithRecommendations());
    } else {
      skipTheRest = true;
    }
    return [
      // menu heading
      Container(
        margin: const EdgeInsets.all(10),
        width: 200,
        height: 40,
        child: Center(
          child: fco.purpleText(action.displayName),
        ),
      ),
      pasteMI(action) ?? const Offstage(),

      for (Type type in replaceTypes)
        menuItemButton(type.toString(), type, action, scName),
      if (!skipTheRest) ...[
        SubmenuButton(
          menuChildren: [
            menuItemButton("Align", AlignNode, action, scName),
            menuItemButton("Center", CenterNode, action, scName),
            menuItemButton("Container", ContainerNode, action, scName),
            menuItemButton("Padding", PaddingNode, action, scName),
            menuItemButton("SizedBox", SizedBoxNode, action, scName),
            menuItemButton("SingleChildScrollView", SingleChildScrollViewNode,
                action, scName),
            const Divider(),
            menuItemButton("Column", ColumnNode, action, scName),
            menuItemButton("Row", RowNode, action, scName),
            menuItemButton("Wrap", WrapNode, action, scName),
            menuItemButton("Expanded", ExpandedNode, action, scName),
            menuItemButton("Flexible", FlexibleNode, action, scName),
            menuItemButton("Stack", StackNode, action, scName),
            menuItemButton("Positioned", PositionedNode, action, scName),
            const Divider(),
            menuItemButton("Scaffold", ScaffoldNode, action, scName),
          ],
          child: fco.coloredText("container", fontWeight: FontWeight.normal),
        ),
        SubmenuButton(
          menuChildren: [
            menuItemButton(
                "DefaultTextStyle", DefaultTextStyleNode, action, scName),
            menuItemButton("Text", TextNode, action, scName),
            menuItemButton("RichText", RichTextNode, action, scName),
            menuItemButton("TextSpan", TextSpanNode, action, scName),
            menuItemButton("WidgetSpan", WidgetSpanNode, action, scName),
          ],
          child: fco.coloredText("text", fontWeight: FontWeight.normal),
        ),
        SubmenuButton(
          menuChildren: [
            SubmenuButton(
              menuChildren: [
                menuItemButton(
                    "MenuItemButton", MenuItemButtonNode, action, scName),
                menuItemButton(
                    "SubmenuButton", SubmenuButtonNode, action, scName),
                menuItemButton("MenuBar", MenuBarNode, action, scName),
              ],
              child: fco.coloredText("menu", fontWeight: FontWeight.normal),
            ),
            SubmenuButton(
              menuChildren: [
                menuItemButton("TabBar", TabBarNode, action, scName),
                menuItemButton("TabBarView", TabBarViewNode, action, scName),
              ],
              child: fco.coloredText("tab bar", fontWeight: FontWeight.normal),
            ),
            SubmenuButton(
              menuChildren: [
                menuItemButton(
                    "ElevatedButton", ElevatedButtonNode, action, scName),
                menuItemButton(
                    "OutlinedButton", OutlinedButtonNode, action, scName),
                menuItemButton("TextButton", TextButtonNode, action, scName),
                menuItemButton(
                    "FilledButton", FilledButtonNode, action, scName),
                menuItemButton("IconButton", IconButtonNode, action, scName),
              ],
              child: fco.coloredText("button", fontWeight: FontWeight.normal),
            ),
            menuItemButton("Chip", ChipNode, action, scName),
          ],
          child: fco.coloredText("navigation", fontWeight: FontWeight.normal),
        ),
        SubmenuButton(
          menuChildren: [
            menuItemButton("Asset Image", AssetImageNode, action, scName),
            menuItemButton("Algorithm", AlgCNode, action, scName),
            menuItemButton("UML", UMLImageNode, action, scName),
            menuItemButton(
                "Firebase Storage Image", FSImageNode, action, scName),
            menuItemButton("Carousel", CarouselNode, action, scName),
            menuItemButton("Aspect Ratio", AspectRatioNode, action, scName),
          ],
          child: fco.coloredText("image", fontWeight: FontWeight.normal),
        ),
        SubmenuButton(
          menuChildren: [
            menuItemButton("ifrane", IFrameNode, action, scName),
            menuItemButton(
                "Google Drive iframe", GoogleDriveIFrameNode, action, scName),
            menuItemButton("File", FileNode, action, scName),
            menuItemButton("Directory", DirectoryNode, action, scName),
          ],
          child: fco.coloredText("file", fontWeight: FontWeight.normal),
        ),
        menuItemButton("SplitView", SplitViewNode, action, scName),
        menuItemButton("Stepper", StepperNode, action, scName),
        menuItemButton("Gap", GapNode, action, scName),
        // menuItemButton("TargetWrapper", TargetButtonNode, action, scName),
        menuItemButton("Hotspots", HotspotsNode, action, scName),
        menuItemButton("Poll", PollNode, action, scName),
        menuItemButton("PollOption", PollOptionNode, action, scName),
        menuItemButton("Placeholder", PlaceholderNode, action, scName),
        menuItemButton("Youtube", YTNode, action, scName),
        menuItemButton("Markdown", MarkdownNode, action, scName),
        addSnippetsSubmenu(action, scName),
      ],
    ];
  }

  List<Widget> menuAnchorWidgets_Heading(
      NodeAction action, ScrollControllerName? scName) {
    return [
      Container(
        margin: const EdgeInsets.all(10),
        width: 200,
        height: 40,
        child: Center(
          child: fco.purpleText(action.displayName),
        ),
      ),
      pasteMI(action) ?? const Offstage(),
    ];
  }

  MenuItemButton menuItemButton(
    final String label,
    Type childType,
    NodeAction action,
    ScrollControllerName? scName,
  ) =>
      MenuItemButton(
        onPressed: () {
          if (action == NodeAction.wrapWith) {
            var treeC = FlutterContentApp.snippetBeingEdited?.treeC;
            bool navUp = this == treeC?.roots.firstOrNull;
            FlutterContentApp.capiBloc
                .add(CAPIEvent.wrapSelectionWith(type: childType));
            // in case need to show more of the tree (higher up)
            fco.afterNextBuildDo(() {
              if (navUp) {
                SnippetTreePane.navigateUpTree(scName);
              }
            });
          } else if (action == NodeAction.replaceWith) {
            FlutterContentApp.capiBloc
                .add(CAPIEvent.replaceSelectionWith(type: childType));
          } else if (action == NodeAction.addChild) {
            FlutterContentApp.capiBloc
                .add(CAPIEvent.appendChild(type: childType));
          } else if (action == NodeAction.addSiblingBefore) {
            FlutterContentApp.capiBloc
                .add(CAPIEvent.addSiblingBefore(type: childType));
          } else if (action == NodeAction.addSiblingAfter) {
            FlutterContentApp.capiBloc.add(
              CAPIEvent.addSiblingAfter(type: childType),
            );
          }
          fco.afterNextBuildDo(() {
            fco.afterMsDelayDo(500, () {
              EditablePage.refreshSelectedNodeWidgetBorderOverlay();
            });
          });
        },
        child: fco.coloredText(label, fontWeight: FontWeight.bold),
      );

  MenuItemButton? pasteMI(
    NodeAction action,
  ) {
    if (fco.clipboard != null && action != NodeAction.wrapWith) {
      return MenuItemButton(
        onPressed: () {
          // CAPIBloC bloc = FlutterContentApp.capiBloc;
          switch (action) {
            case NodeAction.replaceWith:
              FlutterContentApp.capiBloc
                  .add(const CAPIEvent.pasteReplacement());
              break;
            case NodeAction.addSiblingBefore:
              FlutterContentApp.capiBloc
                  .add(const CAPIEvent.pasteSiblingBefore());
              break;
            case NodeAction.addSiblingAfter:
              FlutterContentApp.capiBloc
                  .add(const CAPIEvent.pasteSiblingAfter());
              break;
            case NodeAction.addChild:
              FlutterContentApp.capiBloc.add(const CAPIEvent.pasteChild());
              break;
            case NodeAction.wrapWith:
              break;
          }
          // fco.dismiss(TREENODE_MENU_CALLOUT);
        },
        child: fco.coloredText('paste from clipboard', color: Colors.blue),
      );
    }
    return null;
  }

  SubmenuButton addSnippetsSubmenu(
    NodeAction action,
    ScrollControllerName? scName,
  ) {
    List<MenuItemButton> snippetMIs = [];
    // var snippetInfoCache = fco.snippetInfoCache;
    List<SnippetName>? snippetNames =
        fco.appInfo.snippetNames; //snippetInfoCache.keys.toList();
    snippetNames.sort();
    for (String snippetName in snippetNames) {
      snippetMIs.add(
        MenuItemButton(
          onPressed: () async {
            // make sure snippet actually present
            await SnippetRootNode
                .loadSnippetFromCacheOrFromFBOrCreateFromTemplate(
                    snippetName: snippetName);
            if (action == NodeAction.replaceWith) {
              FlutterContentApp.capiBloc.add(CAPIEvent.replaceSelectionWith(
                type: SnippetRootNode,
                snippetName: snippetName,
              ));
            } else if (action == NodeAction.addSiblingBefore) {
              FlutterContentApp.capiBloc.add(CAPIEvent.addSiblingBefore(
                type: SnippetRootNode,
                snippetName: snippetName,
              ));
              // removeNodePropertiesCallout();
            } else if (action == NodeAction.addSiblingAfter) {
              FlutterContentApp.capiBloc.add(CAPIEvent.addSiblingAfter(
                type: SnippetRootNode,
                snippetName: snippetName,
              ));
              // removeNodePropertiesCallout();
            } else if (action == NodeAction.addChild) {
              FlutterContentApp.capiBloc.add(CAPIEvent.appendChild(
                type: SnippetRootNode,
                snippetName: snippetName,
              ));
              // removeNodePropertiesCallout();
            }
          },
          child: Text(snippetName),
        ),
      );
    }
    return SubmenuButton(
        menuChildren: snippetMIs, child: const Text('snippet'));
  }

  STreeNode clone() {
    String jsonS = toJson();
    return STreeNodeMapper.fromJson(jsonS);
  }
}

// /// Exception when an encoded enum value has no match.
// class EnumException implements Exception {
//   String cause;
//
//   EnumException(this.cause);
// }
