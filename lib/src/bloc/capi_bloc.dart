import 'dart:async';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_callouts/flutter_callouts.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/snippet_being_edited.dart';
import 'package:flutter_content/src/model/model_repo.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_alignment.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_main_axis_size.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/mappable_enum_decoration.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/text_style_group.dart';
import 'package:flutter_content/src/snippet/snodes/algc_node.dart';
import 'package:flutter_content/src/snippet/snodes/fs_image_node.dart';
import 'package:flutter_content/src/snippet/snodes/upto6color_values.dart';

class CAPIBloC extends Bloc<CAPIEvent, CAPIState> {
  final IModelRepository modelRepo;

  // static CAPIBloC instance(context) => BlocProvider.of<CAPIBloC>(context);

  CAPIBloC({
    required this.modelRepo,
    SnippetBeingEdited? mockSnippetBeingEdited,  // for testing
    // bool useFirebase = false,
    // required bool localTestingFilePaths,
    // required Map<String, TargetGroupModel> targetGroupMap,
    // required Map<String, TargetModel> singleTargetMap,
    // EncodedJson? jsonRootDirectoryNode,
    // required Map<SnippetName, SnippetRootNode> snippetsMap,
    Offset? snippetTreeCalloutInitialPos,
    double? snippetTreeCalloutW,
    double? snippetTreeCalloutH,
    // double? snippetPropertiesCalloutW,
    // double? snippetPropertiesCalloutH,
  }) : super(CAPIState(
          snippetBeingEdited: mockSnippetBeingEdited,  // testing usage only
          // useFirebase: useFirebase,
          // localTestingFilePaths: localTestingFilePaths,
          // targetGroupMap: targetGroupMap,
          // jsonRootDirectoryNode: jsonRootDirectoryNode,
          // snippetTreeCalloutInitialPos: snippetTreeCalloutInitialPos,
          snippetTreeCalloutW: snippetTreeCalloutW,
          snippetTreeCalloutH: snippetTreeCalloutH,
          // snippetPropertiesCalloutW: snippetPropertiesCalloutW,
          // snippetPropertiesCalloutH: snippetPropertiesCalloutH,
          // snippetsMap: snippetsMap,
          // modelUR: ModelUR(),
        )) {
    // init the static map
    // for (String id in singleTargetMap.keys) {
    //   SingleTargetWrapper.singleTargetMap[id] = singleTargetMap[id]!.clone();
    // }

    // on<AppStarted>((event, emit) => _appStarted(event, emit));
    on<ForceRefresh>((event, emit) => _forceRefresh(event, emit));
    on<SelectPanel>((event, emit) => _selectPanel(event, emit));
    // on<TrainerSignedIn>((event, emit) => _trainerSignedIn(event, emit));
    // on<SaveNodeAsSnippet>((event, emit) => _saveNodeAsSnippet(event, emit));
    // on<EnsureSnippetPresent>(
    // (event, emit) => _ensureSnippetPresent(event, emit));
    // on<SaveSnippet>((event, emit) => _saveSnippet(event, emit));
    // on<SwitchBranch>((event, emit) => _switchBranch(event, emit));
    on<PublishSnippet>((event, emit) => _publishSnippet(event, emit));
    on<RevertSnippet>((event, emit) => _revertSnippet(event, emit));
    // on<InitApp>((event, emit) => _initApp(event, emit));
    // on<RecordMatrix>((event, emit) => _recordMatrix(event, emit));
    // on<TargetMoved>((event, emit) => _targetMoved(event, emit));
    // on<BtnMoved>((event, emit) => _btnMoved(event, emit));
    // on<NewTargetManual>((event, emit) => _newTargetManual(event, emit));
    // on<NewTarget>((event, emit) => _newTarget(event, emit));
    // on<ListViewRefreshed>((event, emit) => _listViewRefreshed(event, emit));
    // on<DeleteTarget>((event, emit) => _deleteTarget(event, emit));
    // on<SelectTarget>((event, emit) => _selectTarget(event, emit));
    // on<HideIframes>((event, emit) => _hideIframes(event, emit));
    // on<HideTargetBtn>((event, emit) => _hideTargetBtn(event, emit));
    // on<UnhideTargetBtn>((event, emit) => _unhideTargetBtn(event, emit));
    // on<HideAllTargetCoversAndBtns>((event, emit) => _hideAllTargetCoversAndBtns(event, emit));
    // on<HideAllTargetBtns>(
    //     (event, emit) => _hideAllTargetBtns(event, emit));
    // on<HideTargetCoversExcept>(
    //     (event, emit) => _hideTargetGroupsExcept(event, emit));
    // on<ShowOnlyOneTarget>(
    //     (event, emit) => _showOnlyOneTargetGroup(event, emit));
    // on<UnhideAllTargetGroupsAndBtns>(
    //         (event, emit) => _unhideAllTargetGroupsAndBtns(event, emit));
    // on<UnhideAllTargetBtns>((event, emit) => _unhideAllTargetBtns(event, emit));
    // on<ChangedOrder>((event, emit) => _changedOrder(event, emit));
    // on<ClearSelection>((event, emit) => _clearSelection(event, emit));
    // on<StartPlayingList>((event, emit) => _startPlayingList(event, emit));
    // on<PlayNextInList>((event, emit) => _playNextInList(event, emit));
    // on<TargetChanged>((event, emit) => _targetChanged(event, emit));
    // on<ChangedCalloutPosition>((event, emit) => _changedCalloutPosition(event, emit));
    // on<ChangedCalloutDuration>((event, emit) => _changedCalloutDuration(event, emit));
    // on<ChangedCalloutColor>((event, emit) => _changedCalloutColor(event, emit));
    // on<ChangedCalloutTextAlign>((event, emit) => _changedCalloutTextAlign(event, emit));
    // on<ChangedCalloutTextStyle>((event, emit) => _changedCalloutTextStyle(event, emit));
    // on<ChangedTargetRadius>((event, emit) => _changedTargetRadius(event, emit));
    // on<ChangedTransformScale>((event, emit) => _changedTransformScale(event, emit));
    //
    // content editor
    //
    // on<ClearUR>((event, emit) => _clearUR(event, emit));
    on<PushSnippetEditor>((event, emit) => _pushSnippetEditor(event, emit));
    on<PopSnippetEditor>((event, emit) => _popSnippetEditor(event, emit));
    // on<RestoredSnippetBloc>((event, emit) => _restoredSnippetBloc(event, emit));
    // on<CreatedSnippet>((event, emit) => _createdSnippet(event, emit));
    on<SetPanelSnippet>(
        (event, emit) => _setPanelOrPlaceholderSnippet(event, emit));
    // on<DockChangeSnippetEditor>((event, emit) => _dockChangeSnippetEditor(event, emit));
    // on<ShowNodeProperties>((event, emit) => _showNodeProperties(event, emit));
    // on<ChangedSnippetName>((event, emit) => _changedSnippetName(event, emit));
    // on<ChangedSnippetTreeCalloutSize>((event, emit) => _changedSnippetTreeCalloutSize(event, emit));
    // on<ChangedSnippetTreeCalloutPos>((event, emit) => _changedSnippetTreeCalloutPos(event, emit));
    // on<ChangedSnippetPropertiesCalloutSize>((event, emit) => _changedSnippetPropertiesCalloutSize(event, emit));
    on<UpdateClipboard>((event, emit) => _updateClipboard(event, emit));
    // on<PickedAColor>((event, emit) => _pickedAColor(event, emit));
    // on<TextChanged>((event, emit) => _textChanged(event, emit));
    // on<CreateUndo>((event, emit) => _createUndo(event, emit));

    //==========================================================================================
    //====  SNIPPET EDITING  ===================================================================
    //==========================================================================================
    on<SelectNode>((event, emit) => _selectNode(event, emit));
    on<ClearNodeSelection>((event, emit) => _clearNodeSelection(event, emit));
    // on<HighlightNode>((event, emit) => _highlightNode(event, emit));
    on<SaveNodeAsSnippet>((event, emit) => _saveNodeAsSnippet(event, emit));
    on<ForceSnippetRefresh>((event, emit) => _forceSnippetRefresh(event, emit));
    on<WrapSelectionWith>((event, emit) => _wrapWith(event, emit));
    on<ReplaceSelectionWith>((event, emit) => _replaceWith(event, emit));
    on<AppendChild>((event, emit) => _addChild(event, emit));
    on<AddSiblingBefore>((event, emit) => _addSiblingBefore(event, emit));
    on<AddSiblingAfter>((event, emit) => _addSiblingAfter(event, emit));
    on<PasteChild>((event, emit) => _pasteChild(event, emit));
    on<PasteReplacement>((event, emit) => _pasteReplacement(event, emit));
    on<PasteSiblingBefore>((event, emit) => _pasteSiblingBefore(event, emit));
    on<PasteSiblingAfter>((event, emit) => _pasteSiblingAfter(event, emit));
    on<DeleteNodeTapped>((event, emit) => _deleteNodeTapped(event, emit));
    on<CompleteDeletion>((event, emit) => _completeDeletion(event, emit));
    on<SelectedDirectoryOrNode>(
        (event, emit) => _selectedDirectoryOrNode(event, emit));
    on<CutNode>((event, emit) => _cutNode(event, emit));
    // on<RemoveSiblingForReinsertion>(
    //     (event, emit) => _removeSiblingForReinsertion(event, emit));
    // on<ReinsertSibling>((event, emit) => _reinsertSibling(event, emit));
    on<CopyNode>((event, emit) => _copyNode(event, emit));
    on<CopySnippetJsonToClipboard>(
        (event, emit) => _copySnippetJsonToClipboard(event, emit));
    on<ReplaceSnippetFromJson>(
        (event, emit) => _replaceSnippetFromJson(event, emit));
    // on<Undo>((event, emit) => _undo(event, emit));
    // on<Redo>((event, emit) => _redo(event, emit));
  }

// static Soundpool? _soundpool;
// static int? _shutterSoundId;
// static int? _plopSoundId;
// static int? _whooshSoundId;
// static int? _errorSoundId;

// // lazy load
// static Future<void> possiblyLoadSounds(CAPIState capiState) async {
//   if (_soundpool == null && capiState.initialValueJsonAssetPath != null) {
//     await _readSoundFiles(capiState.initialValueJsonAssetPath!, capiState.localTestingFilePaths);
//   }
// }

// Future<void> _initApp(InitApp event, emit) async {
//   emit(
//     state.copyWith(
//       targetGroupMap: event.imageTargetListMap,
//       localTestingFilePaths: event.localTestingFilePaths,
//     ),
//   );
// }

// Future<void> _initTW(InitTW event, emit) async {
//   Map<String, GlobalKey> newIVGKMap = {}..addAll(state.ivGKMap);
//   newIVGKMap[event.wName] = event.ivGK;
//   Map<String, GlobalKey> newIVChildGKMap = {}..addAll(state.ivChildGKMap);
//   newIVChildGKMap[event.wName] = event.ivChildGK;
//   emit(state.copyWith(
//     ivGKMap: newIVGKMap,
//     ivChildGKMap: newIVChildGKMap,
//   ));
// }

  // void _appStarted(event, emit) {
  //   CAPIModel model = _stateToModel();
  //   String jsonS = jsonEncode(model.toJson());
  //   emit(state.copyWith(
  //     lastSavedModelJson: jsonS,
  //   ));
  // }

  // void _createdSnippet(CreatedSnippet event, emit) {
  //   // skip if named snippet already exists
  //   // if (state.snippetsMap.containsKey(event.newSnippetBloc.snippetName)) return;
  //   Map<SnippetName, SnippetRootNode> newSnippetsMap = Map<SnippetName, SnippetRootNode>.of(state.snippetsMap);
  //   newSnippetsMap[event.newSnippetNode.name] = event.newSnippetNode;
  //   // state.snippetTreeC.toggleExpansion(state.snippetTreeC.roots.first);
  //   emit(state.copyWith(
  //     snippetsMap: newSnippetsMap,
  //     force: state.force + 1,
  //   ));
  // }

  // // ensure both published and editing versions are present
  // Future<void> _ensureSnippetPresent(EnsureSnippetPresent event, emit) async {
  //   await _getOrCreateSnippet(
  //     event.snippetName,
  //     true,
  //     event.fromTemplate,
  //     event.onlyTargetsWrappers,
  //     emit,
  //   );
  //   await _getOrCreateSnippet(
  //     event.snippetName,
  //     false,
  //     event.fromTemplate,
  //     event.onlyTargetsWrappers,
  //     emit,
  //   );
  //   // var fc = FC();
  //   emit(state.copyWith(
  //     force: state.force + 1,
  //     onlyTargetsWrappers: !event.onlyTargetsWrappers,
  //   ));
  // }

