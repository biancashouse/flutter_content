import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'capi_event.freezed.dart';

@freezed
class CAPIEvent with _$CAPIEvent {
  // const factory CAPIEvent.appStarted() = AppStarted;

  const factory CAPIEvent.newTarget({
    required String wName,
    required Offset newGlobalPos,
  }) = NewTarget;

  const factory CAPIEvent.deleteTarget({
    required TargetConfig tc,
  }) = DeleteTarget;

  const factory CAPIEvent.selectPanel({
    required String? panelName,
  }) = SelectPanel;

  // const factory CAPIEvent.selectTarget({
  //   required TargetConfig tc,
  // }) = SelectTarget;

  const factory CAPIEvent.hideAllTargetGroups() = HideAllTargetGroups;

  const factory CAPIEvent.hideTargetGroupsExcept({
    TargetConfig? tc,
  }) = HideTargetGroupsExcept;

  const factory CAPIEvent.showOnlyOneTargetGroup({
    TargetConfig? tc,
  }) = ShowOnlyOneTargetGroup;

  const factory CAPIEvent.hideAllTargetGroupBtns() = HideAllTargetGroupBtns;

  const factory CAPIEvent.unhideAllTargetGroups() = UnhideAllTargetGroups;

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

  const factory CAPIEvent.targetConfigChanged({
    required TargetConfig newTC,
    @Default(false) bool keepTargetsHidden,
  }) = TargetConfigChanged;

  // const factory CAPIEvent.changedCalloutPosition({
  //   required TargetConfig tc,
  //   required Offset newPos,
  // }) = ChangedCalloutPosition;
  //
  // const factory CAPIEvent.changedCalloutDuration({
  //   required TargetConfig tc,
  //   required int newDurationMs,
  // }) = ChangedCalloutDuration;
  //
  // const factory CAPIEvent.changedCalloutColor({
  //   required TargetConfig tc,
  //   required Color newColor,
  // }) = ChangedCalloutColor;

  // const factory CAPIEvent.changedCalloutTextAlign({
  //   required TargetConfig tc,
  //   required TextAlign newTextAlign,
  // }) = ChangedCalloutTextAlign;
  //
  // const factory CAPIEvent.changedCalloutTextStyle({
  //   required TargetConfig tc,
  //   required TextStyle newTextStyle,
  // }) = ChangedCalloutTextStyle;

  // const factory CAPIEvent.changedTargetRadius({
  //   required TargetConfig tc,
  //   required double newRadius,
  // }) = ChangedTargetRadius;
  //
  // const factory CAPIEvent.changedTransformScale({
  //   required TargetConfig tc,
  //   required double newScale,
  // }) = ChangedTransformScale;

//
// content editor
//
//   const factory CAPIEvent.clearUR() = ClearUR;

  const factory CAPIEvent.forceRefresh() = ForceRefresh;

  const factory CAPIEvent.updateClipboard({
    required String? newContent,
  }) = UpdateClipboard;

  // const factory CAPIEvent.createdSnippet({
  //   required SnippetRootNode newSnippetNode,
  // }) = CreatedSnippet;

  // const factory SnippetEvent.saveNodeAsSnippet({
  //   required STreeNode node,
  //   STreeNode? nodeParent,
  //   required String newSnippetName,
  // }) = SaveNodeAsSnippet;

  const factory CAPIEvent.saveModel() = SaveModel;

// const factory CAPIEvent.changedSnippetName({
//   required TargetConfig tc,
//   required String newName,
// }) = ChangedSnippetName;

  const factory CAPIEvent.hideIframes({required bool hide}) = HideIframes;

  const factory CAPIEvent.setPanelSnippet({
    required SnippetName snippetName,
    required PanelName panelName,
  }) = SetPanelSnippet;

  const factory CAPIEvent.pushSnippetBloc({
    required SnippetName snippetName,
    STreeNode? visibleDecendantNode,
  }) = PushSnippetBloc;

  const factory CAPIEvent.popSnippetBloc({
    @Default(false) bool save,
  }) = PopSnippetBloc;

  const factory CAPIEvent.restoredSnippetBloc({
    required SnippetBloC restoredBloc,
}) = RestoredSnippetBloc;

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
