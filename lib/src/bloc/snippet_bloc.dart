import 'package:flutter/widgets.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_state.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_alignment.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_main_axis_size.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_material3_text_size.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/text_style_group.dart';
import 'package:flutter_content/src/snippet/snodes/edgeinsets_node_value.dart';
import 'package:flutter_content/src/target_config/content/snippet_editor/undo_redo_snippet_tree.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'capi_event.dart';
import 'snippet_event.dart';
import 'snippet_state.dart';

class SnippetBloC extends Bloc<SnippetEvent, SnippetState> {
  SnippetBloC({
    required SnippetRootNode rootNode,
    // following could be restored from CAPIState.snippetStateMap (previous snippet tree callout)
    required SnippetTreeController treeC,
    required SnippetTreeUR treeUR,
    STreeNode? selectedNode,
    GlobalKey? selectedWidgetGK,
    GlobalKey? selectedTreeNodeGK,
  }) : super(SnippetState(
          rootNode: rootNode,
          treeC: treeC,
          ur: treeUR,
          selectedNode: selectedNode,
          selectedWidgetGK: selectedWidgetGK,
          selectedTreeNodeGK: selectedTreeNodeGK,
        )) {
    // print("\n\nCreating SnippetBloC ${node.name}\n\n");
    // events
    on<SelectNode>((event, emit) => _selectNode(event, emit));
    on<ClearNodeSelection>((event, emit) => _clearNodeSelection(event, emit));
    on<HighlightNode>((event, emit) => _highlightNode(event, emit));
    on<SaveNodeAsSnippet>((event, emit) => _saveNodeAsSnippet(event, emit));
    on<ForceSnippetRefresh>((event, emit) => _forceSnippetRefresh(event, emit));
    on<WrapWith>((event, emit) => _wrapWith(event, emit));
    on<ReplaceSelectionWith>((event, emit) => _replaceWith(event, emit));
    on<AppendChild>((event, emit) => _addChild(event, emit));
    on<AddSiblingBefore>((event, emit) => _addSiblingBefore(event, emit));
    on<AddSiblingAfter>((event, emit) => _addSiblingAfter(event, emit));
    on<PasteChild>((event, emit) => _pasteChild(event, emit));
    on<PasteReplacement>((event, emit) => _pasteReplacement(event, emit));
    on<PasteSiblingBefore>((event, emit) => _pasteSiblingBefore(event, emit));
    on<PasteSiblingAfter>((event, emit) => _pasteSiblingAfter(event, emit));
    on<DeleteNodeTapped>((event, emit) => _deleteNodeTapped(event, emit));
    on<SelectedDirectoryOrNode>((event, emit) => _selectedDirectoryOrNode(event, emit));
    on<CutNode>((event, emit) => _cutNode(event, emit));
    on<CopyNode>((event, emit) => _copyNode(event, emit));
    on<Undo>((event, emit) => _undo(event, emit));
    on<Redo>((event, emit) => _redo(event, emit));
  }

  // @override
  // Future<Function> close() async{
  //   return print;
  // }

  void _forceSnippetRefresh(event, emit) {
    print("forceSnippetRefresh");
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
    //   Map<String, TargetGroupConfig> newTargetGroupListMap = _addOrUpdateTargetGroupListMap(event.imageTC!.wName, event.imageTC!);
    //   emit(state.copyWith(
    //     multiTargetListMap: newTargetGroupListMap,
    //
    //     selectedNode: event.node,
    //     selectedTarget: event.imageTC,
    //     showAdders: event.showAdders,
    //     showProperties: event.showProperties,
    //     selectedNodeParent: event.nodeParent,
    //
    //     force: state.force + 1,
    //   ));
    // } else {
    // tc null means just editing a Snippet
    // STreeNode snode = event.node;
    // // create a bloc for the selected node
    // STreeNodeBloc newBloc = STreeNodeBloc(node: snode);

    // if new selection is a node above this tree root, reset the tree's root to it
    TreeSearchResult<STreeNode> result = state.treeC.search((snode) => snode == event.node);
    SnippetTreeController possiblyNewTreeC = state.treeC;
    if (result.matches.isEmpty) {
      possiblyNewTreeC = SnippetTreeController(
        roots: [event.node],
        childrenProvider: Node.snippetTreeChildrenProvider,
      )..expandAll();
    }
    emit(state.copyWith(
      treeC: possiblyNewTreeC,
      selectedNode: event.node,
      // selectedNodePropertiesTreeExpandedNodes: {},
      // selectedNodePropertiesPaneScrollPos: 0,
      // selectedNodeBloc: newBloc,
      highlightedNode: null,
      selectedWidgetGK: event.selectedWidgetGK,
      selectedTreeNodeGK: event.selectedTreeNodeGK,
      showProperties: event.showProperties,
    ));
    // CAPIBloC.I.add(const ForceRefresh());
    // }
  }

