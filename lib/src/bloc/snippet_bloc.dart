import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_alignment.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_decoration.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_main_axis_size.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/text_style_group.dart';
import 'package:flutter_content/src/snippet/snodes/edgeinsets_node_value.dart';
import 'package:flutter_content/src/snippet/snodes/fs_image_node.dart';
import 'package:flutter_content/src/snippet/snodes/upto6color_values.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'capi_event.dart';
import 'snippet_event.dart';
import 'snippet_state.dart';

class SnippetBloC extends Bloc<SnippetEvent, SnippetState> {
  SnippetBloC({
    required SnippetRootNode rootNode,
    // following could be restored from CAPIState.snippetStateMap (previous snippet tree callout)
    required SnippetTreeController treeC,
    // required SnippetTreeUR treeUR,
    STreeNode? selectedNode,
    GlobalKey? selectedWidgetGK,
    GlobalKey? selectedTreeNodeGK,
  }) : super(SnippetState(
          rootNode: rootNode,
          treeC: treeC,
          // ur: treeUR,
          selectedNode: selectedNode,
          // selectedWidgetGK: selectedWidgetGK,
          selectedTreeNodeGK: selectedTreeNodeGK,
        )) {
    // debugPrint("\n\nCreating SnippetBloC ${node.name}\n\n");
    // events
    on<SelectNode>((event, emit) => _selectNode(event, emit));
    on<ClearNodeSelection>((event, emit) => _clearNodeSelection(event, emit));
    // on<HighlightNode>((event, emit) => _highlightNode(event, emit));
    on<SaveNodeAsSnippet>((event, emit) => _saveNodeAsSnippet(event, emit));
    on<ForceSnippetRefresh>((event, emit) => _forceSnippetRefresh(event, emit));
    on<WrapSelectionWith>((event, emit) => _wrapWith(event, emit));
    on<ReplaceSelectionWith>((event, emit) => _replaceWith(event, emit));
    on<AppendChild>((event, emit) => _addChild(event, emit));
    on<AddSiblingBefore>((event, emit) => _addSiblingBefore(event, emit));
    on<AddSiblingAfter>((event, emit) => _addSiblingAfter(event, emit));
    on<PasteChild>((event, emit) => _pasteChild(event, emit));
    on<PasteReplacement>((event, emit) => _pasteReplacement(event, emit));
    on<PasteSiblingBefore>((event, emit) => _pasteSiblingBefore(event, emit));
    on<PasteSiblingAfter>((event, emit) => _pasteSiblingAfter(event, emit));
    on<DeleteNodeTapped>((event, emit) => _deleteNodeTapped(event, emit));
    on<CompleteDeletion>((event, emit) => _completeDeletion(event, emit));
    on<SelectedDirectoryOrNode>((event, emit) => _selectedDirectoryOrNode(event, emit));
    on<CutNode>((event, emit) => _cutNode(event, emit));
    on<CopyNode>((event, emit) => _copyNode(event, emit));
    // on<Undo>((event, emit) => _undo(event, emit));
    // on<Redo>((event, emit) => _redo(event, emit));
  }

  // @override
  // Future<Function> close() async{
  //   return print;
  // }

  void _forceSnippetRefresh(event, emit) {
    debugPrint("forceSnippetRefresh");
    emit(state.copyWith(
      force: state.force + 1,
    ));
  }

  void _selectNode(SelectNode event, emit) {
    // if (event.imageTC != null) {
    //   // tc not null means editing a snippet and updating the wrapped target (that will show the snippet in a callout)
    //   SnippetNode snippet = state.snippetTreeC.roots.toList()[event.nodeRootIndex] as SnippetNode;
    //   event.imageTC!.snippetName = snippet.name;
    //   if (event.nodeParent is MultiChildNode) {
    //     state.snippetTreeC.collapse(event.node);
    //     // state.snippetTreeC.rebuild();
    //   }
    //   Map<String, TargetGroupModel> newTargetGroupListMap = _addOrUpdateTargetGroupListMap(event.imageTC!.wName, event.imageTC!);
    //   emit(state.copyWith(
    //     multiTargetListMap: newTargetGroupListMap,
    //
    //     selectedNode: event.node,
    //     selectedTarget: event.imageTC,
    //     showAdders: event.showAdders,
    //     showProperties: event.showProperties,
    //     selectedNodeParent: event.nodeParent,
    //
    //   ));
    // } else {
    // tc null means just editing a Snippet
    // STreeNode snode = event.node;
    // // create a bloc for the selected node
    // STreeNodeBloc newBloc = STreeNodeBloc(node: snode);

    // if new selection is a node above this tree root, reset the tree's root to it
    bool resetTree = !state.treeC.nodeIsADescendantOf(state.treeC.roots.first, event.node);
    // TreeSearchResult<STreeNode> result =
    //     state.treeC.search((snode) => snode == event.node);
    SnippetTreeController possiblyNewTreeC = state.treeC;
    if (resetTree) {
      possiblyNewTreeC = SnippetTreeController(
        roots: [event.node],
        childrenProvider: Node.snippetTreeChildrenProvider,
      ); //..expandAll();
    }
    emit(state.copyWith(
      treeC: possiblyNewTreeC,
      selectedNode: event.node,
      // selectedNodePropertiesTreeExpandedNodes: {},
      // selectedNodePropertiesPaneScrollPos: 0,
      // selectedNodeBloc: newBloc,
      // highlightedNode: null,
      // selectedWidgetGK: event.selectedWidgetGK,
      selectedTreeNodeGK: event.selectedTreeNodeGK,
      showProperties: true,
      nodeBeingDeleted: null,
    ));
    // FC.forceRefresh();
    // }
  }

  // void _highlightNode(HighlightNode event, emit) {
  //   emit(state.copyWith(
  //     highlightedNode: event.node,
  //   ));
  //   // }
  // }

  void _clearNodeSelection(event, emit) {
    emit(state.copyWith(
      selectedNode: null,
      // showAdders: false,
      showProperties: false,
    ));
  }

