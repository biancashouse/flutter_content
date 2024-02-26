import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_state.dart';
import 'package:flutter_content/src/bloc/snippet_event.dart';
import 'package:flutter_content/src/snippet/callout_node_menu.dart';
import 'package:flutter_content/src/snippet/pnode_widget.dart';
import 'package:flutter_content/src/snippet/snode_widget.dart';
import 'package:flutter_content/src/target_config/content/snippet_editor/input_snippet_name.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:multi_split_view/multi_split_view.dart';

class SnippetTreeAndPropertiesCalloutContents extends HookWidget {
  final ScrollController? ancestorHScrollController;
  final ScrollController? ancestorVScrollController;

  // final VoidCallback onChangedF;
  // final VoidCallback onExpiredF;
  final bool allowButtonCallouts;

  const SnippetTreeAndPropertiesCalloutContents({
    this.ancestorHScrollController,
    this.ancestorVScrollController,
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
    final msvC = useState<MultiSplitViewController>(MultiSplitViewController(areas: [Area(size: 220)]));
    final snippetBloc = context.watch<SnippetBloC>();
    final STreeNode? selectedNode = snippetBloc.state.selectedNode;
    final List<PTreeNode> propertyNodes = selectedNode?.properties(context) ?? [];
    if (selectedNode != null) {
      // get a new treeController only when snippet selected
      selectedNode.pTreeC = PTreeNodeTreeController(
        roots: propertyNodes,
        childrenProvider: Node.propertyTreeChildrenProvider,
      );
      //showTreeNodeMenu(context, () => STreeNode.selectionGK);
      snippetBloc.state.treeC.expand(snippetBloc.state.treeC.roots.first);
      selectedNode.propertiesPaneSC ??= ScrollController()
        ..addListener(() {
          selectedNode.propertiesPaneScrollPos = selectedNode.propertiesPaneSC?.offset ?? 0.0;
        });
    }
    return StatefulBuilder(
      // buildWhen: (prev, curr) => prev.selectedNode == curr.selectedNode,
      builder: (BuildContext context, StateSetter setState) {
        // get parent callout config
        PositionedBoxContent? parent = PositionedBoxContent.of(context);
        var cc = parent?.calloutConfig;
        // CAPIState state = FlutterContent().capiBloc.state;
        // pTreeC?.expandedNodes = CAPIState.expandedNodes[state.selectedNode!] ?? {};
        // pTreeC?.rebuild();
        // pTreeC?.addListener(() {
        //   // may have toggled an expansion
        //   CAPIState.expandedNodes[state.selectedNode!] = pTreeC.expandedNodes;
        //   print('expanded: ${CAPIState.expandedNodes.length}');
        // });
        // GlobalKey snippetNodeAddChildBtnGK = GlobalKey();
        final STreeNode? selectedNode = snippetBloc.state.selectedNode;
        // print("SnippetTreeCalloutContents rebuild Scaffold/SnippetTreePane and PropertiesTreePane...");
        // print('${FlutterContent().capiBloc.selectedNode?.propertiesPaneScrollPos ?? 0.0}');
        // restore scrollPos
        if (selectedNode?.propertiesPaneSC?.hasClients ?? false) {
          Useful.afterNextBuildDo(() {
            if (selectedNode?.propertiesPaneScrollPos != selectedNode?.propertiesPaneSC?.offset) {
              selectedNode?.propertiesPaneSC?.jumpTo(selectedNode.propertiesPaneScrollPos ?? 0.0);
            }
          });
        }
        return ClipRRect(
          borderRadius: BorderRadius.circular(16.0), // Adjust radius as needed
          child: Scaffold(
            backgroundColor: Colors.purpleAccent.shade100,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Tooltip(
                message: 'snippet name',
                child: Useful.coloredText(snippetBloc.snippetName, fontSize: 16.0, color: Colors.white),
              ),
              // title: GestureDetector(
              //   onTap: () {
              //     snippetBloc.add(const SnippetEvent.clearNodeSelection());
              //     Callout.hide("floating-clipboard");
              //     Useful.afterNextBuildDo(() {
              //       snippetBloc.add(SnippetEvent.selectNode(
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
              //     child: Useful.coloredText('SnippetName: ${snippetBloc.snippetName}', fontSize: 16.0, color: Colors.black87),
              //   ),
              // ),
              actions: [
                // if (snippetBloc.state.selectedNode is! SnippetRefNode)
                // IconButton(
                //   onPressed: () {
                //     snippetBloc.add(SnippetEvent.cutNode(node: snippetBloc.state.selectedNode!));
                //     Useful.afterNextBuildDo(() {
                //       if (FlutterContent().capiBloc.state.jsonClipboard != null) {
                //         Callout.unhide("floating-clipboard");
                //       }
                //     });
                //     Callout.hide("TreeNodeMenu");
                //   },
                //   icon: Icon(
                //     Icons.cut,
                //     color:
                //         Colors.orange.withOpacity(snippetBloc.state.aNodeIsSelected && snippetBloc.state.selectedNode is! SnippetRefNode ? 1.0 : .25),
                //   ),
                //   tooltip: 'Cut',
                // ),
                // // if (snippetBloc.state.aNodeIsSelected && snippetBloc.state.selectedNode is! SnippetRefNode)
                // IconButton(
                //   onPressed: () {
                //     Useful.afterNextBuildDo(() {
                //       snippetBloc.add(SnippetEvent.copyNode(node: snippetBloc.state.selectedNode!));
                //       Useful.afterNextBuildDo(() {
                //         if (FlutterContent().capiBloc.state.jsonClipboard != null) {
                //           Callout.unhide("floating-clipboard");
                //         }
                //       });
                //     });
                //     Callout.hide("TreeNodeMenu");
                //   },
                //   icon: Icon(
                //     Icons.copy,
                //     color:
                //         Colors.green.withOpacity(snippetBloc.state.aNodeIsSelected && snippetBloc.state.selectedNode is! SnippetRefNode ? 1.0 : .25),
                //   ),
                //   tooltip: 'Copy',
                // ),
                // IconButton(
                //   onPressed: () {
                //     Callout.dismiss(SELECTED_NODE_BORDER_CALLOUT);
                //     if (snippetBloc.state.selectedNode is! RichTextNode) {
                //       snippetBloc.add(const SnippetEvent.deleteNodeTapped());
                //     }
                //     Callout.dismiss("TreeNodeMenu");
                //   },
                //   icon: Icon(Icons.delete,
                //       color:
                //           Colors.red.withOpacity(snippetBloc.state.aNodeIsSelected && snippetBloc.state.selectedNode is! SnippetRefNode ? 1.0 : .25)),
                //   tooltip: 'Remove',
                // ),
                IconButton(
                  // style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white)),
                  icon: Icon(
                    Icons.undo,
                    color: Colors.white.withOpacity(snippetBloc.state.canUndo() ? 1.0 : .25),
                  ),
                  onPressed: () {
                    if (snippetBloc.state.canUndo()) snippetBloc.add(SnippetEvent.undo(name: snippetBloc.snippetName));
                    Useful.afterNextBuildDo(() {
                      snippetBloc.state.treeC.expandCascading([snippetBloc.rootNode!]);
                    });
                  },
                ),
                IconButton(
                  // style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white)),
                  icon: Icon(
                    Icons.redo,
                    color: Colors.white.withOpacity(snippetBloc.state.canRedo() ? 1.0 : .25),
                  ),
                  onPressed: () {
                    if (snippetBloc.state.canRedo()) snippetBloc.add(SnippetEvent.redo(name: snippetBloc.snippetName));
                    Useful.afterNextBuildDo(() {
                      snippetBloc.state.treeC.expandCascading([snippetBloc.rootNode!]);
                    });
                  },
                ),
                hspacer(16),
                // IconButton(
                //   style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white24)),
                //   icon: const Icon(
                //     Icons.close,
                //     color: Colors.black,
                //   ),
                //   onPressed: () {
                //     unhideAllSingleTargetBtns();
                //     STreeNode.unhighlightSelectedNode();
                //     FlutterContent().capiBloc.add(const CAPIEvent.unhideAllTargetGroups());
                //     FlutterContent().capiBloc.add(const CAPIEvent.popSnippetTree());
                //
                //     //removeSnippetTreeCallout(snippetBloc.snippetName);
                //     CalloutState? state = Callout.of(context);
                //     state?.toggle();
                //
                //     // removeNodePropertiesCallout();
                //     Callout.removeOverlay(TREENODE_MENU_CALLOUT);
                //     FlutterContent().capiBloc.add(const CAPIEvent.saveModel());
                //   },
                // ),
                // hspacer(16),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: MultiSplitViewTheme(
                data: MultiSplitViewThemeData(dividerThickness: 24),
                child: MultiSplitView(
                  axis: Axis.horizontal,
                  controller: msvC.value,
                  // onWeightChange: () => setState(() {}),
                  dividerBuilder: (axis, index, resizable, dragging, highlighted, themeData) {
                    return Container(
                      color: dragging ? Colors.purpleAccent[200] : Colors.purpleAccent[100],
                      child: Icon(
                        Icons.drag_indicator,
                        color: highlighted ? Colors.blueAccent : Colors.white,
                      ),
                    );
                  },
                  children: [
                    // SNIPPET TREE
                    GestureDetector(
                      onTap: () {
                        snippetBloc.add(const SnippetEvent.clearNodeSelection());
                        Callout.hide("floating-clipboard");
                      },
                      child: SnippetTreePane(snippetBloc: snippetBloc),
                    ),
                    // NODE PROPERTIES
                    if (selectedNode?.pTreeC != null)
                      GestureDetector(
                        onTap: () {
                          snippetBloc.add(const SnippetEvent.clearNodeSelection());
                          Callout.hide("floating-clipboard");
                        },
                        child: Container(
                          color: Colors.purpleAccent[100],
                          child: Center(
                            child: ListView(
                              controller: selectedNode!.propertiesPaneSC!,
                              shrinkWrap: true,
                              children: [
                                // icon buttons
                                ExpansionTile(
                                  title: Useful.coloredText('...', color: Colors.white),
                                  backgroundColor: Colors.black,
                                  collapsedBackgroundColor: Colors.black,
                                  onExpansionChanged: (bool isExpanded) => FC().showingNodeButtons = isExpanded,
                                  initiallyExpanded: FC().showingNodeButtons,
                                  children: [nodeButtons(snippetBloc, context)],
                                ),
                                // NODE PROPERTIES TREE
                                if (propertyNodes.isEmpty) Useful.coloredText(' (no properties)', color: Colors.white),
                                if (true || propertyNodes.isNotEmpty && !(selectedNode.hidePropertiesWhileDragging ?? false))
                                  Material(
                                      color: Colors.black,
                                      child: PropertiesTreeView(
                                        treeC: selectedNode.pTreeC!,
                                      )),
                                // Container(color: Colors.purpleAccent[100], width: double.infinity, height: 1000),
                              ],
                            ),
                          ),
                        ),
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
            //               // if (propertyNodes.isEmpty) Useful.coloredText(' (no properties)', color: Colors.white),
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
      },
    );
  }

  Widget nodeButtons(snippetBloc, context) {
    var gc = snippetBloc.state.selectedNode.parent;
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          if (snippetBloc.state.selectedNode is! GenericSingleChildNode && snippetBloc.state.selectedNode is! GenericMultiChildNode)
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  hoverColor: Colors.white30,
                  onPressed: () {
                    // some properties cannot be deleted
                    if (gc is GenericSingleChildNode? && gc?.parent is StepNode && (gc?.propertyName == 'title' || gc?.propertyName == 'content')) return;
                    snippetBloc.add(SnippetEvent.cutNode(node: snippetBloc.state.selectedNode!, capiBloc: FC().capiBloc));
                    Useful.afterNextBuildDo(() {
                      if (FC().capiBloc.state.jsonClipboard != null) {
                        Callout.unhide("floating-clipboard");
                      }
                    });
                    Callout.hide("TreeNodeMenu");
                  },
                  icon: Icon(
                    Icons.cut,
                      color: Colors.orange.withOpacity(!snippetBloc.state.aNodeIsSelected ||
                          snippetBloc.state.selectedNode is SnippetRefNode ||
                          (gc?.parent is StepNode && (gc?.propertyName == 'title' || gc?.propertyName == 'content'))
                          ? .5
                          : 1.0)),
                  tooltip: 'Cut',
                ),
                // if (snippetBloc.state.aNodeIsSelected && snippetBloc.state.selectedNode is! SnippetRefNode)
                IconButton(
                  hoverColor: Colors.white30,
                  onPressed: () {
                    Useful.afterNextBuildDo(() {
                      snippetBloc.add(SnippetEvent.copyNode(node: snippetBloc.state.selectedNode!));
                      Useful.afterNextBuildDo(() {
                        if (FC().capiBloc.state.jsonClipboard != null) {
                          Callout.unhide("floating-clipboard");
                        }
                      });
                    });
                    Callout.hide("TreeNodeMenu");
                  },
                  icon: Icon(
                    Icons.copy,
                    color:
                        Colors.green.withOpacity(snippetBloc.state.aNodeIsSelected && snippetBloc.state.selectedNode is! SnippetRefNode ? 1.0 : .25),
                  ),
                  tooltip: 'Copy',
                ),
                IconButton(
                  hoverColor: Colors.white30,
                  onPressed: () async {
                    // some properties cannot be deleted
                    // some properties cannot be deleted
                    if (snippetBloc.state.selectedNode?.isAStepNodeTitleOrContentPropertyWidget()) return;
                    if (snippetBloc.state.selectedNode?.isAScaffoldTabWidget()) return;
                    if (snippetBloc.state.selectedNode?.isAScaffoldTabViewWidget()) return;
                    Callout.dismiss(SELECTED_NODE_BORDER_CALLOUT);
                    if (snippetBloc.state.selectedNode is! RichTextNode) {
                      snippetBloc.add(const SnippetEvent.deleteNodeTapped());
                      Useful.afterNextBuildDo(() async {
                        await Future.delayed(const Duration(milliseconds: 1000));
                        snippetBloc.add(const SnippetEvent.completeDeletion());
                        Useful.afterNextBuildDo(() {
                          // if was tab or tabview, reset the tab Q and controller
                          SnippetPanelState? spState = SnippetPanel.of(context);
                          spState?.resetTabQandC;
                        });
                      });
                    }
                    Callout.dismiss("TreeNodeMenu");
                  },
                  icon: Icon(Icons.delete,
                      color: Colors.red.withOpacity(!snippetBloc.state.aNodeIsSelected ||
                              snippetBloc.state.selectedNode is SnippetRefNode ||
                              (gc is GenericSingleChildNode? && gc?.parent is StepNode && (gc?.propertyName == 'title' || gc?.propertyName == 'content'))
                          ? .5
                          : 1.0)),
                  tooltip: 'Remove',
                ),
                if (snippetBloc.state.selectedNode is! SnippetRootNode)
                  IconButton(
                    hoverColor: Colors.white30,
                    onPressed: () {
                      // TODO save as new snippet and replace with snippet ref node
                      showSaveAsCallout(
                          selectedNode: snippetBloc.state.selectedNode,
                          //targetGKF: () => targetGK,
                          saveModelF: (s) {
                            snippetBloc.add(SnippetEvent.saveNodeAsSnippet(
                              node: snippetBloc.state.selectedNode!,
                              newSnippetName: s,
                            ));
                          });
                      Callout.dismiss(TREENODE_MENU_CALLOUT);
                    },
                    icon: const Icon(
                      Icons.link,
                      color: Colors.blue,
                    ),
                    tooltip: 'Save a a new Snippet...',
                  ),
              ],
            ),
          // tree structure icon buttons
          // replace button
          if (snippetBloc.state.selectedNode is! GenericSingleChildNode && _canReplace(snippetBloc.state.selectedNode!))
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: insertItemMenuAnchor(snippetBloc, snippetBloc.state.selectedNode!,
                  action: NodeAction.replace, label: 'Replace with...', bgColor: Colors.lightBlueAccent),
            ),
          editTreeStructureIconButtons(snippetBloc),
          vspacer(10),
        ],
      ),
    );
  }

