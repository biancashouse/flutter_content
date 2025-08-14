import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/fancy_tree/tree_controller.dart';
import 'package:flutter_content/src/snippet/fancy_tree/tree_indentation.dart';
import 'package:flutter_content/src/snippet/fancy_tree/tree_view.dart';
import 'package:flutter_content/src/snippet/pnode_widget.dart';

class PropertiesTreeView extends StatelessWidget {
  final PNodeTreeController treeC;
  final SNode sNode;
  // final bool allowButtonCallouts;

  PropertiesTreeView({
    required this.treeC,
    required this.sNode,
    // this.allowButtonCallouts = false,
    super.key,
  }) {
    // // reinstate expansions
    // treeC.breadthFirstSearch(
    //   returnCondition: (_)=> true,
    //   onTraverse: (visitor){
    //     if (visitor.expanded) {
    //       treeC.toggleExpansion(visitor);
    //     }
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) =>
      TreeView<PNode>(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        treeController: treeC,
        // filter or all
        nodeBuilder: (BuildContext context, TreeEntry<PNode> entry) {
          return TreeIndentation(
            guide: const IndentGuide.connectingLines(
              color: Colors.blueAccent,
              indent: 40.0,
            ),
            entry: entry,
            child: PNodeWidget(treeC: treeC, entry: entry, sNode: sNode),
          );
        },
      );
}