  Future<void> _deleteNodeTapped(DeleteNodeTapped event, emit) async {
    emit(state.copyWith(
      nodeBeingDeleted: state.selectedNode,
    ));
  }

  Future<void> _completeDeletion(CompleteDeletion event, emit) async {
    //_createSnippetUndo();
    STreeNode? sel = state.selectedNode;
    STreeNode? selParent = sel?.getParent() as STreeNode?;
    if (selParent != null && _possiblyRemoveFromParentButNotChildren()) {
      state.treeC.rebuild();
      // debugPrint("--------------");
      // debugPrint(state.snippetTreeC.roots.first.toMap());
      emit(state.copyWith(
        nodeBeingDeleted: null,
        selectedNode: selParent,
        // showAdders: false,
        showProperties: false,
        // ur: state.ur,
      ));
      FC.forceRefresh();
    }
  }

  bool _possiblyRemoveFromParentButNotChildren() {
    if (!state.aNodeIsSelected) return false;
    try {
      STreeNode sel = state.selectedNode!;
      if (sel is SnippetRootNode && sel.getParent() == null) return false;
      if (sel.getParent() == null) return false;
      STreeNode selParent = sel.getParent() as STreeNode;
      // tab-related
      if (sel.isAScaffoldTabWidget() && !sel.hasChildren()) {
        int index = (selParent as TabBarNode).children.indexOf(sel);
        selParent.children.remove(sel);
        ScaffoldNode? scaffold = selParent.getParent()?.getParent()?.getParent() as ScaffoldNode?;
        if (scaffold?.body.child is TabBarViewNode?) {
          (scaffold!.body.child as TabBarViewNode).children.removeAt(index);
        }
        // tabView-related
      } else if (sel.isAScaffoldTabViewWidget() && !sel.hasChildren()) {
        int index = (selParent as TabBarViewNode).children.indexOf(sel);
        selParent.children.remove(sel);
        ScaffoldNode? scaffold = selParent.getParent()?.getParent() as ScaffoldNode?;
        if (scaffold?.appBar?.bottom?.child is TabBarNode?) {
          (scaffold?.appBar!.bottom!.child as TabBarNode).children.removeAt(index);
        }
      } else if (selParent is SC && (sel is CL || sel is SnippetRootNode)) {
        selParent.child = null;
      } else if (selParent is SC && sel is SC) {
        selParent.child = sel.child?..setParent(selParent);
      } else if (selParent is SC && sel is MC && sel.children.isEmpty) {
        selParent.child = null;
      } else if (selParent is SC && sel is MC && sel.children.length < 2) {
        selParent.child = sel.children.first..setParent(selParent);
      } else if (selParent is MC && (sel is CL || sel is SnippetRootNode)) {
        selParent.children.remove(sel);
      } else if (selParent is MC && sel is SC && sel.child != null) {
        int index = selParent.children.indexOf(sel);
        selParent.children[index] = sel.child!..setParent(selParent);
      } else if (selParent is MC && sel is MC && sel.children.length == 1) {
        int index = selParent.children.indexOf(sel);
        selParent.children[index] = sel.children.first..setParent(selParent);
      } else if (selParent is MC && ((sel is SC && sel.child == null) || (sel is MC && sel.children.isEmpty))) {
        selParent.children.remove(sel);
      } else if (selParent is RichTextNode && sel is TextSpanNode && sel.children?.length == 1) {
        selParent.text = sel.children!.first..setParent(selParent);
      } else if (selParent is RichTextNode && (sel is WidgetSpanNode || sel is TextSpanNode && sel.children?.length != 1)) {
        selParent.text = TextSpanNode(text: 'xxx', isRootTextSpan: true)..setParent(selParent);
      } else if (selParent is TextSpanNode) {
        selParent.children!.remove(sel);
      }
      // certain nodes must have a child
      if (selParent is SnippetRootNode && selParent.child == null) {
        selParent.child = PlaceholderNode()..setParent(selParent);
      }
      if (selParent is GenericSingleChildNode && selParent.propertyName == 'title') {
        selParent.child = TextNode(text: 'must have a title widget!')..setParent(selParent);
      }
      if (selParent is GenericSingleChildNode && selParent.propertyName == 'content') {
        selParent.child = TextNode(text: 'must have a content widget!')..setParent(selParent);
      }
    } catch (e) {
      debugPrint("\n ***  _possiblyRemoveFromParentButNotChildren() - null selectedNode.parent!  ***");
      rethrow;
    }
    return true;
  }

