import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/fs_folder_node.dart';
import 'package:flutter_content/src/target_config/content/snippet_editor/node_properties/node_property_callout_button.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';

import 'callout_fs_folder_tree_and_image_picker.dart';

class NodePropertyButtonFSBrowser extends StatelessWidget {
  final String label;
  final String? tooltip;
  final String? originalFSPath;
  final ValueChanged<String?> onChangeF;
  final Size calloutButtonSize;

  const NodePropertyButtonFSBrowser({
    required this.label,
    this.tooltip,
    required this.originalFSPath,
    required this.onChangeF,
    required this.calloutButtonSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NodePropertyCalloutButton(
      labelWidget: Text('$label...',
          style: const TextStyle(
            color: Colors.white,
          )),
      tooltip: tooltip,
      calloutButtonSize: calloutButtonSize,
      initialCalloutAlignment: Alignment.bottomCenter,
      initialTargetAlignment: Alignment.topCenter,
      calloutContents: (ctx) {
        return  FSFoldersAndImagePicker(onChangeF:onChangeF);
      },
      calloutSize: const Size(275, 400),
      notifier: ValueNotifier<int>(0),
    );
  }

  Widget fsFolderPane(BuildContext context) {
    if (FC().rootFSFolderNode == null)
      return const Icon(
        Icons.warning,
        color: Colors.red,
      );

    FSFolderNode rootNode = FC().rootFSFolderNode!;
    TreeController<FSFolderNode> treeC = TreeController<FSFolderNode>(
      roots: [rootNode],
      childrenProvider: (FSFolderNode node) => node.children,
      parentProvider: (FSFolderNode node) => node.parent as FSFolderNode?,
    );
    treeC.expandCascading([rootNode]);
    // setParent(parentNode);
    return TreeView<FSFolderNode>(
        // physics: const NeverScrollableScrollPhysics(),
        treeController: treeC,
        shrinkWrap: true,
        nodeBuilder: (BuildContext context, TreeEntry<FSFolderNode> entry) {
          return InkWell(
            onTap: () => treeC.toggleExpansion(entry.node),
            child: TreeIndentation(
              entry: entry,
              guide: IndentGuide.connectingLines(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      entry.isExpanded ? Icons.folder_open : Icons.folder,
                      color: Colors.white,
                      size: 30,
                    ),
                    if (entry.node.ref.name.isNotEmpty)
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          //backgroundColor: Colors.grey, // Background color
                          textStyle: TextStyle(fontSize: 14), // Text style
                          shape: const ContinuousRectangleBorder(),
                          visualDensity: VisualDensity.compact,
                        ),
                        onPressed: () {},
                        child: Useful.coloredText(entry.node.ref.name,
                            color: Colors.white),
                      ),
                    if (entry.hasChildren)
                      ExpandIcon(
                        key: GlobalObjectKey(entry.node),
                        isExpanded: treeC
                            .getExpansionState(entry.node), //entry.isExpanded,
                        padding: EdgeInsets.zero,
                        onPressed: (_) {
                          if (treeC.getExpansionState(entry.node)) {
                            treeC.toggleExpansion(entry.node);
                          } else {
                            // instead of expanding current node, do a cascading expand
                            treeC.expand(entry.node);
                          }
                        },
                      ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

// class FolderTile extends StatelessWidget {
//   final TreeEntry<FSFolderNode> entry;
//   final VoidCallback onTap;
//   const FolderTile({
//     super.key,
//     required this.entry,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       // Wrap your content in a TreeIndentation widget which will properly
//       // indent your nodes (and paint guides, if required).
//       //
//       // If you don't want to display indent guides, you could replace this
//       // TreeIndentation with a Padding widget, providing a padding of
//       // `EdgeInsetsDirectional.only(start: TreeEntry.level * indentAmount)`
//       child: TreeIndentation(
//         entry: entry,
//         // Provide an indent guide if desired. Indent guides can be used to
//         // add decorations to the indentation of tree nodes.
//         // This could also be provided through a DefaultTreeIndentGuide
//         // inherited widget placed above the tree view.
//         guide: const IndentGuide.connectingLines(indent: 48),
//         // The widget to render next to the indentation. TreeIndentation
//         // respects the text direction of `Directionality.maybeOf(context)`
//         // and defaults to left-to-right.
//         child: Padding(
//           padding: const EdgeInsets.fromLTRB(4, 8, 8, 8),
//           child: Row(
//             children: [
//               // Add a widget to indicate the expansion state of this node.
//               // See also: ExpandIcon.
//               FolderButton(
//                 isOpen: entry.hasChildren ? entry.isExpanded : null,
//                 onPressed: entry.hasChildren ? onTap : null,
//               ),
//               Text(entry.node.ref.name),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
