import 'dart:math';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/api/snippet_panel/callout_snippet_tree_and_properties.dart';
import 'package:flutter_content/src/bloc/capi_event.dart';
import 'package:flutter_content/src/bloc/snippet_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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
  /* , NetworkImageNode*/
  PollOptionNode,
  StepNode,
  MenuItemButtonNode,
  PlaceholderNode,
  YTNode,
  // FSBucketNode,
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
];

const List<Type> buttonSubClasses = [
  ElevatedButtonNode,
  OutlinedButtonNode,
  TextButtonNode,
  FilledButtonNode,
  IconButtonNode,
  // TargetButtonNode,
  HotspotsNode,
];

const List<Type> flexSubClasses = [
  RowNode,
  ColumnNode,
];

enum NodeAction {
  replace("replace with ..."),
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  bool isExpanded = false;

  PTreeNodeTreeController pTreeC(BuildContext context) => _pTreeC ??= PTreeNodeTreeController(
        roots: properties(context),
        childrenProvider: Node.propertyTreeChildrenProvider,
      );

  double propertiesPaneScrollPos() => propertiesPaneSC().offset;

  ScrollController propertiesPaneSC() => _propertiesPaneSC ??= ScrollController();

  FC get fc => FC();
  // ..addListener(() {
  //   propertiesPaneScrollPos =
  // });

  @JsonKey(includeFromJson: false, includeToJson: false)
  bool? hidePropertiesWhileDragging;

  @JsonKey(includeFromJson: false, includeToJson: false)
  GlobalKey? nodeWidgetGK; // gets used in toWidget()

  SnippetRootNode? rootNodeOfSnippet() => findNearestAncestor<SnippetRootNode>();

  List<PTreeNode> properties(BuildContext context) {
    return createPropertiesList(context);
  } //_properties ??= createPropertiesList();

  List<PTreeNode> createPropertiesList(BuildContext context);

  // // selection always uses this gk
  // static GlobalKey get selectedWidgetGK {
  //   if (_selectedWidgetGK.currentState == null) return _selectedWidgetGK;
  //   debugPrint("selectionGK in use: ${_selectedWidgetGK.currentWidget.runtimeType}");
  //   return GlobalKey(debugLabel: 'selectionGK was in use');
  // }
  //
  // static final GlobalKey _selectedWidgetGK = GlobalKey(debugLabel: "selectionGK");

