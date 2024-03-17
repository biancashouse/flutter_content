// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/widgets.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/target_config/content/snippet_editor/undo_redo_model.dart';
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
    required String appName,
    // required bool useFirebase,
    // @Default(false) bool localTestingFilePaths, // because filepaths and fonts accedd differently in own package
    String?
        initialValueJsonAssetPath, // both come from MaterialAppWrapper widget constructor
    required ModelUR modelUR,
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

    @Default({}) Map<String, TargetGroupConfig> targetGroupMap,
    @Default([]) List<TargetConfig> playList,
    // current selection
    TargetConfig? hideTargetsExcept,
    @Default(false) bool hideAllTargetGroups,
    @Default(false) bool hideAllTargetGroupPlayBtns,
    TargetConfig? newestTarget,
    TargetConfig? selectedTarget,
    //
    String? selectedPanel,
    //
    // content
    @Default(false) bool trainerIsSignedn,
    // String? jsonRootDirectoryNode,
    String? jsonClipboard,
    String? jsonClipboardForMove,
    @Default(true) bool showClipboardContent,
    @Default(0) int force, // hacky way to force a transition
    //
    @Default(true) bool ONLY_TESTING,
  }) = _CAPIState;

  // bool aTargetIsSelected() => selectedTarget != null;

  int targetIndex(TargetConfig tc) {
    TargetGroupConfig? TargetConfig = imageConfig(tc.wName);
    return TargetConfig != null ? TargetConfig.targets.indexOf(tc) : -1;
  }

  TargetGroupConfig? imageConfig(String tgName) => targetGroupMap[tgName];

  TargetConfig? getNewestTarget() => newestTarget;

  // TargetConfig? tcByNameOrUid(TargetConfig tc) => tc.single
  //     ? SingleTargetWrapper.singleTarget(name: tc.wName)
  //     : _targetGroup(
  //   uid: tc.uid,
  // );

  TargetConfig? tcByUid(TargetConfig tc) => _targetGroup(uid: tc.uid);

  TargetConfig? _targetGroup({required int uid}) {
    // then must be an image target
    for (String name in targetGroupMap.keys) {
      TargetGroupConfig? tcl = imageConfig(name);
      TargetConfig? result;
      try {
        result = tcl?.targets.singleWhere((tc) => tc.uid == uid);
        if (result != null) return result;
      } catch (e) {
        // ignore and return null
      }
    }
    return null;
  }

  int numTargetsOnPage() {
    int numTCs = 0;
    for (TargetGroupConfig list in targetGroupMap.values) {
      numTCs += list.targets.length;
    }
    return numTCs;
  }

  final double CAPI_TARGET_BTN_RADIUS = 15.0;

  /// total duration is sum(target durations) + transition time for each
// int totalDurationMs() => (imageTargetListMap..map((t) => t.calloutDurationMs).reduce((a, b) => a + b)) + TRANSITION_DURATION_MS * (targets.length + 1);
}