  void _highlightNode(HighlightNode event, emit) {
    emit(state.copyWith(
      highlightedNode: event.node,
      force: state.force + 1,
    ));
    // }
  }

  void _clearNodeSelection(event, emit) {
    emit(state.copyWith(
      selectedNode: null,
      // showAdders: false,
      showProperties: false,

      force: state.force + 1,
    ));
    CAPIBloC.I.add(const ForceRefresh());
  }

  Future<void> _deleteNodeTapped(DeleteNodeTapped event, emit) async {
    _createSnippetUndo();
    // await Future.delayed(Duration(milliseconds: 500));
    emit(state.copyWith(
      nodeBeingDeleted: state.selectedNode,
      force: state.force + 1,
    ));
    await Future.delayed(const Duration(milliseconds: 1000));
    _possiblyRemoveFromParentButNotChildren();
    state.treeC.rebuild();
    // print("--------------");
    // print(state.snippetTreeC.roots.first.toMap());
    emit(state.copyWith(
      nodeBeingDeleted: null,
      selectedNode: null,
      // showAdders: false,
      showProperties: false,
      // ur: state.ur,
      force: state.force + 1,
    ));
  }

  void _possiblyRemoveFromParentButNotChildren() {
    STreeNode? selectedNode = state.selectedNode;
    if (selectedNode != null) {
      if (selectedNode != state.rootNode) {
        STreeNode parentNode = selectedNode.parent as STreeNode;
        if (parentNode is SingleChildNode && selectedNode is SingleChildNode) {
          parentNode.child = selectedNode.child;
          selectedNode.child?.parent = parentNode;
        } else if (parentNode is MultiChildNode && selectedNode is SingleChildNode) {
          int index = parentNode.children.indexOf(selectedNode);
          if (selectedNode.child != null) {
            parentNode.children[index] = selectedNode.child!;
            selectedNode.child?.parent = parentNode;
          }
        }
        if (selectedNode is MultiChildNode && selectedNode.children.length == 1) {
          if (parentNode is SingleChildNode) {
            parentNode.child = selectedNode.children.first;
          } else if (parentNode is MultiChildNode) {
            int index = parentNode.children.indexOf(selectedNode);
            parentNode.children[index] = selectedNode.children.first;
          }
          if (parentNode is SnippetRootNode && parentNode.child == null) {
            parentNode.child = PlaceholderNode();
          }
        } else if (parentNode is SingleChildNode) {
          parentNode.child = null;
          if (parentNode is SnippetRootNode) {
            parentNode.child = PlaceholderNode();
          }
        } else if (parentNode is MultiChildNode) {
          int i = (parentNode).children.indexOf(selectedNode);
          if (parentNode is TabBarNode) {
            TabBarNode? tabBarNode = state.treeC.findNodeTypeInTree(rootNode, TabBarNode) as TabBarNode?;
            if (tabBarNode != null) {
              int numTabs = tabBarNode.children.length;
              tabBarNode?.children.removeAt(i);
              TabBarViewNode? tabBarViewNode = state.treeC.findNodeTypeInTree(rootNode, TabBarViewNode) as TabBarViewNode?;
              if (numTabs == tabBarViewNode?.children.length) {
                tabBarViewNode?.children.removeAt(i);
              }
            }
          } else if (parentNode is TabBarViewNode) {
            TabBarViewNode? tabBarViewNode = state.treeC.findNodeTypeInTree(rootNode, TabBarViewNode) as TabBarViewNode?;
            if (tabBarViewNode != null) {
              int numTabs = tabBarViewNode.children.length;
              tabBarViewNode?.children.removeAt(i);
              TabBarNode? tabBarNode = state.treeC.findNodeTypeInTree(rootNode, TabBarNode) as TabBarNode?;
              if (numTabs == tabBarNode?.children.length) {
                tabBarNode?.children.removeAt(i);
              }
            }
          } else {
            parentNode.children.removeAt(i);
          }
        } else if (parentNode is TextSpanNode) {
          if (parentNode.children!.length > 1) {
            parentNode.children!.remove(selectedNode);
          } else {
            parentNode.children = null;
          }
        }
      }
    }
  }

