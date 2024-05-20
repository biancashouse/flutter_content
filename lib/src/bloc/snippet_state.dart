// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/widgets.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'snippet_state.freezed.dart';

@freezed
class SnippetState with _$SnippetState {
  const SnippetState._();

  factory SnippetState({
    required PageName pageName,
    // ---- the state gets saved between snippet tree callout instances ------------------
    required SnippetRootNode rootNode,
    required SnippetTreeController treeC,
    // required SnippetTreeUR ur,
    STreeNode? selectedNode,
    // GlobalKey? selectedWidgetGK,
    GlobalKey? selectedTreeNodeGK,
    // ---- the state gets saved between snippet tree callout instances ------------------
    // STreeNode? highlightedNode,
    @Default(false) bool showProperties,
    STreeNode? nodeBeingDeleted,
    @Default(0) int force, // hacky way to force a transition ?
  }) = _SnippetState;

  // void clearUR() => ur.clear();

  // bool canUndo() => ur.undoQ.isNotEmpty;

  // bool canRedo() => ur.redoQ.isNotEmpty;

  // int undoCount() => ur.undoQ.length;

  // int redoCount() => ur.redoQ.length;

  bool get aNodeIsSelected => selectedNode != null;
}