  // void _possiblyRemoveFromParentButNotChildrenOLD() {
  //   try {
  //   STreeNode? selectedNode = state.selectedNode;
  //   if (selectedNode != null) {
  //     if (selectedNode != state.rootNode) {
  //       STreeNode parentNode = selectedNode.parent as STreeNode;
  //       if (parentNode is SC && selectedNode is SC) {
  //         parentNode.child = selectedNode.child;
  //         selectedNode.child?.setParent(parentNode);
  //       } else if (parentNode is MC && selectedNode is SC) {
  //         int index = parentNode.children.indexOf(selectedNode);
  //         if (selectedNode.child != null) {
  //           parentNode.children[index] = selectedNode.child!;
  //           selectedNode.child?.setParent(parentNode);
  //         }
  //       }
  //       if (selectedNode is MC && selectedNode.children.length == 1) {
  //         if (parentNode is SC) {
  //           parentNode.child = selectedNode.children.first;
  //         } else if (parentNode is MC) {
  //           int index = parentNode.children.indexOf(selectedNode);
  //           parentNode.children[index] = selectedNode.children.first;
  //         }
  //         if (parentNode is SnippetRootNode && parentNode.child == null) {
  //           parentNode.child = PlaceholderNode()
  //             ..setParent(parentNode);
  //         }
  //       } else if (parentNode is SC) {
  //         parentNode.child = null;
  //         if (parentNode is SnippetRootNode) {
  //           parentNode.child = PlaceholderNode()
  //             ..setParent(parentNode);
  //         }
  //       } else if (parentNode is MC) {
  //         int i = (parentNode).children.indexOf(selectedNode);
  //         if (parentNode is TabBarNode) {
  //           TabBarNode? tabBarNode = state.treeC.findNodeTypeInTree(rootNode, TabBarNode) as TabBarNode?;
  //           if (tabBarNode != null) {
  //             int numTabs = tabBarNode.children.length;
  //             tabBarNode.children.removeAt(i);
  //             TabBarViewNode? tabBarViewNode = state.treeC.findNodeTypeInTree(rootNode, TabBarViewNode) as TabBarViewNode?;
  //             if (numTabs == tabBarViewNode?.children.length) {
  //               tabBarViewNode?.children.removeAt(i);
  //             }
  //           }
  //         } else if (parentNode is TabBarViewNode) {
  //           TabBarViewNode? tabBarViewNode = state.treeC.findNodeTypeInTree(rootNode, TabBarViewNode) as TabBarViewNode?;
  //           if (tabBarViewNode != null) {
  //             int numTabs = tabBarViewNode.children.length;
  //             tabBarViewNode.children.removeAt(i);
  //             TabBarNode? tabBarNode = state.treeC.findNodeTypeInTree(rootNode, TabBarNode) as TabBarNode?;
  //             if (numTabs == tabBarNode?.children.length) {
  //               tabBarNode?.children.removeAt(i);
  //             }
  //           }
  //         } else {
  //           parentNode.children.removeAt(i);
  //         }
  //       } else if (parentNode is TextSpanNode) {
  //         if (parentNode.children!.length > 1) {
  //           parentNode.children!.remove(selectedNode);
  //         } else {
  //           parentNode.children = null;
  //         }
  //       }
  //     }
  //   }
  //   } catch (e) {
  //     debugPrint("\n ***  _possiblyRemoveFromParentButNotChildren() - null selectedNode.parent!  ***");
  //     rethrow;
  //   }
  // }

  Future<void> _cutNode(CutNode event, emit) async {
    //_createSnippetUndo();
    _cutIncludingAnyChildren(event.node);
    state.treeC.rebuild();
    // bool well = state.rootNode.anyMissingParents();
    event.capiBloc.add(CAPIEvent.updateClipboard(newContent: event.node, skipSave: event.skipSave));
  }

  _cutIncludingAnyChildren(STreeNode node) {
    if (node != state.rootNode) {
      // was: if (state.selectedNode?.parent != null) {
      STreeNode parentNode = node.getParent() as STreeNode;
      if (parentNode is SC) {
        parentNode.child = null;
      } else if (parentNode is MC) {
        parentNode.children.remove(node);
      }
    }
  }

  // Future<void> _cutNode(CutNode event, emit) async {
  //   //_createSnippetUndo();
  //   STreeNode selectedNode = event.node;
  //   String cutJson = selectedNode.toJson();
  //   if (selectedNode != state.rootNode) {
  //     // hook child(ren) up to deleted node's parent
  //     {
  //       if (selectedNode is SingleChildNode) {
  //         STreeNode? child = selectedNode.child;
  //         child?.parent = selectedNode.parent;
  //       }
  //       if (selectedNode is MultiChildNode && selectedNode.parent is MultiChildNode) {
  //         for (STreeNode child in (selectedNode).children) {
  //           child.parent = selectedNode.parent;
  //         }
  //       }
  //       if (selectedNode is TextSpanNode && selectedNode.parent is TextSpanNode) {
  //         List<InlineSpanNode>? children = selectedNode.children;
  //         if (children?.isNotEmpty ?? false) {
  //           for (InlineSpanNode child in children!) {
  //             child.parent = selectedNode.parent;
  //           }
  //         }
  //       }
  //     }
  //     // parent to deleted node's children
  //     STreeNode parentNode = selectedNode.parent as STreeNode;
  //     if (parentNode is SingleChildNode && selectedNode is SingleChildNode) {
  //       parentNode.child = selectedNode.child;
  //     } else if (parentNode is MultiChildNode && selectedNode is MultiChildNode) {
  //       parentNode.children = selectedNode.children;
  //     }
  //   }
  //   state.treeC.rebuild();
  //   FlutterContent().capiBloc.add(CAPIEvent.updateClipboard(newContent: cutJson));
  // }

  Future<void> _copyNode(CopyNode event, emit) async {
    FC().capiBloc.add(CAPIEvent.updateClipboard(newContent: event.node, skipSave: event.skipSave));
  }