  void showTappableNodeWidgetOverlay(Rect r) {
// overlay rect with a transparent pink rect, and a 3px surround
    Rect restrictedRect = Useful.restrictRectToScreen(r);
    // debugPrint(
    //     "=== showTappableNodeWidgetOverlay =====>  r restricted to ${restrictedRect.toString()}");
    const int BORDER = 3;
    double borderLeft = max(restrictedRect.left - 3, 0);
    double borderTop = max(restrictedRect.top - 3, 0);
    double borderRight = min(Useful.scrW, restrictedRect.right + BORDER * 2);
    double borderBottom = min(Useful.scrH, restrictedRect.bottom + BORDER * 2);
    Rect borderRect = Rect.fromLTRB(borderLeft, borderTop, borderRight, borderBottom);
    CalloutConfig cc = CalloutConfig(
      feature: '${nodeWidgetGK.hashCode}-pink-overlay',
      suppliedCalloutW: borderRect.width.abs() + 6,
      suppliedCalloutH: borderRect.height.abs() + 6,
      initialCalloutPos: borderRect.topLeft.translate(-3, -3),
      fillColor: Colors.transparent,
      arrowType: ArrowType.NO_CONNECTOR,
      draggable: false,
    );

    Callout.showOverlay(
      ensureLowestOverlay: false,
      boxContentF: (context) => PointerInterceptor(
        intercepting: true,
        child: InkWell(
          onTap: () {
            debugPrint("node widget tapped");
            SnippetName? snippetName = rootNodeOfSnippet()?.name;
            if (snippetName == null) return;
            // var cc = nodeWidgetGK?.currentContext;
// edit the root snippet
//             hideAllSingleTargetBtns();
// FlutterContent().capiBloc.add(const CAPIEvent.hideAllTargetGroupBtns());
// FlutterContent().capiBloc.add(const CAPIEvent.hideTargetGroupsExcept());
            MaterialSPAState.removeAllNodeWidgetOverlays();
// actually push node parent, then select node - more user-friendly
            var b = nodeWidgetGK?.currentContext?.mounted;
            pushThenShowNamedSnippetWithNodeSelected(snippetName, this, this);
            // Useful.afterNextBuildDo(() {
            // });
          },
          child: Container(
            width: borderRect.width.abs(),
            height: borderRect.height.abs(),
            decoration: BoxDecoration(
//color: Colors.purpleAccent.withOpacity(.1),
              border: Border.all(width: 2, color: Colors.purpleAccent, style: BorderStyle.solid),
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
      r = Useful.restrictRectToScreen(r);
      MaterialSPAState.removeAllNodeWidgetOverlays();
      Rect restrictedRect = Useful.restrictRectToScreen(r);
      const int BORDER = 3;
      double borderLeft = max(restrictedRect.left - 3, 0);
      double borderTop = max(restrictedRect.top - 3, 0);
      double borderRight = min(Useful.scrW, restrictedRect.right + BORDER * 2);
      double borderBottom = min(Useful.scrH, restrictedRect.bottom + BORDER * 2);
      Rect borderRect = Rect.fromLTRB(borderLeft, borderTop, borderRight, borderBottom);
      CalloutConfig cc = CalloutConfig(
        feature: '${nodeWidgetGK.hashCode}-pink-overlay',
        suppliedCalloutW: borderRect.width + 6,
        suppliedCalloutH: borderRect.height + 6,
        initialCalloutPos: borderRect.topLeft.translate(-3, -3),
        fillColor: Colors.transparent,
        arrowType: ArrowType.NO_CONNECTOR,
        draggable: false,
      );
      Callout.showOverlay(
        ensureLowestOverlay: true,
        boxContentF: (context) => PointerInterceptor(
          child: Container(
            width: borderRect.width,
            height: borderRect.height,
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
      highestNode = startingAtNode.child;//JIC
    } else if (startingAtNode is ScaffoldNode) {
      highestNode = startingAtNode;
    } else {
      highestNode = (startingAtNode.getParent() ?? startingAtNode) as STreeNode;
    }
    // var b = startingAtNode.nodeWidgetGK?.currentContext?.mounted;

    var fc = FC();

    // set bloc state skipSnippetPanelBuild true
    String? jsonBeforePush = fc.currentSnippet(snippetName)?.toJson();
    fc.capiBloc.add(CAPIEvent.pushSnippetBloc(snippetName: snippetName, visibleDecendantNode: highestNode));
    // Useful.afterNextBuildDo(() {
    // });
    // return;
    Useful.afterNextBuildDo(() {
      debugPrint('after pushSnippetBloc');
      var b = startingAtNode.nodeWidgetGK?.currentContext?.mounted;
      var gk = startingAtNode.nodeWidgetGK;
      var ctx = gk?.currentContext;
      if (fc.snippetBeingEdited != null /*&& ctx != null*/) {
        Useful.afterNextBuildDo(() {
          fc.snippetBeingEdited?.treeC.expandAll();
          fc.snippetBeingEdited?.treeC.rebuild();
        });
        showSnippetTreeAndPropertiesCallout(
          snippetBloc: fc.snippetBeingEdited!,
          targetGKF: () => gk,
          onDismissedF: () {
// CAPIState.snippetStateMap[snippetBloc.snippetName] = snippetBloc.state;
            var snippetBloc = fc.snippetBeingEdited;
            STreeNode.unhighlightSelectedNode();
            Callout.dismiss('selected-panel-border-overlay');
            showAllTargetBtns();
            showAllTargetCovers();
            // fc.capiBloc.add(const CAPIEvent.popSnippetBloc());
            Callout.dismiss(TREENODE_MENU_CALLOUT);
            MaterialSPAState.exitEditMode();
            // skip if no change
            String currentJsonS = snippetBloc!.rootNode.toJson();
            if (jsonBeforePush == currentJsonS) return;
            fc.possiblyCacheAndSaveANewSnippetVersion(
              snippetName: snippetName,
              rootNode: fc.snippetBeingEdited!.rootNode,
            );
            // fc.capiBloc.add(
            //       CAPIEvent.saveSnippet(
            //         snippetRootNode: fc.snippetBeingEdited!.rootNode,
            //         newVersionId: newVersionId,
            //       ),
            //     );
            Useful.afterNextBuildDo(() {
              MaterialSPAState.showDevToolsFAB();
            });
          },
          startingAtNode: startingAtNode,
          selectedNode: selectedNode,
        );

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

  void refreshWithUpdate(VoidCallback assignF) {
    assignF.call();
    FC.forceRefresh();
    Useful.afterNextBuildDo(() {
      SnippetBloC? snippetBloc = fc.snippetBeingEdited;
      SnippetState? snippetBlocState = snippetBloc?.state;
      if (snippetBlocState?.selectedNode != null) {
        MaterialSPAState.showNodeWidgetOverlay((snippetBlocState?.selectedNode)!);
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
    ScaffoldNode? scaffold = findNearestAncestor<ScaffoldNode>();
    if (this is RichTextNode) return false;
    TabBarNode? tabBar = scaffold?.appBar?.bottom?.child as TabBarNode?;
    TabBarViewNode? tabBarView = scaffold?.body.child as TabBarViewNode?;
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
    return true;
  }

  bool hasChildren() =>
      (this is SC && (this as SC).child != null) ||
      (this is MC && (this as MC).children.isNotEmpty) ||
      (this is TextSpanNode && ((this as TextSpanNode).children?.length ?? 0) > 0);

  List<String> sensibleParents() => const [];

  GlobalKey createNodeGK() {
    // debugPrint('--- createNodeGK --- ${toString()}');
    nodeWidgetGK = GlobalKey(debugLabel: toString());
    if (fc.gkSTreeNodeMap.containsKey(nodeWidgetGK)) {
      print('Trying to use GlobalKey twice!');
    }
    fc.gkSTreeNodeMap[nodeWidgetGK!] = this;
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
      debugPrint(node.runtimeType.toString());
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
    var fc = FC();
    List<TargetModel> foundTargets = [];
    for (SnippetName snippetName in fc.snippetInfoCache.keys) {
      // get published or editing version
      SnippetInfoModel? snippetInfo = fc.snippetInfoCache[snippetName];
      if (snippetInfo == null) return foundTargets;
      VersionId? versionId = fc.canEditContent ? snippetInfo.editingVersionId : snippetInfo.publishedVersionId;
      if (versionId == null) return foundTargets;
      List<STreeNode> tws = fc.versionCache[snippetName]?[versionId]?.findDescendantsOfType(HotspotsNode) ?? [];
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
                    hspacer(10),
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
    if (fc.selectedNode == this) {
      unhighlightSelectedNode();
      SnippetBloC? snippetBloc = fc.snippetBeingEdited;
      var gk = nodeWidgetGK;
      Rect? r = gk?.globalPaintBounds();
      if (r != null) {
        double thickness = 4;
        double w = r.width + thickness * 2;
        double h = r.height + thickness * 2;
        Offset translate = Offset(-thickness, -thickness);
        debugPrint("Showing $SELECTED_NODE_BORDER_CALLOUT");
        Callout.showOverlay(
          ensureLowestOverlay: true,
          calloutConfig: CalloutConfig(
            feature: SELECTED_NODE_BORDER_CALLOUT,
            initialCalloutPos: r.topLeft.translate(translate.dx, translate.dy),
            suppliedCalloutW: w,
            suppliedCalloutH: h,
            fillColor: Colors.transparent,
            arrowType: ArrowType.NO_CONNECTOR,
            draggable: false,
            transparentPointer: true,
          ),
          boxContentF: (context) => InkWell(
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
        // fc.snippetBeingEdited?.add(SnippetEvent.highlightNode(node: this));
      }
    }
  }

//   Future<void> possiblyHighlightSelectedNode() async {
//     if (fc.selectedNode == this) {
//       if (true || fc.highlightedNode != fc.selectedNode) {
//         Useful.afterNextBuildDo(() {
// // if (Callout.anyPresent([SELECTED_NODE_BORDER_CALLOUT])) {
//           unhighlightSelectedNode();
// // }
//           SnippetBloC? snippetBloc = fc.snippetBeingEdited;
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
//                 feature: SELECTED_NODE_BORDER_CALLOUT,
//                 initialCalloutPos:
//                     r.topLeft.translate(translate.dx, translate.dy),
//                 suppliedCalloutW: w,
//                 suppliedCalloutH: h,
//                 fillColor: Colors.transparent,
//                 arrowType: ArrowType.NO_CONNECTOR,
//                 draggable: false,
//                 transparentPointer: true,
//               ),
//               boxContentF: (context) => InkWell(
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
// // Useful.afterMsDelayDo(1000, () {
// //   Useful.om.moveToTop("TreeNodeMenu".hashCode);
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
//         CAPIBloC bloc = FlutterContent().capiBloc;
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
//       child: Useful.coloredText('paste from clipboard', color: Colors.blue),
//     );
//   }
//   return null;
// }

// MenuItemButton? _pasteMIOLD(BuildContext context, AddAction action) {
//   if (bloc.state.jsonClipboard != null && action != AddAction.wrapWith) {
//     return MenuItemButton(
//       onPressed: () {
//         CAPIBloc bloc = FlutterContent().capiBloc;
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
//             child: Useful.whiteText(
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
//       const (AlignNode) => Useful.coloredText("Align", color: color, fontWeight: fontWeight),
//       const (AspectRatioNode) => Useful.coloredText("AspectRatio", color: color, fontWeight: fontWeight),
//       const (AssetImageNode) => Useful.coloredText("AssetImage", color: color, fontWeight: fontWeight),
//       const (CarouselNode) => Useful.coloredText("Carousel", color: color, fontWeight: fontWeight),
//       const (CenterNode) => Useful.coloredText("Center", color: color, fontWeight: fontWeight),
//       const (ColumnNode) => Useful.coloredText("Column", color: color, fontWeight: fontWeight),
//       const (ContainerNode) => Useful.coloredText("Container", color: color, fontWeight: fontWeight),
//       const (DefaultTextStyleNode) => Useful.coloredText("DefaultTextStyle", color: color, fontWeight: fontWeight),
//       const (DirectoryNode) => Useful.coloredText("Directory", color: color, fontWeight: fontWeight),
//       const (ElevatedButtonNode) => Useful.coloredText("ElevatedButton", color: color, fontWeight: fontWeight),
//       const (ExpandedNode) => Useful.coloredText("Expanded", color: color, fontWeight: fontWeight),
//       const (FileNode) => Useful.coloredText("File", color: color, fontWeight: fontWeight),
//       const (FilledButtonNode) => Useful.coloredText("FilledButton", color: color, fontWeight: fontWeight),
//       const (FlexibleNode) => Useful.coloredText("Flexible", color: color, fontWeight: fontWeight),
//       const (GapNode) => Useful.coloredText("Gap", color: color, fontWeight: fontWeight),
//       const (GoogleDriveIFrameNode) => Useful.coloredText("GoogleDriveIFrame", color: color, fontWeight: fontWeight),
//       const (IconButtonNode) => Useful.coloredText("IconButton", color: color, fontWeight: fontWeight),
//       const (IFrameNode) => Useful.coloredText("IFrame", color: color, fontWeight: fontWeight),
//       const (MenuBarNode) => Useful.coloredText("MenuBar", color: color, fontWeight: fontWeight),
//       const (MenuItemButtonNode) => Useful.coloredText("MenuItemButton", color: color, fontWeight: fontWeight),
//       // const (NetworkImageNode) =>  Useful.coloredText("NetworkImage", color: color, fontWeight: fontWeight),
//       const (OutlinedButtonNode) => Useful.coloredText("OutlinedButton", color: color, fontWeight: fontWeight),
//       const (PaddingNode) => Useful.coloredText("Padding", color: color, fontWeight: fontWeight),
//       const (PlaceholderNode) => Useful.coloredText("Placeholder", color: color, fontWeight: fontWeight),
//       const (PollNode) => Useful.coloredText("Poll", color: color, fontWeight: fontWeight),
//       const (PollOptionNode) => Useful.coloredText("PollOption", color: color, fontWeight: fontWeight),
//       const (PositionedNode) => Useful.coloredText("Positioned", color: color, fontWeight: fontWeight),
//       const (RichTextNode) => Useful.coloredText("RichText", color: color, fontWeight: fontWeight),
//       const (RowNode) => Useful.coloredText("Row", color: color, fontWeight: fontWeight),
//       const (SizedBoxNode) => Useful.coloredText("SizedBox", color: color, fontWeight: fontWeight),
//       const (SingleChildScrollViewNode) => Useful.coloredText("SingleChildScrollView", color: color, fontWeight: fontWeight),
//       const (SnippetRootNode) => Useful.coloredText("Snippet", color: color, fontWeight: fontWeight),
//       const (SnippetRefNode) => Useful.coloredText("SnippetRef", color: color, fontWeight: fontWeight),
//       const (SplitViewNode) => Useful.coloredText("SplitView", color: color, fontWeight: fontWeight),
//       const (StackNode) => Useful.coloredText("Stack", color: color, fontWeight: fontWeight),
//       const (StepNode) => Useful.coloredText("Step", color: color, fontWeight: fontWeight),
//       const (StepperNode) => Useful.coloredText("Stepper", color: color, fontWeight: fontWeight),
//       const (SubmenuButtonNode) => Useful.coloredText("SubmenuButton", color: color, fontWeight: fontWeight),
//       const (TargetWrapperNode) => Useful.coloredText("TargetWrapper", color: color, fontWeight: fontWeight),
//       const (TargetGroupWrapperNode) => Useful.coloredText("TargetGroupWrapper", color: color, fontWeight: fontWeight),
//       const (TextButtonNode) => Useful.coloredText("TextButton", color: color, fontWeight: fontWeight),
//       const (TextNode) => Useful.coloredText("Text", color: color, fontWeight: fontWeight),
//       const (TextSpanNode) => Useful.coloredText("TextSpan", color: color, fontWeight: fontWeight),
//       const (WidgetSpanNode) => Useful.coloredText("WidgetSpan", color: color, fontWeight: fontWeight),
//       _ => Text('unknown type'),
//     };
}

// /// Exception when an encoded enum value has no match.
// class EnumException implements Exception {
//   String cause;
//
//   EnumException(this.cause);
// }
