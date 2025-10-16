import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/api/snippet_builder/replace_snippet_with_json_callout.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_callout_button_UML.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_callout_button_markdown.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_callout_button_quill_text.dart';

import 'fancy_tree/tree_controller.dart';

class SNodeWidget extends StatelessWidget {
  final String snippetName;
  final SnippetTreeController treeController;
  final TreeEntry<SNode> entry;
  final bool onClipboard;

  // final bool allowButtonCallouts;
  final ScrollControllerName? scName;

  const SNodeWidget({
    super.key,
    required this.snippetName,
    required this.treeController,
    required this.entry,
    this.onClipboard = false,
    // this.allowButtonCallouts = false,
    this.scName,
  });

  @override
  Widget build(BuildContext context) {
    // if (entry.node is SnippetRootNode && entry.parent == null) {
    //   return const Offstage();
    // }

    // bool selected = FCO.capiBloc.selectedNode == entry.node;

    Color boxColor = fco.snippetBeingEdited!.nodeBeingDeleted == entry.node
        ? Colors.red
        : entry.node is NamedSC || entry.node is NamedPS || entry.node is NamedMC
        ? Colors.transparent
        : entry.node is SnippetRootNode
        ? Colors.black
        : Colors.white;

    // fco.logger.d('SNodeWidget build (${entry.node.toString()}, ${entry.node.uid}, ${entry.node.nodeWidgetGK.toString()})');
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          // key: fco.aNodeIsSelected &&
          //         fco.selectedNode == entry.node
          //     ? fco.snippetBeingEdited!.selectedTreeNodeGK
          //     : null,
          margin: EdgeInsets.zero,
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          decoration: entry.node is DirectoryNode || entry.node is FileNode
              ? null
              : BoxDecoration(
                  color: boxColor,
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      entry.node is NamedSC || entry.node is NamedPS || entry.node is NamedMC
                          ? 4 : 30,
                    ),
                  ),
                ),
          alignment: Alignment.center,
          child: Row(
            children: [
              if (entry.node is! NamedSC && entry.node is! NamedPS && entry.node is! NamedMC &&
                  entry.node is! SnippetRootNode)
                entry.node.widgetLogo() ?? Icon(Icons.error, color: Colors.red),
              Gap(8),
              // if (entry.node.logoSrc() != null) SizedBox(width: entry.node.logoSrc()!.contains('pub.dev') ? 6 : 0),
              _name(context),
              Gap(8),
              if (entry.node is QuillTextNode)
                InkWell(
                  onTap: () {
                    _tappedNode(context);
                    fco.afterNextBuildDo(() {
                      var quillTextNode = entry.node as QuillTextNode;
                      PropertyButtonQuillText.showQuillEditor(
                        quillTextNode.deltaJsonString,
                        (String? newValue) {
                          quillTextNode.refreshWithUpdate(
                            context,
                            () =>
                                quillTextNode.deltaJsonString = newValue ?? '',
                          );
                        },
                        scName,
                      );
                    });
                  },
                  child: Icon(Icons.edit, size: 20),
                ),
              if (entry.node is UMLImageNode)
                InkWell(
                  onTap: () {
                    _tappedNode(context);
                    fco.afterNextBuildDo(() {
                      var umlImageNode = entry.node as UMLImageNode;
                      final teC = TextEditingController();
                      final originalUMLRecord = (
                        text: umlImageNode.umlText,
                        encodedText: umlImageNode.encodedText,
                        bytes: umlImageNode.cachedPngBytes,
                        width: umlImageNode.width,
                        height: umlImageNode.height,
                      );
                      // make sure start and end are present for viewing, but they don't get sent to the encoder
                      teC.text =
                          !(originalUMLRecord.text ?? '').contains('@startuml')
                          ? "@startuml\n${originalUMLRecord.text ?? ''}\n@enduml"
                          : originalUMLRecord.text ?? '';
                      PropertyButtonUML.showUMLEditor(
                        context,
                        originalUMLRecord,
                        teC,
                        (UMLRecord newValue) {
                          umlImageNode.refreshWithUpdate(context, () {
                            umlImageNode.umlText = newValue.text;
                            umlImageNode.encodedText = newValue.encodedText;
                            umlImageNode.cachedPngBytes = newValue.bytes;
                            umlImageNode.width = newValue.width;
                            umlImageNode.height = newValue.height;
                          });
                        },
                        (newSize) {
                          umlImageNode.width = newSize.width;
                          umlImageNode.height = newSize.height;
                        },
                      );
                    });
                  },
                  child: Icon(Icons.edit, size: 20),
                ),
              if (entry.node is MarkdownNode)
                InkWell(
                  onTap: () {
                    _tappedNode(context);
                    fco.afterNextBuildDo(() {
                      var markdownNode = entry.node as MarkdownNode;
                      PropertyButtonMarkdown.showMarkdownEditor(
                        markdownNode.data??markdownNode.SAMPLE_MD,
                        (String? newValue) {
                          markdownNode.refreshWithUpdate(
                            context,
                            () => markdownNode.data = newValue ?? '',
                          );
                        },
                      );
                    });
                  },
                  child: Icon(Icons.edit, size: 20),
                ),
            ],
          ),
        ),
        if (entry.hasChildren)
          ExpandIcon(
            // key: GlobalObjectKey(entry.node.uid),
            isExpanded: treeController.getExpansionState(entry.node),
            //entry.isExpanded,
            padding: EdgeInsets.zero,
            onPressed: (_) {
              if (treeController.getExpansionState(entry.node)) {
                treeController.toggleExpansion(entry.node);
              } else {
                // instead of expanding current node, do a cascading expand
                treeController.expand(entry.node);
              }
            },
          )
        else
          const SizedBox(height: 30),
      ],
    );
    // });
  }

  Widget _name(BuildContext context) {
    final isRootNode = entry.node is SnippetRootNode;
    return Tooltip(
      message: isRootNode && entry.node.getParent() != null
          ? 'double tap to edit this snippet'
          : '',
      child: GestureDetector(
        // key: entry.node == snippetBloc.state.selectedNode ? STreeNode.selectionGK : null,
        // onLongPress: () => _longPressedOrDoubleTapped(snippetBloc),
        onDoubleTapDown: (TapDownDetails details) async {
          if (entry.node.getParent() == null) {
            return;
          }

          if (entry.node is! SnippetRootNode) {
            _longPressedNode(context, details.globalPosition, entry.node);
            return;
          }

          fco.dismissAll();

          // instead of using the embedded snippet node, which has no child,
          // use the actual (STANDALONE) snippet itself
          // Assumption: actual snippet will be in versionCache
          SnippetInfoModel? snippetInfo = SnippetInfoModel.cachedSnippetInfo(
            (entry.node as SnippetRootNode).name,
          );
          SnippetRootNode? snippet = await snippetInfo
              ?.currentVersionFromCacheOrFB();

          if (snippet != null) {
            SNode.pushThenShowNamedSnippetWithNodeSelected(
              snippet.name,
              snippet,
              // snippet.child ?? snippet,
              scName: scName,
            );
          }
        },
        onTap: () {
          _tappedNode(context);
        },
        onSecondaryTapUp: fco.isIOS
            ? null
            : (TapUpDetails details) {
                _longPressedNode(context, details.globalPosition, entry.node);
              },
        // onLongPressStart: !fco.isIOS ? null : (LongPressStartDetails details){
        //   _longPressedNode(context, details.globalPosition, entry.node);
        // },
        child: entry.node is DirectoryNode
            ? Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.folder, size: 30, color: Colors.amber),
                  const Gap(6),
                  _text(),
                ],
              )
            // : entry.node is FileNode
            // ? (entry.node as FileNode).toWidget(snippetBloc, context)
            : _text(),
      ),
    );
  }

  void _tappedNode(BuildContext context) {
    if (onClipboard /* || entry.node is GenericSingleChildNode*/ ) return;
    // if (entry.node is TextSpanNode) {
    //   fco.logger.i('TextSpan cannot be selected (has no key property!)');
    //   return;
    // };

    if (fco.snippetBeingEdited!.aNodeIsSelected &&
        entry.node == fco.selectedNode) {
      return;
    }

    // double savedOffset = NamedScrollController.scrollOffset(scName);

    if (!treeController.getExpansionState(entry.node)) {
      treeController.expand(entry.node);
    }

    // fco.dismiss(TREENODE_MENU_CALLOUT);

    bool thisWasAlreadySelected = (entry.node == fco.selectedNode);

    if (fco.snippetBeingEdited!.aNodeIsSelected && thisWasAlreadySelected) {
      fco.hide("floating-clipboard");
      // fco.dismiss(SELECTED_NODE_BORDER_CALLOUT);
      fco.capiBloc.add(CAPIEvent.clearNodeSelection());
    } else if (!fco.snippetBeingEdited!.aNodeIsSelected ||
        !thisWasAlreadySelected) {
      if (fco.appInfo.clipboard != null) {
        fco.unhide("floating-clipboard");
      }

      // // Rect? borderRect = entry.node.calcBborderRect();
      // EditablePageState? eps = EditablePage.of(context);
      // eps?.dismissAllNodeWidgetOverlays();

      fco.capiBloc.add(
        CAPIEvent.selectNode(
          node: entry.node,
          // imageTC: tc,
          // selectedWidgetGK: GlobalKey(debugLabel: 'selectedWidgetGK'),
          // selectedTreeNodeGK: GlobalKey(debugLabel: 'selectedTreeNodeGK'),
        ),
      );
    }

    // fco.afterNextBuildDo(() {
    //   fco.afterMsDelayDo(1000, () {
    //     SnippetRootNode? rootNode = entry.node.rootNodeOfSnippet();
    //     var ctx = rootNode?.child?.nodeWidgetGK?.currentContext;
    //     if (ctx != null) {
    //       EditablePageState? eps = EditablePage.of(ctx);
    //       eps?.showNodeWidgetOverlays();
    //     }
    //   });
    // });
  }

  void _longPressedNode(BuildContext context, Offset tapPos, SNode node) {
    // clear sel
    // EditablePageState? eps = EditablePage.of(context);
    // eps?.dismissAllNodeWidgetOverlays();
    // // fco.dismiss(SELECTED_NODE_BORDER_CALLOUT);
    fco.hide("floating-clipboard");

    fco.capiBloc.add(CAPIEvent.selectNode(node: node));
    // fco.afterMsDelayDo(1000, () {
      _showNodeWidgetMenu(context, tapPos, node);
    // });
  }

  void _showNodeWidgetMenu(BuildContext context, Offset tapPos, SNode node) {
    fco.showOverlay(
      calloutConfig: CalloutConfig(
        cId: 'node-actions',
        scrollControllerName: scName,
        initialCalloutW: 300,
        initialCalloutH: 220,
        initialTargetAlignment: Alignment.centerRight,
        initialCalloutAlignment: Alignment.centerLeft,
        finalSeparation: 300,
        targetPointerType: TargetPointerType.thin_line(),
        bubbleOrTargetPointerColor: Colors.white,
        animatePointer: true,
        barrier: CalloutBarrierConfig(
          color: Colors.black,
          opacity: .4,
          // excludeTargetFromBarrier: true,
          cutoutPadding: 40,
        ),
        toDelta: -20,
      ),
      calloutContent: nodeButtons(context, scName, node),
      targetGkF: () => node.treeNodeGK,
    );
  }

  // _longPressedOrDoubleTapped(snippetBloc) {
  //   if (onClipboard || entry.node is GenericSingleChildNode) return;
  //   bool thisWasAlreadySelected = (entry.node == snippetBloc.state.selectedNode);
  //   if (thisWasAlreadySelected) {
  //     showTreeNodeMenu();
  //   } else if (snippetBloc.state.aNodeIsSelected) {
  //     snippetBloc.add(const SnippetEvent.clearNodeSelection());
  //     fco.afterNextBuildDo(() {
  //       snippetBloc.add(SnippetEvent.selectNode(
  //         node: entry.node,
  //         nodeParent: entry.parent?.node,
  //         showProperties: true,
  //         // imageTC: tc,
  //       ));
  //       fco.afterNextBuildDo(() {
  //         showTreeNodeMenu();
  //       });
  //     });
  //   } else {
  //     snippetBloc.add(SnippetEvent.selectNode(
  //       node: entry.node,
  //       nodeParent: entry.parent?.node,
  //       showProperties: true,
  //       // imageTC: tc,
  //     ));
  //     fco.afterNextBuildDo(() {
  //       showTreeNodeMenu();
  //     });
  //   }
  //   if (FCO.capiBloc.state.jsonClipboard != null) {
  //     fco.unhide("floating-clipboard");
  //   }
  // }

  Widget _text() {
    var selectedNode = fco.selectedNode;
    var node = entry.node;

    String displayedNodeName = node is SnippetRootNode && node.name.isNotEmpty
        ? node.name
        : node is DirectoryNode && node.name!.isNotEmpty
        ? node.name!
        : node is DirectoryNode && node.name!.isEmpty
        ? 'name ?'
        : node is FileNode && node.name.isEmpty
        ? 'filename ?'
        : node is FileNode && node.src.isEmpty
        ? 'src ?'
        : node is FileNode
        ? node.name
        : node.toString();

    // bool badParent = selectedNode.sensibleParents().isNotEmpty && !selectedNode.sensibleParents().contains(selectNodeParent?.toString());
    // if (badParent) {
    //   fco.logger.i("bad ${selectedNode.toString()}, parent: ${selectNodeParent?.toString()}");
    //   fco.logger.i("sensible parents: ${selectedNode.sensibleParents().toString()}");
    // }

    Color textColor = node == selectedNode ? Colors.black : Colors.grey;
    return Text(
      key: node.treeNodeGK = GlobalKey(),
      displayedNodeName,
      textScaler: TextScaler.linear(
        entry.node is NamedSC || entry.node is NamedPS || entry.node is NamedMC ? .9 : 1.0,
      ),
      style: TextStyle(
        color: node is SnippetRootNode || entry.node is NamedSC || entry.node is NamedPS || entry.node is NamedMC
            ? Colors.white
            : textColor,
        fontSize: 12.0,
        fontStyle: node is MC && !node.children.isNotEmpty
            ? FontStyle.italic
            : FontStyle.normal,
        fontWeight: node == selectedNode ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }

  Widget nodeButtons(BuildContext context, scName, SNode node) {
    var gc = node.getParent(); // may be genericchildnode

    double trashButtonOpacity = !fco.aNodeIsSelected ||
        !node.canRemove() ||
        (node is SnippetRootNode &&
            node.getParent() == null) ||
        (gc is NamedSC? &&
            gc?.getParent() is StepNode &&
            (gc?.propertyName == 'title' ||
                gc?.propertyName == 'content'))
        ? .5
        : 1.0;
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          if (node is! NamedSC && node is! NamedMC)
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  hoverColor: Colors.white30,
                  onPressed: () {
                    // some properties cannot be deleted
                    if (gc is NamedSC? &&
                        gc?.getParent() is StepNode &&
                        (gc?.propertyName == 'title' ||
                            gc?.propertyName == 'content')) {
                      return;
                    }
                    fco.capiBloc.add(
                      CAPIEvent.cutNode(node: node, scName: scName),
                    );
                    fco.afterNextBuildDo(() {
                      fco.dismiss('node-actions');
                      if (fco.appInfo.clipboard != null) {
                        fco.unhide("floating-clipboard");
                      }
                    });
                    fco.hide("TreeNodeMenu");
                  },
                  icon: Icon(
                    Icons.cut,
                    color: Colors.orange.withValues(
                      alpha:
                          !fco.aNodeIsSelected ||
                              node is SnippetRootNode ||
                              gc is NamedSC? &&
                                  gc?.getParent() is StepNode &&
                                  (gc?.propertyName == 'title' ||
                                      gc?.propertyName == 'content')
                          ? .5
                          : 1.0,
                    ),
                  ),
                  tooltip: 'Cut',
                ),
                // if (snippetBloc.state.aNodeIsSelected && selectedNode is! SnippetRefNode)
                IconButton(
                  hoverColor: Colors.white30,
                  onPressed: () {
                    fco.afterNextBuildDo(() {
                      fco.capiBloc.add(
                        CAPIEvent.copyNode(node: node, scName: scName),
                      );
                      fco.afterNextBuildDo(() {
                        fco.dismiss('node-actions');
                        if (fco.appInfo.clipboard != null) {
                          fco.unhide("floating-clipboard");
                        }
                      });
                    });
                    fco.hide("TreeNodeMenu");
                  },
                  icon: Icon(
                    Icons.copy,
                    color: Colors.green.withValues(
                      alpha: fco.aNodeIsSelected && node is! SnippetRootNode
                          ? 1.0
                          : .25,
                    ),
                  ),
                  tooltip: 'Copy',
                ),
                IconButton(
                  hoverColor: Colors.white30,
                  onPressed: () async {
                    // some properties cannot be deleted!selectedNode.canBeDeleted()
                    // some properties cannot be deleted
                    if (!node.canRemove()) return;
                    // bool wasShowingAsRoot = selectedNode == snippetBloc.treeC.roots.first;
                    // STreeNode? parentNode = selectedNode.getParent() as STreeNode?;
                    EditablePageState? eps = EditablePage.of(context);
                    eps?.dismissAllNodeWidgetOverlays();
                    fco.capiBloc.add(const CAPIEvent.deleteNodeTapped());
                    fco.afterNextBuildDo(() async {
                      await Future.delayed(const Duration(milliseconds: 1000));
                      fco.capiBloc.add(const CAPIEvent.completeDeletion());
                      fco.afterNextBuildDo(() {
                        fco.dismiss('node-actions');
                        // if was tab or tabview, reset the tab Q and controller
                        // SnippetPanelState? spState = SnippetPanel.of(context);
                        // spState?.resetTabQandC;
                        // redraw tree if deleted node was root
                        // if (wasShowingAsRoot && parentNode != null) {
                        //   snippetBloc.add(CAPIEvent.selectNode(
                        //     node: parentNode,
                        //     selectedTreeNodeGK: GlobalKey(debugLabel: 'selectedTreeNodeGK'),
                        //   ));
                        // }
                        if (node is TargetsWrapperNode) {
                          node.targets.clear();
                        }
                      });
                    });
                    // fco.dismiss("TreeNodeMenu");
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red.withValues(
                      alpha:trashButtonOpacity,
                    ),
                  ),
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
                          fco.capiBloc.add(
                            CAPIEvent.saveNodeAsSnippet(
                              node: node,
                              newSnippetName: s,
                            ),
                          );
                          fco.afterNextBuildDo(() {
                            fco.dismiss("input-snippet-name");
                            fco.dismiss('node-actions');
                          });
                        },
                        scName: scName,
                      );
                    },
                    icon: const Icon(Icons.link, color: Colors.blue),
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
                //       color: Colors.red.withValues(alpha:
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
          if (node.canReplace())
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: node.insertItemMenuAnchor(
                context,
                action: NodeAction.replaceWith,
                label: 'Replace with...',
                bgColor: Colors.lightBlueAccent,
              ),
            ),
          _editTreeStructureIconButtons(context, node),
          const Gap(10),
        ],
      ),
    );
  }


  // bool _canAddChld(SNode selectedNode) =>
  //     selectedNode is ScaffoldNode && selectedNode.appBar == null ||
  //         (selectedNode is SnippetRootNode && selectedNode.child == null) ||
  //             (selectedNode is SliverAppBarNode && selectedNode.flexibleSpace == null) ||
  //         // || (selectedNode is! ChildlessNode && !entry.hasChildren))
  //         // (selectedNode is RichTextNode && selectedNode.text == null) ||
  //         (selectedNode is SC && selectedNode.child == null) ||
  //         (selectedNode is MC ||
  //             selectedNode is TextSpanNode ||
  //             selectedNode is WidgetSpanNode);

  Widget _editTreeStructureIconButtons(
    BuildContext context,
    SNode selectedNode,
  ) {
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
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(selectedNode.toString()),
                    ),
                  ),
                  if (selectedNode is! RowNode &&
                      selectedNode.canAddASibling())
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          selectedNode.insertItemMenuAnchor(
                            context,
                            action: NodeAction.addSiblingBefore,
                            tooltip: 'Insert sibling before...',
                            bgColor: Colors.blue,
                          ),
                          const Gap(12),
                          // selectedNode is RowNode
                          //     ? const VerticalDivider(thickness: 6, indent: 30, endIndent: 30)
                          //     : const Divider(thickness: 6, indent: 30, endIndent: 30),
                          selectedNode.insertItemMenuAnchor(
                            context,
                            action: NodeAction.addSiblingAfter,
                            tooltip: 'Insert sibling after...',
                            bgColor: Colors.blue,
                          ),
                        ],
                      ),
                    ),
                  if (selectedNode.canWrap())
                    Positioned(
                      top: 10,
                      left: 10,
                      child: selectedNode.insertItemMenuAnchor(
                        context,
                        action: NodeAction.wrapWith,
                        tooltip: 'Wrap with...',
                        bgColor: Colors.blue,
                      ),
                    ),
                  if (selectedNode.canAppendAChild())
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: selectedNode.insertItemMenuAnchor(
                        context,
                        action: NodeAction.addChild,
                        tooltip: 'Add child...',
                        bgColor: Colors.blue,
                      ),
                    ),
                ],
              ),
            ),
          ),
          if (selectedNode is RowNode &&
              selectedNode.canAddASibling())
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
                      context,
                      action: NodeAction.addSiblingBefore,
                      tooltip: 'Insert sibling before...',
                      bgColor: Colors.blue,
                    ),
                    selectedNode.insertItemMenuAnchor(
                      context,
                      action: NodeAction.addSiblingAfter,
                      tooltip: 'Insert sibling after...',
                      bgColor: Colors.blue,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  // _pushThenEditSnippet() {
  // String refdNodeName = (entry.node as SnippetRefNode).snippetName;
  // // push snippet editor
  // FCO.capiBloc.add(CAPIEvent.pushSnippetBloc(snippetName: refdNodeName));
  // fco.afterNextBuildDo(() {
  //   SnippetBloC? snippetBeingEdited = CAPIBloC.snippetBeingEdited;
  //   if (snippetBeingEdited != null) {
  //     showSnippetTreeCallout(
  //       snippetBloc: snippetBeingEdited,
  //       targetGKF: () => CAPIState.snippetRootGkMap[refdNodeName],
  //       onDismissedF: () {
  //         // CAPIState.snippetStateMap[snippetBloc.snippetName] = snippetBloc.state;
  //         STreeNode.unhighlightSelectedNode();
  //         fco.dismiss('selected-panel-border-overlay');
  //         FCO.capiBloc.add(const CAPIEvent.unhideAllTargetGroups());
  //         FCO.capiBloc.add(const CAPIEvent.popSnippetBloc());
  //         // removeNodePropertiesCallout();
  //         fco.dismiss(TREENODE_MENU_CALLOUT);
  //         MaterialAppWrapperState.exitEditMode();
  //         if (snippetBeingEdited.state.canUndo()) {
  //           FCO.capiBloc.add(const CAPIEvent.saveModel());
  //         }
  //       },
  //       allowButtonCallouts: allowButtonCallouts,
  //     );
  //   }
  // });
  // }
}

// class _MyKey extends GlobalObjectKey {
//   const _MyKey(super.value);
// }
