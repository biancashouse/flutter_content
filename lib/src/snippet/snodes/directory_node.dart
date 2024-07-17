import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/snodes/widget/directory_tree_node_widget.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';

part 'directory_node.mapper.dart';

@MappableClass()
class DirectoryNode extends MC with DirectoryNodeMappable {
  String? name;

  DirectoryNode({
    this.name,
    required super.children,
  });

  @override
  List<PTreeNode> properties(BuildContext context) => [
        StringPropertyValueNode(
          snode: this,
          name: 'name'??'',
          stringValue: name,
          onStringChange: (newValue) =>
              refreshWithUpdate(() => name = newValue),
          calloutButtonSize: const Size(280, 70),
          calloutWidth: 280,
        ),
      ];
  @override
  String toSource(BuildContext context) => "";

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    SnippetPanelState? ss = SnippetPanel.of(context);
    if (!(ss?.mounted ?? false)) {
      return fco.errorIcon(Colors.red);
    }

    // TreeController<Node> treeC = FCO.capiBloc.state.directoryTreeCMap[ss!.widget.sName] = TreeController<Node>(
    SnippetTreeController treeC = SnippetTreeController(
      roots: [this],
      childrenProvider: (STreeNode node) {
        if (node is FileNode) {
          return [];
        }
        if (node is DirectoryNode) {
          return node.children;
        }
        // unexpected
        return [];
      },
      parentProvider: (STreeNode node) => node.getParent() as STreeNode?,
    );
    int nodeCount = treeC.countNodesInTree(this);
    // treeC.expand(this);
    treeC.expandCascading([this]);
    setParent(parentNode);
    possiblyHighlightSelectedNode();
    return parentNode != DirectoryNode
        ? Material(child: _widget(nodeCount, treeC))
        : _widget(nodeCount, treeC);
  }

  Widget _widget(nodeCount, treeC) => Container(
    key: createNodeGK(),
    width: 800,
    height: nodeCount * 60,
    padding: const EdgeInsets.all(10),
    child: TreeView<STreeNode>(
      // physics: const NeverScrollableScrollPhysics(),
      treeController: treeC,
      shrinkWrap: true,
      // filter or all
      nodeBuilder: (BuildContext context, TreeEntry<STreeNode> entry) {
        return TreeIndentation(
          guide: const IndentGuide.connectingLines(
            // indent: 40.0,
          ),
          entry: entry,
          child: DirectoryTreeNodeWidget(
            treeController: treeC,
            entry: entry,
          ),
        );
      },
    ),
  );

  ListView immediateChildrenOnly(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: super.children.map((childNode) {
        return childNode is DirectoryNode
            ? Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.folder, size: 28, color: Colors.amber),
                  Container(
                    child: Text(childNode.name??''),
                  ),
                ],
              )
            : (childNode as FileNode).toWidget(context, this);
      }).toList(),
    );
  }

  @override
  String toString() => FLUTTER_TYPE;

  @override
  Widget? logoSrc() => null;

  @override
  bool canBeDeleted() => children.isEmpty;

  static const String FLUTTER_TYPE = "Directory";
}
