import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_bloc.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gap/gap.dart';

abstract class Node extends Object {
  @JsonKey(includeFromJson: false, includeToJson: false)
  Node? _parent;

  Node? get parent => _parent;
  void setParent(Node? parentNode) => _parent = parentNode;

  static Iterable<STreeNode> snippetTreeChildrenProvider(STreeNode node) {
    Iterable<STreeNode> children = [];

    if (node is SnippetRootNode) {
      children = [if (node.child != null) node.child!];
    } else if (node is TransformableScaffoldNode) {
      children = [node.scaffold];
    } else if (node is ScaffoldNode) {
      children = [
        if (node.appBar != null) node.appBar!,
        node.body,
      ];
    } else if (node is AppBarNode) {
      children = [
        if (node.leading != null) node.leading!,
        if (node.title != null) node.title!,
        if (node.bottom != null) node.bottom!,
      ];
    } else if (node is StepNode) {
      children = [
        node.title,
        if (node.subtitle != null) node.subtitle!,
        node.content,
      ];
    } else if (node is GenericSingleChildNode) {
      children = node.child != null ? [node.child!] : [];
    } else if (node is RichTextNode) {
      children = [node.text];
    } else if (node is TextSpanNode) {
      children = node.children ?? [];
    } else if (node is WidgetSpanNode) {
      children = node.child != null ? [node.child!] : [];
    } else if (node is CL) {
      children = [];
    } else if (node is SC) {
      children = [if (node.child != null) node.child!];
    } else if (node is GenericMultiChildNode) {
      children = node.children;
    } else if (node is MC) {
      children = node.children;
    }

    // unexpected
    return children;
  }

  static Iterable<PTreeNode> propertyTreeChildrenProvider(PTreeNode node) {
    if (node is PropertyGroup) {
      return node.children;
    }

    return [];
  }
  
  Node? findNearestAncestorOfType(Type type) {
    Node? node = this;
    while (node != null && node.runtimeType != type) {
      print(node.toString());
      node = node.parent;
    }
    return node;
  }

  Widget? logoSrc() => Row(
        children: [
          Image.asset(
            Useful.asset('lib/assets/images/pub.dev.png'),
            width: 16,
          ),
          const Gap(8),
        ],
      );

  CAPIBloC get capiBloc => FC().capiBloc;
}

class SnippetTreeController extends TreeController<STreeNode> {
  Set<STreeNode>? _expandedNodesCache;

  SnippetTreeController({
    required super.roots,
    required super.childrenProvider,
    super.parentProvider,
  });

  Set<STreeNode> get expandedNodes => _expandedNodesCache ??= <STreeNode>{};

  set expandedNodes(Set<STreeNode> nodes) => _expandedNodesCache = nodes;

  @override
  bool getExpansionState(STreeNode node) => node.isExpanded;

  // Do not call `notifyListeners` from this method as it is called many
  // times recursively in cascading operations.
  @override
  void setExpansionState(STreeNode node, bool expanded) {
    node.isExpanded = expanded;
  }

  int countNodesInTree(STreeNode startingNode) {
    int nodeCount = 0;
    breadthFirstSearch(
      startingNodes: [startingNode],
      descendCondition: (_) => true,
      returnCondition: (_) => false,
      onTraverse: (_) => ++nodeCount,
    );
    return nodeCount;
  }

  // find 1st node with the supplied type
  STreeNode? findNodeTypeInTree(STreeNode startingNode, Type type) {
    STreeNode? foundNode;
    foundNode = breadthFirstSearch(
      startingNodes: [startingNode],
      descendCondition: (_) => true,
      returnCondition: (node) => node.runtimeType == type,
      // onxTraverse: (node) {
      //   print(node.toString());
      // },
    );
    return foundNode;
  }

  STreeNode rootNode(TreeEntry<STreeNode> theEntry) {
    TreeEntry<STreeNode> entry = theEntry;
    while (entry.parent != null) {
      entry = entry.parent!;
    }
    return entry.node;
  }

  int indexOf(STreeNode? selectedNode) {
    if (selectedNode == null) return -1;
    int result = -1;
    int i = 0;
    depthFirstTraversal(onTraverse: (entry) {
      if (entry.node == selectedNode) {
        result = i;
      } else {
        i++;
      }
    });
    return result;
  }

  STreeNode? nodeAt(int selectionIndex) {
    if (selectionIndex == -1) return null;
    STreeNode? result;
    int i = 0;
    depthFirstTraversal(onTraverse: (entry) {
      if (i++ == selectionIndex) {
        result = entry.node;
      }
    });
    return result;
  }

  SnippetTreeController clone() {
    STreeNode rootNode = roots.first;
    String jsonS = rootNode.toJson();
    STreeNode clonedRootNode = STreeNodeMapper.fromJson(jsonS);
    String newJsonS = clonedRootNode.toJson();
    return SnippetTreeController(
      roots: [clonedRootNode],
      childrenProvider: childrenProvider,
      parentProvider: parentProvider,
    );
  }
}

class PTreeNodeTreeController extends TreeController<PTreeNode> {
  Set<PTreeNode>? _expandedNodesCache;

  Set<PTreeNode> get _expandedNodes => _expandedNodesCache ??= <PTreeNode>{};

  Set<PTreeNode> get expandedNodes => _expandedNodesCache ??= <PTreeNode>{};

  set expandedNodes(Set<PTreeNode> newSet) => _expandedNodesCache = newSet;

  @override
  bool getExpansionState(PTreeNode node) => _expandedNodesCache?.contains(node) ?? false;

  @override
  void setExpansionState(PTreeNode node, bool expanded) => expanded ? _expandedNodes.add(node) : _expandedNodes.remove(node);

  PTreeNodeTreeController({
    required super.roots,
    required super.childrenProvider,
    super.parentProvider,
  });

  int countNodesInTree(PTreeNode startingNode) {
    int nodeCount = 0;
    breadthFirstSearch(
      startingNodes: [startingNode],
      descendCondition: (_) => true,
      returnCondition: (_) => false,
      onTraverse: (_) => ++nodeCount,
    );
    return nodeCount;
  }

  PTreeNode rootNode(TreeEntry<PTreeNode> theEntry) {
    TreeEntry<PTreeNode> entry = theEntry;
    while (entry.parent != null) {
      entry = entry.parent!;
    }
    return entry.node;
  }
}