  bool _canReplace(STreeNode? selectNodeParent) => true;

  bool _canAddSiblng(STreeNode? selectNodeParent) => (selectNodeParent is MC || selectNodeParent is TextSpanNode);

  bool _canWrap(STreeNode selectedNode) => (selectedNode is! GenericSingleChildNode &&
      selectedNode is! GenericMultiChildNode &&
      selectedNode is! InlineSpanNode &&
      selectedNode is! SnippetRootNode &&
      selectedNode is! FileNode &&
      selectedNode is! PollOptionNode &&
      selectedNode is! StepNode);

  bool _canAddChld(STreeNode selectedNode) =>
      selectedNode is! SnippetRefNode &&
      ((selectedNode is SnippetRootNode && selectedNode.child == null) ||
          // || (selectedNode is! ChildlessNode && !entry.hasChildren))
          // (selectedNode is RichTextNode && selectedNode.text == null) ||
          (selectedNode is SC && selectedNode.child == null) ||
          (selectedNode is MC || selectedNode is TextSpanNode));

  Widget editTreeStructureIconButtons(snippetBloc) {
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
                        borderRadius: const BorderRadius.all(Radius.circular(30)),
                      ),
                      alignment: Alignment.center,
                      child: Text(snippetBloc.state.selectedNode.toString()),
                    ),
                  ),
                  if (snippetBloc.state.selectedNode is! RowNode && _canAddSiblng(snippetBloc.state.selectedNode.parent))
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          insertItemMenuAnchor(snippetBloc, snippetBloc.state.selectedNode!,
                              action: NodeAction.addSiblingBefore, tooltip: 'Insert sibling before...', bgColor: Colors.blue),
                          vspacer(12),
                          // snippetBloc.state.selectedNode is RowNode
                          //     ? const VerticalDivider(thickness: 6, indent: 30, endIndent: 30)
                          //     : const Divider(thickness: 6, indent: 30, endIndent: 30),
                          insertItemMenuAnchor(snippetBloc, snippetBloc.state.selectedNode!,
                              action: NodeAction.addSiblingAfter, tooltip: 'Insert sibling after...', bgColor: Colors.blue),
                        ],
                      ),
                    ),
                  if (_canWrap(snippetBloc.state.selectedNode!))
                    Positioned(
                      top: 10,
                      left: 10,
                      child: insertItemMenuAnchor(snippetBloc, snippetBloc.state.selectedNode!,
                          action: NodeAction.wrapWith, tooltip: 'Wrap with...', bgColor: Colors.blue),
                    ),
                  if (_canAddChld(snippetBloc.state.selectedNode!))
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: insertItemMenuAnchor(snippetBloc, snippetBloc.state.selectedNode!,
                          action: NodeAction.addChild, tooltip: 'Add child...', bgColor: Colors.blue),
                    ),
                ],
              ),
            ),
          ),
          if (snippetBloc.state.selectedNode is RowNode && _canAddSiblng(snippetBloc.state.selectedNode.parent))
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
                    insertItemMenuAnchor(snippetBloc, snippetBloc.state.selectedNode!,
                        action: NodeAction.addSiblingBefore, tooltip: 'Insert sibling before...', bgColor: Colors.blue),
                    insertItemMenuAnchor(snippetBloc, snippetBloc.state.selectedNode!,
                        action: NodeAction.addSiblingAfter, tooltip: 'Insert sibling after...', bgColor: Colors.blue),
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
  final SnippetBloC snippetBloc;

  const SnippetTreePane({required this.snippetBloc, super.key});

  @override
  Widget build(BuildContext context) {
    if (snippetBloc.rootNode!.child == null) {
      List<Widget> menuChildren = menuAnchorWidgets(
        snippetBloc,
        snippetBloc.rootNode!,
        NodeAction.addChild,
      );
      return MenuAnchor(
        alignmentOffset: const Offset(80, 0),
        menuChildren: menuChildren,
        builder: (BuildContext context, MenuController controller, Widget? child) {
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
              backgroundColor: MaterialStatePropertyAll(Colors.white.withOpacity(.9)),
              //padding: MaterialStatePropertyAll(EdgeInsets.zero),
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
            // onInteractionStart: (_) => snippetBloc.add(const SnippetEvent.clearNodeSelection()),
            // onInteractionEnd: (_) => snippetBloc.add(const SnippetEvent.clearNodeSelection()),
            child: SizedBox(
              width: 700,
              height: 1200,
              child: Builder(builder: (context) {
                final STreeNode? selectedNode = snippetBloc.state.selectedNode;
                if (snippetBloc.rootNode != snippetBloc.treeC.roots.first && snippetBloc.treeC.roots.first is! ScaffoldNode) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      navigateUpTreeButton(),
                      Expanded(child: SnippetTreeView(snippetBloc: snippetBloc)),
                    ],
                  );
                }
                return SnippetTreeView(snippetBloc: snippetBloc);
              }),
            ),
          ),
        ),
      );
    }
  }

  Widget navigateUpTreeButton() => FilledButton(
        onPressed: () {
          // change tree root to parent
          STreeNode treeRootNode = snippetBloc.treeC.roots.first;
          STreeNode? parent = treeRootNode.parent as STreeNode?;
          if (parent != null) {
            // go up again if parent is a property widget
            if (parent is GenericSingleChildNode) {
              parent = parent.parent as STreeNode?;
            }
            if (parent != null) {
              snippetBloc.add(
                SnippetEvent.selectNode(
                  node: parent,
                  selectedWidgetGK: GlobalKey(debugLabel: 'selectedWidgetGK'),
                  selectedTreeNodeGK: GlobalKey(debugLabel: 'selectedTreeNodeGK'),
                ),
              );
            }
            // Callout.dismiss(snippetBloc.snippetName);
            // if (parent != null) {
            //   Useful.afterNextBuildDo(() {
            //     MaterialSPAState.pushThenShowNamedSnippetWithNodeSelected(
            //         snippetBloc.snippetName, parent!, snippetBloc.state.selectedNode);
            //   });
            // }
          }
        },
        style: const ButtonStyle().copyWith(
          backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
          shape: const MaterialStatePropertyAll(RoundedRectangleBorder()),
          padding: const MaterialStatePropertyAll(EdgeInsets.zero),
          // maximumSize: MaterialStatePropertyAll(Size(40, 36)),
          // minimumSize: MaterialStatePropertyAll(Size(40, 36)),
        ),
        child: Useful.coloredText("...", color: Colors.white, fontSize: 24),
      );
}

