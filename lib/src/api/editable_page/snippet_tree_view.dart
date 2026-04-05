import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/fancy_tree/tree_controller.dart';
import 'package:flutter_content/src/snippet/fancy_tree/tree_indentation.dart';
import 'package:flutter_content/src/snippet/fancy_tree/tree_view.dart';
import 'package:flutter_content/src/snippet/snode_widget.dart';

class SnippetTreeView extends StatelessWidget {
  const SnippetTreeView({super.key});

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