  STreeNode _typeAsATreeNode(Type t, STreeNode? childNode, String notFoundMsg, {SnippetName? snippetName}) => switch (t) {
        const (AlignNode) => AlignNode(child: childNode, alignment: AlignmentEnum.topLeft),
        const (AspectRatioNode) => AspectRatioNode(child: childNode),
        const (AssetImageNode) => AssetImageNode(),
        const (FSImageNode) => FSImageNode(),
        const (FirebaseStorageImageNode) => FirebaseStorageImageNode(),
        const (CarouselNode) => CarouselNode(children: childNode != null ? [childNode] : []),
        const (CenterNode) => CenterNode(child: childNode),
        const (ColumnNode) => ColumnNode(mainAxisSize: MainAxisSizeEnum.max, children: childNode != null ? [childNode] : []),
        const (ContainerNode) =>
          state.selectedNode?.getParent() is ContainerNode ? ContainerNode(child: childNode, alignment: AlignmentEnum.center) : ContainerNode(child: childNode),
        const (ContentSnippetRootNode) => ContentSnippetRootNode(name: 'content', child: childNode),
        const (DefaultTextStyleNode) => DefaultTextStyleNode(child: childNode, textStyleGroup: TextStyleGroup(fontSizeName: Material3TextSizeEnum.bodyM)),
        // const (FSBucketNode) => FSBucketNode(
        //     name: 'bucket name missing ?',
        //     root: GenericSingleChildNode(
        //         propertyName: 'root',
        //         child: FSDirectoryNode(name: 'root', children: []))),
        const (DirectoryNode) => DirectoryNode(children: []),
        // const (FSDirectoryNode) => FSDirectoryNode(children: []),
        const (ExpandedNode) => ExpandedNode(child: childNode),
        const (ElevatedButtonNode) => ElevatedButtonNode(),
        const (FileNode) => FileNode(name: '', src: ''),
        // const (FSFileNode) => FSFileNode(name: ''),
        const (FilledButtonNode) => FilledButtonNode(),
        const (FlexibleNode) => FlexibleNode(child: childNode),
        const (GapNode) => GapNode(gap: 0),
        const (GoogleDriveIFrameNode) => GoogleDriveIFrameNode(),
        const (IconButtonNode) => IconButtonNode(),
        const (IFrameNode) => IFrameNode(),
        const (MenuBarNode) => MenuBarNode(children: []),
        const (MenuItemButtonNode) => MenuItemButtonNode(),
        const (OutlinedButtonNode) => OutlinedButtonNode(),
        const (PaddingNode) => PaddingNode(padding: EdgeInsetsValue(), child: childNode),
        const (PlaceholderNode) => PlaceholderNode(),
        const (PollNode) => PollNode(
            name: 'sample-poll',
            title: 'Sample Poll',
            children: [
              PollOptionNode(optionId: 'a', text: 'option 1 text?'),
              PollOptionNode(optionId: 'b', text: 'option 2 text?'),
              PollOptionNode(optionId: 'c', text: 'option 3 text?'),
            ],
          ),
        const (PollOptionNode) => PollOptionNode(optionId: 'id?', text: 'new option text?'),
        const (PositionedNode) => PositionedNode(top: 0, left: 0, child: childNode),
        const (RichTextNode) => RichTextNode(text: TextSpanNode(text: '', isRootTextSpan: true)),
        const (RowNode) => RowNode(children: childNode != null ? [childNode] : []),
        const (SingleChildScrollViewNode) => SingleChildScrollViewNode(child: childNode),
        const (SizedBoxNode) => SizedBoxNode(child: childNode),
        const (SnippetRootNode) => SnippetRootNode(name: snippetName!),
        const (SplitViewNode) => SplitViewNode(children: childNode != null ? [childNode] : []),
        const (StackNode) => StackNode(children: childNode != null ? [childNode] : []),
        const (StepNode) => StepNode(
            title: GenericSingleChildNode(propertyName: 'title', child: TextNode(text: 'step title')),
            subtitle: GenericSingleChildNode(propertyName: 'subtitle', child: TextNode(text: 'subtitle')),
            content: GenericSingleChildNode(propertyName: 'content', child: TextNode(text: 'content')),
          ),
        const (StepperNode) => StepperNode(children: [
            StepNode(
              title: GenericSingleChildNode(propertyName: 'title', child: TextNode(text: 'step 1 title')),
              subtitle: GenericSingleChildNode(propertyName: 'subtitle', child: TextNode(text: 'subtitle')),
              content: GenericSingleChildNode(propertyName: 'content', child: TextNode(text: 'my content 1')),
            ),
            StepNode(
              title: GenericSingleChildNode(propertyName: 'title', child: TextNode(text: 'step 2 title')),
              subtitle: GenericSingleChildNode(propertyName: 'subtitle', child: TextNode(text: 'subtitle')),
              content: GenericSingleChildNode(propertyName: 'content', child: TextNode(text: 'my content 2')),
            ),
            StepNode(
              title: GenericSingleChildNode(propertyName: 'title', child: TextNode(text: 'step 3 title')),
              subtitle: GenericSingleChildNode(propertyName: 'subtitle', child: TextNode(text: 'subtitle')),
              content: GenericSingleChildNode(propertyName: 'content', child: TextNode(text: 'my content 3')),
            ),
          ]),
        const (SubmenuButtonNode) => SubmenuButtonNode(menuChildren: childNode != null ? [childNode] : []),
        const (SubtitleSnippetRootNode) => SubtitleSnippetRootNode(name: 'subtitle', child: childNode),
        // const (TargetButtonNode) =>
        //   TargetButtonNode(name: 'no name!', child: childNode),
        const (HotspotsNode) => HotspotsNode(child: childNode),
        const (TextButtonNode) => TextButtonNode(),
        const (TextNode) => TextNode(text: 'abc'),
        const (TextSpanNode) => TextSpanNode(children: []),
        const (WidgetSpanNode) => WidgetSpanNode(child: childNode),
        const (YTNode) => YTNode(),
        _ => throw (Exception(notFoundMsg)),
      };