class SnippetTreeView extends HookWidget {
  final SnippetBloC snippetBloc;
  final ScrollController? ancestorHScrollController;
  final ScrollController? ancestorVScrollController;

  // final VoidCallback onChangedF;
  // final VoidCallback onExpiredF;
  final bool allowButtonCallouts;

  const SnippetTreeView({
    required this.snippetBloc,
    this.ancestorHScrollController,
    this.ancestorVScrollController,
    // required this.onChangedF,
    // required this.onExpiredF,
    this.allowButtonCallouts = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TreeView<STreeNode>(
      physics: const NeverScrollableScrollPhysics(),
      treeController: snippetBloc.treeC,
      // filter or all
      nodeBuilder: (BuildContext context, TreeEntry<STreeNode> entry) {
        // if (bloc.aNodeIsSelected && treeC!.hasAncestor(entry, bloc.state.selectedNode) && bloc.state.showProperties) return const Offstage();
        // print("rebuilding entry: ${entry.node.runtimeType.toString()} expanded: ${entry.isExpanded}");
        return TreeIndentation(
          guide: IndentGuide.connectingLines(
            color: FC().aNodeIsSelected && entry.node == FC().selectedNode ? Colors.green : Colors.white,
            indent: 40.0,
          ),
          entry: entry,
          child: NodeWidget(
            snippetName: snippetBloc.rootNode.name,
            treeController: snippetBloc.treeC,
            entry: entry,
            allowButtonCallouts: allowButtonCallouts,
          ),
        );
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
        treeController: treeC,
        // filter or all
        nodeBuilder: (BuildContext context, TreeEntry<PTreeNode> entry) {
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
