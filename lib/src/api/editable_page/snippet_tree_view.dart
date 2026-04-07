import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/fancy_tree/tree_controller.dart';
import 'package:flutter_content/src/snippet/fancy_tree/tree_indentation.dart';
import 'package:flutter_content/src/snippet/fancy_tree/tree_view.dart';
import 'package:flutter_content/src/snippet/snode_widget.dart';

class SnippetTreeView extends StatelessWidget {
  /// When true, all rows are built eagerly (no lazy rendering) and the caller
  /// is expected to wrap this in a [SingleChildScrollView] for scrolling.
  /// Required for [Scrollable.ensureVisible] to work on any node.
  final bool shrinkWrap;

  const SnippetTreeView({super.key, this.shrinkWrap = false});

  @override
  Widget build(BuildContext context) {
    final snippetBeingEdited = fco.snippetBeingEdited;
    final SnippetTreeController? treeC = snippetBeingEdited?.treeC;
    if (treeC == null) {
      return Error(
        "FlowchartWidget",
        color: Colors.green,
        size: 32,
        errorMsg: "null treeC!",
        key: GlobalKey(),
      );
    }
    return TreeView<SNode>(
      shrinkWrap: shrinkWrap,
      physics: shrinkWrap ? const NeverScrollableScrollPhysics() : null,
      treeController: treeC,
      nodeBuilder: (BuildContext context, TreeEntry<SNode> entry) =>
          _treeIndentation(entry, treeC),
    );
  }

  TreeIndentation _treeIndentation(
    TreeEntry<SNode> entry,
    SnippetTreeController treeC,
  ) => TreeIndentation(
    guide: IndentGuide.connectingLines(
      color: fco.aNodeIsSelected && entry.node == fco.selectedNode
          ? Colors.purpleAccent
          : Colors.white,
      indent: 40.0,
    ),
    entry: entry,
    child: SNodeWidget(
      snippetName:
          fco.snippetBeingEdited?.getRootNode().name ?? 'snippet name ?',
      treeController: treeC,
      entry: entry,
    ),
  );
}