  Future<void> _cutNode(CutNode event, emit) async {
    _createSnippetUndo();
    String cutJson = event.node.toJson();
    _cutIncludingAnyChildren(event.node);
    state.treeC.rebuild();
    CAPIBloC.I.add(CAPIEvent.updateClipboard(newContent: cutJson));
  }

  _cutIncludingAnyChildren(STreeNode node) {
    if (node != state.rootNode) {
      // was: if (state.selectedNode?.parent != null) {
      STreeNode parentNode = node.parent as STreeNode;
      if (parentNode is SingleChildNode) {
        parentNode.child = null;
      } else if (parentNode is MultiChildNode) {
        parentNode.children.remove(node);
      }
    }
  }

  // Future<void> _cutNode(CutNode event, emit) async {
  //   _createSnippetUndo();
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
  //   CAPIBloC.I.add(CAPIEvent.updateClipboard(newContent: cutJson));
  // }

  Future<void> _copyNode(CopyNode event, emit) async {
    CAPIBloC.I.add(CAPIEvent.updateClipboard(newContent: event.node.toJson()));
  }

  STreeNode _typeAsATreeNode(Type t, STreeNode? selectedNode, String notFoundMsg) => switch (t) {
        const (AlignNode) => AlignNode(child: selectedNode, alignment: AlignmentEnum.topLeft),
        const (AspectRatioNode) => AspectRatioNode(child: selectedNode),
        const (AssetImageNode) => AssetImageNode(),
        const (CarouselNode) => CarouselNode(children: selectedNode != null ? [selectedNode] : []),
        const (CenterNode) => CenterNode(child: selectedNode),
        const (ColumnNode) => ColumnNode(mainAxisSize: MainAxisSizeEnum.max, children: selectedNode != null ? [selectedNode] : []),
        const (ContainerNode) => state.selectedNode?.parent is ContainerNode
            ? ContainerNode(child: selectedNode, alignment: AlignmentEnum.center)
            : ContainerNode(child: selectedNode),
        const (ContentSnippetRootNode) => ContentSnippetRootNode(name: 'content', child: selectedNode),
        const (DefaultTextStyleNode) =>
          DefaultTextStyleNode(child: selectedNode, textStyleGroup: TextStyleGroup(fontSizeName: Material3TextSizeEnum.bodyM)),
        const (DirectoryNode) => DirectoryNode(children: []),
        const (ExpandedNode) => ExpandedNode(child: selectedNode),
        const (ElevatedButtonNode) => ElevatedButtonNode(),
        const (FileNode) => FileNode(name: '', src: ''),
        const (FilledButtonNode) => FilledButtonNode(),
        const (FlexibleNode) => FlexibleNode(child: selectedNode),
        const (GapNode) => GapNode(gap: 0),
        const (GoogleDriveIFrameNode) => GoogleDriveIFrameNode(),
        const (IconButtonNode) => IconButtonNode(),
        const (IFrameNode) => IFrameNode(),
        const (MenuBarNode) => MenuBarNode(children: []),
        const (MenuItemButtonNode) => MenuItemButtonNode(),
        const (OutlinedButtonNode) => OutlinedButtonNode(),
        const (PaddingNode) => PaddingNode(padding: EdgeInsetsValue(), child: selectedNode),
        const (PlaceholderNode) => PlaceholderNode(),
        const (PollNode) => PollNode(name: 'sample-poll', title: 'Sample Poll', children: [
            PollOptionNode(optionId: 'a', text: 'option 1 text?'),
            PollOptionNode(optionId: 'b', text: 'option 2 text?'),
            PollOptionNode(optionId: 'c', text: 'option 3 text?'),
          ]),
        const (PollOptionNode) => PollOptionNode(optionId: 'id?', text: 'new option text?'),
        const (PositionedNode) => PositionedNode(top: 0, left: 0, child: selectedNode),
        const (RichTextNode) => RichTextNode(text: TextSpanNode(text: '', isRootTextSpan: true)),
        const (RowNode) => RowNode(children: selectedNode != null ? [selectedNode] : []),
        const (SingleChildScrollViewNode) => SingleChildScrollViewNode(child: selectedNode),
        const (SizedBoxNode) => SizedBoxNode(child: selectedNode),
        const (SnippetRootNode) => SnippetRootNode(name: 'name?', child: selectedNode),
        const (SplitViewNode) => SplitViewNode(children: selectedNode != null ? [selectedNode] : []),
        const (StackNode) => StackNode(children: selectedNode != null ? [selectedNode] : []),
        const (StepNode) => StepNode(titleSnippetName: '', subtitleSnippetName: '', contentSnippetName: ''),
        const (StepperNode) => StepperNode(children: [
            SnippetRootNode(name: 'title'),
            SnippetRootNode(name: 'subtitle'),
            SnippetRootNode(name: 'content'),
          ]),
        const (SubmenuButtonNode) => SubmenuButtonNode(menuChildren: selectedNode != null ? [selectedNode] : []),
        const (SubtitleSnippetRootNode) => SubtitleSnippetRootNode(name: 'subtitle', child: selectedNode),
        const (TargetWrapperNode) => TargetWrapperNode(snippetName: 'name', child: selectedNode),
        const (TargetGroupWrapperNode) => TargetGroupWrapperNode(name: 'name', child: selectedNode),
        const (TextButtonNode) => TextButtonNode(),
        const (TextNode) => TextNode(text: selectedNode is TabBarNode ? 'new Tab' : ''),
        const (TextSpanNode) => TextSpanNode(children: []),
        const (TitleSnippetRootNode) => TitleSnippetRootNode(name: 'title', child: selectedNode),
        const (WidgetSpanNode) => WidgetSpanNode(child: selectedNode),
        _ => throw (Exception(notFoundMsg)),
      };

