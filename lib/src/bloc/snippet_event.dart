import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'snippet_event.freezed.dart';

@freezed
class SnippetEvent with _$SnippetEvent {
  const factory SnippetEvent.selectNode({
    required STreeNode node,
    required GlobalKey selectedWidgetGK,
    required GlobalKey selectedTreeNodeGK,
    // TargetModel? imageTC,
    // TargetModel? widgetTC,
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
  //   TargetModel? tc,
  // }) = ShowNodeProperties;

  const factory SnippetEvent.replaceSelectionWith({
    Type? type,
    STreeNode? testNode,
  }) = ReplaceSelectionWith;

  const factory SnippetEvent.wrapSelectionWith({
    Type? type,
    STreeNode? testNode,
  }) = WrapSelectionWith;

  const factory SnippetEvent.appendChild({
    Type? type,
    STreeNode? testNode,
    Type? widgetSpanChildType,
    STreeNode? testWidgetSpanChildNode,
  }) = AppendChild;

  const factory SnippetEvent.addSiblingBefore({
    Type? type,
    STreeNode? testNode,
  }) = AddSiblingBefore;

  const factory SnippetEvent.addSiblingAfter({
    Type? type,
    STreeNode? testNode,
  }) = AddSiblingAfter;

  const factory SnippetEvent.pasteReplacement({
    // required STreeNode clipboardNode,
    Type? widgetSpanChildType,
  }) = PasteReplacement;

  const factory SnippetEvent.pasteChild({
    // required STreeNode clipboardNode,
    Type? widgetSpanChildType,
    STreeNode? testWidgetSpanChildNode,
  }) = PasteChild;

  const factory SnippetEvent.pasteSiblingBefore() = PasteSiblingBefore;

  const factory SnippetEvent.pasteSiblingAfter() = PasteSiblingAfter;

  const factory SnippetEvent.deleteNodeTapped() = DeleteNodeTapped;
  const factory SnippetEvent.completeDeletion() = CompleteDeletion;

  // const factory SnippetEvent.addNode({
  //   required STreeNode adder2InsertBefore,
  // }) = AddNode;

  const factory SnippetEvent.copyNode({
    required STreeNode node,
    @Default(false) skipSave,
  }) = CopyNode;

  const factory SnippetEvent.cutNode({
    required CAPIBloC capiBloc,
    required STreeNode node,
    @Default(false) skipSave,
  }) = CutNode;

  // const factory SnippetEvent.pasteNode({
  //   required STreeNode adder,
  // }) = PasteNode;

  const factory SnippetEvent.selectedDirectoryOrNode({
    required SnippetName snippetName,
    required STreeNode? selectedNode, // null means clear selection
  }) = SelectedDirectoryOrNode;

  // const factory SnippetEvent.selectedFSDirectoryOrNode({
  //   required FSBucketNode bucket,
  //   required STreeNode? selectedNode, // null means clear selection
  // }) = SelectedFSDirectoryOrNode;

  const factory SnippetEvent.undo({
    required String name,
    @Default(false) bool skipRedo,
  }) = Undo;

  const factory SnippetEvent.redo({
    required String name,
  }) = Redo;

  const factory SnippetEvent.forceSnippetRefresh() = ForceSnippetRefresh;
}
