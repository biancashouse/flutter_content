import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/fancy_tree/tree_controller.dart';

class SnippetTreeController extends TreeController<SNode> {
  Set<SNode>? _expandedNodesCache;

  SnippetTreeController({
    required super.roots,
    required super.childrenProvider,
    required super.parentProvider,
  });

  Set<SNode> get expandedNodes => _expandedNodesCache ??= <SNode>{};

  set expandedNodes(Set<SNode> nodes) => _expandedNodesCache = nodes;

  @override
  bool getExpansionState(SNode node) => node.isExpanded;

  // Do not call `notifyListeners` from this method as it is called many
  // times recursively in cascading operations.
  @override
  void setExpansionState(SNode node, bool expanded) {
    node.isExpanded = expanded;
  }

  List<SNode> getExpandedNodes(SNode startingNode) {
    List<SNode> expandedNodes = [];
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

  void restoreExpansions(SNode startingNode, List<SNode> nodes) {
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

  int countNodesInTree(SNode startingNode) {
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
  SNode? findNodeTypeInTree(SNode? startingNode, Type type) {
    if (startingNode == null) return null;
    SNode? foundNode;
    foundNode = breadthFirstSearch(
      startingNodes: [startingNode],
      descendCondition: (_) => true,
      returnCondition: (node) => node.runtimeType == type,
      // onxTraverse: (node) {
      //   fco.logger.i(node.toString());
      // },
    );
    return foundNode;
  }

  bool nodeIsADescendantOf(SNode startingNode, SNode nodeToFind) {
    SNode? foundNode;
    foundNode = breadthFirstSearch(
      startingNodes: [startingNode],
      descendCondition: (_) => true,
      returnCondition: (node) => node == nodeToFind,
    );
    return foundNode != null;
  }

  SNode rootNode(TreeEntry<SNode> theEntry) {
    TreeEntry<SNode> entry = theEntry;
    while (entry.parent != null) {
      entry = entry.parent!;
    }
    return entry.node;
  }

  int indexOf(SNode? selectedNode) {
    if (selectedNode == null) return -1;
    int result = -1;
    int i = 0;
    depthFirstTraversal(
      onTraverse: (entry) {
        if (entry.node == selectedNode) {
          result = i;
        } else {
          i++;
        }
      },
    );
    return result;
  }

  SNode? nodeAt(int selectionIndex) {
    if (selectionIndex == -1) return null;
    SNode? result;
    int i = 0;
    depthFirstTraversal(
      onTraverse: (entry) {
        if (i++ == selectionIndex) {
          result = entry.node;
        }
      },
    );
    return result;
  }

  SnippetTreeController cloneTreeC() {
    SNode rootNode = roots.first;
    String jsonS = rootNode.toJson();
    SNode clonedRootNode = SNodeMapper.fromJson(jsonS);
    // String newJsonS = clonedRootNode.toJson();
    return SnippetTreeController(
      roots: [clonedRootNode],
      childrenProvider: childrenProvider,
      parentProvider: parentProvider,
    );
  }
}