  void _wrapWith(WrapWith event, emit) {
    if (state.aNodeIsSelected) {
      STreeNode selectedNode = state.selectedNode!;
      _createSnippetUndo();
      STreeNode newNode = _typeAsATreeNode(event.type, selectedNode, "_wrapWith() missing ${event.type.toString()}");

      newNode.parent = selectedNode.parent;

      // // attach new parent at select node's pos in the tree...
      // if selected node is actually a root node, make newNode the new root
      if (selectedNode.parent == null) {
        state.treeC.roots = [newNode];
      } else {
        //
        if (selectedNode.parent is SingleChildNode) {
          (selectedNode.parent as SingleChildNode).child = newNode;
        } else if (selectedNode.parent is MultiChildNode) {
          int i = (selectedNode.parent as MultiChildNode).children.indexOf(selectedNode);
          (selectedNode.parent as MultiChildNode).children[i] = newNode;
        } else if (selectedNode.parent is WidgetSpanNode) {
          (selectedNode.parent as WidgetSpanNode).child = newNode;
        }
      }
      selectedNode.parent = newNode;

      state.treeC.expand(newNode);
      state.treeC.rebuild();
      emit(state.copyWith(
        selectedNode: newNode,
        force: state.force + 1,
      ));
    }
  }

  void _replaceWith(ReplaceSelectionWith event, emit) {
    if (state.aNodeIsSelected) {
      STreeNode selectedNode = state.selectedNode!;
      _createSnippetUndo();
      STreeNode newNode = _typeAsATreeNode(event.type, null, "_replaceWith() missing ${event.type.toString()}");
      _replaceWithNewNodeOrClipboard(selectedNode, emit, newNode);
    }
  }