  void _wrapWith(WrapSelectionWith event, emit) {
    if (!state.aNodeIsSelected) return;

    STreeNode wChild = state.selectedNode!;
    STreeNode parent = wChild.getParent() as STreeNode;
    STreeNode w = event.type != null
        ? _typeAsATreeNode(
            event.type!,
            wChild,
            "_wrapWith() missing ${event.type.toString()}",
            snippetName: event.snippetName,
          )
        : event.testNode!;

    if (w is CL || w is WidgetSpanNode) return;
    if (wChild is InlineSpanNode && w is! InlineSpanNode) return;
    if (w is PollNode && wChild is! PollOptionNode) return;
    if (wChild is PollOptionNode && w is! PollNode) return;
    if (w is StepperNode && wChild is! StepNode) return;
    if (wChild is StepNode && w is! StepperNode) return;
    if (wChild is ExpandedNode && w is! FlexNode) return;
    if (wChild is FlexibleNode && w is! FlexNode) return;
    if (wChild is PositionedNode && w is! StackNode) return;
    if (wChild is InlineSpanNode && wChild.getParent() is RichTextNode && w is RichTextNode) return;
    if (wChild is InlineSpanNode && wChild.getParent() is! RichTextNode && w is! InlineSpanNode) return;

    try {
      //_createSnippetUndo();

      w.setParent(wChild.getParent());
      wChild.setParent(w);

      if (w is SC) {
        w.child = wChild;
      } else if (w is TextSpanNode) {
        w.children = [wChild as InlineSpanNode];
      } else if (w is PollNode) {
        w.children = [wChild as PollOptionNode];
        // wrap poll in a border
        final Node? pollParent = w.getParent();
        w = ContainerNode(
            decoration: DecorationShapeEnum.rounded_rectangle_dotted,
            borderColorValues: UpTo6ColorValues(color1Value: Colors.black.value),
            borderThickness: 4,
            child: w)
          ..setParent((pollParent));
        w.child!.setParent(w);
      } else if (w is StepperNode) {
        w.children = [wChild as StepNode];
      } else if (w is MC) {
        w.children = [wChild];
      }

      if (parent is SC) {
        parent.child = w;
      } else if (parent is MC) {
        int index = parent.children.indexOf(wChild);
        parent.children[index] = w;
      } else if (parent is RichTextNode) {
        parent.text = w as TextSpanNode;
      }

      // update treeC if rootNode changed (that's the Snippet's child)
      SnippetTreeController possiblyNewTreeC = state.treeC;
      if (w.getParent() is SnippetRootNode) {
        possiblyNewTreeC = SnippetTreeController(
          roots: [w],
          childrenProvider: Node.snippetTreeChildrenProvider,
        );
      }

      state.treeC.expand(w);
      state.treeC.rebuild();

      emit(state.copyWith(
        selectedNode: w,
        treeC: possiblyNewTreeC,
      ));
    } catch (e) {
      debugPrint("\n ***  _wrapWith() - failed!  ***");
      rethrow;
    }
  }

  // void _wrapWithOLD(WrapWith event, emit) {
  //   if (state.aNodeIsSelected) {
  //     STreeNode selectedNode = state.selectedNode!;
  //     //_createSnippetUndo();
  //     STreeNode newNode =
  //         event.type != null ? _typeAsATreeNode(event.type!, selectedNode, "_wrapWith() missing ${event.type.toString()}") : event.testNode!;
  //
  //     newNode.setParent(selectedNode.parent);
  //
  //     // // attach new parent at select node's pos in the tree...
  //     // if selected node is actually a root node, make newNode the new root
  //     if (selectedNode.parent == null) {
  //       state.treeC.roots = [newNode];
  //     } else {
  //       //
  //       if (selectedNode.parent is SC) {
  //         (selectedNode.parent as SC).child = newNode;
  //       } else if (selectedNode.parent is MC) {
  //         int i = (selectedNode.parent as MC).children.indexOf(selectedNode);
  //         (selectedNode.parent as MC).children[i] = newNode;
  //       } else if (selectedNode.parent is WidgetSpanNode) {
  //         (selectedNode.parent as WidgetSpanNode).child = newNode;
  //       }
  //     }
  //     selectedNode.setParent(newNode);
  //
  //     state.treeC.expand(newNode);
  //     state.treeC.rebuild();
  //     emit(state.copyWith(
  //       selectedNode: newNode,
  //     ));
  //   }
  // }

  void _replaceWith(ReplaceSelectionWith event, emit) {
    if (state.aNodeIsSelected) {
      STreeNode selectedNode = state.selectedNode!;
      if (event.type == selectedNode.runtimeType) return;
      //_createSnippetUndo();
      STreeNode newNode = event.type != null
          ? _typeAsATreeNode(
              event.type!,
              null,
              "_replaceWith() missing ${event.type.toString()}",
              snippetName: event.snippetName,
            )
          : event.testNode!;
      _replaceWithNewNodeOrClipboard(selectedNode, emit, newNode);
    }
  }

  void _replaceWithNewNodeOrClipboard(STreeNode sel, emit, STreeNode r) {
    if (!state.aNodeIsSelected) return;

    if (sel is InlineSpanNode && r is! InlineSpanNode) return;
    if (sel is! InlineSpanNode && r is InlineSpanNode) return;
    if (sel is PollOptionNode && r is! PollOptionNode) return;
    if (sel is StepNode && r is! StepNode) return;

    STreeNode parent = sel.getParent() as STreeNode;

    try {
      //_createSnippetUndo();

      r.setParent(sel.getParent());

      if (parent is SC) {
        parent.child = r;
      } else if (parent is MC) {
        int index = parent.children.indexOf(sel);
        parent.children[index] = r;
      } else if (parent is TextSpanNode) {
        int index = parent.children!.indexOf(sel as InlineSpanNode);
        parent.children![index] = r as InlineSpanNode;
      } else if (parent is RichTextNode) {
        parent.text = r as InlineSpanNode;
      }

      if (sel is! SnippetRootNode) {
        // move any child or children to replacementNode, and set parent
        if (sel is SC && r is SC) {
          r.child = sel.child;
          r.child?.setParent(r);
        } else if (sel is MC && r is MC) {
          r.children = (sel).children;
          for (STreeNode child in r.children) {
            child.setParent(r);
          }
        } else if (sel is SC && sel.child != null && r is MC) {
          STreeNode child = sel.child!;
          r.children.add(child);
          child.setParent(r);
        }
      }
    } catch (e) {
      debugPrint("\n ***  _replaceWithNewNodeOrClipboard() - failed!  ***");
      rethrow;
    }

    // update treeC if rootNode changed (that's the Snippet's child)
    SnippetTreeController possiblyNewTreeC = state.treeC;
    // if (r.getParent() is SnippetRootNode) {
    //   possiblyNewTreeC = SnippetTreeController(
    //     roots: [r],
    //     childrenProvider: Node.snippetTreeChildrenProvider,
    //   );
    // }
    state.rootNode.validateTree();
    state.treeC.expand(r);
    state.treeC.rebuild();
    emit(state.copyWith(
      selectedNode: r,
      treeC: possiblyNewTreeC,
    ));
  }

