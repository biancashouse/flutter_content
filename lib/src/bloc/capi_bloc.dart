import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/model/model_repo.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'capi_event.dart';
import 'capi_state.dart';

class CAPIBloC extends Bloc<CAPIEvent, CAPIState> {
  final IModelRepository modelRepo;

  CAPIBloC({
    required this.modelRepo,
    // bool useFirebase = false,
    // required bool localTestingFilePaths,
    // required Map<String, TargetGroupModel> targetGroupMap,
    // required Map<String, TargetModel> singleTargetMap,
    EncodedJson? jsonRootDirectoryNode,
    // required Map<SnippetName, SnippetRootNode> snippetsMap,
    Offset? snippetTreeCalloutInitialPos,
    double? snippetTreeCalloutW,
    double? snippetTreeCalloutH,
    // double? snippetPropertiesCalloutW,
    // double? snippetPropertiesCalloutH,
  }) : super(CAPIState(
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
    on<EnsureSnippetPresent>(
        (event, emit) => _ensureSnippetPresent(event, emit));
    on<SaveSnippet>((event, emit) => _saveSnippet(event, emit));
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
    on<PushSnippetBloc>((event, emit) => _pushSnippetBloc(event, emit));
    on<PopSnippetBloc>((event, emit) => _popSnippetBloc(event, emit));
    // on<RestoredSnippetBloc>((event, emit) => _restoredSnippetBloc(event, emit));
    // on<CreatedSnippet>((event, emit) => _createdSnippet(event, emit));
    on<SetPanelSnippet>((event, emit) => _setPanelSnippet(event, emit));
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

  // ensure both published and editing versions are present
  Future<void> _ensureSnippetPresent(EnsureSnippetPresent event, emit) async {
    await _getOrCreateSnippet(
      event.snippetName,
      true,
      event.fromTemplate,
      event.onlyTargetsWrappers,
      emit,
    );
    await _getOrCreateSnippet(
      event.snippetName,
      false,
      event.fromTemplate,
      event.onlyTargetsWrappers,
      emit,
    );
    // var fc = FC();
    emit(state.copyWith(
      force: state.force + 1,
      onlyTargetsWrappers: !event.onlyTargetsWrappers,
    ));
  }

  Future<void> _getOrCreateSnippet(
    SnippetName snippetName,
    bool canEdit,
    SnippetTemplate fromTemplate,
    bool onlyTargetsWrappers,
    emit,
  ) async {
    SnippetRootNode? rootNode;
    VersionId? editingOrPublishedVersionId = canEdit
        ? FC().editingVersionIds[snippetName]
        : FC().publishedVersionIds[snippetName];
    if (editingOrPublishedVersionId != null) {
      // exists in AppInfo, so make sure it has been fetched from FB
      await FC().modelRepo.getSnippetFromCacheOrFB(
          snippetName: snippetName, versionId: editingOrPublishedVersionId);
      // var test = FC().snippetCache[snippetName]?[editingOrPublishedVersionId];
      rootNode = FC().snippetCache[snippetName]?[editingOrPublishedVersionId];
    } else {
      // snippet does not yet exist in FB, hence not in AppInfo
      VersionId initialVersionId =
          DateTime.now().millisecondsSinceEpoch.toString();
      rootNode =
          SnippetPanel.createSnippetFromTemplate(fromTemplate, snippetName);
      FC().addToSnippetCache(
        snippetName: snippetName,
        rootNode: rootNode,
        versionId: initialVersionId,
        // editing: true,
      );
      FC().updatePublishedVersionId(
          snippetName: snippetName, versionId: initialVersionId);
      FC().updateEditingVersionId(
          snippetName: snippetName, newVersionId: initialVersionId);
      SaveSnippet ssEvent = SaveSnippet(
        snippetRootNode: rootNode,
        newVersionId: initialVersionId,
        onlyTargetsWrappers: true,
      );
      _saveSnippet(ssEvent, emit);
    }
  }

  Future<void> _saveSnippet(SaveSnippet event, emit) async {
    String? jsonBeforePush = FC().jsonBeforePush;
    String currentJsonS = event.snippetRootNode.toJson();

    // testing
    // var testModel = jsonDecode(jsonS);

    // only save if changes detected
    if (!event.force && currentJsonS == jsonBeforePush) return;

    final stopwatch = Stopwatch()..start();
    // debugPrint('saving ${state.snippetTreeCalloutW}, ${state.snippetTreeCalloutH}');
    Callout.showTextToast(
      feature: "saving-model",
      msgText: 'saving changes...',
      backgroundColor: Colors.yellow,
      width: Useful.scrW * .8,
      height: 40,
      gravity: Alignment.topCenter,
      textColor: Colors.blueAccent,
    );

    // save to local storage
    HydratedBloc.storage.write('flutter-content', currentJsonS);
    // // save to clipboard
    // try {
    //   Clipboard.setData(ClipboardData(text: jsonS));
    // } catch(e) {
    //   // ignore clipboard exception
    // }

    // save to firebase
    modelRepo.saveSnippet(
        snippetRootNode: event.snippetRootNode,
        newVersionId: event.newVersionId);

    // }
    // } else {
    //   // only write if later than firebase version
    //   Map<String, dynamic> data = snap.data() as Map<String, dynamic>;
    //   int lastVersion = data["latestVersion"] ?? 0;
    //   if (model.lastModified! > lastVersion) {
    //     //int latestVersion = data["latestVersion"] ?? 0;
    //     await _createOrUpdateFirebaseModel(modelDocRef, model);
    //   }
    // }
    // min 2s display of toast
    if (stopwatch.elapsedMilliseconds < 2000) {
      await Future.delayed(
          Duration(milliseconds: 2000 - stopwatch.elapsedMilliseconds));
    }
    Callout.dismissAll(onlyToasts: true);
    // update last value
    if (!event.dontEmit) {
      emit(state.copyWith(
        force: state.force + 1,
        onlyTargetsWrappers: event.onlyTargetsWrappers,
      ));
    }
  }

  // Future<void> _switchBranch(SwitchBranch event, emit) async {
  //   final stopwatch = Stopwatch()..start();
  //   // debugPrint('saving ${state.snippetTreeCalloutW}, ${state.snippetTreeCalloutH}');
  //   Callout.showTextToast(
  //     feature: "saving-model",
  //     msgText: 'saving changes...',
  //     backgroundColor: Colors.yellow,
  //     width: Useful.scrW * .8,
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
  //   Callout.dismissAll(onlyToasts: true);
  //   // update last value
  // }

  Future<void> _revertSnippet(RevertSnippet event, emit) async {
    final stopwatch = Stopwatch()..start();
    Callout.showTextToast(
      feature: "reverting-model",
      msgText: 'reverting staged version...',
      backgroundColor: Colors.yellow,
      width: Useful.scrW * .8,
      height: 40,
      gravity: Alignment.topCenter,
      textColor: Colors.blueAccent,
    );

    modelRepo.revertSnippet(
        snippetName: event.snippetName, toVersionId: event.versionId);

    if (stopwatch.elapsedMilliseconds < 2000) {
      Future.delayed(
          Duration(milliseconds: 2000 - stopwatch.elapsedMilliseconds));
    }

    Callout.dismissAll(onlyToasts: true);

    emit(state.copyWith(
      force: state.force + 1,
    ));
  }

  Future<void> _publishSnippet(PublishSnippet event, emit) async {
    final stopwatch = Stopwatch()..start();
    Callout.showTextToast(
      feature: "reverting-model",
      msgText: 'publishing version...',
      backgroundColor: Colors.yellow,
      width: Useful.scrW * .8,
      height: 40,
      gravity: Alignment.topCenter,
      textColor: Colors.blueAccent,
    );

    await modelRepo.publishSnippet(
        snippetName: event.snippetName, versionId: event.versionId);

    if (stopwatch.elapsedMilliseconds < 2000) {
      await Future.delayed(
          Duration(milliseconds: 2000 - stopwatch.elapsedMilliseconds));
    }

    Callout.dismissAll(onlyToasts: true);
    // await FC.loadLatestSnippetMap();
    //
    // emit(state.copyWith(
    //   force: state.force + 1,
    // ));
  }

  void _forceRefresh(ForceRefresh event, emit) {
    debugPrint("forceRefresh --------------------------------------------------------");
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

  // Future<void> _copyModelToClipboard(event, emit) async {
  //   // playWhooshSound();
  //   CAPIModel model = CAPIModel(TargetGroupModels: state.targetGroupMap);
  //   await Clipboard.setData(ClipboardData(text: jsonEncode(model.toJson())));
  // }

  Future<void> _updateClipboard(UpdateClipboard event, emit) async {
    FC().setClipboard(event.newContent);
    emit(state.copyWith(
      force: state.force + 1,
    ));
    if (event.skipSave) return;
    FC().modelRepo.saveAppInfo();
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
  //     debugPrint("\nUnable to remove tc !\n");
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
//     Callout.removeOverlayCalloutByFeature(CAPI.ANY_TOAST.feature(featureSeed), true);
//     targetListGK.currentState?.setState(() {
//       //measureIVchild();
//       Callout? targetCallout = Useful.om.findCallout(CAPI.TARGET_CALLOUT.feature((featureSeed), selectedTargetIndex));
//       if (targetCallout != null) {
//         selectedTarget!.setTargetLocalPosPc(Offset(targetCallout.left!, targetCallout.top!));
//         debugPrint("final callout pos (${targetCallout.left},${targetCallout.top})");
//         debugPrint("targetGlobalPos now: ${selectedTarget!.targetGlobalPos()}");
//       }
//       ivScale = 1.0;
//       ivTranslate = Offset.zero;
//       debugPrint("new child local pos (${selectedTarget!.childLocalPosLeftPc},${selectedTarget!.childLocalPosTopPc})");
//       // selectedTarget!.childLocalPosLeftPc = savedChildLocalPosPc!.dx;
//       // selectedTarget!.childLocalPosTopPc = savedChildLocalPosPc!.dy;
//       debugPrint("previous child local pos (${savedChildLocalPosPc!.dx},${savedChildLocalPosPc!.dy})");
//       int saveSelection = selectedTargetIndex;
//       selectedTargetIndex = -1;
//       transformationController.value = Matrix4.identity();
//       removeTextEditorCallout(this, selectedTargetIndex);
//       removeTargetCallout(this, saveSelection);
//     });
//   }
//   if (reshowAllTargets)
//     // show all targets unselected
//     Useful.afterMsDelayDo(500, () {
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
//   tc.calloutTopPc = event.newPos.dy / Useful.scrH;
//   tc.calloutLeftPc = event.newPos.dx / Useful.scrW;
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
//   // Callout.moveToByFeature(CAPI.BUTTONS_CALLOUT.feature(), buttonsCalloutInitialPos());
//   Callout? listViewCallout = Useful.om.findCallout(CAPI.TARGET_LISTVIEW_CALLOUT.feature());
//   Callout.moveToByFeature(
//       CAPI.TARGET_LISTVIEW_CALLOUT.feature(), targetListCalloutInitialPos(widget.child is Scaffold, listViewCallout?.calloutH ?? 200));
//   bool? b = tseGK.currentState?.minimise;
//   Callout.moveToByFeature(CAPI.STYLES_CALLOUT.feature(), stylesCalloutInitialPos(b ?? true));
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
//     debugPrint("_parseImageTargets(): ${e.toString()}");
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
  //   FlutterContent().capiBloc.add(capiEvent.CreatedSnippet(newNode: newSnippetNode));
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

  void _pushSnippetBloc(PushSnippetBloc event, emit) {
    SnippetRootNode? rootNode =
        FC().rootNodeOfEditingSnippet(event.snippetName);
    if (rootNode == null) return;

    SnippetTreeController newTreeC() => SnippetTreeController(
          roots: event.visibleDecendantNode != null
              ? [event.visibleDecendantNode!]
              : [rootNode],
          childrenProvider: Node.snippetTreeChildrenProvider,
        );

    SnippetBloC newSnippetBloc = SnippetBloC(
      rootNode: rootNode,
      treeC: newTreeC()..expandAll(),
      // treeUR: SnippetTreeUR()
    );
    FC()
      ..jsonBeforePush = rootNode.toJson()
      ..pushSnippet(newSnippetBloc);

    emit(state.copyWith(
      // hideAllTargetGroupPlayBtns: true,
      // hideTargetsExcept: null,
      hideSnippetPencilIcons: true,
      onlyTargetsWrappers: true,
    ));
    emit(state.copyWith(
      onlyTargetsWrappers: false,
    ));
  }

  Future<void> _popSnippetBloc(PopSnippetBloc event, emit) async {
    SnippetBloC? snippetPopped = FC().popSnippet();
    if (snippetPopped != null) {
      // CAPIState.snippetStateMap[snippetBeingPopped.snippetName] = snippetBeingPopped.state.copyWith();
      emit(state.copyWith(
        // hideAllTargetGroups: false,
        // hideAllTargetGroupPlayBtns: false,
        // hideTargetsExcept: null,
        hideIframes: false,
        hideSnippetPencilIcons: false,
      ));
    }
  }

  // Future<void> _restoredSnippetBloc(RestoredSnippetBloc event, emit) async {
  //   SnippetBloC? beforeUndoOrRedo = FC().popSnippet();
  //   FC().pushSnippet(event.restoredBloc);
  //   // CAPIState.snippetStateMap[beforeUndoOrRedo.snippetName] = event.restoredBloc.state;
  //   // Map<SnippetName, SnippetRootNode> newSnippetsMap = Map<SnippetName, SnippetRootNode>.of(FlutterContent().snippetsMap);
  //   SnippetRootNode rootNode = event.restoredBloc.rootNode;
  //   FC().snippetsMap[rootNode.name] = rootNode;
  //
  //   emit(state.copyWith(
  //     // snippetsMap: newSnippetsMap,
  //     force: state.force + 1,
  //   ));
  // }

  void _setPanelSnippet(SetPanelSnippet event, emit) {
    FC().snippetPlacementMap[event.panelName] = event.snippetName;
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
//   // debugPrint('Snippet Properties Callout Size: ${event.newW} x ${event.newH}');
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
}
