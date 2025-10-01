import 'dart:math';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/button_style_properties.dart';
import 'package:flutter_content/src/snippet/snodes/algc_node.dart';
import 'package:flutter_content/src/snippet/snodes/quill_text_node.dart';
import 'package:flutter_content/src/snippet/snodes/tab_node.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'snodes/fs_image_node.dart';

part 'snode.mapper.dart';

const List<Type> childlessSubClasses = [
  AlgCNode,
  AssetImageNode,
  ChipNode,
  FileNode,
  // FirebaseStorageImageNode,
  FSImageNode,
  GapNode,
  GoogleDriveIFrameNode,
  IFrameNode,
  MarkdownNode,
  PlaceholderNode,
  PollOptionNode,
  QuillTextNode,
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
  PaddingNode,
  PositionedNode,
  SingleChildScrollViewNode,
  SizedBoxNode,
  SnippetRootNode,
  TabNode,
  TargetsWrapperNode,
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
  // TargetsWrapperNode,
];

const List<Type> flexSubClasses = [RowNode, ColumnNode];

enum NodeAction {
  replaceWith("replace with ..."),
  addChild("append child ..."),
  wrapWith("wrap with ..."),
  addSiblingBefore("insert sibling before ..."),
  addSiblingAfter("insert sibling after ...");

  const NodeAction(this.displayName);

  final String displayName;
}

@MappableClass(
  discriminatorKey: 'snode',
  includeSubClasses: [ScaffoldNode, AppBarNode, CL, SC, MC, InlineSpanNode],
)
abstract class SNode extends Node with SNodeMappable {
  String uid = UniqueKey().toString();

  Widget? widgetLogo() => FlutterLogo(size: 20);

  /// only use a PointerInterceptor for these snode types
  /// see https://pub.dev/packages/pointer_interceptor
  bool isHtmlElementViewOrPlatformView() => [
    IFrameNode.FLUTTER_TYPE,
    GoogleDriveIFrameNode.FLUTTER_TYPE,
    MarkdownNode.FLUTTER_TYPE,
    YTNode.FLUTTER_TYPE,
  ].contains(toString());

  GlobalKey? treeNodeGK;
  PNodeTreeController? _pTreeC;
  ScrollController? _propertiesPaneSC;
  List<PNode>? _properties;

  @JsonKey(includeFromJson: false, includeToJson: false)
  bool isExpanded = false;

  // @JsonKey(includeFromJson: false, includeToJson: false)
  // Rect? measuredRect;

  PNodeTreeController pTreeC(
    BuildContext context,
    Map<PropertyName, bool> prevExpansions,
  ) {
    _pTreeC ??= PNodeTreeController(
      roots: _properties ??= propertyNodes(context, getParent() as SNode?),
      childrenProvider: Node.propertyTreeChildrenProvider,
    );
    // prevExpansions =
    // _pTreeC!.expand(_pTreeC!.roots.first);
    //_pTreeC!.expandedNodes = prevExpansions;
    // if (false) {
    //   for (PropertyName pNodeName in prevExpansions.keys) {
    //     fco.logger.i('restoring $pNodeName ${prevExpansions[pNodeName]}');
    //     // find pNode by its name
    //     PNode? pNode = fco.pNodes[pNodeName];
    //     bool? expanded = prevExpansions[pNodeName];
    //     // override padding and margin s.t. they always get collapsed
    //     if (pNode != null && expanded != null) {
    //       _pTreeC!.setExpansionState(pNode, expanded);
    //     }
    //   }
    // }
    // _pTreeC!.rebuild();
    return _pTreeC!;
  }

