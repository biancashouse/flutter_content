import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/target_config/content/snippet_editor/directory_tree_node_widget.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';

part 'directory_node.mapper.dart';

@MappableClass()
class DirectoryNode extends MC with DirectoryNodeMappable {
  String name;

  DirectoryNode({
    this.name = "",
    required super.children,
  });

  @override
  List<PTreeNode> createPropertiesList(BuildContext context) => [
        StringPropertyValueNode(
          snode: this,
          name: 'name',
          stringValue: name,
          onStringChange: (newValue) => refreshWithUpdate(() => name = newValue),
          calloutButtonSize: const Size(280, 70),
          calloutSize: const Size(280, 70),
        ),
      ];

  // @override
  // List<Widget> nodePropertyEditors(BuildContext context, {bool allowButtonCallouts = false}) => [
  //       NodePropertyButtonText(
  //           label: "name",
  //           text: name,
  //           calloutSize: const Size(600, 200),
  //           onChangeF: (s) {
  //             name = s;
  //             bloc.add(const CAPIEvent.forceRefresh());
  //           }),
  //     ];

  @override
  String toSource(BuildContext context) => "";

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    SnippetPanelState? ss = SnippetPanel.of(context);
    if (!(ss?.mounted ?? false)) return const Icon(Icons.error, color: Colors.red);

    // TreeController<Node> treeC = FlutterContent().capiBloc.state.directoryTreeCMap[ss!.widget.sName] = TreeController<Node>(
    SnippetTreeController treeC = SnippetTreeController(
      roots: [this],
      childrenProvider: (STreeNode node) {
        if (node is FileNode) {
          return [];
        }
        if (node is DirectoryNode) {
          return node.children ?? [];
        }
        // unexpected
        return [];
      },
      parentProvider: (STreeNode node) => node.parent as STreeNode?,
    );
    int nodeCount = treeC.countNodesInTree(this);
    // treeC.expand(this);
    treeC.expandCascading([this]);
    setParent(parentNode);
    possiblyHighlightSelectedNode(context);
    return Container(
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
  }

  ListView immediateChildrenOnly(SnippetBloC snippetBloc, BuildContext context) {
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
                  Text(childNode.name),
                ],
              )
            : (childNode as FileNode).toWidget(context, this);
      }).toList(),
    );
  }

  // @override
  // List<Widget> wrapWithCandidates(final BuildContext context, final STreeNode? parentNode, ValueChanged<Type> onPressed) {
  //   if (parentNode is DirectoryNode) {
  //     List<Type> candidateTypes = [DirectoryNode];
  //     return toMenuItems(context, nodeTypeCandidates: candidateTypes, onPressedF: onPressed);
  //   } else {
  //     return super.wrapWithCandidates(context, parentNode, onPressed);
  //   }
  // }
  //
  // @override
  // List<Widget> siblingCandidates(final BuildContext context, final STreeNode? parentNode, AddAction action, ValueChanged<Type> onPressed) {
  //   if (parentNode is DirectoryNode) {
  //     List<Type> candidateTypes = [DirectoryNode, FileNode];
  //     return toMenuItems(context, nodeTypeCandidates: candidateTypes, onPressedF: onPressed);
  //   } else {
  //     return super.siblingCandidates(context, parentNode, action, onPressed);
  //   }
  // }
  //
  // @override
  // List<Widget> childCandidates(final BuildContext context, final STreeNode? parentNode, AddAction action, ValueChanged<Type> onPressed) {
  //   List<Type> candidateTypes = [DirectoryNode, FileNode];
  //   return toMenuItems(context, nodeTypeCandidates: candidateTypes, onPressedF: onPressed);
  // }

  @override
  String toString() => FLUTTER_TYPE;

  @override
  Widget? logoSrc() => null;

  static const String FLUTTER_TYPE = "Directory";
}
