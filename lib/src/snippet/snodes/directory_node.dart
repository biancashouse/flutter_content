// ignore_for_file: constant_identifier_names
import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/fancy_tree/tree_controller.dart';
import 'package:flutter_content/src/snippet/fancy_tree/tree_indentation.dart';
import 'package:flutter_content/src/snippet/fancy_tree/tree_view.dart';
import 'package:flutter_content/src/snippet/pnodes/string_pnode.dart';
import 'package:flutter_content/src/snippet/snodes/widget/directory_tree_node_widget.dart';

part 'directory_node.mapper.dart';

@MappableClass()
class DirectoryNode extends MC with DirectoryNodeMappable {
  String? name;

  DirectoryNode({
    this.name,
    required super.children,
  });

  @override
  List<PNode> propertyNodes(BuildContext context, SNode? parentSNode) => [
        StringPNode(
          snode: this,
          name: 'name',
          stringValue: name,
          onStringChange: (newValue) =>
              refreshWithUpdate(context,() => name = newValue),
          calloutButtonSize: const Size(280, 70),
          calloutWidth: 280,
        ),
      ];

  @override
  String toSource(BuildContext context) => "";

  @override
  Widget buildFlutterWidget(BuildContext context, SNode? parentNode) {
    try {
      SnippetBuilderState? ss = SnippetBuilder.of(context);
      if (!(ss?.mounted ?? false)) {
        return Error(
          key: createNodeWidgetGK(),
          "FlowchartWidget",
          color: Colors.green,
          size: 16,
          errorMsg: "SnippetPanel.of(context) not mounted!",
        );
      }

      // TreeController<Node> treeC = FCO.capiBloc.state.directoryTreeCMap[ss!.widget.sName] = TreeController<Node>(
      SnippetTreeController treeC = SnippetTreeController(
        roots: [this],
        childrenProvider: (SNode node) {
          if (node is FileNode) {
            return [];
          }
          if (node is DirectoryNode) {
            return node.children;
          }
          // unexpected
          return [];
        },
        parentProvider: (SNode node) => node.getParent() as SNode?,
      );
      int nodeCount = treeC.countNodesInTree(this);
      // treeC.expand(this);
      treeC.expandCascading([this]);
      setParent(parentNode);
      // ScrollControllerName? scName = EditablePage.name(context);
      // possiblyHighlightSelectedNode(scName);
      return parentNode is! DirectoryNode
          ? Material(child: _widget(nodeCount, treeC))
          : _widget(nodeCount, treeC);
    } catch (e) {
      return Error(
          key: createNodeWidgetGK(),
          FLUTTER_TYPE,
          color: Colors.red,
          size: 16,
          errorMsg: e.toString());
    }
  }

  Widget _widget(nodeCount, treeC) => Container(
        key: createNodeWidgetGK(),
        width: 800,
        height: nodeCount * 60,
        padding: const EdgeInsets.all(10),
        child: TreeView<SNode>(
          // physics: const NeverScrollableScrollPhysics(),
          treeController: treeC,
          shrinkWrap: true,
          // filter or all
          nodeBuilder: (BuildContext context, TreeEntry<SNode> entry) {
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
                  Text(childNode.name ?? ''),
                ],
              )
            : (childNode as FileNode).buildFlutterWidget(context, this);
      }).toList(),
    );
  }

  @override
  String toString() => FLUTTER_TYPE;

  @override
  bool get is3rdParty => true;

  static const String FLUTTER_TYPE = "Directory";
}