  // Future<void> _getOrCreateSnippet(
  //   SnippetName snippetName,
  //   bool canEdit,
  //   SnippetTemplate fromTemplate,
  //   bool onlyTargetsWrappers,
  //   emit,
  // ) async {
  //   SnippetRootNode? rootNode;
  //   VersionId? editingOrPublishedVersionId = canEdit
  //       ? FCO.editingVersionIds[snippetName]
  //       : FCO.publishedVersionIds[snippetName];
  //   if (editingOrPublishedVersionId != null) {
  //     // exists in AppInfo, so make sure it has been fetched from FB
  //     await FCO.modelRepo.getSnippetFromCacheOrFB(
  //         snippetName: snippetName, versionId: editingOrPublishedVersionId);
  //     // var test = FCO.snippetCache[snippetName]?[editingOrPublishedVersionId];
  //     rootNode = FCO.snippetCache[snippetName]?[editingOrPublishedVersionId];
  //   } else {
  //     // snippet does not yet exist in FB, hence not in AppInfo
  //     VersionId initialVersionId =
  //         DateTime.now().millisecondsSinceEpoch.toString();
  //     rootNode =
  //         SnippetPanel.createSnippetFromTemplate(fromTemplate, snippetName);
  //     FCO.addToSnippetCache(
  //       snippetName: snippetName,
  //       rootNode: rootNode,
  //       versionId: initialVersionId,
  //       // editing: true,
  //     );
  //     FCO.updatePublishedVersionId(
  //         snippetName: snippetName, versionId: initialVersionId);
  //     FCO.updateEditingVersionId(
  //         snippetName: snippetName, newVersionId: initialVersionId);
  //     SaveSnippet ssEvent = SaveSnippet(
  //       snippetRootNode: rootNode,
  //       newVersionId: initialVersionId,
  //       onlyTargetsWrappers: true,
  //     );
  //     _saveSnippet(ssEvent, emit);
  //   }
  // }

  // Future<void> _saveSnippet(SaveSnippet event, emit) async {
  //   String? jsonBeforePush = FCO.jsonBeforePush;
  //   String currentJsonS = event.snippetRootNode.toJson();
  //
  //   // testing
  //   // var testModel = jsonDecode(jsonS);
  //
  //   // only save if changes detected
  //   if (!event.force && currentJsonS == jsonBeforePush) return;
  //
  //   final stopwatch = Stopwatch()..start();
  //   // fco.logi('saving ${state.snippetTreeCalloutW}, ${state.snippetTreeCalloutH}');
  //   fco.showTextToast(
  //     cId: "saving-model",
  //     msgText: 'saving changes...',
  //     backgroundColor: Colors.yellow,
  //     width: FCO.scrW * .8,
  //     height: 40,
  //     gravity: Alignment.topCenter,
  //     textColor: Colors.blueAccent,
  //   );
  //
  //   // save to local storage
  //   HydratedBloc.storage.write('flutter-content', currentJsonS);
  //   // // save to clipboard
  //   // try {
  //   //   Clipboard.setData(ClipboardData(text: jsonS));
  //   // } catch(e) {
  //   //   // ignore clipboard exception
  //   // }
  //
  //   // save to firebase
  //   modelRepo.saveSnippet(
  //       snippetRootNode: event.snippetRootNode,
  //       newVersionId: event.newVersionId);
  //
  //   // }
  //   // } else {
  //   //   // only write if later than firebase version
  //   //   Map<String, dynamic> data = snap.data() as Map<String, dynamic>;
  //   //   int lastVersion = data["latestVersion"] ?? 0;
  //   //   if (model.lastModified! > lastVersion) {
  //   //     //int latestVersion = data["latestVersion"] ?? 0;
  //   //     await _createOrUpdateFirebaseModel(modelDocRef, model);
  //   //   }
  //   // }
  //   // min 2s display of toast
  //   if (stopwatch.elapsedMilliseconds < 2000) {
  //     await Future.delayed(
  //         Duration(milliseconds: 2000 - stopwatch.elapsedMilliseconds));
  //   }
  //   fco.dismissAll(onlyToasts: true);
  //   // update last value
  //   if (!event.dontEmit) {
  //     emit(state.copyWith(
  //       force: state.force + 1,
  //       onlyTargetsWrappers: event.onlyTargetsWrappers,
  //     ));
  //   }
  // }

  // Future<void> _switchBranch(SwitchBranch event, emit) async {
  //   final stopwatch = Stopwatch()..start();
  //   // fco.logi('saving ${state.snippetTreeCalloutW}, ${state.snippetTreeCalloutH}');
  //   fco.showTextToast(
  //     cId: "saving-model",
  //     msgText: 'saving changes...',
  //     backgroundColor: Colors.yellow,
  //     width: FCO.scrW * .8,
  //     height: 40,
  //     gravity: Alignment.topCenter,
  //     textColor: Colors.blueAccent,
  //   );
  //
  //   // save to firebase
  //   await modelRepo.switchBranch(newBranchName: event.newBranchName);
  //
  //   // min 2s display of toast
  //   if (stopwatch.elapsedMilliseconds < 2000) {
  //     await Future.delayed(
  //         Duration(milliseconds: 2000 - stopwatch.elapsedMilliseconds));
  //   }
  //   fco.dismissAll(onlyToasts: true);
  //   // update last value
  // }

  Future<void> _revertSnippet(RevertSnippet event, emit) async {
    final stopwatch = Stopwatch()..start();
    fco.showToast(
      calloutConfig: CalloutConfig(
        cId: "reverting-model",
        gravity: Alignment.topCenter,
        fillColor: Colors.yellow,
        initialCalloutW: fco.scrW * .8,
        initialCalloutH: 40,
      ),
      calloutContent: Padding(
          padding: const EdgeInsets.all(10),
          child: fco.coloredText('reverting staged version...',
              color: Colors.blueAccent)),
    );

    await modelRepo.updateSnippetProps(
      snippetName: event.snippetName,
      editingVersionId: event.versionId,
      publishingVersionId: event.versionId,
    );

    if (stopwatch.elapsedMilliseconds < 2000) {
      Future.delayed(
          Duration(milliseconds: 2000 - stopwatch.elapsedMilliseconds));
    }

    fco.dismissAll(onlyToasts: true);

    emit(state.copyWith(
      force: state.force + 1,
    ));
  }

  Future<void> _publishSnippet(PublishSnippet event, emit) async {
    final stopwatch = Stopwatch()..start();
    fco.showToast(
      calloutConfig: CalloutConfig(
        cId: "publishing-version",
        gravity: Alignment.topCenter,
        fillColor: Colors.yellow,
        initialCalloutW: fco.scrW * .8,
        initialCalloutH: 40,
      ),
      calloutContent: Padding(
          padding: const EdgeInsets.all(10),
          child: fco.coloredText('publishing version...',
              color: Colors.blueAccent)),
    );

    await modelRepo.updateSnippetProps(
      snippetName: event.snippetName,
      publishingVersionId: event.versionId,
    );

    if (stopwatch.elapsedMilliseconds < 2000) {
      await Future.delayed(
          Duration(milliseconds: 2000 - stopwatch.elapsedMilliseconds));
    }

    fco.dismissAll(onlyToasts: true);
    // await FC.loadLatestSnippetMap();
    //
    // emit(state.copyWith(
    //   force: state.force + 1,
    // ));
  }

  void _forceRefresh(ForceRefresh event, emit) {
    fco.logi(
        "forceRefresh --------------------------------------------------------");
    emit(state.copyWith(
      force: state.force + 1,
      onlyTargetsWrappers: event.onlyTargetsWrappers,
    ));
    // if ForceRefresh was set, emit again to reset it in the bloc state
    if (event.onlyTargetsWrappers) {
      emit(state.copyWith(
        force: state.force,
        onlyTargetsWrappers: false,
      ));
    }
  }

// void _trainerSignedIn(event, emit) {
//   emit(state.copyWith(
//     trainerIsSignedn: true,
//     force: state.force + 1,
//   ));
// }

// void _startPlayingList(StartPlayingList event, emit) {
//   List<TargetModel> newPlayList = [];
//   if (event.playList == null) {
//     if (state.aTargetIsSelected()) {
//       newPlayList = [state.selectedTarget!];
//     } else {
//       newPlayList = List.of(state.imageConfig(event.name)?.imageTargets ?? []);
//     }
//   } else {
//     // playlist supplied as list ints
//     newPlayList = event.playList == null
//         ? []
//         : event.playList!.map((i) {
//             TargetModel tc = state.imageConfig(event.name)!.imageTargets[i];
//             return tc;
//           }).toList();
//   }
//   emit(state.copyWith(
//     playList: newPlayList,
//   ));
// }

// void _playNextInList(PlayNextInList event, emit) {
//   List<TargetModel> newPlayList = [];
//   if (state.playList.isNotEmpty) {
//     newPlayList = state.playList.sublist(1);
//     emit(state.copyWith(
//       playList: newPlayList,
//     ));
//   }
// }

  /// copy snippet json to clipboard
  Future<void> _copySnippetJsonToClipboard(event, emit) async {
    await FlutterClipboard.copy(event.rootNode.toJson());
  }

  /// paste clipboard, or supplied json String to form a snippet
  Future<void> _replaceSnippetFromJson(event, emit) async {
    SnippetRootNode? rootNode;
    if (event.snippetJson == null) {
      var snippetJson = await FlutterClipboard.paste();
      rootNode = SnippetRootNodeMapper.fromJson(snippetJson);
    } else {
      rootNode = SnippetRootNodeMapper.fromJson(event.snippetJson);
    }
    fco.logi('_replaceSnippetFromJson: snippet name is "${rootNode.name}"');
    // save the clipboard snippet snippet
    await fco.cacheAndSaveANewSnippetVersion(
      snippetName: snippetName,
      rootNode: rootNode,
      publish: true,
    );
  }

  Future<void> _updateClipboard(UpdateClipboard event, emit) async {
    fco.setClipboard(event.newContent);
    emit(state.copyWith(
      force: state.force + 1,
    ));
    if (event.skipSave) return;
    fco.modelRepo.saveAppInfo();
    // possibly hide or show clipbaord tab
    if (event.newContent == null) {
      fco.hideClipboard();
    } else {
      fco.hideClipboard();
      fco.showFloatingClipboard();
    }
  }

// // update current scale, translate and selected target
//   void _recordMatrix(RecordMatrix event, emit) {
//     if (state.aTargetIsSelected()) {
//       TargetModel updatedTC = state.selectedTarget!;
//       updatedTC.setRecordedMatrix(event.newMatrix);
//       Map<String, CAPITargetModel> newTargetGroupListMap = _addOrUpdatetargetGroupMap(event.wName, updatedTC);
//       emit(state.copyWith(
//         targetGroupMap: newTargetGroupListMap,
//         force: state.force + 1,
//         // lastUpdatedTC: updatedTC,
//       ));
//     }
//   }

// update current scale, translate and selected target
//   void _targetMoved(TargetMoved event, emit) {
//     TargetModel updatedTC = event.tc;
//     updatedTC.setTargetStackPosPc(event.newGlobalPos.translate(
//       event.tc.getScale(state) * event.targetRadius,
//       event.tc.getScale(state) * event.targetRadius,
//     ));
//     Map<String, CAPITargetModelList> newTargetGroupListMap = _addOrUpdateTargetGroupListMap(event.tc.wName, updatedTC);
//     emit(state.copyWith(
//       targetGroupMap: newTargetGroupListMap,
//       force: state.force + 1,
//     ));
//   }

// update current scale, translate and selected target
//   void _btnMoved(BtnMoved event, emit) {
//     TargetModel updatedTC = event.tc;
//     updatedTC.setBtnStackPosPc(event.newGlobalPos.translate(
//       state.CAPI_TARGET_BTN_RADIUS,
//       state.CAPI_TARGET_BTN_RADIUS,
//     ));
//     Map<String, CAPITargetModelList> newTargetGroupListMap = _addOrUpdateTargetGroupListMap(event.tc.wName, updatedTC);
//     emit(state.copyWith(
//       targetGroupMap: newTargetGroupListMap,
//       force: state.force + 1,
//     ));
//   }

// void _newTargetManual(NewTargetManual event, emit) {
//   TargetModel newItem = TargetModel(
//     uid: Random().nextInt(100),
//     twName: event.wName,
//   );
//   newItem.init(
//     this,
//     GlobalKey(debugLabel: "Target: ${1 + (state.targetGroupMap[event.wName] ?? []).length}"),
//     FocusNode(),
//   );
//   newItem.setRecordedMatrix(Matrix4.identity());
//   newItem.setTargetStackPosPc(event.newGlobalPos);
//   newItem.btnLocalLeftPc = newItem.targetLocalPosLeftPc;
//   newItem.btnLocalTopPc = newItem.targetLocalPosTopPc;
//   Map<String, List<TargetModel>> newTargetGroupListMap = _addOrUpdatetargetGroupMap(event.wName, newItem);
//   // select new item
//   int index = (newTargetGroupListMap[event.wName] ?? []).indexOf(newItem);
//   Map<String, int> newSelectionMap = Map.of(state.selectedTargetIndexMap);
//   if (index > -1) {
//     newSelectionMap[event.wName] = index;
//   }
//   emit(state.copyWith(
//     targetGroupMap: newTargetGroupListMap,
//     selectedTargetIndexMap: newSelectionMap,
//     // lastUpdatedTC: newItem,
//   ));
// }

