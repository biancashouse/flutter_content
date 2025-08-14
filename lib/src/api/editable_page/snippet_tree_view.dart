import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/fancy_tree/tree_controller.dart';
import 'package:flutter_content/src/snippet/fancy_tree/tree_indentation.dart';
import 'package:flutter_content/src/snippet/fancy_tree/tree_view.dart';
import 'package:flutter_content/src/snippet/snode_widget.dart';

class SnippetTreeView extends StatelessWidget {
  final ScrollControllerName? scName;

  // final VoidCallback onChangedF;
  // final VoidCallback onExpiredF;
  // final bool allowButtonCallouts;

  const SnippetTreeView({
    required this.scName,
    // required this.onChangedF,
    // required this.onExpiredF,
    // this.allowButtonCallouts = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var snippetBeingEdited = fco.snippetBeingEdited;
    // fco.logger.i(
    //     "snippetBeingEdited is ${snippetBeingEdited != null ? 'not null' : 'null'}");
    SnippetTreeController? treeC = snippetBeingEdited?.treeC;
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
      //physics: const NeverScrollableScrollPhysics(),
      treeController: treeC,
      // filter or all
      nodeBuilder: (BuildContext context, TreeEntry<SNode> entry) {
        // if (fco.aNodeIsSelected && treeC!.hasAncestor(entry, bloc.state.selectedNode) && bloc.state.showProperties) return const Offstage();
        // fco.logger.i("rebuilding entry: ${entry.node.runtimeType.toString()} expanded: ${entry.isExpanded}");
        // never show the tree root node
        // if (fco.snippetBeingEdited?.getRootNode() == entry.node) {
        //   return const Offstage();
        // }
        // if (entry.node == fco.selectedNode) {
        //   fco.logger.i(
        //       'SnippetTreeView - selected node: ${fco.selectedNode.toString()}');
        // }
        return _treeIndentation(entry, treeC);
      },
    );
  }

  TreeIndentation _treeIndentation(TreeEntry<SNode> entry, SnippetTreeController treeC) => TreeIndentation(
    guide: IndentGuide.connectingLines(
      color: fco.aNodeIsSelected &&
          entry.node == fco.selectedNode
          ? Colors.purpleAccent
          : Colors.white,
      indent: 40.0,
    ),
    entry: entry,
    child: SNodeWidget(
      snippetName: fco.snippetBeingEdited?.getRootNode().name ?? 'snippet name ?',
      treeController: treeC,
      entry: entry,
      // allowButtonCallouts: allowButtonCallouts,
      scName: scName,
    ),
  );
}