  void forcePropertyTreeRefresh(BuildContext context) {
    return;
    // only related to group node, which are exandable
    // Map<PropertyName, bool> prevExpansions = {};
    // for (PNode pNode in _pTreeC?.expandedNodes ?? []) {
    //   prevExpansions[pNode.name] = pNode.expanded;
    // }
    // _properties = null;
    // _pTreeC = null;
    // pTreeC(context, prevExpansions);
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
  GlobalKey? _nodeWidgetGK; // gets used in toWidget()

  SnippetRootNode? rootNodeOfSnippet() {
    final result = this is SnippetRootNode
        ? this as SnippetRootNode
        : findNearestAncestor<SnippetRootNode>();
    if (result?.isValid() ?? false) {
      return result;
    } else {
      return null;
    }
  }

  List<PNode> propertyNodes(BuildContext context, SNode? parentSNode);

  // overidden by SNodes having text style props, such as TextNode, TextSpanNode, TabBarNode, DefaultTextStyleName and ChipNode
  TextStyleProperties? textStyleProperties() => null;

  void setTextStyleProperties(TextStyleProperties newProps) {}

  ButtonStyleProperties? buttonStyleProperties() => null;

  void setButtonStyleProperties(ButtonStyleProperties newProps) {}

  ContainerStyleProperties? containerStyleProperties() => null;

  void setContainerStyleProperties(ContainerStyleProperties newProps) {}

  // // selection always uses this gk
  // static GlobalKey get selectedWidgetGK {
  //   if (_selectedWidgetGK.currentState == null) return _selectedWidgetGK;
  //   fco.logger.i("selectionGK in use: ${_selectedWidgetGK.currentWidget.runtimeType}");
  //   return GlobalKey(debugLabel: 'selectionGK was in use');
  // }
  //
  // static final GlobalKey _selectedWidgetGK = GlobalKey(debugLabel: "selectionGK");

  static double BORDER = 4;

  //maybe a hotspot, so will have a tc
  void showTappableNodeWidgetOverlay(
    BuildContext context, {
    // bool whiteBarrier = false,
    ScrollControllerName? scName,
    // TargetModel? tc,
  }) {
    // Rect borderRect = measuredRect!; //_borderRect(measuredRect!);
    Rect? borderRect = calcBorderRect();

    if (borderRect != null) {
      CalloutConfig cc = _cc(
        cId: '${nodeWidgetGK.hashCode}-pink-overlay',
        borderRect: borderRect,
        scName: scName,
        followScroll: false,
      );
      fco.showOverlay(
        wrapInPointerInterceptor: isHtmlElementViewOrPlatformView(),
        ensureLowestOverlay: false,
        calloutContent: Tooltip(
          message: 'tap to edit this ${toString()} node',
          child: InkWell(
            onTap: () => tappedToEditSnippetNode(context, scName),
            child: Container(
              width: borderRect.width.abs(),
              height: borderRect.height.abs(),
              decoration: DottedDecoration(
                shape: Shape.box,
                dash: const <int>[6, 6],
                borderColor: Colors.black,
                strokeWidth: 3,
                fillColor: Colors.transparent,
                // fillGradient: fillGradient,
              ),
            ),
          ),
        ),
        calloutConfig: cc,
        targetGkF: () => nodeWidgetGK,
      );
    } else {
      print('borderRect?');
    }
  }

  void tappedToEditSnippetNode(
    BuildContext context,
    ScrollControllerName? scName,
  ) {
    // fco.logger.i("${toString()} tapped");
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
    EditablePageState? eps = EditablePage.of(context);
    eps?.dismissAllNodeWidgetOverlays();
    // remove the barrier if about to edit a content callout
    if (SnippetRootNode.isHotspotCalloutContent(snippetName)) {
      final cc = fco.findOE(snippetName)?.calloutConfig;
      cc?.rebuild(() {
        cc
          ..barrier = null
          ..targetPointerType = TargetPointerType.none();
      });
    }

    // actually push node parent, then select node - more user-friendly
    // tapped a real widget with GlobalKey of nodeWidgetGK
    // var tappedNodeName = nodeTypeName;
    // var cs = nodeWidgetGK?.currentState;
    // var cc = nodeWidgetGK?.currentContext;
    // bool isMOunted = cc?.mounted ?? false;
    // var cw = nodeWidgetGK?.currentWidget;

    // var savedOffsets = fco.saveScrollOffsets();

    pushThenShowNamedSnippetWithNodeSelected(snippetName, this, scName: scName);
  }

  void showSelectedNonTappableNodeWidgetOverlay({
    required Rect borderRect,
    ScrollControllerName? scName,
  }) {
    bool isSelected = this == fco.selectedNode;
    if (!isSelected) {
      return;
    }
    // if (this is AppBarNode || this is ScaffoldNode) return;
    CalloutConfig cc = _cc(
      cId: '${nodeWidgetGK.hashCode}-pink-overlay',
      borderRect: borderRect,
      scName: scName,
      followScroll: true,
    );
    // if (nodeWidgetGK?.currentContext != null) {
    //   EditablePageState? eps = EditablePage.of(
    //       nodeWidgetGK!.currentContext!);
    //   eps?.dismissAllNodeWidgetOverlays();
    // }
    fco.showOverlay(
      calloutContent: Container(
        width: cc.calloutW,
        height: cc.calloutH,
        decoration: DottedDecoration(
          shape: Shape.box,
          dash: const <int>[6, 6],
          borderColor: Colors.black,
          strokeWidth: 3,
          fillColor: Colors.transparent,
        ),
      ),
      calloutConfig: cc,
      wrapInPointerInterceptor: isHtmlElementViewOrPlatformView(),
    );
  }

  Rect? calcBorderRect() {
    // var gkState = nodeWidgetGK?.currentState;
    // var gkCtx = nodeWidgetGK?.currentContext;
    Rect? r = nodeWidgetGK?.globalPaintBounds(
      skipWidthConstraintWarning: true,
      skipHeightConstraintWarning: true,
    );
    // in case widget doesn't have a key (e.g. inlinespans)
    // r ??= (getParent() as SNode?)?.nodeWidgetGK?.globalPaintBounds(
    //   skipWidthConstraintWarning: true,
    //   skipHeightConstraintWarning: true,
    // );
    if (r != null) {
      Rect borderRect;
      // ensure has a width and height
      if (r.width < 1.0 || r.height < 1.0) {
        double w = max(r.width, 40);
        double h = max(r.height, 24);
        borderRect = Rect.fromLTWH(r.left, r.top, w, h);
      } else {
        borderRect = r;
      }
      return borderRect;
    }
    return null;
  }

  CalloutConfig _cc({
    required String cId,
    required Rect borderRect,
    ScrollControllerName? scName,
    bool? followScroll,
  }) => CalloutConfig(
    cId: cId,
    initialCalloutW: borderRect.width.abs(),
    // + BORDER,
    initialCalloutH: borderRect.height.abs(),
    // + BORDER,
    initialCalloutPos: OffsetModel.fromOffset(borderRect.topLeft),
    //.translate(-BORDER, -BORDER),
    decorationFillColors: ColorOrGradient.color(Colors.transparent),
    targetPointerType: TargetPointerType.none(),
    draggable: false,
    scrollControllerName: scName,
    skipOnScreenCheck: true,
    followScroll: followScroll ?? true,
  );

  // Decoration _decoration({bool transparent = true}) => BoxDecoration(
  //   shape: BoxShape.rectangle,
  //   color: transparent ? Colors.transparent : Colors.purpleAccent.withValues(alpha: .2),
  //   border: GradientBoxBorder(
  //     gradient: LinearGradient(
  //       colors: [
  //         Colors.purpleAccent.withValues(alpha: .5),
  //         Colors.yellowAccent.withValues(alpha: .5),
  //         Colors.grey.withValues(alpha: .5),
  //         Colors.purpleAccent.withValues(alpha: .5),
  //         Colors.purpleAccent.withValues(alpha: .5),
  //         Colors.purpleAccent.withValues(alpha: .5),
  //         Colors.purpleAccent.withValues(alpha: .5),
  //         Colors.purpleAccent.withValues(alpha: .5),
  //         Colors.purpleAccent.withValues(alpha: .5),
  //         Colors.grey.withValues(alpha: .5),
  //         Colors.yellowAccent.withValues(alpha: .5),
  //         Colors.purpleAccent.withValues(alpha: .5),
  //       ],
  //     ),
  //     width: BORDER,
  //   ),
  // );

  // node is where the snippet tree starts (not necc the snippet's root node)
  // selection is poss a current (lower) selection in the tree
  static Future<void> pushThenShowNamedSnippetWithNodeSelected(
    SnippetName snippetName,
    SNode selectedNode, {
    TargetModel? targetBeingConfigured,
    ScrollControllerName? scName,
  }) async {
    SnippetInfoModel? snippetInfo = SnippetInfoModel.cachedSnippetInfo(
      snippetName,
    );
    if (snippetInfo == null) return;

    SnippetRootNode? rootNode = await snippetInfo.currentVersionFromCacheOrFB();
    if (rootNode == null) return;

    // before starting the editing, check whether the context is null, which could mean this snippet is in a Tab and tab ay not be currently selected
    if (rootNode.child?.nodeWidgetGK?.currentContext == null) {
      fco.showToast(
        msg: "This node is not visible right now",
        bgColor: Colors.white,
        textColor: Colors.red,
        removeAfterMs: 5000,
      );
      return;
    }

    fco.capiBloc.add(
      CAPIEvent.pushSnippetEditor(
        rootNode: rootNode,
        selectedNode: selectedNode,
      ),
    );
    // fco.afterNextBuildDo(() {
    // });
    // return;
    // fco.logger.i('after pushSnippetBloc');
    // var b = startingAtNode.nodeWidgetGK?.currentContext?.mounted;
    fco.afterNextBuildDo(() {
      // fco.inEditMode.value = true;
      // var nodeGK = startingAtNode.nodeWidgetGK;

      // var tappedNodeName = nodeGK;
      // var cs = nodeGK?.currentState;
      // var cc = nodeGK?.currentContext;
      // bool isMOunted = cc?.mounted ?? false;
      // var cw = nodeGK?.currentWidget;

      if (fco.snippetBeingEdited != null) {
        // fco.snippetBeingEdited?.treeC.expandAll();
        // fco.snippetBeingEdited?.treeC.rebuild();
        // possibly show clipboard
        if (!fco.appInfo.clipboardIsEmpty) {
          fco.appInfo.showFloatingClipboard(scName: scName);
        }
        fco.hide(CalloutConfigToolbar.CID);
        fco.afterMsDelayDo(1000, () {
          var ctx = rootNode.child?.nodeWidgetGK?.currentContext;
          if (ctx != null) {
            EditablePageState? eps = EditablePage.of(ctx);
            eps?.showNodeWidgetOverlays();
          }
        });
      }
    });
  }

  void refreshWithUpdate(
    BuildContext context,
    VoidCallback assignF, {
    bool alsoRefreshPropertiesView = false,
  }) {
    // fco.capiBloc.state.snippetBeingEdited?.newVersion();

    assignF.call();
    // if (alsoRefreshPropertiesView) {
    //   forcePropertyTreeRefresh(context);
    // }
    // final rootNodeBefore = rootNodeOfSnippet();
    fco.forceRefresh();
    // final rootNodeAfter = rootNodeOfSnippet();
    // bool same = rootNodeAfter == rootNodeBefore;
    fco.afterNextBuildDo(() {
      if (!isValid()) {
        print('oooooops not valid in tree');
      }
      final rootNode = rootNodeOfSnippet();
      if (rootNode != null) {
        assert(rootNode.isValid());
        fco.saveNewVersion(snippet: rootNode);
        EditablePageState? eps = EditablePage.of(context);
        eps?.showNodeWidgetOverlays();
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
    // ScaffoldNode? scaffold = findNearestAncestor<ScaffoldNode>();
    // // if (this is RichTextNode) return false;
    // STreeNode? bottomChild;
    // if (scaffold?.appBar is AppBarNode) {
    //   AppBarNode appbar = scaffold?.appBar as AppBarNode;
    //   bottomChild = appbar.bottom?.child;
    // } else if (scaffold?.appBar is AppBarWithTabBarNode) {
    //   AppBarWithTabBarNode appbar = scaffold?.appBar as AppBarWithTabBarNode;
    //   bottomChild = appbar.bottom?.child;
    // } else if (scaffold?.appBar is AppBarWithMenuBarNode) {
    //   AppBarWithMenuBarNode appbar = scaffold?.appBar as AppBarWithMenuBarNode;
    //   bottomChild = appbar.bottom?.child;
    // }
    // if (bottomChild is TabBarNode) {
    //   TabBarNode? tabBar = bottomChild;
    //   TabBarViewNode? tabBarView = scaffold?.body?.child as TabBarViewNode?;
    //   var firstTab = tabBar.children.firstOrNull;
    //   var firstTabView = tabBar.children.firstOrNull;
    //   int numTabs = tabBar.children.length ?? 99;
    //   int numTabBiews = tabBarView?.children.length ?? 99;
    //   if (firstTab == this && numTabs < 2) {
    //     return false;
    //   }
    //   if (firstTabView == this && numTabBiews < 2) {
    //     return false;
    //   }
    // }
    // if (bottomChild is MenuBarNode) {
    //   return bottomChild.children.isEmpty;
    // }
    return true;
  }

  bool get canShowTappableNodeWidgetOverlay => getParent() is! CarouselNode;

  bool hasChildren() =>
      (this is SC && (this as SC).child != null) ||
      (this is MC && (this as MC).children.isNotEmpty) ||
      (this is TextSpanNode &&
          ((this as TextSpanNode).children?.length ?? 0) > 0);

  // List<String> sensibleParents() => const [];

  GlobalKey createNodeWidgetGK() {
    print('--- createNodeGK --- ${toString()}');
    String debugLabel = toString();
    if (this is TextNode) {
      debugLabel += "${(this as TextNode).text}";
    }
    _nodeWidgetGK = GlobalKey(debugLabel: debugLabel);
    // if (fco.nodesByGK.containsKey(nodeWidgetGK)) {
    //   fco.logger.d('Trying to use GlobalKey twice!');
    // }
    if (!fco.nodesByGK.containsKey(_nodeWidgetGK)) {
      fco.nodesByGK[_nodeWidgetGK!] = this;
    }
    return _nodeWidgetGK!;
  }

  GlobalKey? get nodeWidgetGK => _nodeWidgetGK;

  set nodeWidgetGK(GlobalKey? newGK) => _nodeWidgetGK = newGK;

  // ScrollController get nodeSC {
  //   // fco.logger.i('--- createNodeSC --- ${toString()}');
  //   ScrollController sC = ScrollController();
  //   fco.sCsNodeMap[nodeWidgetGK!] ??= sC;
  //   return sC;
  // }

  bool isValid() {
    if (!parentIsValid()) return false;
    if (!childrenAreValid()) return false;
    return true;
  }

  bool parentIsValid() {
    // this must be a child of it's parent
    final parent = getParent();
    if (parent == null && this is SnippetRootNode) {
      return true; // must be a snippetRootNode; ignore
    }
    if (parent is SC && parent.child == this) return true;
    if (parent is MC && parent.children.contains(this)) return true;
    if (parent is TextSpanNode &&
        (parent.children != null || parent.children!.contains(this))) {
      return true;
    }
    return false;
  }

  bool childrenAreValid() {
    if (hasChildren()) {
      if (this is SC) {
        final scn = this as SC;
        if (scn.child?.getParent() != scn) return false;
        return scn.child?.childrenAreValid() ?? true;
      } else if (this is MC) {
        final mcn = this as MC;
        // check that its children all point back
        for (final child in mcn.children) {
          if (child.getParent() != mcn) return false;
          return child.childrenAreValid();
        }
      }
    } else if (this is TextSpanNode) {
      // otherwise must be a TextSpanNode
      final tsn = this as TextSpanNode;
      // check that its children all point back
      for (final child in tsn.children ?? []) {
        if (child.getParent() != tsn) return false;
        return child.childrenAreValid();
      }
    }

    return true;
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
      tabBar?.children.add(
        TextNode(text: ' fixed tab', tsPropGroup: TextStyleProperties())
          ..setParent(tabBar),
      );
    }
    // bool doubleCheck = anyMissingParents();
    // fco.logger.i("missing parents: $doubleCheck");
    // if (tabBar != null) {
    //   fco.logger.i("TabBar: ${tabBar.children.length}, TabBarView: ${tabBarView?.children.length} views");
    // }
  }

  void _setParents(SNode? parent) {
    setParent(parent);
    var children = Node.snippetTreeChildrenProvider(this);
    for (SNode child in children) {
      child._setParents(this);
    }
  }

  bool anyMissingParents() {
    var children = Node.snippetTreeChildrenProvider(this);
    for (SNode child in children) {
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

  SNode? findDescendant(Type type) {
    //
    SNode? foundChild;

    void findMatchingChild(SNode parent) {
      bool keepSearching = true;
      for (SNode child in Node.snippetTreeChildrenProvider(parent)) {
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

  List<SNode> findDescendantsOfType(Type type) {
    //
    List<SNode> foundNodes = [];

    void findMatchingDescendants(SNode node) {
      for (SNode child in Node.snippetTreeChildrenProvider(node)) {
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
      // fco.logger.i(node.runtimeType.toString());
      // if (node.runtimeType == FSBucketNode) {
      //   fco.logger.d('x');
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

  static void showAllHotspotTargetCovers() {
    for (TargetModel tc in allTargets()) {
      // if (tc.hasAHotspot())
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
      SnippetInfoModel? snippetInfo = SnippetInfoModel.cachedSnippetInfo(
        snippetName,
      );
      if (snippetInfo == null) return foundTargets;
      VersionId? versionId = snippetInfo.currentVersionId();
      if (versionId == null) return foundTargets;
      List<SNode> tws =
          snippetInfo.currentVersionFromCache()?.findDescendantsOfType(
            TargetsWrapperNode,
          ) ??
          [];
      for (SNode tw in tws) {
        foundTargets.addAll((tw as TargetsWrapperNode).targets);
      }
    }
    return foundTargets;
  }

  // check nodes are identical
  bool isSame(SNode otherNode) => toJson() == otherNode.toJson();

  Widget buildFlutterWidget(BuildContext context, SNode? parentNode) =>
      const Placeholder();

  Widget possiblyCheckHeightConstraint(SNode? parentNode, Widget actualWidget) {
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
                    const Icon(Icons.error, color: Colors.red),
                    const Gap(10),
                    Text('${toString()} has infinite maxHeight constraint!'),
                  ],
                )
              : actualWidget;
        },
      );
    }
  }

  // static void unhighlightSelectedNode() =>
  //     fco.dismiss(SELECTED_NODE_BORDER_CALLOUT);

  // Future<void> possiblyHighlightSelectedNode(ScrollControllerName? scName) async {
  //   return;
  //   if (fco.snippetBeingEdited?.selectedNode == this) {
  //     unhighlightSelectedNode();
  //     var gk = nodeWidgetGK;
  //     Rect? r = gk?.globalPaintBounds();
  //     if (r != null) {
  //       double thickness = 4;
  //       double w = r.width + thickness * 2;
  //       double h = r.height + thickness * 2;
  //       Offset translate = Offset(-thickness, -thickness);
  //       // fco.logger.i("Showing $SELECTED_NODE_BORDER_CALLOUT");
  //       fco.showOverlay(
  //         ensureLowestOverlay: true,
  //         calloutConfig: CalloutConfig(
  //           cId: SELECTED_NODE_BORDER_CALLOUT,
  //           initialCalloutPos: r.topLeft.translate(translate.dx, translate.dy),
  //           initialCalloutW: w,
  //           initialCalloutH: h,
  //           fillColor: Colors.transparent,
  //           arrowType: ArrowTypeEnumModel.NONE,
  //           draggable: false,
  //           // transparentPointer: true,
  //           scrollControllerName: scName,
  //         ),
  //         calloutContent: InkWell(
  //           child: Container(
  //             width: w,
  //             height: h,
  //             decoration: BoxDecoration(
  //               color: Colors.transparent,
  //               border: Border.all(
  //                   color: Colors.purpleAccent.withValues(alpha:.5),
  //                   width: thickness),
  //             ),
  //           ),
  //         ),
  //       );
  //       // FCO.snippetBeingEdited?.add(SnippetEvent.highlightNode(node: this));
  //     }
  //   }
  // }

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
  //             fco.logger.i("Showing $SELECTED_NODE_BORDER_CALLOUT");
  //             fco.showOverlay(
  //               ensureLowestOverlay: true,
  //               calloutConfig: CalloutConfig(
  //                 cId: SELECTED_NODE_BORDER_CALLOUT,
  //                 initialCalloutPos:
  //                     r.topLeft.translate(translate.dx, translate.dy),
  //                 initialCalloutW: w,
  //                 initialCalloutH: h,
  //                 fillColor: Colors.transparent,
  //                 arrowType: ArrowTypeEnumModel.NONE,
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
  //                         color: Colors.purpleAccent.withValues(alpha:.5),
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
  //   // fco.logger.i(nodeTypeCandidates.toString());
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
  //   fco.logger.i(typeString);
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
    BuildContext context, {

    required NodeAction action,
    String? label,
    Color? bgColor,
    String? tooltip,
    ScrollControllerName? scName,
    key,
  }) {
    var title = action == NodeAction.replaceWith
        ? 'replace with...'
        : action == NodeAction.wrapWith
        ? 'wrap with...'
        : action == NodeAction.addSiblingBefore
        ? 'insert before...'
        : action == NodeAction.addSiblingAfter
        ? 'insert after...'
        : 'append child...';

    List<Widget> menuChildren = menuAnchorWidgets(context, action, scName);
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
                icon: action == NodeAction.replaceWith
                    ? const Icon(Icons.refresh)
                    : const Icon(Icons.add),
                label: Text(title),
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    bgColor ?? Colors.white.withValues(alpha: .9),
                  ),
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                  //padding: WidgetStatePropertyAll(EdgeInsets.zero),
                ),
              )
            : IconButton(
                key: key,
                // hoverColor: bgColor?.withValues(alpha:.5),
                padding: EdgeInsets.zero,
                onPressed: () {
                  if (controller.isOpen) {
                    controller.close();
                  } else {
                    controller.open();
                  }
                },
                icon: Icon(Icons.add_box, color: bgColor, size: 40),
                tooltip: title,
                // style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.white.withValues(alpha:.9),
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
    BuildContext context,
    NodeAction action,
    ScrollControllerName? scName,
  ) {
    List<Widget> mis = [];
    if (action == NodeAction.wrapWith) {
      mis.addAll(menuAnchorWidgets_WrapWith(context, action, false, scName));
    }
    if (action == NodeAction.addChild) {
      mis.addAll(menuAnchorWidgets_Append(context, action, false, scName));
    }
    if (action == NodeAction.addSiblingBefore ||
        action == NodeAction.addSiblingAfter) {
      mis.addAll(
        menuAnchorWidgets_InsertSibling(context, action, false, scName),
      );
    }
    if (action == NodeAction.replaceWith) {
      mis.addAll(menuAnchorWidgets_ReplaceWith(context, action, scName, false));
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

  // List<Type> addChildOnly() => [];

  // List<Type> addChildRecommendations() => [];

  // List<Type> insertSiblingOnly() => [];

  // List<Type> insertSiblingRecommendations() => [];

  List<Widget> menuAnchorWidgets_WrapWith(
    BuildContext context,
    NodeAction action,
    bool? skipHeading,
    ScrollControllerName? scName,
  ) {
    return [
      if (!(skipHeading ?? false))
        ...menuAnchorWidgets_Heading(context, action, scName),
      SubmenuButton(
        menuChildren: [
          menuItemButton(context, "Align", AlignNode, action, scName),
          menuItemButton(context, "Center", CenterNode, action, scName),
          menuItemButton(context, "Container", ContainerNode, action, scName),
          menuItemButton(context, "Padding", PaddingNode, action, scName),
          menuItemButton(context, "SizedBox", SizedBoxNode, action, scName),
          menuItemButton(
            context,
            "SingleChildScrollView",
            SingleChildScrollViewNode,
            action,
            scName,
          ),
          const Divider(),
          menuItemButton(context, "Column", ColumnNode, action, scName),
          menuItemButton(context, "Row", RowNode, action, scName),
          menuItemButton(context, "Wrap", WrapNode, action, scName),
          menuItemButton(context, "Expanded", ExpandedNode, action, scName),
          menuItemButton(context, "Flexible", FlexibleNode, action, scName),
          menuItemButton(context, "Stack", StackNode, action, scName),
          menuItemButton(context, "Positioned", PositionedNode, action, scName),
          const Divider(),
          menuItemButton(context, "Scaffold", ScaffoldNode, action, scName),
        ],
        child: fco.coloredText("container", fontWeight: FontWeight.normal),
      ),
      menuItemButton(context, "SplitView", SplitViewNode, action, scName),
      menuItemButton(context, "Hotspots", TargetsWrapperNode, action, scName),
      menuItemButton(
        context,
        "DefaultTextStyle",
        DefaultTextStyleNode,
        action,
        scName,
      ),
      menuItemButton(context, "Aspect Ratio", AspectRatioNode, action, scName),
    ];
  }

  List<Widget> menuAnchorWidgets_Append(
    BuildContext context,
    NodeAction action,
    bool? skipHeading,
    ScrollControllerName? scName,
  ) {
    return [
      if (!(skipHeading ?? false))
        ...menuAnchorWidgets_Heading(context, action, scName),
      SubmenuButton(
        menuChildren: [
          menuItemButton(context, "Align", AlignNode, action, scName),
          menuItemButton(context, "Center", CenterNode, action, scName),
          menuItemButton(context, "Container", ContainerNode, action, scName),
          menuItemButton(context, "Expanded", ExpandedNode, action, scName),
          // _addChildmenuItemButton(context, "IntrinsicHeight", IntrinsicHeightNode, action, scName),
          // _addChildmenuItemButton(context, "IntrinsicWidth", IntrinsicWidthNode, action, scName),
          menuItemButton(context, "Padding", PaddingNode, action, scName),
          menuItemButton(context, "SizedBox", SizedBoxNode, action, scName),
          menuItemButton(
            context,
            "SingleChildScrollView",
            SingleChildScrollViewNode,
            action,
            scName,
          ),
          const Divider(),
          menuItemButton(context, "Column", ColumnNode, action, scName),
          menuItemButton(context, "Row", RowNode, action, scName),
          menuItemButton(context, "Wrap", WrapNode, action, scName),
          menuItemButton(context, "Stack", StackNode, action, scName),
          const Divider(),
          menuItemButton(context, "Scaffold", ScaffoldNode, action, scName),
        ],
        child: fco.coloredText("container", fontWeight: FontWeight.normal),
      ),
      SubmenuButton(
        menuChildren: [
          menuItemButton(
            context,
            "DefaultTextStyle",
            DefaultTextStyleNode,
            action,
            scName,
          ),
          menuItemButton(context, "Text", TextNode, action, scName),
          menuItemButton(context, "QuillText", QuillTextNode, action, scName),
          menuItemButton(context, "RichText", RichTextNode, action, scName),
          menuItemButton(context, "TextSpan", TextSpanNode, action, scName),
          menuItemButton(context, "WidgetSpan", WidgetSpanNode, action, scName),
        ],
        child: fco.coloredText("text", fontWeight: FontWeight.normal),
      ),
      SubmenuButton(
        menuChildren: [
          SubmenuButton(
            menuChildren: [
              menuItemButton(
                context,
                "MenuItemButton",
                MenuItemButtonNode,
                action,
                scName,
              ),
              menuItemButton(
                context,
                "SubmenuButton",
                SubmenuButtonNode,
                action,
                scName,
              ),
              menuItemButton(context, "MenuBar", MenuBarNode, action, scName),
            ],
            child: fco.coloredText("menu", fontWeight: FontWeight.normal),
          ),
          SubmenuButton(
            menuChildren: [
              menuItemButton(context, "TabBar", TabBarNode, action, scName),
              menuItemButton(
                context,
                "TabBarView",
                TabBarViewNode,
                action,
                scName,
              ),
            ],
            child: fco.coloredText("tab bar", fontWeight: FontWeight.normal),
          ),
          SubmenuButton(
            menuChildren: [
              menuItemButton(
                context,
                "ElevatedButton",
                ElevatedButtonNode,
                action,
                scName,
              ),
              menuItemButton(
                context,
                "OutlinedButton",
                OutlinedButtonNode,
                action,
                scName,
              ),
              menuItemButton(
                context,
                "TextButton",
                TextButtonNode,
                action,
                scName,
              ),
              menuItemButton(
                context,
                "FilledButton",
                FilledButtonNode,
                action,
                scName,
              ),
              menuItemButton(
                context,
                "IconButton",
                IconButtonNode,
                action,
                scName,
              ),
            ],
            child: fco.coloredText("button", fontWeight: FontWeight.normal),
          ),
          menuItemButton(context, "Chip", ChipNode, action, scName),
        ],
        child: fco.coloredText("navigation", fontWeight: FontWeight.normal),
      ),
      SubmenuButton(
        menuChildren: [
          menuItemButton(
            context,
            "Asset Image",
            AssetImageNode,
            action,
            scName,
          ),
          menuItemButton(context, "Algorithm", AlgCNode, action, scName),
          menuItemButton(context, "UML", UMLImageNode, action, scName),
          menuItemButton(
            context,
            "Firebase Storage Image",
            FSImageNode,
            action,
            scName,
          ),
          menuItemButton(context, "Carousel", CarouselNode, action, scName),
          menuItemButton(
            context,
            "Aspect Ratio",
            AspectRatioNode,
            action,
            scName,
          ),
        ],
        child: fco.coloredText("image", fontWeight: FontWeight.normal),
      ),
      SubmenuButton(
        menuChildren: [
          menuItemButton(context, "iframe", IFrameNode, action, scName),
          menuItemButton(
            context,
            "Google Drive iframe",
            GoogleDriveIFrameNode,
            action,
            scName,
          ),
          menuItemButton(context, "File", FileNode, action, scName),
          menuItemButton(context, "Directory", DirectoryNode, action, scName),
        ],
        child: fco.coloredText("file", fontWeight: FontWeight.normal),
      ),
      menuItemButton(context, "SplitView", SplitViewNode, action, scName),
      menuItemButton(context, "Stepper", StepperNode, action, scName),
      menuItemButton(context, "Gap", GapNode, action, scName),
      menuItemButton(context, "Hotspots", TargetsWrapperNode, action, scName),
      menuItemButton(context, "Poll", PollNode, action, scName),
      menuItemButton(context, "Placeholder", PlaceholderNode, action, scName),
      menuItemButton(context, "Youtube", YTNode, action, scName),
      menuItemButton(context, "Markdown", MarkdownNode, action, scName),
      addSnippetsSubmenu(action, scName),
    ];
  }

  List<Widget> menuAnchorWidgets_InsertSibling(
    BuildContext context,
    NodeAction action,
    bool? skipHeading,
    ScrollControllerName? scName,
  ) {
    return [
      if (!(skipHeading ?? false))
        ...menuAnchorWidgets_Heading(context, action, scName),
      if (getParent() is FlexNode) ...[
        menuItemButton(context, "Expanded", ExpandedNode, action, scName),
        menuItemButton(context, "Flexible", FlexibleNode, action, scName),
      ],
      if (getParent() is StepperNode)
        menuItemButton(context, "Step", StepNode, action, scName),
      if (getParent() is PollNode)
        menuItemButton(context, "PollOption", PollOptionNode, action, scName),
      if (getParent() is StackNode)
        menuItemButton(context, "Positioned", PositionedNode, action, scName),
      if (getParent() is StackNode)
        menuItemButton(context, "Align", AlignNode, action, scName),
      if (getParent() is DirectoryNode) ...[
        menuItemButton(context, "Directory", DirectoryNode, action, scName),
        menuItemButton(context, "File", FileNode, action, scName),
      ],
      if (getParent() is MenuBarNode) ...[
        menuItemButton(
          context,
          "SubMenuButton",
          SubmenuButtonNode,
          action,
          scName,
        ),
        menuItemButton(
          context,
          "MenuItemButton",
          MenuItemButtonNode,
          action,
          scName,
        ),
      ],
      if (getParent() is SubmenuButtonNode) ...[
        menuItemButton(
          context,
          "MenuItemButton",
          MenuItemButtonNode,
          action,
          scName,
        ),
      ],
      if (getParent() is CarouselNode) ...[
        menuItemButton(context, "AssetImage", AssetImageNode, action, scName),
        menuItemButton(context, "Algorithm", AlgCNode, action, scName),
        menuItemButton(context, "UML", UMLImageNode, action, scName),
        menuItemButton(
          context,
          "FirestoreStorageImage",
          FSImageNode,
          action,
          scName,
        ),
      ],
      if (getParent() is TextSpanNode) ...[
        menuItemButton(context, "TextSpanN", TextSpanNode, action, scName),
        menuItemButton(context, "WidgetSpan", WidgetSpanNode, action, scName),
      ],
      if (getParent() is! PollNode)
        ...menuAnchorWidgets_Append(context, action, true, scName),
    ];
  }

  List<Widget> menuAnchorWidgets_ReplaceWith(
    BuildContext context,
    NodeAction action,
    ScrollControllerName? scName,
    bool? skipHeading,
  ) {
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
        child: Center(child: fco.purpleText(action.displayName)),
      ),
      pasteMI(action) ?? const Offstage(),

      for (Type type in replaceTypes)
        menuItemButton(context, type.toString(), type, action, scName),
      if (!skipTheRest) ...[
        SubmenuButton(
          menuChildren: [
            menuItemButton(context, "Align", AlignNode, action, scName),
            menuItemButton(context, "Center", CenterNode, action, scName),
            menuItemButton(context, "Container", ContainerNode, action, scName),
            menuItemButton(context, "Padding", PaddingNode, action, scName),
            menuItemButton(context, "SizedBox", SizedBoxNode, action, scName),
            menuItemButton(
              context,
              "SingleChildScrollView",
              SingleChildScrollViewNode,
              action,
              scName,
            ),
            const Divider(),
            menuItemButton(context, "Column", ColumnNode, action, scName),
            menuItemButton(context, "Row", RowNode, action, scName),
            menuItemButton(context, "Wrap", WrapNode, action, scName),
            menuItemButton(context, "Expanded", ExpandedNode, action, scName),
            menuItemButton(context, "Flexible", FlexibleNode, action, scName),
            menuItemButton(context, "Stack", StackNode, action, scName),
            menuItemButton(
              context,
              "Positioned",
              PositionedNode,
              action,
              scName,
            ),
            const Divider(),
            menuItemButton(context, "Scaffold", ScaffoldNode, action, scName),
          ],
          child: fco.coloredText("container", fontWeight: FontWeight.normal),
        ),
        SubmenuButton(
          menuChildren: [
            menuItemButton(
              context,
              "DefaultTextStyle",
              DefaultTextStyleNode,
              action,
              scName,
            ),
            menuItemButton(context, "Text", TextNode, action, scName),
            menuItemButton(context, "QuillText", QuillTextNode, action, scName),
            menuItemButton(context, "RichText", RichTextNode, action, scName),
            menuItemButton(context, "TextSpan", TextSpanNode, action, scName),
            menuItemButton(
              context,
              "WidgetSpan",
              WidgetSpanNode,
              action,
              scName,
            ),
          ],
          child: fco.coloredText("text", fontWeight: FontWeight.normal),
        ),
        SubmenuButton(
          menuChildren: [
            SubmenuButton(
              menuChildren: [
                menuItemButton(
                  context,
                  "MenuItemButton",
                  MenuItemButtonNode,
                  action,
                  scName,
                ),
                menuItemButton(
                  context,
                  "SubmenuButton",
                  SubmenuButtonNode,
                  action,
                  scName,
                ),
                menuItemButton(context, "MenuBar", MenuBarNode, action, scName),
              ],
              child: fco.coloredText("menu", fontWeight: FontWeight.normal),
            ),
            SubmenuButton(
              menuChildren: [
                menuItemButton(context, "Tab", TabNode, action, scName),
                menuItemButton(context, "TabBar", TabBarNode, action, scName),
                menuItemButton(
                  context,
                  "TabBarView",
                  TabBarViewNode,
                  action,
                  scName,
                ),
              ],
              child: fco.coloredText("tab bar", fontWeight: FontWeight.normal),
            ),
            SubmenuButton(
              menuChildren: [
                menuItemButton(
                  context,
                  "ElevatedButton",
                  ElevatedButtonNode,
                  action,
                  scName,
                ),
                menuItemButton(
                  context,
                  "OutlinedButton",
                  OutlinedButtonNode,
                  action,
                  scName,
                ),
                menuItemButton(
                  context,
                  "TextButton",
                  TextButtonNode,
                  action,
                  scName,
                ),
                menuItemButton(
                  context,
                  "FilledButton",
                  FilledButtonNode,
                  action,
                  scName,
                ),
                menuItemButton(
                  context,
                  "IconButton",
                  IconButtonNode,
                  action,
                  scName,
                ),
              ],
              child: fco.coloredText("button", fontWeight: FontWeight.normal),
            ),
            menuItemButton(context, "Chip", ChipNode, action, scName),
          ],
          child: fco.coloredText("navigation", fontWeight: FontWeight.normal),
        ),
        SubmenuButton(
          menuChildren: [
            menuItemButton(
              context,
              "Asset Image",
              AssetImageNode,
              action,
              scName,
            ),
            menuItemButton(context, "Algorithm", AlgCNode, action, scName),
            menuItemButton(context, "UML", UMLImageNode, action, scName),
            menuItemButton(
              context,
              "Firebase Storage Image",
              FSImageNode,
              action,
              scName,
            ),
            menuItemButton(context, "Carousel", CarouselNode, action, scName),
            menuItemButton(
              context,
              "Aspect Ratio",
              AspectRatioNode,
              action,
              scName,
            ),
          ],
          child: fco.coloredText("image", fontWeight: FontWeight.normal),
        ),
        SubmenuButton(
          menuChildren: [
            menuItemButton(context, "iframe", IFrameNode, action, scName),
            menuItemButton(
              context,
              "Google Drive iframe",
              GoogleDriveIFrameNode,
              action,
              scName,
            ),
            menuItemButton(context, "File", FileNode, action, scName),
            menuItemButton(context, "Directory", DirectoryNode, action, scName),
          ],
          child: fco.coloredText("file", fontWeight: FontWeight.normal),
        ),
        menuItemButton(context, "SplitView", SplitViewNode, action, scName),
        menuItemButton(context, "Stepper", StepperNode, action, scName),
        menuItemButton(context, "Gap", GapNode, action, scName),
        // menuItemButton(context, "TargetWrapper", TargetButtonNode, action, scName),
        menuItemButton(context, "Hotspots", TargetsWrapperNode, action, scName),
        menuItemButton(context, "Poll", PollNode, action, scName),
        menuItemButton(context, "PollOption", PollOptionNode, action, scName),
        menuItemButton(context, "Placeholder", PlaceholderNode, action, scName),
        menuItemButton(context, "Youtube", YTNode, action, scName),
        menuItemButton(context, "Markdown", MarkdownNode, action, scName),
        addSnippetsSubmenu(action, scName),
      ],
    ];
  }

  List<Widget> menuAnchorWidgets_Heading(
    BuildContext context,
    NodeAction action,
    ScrollControllerName? scName,
  ) {
    return [
      Container(
        margin: const EdgeInsets.all(10),
        width: 200,
        height: 40,
        child: Center(child: fco.purpleText(action.displayName)),
      ),
      pasteMI(action) ?? const Offstage(),
    ];
  }

  MenuItemButton menuItemButton(
    BuildContext context,
    final String label,
    Type childType,
    NodeAction action,
    ScrollControllerName? scName,
  ) => MenuItemButton(
    onPressed: () {
      if (action == NodeAction.wrapWith) {
        // var treeC = fco.snippetBeingEdited?.treeC;
        // bool navUp = this == treeC?.roots.firstOrNull;
        fco.capiBloc.add(CAPIEvent.wrapSelectionWith(type: childType));
        // in case need to show more of the tree (higher up)
        // fco.afterNextBuildDo(() {
        //   if (navUp) {
        //     SnippetTreePane.navigateUpTree(scName);
        //   }
        //   fco.dismiss('node-actions');
        //   EditablePage.refreshSelectedNodeWidgetBorderOverlay(scName);
        // });
      } else if (action == NodeAction.replaceWith) {
        fco.capiBloc.add(CAPIEvent.replaceSelectionWith(type: childType));
        fco.afterNextBuildDo(() {
          fco.dismiss('node-actions');
          EditablePageState? eps = EditablePage.of(context);
          eps?.showNodeWidgetOverlays();
        });
      } else if (action == NodeAction.addChild) {
        fco.capiBloc.add(CAPIEvent.appendChild(type: childType));
        fco.afterNextBuildDo(() {
          fco.dismiss('node-actions');
          EditablePageState? eps = EditablePage.of(context);
          eps?.showNodeWidgetOverlays();
        });
      } else if (action == NodeAction.addSiblingBefore) {
        fco.capiBloc.add(CAPIEvent.addSiblingBefore(type: childType));
        fco.afterNextBuildDo(() {
          fco.dismiss('node-actions');
          EditablePageState? eps = EditablePage.of(context);
          eps?.showNodeWidgetOverlays();
        });
      } else if (action == NodeAction.addSiblingAfter) {
        fco.capiBloc.add(CAPIEvent.addSiblingAfter(type: childType));
        fco.afterNextBuildDo(() {
          fco.dismiss('node-actions');
          EditablePageState? eps = EditablePage.of(context);
          eps?.showNodeWidgetOverlays();
        });
      }
    },
    child: fco.coloredText(label, fontWeight: FontWeight.bold),
  );

  MenuItemButton? pasteMI(NodeAction action) {
    if (fco.appInfo.clipboard != null && action != NodeAction.wrapWith) {
      return MenuItemButton(
        onPressed: () {
          // CAPIBloC bloc = fco.capiBloc;
          switch (action) {
            case NodeAction.replaceWith:
              fco.capiBloc.add(const CAPIEvent.pasteReplacement());
              fco.afterNextBuildDo(() {
                fco.dismiss('node-actions');
              });
              break;
            case NodeAction.addSiblingBefore:
              fco.capiBloc.add(const CAPIEvent.pasteSiblingBefore());
              fco.afterNextBuildDo(() {
                fco.dismiss('node-actions');
              });
              break;
            case NodeAction.addSiblingAfter:
              fco.capiBloc.add(const CAPIEvent.pasteSiblingAfter());
              fco.afterNextBuildDo(() {
                fco.dismiss('node-actions');
              });
              break;
            case NodeAction.addChild:
              fco.capiBloc.add(const CAPIEvent.pasteChild());
              fco.afterNextBuildDo(() {
                fco.dismiss('node-actions');
              });
              break;
            case NodeAction.wrapWith:
              fco.dismiss('node-actions');
              break;
          }
          fco.afterNextBuildDo(() {
            fco.dismiss('node-actions');
          });
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
            await SnippetRootNode.loadSnippetFromCacheOrFromFB(
              snippetName: snippetName,
            );
            if (action == NodeAction.replaceWith) {
              fco.capiBloc.add(
                CAPIEvent.replaceSelectionWith(
                  type: SnippetRootNode,
                  snippetName: snippetName,
                ),
              );
              fco.afterNextBuildDo(() {
                fco.dismiss('node-actions');
              });
            } else if (action == NodeAction.addSiblingBefore) {
              fco.capiBloc.add(
                CAPIEvent.addSiblingBefore(
                  type: SnippetRootNode,
                  snippetName: snippetName,
                ),
              );
              // removeNodePropertiesCallout();
              fco.afterNextBuildDo(() {
                fco.dismiss('node-actions');
              });
            } else if (action == NodeAction.addSiblingAfter) {
              fco.capiBloc.add(
                CAPIEvent.addSiblingAfter(
                  type: SnippetRootNode,
                  snippetName: snippetName,
                ),
              );
              fco.afterNextBuildDo(() {
                fco.dismiss('node-actions');
              });
              // removeNodePropertiesCallout();
            } else if (action == NodeAction.addChild) {
              fco.capiBloc.add(
                CAPIEvent.appendChild(
                  type: SnippetRootNode,
                  snippetName: snippetName,
                ),
              );
              fco.afterNextBuildDo(() {
                fco.dismiss('node-actions');
              });
              // removeNodePropertiesCallout();
            }
          },
          child: Text(snippetName),
        ),
      );
    }
    return SubmenuButton(
      menuChildren: snippetMIs,
      child: const Text('snippet'),
    );
  }

  SNode clone() {
    String jsonS = toJson();
    var clonedNode = SNodeMapper.fromJson(jsonS);
    if (nodeWidgetGK != null && nodeWidgetGK == clonedNode.nodeWidgetGK) {
      fco.logger.d('gk cloned !)');
    }
    return clonedNode;
  }
}

// /// Exception when an encoded enum value has no match.
// class EnumException implements Exception {
//   String cause;
//
//   EnumException(this.cause);
// }
