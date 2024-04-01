// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/widgets.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'capi_state.freezed.dart';
// part 'cc_state.g.dart';

const Duration ms300 = Duration(milliseconds: 300);
const Duration ms500 = Duration(milliseconds: 500);
const Duration immediate = Duration(milliseconds: 0);

@freezed
class CAPIState with _$CAPIState {
  const CAPIState._();

  // one per page, each having its own json data file
  // can have multiple (named) target wrappers, hence the maps
  factory CAPIState({
    // required bool useFirebase,
    // @Default(false) bool localTestingFilePaths, // because filepaths and fonts accedd differently in own package
    String?
        initialValueJsonAssetPath, // both come from MaterialAppWrapper widget constructor
    // required ModelUR modelUR,
    @Default(false) bool hideIframes,
    @Default(false) bool hideSnippetPencilIcons,
    // @Default(Offset.zero) Offset? snippetTreeCalloutInitialPos,
    @Default(400) double? snippetTreeCalloutW,
    @Default(600) double? snippetTreeCalloutH,
    @Default(Offset.zero) Offset? directoryTreeCalloutInitialPos,
    @Default(400) double? directoryTreeCalloutW,
    @Default(600) double? directoryTreeCalloutH,
    // @Default(600) double? snippetPropertiesCalloutW,
    // @Default(600) double? snippetPropertiesCalloutH,

    // @Default({}) Map<String, TargetGroupModel> targetGroupMap,
    // @Default([]) List<TargetModel> playList,
    // current selection
    TargetModel? hideTargetsExcept,
    @Default(false) bool hideAllTargetGroups,
    @Default(false) bool hideAllTargetGroupPlayBtns,
    TargetModel? newestTarget,
    TargetModel? selectedTarget,
    //
    String? selectedPanel,
    //
    // content
    @Default(false) bool trainerIsSignedn,
    // String? jsonRootDirectoryNode,
    // EncodedJson? jsonClipboardForMove,
    @Default(true) bool showClipboardContent,
    @Default(0) int force, // hacky way to force a transition
    //
    @Default(true) bool ONLY_TESTING,
  }) = _CAPIState;

  // bool aTargetIsSelected() => selectedTarget != null;


  // TargetGroupModel? imageConfig(String tgName) => targetGroupMap[tgName];

  TargetModel? getNewestTarget() => newestTarget;

  // TargetModel? tcByNameOrUid(TargetModel tc) => tc.single
  //     ? SingleTargetWrapper.singleTarget(name: tc.wName)
  //     : _targetGroup(
  //   uid: tc.uid,
  // );

  // TargetModel? tcByUid(TargetModel tc) => _targetGroup(uid: tc.uid);

  // TargetModel? _targetGroup({required int uid}) {
  //   // then must be an image target
  //   for (String name in targetGroupMap.keys) {
  //     TargetGroupModel? tcl = imageConfig(name);
  //     TargetModel? result;
  //     try {
  //       result = tcl?.targets.singleWhere((tc) => tc.uid == uid);
  //       if (result != null) return result;
  //     } catch (e) {
  //       // ignore and return null
  //     }
  //   }
  //   return null;
  // }

  // int numTargetsOnPage() {
  //   int numTCs = 0;
  //   for (TargetGroupModel list in targetGroupMap.values) {
  //     numTCs += list.targets.length;
  //   }
  //   return numTCs;
  // }

  final double CAPI_TARGET_BTN_RADIUS = 15.0;

  /// total duration is sum(target durations) + transition time for each
// int totalDurationMs() => (imageTargetListMap..map((t) => t.calloutDurationMs).reduce((a, b) => a + b)) + TRANSITION_DURATION_MS * (targets.length + 1);
}
