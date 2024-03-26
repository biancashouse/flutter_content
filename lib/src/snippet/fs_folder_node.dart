import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';

class FSFolderNode extends Node {
  Reference ref;

  List<FSFolderNode> children;

  FSFolderNode({required this.ref, required this.children});

  static Iterable<FSFolderNode> fsFolderTreeChildrenProvider(
          FSFolderNode node) =>
      node.children;
}

class FSFolderTreeController extends TreeController<FSFolderNode> {
  FSFolderTreeController({
    required super.roots,
    required super.childrenProvider,
    super.parentProvider,
  });

  FSFolderNode rootNode(TreeEntry<FSFolderNode> theEntry) {
    TreeEntry<FSFolderNode> entry = theEntry;
    while (entry.parent != null) {
      entry = entry.parent!;
    }
    return entry.node;
  }

  int indexOf(FSFolderNode? selectedNode) {
    if (selectedNode == null) return -1;
    int result = -1;
    int i = 0;
    depthFirstTraversal(onTraverse: (entry) {
      if (entry.node == selectedNode) {
        result = i;
      } else {
        i++;
      }
    });
    return result;
  }
}