  // void _newTarget(NewTarget event, emit) {
  //   Map<String, TargetGroupModel> newTargetGroupListMap = _addOrUpdateTargetGroupListMap(event.wName, newItem);
  //   emit(state.copyWith(
  //     targetGroupMap: newTargetGroupListMap,
  //     // selectedTarget: newItem,
  //     newestTarget: newItem,
  //   ));
  // }

  // void _deleteTarget(DeleteTarget event, emit) {
  //   TargetGroupModel newConfig = state.imageConfig(event.tc.wName)!;
  //   try {
  //     TargetModel oldTc = newConfig.targets.firstWhere((theTc) => theTc.uid == event.tc.uid);
  //     int oldTcIndex = newConfig.targets.indexOf(oldTc);
  //     newConfig.targets.removeAt(oldTcIndex);
  //     Map<String, TargetGroupModel> newTargetGroupListMap = Map.of(state.targetGroupMap);
  //     newTargetGroupListMap[event.tc.wName] = newConfig;
  //     emit(state.copyWith(
  //       targetGroupMap: newTargetGroupListMap,
  //       hideAllTargetGroups: false,
  //       hideAllTargetGroupPlayBtns: false,
  //       hideTargetsExcept: null,
  //       force: state.force + 1,
  //     ));
  //     _saveModel(event, emit);
  //   } catch (e) {
  //     fco.logi("\nUnable to remove tc !\n");
  //   }
  // }

// Future<void> _selectTarget(SelectTarget event, emit) async {
//   emit(state.copyWith(
//     selectedTarget: event.tc,
//   ));
// }

  // Future<void> _hideIframes(HideIframes event, emit) async {
  //   emit(state.copyWith(
  //     hideIframes: event.hide,
  //   ));
  // }

  // // Target Btns
  // Future<void> _hideAllTargetBtns(event, emit) async {
  //   emit(state.copyWith(
  //     hideAllTargetBtns: true,
  //   ));
  // }
  //
  // Future<void> _unhideTargetBtn(HideTargetBtn event, emit) async {
  //   emit(state.copyWith(
  //     hideTargetBtnsExcept: event.tc,
  //   ));
  // }
  //
  // Future<void> _hideAllTargetCovers(event, emit) async {
  //   emit(state.copyWith(
  //     hideAllTargetCovers: true,
  //   ));
  // }
  //
  //
  //
  // Future<void> _unhideTargetCovers(HideTargetCoversExcept event, emit) async {
  //   emit(state.copyWith(
  //     hideTargetCoversExcept: event.tc,
  //   ));
  // }
  //
  // Future<void> _showOnlyOneTargetGroup(ShowOnlyOneTarget event, emit) async {
  //   emit(state.copyWith(
  //     hideTargetsExcept: event.tc,
  //     hideAllTargetGroupPlayBtns: true,
  //   ));
  // }
  //
  // Future<void> _unhideAllTargetGroupsAndBtns(event, emit) async {
  //   emit(state.copyWith(
  //     hideAllTargetGroups: false,
  //     hideAllTargetGroupPlayBtns: false,
  //     hideTargetsExcept: null,
  //     force: state.force + 1,
  //   ));
  // }
  // Future<void> _unhideAllTargetBtns(event, emit) async {
  //   emit(state.copyWith(
  //     hideAllTargetGroupPlayBtns: false,
  //     force: state.force + 1,
  //   ));
  // }

// void _changedOrder(ChangedOrder event, emit) {
//   int newIndex = event.newIndex;
//   if (event.oldIndex < newIndex) {
//     newIndex -= 1;
//   }
//   List<TargetModel> newTargetList = List.of(state.imageTargets(event.wName));
//   final TargetModel item = newTargetList.removeAt(event.oldIndex);
//   newTargetList.insert(newIndex, item);
//   Map<String, List<TargetModel>> newTargetsMap = Map.of(state.targetGroupMap);
//   newTargetsMap[event.wName] = newTargetList;
//   emit(state.copyWith(
//     targetGroupMap: newTargetsMap,
//   ));
// }

// void clearSelection({bool reshowAllTargets = true}) {
//   bloc.add(CAPIEvent.clearSelection());
//   if (aTargetIsSelected(widget.name)) {
//     transformationController.removeListener(_onChangeTransformation);
//     fco.removeOverlayCalloutByFeature(CAPI.ANY_TOAST.feature(featureSeed), true);
//     targetListGK.currentState?.setState(() {
//       //measureIVchild();
//       Callout? targetCallout = FCO.om.findCallout(CAPI.TARGET_CALLOUT.feature((featureSeed), selectedTargetIndex));
//       if (targetCallout != null) {
//         selectedTarget!.setTargetLocalPosPc(Offset(targetCallout.left!, targetCallout.top!));
//         fco.logi("final callout pos (${targetCallout.left},${targetCallout.top})");
//         fco.logi("targetGlobalPos now: ${selectedTarget!.targetGlobalPos()}");
//       }
//       ivScale = 1.0;
//       ivTranslate = Offset.zero;
//       fco.logi("new child local pos (${selectedTarget!.childLocalPosLeftPc},${selectedTarget!.childLocalPosTopPc})");
//       // selectedTarget!.childLocalPosLeftPc = savedChildLocalPosPc!.dx;
//       // selectedTarget!.childLocalPosTopPc = savedChildLocalPosPc!.dy;
//       fco.logi("previous child local pos (${savedChildLocalPosPc!.dx},${savedChildLocalPosPc!.dy})");
//       int saveSelection = selectedTargetIndex;
//       selectedTargetIndex = -1;
//       transformationController.value = Matrix4.identity();
//       removeTextEditorCallout(this, selectedTargetIndex);
//       removeTargetCallout(this, saveSelection);
//     });
//   }
//   if (reshowAllTargets)
//     // show all targets unselected
//     fco.afterMsDelayDo(500, () {
//       showAllTargets();
//       // for (var tc in targets) {
//       //   showDraggableTargetCallout(this, tc, onReadyF: () {});
//       // }
//     });
// }

// void _clearSelection(ClearSelection event, emit) {
//   emit(state.copyWith(
//     selectedTarget: null,
//   ));
// }

// void _clearSelection(ClearSelection event, emit) {
//   if (state.aTargetIsSelected(widget.name)) {
//     TargetModel newTC = state.selectedTarget!.clone();
//     Map<String, List<TargetModel>> newTargetGroupListMap = {}..addAll(state.targetGroupMap);
//     newTC.setTargetLocalPosPc(
//       event.targetCalloutGlobalPos,
//       state.childMeasuredPositionMap[state.selectedTargetWrapperName]!,
//       state.childMeasuredSizeMap[state.selectedTargetWrapperName]!,
//     );
//     newTargetGroupListMap[state.selectedTargetWrapperName]![state.selectedTargetIndex(widget.name)] = newTC;
//     emit(state.copyWith(
//       targetGroupMap: newTargetGroupListMap,
//       selectedTarget: null,
//     ));
//   }
// }

// void _playSelection(event, emit) {
//   emit(state.copyWith());
// }

// void _changedCalloutPosition(ChangedCalloutPosition event, emit) {
//   TargetModel tc = event.tc.clone();
//   tc.calloutTopPc = event.newPos.dy / FCO.scrH;
//   tc.calloutLeftPc = event.newPos.dx / FCO.scrW;
//   Map<String, CAPITargetModelList> newTargetGroupListMap = _addOrUpdateTargetGroupListMap(tc.wName, tc);
//   emit(state.copyWith(
//     targetGroupMap: newTargetGroupListMap,
//     // selectedTarget: tc,
//     force: state.force + 1,
//   ));
// }

// void _changedCalloutDuration(ChangedCalloutDuration event, emit) {
//   TargetModel tc = event.tc.clone();
//   tc.calloutDurationMs = event.newDurationMs;
//   Map<String, CAPITargetModelList> newTargetGroupListMap = _addOrUpdateTargetGroupListMap(tc.wName, tc);
//   emit(state.copyWith(
//     targetGroupMap: newTargetGroupListMap,
//     // selectedTarget: tc,
//     force: state.force + 1,
//   ));
// }

// void _changedCalloutTextAlign(ChangedCalloutTextAlign event, emit) {
//   TargetModel tc = event.tc.clone();
//   tc.setTextAlign(event.newTextAlign);
//   Map<String, CAPITargetModelList> newTargetGroupListMap = _addOrUpdatetargetGroupMap(tc.wName, tc);
//   emit(state.copyWith(
//     targetGroupMap: newTargetGroupListMap,
//     // selectedTarget: tc,
//     force: state.force + 1,
//   ));
// }

// void _changedCalloutColor(ChangedCalloutColor event, emit) {
//   TargetModel tc = event.tc.clone();
//   tc.setCalloutColor(event.newColor);
//   Map<String, CAPITargetModelList> newTargetGroupListMap = _addOrUpdateTargetGroupListMap(tc.wName, tc);
//   emit(state.copyWith(
//     targetGroupMap: newTargetGroupListMap,
//     // selectedTarget: tc,
//     force: state.force + 1,
//   ));
// }

// void _changedCalloutTextStyle(ChangedCalloutTextStyle event, emit) {
//   TargetModel tc = event.tc.clone();
//   tc.setTextStyle(event.newTextStyle);
//   Map<String, CAPITargetModelList> newTargetGroupListMap = _addOrUpdatetargetGroupMap(tc.wName, tc);
//   emit(state.copyWith(
//     targetGroupMap: newTargetGroupListMap,
//     // selectedTarget: tc,
//     force: state.force + 1,
//   ));
// }

// void _changedTargetRadius(ChangedTargetRadius event, emit) {
//   TargetModel tc = event.tc.clone();
//   tc.radius = event.newRadius;
//   Map<String, CAPITargetModelList> newTargetGroupListMap = _addOrUpdateTargetGroupListMap(tc.wName, tc);
//   emit(state.copyWith(
//     targetGroupMap: newTargetGroupListMap,
//     // selectedTarget: tc,
//     force: state.force + 1,
//   ));
// }

// void _changedTransformScale(ChangedTransformScale event, emit) {
//   TargetModel tc = event.tc.clone();
//   tc.transformScale = event.newScale;
//   Map<String, CAPITargetModelList> newTargetGroupListMap = _addOrUpdateTargetGroupListMap(tc.wName, tc);
//   emit(state.copyWith(
//     targetGroupMap: newTargetGroupListMap,
//     // selectedTarget: tc,
//     force: state.force + 1,
//   ));
// }

// void _kbdHChanged(event, emit) {
//   emit(state.copyWith(
//     force: state.force + 1,
//   ));
// }

// // emits new state containing the new measurement
// void _measuredIV(MeasuredIV event, emit) {
//   Map<String, Rect> newIVRectMap = {};
//   newIVRectMap = Map.of(state.ivRectMap);
//   newIVRectMap[event.wName] = event.ivRect;
//   // if (state.ivRectMap[event.wName]?.size != event.ivRect.size) {
//   emit(state.copyWith(
//     ivRectMap: newIVRectMap,
//   ));
//   // }
// }

