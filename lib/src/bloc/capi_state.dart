// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/poll_bloc.dart';
import 'package:flutter_content/src/target_config/content/snippet_editor/undo_redo_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'snippet_state.dart';

part 'capi_state.freezed.dart';
// part 'cc_state.g.dart';

const Duration DEFAULT_TRANSITION_DURATION_MS = Duration(milliseconds: 500);
const Duration ms300 = Duration(milliseconds: 300);

@freezed
class CAPIState with _$CAPIState {
  const CAPIState._();

  /// the following static are actuall all UI-related and span all blocs...
  // can have multiple transformable widgets and preferredSize widgets under the MaterialApp
  // want new sizes to be available immediately after changing, hence not part of bloc, but static (global) instead
  // keys are wrapper name (WidgetWrapper or ImageWrapper)
  static Map<String, Offset> iwPosMap = {};
  static Map<String, Size> iwSizeMap = {};
  static Map<String, TargetConfig> singleTargetMap = {};

  // each snippet panel has a gk, a last selected node, and a ur
  static Map<SnippetName, SnippetRootNode> snippetsMap = {};

  // static SnippetBloC? rootSnippetBloc;
  // static Map<SnippetName, GlobalKey> snippetRootGkMap = {};
  static Map<GlobalKey, STreeNode> gkSTreeNodeMap = {}; // every node's toWidget() add a GK
  static Map<PanelName, SnippetName> snippetPlacementMap = {};

  static Map<PanelName, GlobalKey> panelGkMap = {};

  // static Map<SnippetName, SnippetState> snippetStateMap = {}; // retain BloC state, because even hide() overlay closes a provided BloC !

  static Size iwSize(String wName) => iwSizeMap[wName] ?? Size.zero;

  static Offset iwPos(String wName) => iwPosMap[wName] ?? Offset.zero;

  static Rect wwRect(String wName) => Rect.fromLTWH(
        iwPos(wName).dx,
        iwPos(wName).dy,
        iwSize(wName).width,
        iwSize(wName).height,
      );

  static List<ScrollController> registeredScrollControllers = [];

  static Map<STreeNode, Set<PTreeNode>> expandedNodes = {};

  static bool showingNodeButtons = false;

  // static ValueNotifier<PTreeNodeTreeController?>? propertiesTreeCVN;
  //
  // static PTreeNodeTreeController? _propertiesTreeC;
  //
  // static PTreeNodeTreeController? get propertiesTreeC => _propertiesTreeC;
  //
  // static set propertiesTreeC(PTreeNodeTreeController? value) {
  //   print("new propertiesTreeC");
  //   _propertiesTreeC = value;
  // }

  // one per page, each having its own json data file
  // can have multiple (named) target wrappers, hence the maps
  factory CAPIState({
    required String appName,
    // required bool useFirebase,
    // @Default(false) bool localTestingFilePaths, // because filepaths and fonts accedd differently in own package
    String? initialValueJsonAssetPath, // both come from MaterialAppWrapper widget constructor
    //
    // callouts
    // @Default({}) Map<String, TargetConfig> targetMap,
    // SnippetName? showingSnippetTree,
    // required Map<SnippetName, SnippetRootNode> snippetsMap,
    // required Map<SnippetName, bool> ignoreContraintsCheckMap,
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
    required String? lastSavedModelJson,
  }) = _CAPIState;

  // bool aTargetIsSelected() => selectedTarget != null;

  int targetIndex(TargetConfig tc) {
    TargetGroupConfig? TargetConfig = imageConfig(tc.wName);
    return TargetConfig != null ? TargetConfig.targets.indexOf(tc) : -1;
  }

  // SnippetNode? snippet(String snippetName) {
  //   List<Node>? rootNodes = snippetTreeC.roots.toList();
  //   for (Node rootNode in rootNodes) {
  //     if (rootNode is SnippetNode && rootNode.name == snippetName) return rootNode;
  //   }
  //   return null;
  // }

  TargetGroupConfig? imageConfig(String tgName) => targetGroupMap[tgName];

  TargetConfig? getNewestTarget() => newestTarget;

  TargetConfig? tcByNameOrUid(TargetConfig tc) => tc.single ? singleTarget(name: tc.wName) : _targetGroup(uid: tc.uid);

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

  // TargetConfig? _multiTarget({required String name, required int uid}) {
  //   TargetConfig? result;
  //   CAPITargetConfigList? tcl = imageConfig(name);
  //   try {
  //     result = tcl?.targets.singleWhere((tc) => tc.uid == uid);
  //   } catch (e) {
  //     // ignore and return null
  //   }
  //   return result;
  // }

  TargetConfig? singleTarget({required String name}) {
    // print("singleTargetc: $name");
    TargetConfig? tc;
    var singleTargets = CAPIState.singleTargetMap;
    print(singleTargets.toString());
    try {
      // var names = singleTargetMap.values.map((tc) => tc.wName).toList();
      // print("singleTarget keys: ${names.toString()}");
      // for (TargetConfig atc in singleTargetMap.values) {
      //   print("singleTarget: ${atc.toJson()}");
      // }
      tc = singleTargetMap.values.where((tc) => tc.wName == name).first;
      // print("singleTarget: ${tc.toJson()}");
    } catch (e) {
      // ignore and return null
    }
    return tc;
  }

  int numTargetsOnPage() {
    int numTCs = 0;
    for (TargetGroupConfig list in targetGroupMap.values) {
      numTCs += list.targets.length;
    }
    return numTCs;
  }

  //avoids listening to the same scrollcontroller more than once for the purpose of refreshing the overlays
  static void registerScrollController(ScrollController sController) {
    if (!registeredScrollControllers.contains(sController)) {
      sController.addListener(() => Callout.refreshAll());
    }
  }

  static STreeNode? gkToNode(GlobalKey gk) => gkSTreeNodeMap[gk];

  static SnippetRootNode? rootNodeOfSnippet(STreeNode node) => node.findNearestAncestorOfType(SnippetRootNode) as SnippetRootNode?;

  static SnippetRootNode? rootNodeOfNamedSnippet(SnippetName name) => snippetsMap[name];

  final double CAPI_TARGET_BTN_RADIUS = 15.0;

  /// total duration is sum(target durations) + transition time for each
// int totalDurationMs() => (imageTargetListMap..map((t) => t.calloutDurationMs).reduce((a, b) => a + b)) + TRANSITION_DURATION_MS * (targets.length + 1);
}
