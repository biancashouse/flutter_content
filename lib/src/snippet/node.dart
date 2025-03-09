import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

abstract class Node extends Object {
  @JsonKey(includeFromJson: false, includeToJson: false)
  Node? _parent;


  Node? getParent() => _parent;
  void setParent(Node? parentNode) => _parent = parentNode;

  static SNode? snippetTreeParentProvider(Node node) => node.getParent() as SNode?;

  static Iterable<SNode> snippetTreeChildrenProvider(SNode node) {
    node.getParent();
    Iterable<SNode> children = [];

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

  static Iterable<PNode> propertyTreeChildrenProvider(PNode node) {

    // // custom logic to hide style props when a named style prop is not null
    // if (node.snode is TextSpanNode) {
    //   TextSpanNode tsNode = node.snode as TextSpanNode;
    //   if (tsNode.textStyleProperties?.namedTextStyle != null)
    //     return [tsNode.textStyleProperties.];
    // }

    if (node.children != null/*Group*/) {
      // named text style hides individual text style properties
      // if (node is TextStylePropertyGroup) {
      //   var namedTextStyleNode = node.children.toList().firstWhere((tsgNode){return tsgNode.name == 'namedTextStyle';});
      //   if (namedTextStyleNode is StringPNode && namedTextStyleNode.stringValue != null) {
      //     return [namedTextStyleNode];
      //   }
      // }
      // ditto for button styles
      // if (node is ButtonStylePNode/*Group*/) {
      //   var namedButtonStyleNode = node.children!.toList().firstWhere((tsgNode){return tsgNode.name == 'namedButtonStyle';});
      //   if (namedButtonStyleNode is StringPNode && namedButtonStyleNode.stringValue != null) {
      //     return [namedButtonStyleNode];
      //   }
      // }
      return node.children!;
    }

    return [];
  }
  
  // Node? findNearestAncestorOfType(Type type) {
  //   Node? node = this;
  //   while (node != null && node.runtimeType != type) {
  //     fco.logger.i(node.toString());
  //     node = node.parent;
  //   }
  //   return node;
  // }

  // Widget? logoSrc() => Row(
  //       children: [
  //         Image.asset(
  //           fco.asset('lib/assets/images/pub.dev.png'),
  //           width: 16,
  //         ),
  //         const Gap(8),
  //       ],
  //     );

  CAPIBloC get capiBloc => FlutterContentApp.capiBloc;

  Node();
}

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
    depthFirstTraversal(onTraverse: (entry) {
      if (entry.node == selectedNode) {
        result = i;
      } else {
        i++;
      }
    });
    return result;
  }

  SNode? nodeAt(int selectionIndex) {
    if (selectionIndex == -1) return null;
    SNode? result;
    int i = 0;
    depthFirstTraversal(onTraverse: (entry) {
      if (i++ == selectionIndex) {
        result = entry.node;
      }
    });
    return result;
  }

  SnippetTreeController clone() {
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

class PNodeTreeController extends TreeController<PNode> {
  Set<PNode>? _expandedNodesCache;

  Set<PNode> get _expandedNodes => _expandedNodesCache ??= <PNode>{};

  Set<PNode> get expandedNodes => _expandedNodesCache ??= <PNode>{};

  set expandedNodes(Set<PNode> newSet) => _expandedNodesCache = newSet;

  @override
  bool getExpansionState(PNode node) => _expandedNodesCache?.contains(node) ?? false;

  @override
  void setExpansionState(PNode node, bool expanded) => expanded ? _expandedNodes.add(node) : _expandedNodes.remove(node);

  PNodeTreeController({
    required super.roots,
    required super.childrenProvider,
    super.parentProvider,
  });

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
