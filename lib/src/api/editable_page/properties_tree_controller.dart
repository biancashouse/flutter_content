import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/fancy_tree/tree_controller.dart';

class PNodeTreeController extends TreeController<PNode> {
  Set<PNode>? _expandedNodesCache;

  Set<PNode> get _expandedNodes => _expandedNodesCache ??= <PNode>{};

  Set<PNode> get expandedNodes => _expandedNodesCache ??= <PNode>{};

  set expandedNodes(Set<PNode> newSet) => _expandedNodesCache = newSet;

  PNodeTreeController({
    required super.roots,
    required super.childrenProvider,
    super.parentProvider,
  });

  @override
  bool getExpansionState(PNode node) =>
      _expandedNodesCache?.contains(node) ?? false;

  @override
  void setExpansionState(PNode node, bool expanded) {
    expanded ? _expandedNodes.add(node) : _expandedNodes.remove(node);
  }

  List<PNode> getExpandedNodes(PNode startingNode) {
    List<PNode> expandedNodes = [];
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

  void restoreExpansions(PNode startingNode, List<PNode> nodes) {
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

  int countNodesInTree(PNode startingNode) {
    int nodeCount = 0;
    breadthFirstSearch(
      startingNodes: [startingNode],
      descendCondition: (_) => true,
      returnCondition: (_) => false,
      onTraverse: (_) => ++nodeCount,
    );
    return nodeCount;
  }

  PNode rootNode(TreeEntry<PNode> theEntry) {
    TreeEntry<PNode> entry = theEntry;
    while (entry.parent != null) {
      entry = entry.parent!;
    }
    return entry.node;
  }
}
