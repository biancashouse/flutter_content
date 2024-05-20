import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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

  // const factory SnippetEvent.saveNodeAsSnippet({
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

  const factory CAPIEvent.setPanelSnippet({
    required SnippetName snippetName,
    required PanelName panelName,
  }) = SetPanelSnippet;

  const factory CAPIEvent.pushSnippetBloc({
    required PageName pageName,
    required SnippetName snippetName,
    STreeNode? visibleDecendantNode,
  }) = PushSnippetBloc;

  const factory CAPIEvent.popSnippetBloc({
    @Default(false) bool save,
  }) = PopSnippetBloc;

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
}
