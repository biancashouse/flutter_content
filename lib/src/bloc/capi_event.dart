import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_callouts/flutter_callouts.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'capi_event.freezed.dart';

@freezed
class CAPIEvent with _$CAPIEvent {
  // const factory CAPIEvent.appStarted() = AppStarted;

  // const factory CAPIEvent.newTarget({
  //   required String wName,
  //   required Offset newGlobalPos,
  // }) = NewTarget;

  // const factory CAPIEvent.deleteTarget({
  //   required TargetModel tc,
  // }) = DeleteTarget;

  const factory CAPIEvent.selectPanel({
    required String? panelName,
  }) = SelectPanel;

  // const factory CAPIEvent.selectTarget({
  //   required TargetModel tc,
  // }) = SelectTarget;

  // const factory CAPIEvent.hideAllTargetCoversAndBtns() = HideAllTargetCoversAndBtns;
  // const factory CAPIEvent.hideTargetCoversExcept({TargetModel? tc}) = HideTargetCoversExcept;
  // const factory CAPIEvent.hideAllTargetBtns() = HideAllTargetBtns;
  // const factory CAPIEvent.hideTargetBtn({TargetModel? tc}) = HideTargetBtn;
  // const factory CAPIEvent.unhideTargetBtn({TargetModel? tc}) = UnhideTargetBtn;
  //
  // const factory CAPIEvent.showOnlyOneTarget({
  //   TargetModel? tc,
  // }) = ShowOnlyOneTarget;
  //
  // const factory CAPIEvent.unhideAllTargetGroupsAndBtns() =
  //     UnhideAllTargetGroupsAndBtns;
  // const factory CAPIEvent.unhideAllTargetBtns() = UnhideAllTargetBtns;

  // const factory CAPIEvent.clearSelection({
  //   required String wName,
  // }) = ClearSelection;

  const factory CAPIEvent.overrideTargetGK({
    required String wName,
    required int index,
    required GlobalKey gk,
  }) = OverrideTargetGK;

  // const factory CAPIEvent.startPlayingList({
  //   required String name,
  //   List<int>? playList,
  // }) = StartPlayingList;
  //
  // const factory CAPIEvent.playNextInList({
  //   required String wName,
  // }) = PlayNextInList;

  // const factory CAPIEvent.TargetChanged({
  //   required TargetModel newTC,
  //   @Default(false) bool keepTargetsHidden,
  // }) = TargetChanged;

  // const factory CAPIEvent.changedCalloutPosition({
  //   required TargetModel tc,
  //   required Offset newPos,
  // }) = ChangedCalloutPosition;
  //
  // const factory CAPIEvent.changedCalloutDuration({
  //   required TargetModel tc,
  //   required int newDurationMs,
  // }) = ChangedCalloutDuration;
  //
  // const factory CAPIEvent.changedCalloutColor({
  //   required TargetModel tc,
  //   required Color newColor,
  // }) = ChangedCalloutColor;

  // const factory CAPIEvent.changedCalloutTextAlign({
  //   required TargetModel tc,
  //   required TextAlign newTextAlign,
  // }) = ChangedCalloutTextAlign;
  //
  // const factory CAPIEvent.changedCalloutTextStyle({
  //   required TargetModel tc,
  //   required TextStyle newTextStyle,
  // }) = ChangedCalloutTextStyle;

  // const factory CAPIEvent.changedTargetRadius({
  //   required TargetModel tc,
  //   required double newRadius,
  // }) = ChangedTargetRadius;
  //
  // const factory CAPIEvent.changedTransformScale({
  //   required TargetModel tc,
  //   required double newScale,
  // }) = ChangedTransformScale;

//
// content editor
//
//   const factory CAPIEvent.clearUR() = ClearUR;

  const factory CAPIEvent.forceRefresh({
    @Default(false) bool onlyTargetsWrappers,
  }) = ForceRefresh;