  void _replaceWithNewNodeOrClipboard(STreeNode selectedNode, emit, STreeNode replacementNode) {
    _createSnippetUndo();

    // attach newNode to parent
    // if selected node is actually a root node, make newNode the new root
    if (selectedNode.parent == null) {
      state.treeC.roots = [replacementNode];
    } else {
      if (selectedNode.parent is SingleChildNode) {
        (selectedNode.parent as SingleChildNode).child = replacementNode;
      } else if (selectedNode.parent is MultiChildNode) {
        List<STreeNode> children = (selectedNode.parent as MultiChildNode).children;
        int index = children.indexOf(selectedNode);
        if (index != -1) {
          children[index] = replacementNode;
        }
      }
    }
    // move any child or children to replacementNode, and set parent
    if (selectedNode is SingleChildNode && replacementNode is SingleChildNode) {
      replacementNode.child = selectedNode.child;
      replacementNode.child!.parent = replacementNode;
    } else if (selectedNode is MultiChildNode && replacementNode is MultiChildNode) {
      replacementNode.children = (selectedNode).children;
      for (STreeNode child in replacementNode.children) {
        child.parent = replacementNode;
      }
    } else if (selectedNode is SingleChildNode && (selectedNode).child != null && replacementNode is MultiChildNode) {
      STreeNode child = selectedNode.child!;
      replacementNode.children.add(child);
      child.parent = replacementNode;
    }

    state.treeC.expand(replacementNode);
    state.treeC.rebuild();
    emit(state.copyWith(
      selectedNode: replacementNode,
      force: state.force + 1,
    ));
  }

  void _addChild(AppendChild event, emit) {
    if (state.aNodeIsSelected) {
      STreeNode selectedNode = state.selectedNode!;
      STreeNode newNode = _typeAsATreeNode(event.type, selectedNode, "_addChild() missing ${event.type.toString()}");
      _addOrPasteChild(selectedNode, emit, newNode);
    }
  }

