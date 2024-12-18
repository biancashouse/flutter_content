import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/api/snippet_panel/save_as_callout.dart';
import 'package:flutter_content/src/snippet/pnode_widget.dart';
import 'package:flutter_content/src/snippet/snode_widget.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';
import 'package:gap/gap.dart';
// import 'package:go_router/go_router.dart';
import 'package:multi_split_view/multi_split_view.dart';

class SnippetTreeAndPropertiesCalloutContents extends StatelessWidget {
  final ScrollControllerName? scName;

  // final VoidCallback onChangedF;
  // final VoidCallback onExpiredF;
  final bool allowButtonCallouts;

  const SnippetTreeAndPropertiesCalloutContents({
    this.scName,
    // required this.onChangedF,
    // required this.onExpiredF,
    this.allowButtonCallouts = false,
    super.key,
  });

  // static SnippetNode nearestRoot(TreeEntry<Node> entry) {
  //   TreeEntry<Node> _entry = entry;
  //   while (_entry.node is! SnippetNode) {
  //     _entry = _entry.parent!;
  //   }
  //   return _entry.node as SnippetNode;
  // }

  void popThenRepushSnipper(String snippetName, VoidCallback enterEditModeF,
      VoidCallback exitEditModeF) {
    STreeNode treeRootNode =
        FlutterContentApp.snippetBeingEdited!.treeC.roots.first;
    fco.dismissAll();
    STreeNode startingAtNode = treeRootNode.rootNodeOfSnippet()!;
    STreeNode selectedNode = FlutterContentApp.selectedNode!;
    STreeNode.pushThenShowNamedSnippetWithNodeSelected(
      snippetName,
      startingAtNode,
      selectedNode,
      scName: scName,
    );
  }

  void revertToVersion(
      VersionId? versionId, SnippetInfoModel snippetInfo, CAPIState state) {
    if (versionId == null) return;
    FlutterContentApp.capiBloc.add(
      CAPIEvent.revertSnippet(
        snippetName: snippetInfo.name,
        versionId: fco.removeNonNumeric(versionId),
      ),
    );
    fco.afterNextBuildDo(() async {
      // current snippet version will now be changed to prevId
      fco.logi('reverted to previous version.');
      STreeNode.unhighlightSelectedNode();
      // var currPageState = fco.currentPageState;
      // currPageState?.unhideFAB();
      fco.dismiss(PINK_OVERLAY_NON_TAPPABLE);
      fco.dismiss(CalloutConfigToolbar.CID);
      fco.hideClipboard();
      // exitEditModeF();
      // FlutterContentApp.capiBloc
      //     .add(const CAPIEvent.popSnippetEditor());
      // fco.dismiss(snippetName, skipOnDismiss: true);
      final revertedVersion = snippetInfo.currentVersionFromCache();
      if (revertedVersion != null) {
        final newTreeC = SnippetTreeController(
          roots: [revertedVersion],
          childrenProvider: Node.snippetTreeChildrenProvider,
          parentProvider: Node.snippetTreeParentProvider,
        );

        newTreeC.roots.first.validateTree();
        newTreeC.expand(revertedVersion);
        newTreeC.rebuild();

        state.snippetBeingEdited!
          ..setRootNode(revertedVersion)
          ..selectedNode = revertedVersion.child
          ..showProperties = false
          ..treeC = newTreeC;

        fco.refreshAll();
      }
      return;
    });
  }

