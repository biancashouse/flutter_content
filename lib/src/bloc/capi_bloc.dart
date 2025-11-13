import 'dart:async';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/snippet_being_edited.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_decoration_shape.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_main_axis_size.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/button_style_properties.dart';
import 'package:flutter_content/src/snippet/snodes/fs_image_node.dart';

class CAPIBloC extends Bloc<CAPIEvent, CAPIState> {
  // late SnippetUndoRedoStack _ur;

  final IModelRepository modelRepo;
  final bool authenticated;

  // void clearUR() => _ur.clear();
  //
  // bool get canUndo => _ur.undoQ.isNotEmpty;
  //
  // bool get canRedo => _ur.redoQ.isNotEmpty;
  //
  // int get undoCount => _ur.undoQ.length;
  //
  // int get redoCount => _ur.redoQ.length;

  // void createUndo() {
  //   if (state.snippetBeingEdited?.rootNode != null) {
  //     _ur.createUndo(snippet: state.snippetBeingEdited!.rootNode);
  //   }
  // }

  CAPIBloC({
    required this.modelRepo,
    required this.authenticated,
    SnippetBeingEdited? mockSnippetBeingEdited, // for testing
  }) : super(
         CAPIState(
           snippetBeingEdited: mockSnippetBeingEdited, // testing usage only
           isSignedIn: authenticated,
         ),
       ) {
    // _ur = SnippetUndoRedoStack(this);

    on<SignedIn>((event, emit) => _signedIn(event, emit));
    on<SignedOut>((event, emit) => _signedOut(event, emit));
    on<ForceRefresh>((event, emit) => _forceRefresh(event, emit));
    // on<SelectPanel>((event, emit) => _selectPanel(event, emit));
    on<PublishSnippet>((event, emit) => _publishSnippet(event, emit));
    on<RevertSnippet>((event, emit) => _revertSnippet(event, emit));
    on<ToggleAutoPublishingOfSnippet>(
      (event, emit) => _toggleAutoPublishingOfSnippet(event, emit),
    );
    on<EnterSelectWidgetMode>(
      (event, emit) => _enterSelectWidgetMode(event, emit),
    );
    on<UpdateTappableRects>((event, emit) => _updateTappableRects(event, emit));
    on<ExitSelectWidgetMode>(
      (event, emit) => _exitSelectWidgetMode(event, emit),
    );
    on<PushSnippetEditor>((event, emit) => _pushSnippetEditor(event, emit));
    on<PopSnippetEditor>((event, emit) => _popSnippetEditor(event, emit));
    // removed snippet place naming functionality - use tab bar instead
    // on<SetPanelSnippet>(
    //     (event, emit) => _setPanelOrPlaceholderSnippet(event, emit));
    on<ClearClipboard>((event, emit) => _clearClipboard(event, emit));

    //==========================================================================================
    //====  SNIPPET EDITING  ===================================================================
    //==========================================================================================
    on<SelectNode>((event, emit) => _selectNode(event, emit));
    // on<ShowCutout>((event, emit) => _showCutout(event, emit));
    on<ClearNodeSelection>((event, emit) => _clearNodeSelection(event, emit));
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
      (event, emit) => _selectedDirectoryOrNode(event, emit),
    );
    on<CutNode>((event, emit) => _cutNode(event, emit));
    on<CopyNode>((event, emit) => _copyNode(event, emit));
    on<CopySnippetJsonToClipboard>(
      (event, emit) => _copySnippetJsonToClipboard(event, emit),
    );
    on<ReplaceSnippetFromJson>(
      (event, emit) => _replaceSnippetFromJson(event, emit),
    );
    on<ToggleSnippetVisibility>(
      (event, emit) => _toggleSnippetVisibility(event, emit),
    );
    // on<PageAdded>((event, emit) => _pageAdded(event, emit));
    // on<CreateUndo>((event, emit) => _createUndo(event, emit));
    // on<Undo>((event, emit) => _undo(event, emit));
    // on<Redo>((event, emit) => _redo(event, emit));
  }

  void _signedIn(SignedIn event, emit) async {
    await fco.localStorage.write("signed-in", true);
    emit(
      state.copyWith(
        isSignedIn: true,
        signedInAsGuestEditor: event.asGuestEditor,
      ),
    );
  }

  void _signedOut(event, emit) async {
    await fco.localStorage.write("signed-in", false);
    emit(state.copyWith(isSignedIn: false, signedInAsGuestEditor: false));
  }

  Future<void> _revertSnippet(RevertSnippet event, emit) async {
    SnippetInfoModel? snippetInfo = SnippetInfoModel.cachedSnippetInfo(
      state.snippetBeingEdited?.getRootNode().name ?? 'missing snippet name!',
    );
    if (snippetInfo == null) return;

    final stopwatch = Stopwatch()..start();
    fco.showToastOverlay(
      calloutConfig: CalloutConfig(
        cId: "reverting-model",
        gravity: Alignment.topCenter,
        decorationFillColors: ColorOrGradient.color(Colors.yellow),
        initialCalloutW: fco.scrW * .8,
        initialCalloutH: 40,
        scrollControllerName: null,
      ),
      calloutContent: Padding(
        padding: const EdgeInsets.all(10),
        child: fco.coloredText(
          'snippet reverted to version ${event.versionId}.',
          color: Colors.blueAccent,
        ),
      ),
    );

    await modelRepo.updateSnippetInfo(
      snippetName: event.snippetName,
      newEditingVersionId: event.versionId,
      newPublishingVersionId:
          snippetInfo.autoPublish ?? fco.appInfo.autoPublishDefault
          ? event.versionId
          : snippetInfo.publishedVersionId,
    );

    if (stopwatch.elapsedMilliseconds < 2000) {
      Future.delayed(
        Duration(milliseconds: 2000 - stopwatch.elapsedMilliseconds),
        () {
          fco.dismiss('reverting-model');
        },
      );
    }

    // fco.dismissAll(onlyToasts: true);

    // ensure reverted snippet in memory
    SnippetRootNode? revertedRootNode =
        await SnippetRootNode.loadSnippetFromCacheOrFromFB(
          snippetName: event.snippetName,
        );

    // // reset snippetBeingEdited
    // SnippetInfoModel? snippetInfo = SnippetInfoModel.snippetInfoCache[event.snippetName];
    // if (snippetInfo != null) {
    //   VersionId? currentVersionid = await snippetInfo.currentVersionId();
    //   if (currentVersionid != null) {
    //     snippetInfo.cachedVersions[currentVersionid] = revertedRootNode;
    //   }
    // }

    if (state.snippetBeingEdited != null && revertedRootNode != null) {
      state.snippetBeingEdited!
        ..setRootNode(revertedRootNode)
        ..showProperties = false
        ..selectedNode = null
        ..treeC.roots = [revertedRootNode]
        ..treeC.rebuild()
        ..treeC.expandAll()
        ..jsonBeforeAnyChange = revertedRootNode.toJson();
    }

    // fco.logger.d('');
    // fco.logger.d('');
    // fco.logger.d('');
    // fco.logger.d('');
    // fco.logger.i(revertedRootNode?.toJson());
    // fco.logger.d('');
    // fco.logger.d('');
    // fco.logger.d('');
    // fco.logger.d('');

    emit(state.copyWith(force: state.force + 1));
  }

  // Future<void> _pageAdded(PageAdded event, emit) async {
  //   emit(state.copyWith(force: state.force + 1));
  // }

  // Future<void> _deletePage(DeletePage event, emit) async {
  //   emit(state.copyWith(force: state.force + 1));
  // }

  Future<void> _toggleAutoPublishingOfSnippet(
    ToggleAutoPublishingOfSnippet event,
    emit,
  ) async {
    SnippetInfoModel? snippetInfo = SnippetInfoModel.cachedSnippetInfo(
      event.snippetName,
    );
    if (snippetInfo == null) return;

    bool autoPublish =
        snippetInfo.autoPublish ?? fco.appInfo.autoPublishDefault;
    snippetInfo.autoPublish = !autoPublish;

    await modelRepo.updateSnippetInfo(
      snippetName: event.snippetName,
      newAutoPublish: snippetInfo.autoPublish,
    );

    emit(state.copyWith(force: state.force + 1));
  }

  Future<void> _publishSnippet(PublishSnippet event, emit) async {
    final stopwatch = Stopwatch()..start();
    fco.showToastOverlay(
      calloutConfig: CalloutConfig(
        cId: "publishing-version",
        gravity: Alignment.topCenter,
        decorationFillColors: ColorOrGradient.color(Colors.yellow),
        initialCalloutW: fco.scrW * .8,
        initialCalloutH: 40,
        scrollControllerName: null,
      ),
      calloutContent: Padding(
        padding: const EdgeInsets.all(10),
        child: fco.coloredText(
          'publishing version...',
          color: Colors.blueAccent,
        ),
      ),
    );

    await modelRepo.updateSnippetInfo(
      snippetName: event.snippetName,
      newPublishingVersionId: event.versionId,
    );

    if (stopwatch.elapsedMilliseconds < 2000) {
      await Future.delayed(
        Duration(milliseconds: 2000 - stopwatch.elapsedMilliseconds),
      );
    }

    fco.dismissAll(onlyToasts: true);
    // await FC.loadLatestSnippetMap();
    //
    // emit(state.copyWith(
    //   force: state.force + 1,
    // ));
  }

  Future<void> _toggleSnippetVisibility(
    ToggleSnippetVisibility event,
    emit,
  ) async {
    SnippetInfoModel? snippetInfo = SnippetInfoModel.cachedSnippetInfo(
      event.snippetName!,
    );
    if (snippetInfo == null) {
      return;
    }

    snippetInfo.hide = !(snippetInfo.hide ?? false);

    await modelRepo.updateSnippetInfo(
      snippetName: event.snippetName!,
      newAutoPublish: snippetInfo.autoPublish,
    );

    emit(state.copyWith(force: state.force + 1));
  }

  void _forceRefresh(ForceRefresh event, emit) {
    fco.logger.i(
      "forceRefresh --------------------------------------------------------",
    );
    emit(state.copyWith(force: state.force + 1));
    // if ForceRefresh was set, emit again to reset it in the bloc state
    if (event.onlyTargetsWrappers) {
      emit(state.copyWith(force: state.force, onlyTargetsWrappers: false));
    }
  }

  /// copy snippet json to clipboard
  Future<void> _copySnippetJsonToClipboard(
    CopySnippetJsonToClipboard event,
    emit,
  ) async {
    await FlutterClipboard.copy(event.rootNode.toJson());
  }

  /// paste clipboard, or supplied json String to form a snippet
  Future<void> _replaceSnippetFromJson(
    ReplaceSnippetFromJson event,
    emit,
  ) async {
    SnippetRootNode? rootNode;
    if (event.snippetJson == null) {
      // var snippetJson = jsonEncode({"name":"we-create-flutter-apps","tags":"","child":{"csPropGroup":{"fillColors":{"color1":{"a":1,"r":1,"g":1,"b":1},"color2":null,"color3":null,"color4":null,"color5":null,"color6":null,"color1Value":null,"color2Value":null,"color3Value":null,"color4Value":null,"color5Value":null,"color6Value":null},"fillColorValues":null,"radialGradient":null,"margin":{"top":30,"left":30,"bottom":30,"right":30},"padding":{"top":30,"left":30,"bottom":30,"right":30},"width":null,"height":440,"alignment":"center","decorationShapeEnum":"rounded_rectangle","borderThickness":8,"borderColors":{"color1":{"a":1,"r":0.12941176470588237,"g":0.5882352941176471,"b":0.9529411764705882},"color2":{"a":1,"r":0.2980392156862745,"g":0.6862745098039216,"b":0.3137254901960784},"color3":{"a":1,"r":1,"g":0.9215686274509803,"b":0.23137254901960785},"color4":{"a":1,"r":0.9137254901960784,"g":0.11764705882352941,"b":0.38823529411764707},"color5":null,"color6":null,"color1Value":null,"color2Value":null,"color3Value":null,"color4Value":null,"color5Value":null,"color6Value":null},"borderColorValues":null,"borderRadius":16,"starPoints":null,"dash":null,"gap":null,"badgeWidth":null,"badgeHeight":null,"badgeCorner":null,"badgeText":null,"outlinedBorderGroup":null},"child":{"padding":null,"child":{"mainAxisAlignment":null,"mainAxisSize":"max","crossAxisAlignment":null,"children":[{"flex":1,"fit":"loose","child":{"deltaJsonString":"[{\"insert\":\"We create Flutter apps\",\"attributes\":{\"size\":\"huge\",\"bold\":true}},{\"insert\":\"\\n\\n\"}]","DK:snode":"CL","DK:cl":"QuillTextNode"},"DK:snode":"SC","DK:sc":"FlexibleNode"},{"flex":1,"fit":"loose","child":{"mainAxisAlignment":null,"mainAxisSize":"max","crossAxisAlignment":"start","children":[{"gap":20,"DK:snode":"CL","DK:cl":"GapNode"},{"name":"assets/images/icon_flutter.png","fit":"cover","alignment":null,"width":37,"height":46,"scale":2,"DK:snode":"CL","DK:cl":"AssetImageNode"},{"gap":20,"DK:snode":"CL","DK:cl":"GapNode"},{"flex":10,"fit":"loose","child":{"deltaJsonString":"[{\"insert\":\"We created \",\"attributes\":{\"size\":\"huge\"}},{\"insert\":\"Algorithm Creator\",\"attributes\":{\"color\":\"#FF2196F3\",\"size\":\"huge\",\"bold\":true,\"link\":\"http://algorithmcreator.com\"}},{\"insert\":\", an app that whose mission is to help resurrect the dying art of algorithm modelling. It does this (a) by redefining the \\\"flowchart notation\\\" - now any algorithm or process can be modelled using just 3 shapes: actions, decisions and loops. \",\"attributes\":{\"size\":\"huge\"}},{\"insert\":\"(\",\"attributes\":{\"size\":\"large\"}},{\"insert\":\"actually there's also a Function and Async Function shape for coders\",\"attributes\":{\"size\":\"large\",\"italic\":true}},{\"insert\":\"), \",\"attributes\":{\"size\":\"large\"}},{\"insert\":\"and (b) by having a ui that make iteration fast.\",\"attributes\":{\"size\":\"huge\"}},{\"insert\":\"\\n\\n\"},{\"insert\":\"Designing your app's logic graphically with \",\"attributes\":{\"size\":\"large\"}},{\"insert\":\"Algorithm Creator\",\"attributes\":{\"size\":\"large\",\"bold\":true}},{\"insert\":\" before starting to write code in your IDE significantly improves code robustness: it's more likely to work first time. Our app makes it easy and fast to iterate (refine) your logic.\",\"attributes\":{\"size\":\"large\"}},{\"insert\":\"\\n\\n\"},{\"insert\":\"A fun app to build, refine, publish, and share logic, it will help youngsters learn how to think about Algorithms.\",\"attributes\":{\"size\":\"large\",\"italic\":true}},{\"insert\":\"\\n\"}]","DK:snode":"CL","DK:cl":"QuillTextNode"},"DK:snode":"SC","DK:sc":"FlexibleNode"},{"gap":20,"DK:snode":"CL","DK:cl":"GapNode"},{"flex":6,"child":{"name":"assets/images/algc-icon-423-233.png","fit":"contain","alignment":"center","width":null,"height":null,"scale":2,"DK:snode":"CL","DK:cl":"AssetImageNode"},"DK:snode":"SC","DK:sc":"FlexibleNode","DK:flexible":"ExpandedNode"}],"DK:snode":"MC","DK:mc":"FlexNode","DK:flex":"RowNode"},"DK:snode":"SC","DK:sc":"FlexibleNode"}],"DK:snode":"MC","DK:mc":"FlexNode","DK:flex":"ColumnNode"},"DK:snode":"SC","DK:sc":"SingleChildScrollViewNode"},"DK:snode":"SC","DK:sc":"ContainerNode"},"DK:snode":"SC","DK:sc":"SnippetRootNode"});
      var snippetJson = await FlutterClipboard.paste();
      rootNode = SnippetRootNodeMapper.fromJson(snippetJson);
    } else {
      rootNode = SnippetRootNodeMapper.fromJson(event.snippetJson!);
    }
    fco.logger.i('_replaceSnippetFromJson: snippet name is "${rootNode.name}"');
    // save the clipboard snippet
    final newVersionId = SnippetInfoModel.createNewVersion(rootNode);
    fco.modelRepo.saveSnippetVersion(snippetName: rootNode.name, newVersionId: newVersionId, newVersion: rootNode);
  }

  Future<void> _clearClipboard(ClearClipboard event, emit) async {
    _updateClipboard(null);
    emit(state.copyWith(force: state.force + 1));
    fco.modelRepo.saveAppInfo();
  }

  // whenever you use what's on the clipboard, clone it first
  // otherwise will get duplicate GK etc.
  Future<void> _updateClipboard(
    SNode? newContent,
    // ScrollControllerName? scName,
  ) async {
    fco.appInfo.clipboard = newContent?.clone();
    // possibly hide or show clipbaord tab
    fco.appInfo.hideClipboard();
    if (newContent != null) {
      fco.appInfo.showFloatingClipboard();
    }
  }

  // void _selectPanel(SelectPanel event, emit) {
  //   // null clears selection
  //   emit(
  //     state.copyWith(selectedPanel: event.panelName, force: state.force + 1),
  //   );
  // }

  void _pushSnippetEditor(PushSnippetEditor event, emit) {
    SnippetTreeController newTreeC() => SnippetTreeController(
      roots: [event.rootNode],
      childrenProvider: SNode.childrenProvider,
      parentProvider: SNode.parentProvider,
    );

    SnippetBeingEdited snippetBeingEdited = SnippetBeingEdited(
      jsonBeforeAnyChange: event.rootNode.toJson(),
      treeC: newTreeC()..expandAll(),
      selectedNode: event.selectedNode,
      showProperties: true,
      nodeBeingDeleted: null,
    )..setRootNode(event.rootNode);

    emit(
      state.copyWith(
        // hideAllTargetGroupPlayBtns: true,
        // hideTargetsExcept: null,
        activeSnippetName: null,
        snippetBeingEdited: snippetBeingEdited,
        // hideSnippetPencilIcons: true,
        onlyTargetsWrappers: true,
      ),
    );
    emit(state.copyWith(onlyTargetsWrappers: false));
  }

  Future<void> _popSnippetEditor(PopSnippetEditor event, emit) async {
    // if (state.snippetBeingEdited?.aNodeIsNotSelected??false) return;
    if (event.save) {
      //TODO save snippet
    }
    fco.dismiss(CalloutConfigToolbar.CID);
    // fco.dismissAll();
    emit(
      state.copyWith(
        snippetBeingEdited: null,
      ),
    );
  }

  void _enterSelectWidgetMode(EnterSelectWidgetMode event, emit) async {
    fco.nodesByGK.clear();
    emit(
      state.copyWith(
         // This tells the UI to enter the widget select mode.
        activeSnippetName: event.snippetName,
      ),
    );
    // The UI layer will now be responsible for waiting until after the next
    // frame is rendered and then dispatching an 'UpdateTappableRects' event.
  }

  void _updateTappableRects(UpdateTappableRects event, emit) async {
    if (showTappableBorderRects()) {
      emit(
        state.copyWith(
          // tappableNodeRects: _populateNodeBorderRects(
          //   state.snippetNameShowingTappableOverlaysFor!,
          ),
        // ),
      );
    }
  }


  void _exitSelectWidgetMode(ExitSelectWidgetMode event, emit) {
    fco.dismissAll();
    emit(
      state.copyWith(
        activeSnippetName: null,
      ),
    );
  }

  // void _setPanelOrPlaceholderSnippet(SetPanelSnippet event, emit) {
  //   fco.snippetPlacementMap[event.panelName] = event.snippetName;
  //   emit(state.copyWith(
  //     force: state.force + 1,
  //   ));
  // }

  //==========================================================================================
  //====  SNIPPET EDITING  ===================================================================
  //==========================================================================================
  void _forceSnippetRefresh(ForceSnippetRefresh event, emit) {
    fco.logger.i("forceSnippetRefresh");
    emit(state.copyWith(force: state.force + 1));
  }

  void _selectNode(SelectNode event, emit) {
    // ignore repeated selection
    if (state.snippetBeingEdited?.selectedNode == event.node) return;

    // if new selection is a node above this tree root, reset the tree's root to it
    // bool resetTree = !state.snippetBeingEdited!.treeC.nodeIsADescendantOf(
    //   state.snippetBeingEdited!.treeC.roots.first,
    //   event.node,
    // );
    // TreeSearchResult<STreeNode> result =
    //     state.treeC.search((snode) => snode == event.node);
    // SnippetTreeController possiblyNewTreeC = state.snippetBeingEdited!.treeC;
    // if (resetTree) {
    //   possiblyNewTreeC = SnippetTreeController(
    //     roots: [event.node],
    //     childrenProvider: Node.snippetTreeChildrenProvider,
    //     parentProvider: Node.snippetTreeParentProvider,
    //   ); //..expandAll();
    // }
    // state.snippetBeingEdited!.treeC = possiblyNewTreeC;
    state.snippetBeingEdited!.selectedNode = event.node;
    // state.snippetBeingEdited!.selectedTreeNodeGK = event.selectedTreeNodeGK;
    state.snippetBeingEdited!.showProperties = true;
    state.snippetBeingEdited!.nodeBeingDeleted = null;
    state.snippetBeingEdited!.treeC.rebuild();

    emit(state.copyWith(force: state.force + 1));
  }

  void _clearNodeSelection(ClearNodeSelection event, emit) {
    if (state.snippetBeingEdited?.aNodeIsNotSelected ?? false) return;
    state.snippetBeingEdited!.selectedNode = null;
    state.snippetBeingEdited!.showProperties = false;

    emit(state.copyWith(force: state.force + 1));

    // fco.afterMsDelayDo(1300, () {
    //   restore scroll offset
    // NamedScrollController.restoreOffsetTo(event.scName, savedOffset);
    // });
    // } else {
    //   emit(state.copyWith(
    //     force: state.force + 1,
    //   ));
    // }
  }

  Future<void> _deleteNodeTapped(DeleteNodeTapped event, emit) async {
    if (state.snippetBeingEdited?.aNodeIsNotSelected ?? false) return;
    state.snippetBeingEdited!.nodeBeingDeleted =
        state.snippetBeingEdited!.selectedNode;
    emit(state.copyWith(force: state.force + 1));
  }

  Future<void> _completeDeletion(CompleteDeletion event, emit) async {
    // state.snippetBeingEdited?.newVersion();

    if (state.snippetBeingEdited?.aNodeIsNotSelected ?? false) return;

    // STreeNode? sel = state.selectedNode;
    // STreeNode? selParent = sel?.getParent() as STreeNode?;
    SNode newSel = _possiblyRemoveFromParentButNotChildren();
    SnippetTreeController possiblyNewTreeC = state.snippetBeingEdited!.treeC;
    // if (newSel.getParent() is SnippetRootNode) {
    //   possiblyNewTreeC = SnippetTreeController(
    //     roots: [newSel],
    //     childrenProvider: Node.snippetTreeChildrenProvider,
    //     parentProvider: Node.snippetTreeParentProvider,
    //   );
    // }
    possiblyNewTreeC.rebuild();
    // fco.logger.i("--------------");
    // fco.logger.i(state.snippetTreeC.roots.first.toMap());
    state.snippetBeingEdited!.treeC = possiblyNewTreeC;
    state.snippetBeingEdited!.nodeBeingDeleted = null;
    state.snippetBeingEdited!.selectedNode = newSel;

    final newSnippet = state.snippetBeingEdited!.getRootNode();
    final newVersionId = SnippetInfoModel.createNewVersion(newSnippet);
    fco.modelRepo.saveSnippetVersion(snippetName: newSnippet.name, newVersionId: newVersionId, newVersion: newSnippet);

    emit(
      state.copyWith(
        snippetBeingEdited: state.snippetBeingEdited,
        force: state.force + 1,
      ),
    );
  }

  // Future<void> _showCutout(ShowCutout event, emit) async {
  //   if (state.snippetBeingEdited?.aNodeIsNotSelected??false) return;
  //
  //   Rect? r =
  //       state.snippetBeingEdited?.selectedNode?.nodeWidgetGK?.globalPaintBounds(
  //     skipWidthConstraintWarning: true,
  //     skipHeightConstraintWarning: true,
  //   );
  //   if (r != null) {
  //     emit(state.copyWith(
  //       force: state.force + 1,
  //     ));
  //   }
  // }

  SNode _possiblyRemoveFromParentButNotChildren() {
    SNode sel = state.snippetBeingEdited!.selectedNode!;

    // node to be deleted must have a parent; i.e. not a snippetrootnode
    if (sel.getParent() == null) return sel;

    if (sel is ScaffoldNode) {
      return sel.removeFromParent();
    }

    SNode selParent = sel.getParent() as SNode;
    late SNode newSel;
    //tab-related
    if (sel.isAScaffoldTabWidget() && !sel.hasChildren()) {
      int index = (selParent as TabBarNode).children.indexOf(sel);
      selParent.children.remove(sel);
      ScaffoldNode? scaffold =
          selParent.getParent()?.getParent()?.getParent() as ScaffoldNode?;
      if (scaffold?.body.child is TabBarViewNode?) {
        (scaffold!.body.child as TabBarViewNode).children.removeAt(index);
      }
      newSel = selParent;
      // tabView-related
    } else if (sel.isAScaffoldTabViewWidget() && !sel.hasChildren()) {
      int index = (selParent as TabBarViewNode).children.indexOf(sel);
      selParent.children.remove(sel);
      ScaffoldNode? scaffold =
          selParent.getParent()?.getParent() as ScaffoldNode?;
      if (scaffold?.appBar is AppBarNode) {
        AppBarNode appbar = scaffold?.appBar as AppBarNode;
        SNode? bottomChild = appbar.bottom.child;
        if (bottomChild is TabBarNode) {
          bottomChild.children.removeAt(index);
        }
      }
      newSel = selParent;
    } else if (sel is SliverAppBarNode) {
      (selParent as MC).children.remove(sel);
      newSel = selParent;
    } else if (sel is StepNode && selParent is StepperNode) {
      selParent.children.remove(sel);
      newSel = selParent;
    } else if (sel is PollOptionNode && selParent is PollNode) {
      selParent.children.remove(sel);
      newSel = selParent;
    } else if (selParent is SnippetRootNode && sel is CL) {
      SNode ph = PlaceholderNode()..setParent(selParent);
      newSel = selParent.child = ph;
    } else if (selParent is SnippetRootNode && sel is SC && sel.child == null) {
      SNode ph = PlaceholderNode()..setParent(selParent);
      newSel = selParent.child = ph;
    } else if (selParent is SnippetRootNode &&
        sel is MC &&
        sel.children.isEmpty) {
      SNode ph = PlaceholderNode()..setParent(selParent);
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
      selParent.text = TextSpanNode(
        text: 'xxx',
        tsPropGroup: TextStyleProperties(),
      )..setParent(selParent);
      newSel = selParent;
    } else if (selParent is TextSpanNode) {
      selParent.children!.remove(sel);
      newSel = selParent;
    } else if (selParent is NamedSC && selParent.propertyName == 'title') {
      selParent.child = TextNode(
        text: 'must have a title widget!',
        tsPropGroup: TextStyleProperties(),
      )..setParent(selParent);
      newSel = selParent;
    } else if (selParent is NamedSC && selParent.propertyName == 'content') {
      selParent.child = TextNode(
        text: 'must have a content widget!',
        tsPropGroup: TextStyleProperties(),
      )..setParent(selParent);
      newSel = selParent;
    }

    if (newSel is SnippetRootNode &&
        newSel.getParent() == null &&
        newSel.child != null) {
      newSel = newSel.child!;
    }
    return newSel;
  }

  Future<void> _cutNode(CutNode event, emit) async {
    void cutIncludingAnyChildren(SNode node) {
      if (state.snippetBeingEdited?.aNodeIsNotSelected ?? false) return;
      if (node != state.snippetBeingEdited!.getRootNode()) {
        // was: if (state.selectedNode?.parent != null) {
        SNode parentNode = node.getParent() as SNode;
        if (parentNode is SC) {
          parentNode.child = null;
        } else if (parentNode is MC) {
          parentNode.children.remove(node);
        } else if (parentNode is TextSpanNode) {
          parentNode.children?.remove(node);
        }
      }
    }

    if (state.snippetBeingEdited?.aNodeIsNotSelected ?? false) return;
    cutIncludingAnyChildren(event.node);
    state.snippetBeingEdited!.treeC.rebuild();
    _updateClipboard(event.node);
    emit(state.copyWith(force: state.force + 1));
    final newSnippet = state.snippetBeingEdited!.getRootNode();
    final newVersionId = SnippetInfoModel.createNewVersion(newSnippet);
    fco.modelRepo.saveSnippetVersion(snippetName: newSnippet.name, newVersionId: newVersionId, newVersion: newSnippet);
  }

  Future<void> _copyNode(CopyNode event, emit) async {
    if (state.snippetBeingEdited?.aNodeIsNotSelected ?? false) return;
    _updateClipboard(event.node);
    emit(state.copyWith(force: state.force + 1));
    fco.modelRepo.saveAppInfo();
  }

  SNode _typeAsATreeNode(
    Type t,
    SNode? childNode,
    String notFoundMsg, {
    SnippetName? snippetName,
  }) {
    // in case tabbar specified
    final uniqueTabBarName = DateTime.now().millisecondsSinceEpoch.toString();
    return switch (t) {
      const (AlignNode) => AlignNode(
        child: childNode,
        alignment: AlignmentEnum.topLeft,
      ),
      const (AspectRatioNode) => AspectRatioNode(child: childNode),
      const (AssetImageNode) => AssetImageNode(),
      const (AlgCNode) => AlgCNode(),
      // const (AppBarWithTabBarNode) => AppBarWithTabBarNode(
      //     tabBarName: uniqueTabBarName,
      //     height: 24,
      //     title: GenericSingleChildNode(
      //       propertyName: 'title',
      //       child: TextNode(text: ''),
      //     ),
      //     bottom: GenericSingleChildNode(
      //       propertyName: 'bottom',
      //       child: TabBarNode(name: uniqueTabBarName, children: []),
      //     )),
      // const (AppBarWithMenuBarNode) => AppBarWithMenuBarNode(
      //     height: 24,
      //     title: GenericSingleChildNode(
      //       propertyName: 'title',
      //       child: TextNode(text: ''),
      //     ),
      //     bottom: GenericSingleChildNode(
      //         propertyName: 'bottom', child: MenuBarNode(children: [])),
      //   ),
      const (AppBarNode) => AppBarNode(
        title: NamedSC(
          propertyName: 'title',
          child: TextNode(
            text: 'appbar title',
            tsPropGroup: TextStyleProperties(),
          ),
        ),
        titleTextStyle: TextStyleProperties(),
        actions: NamedMC(propertyName: 'actions', children: []),
        leading: NamedSC(propertyName: 'leading'),
        bottom: NamedPS(propertyName: 'bottom'),
      ),
      const (UMLImageNode) => UMLImageNode(),
      const (FSImageNode) => FSImageNode(),
      // const (FirebaseStorageImageNode) => FirebaseStorageImageNode(),
      const (ConstrainedBoxNode) => ConstrainedBoxNode(),
      const (CarouselNode) => CarouselNode(
        children: childNode != null ? [childNode] : [],
      ),
      const (CenterNode) => CenterNode(child: childNode),
      const (ChipNode) => ChipNode(labelTSPropGroup: TextStyleProperties()),
      const (ColumnNode) => ColumnNode(
        mainAxisSize: MainAxisSizeEnum.max,
        children: childNode != null ? [childNode] : [],
      ),
      const (ContainerNode) =>
        state.snippetBeingEdited!.selectedNode?.getParent() is ContainerNode
            ? ContainerNode(
                csPropGroup: ContainerStyleProperties(
                  alignment: AlignmentEnum.center,
                ),
                child: childNode,
              )
            : ContainerNode(
                csPropGroup: ContainerStyleProperties(),
                child: childNode,
              ),
      // const (ContentSnippetRootNode) => ContentSnippetRootNode(name: 'content', child: childNode),
      const (CustomScrollViewNode) => CustomScrollViewNode(slivers: []),
      const (DefaultTextStyleNode) => DefaultTextStyleNode(
        child: childNode,
        tsPropGroup: TextStyleProperties(
          fontSizeName: Material3TextSizeEnum.bodyM,
        ),
      ),
      // const (FSBucketNode) => FSBucketNode(
      //     name: 'bucket name missing ?',
      //     root: GenericSingleChildNode(
      //         propertyName: 'root',
      //         child: FSDirectoryNode(name: 'root', children: []))),
      const (DirectoryNode) => DirectoryNode(children: []),
      // const (FSDirectoryNode) => FSDirectoryNode(children: []),
      const (ExpandedNode) => ExpandedNode(child: childNode),
      const (ElevatedButtonNode) => ElevatedButtonNode(
        child: TextNode(text: 'some-text', tsPropGroup: TextStyleProperties()),
        bsPropGroup: ButtonStyleProperties(tsPropGroup: TextStyleProperties()),
      ),
      const (FileNode) => FileNode(name: '', src: ''),
      // const (FSFileNode) => FSFileNode(name: ''),
      const (FilledButtonNode) => FilledButtonNode(
        child: TextNode(text: 'some-text', tsPropGroup: TextStyleProperties()),
        bsPropGroup: ButtonStyleProperties(tsPropGroup: TextStyleProperties()),
      ),
      const (FlexibleNode) => FlexibleNode(child: childNode),
      const (GapNode) => GapNode(gap: 0),
      const (GoogleDriveIFrameNode) => GoogleDriveIFrameNode(),
      const (GridViewNode) => GridViewNode(children: []),
      const (IconButtonNode) => IconButtonNode(
        bsPropGroup: ButtonStyleProperties(tsPropGroup: TextStyleProperties()),
      ),
      const (IFrameNode) => IFrameNode(),
      const (InteractiveViewerNode) => InteractiveViewerNode(child: childNode),
      const (IntrinsicWidthNode) => IntrinsicWidthNode(child: childNode),
      const (IntrinsicHeightNode) => IntrinsicHeightNode(child: childNode),
      const (ListViewNode) => ListViewNode(children: []),
      const (MarkdownNode) => MarkdownNode(),
      const (MenuBarNode) => MenuBarNode(children: []),
      const (MenuItemButtonNode) => MenuItemButtonNode(
        child: TextNode(text: 'item-text', tsPropGroup: TextStyleProperties()),
        bsPropGroup: ButtonStyleProperties(tsPropGroup: TextStyleProperties()),
      ),
      const (OutlinedButtonNode) => OutlinedButtonNode(
        bsPropGroup: ButtonStyleProperties(tsPropGroup: TextStyleProperties()),
      ),
      const (PaddingNode) => PaddingNode(
        padding: EdgeInsetsValue(),
        child: childNode,
      ),
      const (PlaceholderNode) => PlaceholderNode(),
      const (PinnedHeaderSliverNode) => PinnedHeaderSliverNode(),
      const (PollNode) => PollNode(
        name: 'sample-poll',
        title: 'Sample Poll',
        children: [
          PollOptionNode(text: 'option 1 text?'),
          PollOptionNode(text: 'option 2 text?'),
          PollOptionNode(text: 'option 3 text?'),
        ],
      ),
      const (PollOptionNode) => PollOptionNode(text: 'new option text?'),
      const (PositionedNode) => PositionedNode(
        top: 0,
        left: 0,
        child: childNode,
      ),
      const (QuillTextNode) => QuillTextNode(),
      const (RichTextNode) => RichTextNode(
        text: TextSpanNode(
          text: 'rich',
          tsPropGroup: TextStyleProperties(color: ColorModel.blue()),
          children: [
            TextSpanNode(text: '-', tsPropGroup: TextStyleProperties()),
            TextSpanNode(
              text: '-text',
              tsPropGroup: TextStyleProperties(color: ColorModel.red()),
            ),
          ],
        ),
      ),
      const (RowNode) => RowNode(
        children: childNode != null ? [childNode] : [],
      ),
      const (ScaffoldNode) => ScaffoldNode(
        appBar: NamedPS(
          propertyName: 'appBar',
          child: AppBarNode(
            title: NamedSC(propertyName: 'title'),
            titleTextStyle: TextStyleProperties(),
            leading: NamedSC(propertyName: 'leading'),
            bottom: NamedPS(propertyName: 'bottom'),
            actions: NamedMC(propertyName: 'actions', children: []),
          ),
        ),
        body: NamedSC(propertyName: 'body', child: childNode),
      ),
      const (SingleChildScrollViewNode) => SingleChildScrollViewNode(
        child: childNode,
      ),
      const (SizedBoxNode) => SizedBoxNode(child: childNode),
      const (SliverAppBarNode) => SliverAppBarNode(
        title: NamedSC(
          propertyName: 'title',
          child: TextNode(
            text: 'sliver appbar title',
            tsPropGroup: TextStyleProperties(),
          ),
        ),
        titleTextStyle: TextStyleProperties(),
        leading: NamedSC(propertyName: 'leading'),
        actions: NamedMC(propertyName: 'actions', children: []),
        bottom: NamedPS(propertyName: 'bottom'),
        flexibleSpace: NamedSC(
          propertyName: 'flexibleSpace',
          child: FlexibleSpaceBarNode(
            title: NamedSC(
              propertyName: 'title',
              child: TextNode(
                text: 'sliver appbar flexible space bar title',
                tsPropGroup: TextStyleProperties(),
              ),
            ),
            background: NamedSC(
              propertyName: 'background',
              child: PlaceholderNode(),
            ),
          ),
        ),
      ),
      const (SliverListListNode) => SliverListListNode(children: []),
      const (SliverToBoxAdapterNode) => SliverToBoxAdapterNode(),
      const (SliverFloatingHeaderNode) => SliverFloatingHeaderNode(),
      const (SliverResizingHeaderNode) => SliverResizingHeaderNode(),
      const (SnippetRootNode) => SnippetRootNode(name: snippetName!),
      const (SplitViewNode) => SplitViewNode(
        children: childNode != null
            ? [childNode]
            : [
                CenterNode(
                  child: ContainerNode(
                    csPropGroup: ContainerStyleProperties(
                      fillColors: UpTo6Colors(
                        color1: ColorModel.fromColor(Colors.red),
                      ),
                    ),
                  ),
                ),
                CenterNode(
                  child: ContainerNode(
                    csPropGroup: ContainerStyleProperties(
                      fillColors: UpTo6Colors(
                        color1: ColorModel.fromColor(Colors.blue),
                      ),
                    ),
                  ),
                ),
              ],
      ),
      const (StackNode) => StackNode(
        children: childNode != null ? [childNode] : [],
      ),
      const (StepNode) => StepNode(
        title: NamedSC(
          propertyName: 'title',
          child: TextNode(
            text: 'step title',
            tsPropGroup: TextStyleProperties(),
          ),
        ),
        subtitle: NamedSC(
          propertyName: 'subtitle',
          child: TextNode(text: 'subtitle', tsPropGroup: TextStyleProperties()),
        ),
        content: NamedSC(
          propertyName: 'content',
          child: TextNode(text: 'content', tsPropGroup: TextStyleProperties()),
        ),
      ),
      const (StepperNode) => StepperNode(
        children: [
          StepNode(
            title: NamedSC(
              propertyName: 'title',
              child: TextNode(
                text: 'step 1 title',
                tsPropGroup: TextStyleProperties(),
              ),
            ),
            subtitle: NamedSC(
              propertyName: 'subtitle',
              child: TextNode(
                text: 'subtitle',
                tsPropGroup: TextStyleProperties(),
              ),
            ),
            content: NamedSC(
              propertyName: 'content',
              child: TextNode(
                text: 'my content 1',
                tsPropGroup: TextStyleProperties(),
              ),
            ),
          ),
          StepNode(
            title: NamedSC(
              propertyName: 'title',
              child: TextNode(
                text: 'step 2 title',
                tsPropGroup: TextStyleProperties(),
              ),
            ),
            subtitle: NamedSC(
              propertyName: 'subtitle',
              child: TextNode(
                text: 'subtitle',
                tsPropGroup: TextStyleProperties(),
              ),
            ),
            content: NamedSC(
              propertyName: 'content',
              child: TextNode(
                text: 'my content 2',
                tsPropGroup: TextStyleProperties(),
              ),
            ),
          ),
          StepNode(
            title: NamedSC(
              propertyName: 'title',
              child: TextNode(
                text: 'step 3 title',
                tsPropGroup: TextStyleProperties(),
              ),
            ),
            subtitle: NamedSC(
              propertyName: 'subtitle',
              child: TextNode(
                text: 'subtitle',
                tsPropGroup: TextStyleProperties(),
              ),
            ),
            content: NamedSC(
              propertyName: 'content',
              child: TextNode(
                text: 'my content 3',
                tsPropGroup: TextStyleProperties(),
              ),
            ),
          ),
        ],
      ),
      const (SubmenuButtonNode) => SubmenuButtonNode(
        menuChildren: childNode != null ? [childNode] : [],
      ),
      // const (SubtitleSnippetRootNode) => SubtitleSnippetRootNode(name: 'subtitle', child: childNode),
      // const (TargetButtonNode) =>
      //   TargetButtonNode(name: 'no name!', child: childNode),
      const (TargetsWrapperNode) => TargetsWrapperNode(child: childNode),
      const (TabNode) => TabNode(text: 'new tab'),
      const (TabBarNode) => TabBarNode(
        name: uniqueTabBarName,
        labelTSPropGroup: TextStyleProperties(),
        children: childNode != null ? [childNode] : [],
      ),
      const (TabBarViewNode) => TabBarViewNode(
        tabBarName: uniqueTabBarName,
        children: childNode != null ? [childNode] : [],
      ),
      const (TextButtonNode) => TextButtonNode(
        child: TextNode(text: 'some-text', tsPropGroup: TextStyleProperties()),
        bsPropGroup: ButtonStyleProperties(tsPropGroup: TextStyleProperties()),
      ),
      const (TextNode) => TextNode(
        text: 'some-text',
        tsPropGroup: TextStyleProperties(),
      ),
      const (TextSpanNode) => TextSpanNode(
        children: [],
        tsPropGroup: TextStyleProperties(),
      ),
      const (WidgetSpanNode) => WidgetSpanNode(child: childNode),
      const (WrapNode) => WrapNode(
        children: childNode != null ? [childNode] : [],
      ),
      const (YTNode) => YTNode(),
      _ => throw (Exception(notFoundMsg)),
    };
  }

  void _wrapWith(WrapSelectionWith event, emit) {
    // state.snippetBeingEdited?.newVersion();

    if (state.snippetBeingEdited?.aNodeIsNotSelected ?? false) {
      return;
    }

    SNode wChild = state.snippetBeingEdited!.selectedNode!;
    SNode? parent = wChild.getParent() as SNode?;
    SNode w = event.type != null
        ? _typeAsATreeNode(
            event.type!,
            wChild,
            "_wrapWith() missing ${event.type.toString()}",
            snippetName: event.snippetName,
          )
        : event.testNode!;

    if (w is ScaffoldNode) {
      w.body.child = wChild;
      w.setParent(parent);
      wChild.setParent(null);
      if (parent is SC) {
        parent.child = w;
      } else if (parent is MC) {
        parent.children.add(w);
      }
    } else {
      if (w is CL || w is WidgetSpanNode) return;
      if (wChild is InlineSpanNode && w is! InlineSpanNode) return;
      if (w is PollNode && wChild is! PollOptionNode) return;
      if (wChild is PollOptionNode && w is! PollNode) return;
      if (w is StepperNode && wChild is! StepNode) return;
      if (wChild is StepNode && w is! StepperNode) return;
      if (wChild is ExpandedNode && w is! FlexNode) return;
      if (wChild is FlexibleNode && w is! FlexNode) return;
      if (wChild is PositionedNode && w is! StackNode) return;
      if (wChild is InlineSpanNode &&
          parent is RichTextNode &&
          w is RichTextNode) {
        return;
      }
      if (wChild is InlineSpanNode &&
          parent is! RichTextNode &&
          w is! InlineSpanNode) {
        return;
      }

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
          csPropGroup: ContainerStyleProperties(
            decorationShapeEnum: DecorationShapeEnum.rectangle_dotted,
            borderColors: UpTo6Colors(
              color1: ColorModel.fromColor(Colors.black),
            ),
            borderThickness: 4,
          ),
          child: w,
        )..setParent((pollParent));
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
    }

    // update treeC if rootNode changed (that's the Snippet's child)
    SnippetTreeController possiblyNewTreeC = state.snippetBeingEdited!.treeC;

    // child of snippet root
    if (parent is SnippetRootNode) {
      possiblyNewTreeC = SnippetTreeController(
        roots: [parent],
        childrenProvider: SNode.childrenProvider,
        parentProvider: SNode.parentProvider,
      );
    }

    possiblyNewTreeC.expand(w);
    possiblyNewTreeC.rebuild();
    state.snippetBeingEdited!
      ..selectedNode = w
      ..treeC = possiblyNewTreeC;

    final newSnippet = state.snippetBeingEdited!.getRootNode();
    final newVersionId = SnippetInfoModel.createNewVersion(newSnippet);
    fco.modelRepo.saveSnippetVersion(snippetName: newSnippet.name, newVersionId: newVersionId, newVersion: newSnippet);

    emit(state.copyWith(force: state.force + 1));
  }

  void _replaceWith(ReplaceSelectionWith event, emit) {
    if (state.snippetBeingEdited?.aNodeIsNotSelected ?? false) return;

    SNode selectedNode = state.snippetBeingEdited!.selectedNode!;
    if (event.type == selectedNode.runtimeType) return;

    SNode newNode = event.type != null
        ? _typeAsATreeNode(
            event.type!,
            null,
            "_replaceWith() missing ${event.type.toString()}",
            snippetName: event.snippetName,
          )
        : event.testNode!;
    _replaceWithNewNodeOrClipboard(selectedNode, emit, newNode);
  }

  void _replaceWithNewNodeOrClipboard(SNode sel, emit, SNode r) {
    // state.snippetBeingEdited?.newVersion();

    if (state.snippetBeingEdited?.aNodeIsNotSelected ?? false) return;

    if (sel is InlineSpanNode && r is! InlineSpanNode) return;
    if (sel is! InlineSpanNode && r is InlineSpanNode) return;
    if (sel is PollOptionNode && r is! PollOptionNode) return;
    if (sel is StepNode && r is! StepNode) return;

    SNode? parent = sel.getParent() as SNode?;

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
          for (SNode child in r.children) {
            child.setParent(r);
          }
        } else if (sel is SC && sel.child != null && r is MC) {
          SNode child = sel.child!;
          r.children.add(child);
          child.setParent(r);
        }
      }
    } catch (e) {
      fco.logger.i("\n ***  _replaceWithNewNodeOrClipboard() - failed!  ***");
      rethrow;
    }

    // update treeC if rootNode changed (that's the Snippet's child)
    SnippetTreeController possiblyNewTreeC = state.snippetBeingEdited!.treeC;

    // child of snippet root
    if (parent is SnippetRootNode) {
      possiblyNewTreeC = SnippetTreeController(
        roots: [parent],
        childrenProvider: SNode.childrenProvider,
        parentProvider: SNode.parentProvider,
      );
      // if snippet is inside another snippet, then must update it's cached snippet entry
      if (parent.getParent() != null) {
        SnippetRootNode? parentSnippetRootNode = (parent.getParent() as SNode)
            .rootNodeOfSnippet();
        if (parentSnippetRootNode != null) {
          SnippetInfoModel? snippetInfo = SnippetInfoModel.cachedSnippetInfo(
            parentSnippetRootNode.name,
          );
          if (snippetInfo != null) {
            VersionId? currVersionId = snippetInfo.currentVersionId();
            // SnippetRootNode? currVer = snippetInfo.cachedVersions[currVersionId];
            if (currVersionId != null) {
              snippetInfo.cachedVersions.remove(currVersionId);
            }
          }
        }
      }
    }

    possiblyNewTreeC.roots.first.validateTree();
    possiblyNewTreeC.expandCascading([parent!]);
    possiblyNewTreeC.rebuild();

    state.snippetBeingEdited!
      ..selectedNode = r
      ..treeC = possiblyNewTreeC;

    final newSnippet = state.snippetBeingEdited!.getRootNode();
    final newVersionId = SnippetInfoModel.createNewVersion(newSnippet);
    fco.modelRepo.saveSnippetVersion(snippetName: newSnippet.name, newVersionId: newVersionId, newVersion: newSnippet);

    emit(state.copyWith(force: state.force + 1));
  }

  void _addChild(AppendChild event, emit) {
    if (state.snippetBeingEdited?.aNodeIsNotSelected ?? false) return;

    SNode selectedNode = state.snippetBeingEdited!.selectedNode!;
    SNode newNode = event.type != null
        ? _typeAsATreeNode(
            event.type!,
            null,
            "_addChild() missing ${event.type.toString()}",
            snippetName: event.snippetName,
          )
        : event.testNode!;
    _addOrPasteChild(selectedNode, emit, newNode);
  }

  void _addOrPasteChild(SNode selectedNode, emit, SNode newNode) {
    // state.snippetBeingEdited?.newVersion();

    // STreeNode? childNode;

    // if (selectedNode is ContainerNode) {
    //   selectedNode.alignment = AlignmentEnumModel.center;
    // }
    // if (selectedNode is PlaceholderNode) {
    //   selectedNode.child = newNode;
    //   if (state.selectedNode?.parent != null &&
    //       state.selectedNode?.parent is SingleChildNode &&
    //       (state.selectedNode?.parent as SingleChildNode).child == selectedNode) {
    //     (state.selectedNode?.parent as SingleChildNode).child = newNode;
    //   }
    // } else
    SnippetRootNode rootNode = state.snippetBeingEdited!.getRootNode();
    if (selectedNode is TabBarNode) {
      TabBarViewNode? tabBarViewNode =
          state.snippetBeingEdited!.treeC.findNodeTypeInTree(
                rootNode,
                TabBarViewNode,
              )
              as TabBarViewNode?;
      SNode newTabView = PlaceholderNode();
      tabBarViewNode?.children.add(newTabView);
      newTabView.setParent(tabBarViewNode);
      selectedNode.children.add(newNode);
      // scaffoldNode?.numTabs++;
    } else if (selectedNode is TabBarViewNode) {
      // ScaffoldNode? scaffoldNode = state.treeC
      //     .findNodeTypeInTree(rootNode, ScaffoldNode) as ScaffoldNode?;
      TabBarNode? tabBarNode =
          state.snippetBeingEdited!.treeC.findNodeTypeInTree(
                rootNode,
                TabBarNode,
              )
              as TabBarNode?;
      SNode newTab = TextNode(
        text: 'new tab',
        tsPropGroup: TextStyleProperties(),
      );
      tabBarNode?.children.add(newTab);
      newTab.setParent(tabBarNode);
      selectedNode.children.add(newNode);
      // scaffoldNode?.numTabs++;
    } else if (selectedNode is SC) {
      selectedNode.child = newNode;
    } else if (selectedNode is GridViewNode) {
      selectedNode.children.add(newNode);
    } else if (selectedNode is MC) {
      selectedNode.children.add(newNode);
    } else if (selectedNode is ListViewNode) {
      selectedNode.children.add(newNode);
    } else if (selectedNode is TextSpanNode && newNode is InlineSpanNode) {
      selectedNode.children ??= [];
      selectedNode.children!.add(newNode);
    } else if (selectedNode is WidgetSpanNode) {
      selectedNode.child = newNode;
      // } else if (selectedNode is ScaffoldNode && newNode is AppBarNode) {
      //   selectedNode.appBar = newNode;
    }
    newNode.setParent(selectedNode);

    state.snippetBeingEdited!.treeC.roots.first.validateTree();

    state.snippetBeingEdited!
      ..treeC.expand(newNode)
      ..treeC.rebuild()
      ..getRootNode().validateTree();

    final newSnippet = state.snippetBeingEdited!.getRootNode();
    final newVersionId = SnippetInfoModel.createNewVersion(newSnippet);
    fco.modelRepo.saveSnippetVersion(snippetName: newSnippet.name, newVersionId: newVersionId, newVersion: newSnippet);

    emit(state.copyWith(force: state.force + 1));
  }

  void _pasteReplacement(PasteReplacement event, emit) {
    if (state.snippetBeingEdited?.aNodeIsNotSelected ?? false) return;
    if (fco.appInfo.clipboard != null) {
      SNode selectedNode = state.snippetBeingEdited!.selectedNode!;
      _replaceWithNewNodeOrClipboard(
        selectedNode,
        emit,
        fco.appInfo.clipboard!.clone(),
      );
    }

    // // Container's Container parent should have an alignment property
    // if (event.selectedNode is ContainerNode) {
    //   (event.selectedNode as ContainerNode).alignment = AlignmentEnumModel.center;
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
    if (state.snippetBeingEdited?.aNodeIsNotSelected ?? false) return;
    if (fco.appInfo.clipboard != null) {
      SNode selectedNode = state.snippetBeingEdited!.selectedNode!;
      _addOrPasteChild(selectedNode, emit, fco.appInfo.clipboard!.clone());
    }
  }

  void _addSiblingBefore(AddSiblingBefore event, emit) {
    if (state.snippetBeingEdited?.aNodeIsNotSelected ?? false) return;
    SNode selectedNode = state.snippetBeingEdited!.selectedNode!;
    SNode newNode = event.type != null
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
    if (state.snippetBeingEdited!.selectedNode?.getParent() is ListViewNode) {
      int i =
          (state.snippetBeingEdited!.selectedNode?.getParent() as ListViewNode)
              .children
              .indexOf(selectedNode);
      _addSiblingAt(newNode, emit, i);
    }
    if (state.snippetBeingEdited!.selectedNode?.getParent()
        is CustomScrollViewNode) {
      int i =
          (state.snippetBeingEdited!.selectedNode?.getParent()
                  as CustomScrollViewNode)
              .slivers
              .indexOf(selectedNode);
      _addSiblingAt(newNode, emit, i);
    }
  }

  void _pasteSiblingBefore(PasteSiblingBefore event, emit) {
    if (state.snippetBeingEdited?.aNodeIsNotSelected ?? false) return;
    if (fco.appInfo.clipboard != null) {
      SNode selectedNode = state.snippetBeingEdited!.selectedNode!;
      //_createSnippetUndo();
      if (state.snippetBeingEdited?.selectedNode?.getParent() is MC) {
        int i = (state.snippetBeingEdited?.selectedNode?.getParent() as MC)
            .children
            .indexOf(selectedNode);
        _pasteSiblingAt(fco.appInfo.clipboard!, emit, i);
      }
      if (state.snippetBeingEdited?.selectedNode?.getParent() is TextSpanNode) {
        int i =
            (state.snippetBeingEdited?.selectedNode?.getParent()
                    as TextSpanNode)
                .children!
                .indexOf(selectedNode as InlineSpanNode);
        _pasteSiblingAt(fco.appInfo.clipboard!, emit, i);
      }
      if (state.snippetBeingEdited?.selectedNode?.getParent() is ListViewNode) {
        int i =
            (state.snippetBeingEdited?.selectedNode?.getParent()
                    as ListViewNode)
                .children
                .indexOf(selectedNode);
        _pasteSiblingAt(fco.appInfo.clipboard!, emit, i);
      }
      if (state.snippetBeingEdited?.selectedNode?.getParent()
          is CustomScrollViewNode) {
        int i =
            (state.snippetBeingEdited?.selectedNode?.getParent()
                    as CustomScrollViewNode)
                .slivers
                .indexOf(selectedNode);
        _pasteSiblingAt(fco.appInfo.clipboard!, emit, i);
      }
    }
  }

  void _addSiblingAfter(AddSiblingAfter event, emit) {
    if (state.snippetBeingEdited?.aNodeIsNotSelected ?? false) return;
    SNode selectedNode = state.snippetBeingEdited!.selectedNode!;
    SNode newNode = event.type != null
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
    if (state.snippetBeingEdited!.selectedNode?.getParent() is ListViewNode) {
      int i =
          (state.snippetBeingEdited!.selectedNode?.getParent() as ListViewNode)
              .children
              .indexOf(selectedNode);
      _addSiblingAt(newNode, emit, i + 1);
    }
    if (state.snippetBeingEdited!.selectedNode?.getParent()
        is CustomScrollViewNode) {
      int i =
          (state.snippetBeingEdited!.selectedNode?.getParent()
                  as CustomScrollViewNode)
              .slivers
              .indexOf(selectedNode);
      _addSiblingAt(newNode, emit, i + 1);
    }
  }

  void _pasteSiblingAfter(PasteSiblingAfter event, emit) {
    if (state.snippetBeingEdited?.aNodeIsNotSelected ?? false) return;
    SNode selectedNode = state.snippetBeingEdited!.selectedNode!;
    SNode clipboardNode = fco.appInfo.clipboard!;
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
    if (state.snippetBeingEdited?.selectedNode?.getParent() is ListViewNode) {
      int i =
          (state.snippetBeingEdited?.selectedNode?.getParent() as ListViewNode)
              .children
              .indexOf(selectedNode);
      _pasteSiblingAt(clipboardNode, emit, i + 1);
    }
    if (state.snippetBeingEdited?.selectedNode?.getParent()
        is CustomScrollViewNode) {
      int i =
          (state.snippetBeingEdited?.selectedNode?.getParent()
                  as CustomScrollViewNode)
              .slivers
              .indexOf(selectedNode);
      _pasteSiblingAt(clipboardNode, emit, i + 1);
    }
  }

  void _addSiblingAt(SNode newNode, emit, int i) {
    // state.snippetBeingEdited?.newVersion();
    SnippetRootNode rootNode = state.snippetBeingEdited!.getRootNode();

    SNode? parent =
        state.snippetBeingEdited!.selectedNode?.getParent() as SNode?;
    if (parent is TabBarNode) {
      TabBarViewNode? tabBarViewNode =
          state.snippetBeingEdited!.treeC.findNodeTypeInTree(
                rootNode,
                TabBarViewNode,
              )
              as TabBarViewNode?;
      tabBarViewNode?.children.insert(
        i,
        PlaceholderNode()..setParent(tabBarViewNode),
      );
      parent.children.insert(i, newNode..setParent(parent));
    } else if (parent is TabBarViewNode) {
      TabBarNode? tabBarNode =
          state.snippetBeingEdited!.treeC.findNodeTypeInTree(
                rootNode,
                TabBarNode,
              )
              as TabBarNode?;
      tabBarNode?.children.insert(
        i,
        TextNode(text: 'new tab', tsPropGroup: TextStyleProperties())
          ..setParent(tabBarNode),
      );
      parent.children.insert(i, newNode..setParent(parent));
    } else if (state.snippetBeingEdited!.selectedNode?.getParent() is MC) {
      (state.snippetBeingEdited!.selectedNode?.getParent() as MC).children
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

    final newSnippet = state.snippetBeingEdited!.getRootNode();
    final newVersionId = SnippetInfoModel.createNewVersion(newSnippet);
    fco.modelRepo.saveSnippetVersion(snippetName: newSnippet.name, newVersionId: newVersionId, newVersion: newSnippet);

    emit(state.copyWith(force: state.force + 1));
  }

  void _pasteSiblingAt(SNode clipboardNode, emit, int i) {
    // state.snippetBeingEdited?.newVersion();

    TextSpanNode? textSpanNode;
    SNode newNode = clipboardNode.clone();

    if (state.snippetBeingEdited!.selectedNode?.getParent() is MC) {
      (state.snippetBeingEdited!.selectedNode?.getParent() as MC).children
          .insert(i, newNode);
      newNode.setParent(state.snippetBeingEdited!.selectedNode?.getParent());
    }
    if (state.snippetBeingEdited!.selectedNode?.getParent() is TextSpanNode) {
      (state.snippetBeingEdited!.selectedNode?.getParent() as TextSpanNode)
          .children
          ?.insert(i, newNode as InlineSpanNode);
      newNode.setParent(state.snippetBeingEdited!.selectedNode?.getParent());
    }

    if (state.snippetBeingEdited!.selectedNode?.getParent() is ListViewNode) {
      (state.snippetBeingEdited!.selectedNode?.getParent() as ListViewNode)
          .children
          .insert(i, newNode);
      newNode.setParent(state.snippetBeingEdited!.selectedNode?.getParent());
    }
    if (state.snippetBeingEdited!.selectedNode?.getParent()
        is CustomScrollViewNode) {
      (state.snippetBeingEdited!.selectedNode?.getParent()
              as CustomScrollViewNode)
          .slivers
          .insert(i, newNode);
      newNode.setParent(state.snippetBeingEdited!.selectedNode?.getParent());
    }
    state.snippetBeingEdited!.getRootNode().validateTree();

    final newSnippet = state.snippetBeingEdited!.getRootNode();
    final newVersionId = SnippetInfoModel.createNewVersion(newSnippet);
    fco.modelRepo.saveSnippetVersion(snippetName: newSnippet.name, newVersionId: newVersionId, newVersion: newSnippet);

    if (newNode is RichTextNode) {
      state.snippetBeingEdited!.treeC.expand(newNode);
      state.snippetBeingEdited!.selectedNode = textSpanNode;
      emit(state.copyWith(force: state.force + 1));
    } else {
      state.snippetBeingEdited!.treeC.expand(newNode);
      state.snippetBeingEdited!.selectedNode = newNode;
      emit(state.copyWith(force: state.force + 1));
    }
  }

  void _selectedDirectoryOrNode(SelectedDirectoryOrNode event, emit) {
    state.snippetBeingEdited!.selectedNode = event.selectedNode;
    emit(state.copyWith(force: state.force + 1));
  }

  Future<void> _saveNodeAsSnippet(SaveNodeAsSnippet event, emit) async {
    //_createSnippetUndo();

    //_cutIncludingAnyChildren(event.node);

    // create new snippet
    SnippetRootNode newRootNode = SnippetRootNode(
      name: event.newSnippetName,
      child: event.node,
    );
    // VersionId initialVersionId = DateTime.now().millisecondsSinceEpoch.toString();
    final newVersionId = SnippetInfoModel.createNewVersion(newRootNode);
    fco.modelRepo.saveSnippetVersion(snippetName: newRootNode.name, newVersionId: newVersionId, newVersion: newRootNode);
    // await fco.cacheAndSaveANewSnippetVersion(
    //   snippetName: event.newSnippetName,
    //   rootNode: newRootNode,
    // );
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
              .children[index] =
          refNode;
    } else if (state.snippetBeingEdited!.selectedNode?.getParent()
        is WidgetSpanNode) {
      (state.snippetBeingEdited!.selectedNode?.getParent() as WidgetSpanNode)
              .child =
          refNode;
    }
    state.snippetBeingEdited!.treeC.expand(newRootNode);
    state.snippetBeingEdited!.treeC.rebuild();
    state.snippetBeingEdited!.selectedNode = refNode;

    // var appInfo = FCO.appInfoAsMap;

    emit(state.copyWith(force: state.force + 1));
    // }
  }

  // FutureOr<void> _undo(Undo event, emit) async {
  //   if (canUndo) {
  //     SnippetRootNode? result = _ur.undo();
  //     if (result != null) {
  //       state.snippetBeingEdited?.rootNode = result;
  //       // update cached version
  //       SnippetInfoModel? snippetInfo = SnippetInfoModel.snippetInfoCache[result.name];
  //       if (snippetInfo != null) {
  //         VersionId? currentVersionid = await snippetInfo.currentVersionId();
  //         if (currentVersionid != null) {
  //           snippetInfo.cachedVersions[currentVersionid] = result;
  //         }
  //       }
  //       emit(state.copyWith(
  //         force: state.force + 1,
  //       ));
  //     }
  //   }
  // }
  //
  // FutureOr<void> _redo(Redo event, emit) async {
  //   if (canRedo) {
  //     SnippetRootNode? result = _ur.redo();
  //     if (result != null) {
  //       state.snippetBeingEdited?.rootNode = result;
  //       // update cached version
  //       SnippetInfoModel? snippetInfo = SnippetInfoModel.snippetInfoCache[result.name];
  //       if (snippetInfo != null) {
  //         VersionId? currentVersionid = await snippetInfo.currentVersionId();
  //         if (currentVersionid != null) {
  //           snippetInfo.cachedVersions[currentVersionid] = result;
  //         }
  //       }
  //       emit(state.copyWith(
  //         force: state.force + 1,
  //       ));
  //     }
  //   }
  // }

  bool get deleteInProgress =>
      state.snippetBeingEdited?.nodeBeingDeleted != null;

  bool showTappableBorderRects() =>
      state.activeSnippetName != null;

  bool dontShowTappableBorderRects() =>
      !state.isSignedIn || state.activeSnippetName == null;

  bool aSnippetIsBeingEdited() => state.snippetBeingEdited != null;

  bool aSnippetIsNotBeingEdited() => state.snippetBeingEdited == null;

  bool aNodeIsSelected() => state.snippetBeingEdited?.aNodeIsSelected ?? false;

  bool aNodeIsNotSelected() =>
      state.snippetBeingEdited?.aNodeIsSelected ?? false;

  TargetModel? getNewestTarget() => state.newestTarget;
}
