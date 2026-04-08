import 'dart:math';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/snode_widget.dart';
import 'package:flutter_content/src/api/editable_page/snippet_editor_side_panel.dart';
import 'package:flutter_content/src/snippet/snodes/hotspots/widgets/hotspot_target_config_toolbar/hotspot_target_config_toolbar.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'widget_picker/quick_pick_panel.dart';
import 'widget_picker/widget_entry.dart';
import 'widget_picker/widget_picker_dialog.dart';
import 'widget_picker/widget_registry.dart';

part 'snode.mapper.dart';

const List<Type> childlessSubClasses = [
  AlgCNode,
  AppBarNode,
  AssetImageNode,
  ChipNode,
  FileNode,
  // FirebaseStorageImageNode,
  FlexibleSpaceBarNode,
  StorageImageNode,
  GapNode,
  GoogleDriveIFrameNode,
  IFrameNode,
  MarkdownNode,
  PlaceholderNode,
  PollOptionNode,
  QuillTextNode,
  RichTextNode,
  ScaffoldNode,
  ScrollViewNode,
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
  ConstrainedBoxNode,
  ContainerNode,
  DefaultTextStyleNode,
  FlexibleNode,
  NamedSC,
  NamedPS,
  InteractiveViewerNode,
  IntrinsicWidthNode,
  IntrinsicHeightNode,
  PaddingNode,
  PinnedHeaderSliverNode,
  PositionedNode,
  SingleChildScrollViewNode,
  SizedBoxNode,
  SliverFloatingHeaderNode,
  SliverResizingHeaderNode,
  SliverToBoxAdapterNode,
  SnippetRootNode,
  TabNode,
  TargetsWrapperNode,
];

