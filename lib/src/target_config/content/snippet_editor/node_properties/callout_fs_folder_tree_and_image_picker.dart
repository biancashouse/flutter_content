import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_ui_storage/firebase_ui_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/fs_folder_node.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:multi_split_view/multi_split_view.dart';

class FSFoldersAndImagePicker extends HookWidget {
  final ValueChanged<String?> onChangeF;
  final ScrollController? ancestorHScrollController;
  final ScrollController? ancestorVScrollController;

  const FSFoldersAndImagePicker({
    required this.onChangeF,
    this.ancestorHScrollController,
    this.ancestorVScrollController,
    super.key,
  });

  // static SnippetNode nearestRoot(TreeEntry<Node> entry) {
  //   TreeEntry<Node> _entry = entry;
  //   while (_entry.node is! SnippetNode) {
  //     _entry = _entry.parent!;
  //   }
  //   return _entry.node as SnippetNode;
  // }

  @override
  Widget build(BuildContext context) {
    debugPrint('folder+images build');
    final msvC = useState<MultiSplitViewController>(
        MultiSplitViewController(areas: [Area(weight: .5)]));
    final selectedFolderRef = useState<Reference?>(null);
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0), // Adjust radius as needed
      child: Scaffold(
        backgroundColor: Colors.purpleAccent.shade100,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Useful.coloredText('Firebase Storage Image Picker',
              fontSize: 16.0, color: Colors.white),
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: MultiSplitViewTheme(
            data: MultiSplitViewThemeData(dividerThickness: 24),
            child: MultiSplitView(
              axis: Axis.horizontal,
              controller: msvC.value,
              // onWeightChange: () => setState(() {}),
              dividerBuilder:
                  (axis, index, resizable, dragging, highlighted, themeData) {
                return Container(
                  color: dragging
                      ? Colors.purpleAccent[200]
                      : Colors.purpleAccent[100],
                  child: Icon(
                    Icons.drag_indicator,
                    color: highlighted ? Colors.blueAccent : Colors.white,
                  ),
                );
              },
              children: [
                // SNIPPET TREE
                fsFolderPane(selectedFolderRef),
                fsFoldersImagesPane(selectedFolderRef),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget fsFolderPane(ValueNotifier<Reference?> selectedFolderRef) {
    if (FC().rootFSFolderNode == null) {
      return const Icon(
        Icons.warning,
        color: Colors.red,
      );
    }

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
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        //backgroundColor: Colors.grey, // Background color
                        textStyle: TextStyle(fontSize: 14), // Text style
                        shape: const ContinuousRectangleBorder(),
                        visualDensity: VisualDensity.compact,
                      ),
                      onPressed: () {
                        selectedFolderRef.value = entry.node.ref;
                      },
                      child: Useful.coloredText(
                          entry.node.ref.name.isEmpty
                              ? '/'
                              : entry.node.ref.name,
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

  Widget fsFoldersImagesPane(ValueNotifier<Reference?> selectedFolderRef) {
    if (selectedFolderRef.value == null) {
      return const Offstage();
    }

    return StorageGridView(
      ref: selectedFolderRef.value,
      loadingBuilder: (context) {
        return Center(
          child: Text('Loading...'),
        );
      },
      itemBuilder: (context, ref) {
        print('item: ref:${ref.fullPath}');
        return InkWell(
          onTap: () {
            onChangeF(ref.fullPath);
            Callout.dismiss(NODE_PROPERTY_CALLOUT_BUTTON);
          },
          child: AspectRatio(
            aspectRatio: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: StorageImage(ref: ref),
            ),
          ),
        );
      },
    );
  }
}
