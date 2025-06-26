import 'package:flutter_content/flutter_content.dart';

class SnippetBeingEdited {
  // RouteName pageName;
  // SnippetRootNode rootNode;
  SnippetTreeController treeC;
  SNode? selectedNode;

  // GlobalKey? selectedTreeNodeGK;
  bool showTree;
  bool showProperties;
  SNode? nodeBeingDeleted;
  String jsonBeforeAnyChange;

  SnippetBeingEdited({
    // required this.rootNode,
    required this.treeC,
    this.selectedNode,
    // this.selectedTreeNodeGK,
    this.showTree = true,
    this.showProperties = true,
    this.nodeBeingDeleted,
    required this.jsonBeforeAnyChange,
  }) {
    // fco.logger.i('SnippetBeingEdited');
  }

  SnippetRootNode getRootNode() {
    final root;
    try {
      root = treeC.roots.first.rootNodeOfSnippet();
      if (root == null) {
        print('oh my');
      }
    } catch (e) {
      rethrow;
    }
    return root;
  }

  void setRootNode(SnippetRootNode newRootNode) {
    treeC.roots = [newRootNode];
  }

  bool get aNodeIsSelected => selectedNode != null;

  // SnippetRootNode newVersion() {
  //   SnippetRootNode clonedSnippet = getRootNode().clone(cloneName: getRootNode().name);  // same name
  //   return clonedSnippet;
  // }
}