  const factory CAPIEvent.updateClipboard({
    required STreeNode? newContent,
    @Default(false) skipSave,
  }) = UpdateClipboard;

  // const factory CAPIEvent.createdSnippet({
  //   required SnippetRootNode newSnippetNode,
  // }) = CreatedSnippet;

  // const factory CAPIEvent.saveNodeAsSnippet({
  //   required STreeNode node,
  //   STreeNode? nodeParent,
  //   required String newSnippetName,
  // }) = SaveNodeAsSnippet;

  // const factory CAPIEvent.ensureSnippetPresent({
  //   required String snippetName,
  //   required SnippetTemplate fromTemplate,
  //   @Default(false) bool onlyTargetsWrappers,
  // }) = EnsureSnippetPresent;

  // const factory CAPIEvent.createNewSnippetVersion({
  //   required SnippetRootNode snippetRootNode,
  //   @Default(false) bool force,
  //   @Default(false) bool dontEmit,
  //   @Default(false) bool onlyTargetsWrappers,
  // }) = SaveSnippet;

  const factory CAPIEvent.publishSnippet({
    required SnippetName snippetName,
    required VersionId versionId,
  }) = PublishSnippet;

  // const factory CAPIEvent.switchBranch({
  //   required BranchName newBranchName,
  // }) = SwitchBranch;

  const factory CAPIEvent.revertSnippet({
    required SnippetName snippetName,
    required VersionId versionId,
  }) = RevertSnippet;

  const factory CAPIEvent.toggleAutoPublishingOfSnippet({
    required SnippetName snippetName,
  }) = ToggleAutoPublishingOfSnippet;

  const factory CAPIEvent.autoPublishDefault({
    required bool b,
  }) = AutoPublishDefault;

// const factory CAPIEvent.changedSnippetName({
//   required TargetModel tc,
//   required String newName,
// }) = ChangedSnippetName;

  const factory CAPIEvent.hideIframes({required bool hide}) = HideIframes;

  const factory CAPIEvent.setPanelOrPlaceholderSnippet({
    required SnippetName snippetName,
    required PanelName panelName,
  }) = SetPanelSnippet;

  const factory CAPIEvent.pushSnippetEditor({
    required SnippetName snippetName,
    STreeNode? visibleDecendantNode,
  }) = PushSnippetEditor;

  const factory CAPIEvent.popSnippetEditor({
    @Default(false) bool save,
  }) = PopSnippetEditor;

  // const factory CAPIEvent.restoredSnippetBloc({
  //   required SnippetBloC restoredBloc,
  // }) = RestoredSnippetBloc;

  const factory CAPIEvent.showDirectoryTree() = ShowDirectoryTree;

  const factory CAPIEvent.removeDirectoryTree({
    @Default(false) bool save,
  }) = RemoveDirectoryTree;

// const factory CAPIEvent.changedSnippetTreeCalloutSize({
//   required double? newW,
//   required double? newH,
// }) = ChangedSnippetTreeCalloutSize;
//
// const factory CAPIEvent.changedSnippetTreeCalloutPos({
//   required Offset newOffset,
// }) = ChangedSnippetTreeCalloutPos;
//
// const factory CAPIEvent.changedDirectoryTreeCalloutSize({
//   required double? newW,
//   required double? newH,
// }) = ChangedDirectoryTreeCalloutSize;

// const factory CAPIEvent.changedSnippetPropertiesCalloutSize({
//   required double? newW,
//   required double? newH,
// }) = ChangedSnippetPropertiesCalloutSize;

//==========================================================================================
//====  SNIPPET EDITING  ===================================================================
//==========================================================================================
  const factory CAPIEvent.selectNode({
    required STreeNode node,
    // required GlobalKey selectedWidgetGK,
    // required GlobalKey selectedTreeNodeGK,
    // TargetModel? imageTC,
    // TargetModel? widgetTC,
  }) = SelectNode;

  const factory CAPIEvent.clearNodeSelection() = ClearNodeSelection;

