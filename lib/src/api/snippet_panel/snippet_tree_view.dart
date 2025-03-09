import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/snode_widget.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';

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
    var snippetBeingEdited = FlutterContentApp.snippetBeingEdited;
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
      physics: const NeverScrollableScrollPhysics(),
      treeController: treeC,
      // filter or all
      nodeBuilder: (BuildContext context, TreeEntry<SNode> entry) {
        // if (FlutterContentApp.aNodeIsSelected && treeC!.hasAncestor(entry, bloc.state.selectedNode) && bloc.state.showProperties) return const Offstage();
        // fco.logger.i("rebuilding entry: ${entry.node.runtimeType.toString()} expanded: ${entry.isExpanded}");
        // never show the tree root node
        // if (FlutterContentApp.snippetBeingEdited?.getRootNode() == entry.node) {
        //   return const Offstage();
        // }
        // if (entry.node == FlutterContentApp.selectedNode) {
        //   fco.logger.i(
        //       'SnippetTreeView - selected node: ${FlutterContentApp.selectedNode.toString()}');
        // }
        return _treeIndentation(entry, treeC);
      },
    );
  }

  TreeIndentation _treeIndentation(entry, treeC) => TreeIndentation(
    guide: IndentGuide.connectingLines(
      color: FlutterContentApp.aNodeIsSelected &&
          entry.node == FlutterContentApp.selectedNode
          ? Colors.purpleAccent
          : Colors.white,
      indent: 40.0,
    ),
    entry: entry,
    child: SNodeWidget(
      snippetName: FlutterContentApp.snippetBeingEdited?.getRootNode().name ?? 'snippet name ?',
      treeController: treeC,
      entry: entry,
      // allowButtonCallouts: allowButtonCallouts,
      scName: scName,
    ),
  );
}
