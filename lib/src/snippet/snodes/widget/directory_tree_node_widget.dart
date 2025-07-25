import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

import '../../fancy_tree/tree_controller.dart';

class DirectoryTreeNodeWidget extends StatelessWidget {
  final SnippetTreeController treeController;
  final TreeEntry<SNode> entry;
  final ScrollController? ancestorHScrollController;
  final ScrollController? ancestorVScrollController;

  const DirectoryTreeNodeWidget({
    super.key,
    required this.treeController,
    required this.entry,
    this.ancestorHScrollController,
    this.ancestorVScrollController,
  });

  @override
  Widget build(BuildContext context) {
    // TreeEntry<STreeNode>? parentEntry = entry.parent;
    // SnippetBloC snippetBloc = context.read<SnippetBloC>();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _name(context),
        if (entry.hasChildren)
          ExpandIcon(
            // key: GlobalObjectKey(entry.node.uid),
            color: Colors.grey,
            isExpanded: entry.isExpanded,
            padding: EdgeInsets.zero,
            onPressed: (_) {
              if (entry.isExpanded) {
                treeController.toggleExpansion(entry.node);
              } else {
                // instead of expanding current node, do a cascading expand
                treeController.expandCascading([entry.node]);
              }
            },
          ),
      ],
    );
  }

  Widget _name(context) {
    SnippetPanelState? snippet = SnippetPanel.of(context);
    String snippetName = snippet?.widget.snippetName ?? '???!!!';
    return GestureDetector(
      onTap: () {
        // expand or collapse
        if (!entry.isExpanded) {
          treeController.expandCascading([entry.node]);
        }
        // select directory or file nade
        treeController.rootNode(entry);
      },
      child: entry.node is DirectoryNode
          ? Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(entry.node.isExpanded ? Icons.folder_open : Icons.folder, size: 28, color: (entry.node as DirectoryNode).children.isNotEmpty
                ? Colors.amber : Colors.amber.withValues(alpha:.5)),
                TextButton(
                  onPressed: () {
                    if (snippet?.mounted ?? false) {
                      FlutterContentApp.capiBloc.add(CAPIEvent.selectedDirectoryOrNode(snippetName: snippetName, selectedNode: entry.node));
                    }
                  },
                  child: _text(),
                ),
              ],
            )
          : InkWell(
              onTap: () {
                FlutterContentApp.capiBloc.add(CAPIEvent.selectedDirectoryOrNode(snippetName: snippetName, selectedNode: entry.node));
              },
              child: (entry.node as FileNode).toWidget(context, entry.node),
            ),
    );
  }

  Widget _text() {
    String displayedNodeName = entry.node is SnippetRootNode && ((entry.node as SnippetRootNode).name.isNotEmpty)
        ? (entry.node as SnippetRootNode).name
        : entry.node is DirectoryNode && (entry.node as DirectoryNode).name!.isNotEmpty
            ? (entry.node as DirectoryNode).name!
            : entry.node is DirectoryNode && (entry.node as DirectoryNode).name!.isEmpty
                ? 'directory name ?'
                : entry.node is FileNode && (entry.node as FileNode).name.isEmpty
                    ? 'file name ?'
                    : entry.node is FileNode && (entry.node as FileNode).src.isEmpty
                        ? 'src ?'
                        : entry.node is FileNode
                            ? (entry.node as FileNode).name
                            : entry.node.toString();

    // TreeEntry<Node>? parentEntry = widget.entry.parent;
    // String dirName = (treeController.rootNode(entry) as DirectoryNode).name;
    return fco.coloredText(
      displayedNodeName, color:Colors.blue
    );
  }
}
