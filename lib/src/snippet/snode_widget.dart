import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/snippet_event.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';

class NodeWidget extends StatelessWidget {
  final String snippetName;
  final SnippetTreeController treeController;
  final TreeEntry<STreeNode> entry;
  final bool onClipboard;
  final ScrollController? ancestorHScrollController;
  final ScrollController? ancestorVScrollController;
  final bool allowButtonCallouts;

  const NodeWidget({
    super.key,
    required this.snippetName,
    required this.treeController,
    required this.entry,
    this.onClipboard = false,
    this.ancestorHScrollController,
    this.ancestorVScrollController,
    this.allowButtonCallouts = false,
  });

  @override
  Widget build(BuildContext context) {
    SnippetBloC snippetBloc = context.read<SnippetBloC>();

    if (entry.node is SnippetRootNode && entry.parent == null) {
      return const Offstage();
    }

    // bool selected = FlutterContent().capiBloc.selectedNode == entry.node;
    Color boxColor = snippetBloc.state.nodeBeingDeleted == entry.node
        ? Colors.red
        : entry.node is GenericSingleChildNode
            ? Colors.transparent
            : entry.node is SnippetRootNode
                ? Colors.black
                : Colors.white;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          key: snippetBloc.state.aNodeIsSelected && snippetBloc.state.selectedNode == entry.node ? snippetBloc.state.selectedTreeNodeGK : null,
          margin: EdgeInsets.zero,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: entry.node is DirectoryNode || entry.node is FileNode
              ? null
              : BoxDecoration(
                  color: boxColor,
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(entry.node is GenericSingleChildNode ? 4 : 30)),
                ),
          alignment: Alignment.center,
          child: Row(
            children: [
              if (entry.node.logoSrc() != null && entry.node is! GenericSingleChildNode) entry.node.logoSrc()!,
              // if (entry.node.logoSrc() != null) SizedBox(width: entry.node.logoSrc()!.contains('pub.dev') ? 6 : 0),
              _name(context, snippetBloc),
            ],
          ),
        ),
        if (entry.hasChildren)
          ExpandIcon(
            key: GlobalObjectKey(entry.node),
            isExpanded: treeController.getExpansionState(entry.node), //entry.isExpanded,
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
  }

  Widget _name(context, SnippetBloC snippetBloc) {
    return InkWell(
      // key: entry.node == snippetBloc.state.selectedNode ? STreeNode.selectionGK : null,
      // onLongPress: () => _longPressedOrDoubleTapped(snippetBloc),
      onTap: () {
        if (onClipboard /* || entry.node is GenericSingleChildNode*/) return;

        if (!treeController.getExpansionState(entry.node)) {
          treeController.expand(entry.node);
        }

        Callout.dismiss(TREENODE_MENU_CALLOUT);

        bool thisWasAlreadySelected = (entry.node == snippetBloc.state.selectedNode);

        if (snippetBloc.state.aNodeIsSelected && thisWasAlreadySelected) {
          Callout.hide("floating-clipboard");
          Callout.dismiss(SELECTED_NODE_BORDER_CALLOUT);
          snippetBloc.add(const SnippetEvent.clearNodeSelection());
        } else if (!snippetBloc.aNodeIsSelected || !thisWasAlreadySelected) {
          if (FC().clipboard != null) {
            Callout.unhide("floating-clipboard");
          }
          snippetBloc.add(const SnippetEvent.clearNodeSelection());
          Useful.afterNextBuildDo(() {
            final List<PTreeNode> propertyNodes = entry.node.properties(context);
            // get a new treeController only when snippet selected
            // entry.node.pTreeC ??= PTreeNodeTreeController(
            //   roots: propertyNodes,
            //   childrenProvider: Node.propertyTreeChildrenProvider,
            // );
            // //showTreeNodeMenu(context, () => STreeNode.selectionGK);
            // // snippetBloc.state.treeC.expand(snippetBloc.state.treeC.roots.first);
            // entry.node.propertiesPaneSC() ??= ScrollController()
            //   ..addListener(() {
            //     entry.node.propertiesPaneScrollPos = entry.node.propertiesPaneSC?.offset ?? 0.0;
            //   });
            snippetBloc.add(SnippetEvent.selectNode(
              node: entry.node,
              // imageTC: tc,
              selectedWidgetGK: GlobalKey(debugLabel: 'selectedWidgetGK'),
              selectedTreeNodeGK: GlobalKey(debugLabel: 'selectedTreeNodeGK'),
            ));
            Useful.afterNextBuildDo(() {
              MaterialSPAState.showNodeWidgetOverlay(entry.node);
              // create selected node's properties tree
            });
          });
        }

        // removeNodePropertiesCallout();
        // if ((MediaQuery.of(context).size.width ?? 0) <= 1366) {
        //   Useful.afterNextBuildDo(() {
        //     if (context.mounted) {
        //       showTreeNodeMenu(context, () => STreeNode.selectionGK);
        //     } else
        //       debugPrint("context fucked.");
        //   });
        // }

        // Useful.afterNextBuildDo(() {
        //   removeNodeMenuCallout();
        //   showNodeMenuCallout(
        //     context: context,
        //     selectedNode: entry.node,
        //     selectionParentNode: entry.parent?.node,
        //     targetGKF: () => Node.selectionGK, //nodeGK,
        //   );
        // });
      },
      // onLongPress: () {
      //   FlutterContent().capiBloc.add(CAPIEvent.selectNode(
      //     node: entry.node,
      //     nodeParent: entry.parent?.node,
      //     nodeRootIndex: treeController.nearestRootIndex(entry),
      //     showAdders: true,
      //     showProperties: true,
      //     // imageTC: tc,
      //   ));
      //   Useful.afterNextBuildDo(() {
      //     showTreeNodeMenu();
      //   });
      // },
      // onDoubleTap: () {
      //   _longPressedOrDoubleTapped(snippetBloc);

      // if (onClipboard) return;
      //
      // // removeNodePropertiesCallout();
      // Callout.dismiss(TREENODE_MENU_CALLOUT);
      //
      // snippetBloc.add(SnippetEvent.selectNode(
      //   node: entry.node,
      //   nodeParent: entry.parent?.node,
      //   showProperties: true,
      //   // imageTC: tc,
      // ));
      //
      // Useful.afterNextBuildDo(() {
      //   if (entry.node is SnippetRefNode) {
      //     _pushThenEditSnippet();
      //   } else {
      //     // showNodeAddersAndPropertiesCallout(
      //     //   context: context,
      //     //   selectedNode: entry.node as STreeNode,
      //     //   selectionParentNode: entry.parent?.node as STreeNode?,
      //     //   nodeGK: () => nodeGK,
      //     // );
      //   }
      // });
      // },
      // onLongPress: () {
      //   Callout(
      //     // context: context,
      //     feature: CAPI.SOURCE_CODE.index,
      //     color: Colors.white,
      //     closeButtonColor: Colors.red,
      //     barrierOpacity: .1,
      //     contents: () =>
      //         ListView(
      //           shrinkWrap: true,
      //           padding: const EdgeInsets.all(8.0),
      //           children: [
      //             SizedBox(
      //               height: 4000,
      //               child: Text(
      //                 entry.node.toSource(context),
      //               ),
      //             )
      //           ],
      //         ),
      //     width: Useful.scrW * .9,
      //     height: Useful.scrH * .8,
      //     minHeight: 60,
      //     onBarrierTappedF: () async {
      //       Callout.removeOverlay(CAPI.SOURCE_CODE.index);
      //     },
      //   ).show();
      // },
      child: entry.node is DirectoryNode
          ? Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.folder, size: 30, color: Colors.amber),
                hspacer(6),
                _text(entry.node, entry.parent?.node, snippetBloc),
              ],
            )
          // : entry.node is FileNode
          // ? (entry.node as FileNode).toWidget(snippetBloc, context)
          : _text(entry.node, entry.parent?.node, snippetBloc),
    );
  }

  // _longPressedOrDoubleTapped(snippetBloc) {
  //   if (onClipboard || entry.node is GenericSingleChildNode) return;
  //   bool thisWasAlreadySelected = (entry.node == snippetBloc.state.selectedNode);
  //   if (thisWasAlreadySelected) {
  //     showTreeNodeMenu();
  //   } else if (snippetBloc.state.aNodeIsSelected) {
  //     snippetBloc.add(const SnippetEvent.clearNodeSelection());
  //     Useful.afterNextBuildDo(() {
  //       snippetBloc.add(SnippetEvent.selectNode(
  //         node: entry.node,
  //         nodeParent: entry.parent?.node,
  //         showProperties: true,
  //         // imageTC: tc,
  //       ));
  //       Useful.afterNextBuildDo(() {
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
  //     Useful.afterNextBuildDo(() {
  //       showTreeNodeMenu();
  //     });
  //   }
  //   if (FlutterContent().capiBloc.state.jsonClipboard != null) {
  //     Callout.unhide("floating-clipboard");
  //   }
  // }

  Widget _text(STreeNode selectedNode, STreeNode? selectNodeParent, SnippetBloC snippetBloc) {
    // if (entry.node is DirectoryNode || entry.node is FileNode)
    //   throw();

    String displayedNodeName = selectedNode is SnippetRootNode && selectedNode.name.isNotEmpty
        ? selectedNode.name
        : selectedNode is DirectoryNode && selectedNode.name.isNotEmpty
            ? selectedNode.name
            : selectedNode is DirectoryNode && selectedNode.name.isEmpty
                ? 'name ?'
                : selectedNode is FileNode && selectedNode.name.isEmpty
                    ? 'filename ?'
                    : selectedNode is FileNode && selectedNode.src.isEmpty
                        ? 'src ?'
                        : selectedNode is FileNode
                            ? selectedNode.name
                            : selectedNode.toString();

    bool badParent = selectedNode.sensibleParents().isNotEmpty && !selectedNode.sensibleParents().contains(selectNodeParent?.toString());
    if (badParent) {
      debugPrint("bad ${selectedNode.toString()}, parent: ${selectNodeParent?.toString()}");
      debugPrint("sensible parents: ${selectedNode.sensibleParents().toString()}");
    }

    Color textColor = Colors.black;
    if (snippetBloc.state.aNodeIsSelected && snippetBloc.state.selectedNode != selectedNode) textColor = Colors.grey;
    return Text(
      displayedNodeName,
      textScaler: TextScaler.linear(entry.node is GenericSingleChildNode ? .9 : 1.0),
      style: TextStyle(
        color: badParent
            ? Colors.orange
            : selectedNode is SnippetRootNode || selectedNode is GenericSingleChildNode
                ? Colors.white
                : textColor,
        fontSize: 12.0,
        fontStyle: selectedNode is MC && !selectedNode.children.isNotEmpty ? FontStyle.italic : FontStyle.normal,
        fontWeight: snippetBloc.state.aNodeIsSelected && snippetBloc.state.selectedNode == selectedNode ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }

  _pushThenEditSnippet() {
    // String refdNodeName = (entry.node as SnippetRefNode).snippetName;
    // // push snippet editor
    // FlutterContent().capiBloc.add(CAPIEvent.pushSnippetBloc(snippetName: refdNodeName));
    // Useful.afterNextBuildDo(() {
    //   SnippetBloC? snippetBeingEdited = CAPIBloC.snippetBeingEdited;
    //   if (snippetBeingEdited != null) {
    //     showSnippetTreeCallout(
    //       snippetBloc: snippetBeingEdited,
    //       targetGKF: () => CAPIState.snippetRootGkMap[refdNodeName],
    //       onDismissedF: () {
    //         // CAPIState.snippetStateMap[snippetBloc.snippetName] = snippetBloc.state;
    //         STreeNode.unhighlightSelectedNode();
    //         Callout.dismiss('selected-panel-border-overlay');
    //         FlutterContent().capiBloc.add(const CAPIEvent.unhideAllTargetGroups());
    //         FlutterContent().capiBloc.add(const CAPIEvent.popSnippetBloc());
    //         // removeNodePropertiesCallout();
    //         Callout.dismiss(TREENODE_MENU_CALLOUT);
    //         MaterialAppWrapperState.exitEditMode();
    //         if (snippetBeingEdited.state.canUndo()) {
    //           FlutterContent().capiBloc.add(const CAPIEvent.saveModel());
    //         }
    //       },
    //       allowButtonCallouts: allowButtonCallouts,
    //     );
    //   }
    // });
  }
}
