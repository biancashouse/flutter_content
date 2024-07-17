import 'dart:math';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_callouts/flutter_callouts.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/api/snippet_panel/callout_snippet_tree_and_properties.dart';
import 'package:flutter_content/src/api/snippet_panel/callout_snippet_tree_and_properties_content.dart';
import 'package:flutter_content/src/bloc/capi_event.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gap/gap.dart';
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
  TextNode,
  RichTextNode,
  AssetImageNode,
  FSImageNode,
  IFrameNode,
  GoogleDriveIFrameNode,
  FileNode,
  // FSFileNode,
  FirebaseStorageImageNode,
  // SnippetRefNode,
  GapNode,
  MarkdownNode,
  /* , NetworkImageNode*/
  PollOptionNode,
  StepNode,
  PlaceholderNode,
  YTNode,
  // FSBucketNode,
  ChipNode,
];

const List<Type> singleChildSubClasses = [
  SizedBoxNode,
  SingleChildScrollViewNode,
  ContainerNode,
  CenterNode,
  ExpandedNode,
  FlexibleNode,
  PaddingNode,
  PositionedNode,
  AlignNode,
  ButtonNode,
  SnippetRootNode,
  DefaultTextStyleNode,
  AspectRatioNode,
  GenericSingleChildNode,
  HotspotsNode,
];