const List<Type> multiChildSubClasses = [
  CarouselNode,
  DirectoryNode,
  FlexNode,
  NamedMC,
  MenuBarNode,
  PageViewNode,
  PollNode,
  SliverListListNode,
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
  discriminatorKey: 'DK:snode',
  includeSubClasses: [CL, SC, MC, InlineSpanNode],
  hook: PropertyRenameHook(
    'snode',
    'DK:snode',
  ), // 'first_name' -> JSON key, 'firstName' -> Dart field name
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

  // ScrollController? _propertiesPaneSC;
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
      childrenProvider: PNode.propertyTreeChildrenProvider,
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

  // double propertiesPaneScrollPos() => propertiesPaneSC().offset;

  // ScrollController propertiesPaneSC() =>
  //     _propertiesPaneSC ??= ScrollController();

  // FCO get fc => FCO;

  // ..addListener(() {
  //   propertiesPaneScrollPos =
  // });

  @JsonKey(includeFromJson: false, includeToJson: false)
  bool? hidePropertiesWhileDragging;

  @JsonKey(includeFromJson: false, includeToJson: false)
  GlobalKey? nodeGK; // gets used Scrollable.ensureVisible
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

  List<PNode> propertyNodes(BuildContext context, SNode? parentSNode) => [];

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
  // void showTappableNodeWidgetOverlay() {
  //   Rect? borderRect = calcBorderRect();
  //
  //   if (borderRect != null) {
  //     CalloutConfig cc = _cc(
  //       cId: '${nodeWidgetGK.hashCode}-pink-overlay',
  //       borderRect: borderRect,
  //       followScroll: false,
  //     );
  //     fco.showOverlay(
  //       wrapInPointerInterceptor: isHtmlElementViewOrPlatformView(),
  //       ensureLowestOverlay: false,
  //       calloutContent: Tooltip(
  //         message: 'tap to edit this ${toString()} node',
  //         child: GestureDetector(
  //           onTap: () => tappedToEditSnippetNode(),
  //           // onPanStart: (DragStartDetails event) {
  //           //   print('onPanStart');
  //           //
  //           // },
  //           // onPanUpdate: (DragUpdateDetails event) {
  //           //   print('panUpdate');
  //           //   if (scName != null) {
  //           //     NamedScrollController.updateScrollOffset( event.delta.dy);
  //           //   }
  //           // },
  //           // onPanEnd: (DragEndDetails event) {},
  //           child: Container(
  //             width: borderRect.width.abs(),
  //             height: borderRect.height.abs(),
  //             decoration: DottedDecoration(
  //               shape: Shape.box,
  //               dash: const <int>[6, 6],
  //               borderColor: Colors.black,
  //               strokeWidth: 3,
  //               fillColor: Colors.transparent,
  //               // fillGradient: fillGradient,
  //             ),
  //           ),
  //         ),
  //       ),
  //       calloutConfig: cc,
  //       targetGkF: () => nodeWidgetGK,
  //       skipOnScreenCheck: true,
  //     );
  //   } else {
  //     print('borderRect?');
  //   }
  // }

  // Widget? buildTappableNodeWidgetRect() {
  //   Rect? borderRect = calcBorderRect();
  //
  //   return (borderRect != null)
  //       ? Positioned(
  //           left: borderRect.left,
  //           top: borderRect.top,
  //           child: Tooltip(
  //             message: 'tap to edit this ${toString()} node',
  //             child: GestureDetector(
  //               onTap: () => tappedToEditSnippetNode(),
  //               child: Container(
  //                 width: borderRect.width.abs(),
  //                 height: borderRect.height.abs(),
  //                 decoration: DottedDecoration(
  //                   shape: Shape.box,
  //                   dash: const <int>[6, 6],
  //                   borderColor: Colors.black,
  //                   strokeWidth: 3,
  //                   fillColor: Colors.transparent,
  //                   // fillGradient: fillGradient,
  //                 ),
  //               ),
  //             ),
  //           ),
  //         )
  //       : null;
  // }

  void tappedToEditSnippetNode() {
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

    pushThenShowNamedSnippetWithNodeSelected(snippetName, this);
  }

  void showSelectedNonTappableNodeWidgetOverlay({required Rect borderRect}) {
    bool isSelected = this == fco.selectedNode;
    if (!isSelected) {
      return;
    }
    // Clip to the visible region (exclude the side panel column).
    final screenSize = WidgetsBinding.instance.renderView.size;
    final visibleArea = fco.snippetEditorPanelOnRight
        ? Rect.fromLTWH(0, 0, screenSize.width - kSidePanelWidth, screenSize.height)
        : Rect.fromLTWH(kSidePanelWidth, 0, screenSize.width - kSidePanelWidth, screenSize.height);
    final clipped = borderRect.intersect(visibleArea);
    if (clipped.isEmpty) return;

    // if (this is AppBarNode || this is ScaffoldNode) return;
    CalloutConfig cc = CalloutConfig(
      cId: 'pink-overlay',
      initialCalloutW: clipped.width.abs(),
      // + BORDER,
      initialCalloutH: clipped.height.abs(),
      // + BORDER,
      initialCalloutPos: OffsetModel.fromOffset(clipped.topLeft),
      //.translate(-BORDER, -BORDER),
      targetPointerType: TargetPointerType.none(),
      draggable: false,
      followScroll: true,
    );
    // if (nodeWidgetGK?.currentContext != null) {
    //   EditablePageState? eps = EditablePage.of(
    //       nodeWidgetGK!.currentContext!);
    //   eps?.dismissAllNodeWidgetOverlays();
    // }
    fco.showOverlay(
      calloutContent: AbsorbPointer(
        child: _PulsingOverlay(
          width: clipped.width.abs(),
          height: clipped.height.abs(),
        ),
      ),
      calloutConfig: cc,
      wrapInPointerInterceptor: isHtmlElementViewOrPlatformView(),
      targetGK: nodeWidgetGK,
      skipOnScreenCheck: true,
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

  // useful in generic tree actions, such as node deletion
  List<SNode>? maybeChildren() {
    if (this is CL) {
      return null;
    }
    if (this is SC && (this as SC).child != null) {
      return [(this as SC).child!];
    }
    if (this is MC) {
      return (this as MC).children;
    }
    if (this is CustomScrollViewNode) {
      CustomScrollViewNode scv = this as CustomScrollViewNode;
      return scv.slivers;
    }
    if (this is ListViewNode) {
      ListViewNode lv = this as ListViewNode;
      return lv.children;
    }
    if (this is GridViewNode) {
      GridViewNode gv = this as GridViewNode;
      return gv.children;
    }
    if (this is TextSpanNode) {
      TextSpanNode ts = this as TextSpanNode;
      return ts.children;
    }
    return null;
  }

  bool hasSingleChild() => maybeChildren()?.length == 1;

  bool hasNoChildren() => maybeChildren() == null || maybeChildren()!.isEmpty;

  bool hasMultipleChildren() =>
      maybeChildren() != null && maybeChildren()!.length > 1;

  bool hasChildren() => !hasNoChildren();

  List<SNode>? maybeSiblings() {
    if (getParent() is MC) {
      return (getParent() as MC).children;
    }
    if (getParent() is CustomScrollViewNode) {
      CustomScrollViewNode scv = getParent() as CustomScrollViewNode;
      return scv.slivers;
    }
    if (getParent() is ListViewNode) {
      ListViewNode lv = getParent() as ListViewNode;
      return lv.children;
    }
    if (getParent() is GridViewNode) {
      GridViewNode gv = getParent() as GridViewNode;
      return gv.children;
    }
    if (getParent() is TextSpanNode) {
      TextSpanNode ts = getParent() as TextSpanNode;
      return ts.children;
    }
    return null;
  }

  bool parentCanHaveMultipleChildren() =>
      getParent() is TextSpanNode ||
      parentCanHaveMultipleHorizontalChildren() ||
      parentCanHaveMultipleVerticalChildren();

  bool parentCanHaveMultipleHorizontalChildren() =>
      getParent() is RowNode ||
      (getParent() is WrapNode &&
          (getParent() as WrapNode).direction == AxisEnum.horizontal) ||
      (getParent() is ScrollViewNode &&
          (getParent() as ScrollViewNode).scrollDirection ==
              AxisEnum.horizontal);

  bool parentCanHaveMultipleVerticalChildren() =>
      getParent() is ColumnNode ||
      (getParent() is WrapNode &&
          (getParent() as WrapNode).direction == AxisEnum.vertical) ||
      (getParent() is ScrollViewNode &&
          (getParent() as ScrollViewNode).scrollDirection == AxisEnum.vertical);

  /// Removes this node from its parent.
  ///
  /// If this node has a single child, the child will be promoted to take its place.
  /// Otherwise, the node is simply removed.
  ///
  /// Returns the node that takes its place (either the promoted child or the parent)
  /// or `this` if it's a root node and cannot be removed.
  SNode removeFromParent() {
    final SNode? parent = getParent() as SNode?;

    if (parent == null) {
      return this; // This is a root node and has no parent.
    }

    if (parent is NamedSC && parent.propertyName == 'title') {
      parent.child = TextNode(
        text: 'must have a ${parent.propertyName} widget!',
        tsPropGroup: TextStyleProperties(),
      )..setParent(parent);
      return parent;
    }

    if (parent is NamedSC && parent.propertyName == 'content') {
      parent.child = TextNode(
        text: 'must have a content widget!',
        tsPropGroup: TextStyleProperties(),
      )..setParent(parent);
      return parent;
    }

    // Determine if there's a single child to promote.
    final SNode? childToPromote = hasSingleChild() ? firstChild() : null;

    // Handle TextSpanNode parent specifically.
    if (parent is TextSpanNode) {
      if (parent.children != null) {
        List<InlineSpanNode> textSpanChildren = parent.children!;
        final int index = textSpanChildren.indexOf((this as InlineSpanNode));
        if (index != -1) {
          if (childToPromote != null && childToPromote is InlineSpanNode) {
            // Promote child if it's a valid InlineSpanNode.
            parent.children![index] = childToPromote;
            return childToPromote;
          } else {
            // Otherwise, just remove the node.
            parent.children!.removeAt(index);
            return parent;
          }
        }
      }
    }

    if (parent is RichTextNode) {
      // removing single inlinespan, so replace with text
      if (this is WidgetSpanNode ||
          (this is TextSpanNode &&
              (this as TextSpanNode).children?.length != 1)) {
        parent.text = TextSpanNode(
          text: 'xxx',
          tsPropGroup: TextStyleProperties(),
        )..setParent(parent);
        return parent;
      }
      // remove from parent RichTextNode
      if (this is TextSpanNode) {
        final TextSpanNode sel = this as TextSpanNode;
        if (sel.children?.length == 1) {
          parent.text = sel.children!.first..setParent(parent);
          return parent;
        }
      }
    }

    // Handle Single-Child (SC) parents.
    if (parent is SC) {
      if (parent.child == this) {
        parent.child = childToPromote;
        return childToPromote ?? parent;
      }
    }

    // Handle various Multi-Child parents.
    List<SNode>? parentChildrenList = maybeSiblings();

    if (parentChildrenList != null) {
      final int index = parentChildrenList.indexOf(this);
      if (index != -1) {
        if (childToPromote != null) {
          // Replace this node with its child.
          parentChildrenList[index] = childToPromote;
        } else {
          // Remove this node completely.
          parentChildrenList.removeAt(index);
        }
        return childToPromote ?? parent;
      }
    }

    // Fallback: if parent type is not a known container or node not found.
    return this;
  }

  /// assumes node has at least one child
  SNode firstChild() => maybeChildren()!.first;

  //
  // CalloutConfig _cc({
  //   required String cId,
  //   required Rect borderRect,
  //   bool? followScroll,
  // }) => CalloutConfig(
  //   cId: cId,
  //   initialCalloutW: borderRect.width.abs(),
  //   // + BORDER,
  //   initialCalloutH: borderRect.height.abs(),
  //   // + BORDER,
  //   initialCalloutPos: OffsetModel.fromOffset(borderRect.topLeft),
  //   //.translate(-BORDER, -BORDER),
  //   decorationFillColors: ColorOrGradient.color(Colors.transparent),
  //   targetPointerType: TargetPointerType.none(),
  //   draggable: false,
  //
  //   followScroll: followScroll ?? true,
  // );

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
    HotspotTargetModel? targetBeingConfigured,
  }) async {
    SnippetInfoModel? snippetInfo = fco.appInfo.cachedSnippetInfo(snippetName);
    if (snippetInfo == null) return;

    SnippetRootNode? rootNode = await snippetInfo.currentVersionFromCacheOrFB();
    if (rootNode == null) return;

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
          fco.appInfo.showFloatingClipboard();
        }
        fco.hide(HotspotTargetConfigToolbar.CID);
        // fco.afterMsDelayDo(1000, () {
        //   var ctx = rootNode.child?.nodeWidgetGK?.currentContext;
        //   if (ctx != null) {
        //     EditablePageState? eps = EditablePage.of(ctx);
        //     eps?.showNodeWidgetOverlays();
        //   }
        // });
      }
    });
  }

  void refreshWithUpdate(
    BuildContext context,
    VoidCallback assignF, {
    bool alsoRefreshPropertiesView = false,
  }) {
    assignF.call();
    fco.capiBloc.add(CAPIEvent.changedSnippet());
    fco.afterNextBuildDo(() {
      fco.dismiss('pink-overlay');
      SNodeWidget.pointOutSelectedNode();
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

  bool get canShowTappableNodeWidgetOverlay =>
      getParent() is! CarouselNode &&
      getParent() is! MarkdownNode &&
      getParent() is! QuillTextNode;

  // List<String> sensibleParents() => const [];

  GlobalKey? createNodeWidgetGK() {
    // print('--- createNodeGK --- ${toString()}');
    String debugLabel = toString();
    if (this is TextNode) {
      debugLabel += (this as TextNode).text;
    }
    _nodeWidgetGK = GlobalKey(debugLabel: debugLabel);
    fco.nodesByGK[_nodeWidgetGK!] = this;
    return _nodeWidgetGK;
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
    var children = childrenProvider(this);
    for (SNode child in children) {
      child._setParents(this);
    }
  }

  bool anyMissingParents() {
    var children = childrenProvider(this);
    for (SNode child in children) {
      bool foundAMissingParent = child.getParent() != this;
      if (foundAMissingParent) {
        return true;
      } else {
        return child.anyMissingParents();
      }
    }
    return false;
  }

  bool isAScaffoldTabWidget() {
    if (getParent() is TabBarNode) {
      var tabBarParent = getParent();
      if (tabBarParent is NamedPS && tabBarParent.propertyName == 'bottom') {
        return true;
      }
    }
    return false;
  }

  bool isAScaffoldTabViewWidget() {
    if (getParent() is TabBarViewNode) {
      var tabBarViewParent = getParent();
      if (tabBarViewParent?.getParent() is AppBarNode) {
        return true;
      }
    }
    return false;
  }

  bool isAStepNodeTitleOrContentPropertyWidget() {
    var node = getParent()?.getParent();
    return node is StepNode && (node.title == this || node.content == this);
  }

  bool isANamedPropertyNode() =>
      this is NamedSC || this is NamedPS || this is NamedMC;

  SNode? findDescendant(/*Flutter*/ Type type) {
    //
    SNode? foundChild;

    void findMatchingChild(SNode parent) {
      bool keepSearching = true;
      for (SNode child in childrenProvider(parent)) {
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

  // useful for finding hostspot wrappers => leading to their hotspots
  List<SNode> findDescendantsOfType(Type type) {
    //
    List<SNode> foundNodes = [];

    void findMatchingDescendants(SNode node) {
      for (SNode child in childrenProvider(node)) {
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

  // useful for getting a list of all the nodes of a snippet
  List<SNode> findDescendantNodes(/* of this node*/) {
    //
    List<SNode> foundNodes = [];

    void traverseDescendants(SNode node) {
      for (SNode child in childrenProvider(node)) {
        foundNodes.add(child);
        traverseDescendants(child);
      }
    }

    //
    traverseDescendants(this);
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

  static void hideAllTargetCovers({HotspotTargetModel? except}) {
    for (HotspotTargetModel tc in allTargets()) {
      tc.showCover = false;
      if (tc == except) {
        tc.showCover = true;
      }
    }
  }

  static void hideAllTargetBtns({HotspotTargetModel? except}) {
    for (HotspotTargetModel tc in allTargets()) {
      tc.showBtn = false;
      if (tc == except) {
        tc.showBtn = true;
      }
    }
  }

  static void showAllHotspotTargetCovers() {
    for (HotspotTargetModel tc in allTargets()) {
      // if (tc.hasAHotspot())
      tc.showCover = true;
    }
  }

  static void showAllTargetBtns() {
    for (HotspotTargetModel tc in allTargets()) {
      tc.showBtn = true;
    }
  }

  static List<HotspotTargetModel> allTargets() {
    // var fc = FC();
    List<HotspotTargetModel> foundTargets = [];
    for (SnippetName snippetName in fco.appInfo.cachedSnippetNames()) {
      // get published or editing version
      SnippetInfoModel? snippetInfo = fco.appInfo.cachedSnippetInfo(
        snippetName,
      );
      if (snippetInfo == null) return foundTargets;
      VersionId? versionId = snippetInfo.currentVersionId();
      if (versionId == null) return foundTargets;
      List<SNode> tws =
          snippetInfo.currentVersionInCache()?.findDescendantsOfType(
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
  //
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

  bool canWrap() =>
      (this is! SnippetRootNode || getParent() != null) &&
      this is! NamedSC &&
      this is! NamedMC &&
      this is! InlineSpanNode &&
      this is! FileNode &&
      this is! PollOptionNode &&
      this is! StepNode;

  bool canRemove() => true;

  bool canAppendAChild() => false;

  bool canReplace() => getParent() != null;

  // bool canAddASibling() =>
  //     getParent() is MC ||
  //     getParent() is TextSpanNode ||
  //     getParent() is WidgetSpanNode ||
  //     getParent() is ScrollViewNode;

  Widget insertItemMenuAnchor(
    BuildContext context, {
    required NodeAction action,
    String? label,
    Color? bgColor,
    String? tooltip,
    key,
  }) {
    final title = action == NodeAction.replaceWith
        ? 'replace with...'
        : action == NodeAction.wrapWith
        ? 'wrap with...'
        : action == NodeAction.addSiblingBefore
        ? 'insert before...'
        : action == NodeAction.addSiblingAfter
        ? 'insert after...'
        : 'append child...';

    void onTap() => _openQuickPick(action);

    return label != null
        ? TextButton.icon(
            key: key,
            onPressed: onTap,
            icon: action == NodeAction.replaceWith
                ? const Icon(Icons.refresh)
                : const Icon(Icons.add),
            label: Text(title),
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                bgColor ?? Colors.white.withValues(alpha: .9),
              ),
              foregroundColor: const WidgetStatePropertyAll(Colors.white),
            ),
          )
        : IconButton(
            key: key,
            padding: EdgeInsets.zero,
            onPressed: onTap,
            icon: Icon(Icons.add_box, color: bgColor),
            tooltip: title,
            iconSize: isANamedPropertyNode() ? 20 : 40,
          );
  }

  List<Widget> menuAnchorWidgets(BuildContext context, NodeAction action) {
    List<Widget> mis = [];
    if (action == NodeAction.wrapWith) {
      mis.addAll(menuAnchorWidgets_WrapWith(context, action, false));
    }
    if (action == NodeAction.addChild) {
      mis.addAll(menuAnchorWidgets_Append(context, action, false));
    }
    if (action == NodeAction.addSiblingBefore ||
        action == NodeAction.addSiblingAfter) {
      mis.addAll(menuAnchorWidgets_InsertSibling(context, action, false));
    }
    if (action == NodeAction.replaceWith) {
      mis.addAll(menuAnchorWidgets_ReplaceWith(context, action, false));
    }
    return mis;
  }

  List<Type> replaceWithOnly() => [];

  List<Type> wrapWithOnly() => [];

  List<Type> replaceWithRecommendations() => [];

  List<Type> replaceWithCandidates() => [
    // ...childlessSubClasses,
    // ...singleChildSubClasses,
    // ...multiChildSubClasses,
  ];

  List<Type> wrapCandidates() => [
    ...singleChildSubClasses,
    ...multiChildSubClasses,
  ];

  List<Type> siblingCandidates() => [
    ...childlessSubClasses,
    ...singleChildSubClasses,
    ...multiChildSubClasses,
  ];

  List<Type> appendCandidates() => [
    ...childlessSubClasses,
    ...singleChildSubClasses,
    ...multiChildSubClasses,
  ];

  // ---------------------------------------------------------------------------
  // Widget picker helpers
  // ---------------------------------------------------------------------------

  /// Context-aware recommendations for the quick-pick chips (up to 5 shown).
  List<Type> recommendations(NodeAction action) {
    switch (action) {
      case NodeAction.wrapWith:
        final only = wrapWithOnly();
        if (only.isNotEmpty) return only;
        return [ContainerNode, PaddingNode, CenterNode, ColumnNode, RowNode];
      case NodeAction.replaceWith:
        final only = replaceWithOnly();
        if (only.isNotEmpty) return only;
        final recs = replaceWithRecommendations();
        if (recs.isNotEmpty) return recs;
        return [];
      case NodeAction.addChild:
        return [ContainerNode, TextNode, ColumnNode, RowNode, PaddingNode];
      case NodeAction.addSiblingBefore:
      case NodeAction.addSiblingAfter:
        return [ContainerNode, TextNode, ColumnNode, RowNode, GapNode];
    }
  }

  List<WidgetEntry> recommendedEntries(NodeAction action) => recommendations(action)
      .map((t) => widgetRegistry.where((e) => e.type == t).firstOrNull)
      .whereType<WidgetEntry>()
      .toList();

  List<WidgetEntry> _allCandidatesForAction(NodeAction action) {
    List<Type> types;
    switch (action) {
      case NodeAction.wrapWith:
        final only = wrapWithOnly();
        types = only.isNotEmpty ? only : wrapCandidates();
      case NodeAction.replaceWith:
        final only = replaceWithOnly();
        if (only.isNotEmpty) {
          types = only;
        } else {
          final candidates = replaceWithCandidates();
          types = candidates.isNotEmpty
              ? candidates
              : [...singleChildSubClasses, ...multiChildSubClasses, ...childlessSubClasses];
        }
      case NodeAction.addChild:
        types = appendCandidates();
      case NodeAction.addSiblingBefore:
      case NodeAction.addSiblingAfter:
        types = siblingCandidates();
    }
    return widgetRegistry.where((e) => types.contains(e.type)).toList();
  }

  void _performTypeAction(Type childType, NodeAction action) {
    switch (action) {
      case NodeAction.wrapWith:
        fco.capiBloc.add(CAPIEvent.wrapSelectionWith(type: childType));
      case NodeAction.replaceWith:
        fco.capiBloc.add(CAPIEvent.replaceSelectionWith(type: childType));
        fco.afterNextBuildDo(() => fco.dismiss('node-actions'));
      case NodeAction.addChild:
        if (isANamedPropertyNode() && fco.selectedNode != this) {
          fco.capiBloc.add(CAPIEvent.selectNode(node: this));
          fco.afterNextBuildDo(() {
            fco.capiBloc.add(CAPIEvent.appendChild(type: childType));
            fco.afterNextBuildDo(() => fco.dismiss('node-actions'));
          });
        } else {
          fco.capiBloc.add(CAPIEvent.appendChild(type: childType));
          fco.afterNextBuildDo(() => fco.dismiss('node-actions'));
        }
      case NodeAction.addSiblingBefore:
        fco.capiBloc.add(CAPIEvent.addSiblingBefore(type: childType));
        fco.afterNextBuildDo(() => fco.dismiss('node-actions'));
      case NodeAction.addSiblingAfter:
        fco.capiBloc.add(CAPIEvent.addSiblingAfter(type: childType));
        fco.afterNextBuildDo(() => fco.dismiss('node-actions'));
    }
  }

  void _performSnippetAction(String snippetName, NodeAction action) async {
    await SnippetRootNode.loadSnippetFromCacheOrFromFB(snippetName: snippetName);
    switch (action) {
      case NodeAction.replaceWith:
        fco.capiBloc.add(CAPIEvent.replaceSelectionWith(type: SnippetRootNode, snippetName: snippetName));
        fco.afterNextBuildDo(() => fco.dismiss('node-actions'));
      case NodeAction.addSiblingBefore:
        fco.capiBloc.add(CAPIEvent.addSiblingBefore(type: SnippetRootNode, snippetName: snippetName));
        fco.afterNextBuildDo(() => fco.dismiss('node-actions'));
      case NodeAction.addSiblingAfter:
        fco.capiBloc.add(CAPIEvent.addSiblingAfter(type: SnippetRootNode, snippetName: snippetName));
        fco.afterNextBuildDo(() => fco.dismiss('node-actions'));
      case NodeAction.addChild:
        fco.capiBloc.add(CAPIEvent.appendChild(type: SnippetRootNode, snippetName: snippetName));
        fco.afterNextBuildDo(() => fco.dismiss('node-actions'));
      case NodeAction.wrapWith:
        break;
    }
  }

  void _performPasteAction(NodeAction action) {
    switch (action) {
      case NodeAction.replaceWith:
        fco.capiBloc.add(const CAPIEvent.pasteReplacement());
      case NodeAction.addSiblingBefore:
        fco.capiBloc.add(const CAPIEvent.pasteSiblingBefore());
      case NodeAction.addSiblingAfter:
        fco.capiBloc.add(const CAPIEvent.pasteSiblingAfter());
      case NodeAction.addChild:
        fco.capiBloc.add(const CAPIEvent.pasteChild());
      case NodeAction.wrapWith:
        break;
    }
    fco.afterNextBuildDo(() => fco.dismiss('node-actions'));
  }

  void _openQuickPick(NodeAction action) {
    final recommended = recommendedEntries(action);
    if (recommended.isEmpty) {
      _openFullPicker(action);
      return;
    }
    final hasPaste =
        fco.appInfo.clipboard != null && action != NodeAction.wrapWith;

    fco.showOverlay(
      calloutConfig: CalloutConfig(
        cId: kWidgetPickerCId,
        initialCalloutW: 320,
        initialCalloutH: 600,
        decorationFillColors: ColorOrGradient.color(Colors.white),
        initialTargetAlignment: Alignment.bottomLeft,
        initialCalloutAlignment: Alignment.topLeft,
        finalSeparation: 4,
        decorationBorderRadius: 12,
        elevation: 8,
        barrier: CalloutBarrierConfig(
          closeOnTapped: true,
        ),
      ),
      calloutContent: QuickPickPanel(
        action: action,
        recommended: recommended,
        hasPaste: hasPaste,
        onPaste: hasPaste ? () => _performPasteAction(action) : null,
        onTypeSelected: (type) => _performTypeAction(type, action),
        onSnippetSelected: (name) => _performSnippetAction(name, action),
        onMorePressed: () => _openFullPicker(action),
      ),
      targetGK: treeNodeGK,
    );
  }

  void _openFullPicker(NodeAction action) {
    final allCandidates = _allCandidatesForAction(action);
    final snippetNames = List<String>.from(fco.appInfo.snippetNames)..sort();
    final hasPaste =
        fco.appInfo.clipboard != null && action != NodeAction.wrapWith;

    fco.showOverlay(
      calloutConfig: CalloutConfig(
        cId: kWidgetPickerCId,
        initialCalloutW: 420,
        initialCalloutH: 560,
        decorationFillColors: ColorOrGradient.color(Colors.white),
        initialTargetAlignment: Alignment.bottomLeft,
        initialCalloutAlignment: Alignment.topLeft,
        finalSeparation: 4,
        decorationBorderRadius: 12,
        elevation: 8,
        barrier: CalloutBarrierConfig(
          closeOnTapped: true,
        ),
      ),
      calloutContent: WidgetPickerDialog(
        action: action,
        candidates: allCandidates,
        hasPaste: hasPaste,
        onPaste: hasPaste ? () => _performPasteAction(action) : null,
        onTypeSelected: (type) => _performTypeAction(type, action),
        snippetNames: snippetNames,
        onSnippetSelected: (name) => _performSnippetAction(name, action),
      ),
      targetGK: treeNodeGK,
    );
  }

  List<Widget> menuAnchorWidgets_WrapWith(
    BuildContext context,
    NodeAction action,
    bool? skipHeading,
  ) {
    return [
      if (!(skipHeading ?? false))
        ...menuAnchorWidgets_Heading(context, action),
      SubmenuButton(
        menuChildren: [
          menuItemButton(context, "Align", AlignNode, action),
          menuItemButton(context, "Center", CenterNode, action),
          menuItemButton(context, "Container", ContainerNode, action),
          menuItemButton(context, "Padding", PaddingNode, action),
          menuItemButton(context, "SizedBox", SizedBoxNode, action),
          menuItemButton(context, "ConstrainedBox", ConstrainedBoxNode, action),
          menuItemButton(
            context,
            "InteractiveViewer",
            InteractiveViewerNode,
            action,
          ),
          menuItemButton(
            context,
            "SingleChildScrollView",
            SingleChildScrollViewNode,
            action,
          ),
          const Divider(),
          menuItemButton(context, "ListView", ListViewNode, action),
          menuItemButton(context, "GridView", GridViewNode, action),
          menuItemButton(context, "Column", ColumnNode, action),
          menuItemButton(context, "Row", RowNode, action),
          menuItemButton(context, "Wrap", WrapNode, action),
          menuItemButton(context, "Expanded", ExpandedNode, action),
          menuItemButton(context, "Flexible", FlexibleNode, action),
          menuItemButton(context, "IntrinsicWidth", IntrinsicWidthNode, action),
          menuItemButton(
            context,
            "IntrinsicHeight",
            IntrinsicHeightNode,
            action,
          ),
          const Divider(),
          menuItemButton(context, "Stack", StackNode, action),
          menuItemButton(context, "Positioned", PositionedNode, action),
          const Divider(),
          menuItemButton(context, "Scaffold", ScaffoldNode, action),
        ],
        child: fco.coloredText("container", fontWeight: FontWeight.normal),
      ),
      SubmenuButton(
        menuChildren: [
          menuItemButton(
            context,
            "CustomScrollView",
            CustomScrollViewNode,
            action,
          ),
          menuItemButton(context, "SliverAppBar", SliverAppBarNode, action),
          menuItemButton(
            context,
            "SliverList.list",
            SliverListListNode,
            action,
          ),
          menuItemButton(
            context,
            "SliverToBoxAdapter",
            SliverToBoxAdapterNode,
            action,
          ),
          menuItemButton(
            context,
            "SliverResizingHeader",
            SliverResizingHeaderNode,
            action,
          ),
          menuItemButton(
            context,
            "SliverFloatingHeader",
            SliverFloatingHeaderNode,
            action,
          ),
        ],
        child: fco.coloredText("slivers", fontWeight: FontWeight.normal),
      ),
      menuItemButton(context, "Align", AlignNode, action),
      menuItemButton(context, "SplitView", SplitViewNode, action),
      menuItemButton(context, "Hotspots", TargetsWrapperNode, action),
      menuItemButton(context, "DefaultTextStyle", DefaultTextStyleNode, action),
      menuItemButton(context, "Aspect Ratio", AspectRatioNode, action),
    ];
  }

  List<Widget> menuAnchorWidgets_Append(
    BuildContext context,
    NodeAction action,
    bool? skipHeading,
  ) {
    return [
      if (!(skipHeading ?? false))
        ...menuAnchorWidgets_Heading(context, action),
      SubmenuButton(
        menuChildren: [
          menuItemButton(context, "Align", AlignNode, action),
          menuItemButton(context, "Center", CenterNode, action),
          menuItemButton(context, "Container", ContainerNode, action),
          menuItemButton(context, "Expanded", ExpandedNode, action),
          // _addChildmenuItemButton(context, "IntrinsicHeight", IntrinsicHeightNode, action),
          // _addChildmenuItemButton(context, "IntrinsicWidth", IntrinsicWidthNode, action),
          menuItemButton(context, "Padding", PaddingNode, action),
          menuItemButton(context, "SizedBox", SizedBoxNode, action),
          menuItemButton(context, "ConstrainedBox", ConstrainedBoxNode, action),
          menuItemButton(context, "ListView", ListViewNode, action),
          menuItemButton(context, "GridView", GridViewNode, action),
          menuItemButton(
            context,
            "SingleChildScrollView",
            SingleChildScrollViewNode,
            action,
          ),
          const Divider(),
          menuItemButton(context, "Column", ColumnNode, action),
          menuItemButton(context, "Row", RowNode, action),
          menuItemButton(context, "Wrap", WrapNode, action),
          menuItemButton(context, "Stack", StackNode, action),
          const Divider(),
          menuItemButton(context, "Scaffold", ScaffoldNode, action),
          menuItemButton(context, "IntrinsicWidth", IntrinsicWidthNode, action),
          menuItemButton(
            context,
            "IntrinsicHeight",
            IntrinsicHeightNode,
            action,
          ),
        ],
        child: fco.coloredText("container", fontWeight: FontWeight.normal),
      ),
      SubmenuButton(
        menuChildren: [
          menuItemButton(
            context,
            "CustomScrollView",
            CustomScrollViewNode,
            action,
          ),
          menuItemButton(context, "SliverAppBar", SliverAppBarNode, action),
          menuItemButton(
            context,
            "SliverList.list",
            SliverListListNode,
            action,
          ),
          menuItemButton(
            context,
            "SliverToBoxAdapter",
            SliverToBoxAdapterNode,
            action,
          ),
          menuItemButton(
            context,
            "SliverResizingHeader",
            SliverResizingHeaderNode,
            action,
          ),
          menuItemButton(
            context,
            "SliverFloatingHeader",
            SliverFloatingHeaderNode,
            action,
          ),
        ],
        child: fco.coloredText("slivers", fontWeight: FontWeight.normal),
      ),
      SubmenuButton(
        menuChildren: [
          menuItemButton(
            context,
            "DefaultTextStyle",
            DefaultTextStyleNode,
            action,
          ),
          menuItemButton(context, "Text", TextNode, action),
          menuItemButton(context, "QuillText", QuillTextNode, action),
          menuItemButton(context, "RichText", RichTextNode, action),
          menuItemButton(context, "TextSpan", TextSpanNode, action),
          menuItemButton(context, "WidgetSpan", WidgetSpanNode, action),
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
              ),
              menuItemButton(
                context,
                "SubmenuButton",
                SubmenuButtonNode,
                action,
              ),
              menuItemButton(context, "MenuBar", MenuBarNode, action),
            ],
            child: fco.coloredText("menu", fontWeight: FontWeight.normal),
          ),
          SubmenuButton(
            menuChildren: [
              menuItemButton(context, "TabBar", TabBarNode, action),
              menuItemButton(context, "TabBarView", TabBarViewNode, action),
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
              ),
              menuItemButton(
                context,
                "OutlinedButton",
                OutlinedButtonNode,
                action,
              ),
              menuItemButton(context, "TextButton", TextButtonNode, action),
              menuItemButton(context, "FilledButton", FilledButtonNode, action),
              menuItemButton(context, "IconButton", IconButtonNode, action),
            ],
            child: fco.coloredText("button", fontWeight: FontWeight.normal),
          ),
          menuItemButton(context, "Chip", ChipNode, action),
        ],
        child: fco.coloredText("navigation", fontWeight: FontWeight.normal),
      ),
      SubmenuButton(
        menuChildren: [
          menuItemButton(context, "Asset Image", AssetImageNode, action),
          menuItemButton(context, "Algorithm", AlgCNode, action),
          menuItemButton(context, "UML", UMLImageNode, action),
          menuItemButton(
            context,
            "Firebase Storage Image",
            StorageImageNode,
            action,
          ),
          menuItemButton(context, "Carousel", CarouselNode, action),
          menuItemButton(context, "Aspect Ratio", AspectRatioNode, action),
        ],
        child: fco.coloredText("image", fontWeight: FontWeight.normal),
      ),
      SubmenuButton(
        menuChildren: [
          menuItemButton(context, "iframe", IFrameNode, action),
          menuItemButton(
            context,
            "Google Drive iframe",
            GoogleDriveIFrameNode,
            action,
          ),
          menuItemButton(context, "File", FileNode, action),
          menuItemButton(context, "Directory", DirectoryNode, action),
        ],
        child: fco.coloredText("file", fontWeight: FontWeight.normal),
      ),
      menuItemButton(context, "SplitView", SplitViewNode, action),
      menuItemButton(context, "Stepper", StepperNode, action),
      menuItemButton(context, "Gap", GapNode, action),
      menuItemButton(context, "Hotspots", TargetsWrapperNode, action),
      menuItemButton(context, "Poll", PollNode, action),
      menuItemButton(context, "Placeholder", PlaceholderNode, action),
      menuItemButton(context, "Youtube", YTNode, action),
      menuItemButton(context, "Markdown", MarkdownNode, action),
      addSnippetsSubmenu(action),
    ];
  }

  List<Widget> menuAnchorWidgets_InsertSibling(
    BuildContext context,
    NodeAction action,
    bool? skipHeading,
  ) {
    return [
      if (!(skipHeading ?? false))
        ...menuAnchorWidgets_Heading(context, action),
      if (getParent() is FlexNode) ...[
        menuItemButton(context, "Expanded", ExpandedNode, action),
        menuItemButton(context, "Flexible", FlexibleNode, action),
      ],
      menuItemButton(context, "IntrinsicWidth", IntrinsicWidthNode, action),
      menuItemButton(context, "IntrinsicHeight", IntrinsicHeightNode, action),
      if (getParent() is StepperNode)
        menuItemButton(context, "Step", StepNode, action),
      if (getParent() is PollNode)
        menuItemButton(context, "PollOption", PollOptionNode, action),
      if (getParent() is StackNode)
        menuItemButton(context, "Positioned", PositionedNode, action),
      if (getParent() is StackNode)
        menuItemButton(context, "Align", AlignNode, action),
      if (getParent() is DirectoryNode) ...[
        menuItemButton(context, "Directory", DirectoryNode, action),
        menuItemButton(context, "File", FileNode, action),
      ],
      if (getParent() is MenuBarNode) ...[
        menuItemButton(context, "SubMenuButton", SubmenuButtonNode, action),
        menuItemButton(context, "MenuItemButton", MenuItemButtonNode, action),
      ],
      if (getParent() is SubmenuButtonNode) ...[
        menuItemButton(context, "MenuItemButton", MenuItemButtonNode, action),
      ],
      if (getParent() is CarouselNode) ...[
        menuItemButton(context, "AssetImage", AssetImageNode, action),
        menuItemButton(context, "Algorithm", AlgCNode, action),
        menuItemButton(context, "UML", UMLImageNode, action),
        menuItemButton(
          context,
          "FirestoreStorageImage",
          StorageImageNode,
          action,
        ),
      ],
      if (getParent() is TextSpanNode) ...[
        menuItemButton(context, "TextSpanN", TextSpanNode, action),
        menuItemButton(context, "WidgetSpan", WidgetSpanNode, action),
      ],
      if (getParent() is! PollNode)
        ...menuAnchorWidgets_Append(context, action, true),
    ];
  }

  List<Widget> menuAnchorWidgets_ReplaceWith(
    BuildContext context,
    NodeAction action,

    bool? skipHeading,
  ) {
    bool skipTheRest = false;
    // List<Type> replaceTypes = replaceWithOnly();
    // if (replaceWithOnly().isEmpty) {
    //   replaceTypes.addAll(replaceWithCandidates());
    // } else {
    //   skipTheRest = true;
    // }
    return [
      // menu heading
      Container(
        margin: const EdgeInsets.all(10),
        width: 200,
        height: 40,
        child: Center(child: fco.purpleText(action.displayName)),
      ),
      pasteMI(action) ?? const Offstage(),

      for (Type type in replaceWithCandidates())
        menuItemButton(context, type.toString(), type, action),
      if (!skipTheRest) ...[
        SubmenuButton(
          menuChildren: [
            menuItemButton(context, "Align", AlignNode, action),
            menuItemButton(context, "Center", CenterNode, action),
            menuItemButton(context, "Container", ContainerNode, action),
            menuItemButton(context, "Padding", PaddingNode, action),
            menuItemButton(context, "SizedBox", SizedBoxNode, action),
            menuItemButton(
              context,
              "ConstrainedBox",
              ConstrainedBoxNode,
              action,
            ),
            menuItemButton(context, "ListView", ListViewNode, action),
            menuItemButton(context, "GridView", GridViewNode, action),
            menuItemButton(
              context,
              "InteractiveViewer",
              InteractiveViewerNode,
              action,
            ),
            menuItemButton(
              context,
              "SingleChildScrollView",
              SingleChildScrollViewNode,
              action,
            ),
            const Divider(),
            menuItemButton(context, "Column", ColumnNode, action),
            menuItemButton(context, "Row", RowNode, action),
            menuItemButton(context, "Wrap", WrapNode, action),
            menuItemButton(context, "Expanded", ExpandedNode, action),
            menuItemButton(context, "Flexible", FlexibleNode, action),
            menuItemButton(
              context,
              "IntrinsicWidth",
              IntrinsicWidthNode,
              action,
            ),
            menuItemButton(
              context,
              "IntrinsicHeight",
              IntrinsicHeightNode,
              action,
            ),
            const Divider(),
            menuItemButton(context, "Stack", StackNode, action),
            menuItemButton(context, "Positioned", PositionedNode, action),
            const Divider(),
            menuItemButton(context, "Scaffold", ScaffoldNode, action),
          ],
          child: fco.coloredText("container", fontWeight: FontWeight.normal),
        ),
        SubmenuButton(
          menuChildren: [
            menuItemButton(
              context,
              "CustomScrollView",
              CustomScrollViewNode,
              action,
            ),
            menuItemButton(context, "SliverAppBar", SliverAppBarNode, action),
            menuItemButton(
              context,
              "SliverList.list",
              SliverListListNode,
              action,
            ),
            menuItemButton(
              context,
              "SliverToBoxAdapter",
              SliverToBoxAdapterNode,
              action,
            ),
            menuItemButton(
              context,
              "SliverResizingHeader",
              SliverResizingHeaderNode,
              action,
            ),
            menuItemButton(
              context,
              "SliverFloatingHeader",
              SliverFloatingHeaderNode,
              action,
            ),
          ],
          child: fco.coloredText("slivers", fontWeight: FontWeight.normal),
        ),
        SubmenuButton(
          menuChildren: [
            menuItemButton(
              context,
              "DefaultTextStyle",
              DefaultTextStyleNode,
              action,
            ),
            menuItemButton(context, "Text", TextNode, action),
            menuItemButton(context, "QuillText", QuillTextNode, action),
            menuItemButton(context, "RichText", RichTextNode, action),
            menuItemButton(context, "TextSpan", TextSpanNode, action),
            menuItemButton(context, "WidgetSpan", WidgetSpanNode, action),
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
                ),
                menuItemButton(
                  context,
                  "SubmenuButton",
                  SubmenuButtonNode,
                  action,
                ),
                menuItemButton(context, "MenuBar", MenuBarNode, action),
              ],
              child: fco.coloredText("menu", fontWeight: FontWeight.normal),
            ),
            SubmenuButton(
              menuChildren: [
                menuItemButton(context, "Tab", TabNode, action),
                menuItemButton(context, "TabBar", TabBarNode, action),
                menuItemButton(context, "TabBarView", TabBarViewNode, action),
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
                ),
                menuItemButton(
                  context,
                  "OutlinedButton",
                  OutlinedButtonNode,
                  action,
                ),
                menuItemButton(context, "TextButton", TextButtonNode, action),
                menuItemButton(
                  context,
                  "FilledButton",
                  FilledButtonNode,
                  action,
                ),
                menuItemButton(context, "IconButton", IconButtonNode, action),
              ],
              child: fco.coloredText("button", fontWeight: FontWeight.normal),
            ),
            menuItemButton(context, "Chip", ChipNode, action),
          ],
          child: fco.coloredText("navigation", fontWeight: FontWeight.normal),
        ),
        SubmenuButton(
          menuChildren: [
            menuItemButton(context, "Asset Image", AssetImageNode, action),
            menuItemButton(context, "Algorithm", AlgCNode, action),
            menuItemButton(context, "UML", UMLImageNode, action),
            menuItemButton(
              context,
              "Firebase Storage Image",
              StorageImageNode,
              action,
            ),
            menuItemButton(context, "Carousel", CarouselNode, action),
            menuItemButton(context, "Aspect Ratio", AspectRatioNode, action),
          ],
          child: fco.coloredText("image", fontWeight: FontWeight.normal),
        ),
        SubmenuButton(
          menuChildren: [
            menuItemButton(context, "iframe", IFrameNode, action),
            menuItemButton(
              context,
              "Google Drive iframe",
              GoogleDriveIFrameNode,
              action,
            ),
            menuItemButton(context, "File", FileNode, action),
            menuItemButton(context, "Directory", DirectoryNode, action),
          ],
          child: fco.coloredText("file", fontWeight: FontWeight.normal),
        ),
        menuItemButton(context, "SplitView", SplitViewNode, action),
        menuItemButton(context, "Stepper", StepperNode, action),
        menuItemButton(context, "Gap", GapNode, action),
        // menuItemButton(context, "TargetWrapper", TargetButtonNode, action),
        menuItemButton(context, "Hotspots", TargetsWrapperNode, action),
        menuItemButton(context, "Poll", PollNode, action),
        menuItemButton(context, "PollOption", PollOptionNode, action),
        menuItemButton(context, "Placeholder", PlaceholderNode, action),
        menuItemButton(context, "Youtube", YTNode, action),
        menuItemButton(context, "Markdown", MarkdownNode, action),
        addSnippetsSubmenu(action),
      ],
    ];
  }

  List<Widget> menuAnchorWidgets_Heading(
    BuildContext context,
    NodeAction action,
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
    String label,
    Type childType,
    NodeAction action,
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
          //   EditablePageState? eps = EditablePage.of(context);
          //   eps?.showNodeWidgetOverlays();
        });
      } else if (action == NodeAction.addChild) {
        // auto-select if its a named child property node
        if (this.isANamedPropertyNode() && fco.selectedNode != this) {
          fco.capiBloc.add(CAPIEvent.selectNode(node: this));
          fco.afterNextBuildDo(() {
            fco.capiBloc.add(CAPIEvent.appendChild(type: childType));
            fco.afterNextBuildDo(() {
              fco.dismiss('node-actions');
            });
          });
        } else {
          fco.capiBloc.add(CAPIEvent.appendChild(type: childType));
          fco.afterNextBuildDo(() {
            fco.dismiss('node-actions');
          });
        }
      } else if (action == NodeAction.addSiblingBefore) {
        fco.capiBloc.add(CAPIEvent.addSiblingBefore(type: childType));
        fco.afterNextBuildDo(() {
          fco.dismiss('node-actions');
          //   EditablePageState? eps = EditablePage.of(context);
          //   eps?.showNodeWidgetOverlays();
        });
      } else if (action == NodeAction.addSiblingAfter) {
        fco.capiBloc.add(CAPIEvent.addSiblingAfter(type: childType));
        fco.afterNextBuildDo(() {
          fco.dismiss('node-actions');
          // EditablePageState? eps = EditablePage.of(context);
          // eps?.showNodeWidgetOverlays();
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

  SubmenuButton addSnippetsSubmenu(NodeAction action) {
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

  static SNode? parentProvider(Node node) => node.getParent() as SNode?;

  static Iterable<SNode> childrenProvider(SNode node) {
    node.getParent();
    Iterable<SNode> children = [];

    if (node is SnippetRootNode && node.getParent() != null) {
      children = [];
    } else if (node is ScaffoldNode) {
      children = [node.appBar, node.body];
      // } else if (node is SliverAppBarNode) {
      //   children = [
      //     if (node.leading.child != null) node.leading.child!,
      //     if (node.title.child != null) node.title.child!,
      //     if (node.actions.hasChildren()) ...node.actions.children,
      //     if (node.bottom.child != null) node.bottom.child!,
      //     if (node.flexibleSpace != null) node.flexibleSpace!,
      //   ];
      // } else if (node is AppBarNode) {
      //   children = [
      //     if (node.leading.child != null) node.leading.child!,
      //     if (node.title.child != null) node.title.child!,
      //     if (node.actions.hasChildren()) ...node.actions.children,
      //     if (node.bottom.child != null) node.bottom.child!,
      //   ];
    } else if (node is StepNode) {
      children = [
        node.title,
        if (node.subtitle != null) node.subtitle!,
        node.content,
      ];
    } else if (node is AppBarNode) {
      children = [node.leading, node.title, node.actions, node.bottom];
    } else if (node is NamedSC) {
      children = node.child != null ? [node.child!] : [];
    } else if (node is NamedPS) {
      children = node.child != null ? [node.child!] : [];
    } else if (node is RichTextNode) {
      children = [node.text];
    } else if (node is TextSpanNode) {
      children = node.children ?? [];
    } else if (node is WidgetSpanNode) {
      children = node.child != null ? [node.child!] : [];
    } else if (node is ListViewNode) {
      children = node.children;
    } else if (node is GridViewNode) {
      children = node.children;
    } else if (node is CL) {
      children = [];
    } else if (node is SC) {
      children = [if (node.child != null) node.child!];
    } else if (node is NamedMC) {
      children = node.children;
    } else if (node is MC) {
      children = node.children;
    } else if (node is CustomScrollViewNode) {
      children = node.slivers;
    }

    // unexpected
    return children;
  }
}

// /// Exception when an encoded enum value has no match.
// class EnumException implements Exception {
//   String cause;
//
//   EnumException(this.cause);
// }

/// Pulsing scale + fade overlay that draws the user's eye to the selected node.
class _PulsingOverlay extends StatefulWidget {
  final double width;
  final double height;

  const _PulsingOverlay({required this.width, required this.height});

  @override
  State<_PulsingOverlay> createState() => _PulsingOverlayState();
}

class _PulsingOverlayState extends State<_PulsingOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;
  late final Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);

    _scale = Tween<double>(begin: 1.0, end: 1.04).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _opacity = Tween<double>(begin: 1.0, end: 0.3).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Transform.scale(
        scale: _scale.value,
        child: Opacity(
          opacity: _opacity.value,
          child: child,
        ),
      ),
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: Colors.yellowAccent.withValues(alpha: 0.4),
          border: Border.all(color: Colors.orange, width: 2),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
