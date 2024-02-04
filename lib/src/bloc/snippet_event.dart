import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'snippet_event.freezed.dart';

@freezed
class SnippetEvent with _$SnippetEvent {

  const factory SnippetEvent.selectNode({
    required STreeNode node,
    required bool showProperties,
    required GlobalKey selectedWidgetGK,
    required GlobalKey selectedTreeNodeGK,
    // TargetConfig? imageTC,
    // TargetConfig? widgetTC,
  }) = SelectNode;

  const factory SnippetEvent.clearNodeSelection() = ClearNodeSelection;

  const factory SnippetEvent.saveNodeAsSnippet({
    required STreeNode node,
    required String newSnippetName,
  }) = SaveNodeAsSnippet;


  const factory SnippetEvent.highlightNode({
    required STreeNode? node,
  }) = HighlightNode;

  // const factory SnippetEvent.showNodeProperties({
  //   required Node node,
  //   required int nodeRootIndex,
  //   required bool showAdders,
  //   required bool showProperties,
  //   TargetConfig? tc,
  // }) = ShowNodeProperties;

  const factory SnippetEvent.replaceWith({
    required STreeNode selectedNode,
    required Type type,
    String? snippetName,
  }) = ReplaceWith;

  const factory SnippetEvent.wrapWith({
    required STreeNode selectedNode,
    required Type type,
    String? snippetName,
  }) = WrapWith;

  const factory SnippetEvent.appendChild({
    required STreeNode selectedNode,
    required Type type,
    String? snippetRefName,
    Type? widgetSpanChildType,
  }) = AppendChild;

  const factory SnippetEvent.addSiblingBefore({
    required STreeNode selectedNode,
    required Type type,
    String? snippetRefName,
  }) = AddSiblingBefore;

  const factory SnippetEvent.addSiblingAfter({
    required STreeNode selectedNode,
    required Type type,
    String? snippetRefName,
  }) = AddSiblingAfter;

  const factory SnippetEvent.pasteReplacement({
    required STreeNode selectedNode,
    required STreeNode clipboardNode,
    Type? widgetSpanChildType,
  }) = PasteReplacement;

  const factory SnippetEvent.pasteChild({
    required STreeNode selectedNode,
    required STreeNode clipboardNode,
    Type? widgetSpanChildType,
  }) = PasteChild;

  const factory SnippetEvent.pasteSiblingBefore({
    required STreeNode selectedNode,
    required STreeNode clipboardNode,
  }) = PasteSiblingBefore;

  const factory SnippetEvent.pasteSiblingAfter({
    required STreeNode selectedNode,
    required STreeNode clipboardNode,
  }) = PasteSiblingAfter;

  const factory SnippetEvent.deleteNodeTapped() = DeleteNodeTapped;

  // const factory SnippetEvent.addNode({
  //   required STreeNode adder2InsertBefore,
  // }) = AddNode;

  const factory SnippetEvent.copyNode({
    required STreeNode node,
  }) = CopyNode;

  const factory SnippetEvent.cutNode({
    required STreeNode node,
  }) = CutNode;

  // const factory SnippetEvent.pasteNode({
  //   required STreeNode adder,
  // }) = PasteNode;

  const factory SnippetEvent.selectedDirectoryOrNode({
    required SnippetName snippetName,
    required STreeNode? selectedNode, // null means clear selection
  }) = SelectedDirectoryOrNode;

  const factory SnippetEvent.undo({
    required String name,
    @Default(false) bool skipRedo,
  }) = Undo;

  const factory SnippetEvent.redo({
    required String name,
  }) = Redo;

  const factory SnippetEvent.forceSnippetRefresh() = ForceSnippetRefresh;
}