  @override
  Widget build(BuildContext context) {
    SnippetName? snippetName =
        FlutterContentApp.snippetBeingEdited?.getRootNode().name;
    if (snippetName == null) {
      return Error("SnippetTreeAndPropertiesCalloutContents",
          color: Colors.red,
          size: 32,
          errorMsg: "null SnippetName!",
          key: GlobalKey());
    }
    var snippetInfo = SnippetInfoModel.cachedSnippet(snippetName);
    if (snippetInfo == null) {
      return Error("SnippetTreeAndPropertiesCalloutContents",
          color: Colors.blue,
          size: 32,
          errorMsg: "null snippetInfo!",
          key: GlobalKey());
    }
    //
    String title = FlutterContentApp.snippetBeingEdited?.getRootNode().name ??
        'snippet name?';

    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0), // Adjust radius as needed
      child: BlocBuilder<CAPIBloC, CAPIState>(builder: (context, state) {
        return Scaffold(
          backgroundColor:
              snippetInfo.editingVersionId != snippetInfo.publishedVersionId
                  ? Colors.grey
                  : Colors.purpleAccent.shade100,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Tooltip(
              message:
                  'snippet $title, versionId: ${snippetInfo.editingVersionId}',
              child: fco.coloredText(
                title,
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
            // title: GestureDetector(
            //   onTap: () {
            //     snippetBloc.add(const CAPIEvent.clearNodeSelection());
            //     fco.hide("floating-clipboard");
            //     fco.afterNextBuildDo(() {
            //       snippetBloc.add(CAPIEvent.selectNode(
            //         node: snippetBloc.state.rootNode!,
            //         nodeParent: null,
            //         showProperties: true,
            //         // imageTC: tc,
            //       ));
            //     });
            //   },
            //   child: Container(
            //     padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4),
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       border: Border.all(color: Colors.grey, width: 1),
            //       borderRadius: const BorderRadius.all(Radius.circular(30)),
            //     ),
            //     child: FCO.coloredText('SnippetName: ${snippetBloc.snippetName}', fontSize: 16.0, color: Colors.black87),
            //   ),
            // ),
            actions: [
              IconButton(
                hoverColor: Colors.white30,
                onPressed: () async {
                  if (!snippetInfo.isFirstVersion()) {
                    VersionId? prevId = snippetInfo.previousVersionId();
                    revertToVersion(prevId, snippetInfo, state);
                  }
                },
                icon: Icon(Icons.undo,
                    color: !snippetInfo
                            .isFirstVersion() //|| FlutterContentApp.capiBloc.canUndo
                        ? Colors.white
                        : Colors.white54),
                tooltip: 'previous version',
              ),

              IconButton(
                hoverColor: Colors.white30,
                onPressed: () {
                  if (!snippetInfo.isLatestVersion()) {
                    VersionId? nextId = snippetInfo.nextVersionId();
                    revertToVersion(nextId, snippetInfo, state);
                  }
                },
                icon: Icon(Icons.redo,
                    color: !snippetInfo
                            .isLatestVersion() //|| FlutterContentApp.capiBloc.canRedo
                        ? Colors.white
                        : Colors.white54),
                tooltip: 'next version',
              ),
              IconButton(
                hoverColor: Colors.white30,
                onPressed: () async {},
                icon: VersionsMenuAnchor(snippetInfo: snippetInfo),
                tooltip: 'version...',
              ),
              // if (selectedNode is! SnippetRefNode)
              // IconButton(
              //   onPressed: () {
              //     snippetBloc.add(CAPIEvent.cutNode(node: selectedNode!));
              //     fco.afterNextBuildDo(() {
              //       if (FCO.capiBloc.state.jsonClipboard != null) {
              //         fco.unhide("floating-clipboard");
              //       }
              //     });
              //     fco.hide("TreeNodeMenu");
              //   },
              //   icon: Icon(
              //     Icons.cut,
              //     color:
              //         Colors.orange.withOpacity(snippetBloc.state.aNodeIsSelected && selectedNode is! SnippetRefNode ? 1.0 : .25),
              //   ),
              //   tooltip: 'Cut',
              // ),
              // // if (snippetBloc.state.aNodeIsSelected && selectedNode is! SnippetRefNode)
              // IconButton(
              //   onPressed: () {
              //     fco.afterNextBuildDo(() {
              //       snippetBloc.add(CAPIEvent.copyNode(node: selectedNode!));
              //       fco.afterNextBuildDo(() {
              //         if (FCO.capiBloc.state.jsonClipboard != null) {
              //           fco.unhide("floating-clipboard");
              //         }
              //       });
              //     });
              //     fco.hide("TreeNodeMenu");
              //   },
              //   icon: Icon(
              //     Icons.copy,
              //     color:
              //         Colors.green.withOpacity(snippetBloc.state.aNodeIsSelected && selectedNode is! SnippetRefNode ? 1.0 : .25),
              //   ),
              //   tooltip: 'Copy',
              // ),
              // IconButton(
              //   onPressed: () {
              //     fco.dismiss(SELECTED_NODE_BORDER_CALLOUT);
              //     if (selectedNode is! RichTextNode) {
              //       snippetBloc.add(const CAPIEvent.deleteNodeTapped());
              //     }
              //     fco.dismiss("TreeNodeMenu");
              //   },
              //   icon: Icon(Icons.delete,
              //       color:
              //           Colors.red.withOpacity(snippetBloc.state.aNodeIsSelected && selectedNode is! SnippetRefNode ? 1.0 : .25)),
              //   tooltip: 'Remove',
              // ),
              // IconButton(
              //   style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.white24)),
              //   icon: const Icon(
              //     Icons.close,
              //     color: Colors.black,
              //   ),
              //   onPressed: () {
              //     unhideAllSingleTargetBtns();
              //     STreeNode.unhighlightSelectedNode();
              //     FCO.capiBloc.add(const CAPIEvent.unhideAllTargetGroups());
              //     FCO.capiBloc.add(const CAPIEvent.popSnippetTree());
              //
              //     //removeSnippetTreeCallout(snippetBloc.snippetName);
              //     CalloutState? state = fco.of(context);
              //     state?.toggle();
              //
              //     // removeNodePropertiesCallout();
              //     fco.removeOverlay(TREENODE_MENU_CALLOUT);
              //     FCO.capiBloc.add(const CAPIEvent.saveModel());
              //   },
              // ),
              // Gap(16),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: MultiSplitViewTheme(
              data: MultiSplitViewThemeData(dividerThickness: 24),
              child: MultiSplitView(
                axis: Axis.horizontal,
                // onWeightChange: () => setState(() {}),
                dividerBuilder:
                    (axis, index, resizable, dragging, highlighted, themeData) {
                  bool notPublished = snippetInfo.editingVersionId !=
                      snippetInfo.publishedVersionId;
                  return Container(
                    color: dragging
                        ? notPublished
                            ? Colors.grey
                            : Colors.purpleAccent.shade200
                        : notPublished
                            ? Colors.grey[300]
                            : Colors.purpleAccent.shade400,
                    child: Icon(
                      Icons.drag_indicator,
                      color: highlighted ? Colors.blueAccent : Colors.white,
                    ),
                  );
                },
                initialAreas: [
                  // SNIPPET TREE
                  // Area(
                  //   builder: (ctx, area) {
                  //     state.snippetBeingEdited?.treeC.rebuild();
                  //     return GestureDetector(
                  //       onTap: () {
                  //         FlutterContentApp.capiBloc
                  //             .add(const CAPIEvent.clearNodeSelection());
                  //         fco.hide("floating-clipboard");
                  //       },
                  //       child: SnippetTreePane(snippetInfo, scName),
                  //     );
                  //   },
                  //   flex: 1,
                  // ),
                  // NODE PROPERTIES
                  if (FlutterContentApp.selectedNode?.pTreeC != null)
                    Area(
                      builder: (ctx, area) {
                        return !FlutterContentApp.aNodeIsSelected
                            ? const Offstage()
                            : Container(
                                color: Colors.purpleAccent[100],
                                child: Center(
                                  child: ListView(
                                    controller: FlutterContentApp.selectedNode!
                                        .propertiesPaneSC(),
                                    shrinkWrap: true,
                                    children: [
                                      // icon buttons
                                      // ExpansionTile(
                                      //   title: fco.coloredText('widget actions',
                                      //       color: Colors.white54,
                                      //       fontSize: 14),
                                      //   backgroundColor: Colors.black,
                                      //   collapsedBackgroundColor: Colors.black,
                                      //   onExpansionChanged: (bool isExpanded) =>
                                      //       fco.showingNodeButtons = isExpanded,
                                      //   initiallyExpanded:
                                      //       fco.showingNodeButtons,
                                      //   children: [nodeButtons(context, scName)],
                                      // ),
                                      // NODE PROPERTIES TREE
                                      if (FlutterContentApp.selectedNode!
                                          .pTreeC(context)
                                          .roots
                                          .isEmpty)
                                        fco.coloredText(
                                            ' (no widget properties)',
                                            color: Colors.white),
                                      Material(
                                          color: Colors.black,
                                          child: PropertiesTreeView(
                                            treeC: FlutterContentApp
                                                .selectedNode!
                                                .pTreeC(context),
                                          )),
                                      // Container(color: Colors.purpleAccent[100], width: double.infinity, height: 1000),
                                    ],
                                  ),
                                ),
                              );
                      },
                      flex: 1,
                    ),
                ],
              ),
            ),
          ),
          // endDrawer: Drawer(
          //         backgroundColor: Colors.black,
          //         child: Center(
          //           child: ListView(
          //             controller: selectedNode?.propertiesPaneSC,
          //             shrinkWrap: true,
          //             children: [
          //               // icon buttons
          //               // nodeIconButtons(snippetBloc),
          //               // // NODE PROPERTIES TREE
          //               // if (propertyNodes.isEmpty) FCO.coloredText(' (no properties)', color: Colors.white),
          //               // if (propertyNodes.isNotEmpty && selectedNode != null && selectedNode.pTreeC != null && !(selectedNode.hidePropertiesWhileDragging ?? false))
          //               //   Material(
          //               //       color: Colors.black,
          //               //       child: PropertiesTreeView(
          //               //         treeC: selectedNode.pTreeC!,
          //               //       )),
          //               // // Container(color: Colors.purpleAccent[100], width: double.infinity, height: 1000),
          //             ],
          //           ),
          //         ),
          //       ),
        );
      }),
    );
  }

  static Widget nodeButtons(context, scName, STreeNode node) {
    var gc = node.getParent(); // may be genericchildnode
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          if (node is! GenericSingleChildNode &&
              node is! GenericMultiChildNode)
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  hoverColor: Colors.white30,
                  onPressed: () {
                    // some properties cannot be deleted
                    if (gc is GenericSingleChildNode? &&
                        gc?.getParent() is StepNode &&
                        (gc?.propertyName == 'title' ||
                            gc?.propertyName == 'content')) return;
                    FlutterContentApp.capiBloc
                        .add(CAPIEvent.cutNode(node: node, scName: scName));
                    fco.afterNextBuildDo(() {
                      if (fco.clipboard != null) {
                        fco.unhide("floating-clipboard");
                      }
                    });
                    fco.hide("TreeNodeMenu");
                  },
                  icon: Icon(Icons.cut,
                      color: Colors.orange.withOpacity(
                          !FlutterContentApp.aNodeIsSelected ||
                                  node is SnippetRootNode ||
                                  gc is GenericSingleChildNode? &&
                                      gc?.getParent() is StepNode &&
                                      (gc?.propertyName == 'title' ||
                                          gc?.propertyName == 'content')
                              ? .5
                              : 1.0)),
                  tooltip: 'Cut',
                ),
                // if (snippetBloc.state.aNodeIsSelected && selectedNode is! SnippetRefNode)
                IconButton(
                  hoverColor: Colors.white30,
                  onPressed: () {
                    fco.afterNextBuildDo(() {
                      FlutterContentApp.capiBloc
                          .add(CAPIEvent.copyNode(node: node, scName: scName));
                      fco.afterNextBuildDo(() {
                        if (fco.clipboard != null) {
                          fco.unhide("floating-clipboard");
                        }
                      });
                    });
                    fco.hide("TreeNodeMenu");
                  },
                  icon: Icon(
                    Icons.copy,
                    color: Colors.green.withOpacity(
                        FlutterContentApp.aNodeIsSelected &&
                                node is! SnippetRootNode
                            ? 1.0
                            : .25),
                  ),
                  tooltip: 'Copy',
                ),
                IconButton(
                  hoverColor: Colors.white30,
                  onPressed: () async {
                    // some properties cannot be deleted!selectedNode.canBeDeleted()
                    // some properties cannot be deleted
                    if (!node.canBeDeleted()) return;
                    // bool wasShowingAsRoot = selectedNode == snippetBloc.treeC.roots.first;
                    // STreeNode? parentNode = selectedNode.getParent() as STreeNode?;
                    fco.dismiss(SELECTED_NODE_BORDER_CALLOUT);
                    FlutterContentApp.capiBloc
                        .add(const CAPIEvent.deleteNodeTapped());
                    fco.afterNextBuildDo(() async {
                      await Future.delayed(const Duration(milliseconds: 1000));
                      FlutterContentApp.capiBloc
                          .add(const CAPIEvent.completeDeletion());
                      fco.afterNextBuildDo(() {
                        // if was tab or tabview, reset the tab Q and controller
                        SnippetPanelState? spState = SnippetPanel.of(context);
                        spState?.resetTabQandC;
                        // redraw tree if deleted node was root
                        // if (wasShowingAsRoot && parentNode != null) {
                        //   snippetBloc.add(CAPIEvent.selectNode(
                        //     node: parentNode,
                        //     selectedTreeNodeGK: GlobalKey(debugLabel: 'selectedTreeNodeGK'),
                        //   ));
                        // }
                        if (node is HotspotsNode) {
                          node.targets.clear();
                        }
                      });
                    });
                    // fco.dismiss("TreeNodeMenu");
                  },
                  icon: Icon(Icons.delete,
                      color: Colors.red.withOpacity(
                          !FlutterContentApp.aNodeIsSelected ||
                                  !node.canBeDeleted() ||
                                  (node is SnippetRootNode &&
                                      node.getParent() == null) ||
                                  (gc is GenericSingleChildNode? &&
                                      gc?.getParent() is StepNode &&
                                      (gc?.propertyName == 'title' ||
                                          gc?.propertyName == 'content'))
                              ? .5
                              : 1.0)),
                  tooltip: 'Remove',
                ),
                if (node is! SnippetRootNode)
                  IconButton(
                    hoverColor: Colors.white30,
                    onPressed: () {
                      showSaveAsCallout(
                        selectedNode: node,
                        //targetGKF: () => targetGK,
                        saveModelF: (s) {
                          FlutterContentApp.capiBloc
                              .add(CAPIEvent.saveNodeAsSnippet(
                            node: node,
                            newSnippetName: s,
                          ));
                          fco.afterNextBuildDo(() {
                            fco.dismiss("input-snippet-name");
                          });
                        },
                        scName: scName,
                      );
                    },
                    icon: const Icon(
                      Icons.link,
                      color: Colors.blue,
                    ),
                    tooltip: 'Save as a new Snippet...',
                  ),
                // IconButton(
                //   hoverColor: Colors.white30,
                //   onPressed: () async {
                //     // some properties cannot be deleted!selectedNode.canBeDeleted()
                //     // some properties cannot be deleted
                //     if (!selectedNode.canBeDeleted()) return;
                //     fco.dismiss(SELECTED_NODE_BORDER_CALLOUT);
                //     snippetBloc.add(const CAPIEvent.deleteNodeTapped());
                //     fco.afterNextBuildDo(() async {
                //       await Future.delayed(const Duration(milliseconds: 1000));
                //       snippetBloc.add(const CAPIEvent.completeDeletion());
                //       fco.afterNextBuildDo(() {
                //         // if was tab or tabview, reset the tab Q and controller
                //         SnippetPanelState? spState = SnippetPanel.of(context);
                //         spState?.resetTabQandC;
                //       });
                //     });
                //     fco.dismiss("TreeNodeMenu");
                //   },
                //   icon: Icon(Icons.delete,
                //       color: Colors.red.withOpacity(
                //           !snippetBloc.state.aNodeIsSelected ||
                //                   selectedNode
                //                       is SnippetRefNode ||
                //                   (gc is GenericSingleChildNode? &&
                //                       gc?.parent is StepNode &&
                //                       (gc?.propertyName == 'title' ||
                //                           gc?.propertyName == 'content'))
                //               ? .5
                //               : 1.0)),
                //   tooltip: 'Remove',
                // ),
              ],
            ),
          // tree structure icon buttons
          // replace button
          if (node is! GenericSingleChildNode &&
              _canReplace(node))
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: node.insertItemMenuAnchor(
                action: NodeAction.replaceWith,
                label: 'Replace with...',
                bgColor: Colors.lightBlueAccent,
              ),
            ),
          _editTreeStructureIconButtons(node),
          const Gap(10),
        ],
      ),
    );
  }

  static bool _canReplace(STreeNode? selectNode) => selectNode?.getParent() != null;

  static bool _canAddSiblng(STreeNode? selectNodeParent) => (selectNodeParent is MC ||
      selectNodeParent is TextSpanNode ||
      selectNodeParent is WidgetSpanNode);

  static bool _canWrap(STreeNode selectedNode) => (selectedNode
          is! GenericSingleChildNode &&
      selectedNode is! GenericMultiChildNode &&
      selectedNode is! InlineSpanNode &&
      (selectedNode is! SnippetRootNode || selectedNode.getParent() != null) &&
      selectedNode is! FileNode &&
      selectedNode is! PollOptionNode &&
      selectedNode is! StepNode);

  static bool _canAddChld(STreeNode selectedNode) =>
      selectedNode is! SnippetRootNode &&
      ((selectedNode is SnippetRootNode && selectedNode.child == null) ||
          // || (selectedNode is! ChildlessNode && !entry.hasChildren))
          // (selectedNode is RichTextNode && selectedNode.text == null) ||
          (selectedNode is SC && selectedNode.child == null) ||
          (selectedNode is MC ||
              selectedNode is TextSpanNode ||
              selectedNode is WidgetSpanNode));

  static Widget _editTreeStructureIconButtons(STreeNode selectedNode) {
    return Center(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox.fromSize(
              size: const Size(200, 100),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 140,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                      ),
                      alignment: Alignment.center,
                      child: Text(selectedNode.toString()),
                    ),
                  ),
                  if (selectedNode is! RowNode &&
                      _canAddSiblng(selectedNode.getParent() as STreeNode?))
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          selectedNode.insertItemMenuAnchor(
                              action: NodeAction.addSiblingBefore,
                              tooltip: 'Insert sibling before...',
                              bgColor: Colors.blue),
                          const Gap(12),
                          // selectedNode is RowNode
                          //     ? const VerticalDivider(thickness: 6, indent: 30, endIndent: 30)
                          //     : const Divider(thickness: 6, indent: 30, endIndent: 30),
                          selectedNode.insertItemMenuAnchor(
                              action: NodeAction.addSiblingAfter,
                              tooltip: 'Insert sibling after...',
                              bgColor: Colors.blue),
                        ],
                      ),
                    ),
                  if (_canWrap(selectedNode))
                    Positioned(
                      top: 10,
                      left: 10,
                      child: selectedNode.insertItemMenuAnchor(
                          action: NodeAction.wrapWith,
                          tooltip: 'Wrap with...',
                          bgColor: Colors.blue),
                    ),
                  if (_canAddChld(selectedNode))
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: selectedNode.insertItemMenuAnchor(
                          action: NodeAction.addChild,
                          tooltip: 'Add child...',
                          bgColor: Colors.blue),
                    ),
                ],
              ),
            ),
          ),
          if (selectedNode is RowNode &&
              _canAddSiblng(selectedNode.getParent() as STreeNode?))
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 100,
                padding: const EdgeInsets.all(16),
                alignment: Alignment.center,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    selectedNode.insertItemMenuAnchor(
                        action: NodeAction.addSiblingBefore,
                        tooltip: 'Insert sibling before...',
                        bgColor: Colors.blue),
                    selectedNode.insertItemMenuAnchor(
                        action: NodeAction.addSiblingAfter,
                        tooltip: 'Insert sibling after...',
                        bgColor: Colors.blue),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}