  // Map<String, TargetGroupModel> _addOrUpdateTargetGroupListMap(final String name, final TargetModel tc) {
  //   // replace or append tc in copy of its list
  //   TargetGroupModel newConfig = state.imageConfig(name) ?? TargetGroupModel([]);
  //   try {
  //     TargetModel oldTc = newConfig.targets.firstWhere((theTc) => theTc.uid == tc.uid);
  //     int oldTcIndex = newConfig.targets.indexOf(oldTc);
  //     if (oldTcIndex == -1) {
  //       newConfig.targets.add(tc);
  //     } else {
  //       newConfig.targets[oldTcIndex] = tc;
  //     }
  //   } catch (e) {
  //     newConfig.targets.add(tc);
  //   }
  //   // replace the list containing the tc
  //   Map<String, TargetGroupModel> newTargetGroupListMap = Map.of(state.targetGroupMap);
  //   newTargetGroupListMap[name] = newConfig;
  //   return newTargetGroupListMap;
  // }

// void _refreshToolCallouts() {
//   // fco.moveToByFeature(CAPI.BUTTONS_CALLOUT.feature(), buttonsCalloutInitialPos());
//   Callout? listViewCallout = FCO.om.findCallout(CAPI.TARGET_LISTVIEW_CALLOUT.feature());
//   fco.moveToByFeature(
//       CAPI.TARGET_LISTVIEW_CALLOUT.feature(), targetListCalloutInitialPos(widget.child is Scaffold, listViewCallout?.calloutH ?? 200));
//   bool? b = tseGK.currentState?.minimise;
//   fco.moveToByFeature(CAPI.STYLES_CALLOUT.feature(), stylesCalloutInitialPos(b ?? true));
// }

// Map<String, TargetModel> _parseTargets(CAPIModel model) {
//   Map<String, TargetModel> targetMap = {};
//   try {
//     for (String name in model.targetMap?.keys ?? []) {
//       TargetModel tc = model.targetMap![name]!;
//       tc.init(
//         this,
//         GlobalKey(debugLabel: name),
//         FocusNode(),
//         FocusNode(),
//       );
//       targetMap[name] = tc;
//     }
//   } catch (e) {
//     fco.logi("_parseImageTargets(): ${e.toString()}");
//     rethrow;
//   }
//   return targetMap;
// }

// static Future<void> _readSoundFiles(final String path, final bool localTestingFilePaths) async {
//   _soundpool = Soundpool.fromOptions(
//       options: const SoundpoolOptions(
//     streamType: StreamType.notification,
//   ));
//   var asset = await rootBundle.load(localTestingFilePaths
//       ? "lib/src/sounds/178186__snapper4298__camera-click-nikon.wav"
//       : "${pkg_flutter_content}lib/src/sounds/178186__snapper4298__camera-click-nikon.wav");
//   _shutterSoundId = await _soundpool?.load(asset);
//   asset = await rootBundle.load(
//       localTestingFilePaths ? "lib/src/sounds/447910__breviceps__plop.wav" : "${pkg_flutter_content}lib/src/sounds/447910__breviceps__plop.wav");
//   _plopSoundId = await _soundpool?.load(asset);
//   asset = await rootBundle.load(localTestingFilePaths
//       ? "lib/src/sounds/394415__inspectorj__bamboo-swing-a1.wav"
//       : "${pkg_flutter_content}lib/src/sounds/394415__inspectorj__bamboo-swing-a1.wav");
//   _whooshSoundId = await _soundpool?.load(asset);
//   asset = await rootBundle.load(localTestingFilePaths
//       ? "lib/src/sounds/250048__kwahmah-02__sits6.wav"
//       : "${pkg_flutter_content}lib/src/sounds/250048__kwahmah-02__sits6.wav");
//   _errorSoundId = await _soundpool?.load(asset);
// }
//
// Future<void> playShutterSound() async {
//   await CAPIBloc.possiblyLoadSounds(state);
//   if (_soundpool != null && _shutterSoundId != null) await _soundpool!.play(_shutterSoundId!);
// }
//
// Future<void> playPlopSound() async {
//   await CAPIBloc.possiblyLoadSounds(state);
//   if (_soundpool != null && _plopSoundId != null) await _soundpool!.play(_plopSoundId!);
// }
//
// Future<void> playWhooshSound() async {
//   await CAPIBloc.possiblyLoadSounds(state);
//   if (_soundpool != null && _whooshSoundId != null) await _soundpool!.play(_whooshSoundId!);
// }
//
// Future<void> playErrorSound(state) async {
//   await CAPIBloc.possiblyLoadSounds(state);
//   if (_soundpool != null && _errorSoundId != null) await _soundpool!.play(_errorSoundId!);
// }

// TargetModel? selectedTC() => state.selectedTarget;

// static Offset m4ToTranslation(Matrix4 m) {
//   math.Vector3 translation = math.Vector3.zero();
//   math.Quaternion rotation = math.Quaternion.identity();
//   math.Vector3 scale = math.Vector3.zero();
//   m.decompose(translation, rotation, scale);
//   return Offset(translation.x, translation.y);
// }
//
// static double m4ToScale(Matrix4 m) {
//   math.Vector3 translation = math.Vector3.zero();
//   math.Quaternion rotation = math.Quaternion.identity();
//   math.Vector3 scale = math.Vector3.zero();
//   m.decompose(translation, rotation, scale);
//   return scale.b;
// }

//
// content editor
//

// void _showNodeProperties(ShowNodeProperties event, emit) {
//   if (event.tc != null) {
//     SnippetNode snippet = state.snippetTreeC.roots.toList()[event.nodeRootIndex] as SnippetNode;
//     event.tc!.snippetName = snippet.name;
//     if (event.nodeParent is MultiChildNode) {
//       state.snippetTreeC.collapse(event.node);
//     }
//     Map<String, CAPITargetModel> newTargetGroupListMap = _addOrUpdatetargetGroupMap(event.tc!.wName, event.tc!);
//     emit(state.copyWith(
//       targetGroupMap: newTargetGroupListMap,
//       movedNodeId: null,
//       selectedNode: event.node,
//       showAdders: event.showAdders,
//       showProperties: event.showProperties,
//       selectedNodeParent: event.nodeParent,
//       lastAddedNode: null,
//       force: state.force + 1,
//     ));
//   } else {
//     emit(state.copyWith(
//       movedNodeId: null,
//       selectedNode: event.node,
//       showAdders: event.showAdders,
//       showProperties: event.showProperties,
//       selectedNodeParent: event.nodeParent,
//       lastAddedNode: null,
//       force: state.force + 1,
//     ));
//   }
// }

// void _updateNodeTxt(UpdateNodeTxt event, emit) {
// if (event.node != null) {
//   if (event.node!.txt != event.theNewTxt) {
//     event.node!.setTxt(event.theNewTxt);
//   }
// } else if (event.isBeginNode && state.flowchart.beginTxt != event.theNewTxt) {
//   state.flowchart.beginTxt = event.theNewTxt;
//   //developer.log('new beginTxt size is ${fbe.txtSize.width} ${fbe.txtSize.height}');
// } else if (event.isEndNode && state.flowchart.endTxt != event.theNewTxt) {
//   state.flowchart.endTxt = event.theNewTxt;
// }
// emit(state.copyWith(
//   force: state.force + 1,
// ));
// }

  // void _saveNodeAsSnippet(SaveNodeAsSnippet event, emit) {
  //   _createSnippetUndo();
  //
  //   _possiblyRemoveFromParent();
  //
  //   // create new snippet
  //   SnippetNode newSnippetNode = SnippetNode(
  //     name: event.newSnippetName,
  //     child: event.node,
  //   );
  //   // add to snippets map
  //   FCO.capiBloc.add(capiEvent.CreatedSnippet(newNode: newSnippetNode));
  //   // create a snippet ref node
  //   SnippetRefNode refNode = SnippetRefNode(snippetName: event.newSnippetName);
  //   // attach to parent
  //   if (state.selectedNodeParent is SingleChildNode) {
  //     (state.selectedNodeParent as SingleChildNode).child = refNode;
  //   } else if (state.selectedNodeParent is MultiChildNode) {
  //     (state.selectedNodeParent as MultiChildNode).children.add(refNode);
  //   } else if (state.selectedNodeParent is WidgetSpanNode) {
  //     (state.selectedNodeParent as WidgetSpanNode).child = refNode;
  //   }
  //   state.treeC.expand(newSnippetNode);
  //   state.treeC.rebuild();
  //
  //   emit(state.copyWith(
  //     selectedNode: refNode,
  //     force: state.force + 1,
  //   ));
  //   // }
  // }

  void _selectPanel(SelectPanel event, emit) {
    // null clears selection
    emit(state.copyWith(
      selectedPanel: event.panelName,
      force: state.force + 1,
    ));
  }

  void _pushSnippetEditor(PushSnippetEditor event, emit) {
    SnippetTreeController newTreeC() => SnippetTreeController(
          roots: event.visibleDecendantNode != null
              ? [event.visibleDecendantNode!]
              : [event.rootNode],
          childrenProvider: Node.snippetTreeChildrenProvider,
          parentProvider: Node.snippetTreeParentProvider,
        );

    SnippetBeingEdited snippetBeingEdited = SnippetBeingEdited(
      rootNode: event.rootNode,
      jsonBeforePush: event.rootNode.toJson(),
      treeC: newTreeC()..expandAll(),
    );

    emit(state.copyWith(
      // hideAllTargetGroupPlayBtns: true,
      // hideTargetsExcept: null,
      snippetBeingEdited: snippetBeingEdited,
      hideSnippetPencilIcons: true,
      onlyTargetsWrappers: true,
    ));
    emit(state.copyWith(
      onlyTargetsWrappers: false,
    ));
  }

  Future<void> _popSnippetEditor(PopSnippetEditor event, emit) async {
    if (!(state.snippetBeingEdited?.aNodeIsSelected ?? false)) return;
    if (event.save) {
      //TODO save snippet
    }
    emit(state.copyWith(
      snippetBeingEdited: null,
      hideIframes: false,
      hideSnippetPencilIcons: false,
    ));
  }

  // Future<void> _restoredSnippetBloc(RestoredSnippetBloc event, emit) async {
  //   SnippetBloC? beforeUndoOrRedo = FCO.popSnippet();
  //   FCO.pushSnippet(event.restoredBloc);
  //   // CAPIState.snippetStateMap[beforeUndoOrRedo.snippetName] = event.restoredBloc.state;
  //   // Map<SnippetName, SnippetRootNode> newSnippetsMap = Map<SnippetName, SnippetRootNode>.of(FCO.snippetsMap);
  //   SnippetRootNode rootNode = event.restoredBloc.rootNode;
  //   FCO.snippetsMap[rootNode.name] = rootNode;
  //
  //   emit(state.copyWith(
  //     // snippetsMap: newSnippetsMap,
  //     force: state.force + 1,
  //   ));
  // }

  void _setPanelOrPlaceholderSnippet(SetPanelSnippet event, emit) {
    fco.snippetPlacementMap[event.panelName] = event.snippetName;
    emit(state.copyWith(
      force: state.force + 1,
    ));
  }

// void _dockChangeSnippetEditor(DockChangeSnippetEditor event, emit) {
//   DockEnum newDock;
//   DockEnum oldDock = state.snippetEditorDock ?? DockEnum.undocked;
//   if (oldDock == DockEnum.undocked)
//     newDock = DockEnum.onRight;
//   else if (oldDock == DockEnum.onRight)
//     newDock = DockEnum.onLeft;
//   else
//     newDock = DockEnum.undocked;
//
//   emit(state.copyWith(
//     snippetEditorDock: newDock,
//     force: state.force + 1,
//   ));
// }

// Future<void> _changedSnippetTreeCalloutSize(ChangedSnippetTreeCalloutSize event, emit) async {
//   CAPIState newState = state.copyWith(
//     force: state.force + 1,
//     snippetTreeCalloutW: event.newW,
//     snippetTreeCalloutH: event.newH,
//   );
//   emit(newState);
// }
//
// Future<void> _changedSnippetTreeCalloutPos(ChangedSnippetTreeCalloutPos event, emit) async {
//   CAPIState newState = state.copyWith(
//     force: state.force + 1,
//     snippetTreeCalloutInitialPos: event.newOffset,
//   );
//   emit(newState);
// }

// void _changedSnippetPropertiesCalloutSize(ChangedSnippetPropertiesCalloutSize event, emit) {
//   // fco.logi('Snippet Properties Callout Size: ${event.newW} x ${event.newH}');
//   emit(state.copyWith(
//     force: state.force + 1,
//     snippetPropertiesCalloutW: event.newW,
//     snippetPropertiesCalloutH: event.newH,
//   ));
// }

// void _changedSnippetName(ChangedSnippetName event, emit) {
//   state.ur.createUndo(state.snippetTreeC.roots ?? [], state.snippetTreeC.expandedNodes);
//   event.tc.snippetName = event.newName;
//   emit(state.copyWith(
//     force: state.force + 1,
//   ));
// }

// Future<void> _pickedAColor(PickedAColor event, emit) async {
//   state.ur.createUndo(state.snippetTreeC.roots ?? [], state.snippetTreeC.expandedNodes);
//   if (event.node is ContainerNode) {
//     (event.node as ContainerNode).colorValue = event.color.value;
//   } else if (event.node is DefaultTextStyleNode) {
//     NodeTextStyle style = (event.node as DefaultTextStyleNode).style ?? NodeTextStyle();
//     style.colorValue = event.color.value;
//     (event.node as DefaultTextStyleNode).style = style;
//   } else if (event.node is TextNode) {
//     NodeTextStyle style = (event.node as TextNode).style ?? NodeTextStyle();
//     style.colorValue = event.color.value;
//     (event.node as TextNode).style = style;
//   } else if (event.node is TextSpanNode) {
//     NodeTextStyle style = (event.node as TextSpanNode).style ?? NodeTextStyle();
//     style.colorValue = event.color.value;
//     (event.node as TextSpanNode).style = style;
//   }
//   emit(
//     state.copyWith(
//       ur: state.ur,
//       force: state.force + 1,
//     ),
//   );
// }
//
// Future<void> _textChanged(TextChanged event, emit) async {
//   state.ur.createUndo(state.snippetTreeC.roots ?? [], state.snippetTreeC.expandedNodes);
//   if (event.node is TextNode) {
//     (event.node as TextNode).text = event.newText;
//   } else if (event.node is TextSpanNode) {
//     (event.node as TextSpanNode).text = event.newText;
//   }
//   emit(
//     state.copyWith(
//       ur: state.ur,
//       force: state.force + 1,
//     ),
//   );
// }

// void _clearUR(ClearUR event, emit) {
//   state.ur.clear();
//   emit(
//     state.copyWith(
//       ur: state.ur,
//       force: state.force + 1,
//     ),
//   );
// }

// the tree nodes do not have a reference to their parent BloC object

//==========================================================================================
//====  SNIPPET EDITING  ===================================================================
//==========================================================================================
  void _forceSnippetRefresh(event, emit) {
    fco.logi("forceSnippetRefresh");
    emit(state.copyWith(
      force: state.force + 1,
    ));
  }

