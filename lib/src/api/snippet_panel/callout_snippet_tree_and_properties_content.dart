import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_callouts/flutter_callouts.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/api/snippet_panel/save_as_callout.dart';
import 'package:flutter_content/src/bloc/capi_event.dart';
import 'package:flutter_content/src/bloc/capi_state.dart';
import 'package:flutter_content/src/snippet/pnode_widget.dart';
import 'package:flutter_content/src/snippet/snode_widget.dart';
import 'package:flutter_content/src/snippet/snodes/hotspots/widgets/config_toolbar/callout_config_toolbar.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';
import 'package:gap/gap.dart';
import 'package:multi_split_view/multi_split_view.dart';

class SnippetTreeAndPropertiesCalloutContents extends StatelessWidget {
  final String? scrollControllerName;

  // final VoidCallback onChangedF;
  // final VoidCallback onExpiredF;
  final bool allowButtonCallouts;

  const SnippetTreeAndPropertiesCalloutContents({
    this.scrollControllerName,
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

  @override
  Widget build(BuildContext context) {
    // debugPrint('SnippetTreeAndPropertiesCalloutContents tree build');
    // final snippetBloc = context.watch<SnippetBloC>();
    // final STreeNode? selectedNode = selectedNode;
    // get parent callout config
    // PositionedBoxContent? parent = PositionedBoxContent.of(context);
    // var cc = parent?.calloutConfig;
    // CAPIState state = FCO.capiBloc.state;
    // pTreeC?.expandedNodes = CAPIState.expandedNodes[state.selectedNode!] ?? {};
    // pTreeC?.rebuild();
    // pTreeC?.addListener(() {
    //   // may have toggled an expansion
    //   CAPIState.expandedNodes[state.selectedNode!] = pTreeC.expandedNodes;
    //   debugPrint('expanded: ${CAPIState.expandedNodes.length}');
    // });
    // GlobalKey snippetNodeAddChildBtnGK = GlobalKey();
    // debugPrint("SnippetTreeCalloutContents rebuild Scaffold/SnippetTreePane and PropertiesTreePane...");
    // debugPrint('${FCO.capiBloc.selectedNode?.propertiesPaneScrollPos ?? 0.0}');
    // restore scrollPos
    // STreeNode? selectedNode = ;
    // if (selectedNode?.propertiesPaneSC().hasClients ?? false) {
    //   fco.afterNextBuildDo(() {
    //     if (selectedNode?.propertiesPaneScrollPos != selectedNode?.propertiesPaneSC().offset) {
    //       selectedNode?.propertiesPaneSC().jumpTo(selectedNode.propertiesPaneScrollPos());
    //     }
    //   });
    // }
    // for the prev and next icons
    SnippetName? snippetName = FlutterContentApp.snippetBeingEdited?.rootNode.name;
    if (snippetName == null) return fco.errorIcon(Colors.red);
    VersionId? currentEditingVersionId =
        fco.snippetInfoCache[snippetName]?.editingVersionId;
    if (currentEditingVersionId == null) return fco.errorIcon(Colors.green);
    int index = fco.versionIds(snippetName).indexOf(currentEditingVersionId);
    //
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0), // Adjust radius as needed
      child: Scaffold(
        backgroundColor: Colors.purpleAccent.shade100,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Tooltip(
            message: 'snippet name',
            child: fco.coloredText(
              FlutterContentApp.snippetBeingEdited?.rootNode.name ?? 'snippet name?',
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
          // title: GestureDetector(
          //   onTap: () {
          //     snippetBloc.add(const CAPIEvent.clearNodeSelection());
          //     Callout.hide("floating-clipboard");
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
                if (index > 0) {
                  VersionId? prevId = fco.versionIds(snippetName)[index - 1];
                  FlutterContentApp.capiBloc.add(
                    CAPIEvent.revertSnippet(
                      snippetName: snippetName,
                      versionId: fco.removeNonNumeric(prevId),
                    ),
                  );
                  fco.afterNextBuildDo(() {
                    debugPrint('reverted to previous version.');
                  });
                }
              },
              icon: Icon(Icons.undo,
                  color: index > 0 ? Colors.white : Colors.white54),
              tooltip: 'previous version',
            ),

            IconButton(
              hoverColor: Colors.white30,
              onPressed: () async {
                if (index < fco.versionIds(snippetName).length - 1) {
                  VersionId? nextId = fco.versionIds(snippetName)[index + 1];
                  FlutterContentApp.capiBloc.add(
                    CAPIEvent.revertSnippet(
                      snippetName: snippetName,
                      versionId: fco.removeNonNumeric(nextId),
                    ),
                  );
                  fco.afterNextBuildDo(() {
                    debugPrint('reverted to next version.');
                  });
                }
              },
              icon: Icon(Icons.redo,
                  color: (index < fco.versionIds(snippetName).length - 1)
                      ? Colors.white
                      : Colors.white54),
              tooltip: 'next version',
            ),
            IconButton(
              hoverColor: Colors.white30,
              onPressed: () async {},
              icon: VersionsMenuAnchor(
                  snippetName:
                      FlutterContentApp.snippetBeingEdited?.rootNode.name ?? 'snippet name ?'),
              tooltip: 'version...',
            ),
            // if (selectedNode is! SnippetRefNode)
            // IconButton(
            //   onPressed: () {
            //     snippetBloc.add(CAPIEvent.cutNode(node: selectedNode!));
            //     fco.afterNextBuildDo(() {
            //       if (FCO.capiBloc.state.jsonClipboard != null) {
            //         Callout.unhide("floating-clipboard");
            //       }
            //     });
            //     Callout.hide("TreeNodeMenu");
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
            //           Callout.unhide("floating-clipboard");
            //         }
            //       });
            //     });
            //     Callout.hide("TreeNodeMenu");
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
            //     Callout.dismiss(SELECTED_NODE_BORDER_CALLOUT);
            //     if (selectedNode is! RichTextNode) {
            //       snippetBloc.add(const CAPIEvent.deleteNodeTapped());
            //     }
            //     Callout.dismiss("TreeNodeMenu");
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
            //     CalloutState? state = Callout.of(context);
            //     state?.toggle();
            //
            //     // removeNodePropertiesCallout();
            //     Callout.removeOverlay(TREENODE_MENU_CALLOUT);
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
                return Container(
                  color: dragging
                      ? Colors.purpleAccent[200]
                      : Colors.purpleAccent[100],
                  child: Icon(
                    Icons.drag_indicator,
                    color: highlighted ? Colors.blueAccent : Colors.white,
                  ),
                );
              },
              initialAreas: [
                // SNIPPET TREE
                Area(
                  builder: (ctx, area) {
                    return GestureDetector(
                      onTap: () {
                        FlutterContentApp.capiBloc
                            .add(const CAPIEvent.clearNodeSelection());
                        Callout.hide("floating-clipboard");
                      },
                      child: BlocBuilder<CAPIBloC, CAPIState>(
                          builder: (context, state) {
                        debugPrint('Area: SnippetTreePane');
                        state.snippetBeingEdited?.treeC.rebuild();
                        return SnippetTreePane();
                      }),
                    );
                  },
                  flex: 1,
                ),
                // NODE PROPERTIES
                if (FlutterContentApp.selectedNode?.pTreeC != null)
                  Area(
                    builder: (ctx, area) {
                      return BlocBuilder<CAPIBloC, CAPIState>(
                        builder: (context, state) {
                          return !FlutterContentApp.aNodeIsSelected
                              ? const Offstage()
                              : Container(
                                  color: Colors.purpleAccent[100],
                                  child: Center(
                                    child: ListView(
                                      controller: FlutterContentApp
                                          .selectedNode!
                                          .propertiesPaneSC(),
                                      shrinkWrap: true,
                                      children: [
                                        // icon buttons
                                        ExpansionTile(
                                          title: fco.coloredText(
                                              'widget actions',
                                              color: Colors.white54,
                                              fontSize: 14),
                                          backgroundColor: Colors.black,
                                          collapsedBackgroundColor:
                                              Colors.black,
                                          onExpansionChanged:
                                              (bool isExpanded) =>
                                                  fco.showingNodeButtons =
                                                      isExpanded,
                                          initiallyExpanded:
                                              fco.showingNodeButtons,
                                          children: [nodeButtons(context)],
                                        ),
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
      ),
    );
  }

  Widget nodeButtons(context) {
    var selectedNode = FlutterContentApp.selectedNode!;
    var gc = selectedNode.getParent(); // may be genericchildnode
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          if (selectedNode is! GenericSingleChildNode &&
              selectedNode is! GenericMultiChildNode)
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
                        .add(CAPIEvent.cutNode(node: selectedNode));
                    fco.afterNextBuildDo(() {
                      if (fco.clipboard != null) {
                        Callout.unhide("floating-clipboard");
                      }
                    });
                    Callout.hide("TreeNodeMenu");
                  },
                  icon: Icon(Icons.cut,
                      color: Colors.orange.withOpacity(
                          !FlutterContentApp.aNodeIsSelected ||
                                  selectedNode is SnippetRootNode ||
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
                          .add(CAPIEvent.copyNode(node: selectedNode));
                      fco.afterNextBuildDo(() {
                        if (fco.clipboard != null) {
                          Callout.unhide("floating-clipboard");
                        }
                      });
                    });
                    Callout.hide("TreeNodeMenu");
                  },
                  icon: Icon(
                    Icons.copy,
                    color: Colors.green.withOpacity(
                        FlutterContentApp.aNodeIsSelected &&
                                selectedNode is! SnippetRootNode
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
                    if (!selectedNode.canBeDeleted()) return;
                    STreeNode node = selectedNode;
                    // bool wasShowingAsRoot = selectedNode == snippetBloc.treeC.roots.first;
                    // STreeNode? parentNode = selectedNode.getParent() as STreeNode?;
                    Callout.dismiss(SELECTED_NODE_BORDER_CALLOUT);
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
                    // Callout.dismiss("TreeNodeMenu");
                  },
                  icon: Icon(Icons.delete,
                      color: Colors.red.withOpacity(
                          !FlutterContentApp.aNodeIsSelected ||
                                  !selectedNode.canBeDeleted() ||
                                  (selectedNode is SnippetRootNode &&
                                      selectedNode.getParent() == null) ||
                                  (gc is GenericSingleChildNode? &&
                                      gc?.getParent() is StepNode &&
                                      (gc?.propertyName == 'title' ||
                                          gc?.propertyName == 'content'))
                              ? .5
                              : 1.0)),
                  tooltip: 'Remove',
                ),
                if (selectedNode is! SnippetRootNode)
                  IconButton(
                    hoverColor: Colors.white30,
                    onPressed: () {
                      showSaveAsCallout(
                          selectedNode: selectedNode,
                          //targetGKF: () => targetGK,
                          saveModelF: (s) {
                            FlutterContentApp.capiBloc
                                .add(CAPIEvent.saveNodeAsSnippet(
                              node: selectedNode,
                              newSnippetName: s,
                            ));
                            fco.afterNextBuildDo(() {
                              Callout.dismiss(TREENODE_MENU_CALLOUT);
                            });
                          });
                    },
                    icon: const Icon(
                      Icons.link,
                      color: Colors.blue,
                    ),
                    tooltip: 'Save a a new Snippet...',
                  ),
                // IconButton(
                //   hoverColor: Colors.white30,
                //   onPressed: () async {
                //     // some properties cannot be deleted!selectedNode.canBeDeleted()
                //     // some properties cannot be deleted
                //     if (!selectedNode.canBeDeleted()) return;
                //     Callout.dismiss(SELECTED_NODE_BORDER_CALLOUT);
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
                //     Callout.dismiss("TreeNodeMenu");
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
          if (selectedNode is! GenericSingleChildNode &&
              _canReplace(selectedNode))
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: selectedNode.insertItemMenuAnchor(
                action: NodeAction.replaceWith,
                label: 'Replace with...',
                bgColor: Colors.lightBlueAccent,
              ),
            ),
          editTreeStructureIconButtons(selectedNode),
          Gap(10),
        ],
      ),
    );
  }

  bool _canReplace(STreeNode? selectNode) => selectNode?.getParent() != null;

  bool _canAddSiblng(STreeNode? selectNodeParent) => (selectNodeParent is MC ||
      selectNodeParent is TextSpanNode ||
      selectNodeParent is WidgetSpanNode);

  bool _canWrap(STreeNode selectedNode) => (selectedNode
          is! GenericSingleChildNode &&
      selectedNode is! GenericMultiChildNode &&
      selectedNode is! InlineSpanNode &&
      (selectedNode is! SnippetRootNode || selectedNode.getParent() != null) &&
      selectedNode is! FileNode &&
      selectedNode is! PollOptionNode &&
      selectedNode is! StepNode);

  bool _canAddChld(STreeNode selectedNode) =>
      selectedNode is! SnippetRootNode &&
      ((selectedNode is SnippetRootNode && selectedNode.child == null) ||
          // || (selectedNode is! ChildlessNode && !entry.hasChildren))
          // (selectedNode is RichTextNode && selectedNode.text == null) ||
          (selectedNode is SC && selectedNode.child == null) ||
          (selectedNode is MC ||
              selectedNode is TextSpanNode ||
              selectedNode is WidgetSpanNode));

  Widget editTreeStructureIconButtons(STreeNode selectedNode) {
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
                          Gap(12),
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
  SnippetTreePane({super.key});

  @override
  Widget build(BuildContext context) {
    if (FlutterContentApp.snippetBeingEdited?.rootNode.child == null) {
      List<Widget> menuChildren =
          FlutterContentApp.snippetBeingEdited?.rootNode.menuAnchorWidgets(NodeAction.addChild) ??
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
        color: Colors.purpleAccent.shade100,
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
                if (FlutterContentApp.snippetBeingEdited?.rootNode !=
                        FlutterContentApp
                            .snippetBeingEdited?.treeC.roots.first &&
                    FlutterContentApp.snippetBeingEdited?.treeC.roots.first
                        is! ScaffoldNode) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (canShowNavigateUpBtn) navigateUpTreeButton(context),
                      Expanded(child: SnippetTreeView()),
                    ],
                  );
                }
                debugPrint('SnippetTreeView...');
                return SnippetTreeView();
              }),
            ),
          ),
        ),
      );
    }
  }

  Widget navigateUpTreeButton(context) => FilledButton(
        onPressed: () {
          SnippetTreePane.navigateUpTree();
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
          // Callout.dismiss(snippetBloc.snippetName);
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

  static void navigateUpTree() {
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
      Callout.dismissAll(exceptFeatures: [CalloutConfigToolbar.CID]);
      STreeNode.pushThenShowNamedSnippetWithNodeSelected(
        parent.rootNodeOfSnippet()!.name,
        parent,
        parent,
      );
    }
  }
}