class SnippetTreePane extends StatelessWidget {
  final SnippetInfoModel snippetInfo;
  final ScrollControllerName? scName;

  const SnippetTreePane(this.snippetInfo, this.scName, {super.key});

  @override
  Widget build(BuildContext context) {
    if (FlutterContentApp.snippetBeingEdited?.getRootNode().child == null) {
      List<Widget> menuChildren = FlutterContentApp.snippetBeingEdited
              ?.getRootNode()
              .menuAnchorWidgets(NodeAction.addChild, scName) ??
          [];
      return MenuAnchor(
        alignmentOffset: const Offset(80, 0),
        menuChildren: menuChildren,
        builder:
            (BuildContext context, MenuController controller, Widget? child) {
          return Center(
              child: TextButton.icon(
            key: key,
            onPressed: () {
              if (controller.isOpen) {
                controller.close();
              } else {
                controller.open();
              }
            },
            icon: const Icon(Icons.add),
            label: const Text('add root widget'),
            style: ButtonStyle(
              backgroundColor:
                  WidgetStatePropertyAll(Colors.white.withOpacity(.9)),
              //padding: WidgetStatePropertyAll(EdgeInsets.zero),
            ),
          ));
        },
      );
    } else {
      return Material(
        color: Colors.purple.shade200,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: InteractiveViewer(
            alignment: Alignment.topLeft,
            constrained: false,
            // onInteractionStart: (_) => snippetBloc.add(const CAPIEvent.clearNodeSelection()),
            // onInteractionEnd: (_) => snippetBloc.add(const CAPIEvent.clearNodeSelection()),
            child: SizedBox(
              width: 700,
              height: 1200,
              child: Builder(builder: (context) {
                // final STreeNode? selectedNode = selectedNode;
                bool canShowNavigateUpBtn = true;
                if (FlutterContentApp.snippetBeingEdited?.treeC.roots.first
                        .getParent() ==
                    null) canShowNavigateUpBtn = false;
                if (FlutterContentApp.snippetBeingEdited?.treeC.roots.first
                        .getParent() is SnippetRootNode &&
                    FlutterContentApp.snippetBeingEdited?.treeC.roots.first
                            .getParent()
                            ?.getParent() ==
                        null) {
                  canShowNavigateUpBtn = false;
                }
                if (FlutterContentApp.snippetBeingEdited?.getRootNode() !=
                        FlutterContentApp
                            .snippetBeingEdited?.treeC.roots.first &&
                    FlutterContentApp.snippetBeingEdited?.treeC.roots.first
                        is! ScaffoldNode) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (canShowNavigateUpBtn) navigateUpTreeButton(),
                      Expanded(
                          child: SnippetTreeView(
                        scName: scName,
                      )),
                    ],
                  );
                }
                fco.logi('SnippetTreeView...');
                return SnippetTreeView(
                  scName: scName,
                );
              }),
            ),
          ),
        ),
      );
    }
  }

  Widget navigateUpTreeButton() => FilledButton(
        onPressed: () {
          SnippetTreePane.navigateUpTree(scName);
          return;

          // TBD ----------------
          // if (parent != null) {
          //   snippetBloc.add(const CAPIEvent.clearNodeSelection());
          //   fco.afterNextBuildDo(() {
          //     snippetBloc.add(CAPIEvent.selectNode(
          //       node: parent!,
          //       // imageTC: tc,
          //       // selectedWidgetGK: GlobalKey(debugLabel: 'selectedWidgetGK'),
          //       selectedTreeNodeGK: GlobalKey(debugLabel: 'selectedTreeNodeGK'),
          //     ));
          //     fco.afterNextBuildDo(() {
          //       parent?.showNodeWidgetOverlay();
          //       // create selected node's properties tree
          //       // final List<PTreeNode> propertyNodes =
          //       //     parent.properties(context);
          //       // // get a new treeController only when snippet selected
          //       // parent.pTreeC ??= PTreeNodeTreeController(
          //       //   roots: propertyNodes,
          //       //   childrenProvider: Node.propertyTreeChildrenProvider,
          //       // );
          //       snippetBloc.treeC.expand(parent!);
          //       // parent.propertiesPaneSC ??= ScrollController()
          //       //   ..addListener(() {
          //       //     parent!.propertiesPaneScrollPos =
          //       //         parent.propertiesPaneSC?.offset ?? 0.0;
          //       //   });
          //     });
          //   });
          // }
          // fco.dismiss(snippetBloc.snippetName);
          // if (parent != null) {
          //   fco.afterNextBuildDo(() {
          //     FlutterContentAppState.pushThenShowNamedSnippetWithNodeSelected(
          //         snippetBloc.snippetName, parent!, selectedNode);
          //   });
          // }
        },
        style: const ButtonStyle().copyWith(
          backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
          shape: const WidgetStatePropertyAll(RoundedRectangleBorder()),
          padding: const WidgetStatePropertyAll(EdgeInsets.zero),
          // maximumSize: WidgetStatePropertyAll(Size(40, 36)),
          // minimumSize: WidgetStatePropertyAll(Size(40, 36)),
        ),
        child: fco.coloredText("...", color: Colors.white, fontSize: 24),
      );

  static void navigateUpTree(ScrollControllerName? scName) {
    // change tree root to parent
    STreeNode treeRootNode =
        FlutterContentApp.snippetBeingEdited!.treeC.roots.first;
    STreeNode? parent = treeRootNode.getParent() as STreeNode?;
    if (parent is GenericSingleChildNode) {
      parent = parent.getParent() as STreeNode?;
    } else if (parent is SnippetRootNode) {
      parent = parent.getParent() as STreeNode?;
    }

    if (parent != null) {
      fco.dismissAll(exceptFeatures: [CalloutConfigToolbar.CID]);
      STreeNode.pushThenShowNamedSnippetWithNodeSelected(
        parent.rootNodeOfSnippet()!.name,
        parent,
        parent,
        scName: scName,
      );
    }
  }
}