  void _selectNode(SelectNode event, emit) {
    // if (!(state.snippetBeingEdited?.aNodeIsSelected ?? false)) return;

    // if (event.imageTC != null) {
    //   // tc not null means editing a snippet and updating the wrapped target (that will show the snippet in a callout)
    //   SnippetNode snippet = state.snippetTreeC.roots.toList()[event.nodeRootIndex] as SnippetNode;
    //   event.imageTC!.snippetName = snippet.name;
    //   if (event.nodeParent is MultiChildNode) {
    //     state.snippetTreeC.collapse(event.node);
    //     // state.snippetTreeC.rebuild();
    //   }
    //   Map<String, TargetGroupModel> newTargetGroupListMap = _addOrUpdateTargetGroupListMap(event.imageTC!.wName, event.imageTC!);
    //   emit(state.copyWith(
    //     multiTargetListMap: newTargetGroupListMap,
    //
    //     selectedNode: event.node,
    //     selectedTarget: event.imageTC,
    //     showAdders: event.showAdders,
    //     showProperties: event.showProperties,
    //     selectedNodeParent: event.nodeParent,
    //
    //   ));
    // } else {
    // tc null means just editing a Snippet
    // STreeNode snode = event.node;
    // // create a bloc for the selected node
    // STreeNodeBloc newBloc = STreeNodeBloc(node: snode);

    // if new selection is a node above this tree root, reset the tree's root to it
    bool resetTree = !state.snippetBeingEdited!.treeC.nodeIsADescendantOf(
      state.snippetBeingEdited!.treeC.roots.first,
      event.node,
    );
    // TreeSearchResult<STreeNode> result =
    //     state.treeC.search((snode) => snode == event.node);
    SnippetTreeController possiblyNewTreeC = state.snippetBeingEdited!.treeC;
    if (resetTree) {
      possiblyNewTreeC = SnippetTreeController(
        roots: [event.node],
        childrenProvider: Node.snippetTreeChildrenProvider,
        parentProvider: Node.snippetTreeParentProvider,
      ); //..expandAll();
    }
    state.snippetBeingEdited!.treeC = possiblyNewTreeC;
    state.snippetBeingEdited!.selectedNode = event.node;
    // state.snippetBeingEdited!.selectedTreeNodeGK = event.selectedTreeNodeGK;
    state.snippetBeingEdited!.showProperties = true;
    state.snippetBeingEdited!.nodeBeingDeleted = null;

    emit(state.copyWith(
      force: state.force + 1,
    ));
  }

  void _clearNodeSelection(event, emit) {
    if (!(state.snippetBeingEdited?.aNodeIsSelected ?? false)) return;
    state.snippetBeingEdited!.selectedNode = null;
    state.snippetBeingEdited!.showProperties = false;
    emit(state.copyWith(
      force: state.force + 1,
    ));
  }

  Future<void> _deleteNodeTapped(DeleteNodeTapped event, emit) async {
    if (!(state.snippetBeingEdited?.aNodeIsSelected ?? false)) return;
    state.snippetBeingEdited!.nodeBeingDeleted =
        state.snippetBeingEdited!.selectedNode;
    emit(state.copyWith(
      force: state.force + 1,
    ));
  }

  Future<void> _completeDeletion(CompleteDeletion event, emit) async {
    if (!(state.snippetBeingEdited?.aNodeIsSelected ?? false)) return;
    //_createSnippetUndo();
    // STreeNode? sel = state.selectedNode;
    // STreeNode? selParent = sel?.getParent() as STreeNode?;
    STreeNode newSel = _possiblyRemoveFromParentButNotChildren();
    SnippetTreeController possiblyNewTreeC = state.snippetBeingEdited!.treeC;
    if (newSel.getParent() is SnippetRootNode) {
      possiblyNewTreeC = SnippetTreeController(
        roots: [newSel],
        childrenProvider: Node.snippetTreeChildrenProvider,
        parentProvider: Node.snippetTreeParentProvider,
      );
    }
    possiblyNewTreeC.rebuild();
    // fco.logi("--------------");
    // fco.logi(state.snippetTreeC.roots.first.toMap());
    state.snippetBeingEdited!.treeC = possiblyNewTreeC;
    state.snippetBeingEdited!.nodeBeingDeleted = null;
    state.snippetBeingEdited!.selectedNode = newSel;
    emit(state.copyWith(
      snippetBeingEdited: state.snippetBeingEdited,
      force: state.force + 1,
    ));
  }

  STreeNode _possiblyRemoveFromParentButNotChildren() {
    STreeNode sel = state.snippetBeingEdited!.selectedNode!;
    // node to be deleted must have a parent
    if (sel.getParent() == null) return sel;
    STreeNode selParent = sel.getParent() as STreeNode;
    late STreeNode newSel;
    // tab-related
    if (sel.isAScaffoldTabWidget() && !sel.hasChildren()) {
      int index = (selParent as TabBarNode).children.indexOf(sel);
      selParent.children.remove(sel);
      ScaffoldNode? scaffold =
          selParent.getParent()?.getParent()?.getParent() as ScaffoldNode?;
      if (scaffold?.body?.child is TabBarViewNode?) {
        (scaffold!.body?.child as TabBarViewNode).children.removeAt(index);
      }
      newSel = selParent;
      // tabView-related
    } else if (sel.isAScaffoldTabViewWidget() && !sel.hasChildren()) {
      int index = (selParent as TabBarViewNode).children.indexOf(sel);
      selParent.children.remove(sel);
      ScaffoldNode? scaffold =
          selParent.getParent()?.getParent() as ScaffoldNode?;
      if (scaffold?.appBar?.bottom?.child is TabBarNode?) {
        (scaffold?.appBar!.bottom!.child as TabBarNode)
            .children
            .removeAt(index);
      }
      newSel = selParent;
    } else if (sel is StepNode && selParent is StepperNode) {
      selParent.children.remove(sel);
      newSel = selParent;
    } else if (sel is PollOptionNode && selParent is PollNode) {
      selParent.children.remove(sel);
      newSel = selParent;
    } else if (selParent is SnippetRootNode && sel is CL) {
      STreeNode ph = PlaceholderNode()..setParent(selParent);
      newSel = selParent.child = ph;
    } else if (selParent is SnippetRootNode && sel is SC && sel.child == null) {
      STreeNode ph = PlaceholderNode()..setParent(selParent);
      newSel = selParent.child = ph;
    } else if (selParent is SnippetRootNode &&
        sel is MC &&
        sel.children.isEmpty) {
      STreeNode ph = PlaceholderNode()..setParent(selParent);
      newSel = selParent.child = ph;
    } else if (selParent is SC && (sel is CL || sel is SnippetRootNode)) {
      selParent.child = null;
      newSel = selParent;
    } else if (selParent is SC && sel is SC) {
      selParent.child = sel.child?..setParent(selParent);
      newSel = selParent;
    } else if (selParent is SC && sel is MC && sel.children.isEmpty) {
      selParent.child = null;
      newSel = selParent;
    } else if (selParent is SC && sel is MC && sel.children.length < 2) {
      selParent.child = sel.children.first..setParent(selParent);
      newSel = selParent;
    } else if (selParent is MC && (sel is CL || sel is SnippetRootNode)) {
      selParent.children.remove(sel);
      newSel = selParent;
    } else if (selParent is MC && sel is SC && sel.child != null) {
      int index = selParent.children.indexOf(sel);
      selParent.children[index] = sel.child!..setParent(selParent);
      newSel = selParent;
    } else if (selParent is MC && sel is MC && sel.children.length == 1) {
      int index = selParent.children.indexOf(sel);
      selParent.children[index] = sel.children.first..setParent(selParent);
      newSel = selParent;
    } else if (selParent is MC &&
        ((sel is SC && sel.child == null) ||
            (sel is MC && sel.children.isEmpty))) {
      selParent.children.remove(sel);
      newSel = selParent;
    } else if (selParent is RichTextNode &&
        sel is TextSpanNode &&
        sel.children?.length == 1) {
      selParent.text = sel.children!.first..setParent(selParent);
      newSel = selParent;
    } else if (selParent is RichTextNode &&
        (sel is WidgetSpanNode ||
            sel is TextSpanNode && sel.children?.length != 1)) {
      selParent.text = TextSpanNode(text: 'xxx')..setParent(selParent);
      newSel = selParent;
    } else if (selParent is TextSpanNode) {
      selParent.children!.remove(sel);
      newSel = selParent;
    } else if (selParent is GenericSingleChildNode &&
        selParent.propertyName == 'title') {
      selParent.child = TextNode(text: 'must have a title widget!')
        ..setParent(selParent);
      newSel = selParent;
    } else if (selParent is GenericSingleChildNode &&
        selParent.propertyName == 'content') {
      selParent.child = TextNode(text: 'must have a content widget!')
        ..setParent(selParent);
      newSel = selParent;
    }

    if (newSel is SnippetRootNode &&
        newSel.getParent() == null &&
        newSel.child != null) {
      newSel = newSel.child!;
    }
    return newSel;
  }

  // void _possiblyRemoveFromParentButNotChildrenOLD() {
  //   try {
  //   STreeNode? selectedNode = state.selectedNode;
  //   if (selectedNode != null) {
  //     if (selectedNode != state.rootNode) {
  //       STreeNode parentNode = selectedNode.parent as STreeNode;
  //       if (parentNode is SC && selectedNode is SC) {
  //         parentNode.child = selectedNode.child;
  //         selectedNode.child?.setParent(parentNode);
  //       } else if (parentNode is MC && selectedNode is SC) {
  //         int index = parentNode.children.indexOf(selectedNode);
  //         if (selectedNode.child != null) {
  //           parentNode.children[index] = selectedNode.child!;
  //           selectedNode.child?.setParent(parentNode);
  //         }
  //       }
  //       if (selectedNode is MC && selectedNode.children.length == 1) {
  //         if (parentNode is SC) {
  //           parentNode.child = selectedNode.children.first;
  //         } else if (parentNode is MC) {
  //           int index = parentNode.children.indexOf(selectedNode);
  //           parentNode.children[index] = selectedNode.children.first;
  //         }
  //         if (parentNode is SnippetRootNode && parentNode.child == null) {
  //           parentNode.child = PlaceholderNode()
  //             ..setParent(parentNode);
  //         }
  //       } else if (parentNode is SC) {
  //         parentNode.child = null;
  //         if (parentNode is SnippetRootNode) {
  //           parentNode.child = PlaceholderNode()
  //             ..setParent(parentNode);
  //         }
  //       } else if (parentNode is MC) {
  //         int i = (parentNode).children.indexOf(selectedNode);
  //         if (parentNode is TabBarNode) {
  //           TabBarNode? tabBarNode = state.treeC.findNodeTypeInTree(rootNode, TabBarNode) as TabBarNode?;
  //           if (tabBarNode != null) {
  //             int numTabs = tabBarNode.children.length;
  //             tabBarNode.children.removeAt(i);
  //             TabBarViewNode? tabBarViewNode = state.treeC.findNodeTypeInTree(rootNode, TabBarViewNode) as TabBarViewNode?;
  //             if (numTabs == tabBarViewNode?.children.length) {
  //               tabBarViewNode?.children.removeAt(i);
  //             }
  //           }
  //         } else if (parentNode is TabBarViewNode) {
  //           TabBarViewNode? tabBarViewNode = state.treeC.findNodeTypeInTree(rootNode, TabBarViewNode) as TabBarViewNode?;
  //           if (tabBarViewNode != null) {
  //             int numTabs = tabBarViewNode.children.length;
  //             tabBarViewNode.children.removeAt(i);
  //             TabBarNode? tabBarNode = state.treeC.findNodeTypeInTree(rootNode, TabBarNode) as TabBarNode?;
  //             if (numTabs == tabBarNode?.children.length) {
  //               tabBarNode?.children.removeAt(i);
  //             }
  //           }
  //         } else {
  //           parentNode.children.removeAt(i);
  //         }
  //       } else if (parentNode is TextSpanNode) {
  //         if (parentNode.children!.length > 1) {
  //           parentNode.children!.remove(selectedNode);
  //         } else {
  //           parentNode.children = null;
  //         }
  //       }
  //     }
  //   }
  //   } catch (e) {
  //     fco.logi("\n ***  _possiblyRemoveFromParentButNotChildren() - null selectedNode.parent!  ***");
  //     rethrow;
  //   }
  // }

  Future<void> _cutNode(CutNode event, emit) async {
    if (!(state.snippetBeingEdited?.aNodeIsSelected ?? false)) return;
    //_createSnippetUndo();
    _cutIncludingAnyChildren(event.node);
    state.snippetBeingEdited!.treeC.rebuild();
    // bool well = state.rootNode.anyMissingParents();
    add(CAPIEvent.updateClipboard(
        newContent: event.node, skipSave: event.skipSave));
  }