  void _addOrPasteChild(STreeNode selectedNode, emit, STreeNode newNode) {
    _createSnippetUndo();
    STreeNode? childNode;

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
      newTabView.parent = tabBarViewNode;
      selectedNode.children.add(newNode);
      // scaffoldNode?.numTabs++;
    } else if (selectedNode is TabBarViewNode) {
      ScaffoldNode? scaffoldNode = state.treeC.findNodeTypeInTree(rootNode, ScaffoldNode) as ScaffoldNode?;
      TabBarNode? tabBarNode = state.treeC.findNodeTypeInTree(rootNode, TabBarNode) as TabBarNode?;
      STreeNode newTab = TextNode(text: 'new tab');
      tabBarNode?.children.add(newTab);
      newTab.parent = tabBarNode;
      selectedNode.children.add(newNode);
      // scaffoldNode?.numTabs++;
    } else if (selectedNode is SingleChildNode) {
      selectedNode.child = newNode;
    } else if (selectedNode is MultiChildNode) {
      selectedNode.children.add(newNode);
    } else if (selectedNode is TextSpanNode && newNode is TextSpanNode) {
      selectedNode.children ??= [];
      selectedNode.children!.add(newNode);
    } else if (selectedNode is TextSpanNode && newNode is WidgetSpanNode) {
      selectedNode.children = [newNode];
    } else if (selectedNode is WidgetSpanNode) {
      selectedNode.child = newNode;
    }
    newNode.parent = selectedNode;
    state.treeC.expand(newNode);
    state.treeC.rebuild();
    emit(state.copyWith(
      selectedNode: childNode ?? newNode,
      force: state.force + 1,
    ));
  }

  void _pasteReplacement(PasteReplacement event, emit) {
    if (state.aNodeIsSelected) {
      STreeNode selectedNode = state.selectedNode!;
      _createSnippetUndo();
      _replaceWithNewNodeOrClipboard(selectedNode, emit, event.clipboardNode);
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
    //   force: state.force + 1,
    // ));
  }

  void _pasteChild(PasteChild event, emit) {
    if (state.aNodeIsSelected) {
      STreeNode selectedNode = state.selectedNode!;
      STreeNode clipboardNode = event.clipboardNode;
      _addOrPasteChild(selectedNode, emit, clipboardNode);
    }
  }

  void _addSiblingBefore(AddSiblingBefore event, emit) {
    if (state.aNodeIsSelected) {
      STreeNode selectedNode = state.selectedNode!;
      _createSnippetUndo();
      if (state.selectedNode?.parent is MultiChildNode) {
        int i = (state.selectedNode?.parent as MultiChildNode).children.indexOf(selectedNode);
        _addSiblingAt(event.type, emit, i);
      }
      if (state.selectedNode?.parent is TextSpanNode) {
        int i = (state.selectedNode?.parent as TextSpanNode).children!.indexOf(selectedNode as InlineSpanNode);
        _addSiblingAt(event.type, emit, i);
      }
    }
  }

  void _pasteSiblingBefore(PasteSiblingBefore event, emit) {
    if (state.aNodeIsSelected) {
      STreeNode selectedNode = state.selectedNode!;
      _createSnippetUndo();
      if (state.selectedNode?.parent is MultiChildNode) {
        int i = (state.selectedNode?.parent as MultiChildNode).children.indexOf(selectedNode);
        _pasteSiblingAt(event.clipboardNode, emit, i);
      }
      if (state.selectedNode?.parent is TextSpanNode) {
        int i = (state.selectedNode?.parent as TextSpanNode).children!.indexOf(selectedNode as InlineSpanNode);
        _pasteSiblingAt(event.clipboardNode, emit, i);
      }
    }
  }

  void _addSiblingAfter(AddSiblingAfter event, emit) {
    if (state.aNodeIsSelected) {
      STreeNode selectedNode = state.selectedNode!;
      _createSnippetUndo();
      if (state.selectedNode?.parent is MultiChildNode) {
        int i = (state.selectedNode?.parent as MultiChildNode).children.indexOf(selectedNode);
        _addSiblingAt(event.type, emit, i + 1);
      }
      if (state.selectedNode?.parent is TextSpanNode) {
        int i = (state.selectedNode?.parent as TextSpanNode).children!.indexOf(selectedNode as InlineSpanNode);
        _addSiblingAt(event.type, emit, i + 1);
      }
    }
  }

  void _pasteSiblingAfter(PasteSiblingAfter event, emit) {
    if (state.aNodeIsSelected) {
      STreeNode selectedNode = state.selectedNode!;
      _createSnippetUndo();
      if (state.selectedNode?.parent is MultiChildNode) {
        int i = (state.selectedNode?.parent as MultiChildNode).children.indexOf(selectedNode);
        _pasteSiblingAt(event.clipboardNode, emit, i + 1);
      }
      if (state.selectedNode?.parent is TextSpanNode) {
        int i = (state.selectedNode?.parent as TextSpanNode).children!.indexOf(selectedNode as InlineSpanNode);
        _pasteSiblingAt(event.clipboardNode, emit, i + 1);
      }
    }
  }

  void _addSiblingAt(Type nodeType, emit, int i) {
    _createSnippetUndo();
    STreeNode newNode = _typeAsATreeNode(nodeType, null, "_addChild() missing ${nodeType.toString()}");
    STreeNode? parent = state.selectedNode?.parent as STreeNode?;
    if (parent is TabBarNode) {
      TabBarViewNode? tabBarViewNode = state.treeC.findNodeTypeInTree(rootNode, TabBarViewNode) as TabBarViewNode?;
      tabBarViewNode?.children.insert(i, PlaceholderNode());
      parent.children.insert(i, newNode);
    } else if (parent is TabBarViewNode) {
      TabBarNode? tabBarNode = state.treeC.findNodeTypeInTree(rootNode, TabBarNode) as TabBarNode?;
      tabBarNode?.children.insert(i, TextNode(text: 'new tab'));
      parent.children.insert(i, newNode);
    } else if (state.selectedNode?.parent is MultiChildNode) {
      (state.selectedNode?.parent as MultiChildNode).children.insert(i, newNode);
    }
    if (state.selectedNode?.parent is TextSpanNode) {
      (state.selectedNode?.parent as TextSpanNode).children?.insert(i, newNode as InlineSpanNode);
    }

    state.treeC.expand(newNode);
    emit(state.copyWith(
      selectedNode: newNode,
      force: state.force + 1,
    ));
  }

  void _pasteSiblingAt(STreeNode clipboardNode, emit, int i) {
    _createSnippetUndo();
    TextSpanNode? textSpanNode;
    STreeNode newNode = clipboardNode;

    if (state.selectedNode?.parent is MultiChildNode) {
      (state.selectedNode?.parent as MultiChildNode).children.insert(i, newNode);
    }
    if (state.selectedNode?.parent is TextSpanNode) {
      (state.selectedNode?.parent as TextSpanNode).children?.insert(i, newNode as InlineSpanNode);
    }

    if (newNode is RichTextNode) {
      state.treeC.expand(newNode);
      emit(state.copyWith(
        selectedNode: textSpanNode,
        force: state.force + 1,
      ));
    } else {
      state.treeC.expand(newNode);
      emit(state.copyWith(
        selectedNode: newNode,
        force: state.force + 1,
      ));
    }
  }

  void _selectedDirectoryOrNode(SelectedDirectoryOrNode event, emit) {
    emit(state.copyWith(
      selectedNode: event.selectedNode,
      force: state.force + 1,
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
  //     force: state.force + 1,
  //   ));
  // }
  //

  void _saveNodeAsSnippet(SaveNodeAsSnippet event, emit) {
    _createSnippetUndo();

    _cutIncludingAnyChildren(event.node);

    // create new snippet
    SnippetRootNode newRootNode = SnippetRootNode(name: event.newSnippetName, child: event.node);
    CAPIState.snippetsMap[event.newSnippetName] = newRootNode;
    // CAPIBloC.I.add(CAPIEvent.createdSnippet(newSnippetNode: newRootNode));
    // create a snippet ref node
    SnippetRefNode refNode = SnippetRefNode(snippetName: event.newSnippetName);
    // attach to parent
    if (state.selectedNode?.parent is SingleChildNode) {
      (state.selectedNode?.parent as SingleChildNode).child = refNode;
    } else if (state.selectedNode?.parent is MultiChildNode) {
      (state.selectedNode?.parent as MultiChildNode).children.add(refNode);
    } else if (state.selectedNode?.parent is WidgetSpanNode) {
      (state.selectedNode?.parent as WidgetSpanNode).child = refNode;
    }
    state.treeC.expand(newRootNode);
    state.treeC.rebuild();

    emit(state.copyWith(
      selectedNode: refNode,
      force: state.force + 1,
    ));
    // }
  }

  void _createSnippetUndo() {
    state.ur.createUndo(state);
  }

  void _undo(Undo event, emit) {
    if (state.canUndo()) {
      SnippetState? result = state.ur.undo(state);
      _restore(result, emit);
    }
  }

  void _redo(Redo event, emit) {
    if (state.canRedo()) {
      SnippetState? result = state.ur.redo(state);
      _restore(result, emit);
    }
  }

  void _restore(SnippetState? undoOrRedoResult, emit) {
    // replace bloc in queue with undo/redo result
    SnippetState? prevSnippetState = undoOrRedoResult;
    SnippetRootNode? prevRootNode = prevSnippetState?.rootNode;
    if (prevRootNode == null) return;
    SnippetBloC restoredSnippetBloc = SnippetBloC(
      rootNode: prevRootNode,
      treeC: prevSnippetState!.treeC..expandAll(),
      treeUR: prevSnippetState.ur,
      selectedNode: prevSnippetState.selectedNode,
      selectedWidgetGK: prevSnippetState.selectedWidgetGK,
      selectedTreeNodeGK: prevSnippetState.selectedTreeNodeGK,
    );
    CAPIBloC.I.add(CAPIEvent.restoredSnippetBloc(restoredBloc: restoredSnippetBloc));

    if (undoOrRedoResult != null) {
      emit(prevSnippetState);
      Useful.afterNextBuildDo(() {
        state.treeC.rebuild();
        STreeNode? restoredSelectedNode = state.selectedNode;
        if (restoredSelectedNode != null) {
          add(
            SelectNode(
              node: restoredSelectedNode,
              showProperties: true,
              selectedWidgetGK: GlobalKey(debugLabel: 'selectedWidgetGK'),
              selectedTreeNodeGK: GlobalKey(debugLabel: 'selectedTreeNodeGK'),
            ),
          );
        }
      });
    }
  }

  bool get deleteInProgress => state.nodeBeingDeleted != null;

  bool get aNodeIsSelected => state.aNodeIsSelected;

  SnippetRootNode get rootNode => state.rootNode;

  SnippetTreeController get treeC => state.treeC;

  String get snippetName => rootNode.name ?? 'missing rootNode!';

// SnippetBloC clone() => SnippetBloC(
//       node: rootNode!,
//       treeC: SnippetTreeController(
//         roots: [rootNode!],
//         childrenProvider: Node.snippetTreeChildrenProvider,
//       ),
//       treeUR: SnippetTreeUR(),
//     );
}