class SnippetTreeView extends StatelessWidget {
  final String? scrollControllerName;

  // final VoidCallback onChangedF;
  // final VoidCallback onExpiredF;
  final bool allowButtonCallouts;

  const SnippetTreeView({
    this.scrollControllerName,
    // required this.onChangedF,
    // required this.onExpiredF,
    this.allowButtonCallouts = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var snippetBeingEdited = FlutterContentApp.snippetBeingEdited;
    debugPrint(
        "snippetBeingEdited is ${snippetBeingEdited != null ? 'not null' : 'null'}");
    SnippetTreeController? treeC = snippetBeingEdited?.treeC;
    if (treeC == null) return fco.errorIcon(Colors.red);
    return TreeView<STreeNode>(
      physics: const NeverScrollableScrollPhysics(),
      treeController: treeC,
      // filter or all
      nodeBuilder: (BuildContext context, TreeEntry<STreeNode> entry) {
        // if (FlutterContentApp.aNodeIsSelected && treeC!.hasAncestor(entry, bloc.state.selectedNode) && bloc.state.showProperties) return const Offstage();
        // debugPrint("rebuilding entry: ${entry.node.runtimeType.toString()} expanded: ${entry.isExpanded}");
        if (FlutterContentApp.snippetBeingEdited?.rootNode == entry.node) return const Offstage();
        if (entry.node == FlutterContentApp.selectedNode)
          debugPrint(
              'SnippetTreeView - selected node: ${FlutterContentApp.selectedNode.toString()}');
        // never show the tree root node
        return true //entry.node is! SnippetRootNode && entry.node != treeC.roots.firstOrNull
            ? TreeIndentation(
                guide: IndentGuide.connectingLines(
                  color: FlutterContentApp.aNodeIsSelected &&
                          entry.node == FlutterContentApp.selectedNode
                      ? Colors.green
                      : Colors.white,
                  indent: 40.0,
                ),
                entry: entry,
                child: NodeWidget(
                  snippetName:
                      FlutterContentApp.snippetBeingEdited?.rootNode.name ?? 'snippet name ?',
                  treeController: treeC,
                  entry: entry,
                  allowButtonCallouts: allowButtonCallouts,
                ),
              )
            : const Offstage();
      },
    );
  }
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

class VersionsMenuAnchor extends StatefulWidget {
  final SnippetName snippetName;

  const VersionsMenuAnchor({required this.snippetName, super.key});

  @override
  State<VersionsMenuAnchor> createState() => _VersionsMenuAnchorState();
}

class _VersionsMenuAnchorState extends State<VersionsMenuAnchor> {
  @override
  Widget build(BuildContext context) {
    VersionId? currentVersionId =
        fco.snippetInfoCache[widget.snippetName]?.editingVersionId;
    VersionId? publishedVersionId =
        fco.snippetInfoCache[widget.snippetName]?.publishedVersionId;

    // REVERT menu items
    List<MenuItemButton> revertMIs = [];
    for (VersionId versionId
        in fco.versionIds(widget.snippetName) /*.sublist(0, 10)*/) {
      bool thisIsBeingEdited =
          fco.removeNonNumeric(versionId) == currentVersionId;
      bool thisIsCurrentlyPublished =
          fco.removeNonNumeric(versionId) == publishedVersionId;
      Color itemTextColor = Colors.black;
      if (thisIsCurrentlyPublished) itemTextColor = Colors.blue;
      revertMIs.add(MenuItemButton(
        onPressed: () async {
          if (versionId == currentVersionId) {
            fca.showToast(
              calloutConfig: CalloutConfig(
                cId: "cannot-revert-to-current-version",
                gravity: Alignment.topCenter,
                fillColor: Colors.yellow,
                initialCalloutW: fco.scrW * .8,
                initialCalloutH: 40,
              ),
              calloutContent: Padding(
                  padding: const EdgeInsets.all(10),
                  child: fco.coloredText(
                      'Cannot revert to Current version - ignored',
                      color: Colors.red)),
            );
          } else {
            FlutterContentApp.capiBloc.add(
              CAPIEvent.revertSnippet(
                snippetName: widget.snippetName,
                versionId: fco.removeNonNumeric(versionId),
              ),
            );
            fco.afterNextBuildDo(() {
              debugPrint('reverted.');
            });
          }
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: thisIsBeingEdited ? fco.FUCHSIA_X : Colors.transparent,
              width: thisIsBeingEdited ? 4 : 0,
              style: BorderStyle.solid,
            ),
          ),
          padding: EdgeInsets.all(thisIsBeingEdited ? 4 : 0),
          child: fco.coloredText(
              '$versionId ' +
                  fco.formattedDate(
                      int.tryParse(fco.removeNonNumeric(versionId)) ?? 0),
              color: itemTextColor),
        ),
      ));
    }
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
        SubmenuButton(
            menuChildren: revertMIs, child: const Text('revert staging...')),
        if (currentVersionId != publishedVersionId)
          MenuItemButton(
            onPressed: () {
              if (currentVersionId != null) {
                FlutterContentApp.capiBloc.add(CAPIEvent.publishSnippet(
                    snippetName: widget.snippetName,
                    versionId: currentVersionId));
              }
            },
            child: const Text('publish'),
          ),
        MenuItemButton(
          onPressed: () {
            FlutterContentApp.capiBloc.add(
                CAPIEvent.toggleAutoPublishingOfSnippet(
                    snippetName: widget.snippetName));
          },
          child: fco.snippetInfoCache[widget.snippetName]!.autoPublish ?? false
              ? const Tooltip(
                  message: "don't auto-push changes.",
                  child: Text('stop auto-publishing changes to this snippet'))
              : const Tooltip(
                  message: 'auto push changes as they occur',
                  child: Text('auto-publish changes to this snippet')),
        ),
        MenuItemButton(
          onPressed: () async {
            FlutterContentApp.capiBloc.add(CAPIEvent.copySnippetJsonToClipboard(
              rootNode: FlutterContentApp.snippetBeingEdited!.rootNode,
            ));
          },
          child: const Text('copy snippet JSON to clipboard'),
        ),
        MenuItemButton(
          onPressed: () async {
            FlutterContentApp.capiBloc.add(const CAPIEvent.replaceSnippetFromJson());
          },
          child: const Text('save snippet JSON from clipboard'),
        ),
      ],
    );
  }
}