  _cutIncludingAnyChildren(STreeNode node) {
    if (!(state.snippetBeingEdited?.aNodeIsSelected ?? false)) return;
    if (node != state.snippetBeingEdited!.rootNode) {
      // was: if (state.selectedNode?.parent != null) {
      STreeNode parentNode = node.getParent() as STreeNode;
      if (parentNode is SC) {
        parentNode.child = null;
      } else if (parentNode is MC) {
        parentNode.children.remove(node);
      } else if (parentNode is TextSpanNode) {
        parentNode.children?.remove(node);
      }
    }
  }

  // void _removeSiblingForReinsertion(RemoveSiblingForReinsertion event, emit) {
  //   int fromPos = event.parentNode.children.indexOf(event.node);
  //   // remove node from children
  //   event.parentNode.children.remove(event.node);
  //   state.snippetBeingEdited!.treeC.rebuild();
  //   // emit(state.copyWith(
  //   //   force: state.force + 1,
  //   // ));
  //   // side effect : will effectively cause a replacement node to be appended
  //   add(
  //     CAPIEvent.reinsertSibling(
  //       parentNode: event.parentNode,
  //       node: event.node,
  //       atPos: event.atPos,
  //     ),
  //   );
  // }
  //
  // void _reinsertSibling(ReinsertSibling event, emit) {
  //   event.parentNode.children.insert(event.atPos, event.node);
  //   // remove last (dummy) child
  //   event.parentNode.children.removeLast();
  //   state.snippetBeingEdited!.treeC.rebuild();
  //   emit(state.copyWith(
  //     force: state.force + 1,
  //   ));
  // }

  // Future<void> _cutNode(CutNode event, emit) async {
  //   //_createSnippetUndo();
  //   STreeNode selectedNode = event.node;
  //   String cutJson = selectedNode.toJson();
  //   if (selectedNode != state.rootNode) {
  //     // hook child(ren) up to deleted node's parent
  //     {
  //       if (selectedNode is SingleChildNode) {
  //         STreeNode? child = selectedNode.child;
  //         child?.parent = selectedNode.parent;
  //       }
  //       if (selectedNode is MultiChildNode && selectedNode.parent is MultiChildNode) {
  //         for (STreeNode child in (selectedNode).children) {
  //           child.parent = selectedNode.parent;
  //         }
  //       }
  //       if (selectedNode is TextSpanNode && selectedNode.parent is TextSpanNode) {
  //         List<InlineSpanNode>? children = selectedNode.children;
  //         if (children?.isNotEmpty ?? false) {
  //           for (InlineSpanNode child in children!) {
  //             child.parent = selectedNode.parent;
  //           }
  //         }
  //       }
  //     }
  //     // parent to deleted node's children
  //     STreeNode parentNode = selectedNode.parent as STreeNode;
  //     if (parentNode is SingleChildNode && selectedNode is SingleChildNode) {
  //       parentNode.child = selectedNode.child;
  //     } else if (parentNode is MultiChildNode && selectedNode is MultiChildNode) {
  //       parentNode.children = selectedNode.children;
  //     }
  //   }
  //   state.treeC.rebuild();
  //   FCO.capiBloc.add(CAPIEvent.updateClipboard(newContent: cutJson));
  // }

  Future<void> _copyNode(CopyNode event, emit) async {
    if (!(state.snippetBeingEdited?.aNodeIsSelected ?? false)) return;
    var copiedNode = event.node.clone();
    fco.setClipboard(copiedNode);
    emit(state.copyWith(
      force: state.force + 1,
    ));
    if (event.skipSave) return;
    fco.modelRepo.saveAppInfo();
    fco.hideClipboard();
    fco.showFloatingClipboard();
  }

  STreeNode _typeAsATreeNode(Type t, STreeNode? childNode, String notFoundMsg,
          {SnippetName? snippetName}) =>
      switch (t) {
        const (AlignNode) =>
          AlignNode(child: childNode, alignment: AlignmentEnum.topLeft),
        const (AspectRatioNode) => AspectRatioNode(child: childNode),
        const (AssetImageNode) => AssetImageNode(),
        const (AlgCNode) => AlgCNode(),
        const (UMLImageNode) => UMLImageNode(),
        const (FSImageNode) => FSImageNode(),
        const (FirebaseStorageImageNode) => FirebaseStorageImageNode(),
        const (CarouselNode) =>
          CarouselNode(children: childNode != null ? [childNode] : []),
        const (CenterNode) => CenterNode(child: childNode),
        const (ChipNode) => ChipNode(),
        const (ColumnNode) => ColumnNode(
            mainAxisSize: MainAxisSizeEnum.max,
            children: childNode != null ? [childNode] : []),
        const (ContainerNode) =>
          state.snippetBeingEdited!.selectedNode?.getParent() is ContainerNode
              ? ContainerNode(child: childNode, alignment: AlignmentEnum.center)
              : ContainerNode(child: childNode),
        // const (ContentSnippetRootNode) => ContentSnippetRootNode(name: 'content', child: childNode),
        const (DefaultTextStyleNode) => DefaultTextStyleNode(
            child: childNode,
            textStyleGroup:
                TextStyleGroup(fontSizeName: Material3TextSizeEnum.bodyM)),
        // const (FSBucketNode) => FSBucketNode(
        //     name: 'bucket name missing ?',
        //     root: GenericSingleChildNode(
        //         propertyName: 'root',
        //         child: FSDirectoryNode(name: 'root', children: []))),
        const (DirectoryNode) => DirectoryNode(children: []),
        // const (FSDirectoryNode) => FSDirectoryNode(children: []),
        const (ExpandedNode) => ExpandedNode(child: childNode),
        const (ElevatedButtonNode) =>
          ElevatedButtonNode(child: TextNode(text: 'some-text')),
        const (FileNode) => FileNode(name: '', src: ''),
        // const (FSFileNode) => FSFileNode(name: ''),
        const (FilledButtonNode) =>
          FilledButtonNode(child: TextNode(text: 'some-text')),
        const (FlexibleNode) => FlexibleNode(child: childNode),
        const (GapNode) => GapNode(gap: 0),
        const (GoogleDriveIFrameNode) => GoogleDriveIFrameNode(),
        const (IconButtonNode) => IconButtonNode(),
        const (IFrameNode) => IFrameNode(),
        const (MarkdownNode) => MarkdownNode(),
        const (MenuBarNode) => MenuBarNode(children: []),
        const (MenuItemButtonNode) =>
          MenuItemButtonNode(child: TextNode(text: 'item-text')),
        const (OutlinedButtonNode) => OutlinedButtonNode(),
        const (PaddingNode) =>
          PaddingNode(padding: EdgeInsetsValue(), child: childNode),
        const (PlaceholderNode) => PlaceholderNode(),
        const (PollNode) => PollNode(
            name: 'sample-poll',
            title: 'Sample Poll',
            children: [
              PollOptionNode(text: 'option 1 text?'),
              PollOptionNode(text: 'option 2 text?'),
              PollOptionNode(text: 'option 3 text?'),
            ],
          ),
        const (PollOptionNode) =>
          PollOptionNode(text: 'new option text?'),
        const (PositionedNode) =>
          PositionedNode(top: 0, left: 0, child: childNode),
        const (RichTextNode) => RichTextNode(
            text: TextSpanNode(
                text: 'rich',
                textStyleGroup: TextStyleGroup(colorValue: Colors.blue.value),
                children: [
                  TextSpanNode(text: '-'),
                  TextSpanNode(
                      text: '-text',
                      textStyleGroup:
                          TextStyleGroup(colorValue: Colors.red.value)),
                ]),
          ),
        const (RowNode) =>
          RowNode(children: childNode != null ? [childNode] : []),
        const (ScaffoldNode) => ScaffoldNode(
            appBar: AppBarNode(
              bgColorValue: Colors.grey.value,
              title: GenericSingleChildNode(
                propertyName: 'title',
                child: TextNode(text: 'my title'),
              ),
            ),
            body:
                GenericSingleChildNode(propertyName: 'body', child: childNode),
          ),
        const (SingleChildScrollViewNode) =>
          SingleChildScrollViewNode(child: childNode),
        const (SizedBoxNode) => SizedBoxNode(child: childNode),
        const (SnippetRootNode) => SnippetRootNode(name: snippetName!),
        const (SplitViewNode) => SplitViewNode(
            children: childNode != null
                ? [childNode]
                : [
                    CenterNode(
                        child: ContainerNode(
                            fillColorValues: UpTo6ColorValues(
                                color1Value: Colors.red.value))),
                    CenterNode(
                        child: ContainerNode(
                            fillColorValues: UpTo6ColorValues(
                                color1Value: Colors.blue.value))),
                  ]),
        const (StackNode) =>
          StackNode(children: childNode != null ? [childNode] : []),
        const (StepNode) => StepNode(
            title: GenericSingleChildNode(
                propertyName: 'title', child: TextNode(text: 'step title')),
            subtitle: GenericSingleChildNode(
                propertyName: 'subtitle', child: TextNode(text: 'subtitle')),
            content: GenericSingleChildNode(
                propertyName: 'content', child: TextNode(text: 'content')),
          ),
        const (StepperNode) => StepperNode(children: [
            StepNode(
              title: GenericSingleChildNode(
                  propertyName: 'title', child: TextNode(text: 'step 1 title')),
              subtitle: GenericSingleChildNode(
                  propertyName: 'subtitle', child: TextNode(text: 'subtitle')),
              content: GenericSingleChildNode(
                  propertyName: 'content',
                  child: TextNode(text: 'my content 1')),
            ),
            StepNode(
              title: GenericSingleChildNode(
                  propertyName: 'title', child: TextNode(text: 'step 2 title')),
              subtitle: GenericSingleChildNode(
                  propertyName: 'subtitle', child: TextNode(text: 'subtitle')),
              content: GenericSingleChildNode(
                  propertyName: 'content',
                  child: TextNode(text: 'my content 2')),
            ),
            StepNode(
              title: GenericSingleChildNode(
                  propertyName: 'title', child: TextNode(text: 'step 3 title')),
              subtitle: GenericSingleChildNode(
                  propertyName: 'subtitle', child: TextNode(text: 'subtitle')),
              content: GenericSingleChildNode(
                  propertyName: 'content',
                  child: TextNode(text: 'my content 3')),
            ),
          ]),
        const (SubmenuButtonNode) =>
          SubmenuButtonNode(menuChildren: childNode != null ? [childNode] : []),
        // const (SubtitleSnippetRootNode) => SubtitleSnippetRootNode(name: 'subtitle', child: childNode),
        // const (TargetButtonNode) =>
        //   TargetButtonNode(name: 'no name!', child: childNode),
        const (HotspotsNode) => HotspotsNode(child: childNode),
        const (TabBarNode) =>
          TabBarNode(children: childNode != null ? [childNode] : []),
        const (TabBarViewNode) =>
          TabBarViewNode(children: childNode != null ? [childNode] : []),
        const (TextButtonNode) =>
          TextButtonNode(child: TextNode(text: 'some-text')),
        const (TextNode) => TextNode(text: 'some-text'),
        const (TextSpanNode) => TextSpanNode(children: []),
        const (WidgetSpanNode) => WidgetSpanNode(child: childNode),
        const (WrapNode) =>
          WrapNode(children: childNode != null ? [childNode] : []),
        const (YTNode) => YTNode(),
        _ => throw (Exception(notFoundMsg)),
      };

