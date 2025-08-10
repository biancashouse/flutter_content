import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'capi_event.freezed.dart';

@freezed
class CAPIEvent with _$CAPIEvent {
  const CAPIEvent._();
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
    required SNode? newContent,
    required ScrollControllerName? scName,
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

  // const factory CAPIEvent.PagesChanged({
  //   required String pathName,
  // }) = PageAdded;

  const factory CAPIEvent.deletePage({
    required String pathName,
  }) = DeletePage;

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

  const factory CAPIEvent.enterSelectWidgetMode({
    required SnippetName snippetName,
  }) = EnterSelectWidgetMode;

  const factory CAPIEvent.exitSelectWidgetMode(
  ) = ExitSelectWidgetMode;

  const factory CAPIEvent.pushSnippetEditor({
    required SnippetRootNode rootNode,
    SNode? selectedNode,
  }) = PushSnippetEditor;

  const factory CAPIEvent.popSnippetEditor({
    @Default(false) bool save,
  }) = PopSnippetEditor;

  // const factory CAPIEvent.showCutout({
  //   required Rect cutoutRect,
  //   @Default(1000) int durationMs,
  // }) = ShowCutout;

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
    required SNode node,
    // required GlobalKey selectedWidgetGK,
    // required GlobalKey selectedTreeNodeGK,
    // TargetModel? imageTC,
    // TargetModel? widgetTC,
  }) = SelectNode;

  const factory CAPIEvent.clearNodeSelection(
      // ScrollControllerName? scName,
      ) = ClearNodeSelection;

  const factory CAPIEvent.saveNodeAsSnippet({
    required SNode node,
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
    SNode? testNode,
  }) = ReplaceSelectionWith;

  const factory CAPIEvent.wrapSelectionWith({
    Type? type,
    SnippetName? snippetName, // only used when type is SnippetRefNode
    SNode? testNode,
  }) = WrapSelectionWith;

  const factory CAPIEvent.appendChild({
    Type? type,
    SNode? testNode,
    SnippetName? snippetName, // only used when type is SnippetRefNode
    Type? widgetSpanChildType,
    SNode? testWidgetSpanChildNode,
  }) = AppendChild;

  const factory CAPIEvent.addSiblingBefore({
    Type? type,
    SnippetName? snippetName, // only used when type is SnippetRefNode
    SNode? testNode,
  }) = AddSiblingBefore;

  const factory CAPIEvent.addSiblingAfter({
    Type? type,
    SnippetName? snippetName, // only used when type is SnippetRefNode
    SNode? testNode,
  }) = AddSiblingAfter;

  // // reorder sibling in 2 actions: remove, then insert
  // const factory CAPIEvent.moveSibling({
  //   required MC parentNode,
  //   required STreeNode node,
  //   required int atPos,
  // }) = MoveSibling;
  //
  // const factory CAPIEvent.reinsertSibling({
  //   required MC parentNode,
  //   required STreeNode node,
  //   required int atPos,
  // }) = ReinsertSibling;
  // // reorder sibling in 2 actions: remove, then insert

  const factory CAPIEvent.pasteReplacement({
    // required STreeNode clipboardNode,
    Type? widgetSpanChildType,
  }) = PasteReplacement;

  const factory CAPIEvent.pasteChild({
    // required STreeNode clipboardNode,
    Type? widgetSpanChildType,
    SNode? testWidgetSpanChildNode,
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
    required SNode node,
    required ScrollControllerName? scName,
    @Default(false) skipSave,
  }) = CopyNode;

  const factory CAPIEvent.cutNode({
    required SNode node,
    required ScrollControllerName? scName,
    @Default(false) skipSave,
  }) = CutNode;

  // const factory CAPIEvent.pasteNode({
  //   required STreeNode adder,
  // }) = PasteNode;

  const factory CAPIEvent.selectedDirectoryOrNode({
    required SnippetName snippetName,
    required SNode? selectedNode, // null means clear selection
  }) = SelectedDirectoryOrNode;

  // const factory CAPIEvent.selectedFSDirectoryOrNode({
  //   required FSBucketNode bucket,
  //   required STreeNode? selectedNode, // null means clear selection
  // }) = SelectedFSDirectoryOrNode;

  const factory CAPIEvent.imageChanged({
    Uint8List? newBytes,
  }) = ImageChanged;

  // const factory CAPIEvent.clearUR() = ClearUR;
  //

  // const factory CAPIEvent.createUndo({
  //   required SnippetRootNode? snippet,
  // }) = CreateUndo;

  // const factory CAPIEvent.undo({
  //   @Default(false) bool skipRedo,
  // }) = Undo;
  //
  // const factory CAPIEvent.redo() = Redo;

  const factory CAPIEvent.forceSnippetRefresh() = ForceSnippetRefresh;

  @override
  List<DiagnosticsNode> debugDescribeChildren() {
    // TODO: implement debugDescribeChildren
    throw UnimplementedError();
  }

  @override
  DiagnosticsNode toDiagnosticsNode({String? name, DiagnosticsTreeStyle? style}) {
    // TODO: implement toDiagnosticsNode
    throw UnimplementedError();
  }

  @override
  String toStringDeep({String prefixLineOne = '', String? prefixOtherLines, DiagnosticLevel minLevel = DiagnosticLevel.debug, int wrapWidth = 65}) {
    // TODO: implement toStringDeep
    throw UnimplementedError();
  }

  @override
  String toStringShallow({String joiner = ', ', DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    // TODO: implement toStringShallow
    throw UnimplementedError();
  }

  @override
  String toStringShort() {
    // TODO: implement toStringShort
    throw UnimplementedError();
  }
}