  // void _replaceWithNewNodeOrClipboardOLD(STreeNode selectedNode, emit, STreeNode r) {
  //   //_createSnippetUndo();
  //
  //   // attach newNode to parent
  //   // if selected node is actually a root node, make newNode the new root
  //   if (selectedNode.parent == null) {
  //     state.treeC.roots = [replacementNode];
  //   } else {
  //     if (selectedNode.parent is SC) {
  //       (selectedNode.parent as SC).child = replacementNode;
  //     } else if (selectedNode.parent is MC) {
  //       List<STreeNode> children = (selectedNode.parent as MC).children;
  //       int index = children.indexOf(selectedNode);
  //       if (index != -1) {
  //         children[index] = replacementNode;
  //       }
  //     }
  //   }
  //   replacementNode.setParent(selectedNode.parent);
  //
  //   // move any child or children to replacementNode, and set parent
  //   if (selectedNode is SC && replacementNode is SC) {
  //     replacementNode.child = selectedNode.child;
  //     replacementNode.child!.setParent(replacementNode);
  //   } else if (selectedNode is MC && replacementNode is MC) {
  //     replacementNode.children = (selectedNode).children;
  //     for (STreeNode child in replacementNode.children) {
  //       child.setParent(replacementNode);
  //     }
  //   } else if (selectedNode is SC && (selectedNode).child != null && replacementNode is MC) {
  //     STreeNode child = selectedNode.child!;
  //     replacementNode.children.add(child);
  //     child.setParent(replacementNode);
  //   }
  //
  //   state.treeC.expand(replacementNode);
  //   state.treeC.rebuild();
  //   emit(state.copyWith(
  //     selectedNode: replacementNode,
  //   ));
  // }

  void _addChild(AppendChild event, emit) {
    if (state.aNodeIsSelected) {
      STreeNode selectedNode = state.selectedNode!;
      STreeNode newNode = event.type != null
          ? _typeAsATreeNode(
              event.type!,
              null,
              "_addChild() missing ${event.type.toString()}",
              snippetName: event.snippetName,
            )
          : event.testNode!;
      _addOrPasteChild(selectedNode, emit, newNode);
    }
  }

  void _addOrPasteChild(STreeNode selectedNode, emit, STreeNode newNode) {
    //_createSnippetUndo();
    // STreeNode? childNode;

    // if (selectedNode is ContainerNode) {
    //   selectedNode.alignment = AlignmentEnum.center;
    // }
    // if (selectedNode is PlaceholderNode) {
    //   selectedNode.child = newNode;
    //   if (state.selectedNode?.parent != null &&
    //       state.selectedNode?.parent is SingleChildNode &&
    //       (state.selectedNode?.parent as SingleChildNode).child == selectedNode) {
    //     (state.selectedNode?.parent as SingleChildNode).child = newNode;
    //   }
    // } else
    if (selectedNode is TabBarNode) {
      TabBarViewNode? tabBarViewNode = state.treeC.findNodeTypeInTree(rootNode, TabBarViewNode) as TabBarViewNode?;
      STreeNode newTabView = PlaceholderNode();
      tabBarViewNode?.children.add(newTabView);
      newTabView.setParent(tabBarViewNode);
      selectedNode.children.add(newNode);
      // scaffoldNode?.numTabs++;
    } else if (selectedNode is TabBarViewNode) {
      // ScaffoldNode? scaffoldNode = state.treeC
      //     .findNodeTypeInTree(rootNode, ScaffoldNode) as ScaffoldNode?;
      TabBarNode? tabBarNode = state.treeC.findNodeTypeInTree(rootNode, TabBarNode) as TabBarNode?;
      STreeNode newTab = TextNode(text: 'new tab');
      tabBarNode?.children.add(newTab);
      newTab.setParent(tabBarNode);
      selectedNode.children.add(newNode);
      // scaffoldNode?.numTabs++;
    } else if (selectedNode is SC) {
      selectedNode.child = newNode;
    } else if (selectedNode is MC) {
      selectedNode.children.add(newNode);
    } else if (selectedNode is TextSpanNode && newNode is TextSpanNode) {
      selectedNode.children ??= [];
      selectedNode.children!.add(newNode);
    } else if (selectedNode is TextSpanNode && newNode is WidgetSpanNode) {
      selectedNode.children = [newNode];
    } else if (selectedNode is WidgetSpanNode) {
      selectedNode.child = newNode;
    }
    // newNode.setParent(selectedNode);
    state.rootNode.validateTree();
    state.treeC.expand(newNode);
    state.treeC.rebuild();
    emit(state.copyWith(
      selectedNode: newNode,
    ));
  }

  void _pasteReplacement(PasteReplacement event, emit) {
    if (state.aNodeIsSelected && FC().clipboard != null) {
      STreeNode selectedNode = state.selectedNode!;
      STreeNode clipboardNode = FC().clipboard!;
      //_createSnippetUndo();
      _replaceWithNewNodeOrClipboard(selectedNode, emit, clipboardNode);
    }

    // // Container's Container parent should have an alignment property
    // if (event.selectedNode is ContainerNode) {
    //   (event.selectedNode as ContainerNode).alignment = AlignmentEnum.center;
    // }
    // if (event.selectedNode is SingleChildNode) {
    //   (event.selectedNode as SingleChildNode).child = clipboardNode;
    // } else if (event.selectedNode is MultiChildNode) {
    //   (event.selectedNode as MultiChildNode).children = [clipboardNode];
    // } else if (event.selectedNode is TextSpanNode && clipboardNode is TextSpanNode) {
    //   (event.selectedNode as TextSpanNode).children = [clipboardNode];
    // } else if (event.selectedNode is TextSpanNode && clipboardNode is WidgetSpanNode) {
    //   (event.selectedNode as TextSpanNode).children = [clipboardNode];
    // } else if (event.selectedNode is WidgetSpanNode) {
    //   (event.selectedNode as WidgetSpanNode).child = clipboardNode;
    // }
    // state.treeC.expand(event.selectedNode);
    // state.treeC.rebuild();
    // emit(state.copyWith(
    //   //selectedNode: clipboardNode,
    // ));
  }