class SnippetTreeView extends StatelessWidget {
  final ScrollControllerName? scName;

  // final VoidCallback onChangedF;
  // final VoidCallback onExpiredF;
  final bool allowButtonCallouts;

  const SnippetTreeView({
    this.scName,
    // required this.onChangedF,
    // required this.onExpiredF,
    this.allowButtonCallouts = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var snippetBeingEdited = FlutterContentApp.snippetBeingEdited;
    fco.logi(
        "snippetBeingEdited is ${snippetBeingEdited != null ? 'not null' : 'null'}");
    SnippetTreeController? treeC = snippetBeingEdited?.treeC;
    if (treeC == null) {
      return Error(
        "FlowchartWidget",
        color: Colors.green,
        size: 32,
        errorMsg: "null treeC!",
        key: GlobalKey(),
      );
    }
    return TreeView<STreeNode>(
      physics: const NeverScrollableScrollPhysics(),
      treeController: treeC,
      // filter or all
      nodeBuilder: (BuildContext context, TreeEntry<STreeNode> entry) {
        // if (FlutterContentApp.aNodeIsSelected && treeC!.hasAncestor(entry, bloc.state.selectedNode) && bloc.state.showProperties) return const Offstage();
        // fco.logi("rebuilding entry: ${entry.node.runtimeType.toString()} expanded: ${entry.isExpanded}");
        // never show the tree root node
        if (FlutterContentApp.snippetBeingEdited?.getRootNode() == entry.node) {
          return const Offstage();
        }
        // if (entry.node == FlutterContentApp.selectedNode) {
        //   fco.logi(
        //       'SnippetTreeView - selected node: ${FlutterContentApp.selectedNode.toString()}');
        // }
        return _treeIndentation(entry, treeC);
      },
    );
  }

  TreeIndentation _treeIndentation(entry, treeC) => TreeIndentation(
        guide: IndentGuide.connectingLines(
          color: FlutterContentApp.aNodeIsSelected &&
                  entry.node == FlutterContentApp.selectedNode
              ? Colors.purpleAccent
              : Colors.white,
          indent: 40.0,
        ),
        entry: entry,
        child: NodeWidget(
          snippetName:
              FlutterContentApp.snippetBeingEdited?.getRootNode().name ??
                  'snippet name ?',
          treeController: treeC,
          entry: entry,
          allowButtonCallouts: allowButtonCallouts,
          scName: scName,
        ),
      );
}

class PropertiesTreeView extends StatelessWidget {
  final PTreeNodeTreeController treeC;