  void _wrapWith(WrapSelectionWith event, emit) {
    if (!(state.snippetBeingEdited?.aNodeIsSelected ?? false)) return;

    STreeNode wChild = state.snippetBeingEdited!.selectedNode!;
    STreeNode? parent = wChild.getParent() as STreeNode?;
    STreeNode w = event.type != null
        ? _typeAsATreeNode(
            event.type!,
            wChild,
            "_wrapWith() missing ${event.type.toString()}",
            snippetName: event.snippetName,
          )
        : event.testNode!;

    if (w is CL || w is WidgetSpanNode) return;
    if (wChild is InlineSpanNode && w is! InlineSpanNode) return;
    if (w is PollNode && wChild is! PollOptionNode) return;
    if (wChild is PollOptionNode && w is! PollNode) return;
    if (w is StepperNode && wChild is! StepNode) return;
    if (wChild is StepNode && w is! StepperNode) return;
    if (wChild is ExpandedNode && w is! FlexNode) return;
    if (wChild is FlexibleNode && w is! FlexNode) return;
    if (wChild is PositionedNode && w is! StackNode) return;
    if (wChild is InlineSpanNode && parent is RichTextNode && w is RichTextNode)
      return;
    if (wChild is InlineSpanNode &&
        parent is! RichTextNode &&
        w is! InlineSpanNode) return;

    try {
      //_createSnippetUndo();

      w.setParent(parent);
      wChild.setParent(w);

      if (w is SC) {
        w.child = wChild;
      } else if (w is TextSpanNode) {
        w.children = [wChild as InlineSpanNode];
      } else if (w is PollNode) {
        w.children = [wChild as PollOptionNode];
        // wrap poll in a border
        final Node? pollParent = w.getParent();
        w = ContainerNode(
            decoration: MappableDecorationShapeEnum.rounded_rectangle_dotted,
            borderColorValues:
                UpTo6ColorValues(color1Value: Colors.black.value),
            borderThickness: 4,
            child: w)
          ..setParent((pollParent));
        w.child!.setParent(w);
      } else if (w is StepperNode) {
        w.children = [wChild as StepNode];
      } else if (w is MC) {
        w.children = [wChild];
      }

      if (parent is SC) {
        parent.child = w;
      } else if (parent is MC) {
        int index = parent.children.indexOf(wChild);
        parent.children[index] = w;
      } else if (parent is RichTextNode) {
        parent.text = w as TextSpanNode;
      }

      // update treeC if rootNode changed (that's the Snippet's child)
      SnippetTreeController possiblyNewTreeC = state.snippetBeingEdited!.treeC;
      // if (true || w.getParent() is SnippetRootNode) {
      //   possiblyNewTreeC = SnippetTreeController(
      //     roots: [w],
      //     childrenProvider: Node.snippetTreeChildrenProvider,
      //   );
      // }

      possiblyNewTreeC.expand(w);
      possiblyNewTreeC.rebuild();
      state.snippetBeingEdited!
        ..selectedNode = w
        ..treeC = possiblyNewTreeC;

      emit(state.copyWith(
        force: state.force + 1,
      ));
    } catch (e) {
      fco.logi("\n ***  _wrapWith() - failed!  ***");
      rethrow;
    }
  }

  // void _wrapWithOLD(WrapWith event, emit) {
  //   if (state.aNodeIsSelected) {
  //     STreeNode selectedNode = state.selectedNode!;
  //     //_createSnippetUndo();
  //     STreeNode newNode =
  //         event.type != null ? _typeAsATreeNode(event.type!, selectedNode, "_wrapWith() missing ${event.type.toString()}") : event.testNode!;
  //
  //     newNode.setParent(selectedNode.parent);
  //
  //     // // attach new parent at select node's pos in the tree...
  //     // if selected node is actually a root node, make newNode the new root
  //     if (selectedNode.parent == null) {
  //       state.treeC.roots = [newNode];
  //     } else {
  //       //
  //       if (selectedNode.parent is SC) {
  //         (selectedNode.parent as SC).child = newNode;
  //       } else if (selectedNode.parent is MC) {
  //         int i = (selectedNode.parent as MC).children.indexOf(selectedNode);
  //         (selectedNode.parent as MC).children[i] = newNode;
  //       } else if (selectedNode.parent is WidgetSpanNode) {
  //         (selectedNode.parent as WidgetSpanNode).child = newNode;
  //       }
  //     }
  //     selectedNode.setParent(newNode);
  //
  //     state.treeC.expand(newNode);
  //     state.treeC.rebuild();
  //     emit(state.copyWith(
  //       selectedNode: newNode,
  //     ));
  //   }
  // }

  void _replaceWith(ReplaceSelectionWith event, emit) {
    if (!(state.snippetBeingEdited?.aNodeIsSelected ?? false)) return;
    STreeNode selectedNode = state.snippetBeingEdited!.selectedNode!;
    if (event.type == selectedNode.runtimeType) return;
    //_createSnippetUndo();
    STreeNode newNode = event.type != null
        ? _typeAsATreeNode(
            event.type!,
            null,
            "_replaceWith() missing ${event.type.toString()}",
            snippetName: event.snippetName,
          )
        : event.testNode!;
    _replaceWithNewNodeOrClipboard(selectedNode, emit, newNode);
  }

  void _replaceWithNewNodeOrClipboard(STreeNode sel, emit, STreeNode r) {
    if (!(state.snippetBeingEdited?.aNodeIsSelected ?? false)) return;

    if (sel is InlineSpanNode && r is! InlineSpanNode) return;
    if (sel is! InlineSpanNode && r is InlineSpanNode) return;
    if (sel is PollOptionNode && r is! PollOptionNode) return;
    if (sel is StepNode && r is! StepNode) return;

    STreeNode? parent = sel.getParent() as STreeNode?;

    try {
      //_createSnippetUndo();

      r.setParent(sel.getParent());

      if (parent is SC) {
        parent.child = r;
      } else if (parent is MC) {
        int index = parent.children.indexOf(sel);
        parent.children[index] = r;
      } else if (parent is TextSpanNode) {
        int index = parent.children!.indexOf(sel as InlineSpanNode);
        parent.children![index] = r as InlineSpanNode;
      } else if (parent is RichTextNode) {
        parent.text = r as InlineSpanNode;
      }

      if (sel is! SnippetRootNode) {
        // move any child or children to replacementNode, and set parent
        if (sel is SC && r is SC) {
          r.child = sel.child;
          r.child?.setParent(r);
        } else if (sel is MC && r is MC) {
          r.children = (sel).children;
          for (STreeNode child in r.children) {
            child.setParent(r);
          }
        } else if (sel is SC && sel.child != null && r is MC) {
          STreeNode child = sel.child!;
          r.children.add(child);
          child.setParent(r);
        }
      }
    } catch (e) {
      fco.logi("\n ***  _replaceWithNewNodeOrClipboard() - failed!  ***");
      rethrow;
    }

    // update treeC if rootNode changed (that's the Snippet's child)
    SnippetTreeController possiblyNewTreeC = state.snippetBeingEdited!.treeC;
    if (false && r.getParent() is SnippetRootNode) {
      possiblyNewTreeC = SnippetTreeController(
        roots: [r],
        childrenProvider: Node.snippetTreeChildrenProvider,
        parentProvider: Node.snippetTreeParentProvider,
      );
    }
    possiblyNewTreeC.roots.first.validateTree();
    possiblyNewTreeC.expand(r);
    possiblyNewTreeC.rebuild();

    state.snippetBeingEdited!
      ..selectedNode = r
      ..treeC = possiblyNewTreeC;

    emit(state.copyWith(
      force: state.force + 1,
    ));
  }

  // void _replaceWithNewNodeOrClipboardOLD(STreeNode selectedNode, emit, STreeNode r) {
  //   //_createSnippetUndo();
  //
  //   // attach newNode to parent
  //   // if selected node is actually a root node, make newNode the new root
  //   if (selectedNode.parent == null) {
  //     state.treeC.roots = [replacementNode];
  //   } else {
  //     if (selectedNode.parent is SC) {
  //       (selectedNode.parent as SC).child = replacementNode;
  //     } else if (selectedNode.parent is MC) {
  //       List<STreeNode> children = (selectedNode.parent as MC).children;
  //       int index = children.indexOf(selectedNode);
  //       if (index != -1) {
  //         children[index] = replacementNode;
  //       }
  //     }
  //   }
  //   replacementNode.setParent(selectedNode.parent);
  //
  //   // move any child or children to replacementNode, and set parent
  //   if (selectedNode is SC && replacementNode is SC) {
  //     replacementNode.child = selectedNode.child;
  //     replacementNode.child!.setParent(replacementNode);
  //   } else if (selectedNode is MC && replacementNode is MC) {
  //     replacementNode.children = (selectedNode).children;
  //     for (STreeNode child in replacementNode.children) {
  //       child.setParent(replacementNode);
  //     }
  //   } else if (selectedNode is SC && (selectedNode).child != null && replacementNode is MC) {
  //     STreeNode child = selectedNode.child!;
  //     replacementNode.children.add(child);
  //     child.setParent(replacementNode);
  //   }
  //
  //   state.treeC.expand(replacementNode);
  //   state.treeC.rebuild();
  //   emit(state.copyWith(
  //     selectedNode: replacementNode,
  //   ));
  // }

  void _addChild(AppendChild event, emit) {
    if (!(state.snippetBeingEdited?.aNodeIsSelected ?? false)) return;
    STreeNode selectedNode = state.snippetBeingEdited!.selectedNode!;
    STreeNode newNode = event.type != null
        ? _typeAsATreeNode(
            event.type!,
            null,
            "_addChild() missing ${event.type.toString()}",
            snippetName: event.snippetName,
          )
        : event.testNode!;
    _addOrPasteChild(selectedNode, emit, newNode);
  }

  void _addOrPasteChild(STreeNode selectedNode, emit, STreeNode newNode) {
    //_createSnippetUndo();
    // STreeNode? childNode;

    // if (selectedNode is ContainerNode) {
    //   selectedNode.alignment = AlignmentEnum.center;
    // }
    // if (selectedNode is PlaceholderNode) {
    //   selectedNode.child = newNode;
    //   if (state.selectedNode?.parent != null &&
    //       state.selectedNode?.parent is SingleChildNode &&
    //       (state.selectedNode?.parent as SingleChildNode).child == selectedNode) {
    //     (state.selectedNode?.parent as SingleChildNode).child = newNode;
    //   }
    // } else
    if (selectedNode is TabBarNode) {
      TabBarViewNode? tabBarViewNode = state.snippetBeingEdited!.treeC
          .findNodeTypeInTree(rootNode, TabBarViewNode) as TabBarViewNode?;
      STreeNode newTabView = PlaceholderNode();
      tabBarViewNode?.children.add(newTabView);
      newTabView.setParent(tabBarViewNode);
      selectedNode.children.add(newNode);
      // scaffoldNode?.numTabs++;
    } else if (selectedNode is TabBarViewNode) {
      // ScaffoldNode? scaffoldNode = state.treeC
      //     .findNodeTypeInTree(rootNode, ScaffoldNode) as ScaffoldNode?;
      TabBarNode? tabBarNode = state.snippetBeingEdited!.treeC
          .findNodeTypeInTree(rootNode, TabBarNode) as TabBarNode?;
      STreeNode newTab = TextNode(text: 'new tab');
      tabBarNode?.children.add(newTab);
      newTab.setParent(tabBarNode);
      selectedNode.children.add(newNode);
      // scaffoldNode?.numTabs++;
    } else if (selectedNode is SC) {
      selectedNode.child = newNode;
    } else if (selectedNode is MC) {
      selectedNode.children.add(newNode);
    } else if (selectedNode is TextSpanNode && newNode is InlineSpanNode) {
      selectedNode.children ??= [];
      selectedNode.children!.add(newNode);
    } else if (selectedNode is WidgetSpanNode) {
      selectedNode.child = newNode;
    }
    // newNode.setParent(selectedNode);
    state.snippetBeingEdited!
      ..treeC.expand(newNode)
      ..treeC.rebuild()
      ..rootNode.validateTree();

    emit(state.copyWith(
      force: state.force + 1,
    ));
  }

  void _pasteReplacement(PasteReplacement event, emit) {
    if (!(state.snippetBeingEdited?.aNodeIsSelected ?? false)) return;
    if (fco.clipboard != null) {
      STreeNode selectedNode = state.snippetBeingEdited!.selectedNode!;
      STreeNode clipboardNode = fco.clipboard!;
      //_createSnippetUndo();
      _replaceWithNewNodeOrClipboard(selectedNode, emit, clipboardNode);
    }

    // // Container's Container parent should have an alignment property
    // if (event.selectedNode is ContainerNode) {
    //   (event.selectedNode as ContainerNode).alignment = AlignmentEnum.center;
    // }
    // if (event.selectedNode is SingleChildNode) {
    //   (event.selectedNode as SingleChildNode).child = clipboardNode;
    // } else if (event.selectedNode is MultiChildNode) {
    //   (event.selectedNode as MultiChildNode).children = [clipboardNode];
    // } else if (event.selectedNode is TextSpanNode && clipboardNode is TextSpanNode) {
    //   (event.selectedNode as TextSpanNode).children = [clipboardNode];
    // } else if (event.selectedNode is TextSpanNode && clipboardNode is WidgetSpanNode) {
    //   (event.selectedNode as TextSpanNode).children = [clipboardNode];
    // } else if (event.selectedNode is WidgetSpanNode) {
    //   (event.selectedNode as WidgetSpanNode).child = clipboardNode;
    // }
    // state.treeC.expand(event.selectedNode);
    // state.treeC.rebuild();
    // emit(state.copyWith(
    //   //selectedNode: clipboardNode,
    // ));
  }

  void _pasteChild(PasteChild event, emit) {
    if (!(state.snippetBeingEdited?.aNodeIsSelected ?? false)) return;
    if (fco.clipboard != null) {
      STreeNode selectedNode = state.snippetBeingEdited!.selectedNode!;
      STreeNode clipboardNode = fco.clipboard!;
      _addOrPasteChild(selectedNode, emit, clipboardNode);
    }
  }