  void _pasteChild(PasteChild event, emit) {
    if (state.aNodeIsSelected && FC().clipboard != null) {
      STreeNode selectedNode = state.selectedNode!;
      STreeNode clipboardNode = FC().clipboard!;
      _addOrPasteChild(selectedNode, emit, clipboardNode);
    }
  }

  void _addSiblingBefore(AddSiblingBefore event, emit) {
    if (state.aNodeIsSelected) {
      STreeNode selectedNode = state.selectedNode!;
      STreeNode newNode = event.type != null
          ? _typeAsATreeNode(
              event.type!,
              null,
              "_addSiblingBefore() missing ${event.type.toString()}",
              snippetName: event.snippetName,
            )
          : event.testNode!;
      //_createSnippetUndo();
      if (state.selectedNode?.getParent() is MC) {
        int i = (state.selectedNode?.getParent() as MC).children.indexOf(selectedNode);
        _addSiblingAt(newNode, emit, i);
      }
      if (state.selectedNode?.getParent() is TextSpanNode) {
        int i = (state.selectedNode?.getParent() as TextSpanNode).children!.indexOf(selectedNode as InlineSpanNode);
        _addSiblingAt(newNode, emit, i);
      }
    }
  }

  void _pasteSiblingBefore(PasteSiblingBefore event, emit) {
    if (state.aNodeIsSelected && FC().clipboard != null) {
      STreeNode selectedNode = state.selectedNode!;
      STreeNode clipboardNode = FC().clipboard!;
      //_createSnippetUndo();
      if (state.selectedNode?.getParent() is MC) {
        int i = (state.selectedNode?.getParent() as MC).children.indexOf(selectedNode);
        _pasteSiblingAt(clipboardNode, emit, i);
      }
      if (state.selectedNode?.getParent() is TextSpanNode) {
        int i = (state.selectedNode?.getParent() as TextSpanNode).children!.indexOf(selectedNode as InlineSpanNode);
        _pasteSiblingAt(clipboardNode, emit, i);
      }
    }
  }

  void _addSiblingAfter(AddSiblingAfter event, emit) {
    if (state.aNodeIsSelected) {
      STreeNode selectedNode = state.selectedNode!;
      STreeNode newNode = event.type != null
          ? _typeAsATreeNode(
              event.type!,
              null,
              "_addSiblingAfter() missing ${event.type.toString()}",
              snippetName: event.snippetName,
            )
          : event.testNode!;
      //_createSnippetUndo();
      if (state.selectedNode?.getParent() is MC) {
        int i = (state.selectedNode?.getParent() as MC).children.indexOf(selectedNode);
        _addSiblingAt(newNode, emit, i + 1);
      }
      if (state.selectedNode?.getParent() is TextSpanNode) {
        int i = (state.selectedNode?.getParent() as TextSpanNode).children!.indexOf(selectedNode as InlineSpanNode);
        _addSiblingAt(newNode, emit, i + 1);
      }
    }
  }

  void _pasteSiblingAfter(PasteSiblingAfter event, emit) {
    if (state.aNodeIsSelected && FC().clipboard != null) {
      STreeNode selectedNode = state.selectedNode!;
      STreeNode clipboardNode = FC().clipboard!;
      //_createSnippetUndo();
      if (state.selectedNode?.getParent() is MC) {
        int i = (state.selectedNode?.getParent() as MC).children.indexOf(selectedNode);
        _pasteSiblingAt(clipboardNode, emit, i + 1);
      }
      if (state.selectedNode?.getParent() is TextSpanNode) {
        int i = (state.selectedNode?.getParent() as TextSpanNode).children!.indexOf(selectedNode as InlineSpanNode);
        _pasteSiblingAt(clipboardNode, emit, i + 1);
      }
    }
  }

  void _addSiblingAt(STreeNode newNode, emit, int i) {
    //_createSnippetUndo();
    STreeNode? parent = state.selectedNode?.getParent() as STreeNode?;
    if (parent is TabBarNode) {
      TabBarViewNode? tabBarViewNode = state.treeC.findNodeTypeInTree(rootNode, TabBarViewNode) as TabBarViewNode?;
      tabBarViewNode?.children.insert(i, PlaceholderNode()..setParent(tabBarViewNode));
      parent.children.insert(i, newNode..setParent(parent));
    } else if (parent is TabBarViewNode) {
      TabBarNode? tabBarNode = state.treeC.findNodeTypeInTree(rootNode, TabBarNode) as TabBarNode?;
      tabBarNode?.children.insert(i, TextNode(text: 'new tab')..setParent(tabBarNode));
      parent.children.insert(i, newNode..setParent(parent));
    } else if (state.selectedNode?.getParent() is MC) {
      (state.selectedNode?.getParent() as MC).children.insert(i, newNode);
    }
    if (state.selectedNode?.getParent() is TextSpanNode) {
      (state.selectedNode?.getParent() as TextSpanNode).children?.insert(i, newNode as InlineSpanNode);
    }

    newNode.setParent(parent);
    state.treeC.expand(newNode);
    emit(state.copyWith(
      selectedNode: newNode,
    ));
  }

  void _pasteSiblingAt(STreeNode clipboardNode, emit, int i) {
    //_createSnippetUndo();
    TextSpanNode? textSpanNode;
    STreeNode newNode = clipboardNode;

    if (state.selectedNode?.getParent() is MC) {
      (state.selectedNode?.getParent() as MC).children.insert(i, newNode);
      newNode.setParent(state.selectedNode?.getParent());
    }
    if (state.selectedNode?.getParent() is TextSpanNode) {
      (state.selectedNode?.getParent() as TextSpanNode).children?.insert(i, newNode as InlineSpanNode);
      newNode.setParent(state.selectedNode?.getParent());
    }

    state.rootNode.validateTree();

    if (newNode is RichTextNode) {
      state.treeC.expand(newNode);
      emit(state.copyWith(
        selectedNode: textSpanNode,
      ));
    } else {
      state.treeC.expand(newNode);
      emit(state.copyWith(
        selectedNode: newNode,
      ));
    }
  }

