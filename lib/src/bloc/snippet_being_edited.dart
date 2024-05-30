import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

class SnippetBeingEdited {
  // RouteName pageName;
  SnippetRootNode rootNode;
  SnippetTreeController treeC;
  STreeNode? selectedNode;
  GlobalKey? selectedTreeNodeGK;
  bool showProperties;
  STreeNode? nodeBeingDeleted;
  String jsonBeforePush;

  SnippetBeingEdited({
    required this.rootNode,
    required this.treeC,
    this.selectedNode,
    this.selectedTreeNodeGK,
    this.showProperties = false,
    this.nodeBeingDeleted,
    required this.jsonBeforePush,
  });

  bool get aNodeIsSelected => selectedNode != null;
}