const List<Type> multiChildSubClasses = [
  FlexNode,
  StackNode,
  DirectoryNode,
  // FSDirectoryNode,
  SplitViewNode,
  MenuBarNode,
  SubmenuButtonNode,
  CarouselNode,
  PollNode,
  StepperNode,
  TabBarNode,
  TabBarViewNode,
  GenericMultiChildNode,
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
  PTreeNodeTreeController? _pTreeC;
  ScrollController? _propertiesPaneSC;
  List<PTreeNode>? _properties;

  @JsonKey(includeFromJson: false, includeToJson: false)
  bool isExpanded = false;

  PTreeNodeTreeController pTreeC(BuildContext context) {
    // var prevExpansions = _pTreeC?.expandedNodes;
    // for (PTreeNode node in prevExpansions??[]) {
    //   debugPrint(node.name);
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

  ScrollController propertiesPaneSC() => _propertiesPaneSC ??= ScrollController();

  // FCO get fc => FCO;

  // ..addListener(() {
  //   propertiesPaneScrollPos =
  // });

  @JsonKey(includeFromJson: false, includeToJson: false)
  bool? hidePropertiesWhileDragging;

  @JsonKey(includeFromJson: false, includeToJson: false)
  GlobalKey? nodeWidgetGK; // gets used in toWidget()

  SnippetRootNode? rootNodeOfSnippet() => findNearestAncestor<SnippetRootNode>();

  List<PTreeNode> properties(BuildContext context);

  // // selection always uses this gk
  // static GlobalKey get selectedWidgetGK {
  //   if (_selectedWidgetGK.currentState == null) return _selectedWidgetGK;
  //   debugPrint("selectionGK in use: ${_selectedWidgetGK.currentWidget.runtimeType}");
  //   return GlobalKey(debugLabel: 'selectionGK was in use');
  // }
  //
  // static final GlobalKey _selectedWidgetGK = GlobalKey(debugLabel: "selectionGK");

  void showTappableNodeWidgetOverlay(String nodeTypeName, Rect r) {
// overlay rect with a transparent pink rect, and a 3px surround
    String feature = '${nodeWidgetGK.hashCode}-pink-overlay';
    Rect restrictedRect = fco.restrictRectToScreen(r);
    // debugPrint("=== showTappableNodeWidgetOverlay =====>\n  cId: $feature\n  r restricted to ${restrictedRect.toString()}");
    const double BORDER = 1;
    double borderLeft = max(restrictedRect.left - BORDER, 0);
    double borderTop = max(restrictedRect.top - BORDER, 0);
    double borderRight = min(fco.scrW, restrictedRect.right + BORDER * 2);
    double borderBottom = min(fco.scrH, restrictedRect.bottom + BORDER * 2);
    Rect borderRect = Rect.fromLTRB(borderLeft, borderTop, borderRight, borderBottom);
    CalloutConfig cc = CalloutConfig(
      cId: feature,
      initialCalloutW: borderRect.width.abs() + BORDER * 2,
      initialCalloutH: borderRect.height.abs() + BORDER * 2,
      initialCalloutPos: borderRect.topLeft.translate(-BORDER, -BORDER),
      fillColor: Colors.transparent,
      arrowType: ArrowType.NONE,
      draggable: false,
    );
    Callout.showOverlay(
      ensureLowestOverlay: false,
      calloutContent: PointerInterceptor(
        intercepting: true,
        child: InkWell(
          onTap: () {
            // debugPrint("${toString()} tapped");
            SnippetName? snippetName = rootNodeOfSnippet()?.name;
            if (snippetName == null) return;
            // var cc = nodeWidgetGK?.currentContext;
// edit the root snippet
//             hideAllSingleTargetBtns();
// FCO.capiBloc.add(const CAPIEvent.hideAllTargetGroupBtns());
// FCO.capiBloc.add(const CAPIEvent.hideTargetGroupsExcept());
            fco.currentPageState?.removeAllNodeWidgetOverlays();
// actually push node parent, then select node - more user-friendly
            // tapped a real widget with GlobalKey of nodeWidgetGK
            var tappedNodeName = nodeTypeName;
            var cs = nodeWidgetGK?.currentState;
            var cc = nodeWidgetGK?.currentContext;
            bool isMOunted = cc?.mounted ?? false;
            var cw = nodeWidgetGK?.currentWidget;
            pushThenShowNamedSnippetWithNodeSelected(
              snippetName,
              this,
              this,
            );
            // fco.afterNextBuildDo(() {
            // });
          },
          child: Tooltip(
            // message: 'tap to edit this $nodeTypeName node\n<Esc> exits edit mode.flutter upgrade',
            richMessage: TextSpan(
                text: 'tap to edit this $nodeTypeName node',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                children: const [
                  TextSpan(
                    text: '\n( <Esc> exits edit mode )',
                    style: TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ]),
            // textStyle: const TextStyle(
            //   color: Colors.white,
            //   fontSize: 16,
            //   fontWeight: FontWeight.bold,
            // ),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.purpleAccent,
            ),
            child: Container(
              width: borderRect.width.abs(),
              height: borderRect.height.abs(),
              decoration: BoxDecoration(
                //color: Colors.purpleAccent.withOpacity(.1),
                border: Border.all(width: 2, color: Colors.purpleAccent, style: BorderStyle.solid),
              ),
              // alignment: Alignment.bottomLeft,
              // child: FCO.coloredText(nodeTypeName, color: Colors.purpleAccent),
            ),
          ),
        ),
      ),
      calloutConfig: cc,
      targetGkF: () => nodeWidgetGK,
    );
  }

  void showNodeWidgetOverlay() {
    Rect? r = nodeWidgetGK?.globalPaintBounds(skipWidthConstraintWarning: true, skipHeightConstraintWarning: true);
    if (r != null) {
      r = fco.restrictRectToScreen(r);
      // pageState.removeAllNodeWidgetOverlays();
      Rect restrictedRect = fco.restrictRectToScreen(r);
      const int BORDER = 3;
      double borderLeft = max(restrictedRect.left - 3, 0);
      double borderTop = max(restrictedRect.top - 3, 0);
      double borderRight = min(fco.scrW, restrictedRect.right + BORDER * 2);
      double borderBottom = min(fco.scrH, restrictedRect.bottom + BORDER * 2);
      Rect borderRect = Rect.fromLTRB(borderLeft, borderTop, borderRight, borderBottom);
      CalloutConfig cc = CalloutConfig(
        cId: 'pink-border-overlay-non-tappable',
        initialCalloutW: borderRect.width + 6,
        initialCalloutH: borderRect.height + 6,
        initialCalloutPos: borderRect.topLeft.translate(-3, -3),
        fillColor: Colors.transparent,
        arrowType: ArrowType.NONE,
        draggable: false,
      );
      Callout.showOverlay(
        ensureLowestOverlay: true,
        calloutContent: PointerInterceptor(
          child: Container(
            width: cc.calloutW,
            height: cc.calloutH,
            decoration: BoxDecoration(
//color: Colors.purpleAccent.withOpacity(.1),
              border: Border.all(width: 2, color: Colors.purpleAccent, style: BorderStyle.solid),
            ),
          ),
        ),
        calloutConfig: cc,
        targetGkF: () => nodeWidgetGK,
      );
    }
  }

  // node is where the snippet tree starts (not necc the snippet's root node)
  // selection is poss a current (lower) selection in the tree
  static void pushThenShowNamedSnippetWithNodeSelected(
    SnippetName snippetName,
    STreeNode startingAtNode,
    STreeNode selectedNode,
  ) {
    STreeNode? highestNode;
    if (startingAtNode is SnippetRootNode) {
      highestNode = startingAtNode.child; //JIC
    } else if (startingAtNode is ScaffoldNode) {
      highestNode = startingAtNode;
    } else {
      highestNode = (startingAtNode.getParent() ?? startingAtNode) as STreeNode;
    }
    // var b = startingAtNode.nodeWidgetGK?.currentContext?.mounted;

    FlutterContentApp.capiBloc.add(CAPIEvent.pushSnippetEditor(
      snippetName: snippetName,
      visibleDecendantNode: highestNode,
    ));
    // fco.afterNextBuildDo(() {
    // });
    // return;
    // debugPrint('after pushSnippetBloc');
    // var b = startingAtNode.nodeWidgetGK?.currentContext?.mounted;
    fco.afterNextBuildDo(() {
      var gk = startingAtNode.nodeWidgetGK;

      var tappedNodeName = gk;
      var cs = gk?.currentState;
      var cc = gk?.currentContext;
      // bool isMOunted = cc?.mounted ?? false;
      var cw = gk?.currentWidget;

      if (FlutterContentApp.snippetBeingEdited != null) {
        FlutterContentApp.snippetBeingEdited?.treeC.expandAll();
        FlutterContentApp.snippetBeingEdited?.treeC.rebuild();
        // possibly show clipboard
        if (!fco.clipboardIsEmpty) {
          fco.showFloatingClipboard();
        }
        showSnippetTreeAndPropertiesCallout(
          targetGKF: () => startingAtNode.nodeWidgetGK,
          onDismissedF: () {
// CAPIState.snippetStateMap[snippetBloc.snippetName] = snippetBloc.state;
            STreeNode.unhighlightSelectedNode();
            // Callout.printFeatures();
            var pinkOverlayFeature = 'pink-border-overlay-non-tappable';
            var currPageState = fco.currentPageState;
            currPageState?.unhideFAB();
            Callout.dismiss(pinkOverlayFeature);
            // Callout.printFeatures();
            showAllTargetBtns();
            showAllTargetCovers();
            // FCO.capiBloc.add(const CAPIEvent.popSnippetBloc());
            Callout.dismiss(TREENODE_MENU_CALLOUT);
            fco.hideClipboard();
            // FlutterContentPage.exitEditMode();
            // skip if no change
            String? jsonBeforePush = FlutterContentApp.snippetBeingEdited?.jsonBeforePush;
            String? currentJsonS = FlutterContentApp.rootNode?.toJson();
            if (jsonBeforePush == currentJsonS) return;
            if (FlutterContentApp.rootNode != null) {
              fco.possiblyCacheAndSaveANewSnippetVersion(
                snippetName: snippetName,
                rootNode: FlutterContentApp.rootNode!,
              );
            }
            // FCO.capiBloc.add(
            //       CAPIEvent.saveSnippet(
            //         snippetRootNode: FCO.snippetBeingEdited!.rootNode,
            //         newVersionId: newVersionId,
            //       ),
            //     );
          },
          startingAtNode: startingAtNode,
          selectedNode: selectedNode,
        );

        // FlutterContentApp.capiBloc.add(CAPIEvent.selectNode(
        //   node: selectedNode,
        //   // imageTC: tc,
        //   // selectedWidgetGK: GlobalKey(debugLabel: 'selectedWidgetGK'),
        //   // selectedTreeNodeGK: GlobalKey(debugLabel: 'selectedTreeNodeGK'),
        // ));
        fco.afterNextBuildDo(() {
          fco.currentPageState
            ?..removeAllNodeWidgetOverlays()
            ..showNodeWidgetOverlay(selectedNode);
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

  void refreshWithUpdate(VoidCallback assignF, {bool alsoRefreshPropertiesView = false}) {
    assignF.call();
    fco.forceRefresh();
    fco.afterNextBuildDo(() {
      if (FlutterContentApp.selectedNode != null) {
        fco.currentPageState?.showNodeWidgetOverlay((FlutterContentApp.selectedNode)!);
      }
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
      (this is TextSpanNode && ((this as TextSpanNode).children?.length ?? 0) > 0);

  // List<String> sensibleParents() => const [];

  GlobalKey createNodeGK() {
    // debugPrint('--- createNodeGK --- ${toString()}');
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
    if (this is TextNode && (this as TextNode).text.isEmpty && getParent() is TabBarNode) {
      (this as TextNode).text = 'new tab';
    }
    // ensure No. tabs matches No. tab views
    TabBarNode? tabBar = findDescendant(TabBarNode) as TabBarNode?;
    TabBarViewNode? tabBarView = findDescendant(TabBarViewNode) as TabBarViewNode?;
    if ((tabBar?.children.length ?? 0) > (tabBarView?.children.length ?? 0)) {
      tabBarView?.children.add(PlaceholderNode()..setParent(tabBarView));
    } else if ((tabBar?.children.length ?? 0) < (tabBarView?.children.length ?? 0)) {
      tabBar?.children.add(TextNode(text: 'fixed tab')..setParent(tabBar));
    }
    // bool doubleCheck = anyMissingParents();
    // debugPrint("missing parents: $doubleCheck");
    // if (tabBar != null) {
    //   debugPrint("TabBar: ${tabBar.children.length}, TabBarView: ${tabBarView?.children.length} views");
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
      bool foundAMissingParent = child.getParent() != this || child.anyMissingParents();
      if (foundAMissingParent) {
        return true;
      }
    }
    return false;
  }

  bool isAScaffoldTabWidget() {
    return getParent() is TabBarNode &&
        getParent()?.getParent() is GenericSingleChildNode &&
        (getParent()?.getParent() as GenericSingleChildNode?)?.propertyName == 'bottom';
  }

  bool isAScaffoldTabViewWidget() =>
      getParent() is TabBarViewNode &&
      getParent()?.getParent() is GenericSingleChildNode &&
      (getParent()?.getParent() as GenericSingleChildNode?)?.propertyName == 'body';

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
      // debugPrint(node.runtimeType.toString());
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
    for (SnippetName snippetName in fco.snippetInfoCache.keys) {
      // get published or editing version
      SnippetInfoModel? snippetInfo = fco.snippetInfoCache[snippetName];
      if (snippetInfo == null) return foundTargets;
      VersionId? versionId = fco.canEditContent ? snippetInfo.editingVersionId : snippetInfo.publishedVersionId;
      if (versionId == null) return foundTargets;
      List<STreeNode> tws = fco.versionCache[snippetName]?[versionId]?.findDescendantsOfType(HotspotsNode) ?? [];
      for (STreeNode tw in tws) {
        foundTargets.addAll((tw as HotspotsNode).targets);
      }
    }
    return foundTargets;
  }

// check nodes are identical
  bool isSame(STreeNode otherNode) => toJson() == otherNode.toJson();

  Widget toWidget(BuildContext context, STreeNode? parentNode) => const Placeholder();

  Widget possiblyCheckHeightConstraint(STreeNode? parentNode, Widget actualWidget) {
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

  static void unhighlightSelectedNode() => Callout.dismiss(SELECTED_NODE_BORDER_CALLOUT);

  Future<void> possiblyHighlightSelectedNode() async {
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
        // debugPrint("Showing $SELECTED_NODE_BORDER_CALLOUT");
        Callout.showOverlay(
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
          ),
          calloutContent: InkWell(
            child: Container(
              width: w,
              height: h,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.purpleAccent.withOpacity(.5), width: thickness),
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
// // if (Callout.anyPresent([SELECTED_NODE_BORDER_CALLOUT])) {
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
//             debugPrint("Showing $SELECTED_NODE_BORDER_CALLOUT");
//             Callout.showOverlay(
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
//   // debugPrint(nodeTypeCandidates.toString());
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
//           Callout.dismiss(TREENODE_MENU_CALLOUT);
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
//         Callout.dismiss(TREENODE_MENU_CALLOUT);
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
//         //Callout.removeOverlayParentCallout(context, true);
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
//   debugPrint(typeString);
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

  Widget insertItemMenuAnchor({required NodeAction action, String? label, Color? bgColor, String? tooltip, key}) {
    var title = action == NodeAction.replaceWith
        ? 'replace with...'
        : action == NodeAction.wrapWith
            ? 'wrap with...'
            : action == NodeAction.addSiblingBefore
                ? 'insert before...'
                : action == NodeAction.addSiblingAfter
                    ? 'insert after...'
                    : 'append child...';

    List<Widget> menuChildren = menuAnchorWidgets(action);
    return MenuAnchor(
      menuChildren: menuChildren,
      builder: (BuildContext context, MenuController controller, Widget? child) {
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
                  backgroundColor: WidgetStatePropertyAll(bgColor ?? Colors.white.withOpacity(.9)),
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

  List<Widget> menuAnchorWidgets(NodeAction action) {
    List<Widget> mis = [];
    if (action == NodeAction.wrapWith) {
      mis.addAll(menuAnchorWidgets_WrapWith(action, false));
    }
    if (action == NodeAction.addChild) {
      mis.addAll(menuAnchorWidgets_Append(action, false));
    }
    if (action == NodeAction.addSiblingBefore || action == NodeAction.addSiblingAfter) {
      mis.addAll(menuAnchorWidgets_InsertSibling(action, false));
    }
    if (action == NodeAction.replaceWith) {
      mis.addAll(menuAnchorWidgets_ReplaceWith(action, false));
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

  List<Widget> menuAnchorWidgets_WrapWith(NodeAction action, bool? skipHeading) {
    return [
      if (!(skipHeading ?? false)) ...menuAnchorWidgets_Heading(action),
      SubmenuButton(
        menuChildren: [
          menuItemButton("Align", AlignNode, action),
          menuItemButton("Center", CenterNode, action),
          menuItemButton("Container", ContainerNode, action),
          menuItemButton("Padding", PaddingNode, action),
          menuItemButton("SizedBox", SizedBoxNode, action),
          menuItemButton("SingleChildScrollView", SingleChildScrollViewNode, action),
          const Divider(),
          menuItemButton("Column", ColumnNode, action),
          menuItemButton("Row", RowNode, action),
          menuItemButton("Wrap", WrapNode, action),
          menuItemButton("Expanded", ExpandedNode, action),
          menuItemButton("Flexible", FlexibleNode, action),
          menuItemButton("Stack", StackNode, action),
          menuItemButton("Positioned", PositionedNode, action),
          const Divider(),
          menuItemButton("Scaffold", ScaffoldNode, action),
        ],
        child: fco.coloredText("container", fontWeight: FontWeight.normal),
      ),
      menuItemButton("SplitView", SplitViewNode, action),
      menuItemButton("Hotspots", HotspotsNode, action),
      menuItemButton("DefaultTextStyle", DefaultTextStyleNode, action),
    ];
  }

  List<Widget> menuAnchorWidgets_Append(NodeAction action, bool? skipHeading) {
    return [
      if (!(skipHeading ?? false)) ...menuAnchorWidgets_Heading(action),
      SubmenuButton(
        menuChildren: [
          menuItemButton("Align", AlignNode, action),
          menuItemButton("Center", CenterNode, action),
          menuItemButton("Container", ContainerNode, action),
          menuItemButton("Expanded", ExpandedNode, action),
          // _addChildMenuItemButton("IntrinsicHeight", IntrinsicHeightNode, action),
          // _addChildMenuItemButton("IntrinsicWidth", IntrinsicWidthNode, action),
          menuItemButton("Padding", PaddingNode, action),
          menuItemButton("SizedBox", SizedBoxNode, action),
          menuItemButton("SingleChildScrollView", SingleChildScrollViewNode, action),
          const Divider(),
          menuItemButton("Column", ColumnNode, action),
          menuItemButton("Row", RowNode, action),
          menuItemButton("Wrap", WrapNode, action),
          menuItemButton("Stack", StackNode, action),
          const Divider(),
          menuItemButton("Scaffold", ScaffoldNode, action),
        ],
        child: fco.coloredText("container", fontWeight: FontWeight.normal),
      ),
      SubmenuButton(
        menuChildren: [
          menuItemButton("DefaultTextStyle", DefaultTextStyleNode, action),
          menuItemButton("Text", TextNode, action),
          menuItemButton("RichText", RichTextNode, action),
          menuItemButton("TextSpan", TextSpanNode, action),
          menuItemButton("WidgetSpan", WidgetSpanNode, action),
        ],
        child: fco.coloredText("text", fontWeight: FontWeight.normal),
      ),
      SubmenuButton(
        menuChildren: [
          SubmenuButton(
            menuChildren: [
              menuItemButton("MenuItemButton", MenuItemButtonNode, action),
              menuItemButton("SubmenuButton", SubmenuButtonNode, action),
              menuItemButton("MenuBar", MenuBarNode, action),
            ],
            child: fco.coloredText("menu", fontWeight: FontWeight.normal),
          ),
          SubmenuButton(
            menuChildren: [
              menuItemButton("TabBar", TabBarNode, action),
              menuItemButton("TabBarView", TabBarViewNode, action),
            ],
            child: fco.coloredText("tab bar", fontWeight: FontWeight.normal),
          ),
          SubmenuButton(
            menuChildren: [
              menuItemButton("ElevatedButton", ElevatedButtonNode, action),
              menuItemButton("OutlinedButton", OutlinedButtonNode, action),
              menuItemButton("TextButton", TextButtonNode, action),
              menuItemButton("FilledButton", FilledButtonNode, action),
              menuItemButton("IconButton", IconButtonNode, action),
            ],
            child: fco.coloredText("button", fontWeight: FontWeight.normal),
          ),
          menuItemButton("Chip", ChipNode, action),
        ],
        child: fco.coloredText("navigation", fontWeight: FontWeight.normal),
      ),
      SubmenuButton(
        menuChildren: [
          menuItemButton("Asset Image", AssetImageNode, action),
          menuItemButton("Firebase Storage Image", FSImageNode, action),
          menuItemButton("Carousel", CarouselNode, action),
        ],
        child: fco.coloredText("image", fontWeight: FontWeight.normal),
      ),
      SubmenuButton(
        menuChildren: [
          menuItemButton("ifrane", IFrameNode, action),
          menuItemButton("Google Drive iframe", GoogleDriveIFrameNode, action),
          menuItemButton("File", FileNode, action),
          menuItemButton("Directory", DirectoryNode, action),
        ],
        child: fco.coloredText("file", fontWeight: FontWeight.normal),
      ),
      menuItemButton("SplitView", SplitViewNode, action),
      menuItemButton("Stepper", StepperNode, action),
      menuItemButton("Gap", GapNode, action),
      menuItemButton("Hotspots", HotspotsNode, action),
      menuItemButton("Poll", PollNode, action),
      menuItemButton("Placeholder", PlaceholderNode, action),
      menuItemButton("Youtube", YTNode, action),
      menuItemButton("Markdown", MarkdownNode, action),
      addSnippetsSubmenu(action),
    ];
  }

  List<Widget> menuAnchorWidgets_InsertSibling(NodeAction action, bool? skipHeading) {
    return [
      if (!(skipHeading ?? false)) ...menuAnchorWidgets_Heading(action),
      if (getParent() is FlexNode) ...[
        menuItemButton("Expanded", ExpandedNode, action),
        menuItemButton("Flexible", FlexibleNode, action),
      ],
      if (getParent() is StepperNode) menuItemButton("Step", StepNode, action),
      if (getParent() is StackNode) menuItemButton("Positioned", PositionedNode, action),
      if (getParent() is DirectoryNode) ...[
        menuItemButton("Directory", DirectoryNode, action),
        menuItemButton("File", FileNode, action),
      ],
      if (getParent() is MenuBarNode) ...[
        menuItemButton("SubMenuButton", SubmenuButtonNode, action),
        menuItemButton("MenuItemButton", MenuItemButtonNode, action),
      ],
      if (getParent() is SubmenuButtonNode) ...[
        menuItemButton("MenuItemButton", MenuItemButtonNode, action),
      ],
      if (getParent() is CarouselNode) ...[
        menuItemButton("AssetImage", AssetImageNode, action),
        menuItemButton("FirestoreStorageImage", FSImageNode, action),
      ],
      if (getParent() is TextSpanNode) ...[
        menuItemButton("TextSpanN", TextSpanNode, action),
        menuItemButton("WidgetSpan", WidgetSpanNode, action),
      ],
    ];
  }

  List<Widget> menuAnchorWidgets_ReplaceWith(NodeAction action, bool? skipHeading) {
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

      for (Type type in replaceTypes) menuItemButton(type.toString(), type, action),
      if (!skipTheRest) ...[
        SubmenuButton(
          menuChildren: [
            menuItemButton("Align", AlignNode, action),
            menuItemButton("Center", CenterNode, action),
            menuItemButton("Container", ContainerNode, action),
            menuItemButton("Padding", PaddingNode, action),
            menuItemButton("SizedBox", SizedBoxNode, action),
            menuItemButton("SingleChildScrollView", SingleChildScrollViewNode, action),
            const Divider(),
            menuItemButton("Column", ColumnNode, action),
            menuItemButton("Row", RowNode, action),
            menuItemButton("Wrap", WrapNode, action),
            menuItemButton("Expanded", ExpandedNode, action),
            menuItemButton("Flexible", FlexibleNode, action),
            menuItemButton("Stack", StackNode, action),
            menuItemButton("Positioned", PositionedNode, action),
            const Divider(),
            menuItemButton("Scaffold", ScaffoldNode, action),
          ],
          child: fco.coloredText("container", fontWeight: FontWeight.normal),
        ),
        SubmenuButton(
          menuChildren: [
            menuItemButton("DefaultTextStyle", DefaultTextStyleNode, action),
            menuItemButton("Text", TextNode, action),
            menuItemButton("RichText", RichTextNode, action),
            menuItemButton("TextSpan", TextSpanNode, action),
            menuItemButton("WidgetSpan", WidgetSpanNode, action),
          ],
          child: fco.coloredText("text", fontWeight: FontWeight.normal),
        ),
        SubmenuButton(
          menuChildren: [
            SubmenuButton(
              menuChildren: [
                menuItemButton("MenuItemButton", MenuItemButtonNode, action),
                menuItemButton("SubmenuButton", SubmenuButtonNode, action),
                menuItemButton("MenuBar", MenuBarNode, action),
              ],
              child: fco.coloredText("menu", fontWeight: FontWeight.normal),
            ),
            SubmenuButton(
              menuChildren: [
                menuItemButton("TabBar", TabBarNode, action),
                menuItemButton("TabBarView", TabBarViewNode, action),
              ],
              child: fco.coloredText("tab bar", fontWeight: FontWeight.normal),
            ),
            SubmenuButton(
              menuChildren: [
                menuItemButton("ElevatedButton", ElevatedButtonNode, action),
                menuItemButton("OutlinedButton", OutlinedButtonNode, action),
                menuItemButton("TextButton", TextButtonNode, action),
                menuItemButton("FilledButton", FilledButtonNode, action),
                menuItemButton("IconButton", IconButtonNode, action),
              ],
              child: fco.coloredText("button", fontWeight: FontWeight.normal),
            ),
            menuItemButton("Chip", ChipNode, action),
          ],
          child: fco.coloredText("navigation", fontWeight: FontWeight.normal),
        ),
        SubmenuButton(
          menuChildren: [
            menuItemButton("Asset Image", AssetImageNode, action),
            menuItemButton("Firebase Storage Image", FSImageNode, action),
            menuItemButton("Carousel", CarouselNode, action),
          ],
          child: fco.coloredText("image", fontWeight: FontWeight.normal),
        ),
        SubmenuButton(
          menuChildren: [
            menuItemButton("ifrane", IFrameNode, action),
            menuItemButton("Google Drive iframe", GoogleDriveIFrameNode, action),
            menuItemButton("File", FileNode, action),
            menuItemButton("Directory", DirectoryNode, action),
          ],
          child: fco.coloredText("file", fontWeight: FontWeight.normal),
        ),
        menuItemButton("SplitView", SplitViewNode, action),
        menuItemButton("Stepper", StepperNode, action),
        menuItemButton("Gap", GapNode, action),
        // menuItemButton("TargetWrapper", TargetButtonNode, action),
        menuItemButton("Hotspots", HotspotsNode, action),
        menuItemButton("Poll", PollNode, action),
        menuItemButton("PollOption", PollOptionNode, action),
        menuItemButton("Placeholder", PlaceholderNode, action),
        menuItemButton("Youtube", YTNode, action),
        menuItemButton("Markdown", MarkdownNode, action),
        addSnippetsSubmenu(action),
      ],
    ];
  }

  List<Widget> menuAnchorWidgets_Heading(NodeAction action) {
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
  ) =>
      MenuItemButton(
        onPressed: () {
          if (action == NodeAction.wrapWith) {
            var treeC = FlutterContentApp.snippetBeingEdited?.treeC;
            bool navUp = this == treeC?.roots.firstOrNull;
            FlutterContentApp.capiBloc.add(CAPIEvent.wrapSelectionWith(type: childType));
            // in case need to show more of the tree (higher up)
            fco.afterNextBuildDo(() {
              if (navUp) {
                SnippetTreePane.navigateUpTree();
              }
            });
          } else if (action == NodeAction.replaceWith) {
            FlutterContentApp.capiBloc.add(CAPIEvent.replaceSelectionWith(type: childType));
          } else if (action == NodeAction.addChild) {
            FlutterContentApp.capiBloc.add(CAPIEvent.appendChild(type: childType));
          } else if (action == NodeAction.addSiblingBefore) {
            FlutterContentApp.capiBloc.add(CAPIEvent.addSiblingBefore(type: childType));
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
              FlutterContentApp.capiBloc.add(const CAPIEvent.pasteReplacement());
              break;
            case NodeAction.addSiblingBefore:
              FlutterContentApp.capiBloc.add(const CAPIEvent.pasteSiblingBefore());
              break;
            case NodeAction.addSiblingAfter:
              FlutterContentApp.capiBloc.add(const CAPIEvent.pasteSiblingAfter());
              break;
            case NodeAction.addChild:
              FlutterContentApp.capiBloc.add(const CAPIEvent.pasteChild());
              break;
            case NodeAction.wrapWith:
              break;
          }
          Callout.dismiss(TREENODE_MENU_CALLOUT);
        },
        child: fco.coloredText('paste from clipboard', color: Colors.blue),
      );
    }
    return null;
  }

  SubmenuButton addSnippetsSubmenu(
    NodeAction action,
  ) {
    List<MenuItemButton> snippetMIs = [];
    List<SnippetName> snippetNames = fco.snippetInfoCache.keys.toList()..sort();
    for (String snippetName in snippetNames) {
      snippetMIs.add(
        MenuItemButton(
          onPressed: () async {
            // make sure snippet actually present
            await SnippetRootNode.loadSnippetFromCacheOrFromFBOrCreateFromTemplate(snippetName: snippetName);
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
    return SubmenuButton(menuChildren: snippetMIs, child: const Text('snippet'));
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