  void _selectedDirectoryOrNode(SelectedDirectoryOrNode event, emit) {
    emit(state.copyWith(
      selectedNode: event.selectedNode,
    ));
  }

  // void _createdSnippet(CreatedSnippet event, emit) {
  //   // state.ur.createUndo(state.snippetTreeC.roots, state.snippetTreeC.expandedNodes);
  //   state.treeC.roots = [event.newNode];
  //   state.treeC.rebuild();
  //   if (state.snippetsMap.containsKey(event.newNode.name)) return;
  //   Map<SnippetName, SnippetNode> newSnippetsMap = Map<SnippetName, SnippetNode>.of(state.snippetsMap);
  //   newSnippetsMap[event.newNode.name] = event.newNode;
  //   // state.snippetTreeC.toggleExpansion(state.snippetTreeC.roots.first);
  //   emit(state.copyWith(
  //     snippetsMap: newSnippetsMap,
  //     selectedNode: event.newNode,
  //     // showAdders: true,
  //     lastAddedNode: event.newNode,
  //   ));
  // }
  //

  Future<void> _saveNodeAsSnippet(SaveNodeAsSnippet event, emit) async {
    //_createSnippetUndo();

    //_cutIncludingAnyChildren(event.node);

    // create new snippet
    SnippetRootNode newRootNode = SnippetRootNode(name: event.newSnippetName, child: event.node);
    VersionId initialVersionId = DateTime.now().millisecondsSinceEpoch.toString();
    await FC().possiblyCacheAndSaveANewSnippetVersion(snippetName: event.newSnippetName, rootNode: newRootNode);
    // FC().addToSnippetCache(
    //   snippetName: event.newSnippetName,
    //   rootNode: rootNode,
    //   versionId: initialVersionId,
    //   // editing: true,
    // );
    // FC().updatePublishedVersionId(
    //     snippetName: event.newSnippetName, versionId: initialVersionId);
    // FC().updateEditingVersionId(
    //     snippetName: event.newSnippetName, newVersionId: initialVersionId);
    // await FC().modelRepo.saveSnippet(
    //     snippetRootNode: newRootNode, newVersionId: initialVersionId);
    //
    // FC().snippetCache[event.newSnippetName] = {};
    // FlutterContent().capiBloc.add(CAPIEvent.createdSnippet(newSnippetNode: newRootNode));
    // create a snippet ref node
    SnippetRootNode refNode = SnippetRootNode(name: event.newSnippetName);
    // attach to parent
    if (state.selectedNode?.getParent() is SC) {
      (state.selectedNode?.getParent() as SC).child = refNode;
    } else if (state.selectedNode?.getParent() is MC) {
      int index =  (state.selectedNode?.getParent() as MC).children.indexOf(event.node);
      (state.selectedNode?.getParent() as MC).children[index] = refNode;
    } else if (state.selectedNode?.getParent() is WidgetSpanNode) {
      (state.selectedNode?.getParent() as WidgetSpanNode).child = refNode;
    }
    state.treeC.expand(newRootNode);
    state.treeC.rebuild();

    // var appInfo = FC().appInfoAsMap;

    emit(state.copyWith(
      selectedNode: refNode,
    ));
    // }
  }

  // void _createSnippetUndo() {
  //   state.ur.createUndo(state);
  // }

  // void _undo(Undo event, emit) {
  //   if (state.canUndo()) {
  //     SnippetState? result = state.ur.undo(state);
  //     _restore(result, emit);
  //   }
  // }

  // void _redo(Redo event, emit) {
  //   if (state.canRedo()) {
  //     SnippetState? result = state.ur.redo(state);
  //     _restore(result, emit);
  //   }
  // }

  // void _restore(SnippetState? undoOrRedoResult, emit) {
  //   // replace bloc in queue with undo/redo result
  //   SnippetState? prevSnippetState = undoOrRedoResult;
  //   SnippetRootNode? prevRootNode = prevSnippetState?.rootNode;
  //   if (prevRootNode == null) return;
  //   SnippetBloC restoredSnippetBloc = SnippetBloC(
  //     rootNode: prevRootNode,
  //     treeC: prevSnippetState!.treeC..expand(prevRootNode),
  //     treeUR: prevSnippetState.ur,
  //     selectedNode: prevSnippetState.selectedNode,
  //     selectedWidgetGK: prevSnippetState.selectedWidgetGK,
  //     selectedTreeNodeGK: prevSnippetState.selectedTreeNodeGK,
  //   );
  //   FC()
  //       .capiBloc
  //       .add(CAPIEvent.restoredSnippetBloc(restoredBloc: restoredSnippetBloc));
  //
  //   if (undoOrRedoResult != null) {
  //     emit(prevSnippetState);
  //     Useful.afterNextBuildDo(() {
  //       state.treeC.rebuild();
  //       STreeNode? restoredSelectedNode = state.selectedNode;
  //       if (restoredSelectedNode != null) {
  //         add(
  //           SelectNode(
  //             node: restoredSelectedNode,
  //             selectedWidgetGK: GlobalKey(debugLabel: 'selectedWidgetGK'),
  //             selectedTreeNodeGK: GlobalKey(debugLabel: 'selectedTreeNodeGK'),
  //           ),
  //         );
  //       }
  //     });
  //   }
  // }

  bool get deleteInProgress => state.nodeBeingDeleted != null;

  bool get aNodeIsSelected => state.aNodeIsSelected;

  SnippetRootNode get rootNode => state.rootNode;

  SnippetTreeController get treeC => state.treeC;

  String get snippetName => rootNode.name;

// SnippetBloC clone() => SnippetBloC(
//       node: rootNode!,
//       treeC: SnippetTreeController(
//         roots: [rootNode!],
//         childrenProvider: Node.snippetTreeChildrenProvider,
//       ),
//       treeUR: SnippetTreeUR(),
//     );
}