  const factory CAPIEvent.saveNodeAsSnippet({
    required STreeNode node,
    required String newSnippetName,
  }) = SaveNodeAsSnippet;

  // const factory CAPIEvent.highlightNode({
  //   required STreeNode? node,
  // }) = HighlightNode;

  // const factory CAPIEvent.showNodeProperties({
  //   required Node node,
  //   required int nodeRootIndex,
  //   required bool showAdders,
  //   required bool showProperties,
  //   TargetModel? tc,
  // }) = ShowNodeProperties;

  const factory CAPIEvent.replaceSelectionWith({
    Type? type,
    SnippetName? snippetName, // only used when type is SnippetRefNode
    STreeNode? testNode,
  }) = ReplaceSelectionWith;

  const factory CAPIEvent.wrapSelectionWith({
    Type? type,
    SnippetName? snippetName, // only used when type is SnippetRefNode
    STreeNode? testNode,
  }) = WrapSelectionWith;

  const factory CAPIEvent.appendChild({
    Type? type,
    STreeNode? testNode,
    SnippetName? snippetName, // only used when type is SnippetRefNode
    Type? widgetSpanChildType,
    STreeNode? testWidgetSpanChildNode,
  }) = AppendChild;

  const factory CAPIEvent.addSiblingBefore({
    Type? type,
    SnippetName? snippetName, // only used when type is SnippetRefNode
    STreeNode? testNode,
  }) = AddSiblingBefore;

  const factory CAPIEvent.addSiblingAfter({
    Type? type,
    SnippetName? snippetName, // only used when type is SnippetRefNode
    STreeNode? testNode,
  }) = AddSiblingAfter;

  const factory CAPIEvent.pasteReplacement({
    // required STreeNode clipboardNode,
    Type? widgetSpanChildType,
  }) = PasteReplacement;

  const factory CAPIEvent.pasteChild({
    // required STreeNode clipboardNode,
    Type? widgetSpanChildType,
    STreeNode? testWidgetSpanChildNode,
  }) = PasteChild;

  const factory CAPIEvent.pasteSiblingBefore() = PasteSiblingBefore;

  const factory CAPIEvent.pasteSiblingAfter() = PasteSiblingAfter;

  const factory CAPIEvent.deleteNodeTapped() = DeleteNodeTapped;

  const factory CAPIEvent.completeDeletion() = CompleteDeletion;

  // const factory CAPIEvent.addNode({
  //   required STreeNode adder2InsertBefore,
  // }) = AddNode;

  const factory CAPIEvent.copySnippetJsonToClipboard(
      {required SnippetRootNode rootNode}) = CopySnippetJsonToClipboard;

  const factory CAPIEvent.replaceSnippetFromJson({String? snippetJson}) =
      ReplaceSnippetFromJson;

  const factory CAPIEvent.copyNode({
    required STreeNode node,
    @Default(false) skipSave,
  }) = CopyNode;

  const factory CAPIEvent.cutNode({
    required STreeNode node,
    @Default(false) skipSave,
  }) = CutNode;

  // const factory CAPIEvent.pasteNode({
  //   required STreeNode adder,
  // }) = PasteNode;

  const factory CAPIEvent.selectedDirectoryOrNode({
    required SnippetName snippetName,
    required STreeNode? selectedNode, // null means clear selection
  }) = SelectedDirectoryOrNode;

  // const factory CAPIEvent.selectedFSDirectoryOrNode({
  //   required FSBucketNode bucket,
  //   required STreeNode? selectedNode, // null means clear selection
  // }) = SelectedFSDirectoryOrNode;

  const factory CAPIEvent.undo({
    required String name,
    @Default(false) bool skipRedo,
  }) = Undo;

  const factory CAPIEvent.redo({
    required String name,
  }) = Redo;

  const factory CAPIEvent.forceSnippetRefresh() = ForceSnippetRefresh;
}
