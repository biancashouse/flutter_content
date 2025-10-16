            import 'package:flutter/material.dart';

import 'sliver_tree.dart';
import 'tree_controller.dart';

// Examples can assume:
//
// class Node {
//   Node(this.children);
//   List<Node> children;
// }
//
// final TreeController<Node> treeController = TreeController<Node>(
//   root: <Node>[
//     Node(<Node>[]),
//   ],
//   childrenProvider: (Node node) => node.children,
// );

/// A widget used to visualize tree hierarchies.
///
/// Usage:
/// ```dart
/// @override
/// Widget build(BuildContext context) {
///   return TreeView<Node>(
///     treeController: treeController,
///     nodeBuilder: (BuildContext context, TreeEntry<Node> entry) {
///       ...
///     },
///   );
/// }
/// ```
///
/// See also:
/// * [SliverTree], which is created internally by [TreeView]. It can be used
///   to create more sophisticated scrolling experiences.
/// * [AnimatedTreeView], a version of this widget that animates the expansion
///   state changes of tree nodes.
class TreeView<T extends Object> extends BoxScrollView {
  /// Creates a [TreeView].
  const TreeView({
    super.key,
    required this.treeController,
    required this.nodeBuilder,
    super.padding,
    super.controller,
    super.primary,
    super.physics,
    super.shrinkWrap,
    super.cacheExtent,
    super.semanticChildCount,
    super.dragStartBehavior,
    super.keyboardDismissBehavior,
    super.restorationId,
    super.clipBehavior,
  });

  /// {@macro flutter_fancy_tree_view.SliverTree.controller}
  final TreeController<T> treeController;

  /// {@macro flutter_fancy_tree_view.SliverTree.nodeBuilder}
  final TreeNodeBuilder<T> nodeBuilder;

  @override
  Widget buildChildLayout(BuildContext context) {
    return SliverTree<T>(
      controller: treeController,
      nodeBuilder: nodeBuilder,
    );
  }
}