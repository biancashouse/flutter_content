// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter_content/flutter_content.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'snippet_being_edited.dart';

part 'capi_state.freezed.dart';

@freezed
abstract class CAPIState with _$CAPIState {
  // const CAPIState._();

  // one per page, each having its own json data file
  // can have multiple (named) target wrappers, hence the maps
  factory CAPIState({
    // required bool useFirebase,
    // @Default(false) bool localTestingFilePaths, // because filepaths and fonts accedd differently in own package
    // String?
    // initialValueJsonAssetPath, // both come from MaterialAppWrapper widget constructor
    // required ModelUR modelUR,
    // @Default(false) bool hideIframes,
    // @Default(false) bool hideSnippetPencilIcons,

    // @Default(Offset.zero) Offset? directoryTreeCalloutInitialPos,
    // @Default(400) double? directoryTreeCalloutW,
    // @Default(600) double? directoryTreeCalloutH,

    TargetModel? newestTarget,
    TargetModel? selectedTarget,
    //
    // String? selectedPanel,
    @Default(false) bool isSignedIn,
    @Default(false) bool signedInAsGuestEditor,

    @Default(true) bool showClipboardContent,
    @Default(0) int force, // hacky way to force a transition
    @Default(false) bool onlyTargetsWrappers, // hacky way to force a transition
    //==========================================================================================
    //====  PAGE ROUTE NAME  ===================================================================
    //==========================================================================================
    String? routeName,

    //==========================================================================================
    //====  SNIPPET EDITING  ===================================================================
    //==========================================================================================
    // filters page s.t. only named snippet rendered
    SnippetName? showOnlySnippet,

    // when set invoke bloc listener to show tappables
    SnippetName? snippetNameShowingTappableOverlaysFor,

    SnippetBeingEdited? snippetBeingEdited,

    // VersionId? snippetBeingEditedVersionId,
    @Default(true) bool ONLY_TESTING,
  }) = _CAPIState;

}

// Create an extension for your custom logic
extension CAPIStateX on CAPIState {
  bool inSelectWidgetMode() => showOnlySnippet != null;

  TargetModel? getNewestTarget() => newestTarget;
// ... any other custom methods or getters ...
}