  // final bool allowButtonCallouts;

  const PropertiesTreeView({
    required this.treeC,
    // this.allowButtonCallouts = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) => TreeView<PTreeNode>(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        treeController: treeC..rebuild(),
        // filter or all
        nodeBuilder: (BuildContext context, TreeEntry<PTreeNode> entry) {
          if (entry.node.name == 'namedTextStyle') {}
          return TreeIndentation(
            guide: const IndentGuide.connectingLines(
              color: Colors.blueAccent,
              indent: 40.0,
            ),
            entry: entry,
            child: PTreeNodeWidget(treeC: treeC, entry: entry),
          );
        },
      );
}

class VersionsMenuAnchor extends StatelessWidget {
  final SnippetInfoModel snippetInfo;

  const VersionsMenuAnchor({required this.snippetInfo, super.key});

  @override
  Widget build(BuildContext context) {
    // REVERT menu items
    // List<MenuItemButton> revertMIs = [];
    // for (VersionId versionId
    //     in widget.snippet.versionIds() /*.sublist(0, 10)*/) {
    //   bool thisIsBeingEdited =
    //       fco.removeNonNumeric(versionId) == currentVersionId;
    //   bool thisIsCurrentlyPublished =
    //       fco.removeNonNumeric(versionId) == publishedVersionId;
    //   Color itemTextColor = Colors.black;
    //   if (thisIsCurrentlyPublished) itemTextColor = Colors.blue;
    //   revertMIs.add(MenuItemButton(
    //     onPressed: () async {
    //       if (versionId == currentVersionId) {
    //         fco.showToast(
    //           calloutConfig: CalloutConfig(
    //             cId: "cannot-revert-to-current-version",
    //             gravity: Alignment.topCenter,
    //             fillColor: Colors.yellow,
    //             initialCalloutW: fco.scrW * .8,
    //             initialCalloutH: 40,
    //           ),
    //           calloutContent: Padding(
    //               padding: const EdgeInsets.all(10),
    //               child: fco.coloredText(
    //                   'Cannot revert to Current version - ignored',
    //                   color: Colors.red)),
    //         );
    //       } else {
    //         FlutterContentApp.capiBloc.add(
    //           CAPIEvent.revertSnippet(
    //             snippetName: widget.snippet.name,
    //             versionId: fco.removeNonNumeric(versionId),
    //           ),
    //         );
    //         fco.afterNextBuildDo(() {
    //           fco.logi('reverted.');
    //         });
    //       }
    //     },
    //     child: Container(
    //       decoration: BoxDecoration(
    //         border: Border.all(
    //           color: thisIsBeingEdited ? fco.FUCHSIA_X : Colors.transparent,
    //           width: thisIsBeingEdited ? 4 : 0,
    //           style: BorderStyle.solid,
    //         ),
    //       ),
    //       padding: EdgeInsets.all(thisIsBeingEdited ? 4 : 0),
    //       child: fco.coloredText(
    //           '$versionId ' +
    //               fco.formattedDate(
    //                   int.tryParse(fco.removeNonNumeric(versionId)) ?? 0),
    //           color: itemTextColor),
    //     ),
    //   ));
    // }
    return MenuAnchor(
      builder:
          (BuildContext context, MenuController controller, Widget? child) {
        return IconButton(
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          icon: const Icon(Icons.more_vert, color: Colors.white),
          tooltip: 'Show menu',
        );
      },
      menuChildren: [
        // SubmenuButton(
        //     menuChildren: revertMIs, child: const Text('revert staging...')),
        Container(
          padding: EdgeInsets.all(10),
          color: snippetInfo.editingVersionId != snippetInfo.publishedVersionId
              ? Colors.grey
              : Colors.deepOrange,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              fco.coloredText(
                  snippetInfo.editingVersionId != snippetInfo.publishedVersionId
                      ? '(this is not the published version)'
                      : '(this is the published version)',
                  color: Colors.white),
              fco.coloredText(
                  snippetInfo.autoPublish ?? fco.appInfo.autoPublishDefault
                      ? '(changes to this snippet are automatically published)'
                      : '(changes are NOT automatically published)',
                  color: Colors.white),
            ],
          ),
        ),
        if (snippetInfo.editingVersionId != snippetInfo.publishedVersionId)
          MenuItemButton(
            onPressed: () {
              FlutterContentApp.capiBloc.add(CAPIEvent.publishSnippet(
                  snippetName: snippetInfo.name,
                  versionId: snippetInfo.editingVersionId));
            },
            child: const Text('publish this version'),
          ),
        MenuItemButton(
          onPressed: () {
            FlutterContentApp.capiBloc.add(
                CAPIEvent.toggleAutoPublishingOfSnippet(
                    snippetName: snippetInfo.name));
          },
          child: snippetInfo.autoPublish ?? fco.appInfo.autoPublishDefault
              ? const Tooltip(
                  message: "don't auto-push changes.",
                  child: Text('stop auto-publishing changes to this snippet'))
              : const Tooltip(
                  message: 'auto push changes as they occur',
                  child: Text('auto-publish future changes to this snippet')),
        ),
        MenuItemButton(
          onPressed: () async {
            FlutterContentApp.capiBloc.add(CAPIEvent.copySnippetJsonToClipboard(
              rootNode: FlutterContentApp.snippetBeingEdited!.getRootNode(),
            ));
          },
          child: const Text('copy snippet JSON to clipboard'),
        ),
        MenuItemButton(
          onPressed: () async {
            FlutterContentApp.capiBloc
                .add(const CAPIEvent.replaceSnippetFromJson());
          },
          child: const Text('save snippet JSON from clipboard'),
        ),
      ],
    );
  }
}
