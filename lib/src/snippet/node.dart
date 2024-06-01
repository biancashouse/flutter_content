import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gap/gap.dart';

abstract class Node extends Object {
  @JsonKey(includeFromJson: false, includeToJson: false)
  Node? _parent;

  Node? getParent() => _parent;
  void setParent(Node? parentNode) => _parent = parentNode;

  static Iterable<STreeNode> snippetTreeChildrenProvider(STreeNode node) {
    Iterable<STreeNode> children = [];

    if (node is SnippetRootNode && node.getParent() != null) {
        children = [];
    } else if (node is ScaffoldNode) {
      children = [
        if (node.appBar != null) node.appBar!,
        if (node.body != null) node.body!,
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

    // // custom logic to hide style props when a named style prop is not null
    // if (node.snode is TextSpanNode) {
    //   TextSpanNode tsNode = node.snode as TextSpanNode;
    //   if (tsNode.textStyleGroup?.namedTextStyle != null)
    //     return [tsNode.textStyleGroup.];
    // }

    if (node is PropertyGroup) {
      // named text style hides individual text style properties
      if (node is TextStylePropertyGroup) {
        var namedTextStyleNode = node.children.toList().firstWhere((tsgNode){return tsgNode.name == 'namedTextStyle';});
        if (namedTextStyleNode is StringPropertyValueNode && namedTextStyleNode.stringValue != null) {
          return [namedTextStyleNode];
        }
      }
      // ditto for button styles
      if (node is ButtonStylePropertyGroup) {
        var namedButtonStyleNode = node.children.toList().firstWhere((tsgNode){return tsgNode.name == 'namedButtonStyle';});
        if (namedButtonStyleNode is StringPropertyValueNode && namedButtonStyleNode.stringValue != null) {
          return [namedButtonStyleNode];
        }
      }
      return node.children;
    }

    return [];
  }
  
  // Node? findNearestAncestorOfType(Type type) {
  //   Node? node = this;
  //   while (node != null && node.runtimeType != type) {
  //     debugPrint(node.toString());
  //     node = node.parent;
  //   }
  //   return node;
  // }

  Widget? logoSrc() => Row(
        children: [
          Image.asset(
            Useful.asset('lib/assets/images/pub.dev.png'),
            width: 16,
          ),
          const Gap(8),
        ],
      );

  CAPIBloC get capiBloc => MaterialSPA.capiBloc;

  Node();
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

  List<STreeNode> getExpandedNodes(STreeNode startingNode) {
    List<STreeNode> expandedNodes = [];
    breadthFirstSearch(
      startingNodes: [startingNode],
      descendCondition: (_) => true,
      returnCondition: (_) => false,
      onTraverse: (node) {
        if (node.isExpanded) expandedNodes.add(node);
      },
    );
    return expandedNodes;
  }

  void restoreExpansions(STreeNode startingNode, List<STreeNode> nodes) {
    breadthFirstSearch(
      startingNodes: [startingNode],
      descendCondition: (_) => true,
      returnCondition: (_) => false,
      onTraverse: (node) {
        if (nodes.contains(node)) {
          setExpansionState(node, nodes.contains(node));
        }
      },
    );
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
  STreeNode? findNodeTypeInTree(STreeNode? startingNode, Type type) {
    if (startingNode == null) return null;
    STreeNode? foundNode;
    foundNode = breadthFirstSearch(
      startingNodes: [startingNode],
      descendCondition: (_) => true,
      returnCondition: (node) => node.runtimeType == type,
      // onxTraverse: (node) {
      //   debugPrint(node.toString());
      // },
    );
    return foundNode;
  }

 bool nodeIsADescendantOf(STreeNode startingNode, STreeNode nodeToFind) {
    STreeNode? foundNode;
    foundNode = breadthFirstSearch(
      startingNodes: [startingNode],
      descendCondition: (_) => true,
      returnCondition: (node) => node == nodeToFind,
    );
    return foundNode != null;
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
    // String newJsonS = clonedRootNode.toJson();
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

  List<PTreeNode> getExpandedNodes(PTreeNode startingNode) {
    List<PTreeNode> expandedNodes = [];
    breadthFirstSearch(
      startingNodes: [startingNode],
      descendCondition: (_) => true,
      returnCondition: (_) => false,
      onTraverse: (node) {
        if (getExpansionState(node)) expandedNodes.add(node);
      },
    );
    return expandedNodes;
  }

  void restoreExpansions(PTreeNode startingNode, List<PTreeNode> nodes) {
    breadthFirstSearch(
      startingNodes: [startingNode],
      descendCondition: (_) => true,
      returnCondition: (_) => false,
      onTraverse: (node) {
        if (nodes.contains(node)) {
          setExpansionState(node, nodes.contains(node));
        }
      },
    );
  }

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