  void _addSiblingBefore(AddSiblingBefore event, emit) {
    if (!(state.snippetBeingEdited?.aNodeIsSelected ?? false)) return;
    STreeNode selectedNode = state.snippetBeingEdited!.selectedNode!;
    STreeNode newNode = event.type != null
        ? _typeAsATreeNode(
            event.type!,
            null,
            "_addSiblingBefore() missing ${event.type.toString()}",
            snippetName: event.snippetName,
          )
        : event.testNode!;
    //_createSnippetUndo();
    if (state.snippetBeingEdited!.selectedNode?.getParent() is MC) {
      int i = (state.snippetBeingEdited!.selectedNode?.getParent() as MC)
          .children
          .indexOf(selectedNode);
      _addSiblingAt(newNode, emit, i);
    }
    if (state.snippetBeingEdited!.selectedNode?.getParent() is TextSpanNode) {
      int i =
          (state.snippetBeingEdited!.selectedNode?.getParent() as TextSpanNode)
              .children!
              .indexOf(selectedNode as InlineSpanNode);
      _addSiblingAt(newNode, emit, i);
    }
  }

  void _pasteSiblingBefore(PasteSiblingBefore event, emit) {
    if (!(state.snippetBeingEdited?.aNodeIsSelected ?? false)) return;
    if (fco.clipboard != null) {
      STreeNode selectedNode = state.snippetBeingEdited!.selectedNode!;
      STreeNode clipboardNode = fco.clipboard!;
      //_createSnippetUndo();
      if (state.snippetBeingEdited?.selectedNode?.getParent() is MC) {
        int i = (state.snippetBeingEdited?.selectedNode?.getParent() as MC)
            .children
            .indexOf(selectedNode);
        _pasteSiblingAt(clipboardNode, emit, i);
      }
      if (state.snippetBeingEdited?.selectedNode?.getParent() is TextSpanNode) {
        int i = (state.snippetBeingEdited?.selectedNode?.getParent()
                as TextSpanNode)
            .children!
            .indexOf(selectedNode as InlineSpanNode);
        _pasteSiblingAt(clipboardNode, emit, i);
      }
    }
  }

  void _addSiblingAfter(AddSiblingAfter event, emit) {
    if (!(state.snippetBeingEdited?.aNodeIsSelected ?? false)) return;
    STreeNode selectedNode = state.snippetBeingEdited!.selectedNode!;
    STreeNode newNode = event.type != null
        ? _typeAsATreeNode(
            event.type!,
            null,
            "_addSiblingAfter() missing ${event.type.toString()}",
            snippetName: event.snippetName,
          )
        : event.testNode!;
    //_createSnippetUndo();
    if (state.snippetBeingEdited!.selectedNode?.getParent() is MC) {
      int i = (state.snippetBeingEdited!.selectedNode?.getParent() as MC)
          .children
          .indexOf(selectedNode);
      _addSiblingAt(newNode, emit, i + 1);
    }
    if (state.snippetBeingEdited!.selectedNode?.getParent() is TextSpanNode) {
      int i =
          (state.snippetBeingEdited!.selectedNode?.getParent() as TextSpanNode)
              .children!
              .indexOf(selectedNode as InlineSpanNode);
      _addSiblingAt(newNode, emit, i + 1);
    }
  }

  void _pasteSiblingAfter(PasteSiblingAfter event, emit) {
    if (!(state.snippetBeingEdited?.aNodeIsSelected ?? false)) return;
    STreeNode selectedNode = state.snippetBeingEdited!.selectedNode!;
    STreeNode clipboardNode = fco.clipboard!;
    //_createSnippetUndo();
    if (state.snippetBeingEdited!.selectedNode?.getParent() is MC) {
      int i = (state.snippetBeingEdited!.selectedNode?.getParent() as MC)
          .children
          .indexOf(selectedNode);
      _pasteSiblingAt(clipboardNode, emit, i + 1);
    }
    if (state.snippetBeingEdited!.selectedNode?.getParent() is TextSpanNode) {
      int i =
          (state.snippetBeingEdited!.selectedNode?.getParent() as TextSpanNode)
              .children!
              .indexOf(selectedNode as InlineSpanNode);
      _pasteSiblingAt(clipboardNode, emit, i + 1);
    }
  }

  void _addSiblingAt(STreeNode newNode, emit, int i) {
    //_createSnippetUndo();
    STreeNode? parent =
        state.snippetBeingEdited!.selectedNode?.getParent() as STreeNode?;
    if (parent is TabBarNode) {
      TabBarViewNode? tabBarViewNode = state.snippetBeingEdited!.treeC
          .findNodeTypeInTree(rootNode, TabBarViewNode) as TabBarViewNode?;
      tabBarViewNode?.children
          .insert(i, PlaceholderNode()..setParent(tabBarViewNode));
      parent.children.insert(i, newNode..setParent(parent));
    } else if (parent is TabBarViewNode) {
      TabBarNode? tabBarNode = state.snippetBeingEdited!.treeC
          .findNodeTypeInTree(rootNode, TabBarNode) as TabBarNode?;
      tabBarNode?.children
          .insert(i, TextNode(text: 'new tab')..setParent(tabBarNode));
      parent.children.insert(i, newNode..setParent(parent));
    } else if (state.snippetBeingEdited!.selectedNode?.getParent() is MC) {
      (state.snippetBeingEdited!.selectedNode?.getParent() as MC)
          .children
          .insert(i, newNode);
    }
    if (state.snippetBeingEdited!.selectedNode?.getParent() is TextSpanNode) {
      (state.snippetBeingEdited!.selectedNode?.getParent() as TextSpanNode)
          .children
          ?.insert(i, newNode as InlineSpanNode);
    }

    newNode.setParent(parent);
    state.snippetBeingEdited!.treeC.expand(newNode);
    state.snippetBeingEdited!.selectedNode = newNode;
    emit(state.copyWith(
      force: state.force + 1,
    ));
  }

  void _pasteSiblingAt(STreeNode clipboardNode, emit, int i) {
    //_createSnippetUndo();
    TextSpanNode? textSpanNode;
    STreeNode newNode = clipboardNode;

    if (state.snippetBeingEdited!.selectedNode?.getParent() is MC) {
      (state.snippetBeingEdited!.selectedNode?.getParent() as MC)
          .children
          .insert(i, newNode);
      newNode.setParent(state.snippetBeingEdited!.selectedNode?.getParent());
    }
    if (state.snippetBeingEdited!.selectedNode?.getParent() is TextSpanNode) {
      (state.snippetBeingEdited!.selectedNode?.getParent() as TextSpanNode)
          .children
          ?.insert(i, newNode as InlineSpanNode);
      newNode.setParent(state.snippetBeingEdited!.selectedNode?.getParent());
    }

    state.snippetBeingEdited!.rootNode.validateTree();

    if (newNode is RichTextNode) {
      state.snippetBeingEdited!.treeC.expand(newNode);
      state.snippetBeingEdited!.selectedNode = textSpanNode;
      emit(state.copyWith(
        force: state.force + 1,
      ));
    } else {
      state.snippetBeingEdited!.treeC.expand(newNode);
      state.snippetBeingEdited!.selectedNode = newNode;
      emit(state.copyWith(
        force: state.force + 1,
      ));
    }
  }

  void _selectedDirectoryOrNode(SelectedDirectoryOrNode event, emit) {
    state.snippetBeingEdited!.selectedNode = event.selectedNode;
    emit(state.copyWith(
      force: state.force + 1,
    ));
  }

  // void _createdSnippet(CreatedSnippet event, emit) {
  //   // state.ur.createUndo(state.snippetTreeC.roots, state.snippetTreeC.expandedNodes);
  //   state.treeC.roots = [event.newNode];
  //   state.treeC.rebuild();
  //   if (state.snippetsMap.containsKey(event.newNode.name)) return;
  //   Map<SnippetName, SnippetNode> newSnippetsMap = Map<SnippetName, SnippetNode>.of(state.snippetsMap);
  //   newSnippetsMap[event.newNode.name] = event.newNode;
  //   // state.snippetTreeC.toggleExpansion(state.snippetTreeC.roots.first);
  //   emit(state.copyWith(
  //     snippetsMap: newSnippetsMap,
  //     selectedNode: event.newNode,
  //     // showAdders: true,
  //     lastAddedNode: event.newNode,
  //   ));
  // }
  //

  Future<void> _saveNodeAsSnippet(SaveNodeAsSnippet event, emit) async {
    //_createSnippetUndo();

    //_cutIncludingAnyChildren(event.node);

    // create new snippet
    SnippetRootNode newRootNode =
        SnippetRootNode(name: event.newSnippetName, child: event.node);
    // VersionId initialVersionId = DateTime.now().millisecondsSinceEpoch.toString();
    await fco.cacheAndSaveANewSnippetVersion(
      snippetName: event.newSnippetName,
      rootNode: newRootNode,
    );
    // FCO.addToSnippetCache(
    //   snippetName: event.newSnippetName,
    //   rootNode: rootNode,
    //   versionId: initialVersionId,
    //   // editing: true,
    // );
    // FCO.updatePublishedVersionId(
    //     snippetName: event.newSnippetName, versionId: initialVersionId);
    // FCO.updateEditingVersionId(
    //     snippetName: event.newSnippetName, newVersionId: initialVersionId);
    // await FCO.modelRepo.saveSnippet(
    //     snippetRootNode: newRootNode, newVersionId: initialVersionId);
    //
    // FCO.snippetCache[event.newSnippetName] = {};
    // FCO.capiBloc.add(CAPIEvent.createdSnippet(newSnippetNode: newRootNode));
    // create a snippet ref node
    SnippetRootNode refNode = SnippetRootNode(name: event.newSnippetName);
    // attach to parent
    if (state.snippetBeingEdited!.selectedNode?.getParent() is SC) {
      (state.snippetBeingEdited!.selectedNode?.getParent() as SC).child =
          refNode;
    } else if (state.snippetBeingEdited!.selectedNode?.getParent() is MC) {
      int index = (state.snippetBeingEdited!.selectedNode?.getParent() as MC)
          .children
          .indexOf(event.node);
      (state.snippetBeingEdited!.selectedNode?.getParent() as MC)
          .children[index] = refNode;
    } else if (state.snippetBeingEdited!.selectedNode?.getParent()
        is WidgetSpanNode) {
      (state.snippetBeingEdited!.selectedNode?.getParent() as WidgetSpanNode)
          .child = refNode;
    }
    state.snippetBeingEdited!.treeC.expand(newRootNode);
    state.snippetBeingEdited!.treeC.rebuild();
    state.snippetBeingEdited!.selectedNode = refNode;

    // var appInfo = FCO.appInfoAsMap;

    emit(state.copyWith(
      force: state.force + 1,
    ));
    // }
  }

  // void _createSnippetUndo() {
  //   state.ur.createUndo(state);
  // }

  // void _undo(Undo event, emit) {
  //   if (state.canUndo()) {
  //     SnippetState? result = state.ur.undo(state);
  //     _restore(result, emit);
  //   }
  // }

  // void _redo(Redo event, emit) {
  //   if (state.canRedo()) {
  //     SnippetState? result = state.ur.redo(state);
  //     _restore(result, emit);
  //   }
  // }

  // void _restore(SnippetState? undoOrRedoResult, emit) {
  //   // replace bloc in queue with undo/redo result
  //   SnippetState? prevSnippetState = undoOrRedoResult;
  //   SnippetRootNode? prevRootNode = prevSnippetState?.rootNode;
  //   if (prevRootNode == null) return;
  //   SnippetBloC restoredSnippetBloc = SnippetBloC(
  //     rootNode: prevRootNode,
  //     treeC: prevSnippetState!.treeC..expand(prevRootNode),
  //     treeUR: prevSnippetState.ur,
  //     selectedNode: prevSnippetState.selectedNode,
  //     selectedWidgetGK: prevSnippetState.selectedWidgetGK,
  //     selectedTreeNodeGK: prevSnippetState.selectedTreeNodeGK,
  //   );
  //   FC()
  //       .capiBloc
  //       .add(CAPIEvent.restoredSnippetBloc(restoredBloc: restoredSnippetBloc));
  //
  //   if (undoOrRedoResult != null) {
  //     emit(prevSnippetState);
  //     fco.afterNextBuildDo(() {
  //       state.treeC.rebuild();
  //       STreeNode? restoredSelectedNode = state.selectedNode;
  //       if (restoredSelectedNode != null) {
  //         add(
  //           SelectNode(
  //             node: restoredSelectedNode,
  //             selectedWidgetGK: GlobalKey(debugLabel: 'selectedWidgetGK'),
  //             selectedTreeNodeGK: GlobalKey(debugLabel: 'selectedTreeNodeGK'),
  //           ),
  //         );
  //       }
  //     });
  //   }
  // }

  bool get deleteInProgress =>
      state.snippetBeingEdited?.nodeBeingDeleted != null;

  bool get aNodeIsSelected =>
      state.snippetBeingEdited?.aNodeIsSelected ?? false;

  SnippetRootNode? get rootNode => state.snippetBeingEdited?.rootNode;

  SnippetTreeController? get treeC => state.snippetBeingEdited?.treeC;

  String get snippetName => rootNode?.name ?? 'snippetName?';
}
