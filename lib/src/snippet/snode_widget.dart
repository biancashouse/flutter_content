import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';
import 'package:gap/gap.dart';

class NodeWidget extends StatelessWidget {
  final String snippetName;
  final SnippetTreeController treeController;
  final TreeEntry<STreeNode> entry;
  final bool onClipboard;
  final bool allowButtonCallouts;
  final ScrollControllerName? scName;

  const NodeWidget({
    super.key,
    required this.snippetName,
    required this.treeController,
    required this.entry,
    this.onClipboard = false,
    this.allowButtonCallouts = false,
    this.scName,
  });

  @override
  Widget build(BuildContext context) {
    // if (entry.node is SnippetRootNode && entry.parent == null) {
    //   return const Offstage();
    // }

    // bool selected = FCO.capiBloc.selectedNode == entry.node;

    GlobalKey targetGK = GlobalKey();

    Color boxColor =
        FlutterContentApp.snippetBeingEdited!.nodeBeingDeleted == entry.node
            ? Colors.red
            : entry.node is GenericSingleChildNode
                ? Colors.transparent
                : entry.node is SnippetRootNode
                    ? Colors.black
                    : Colors.white;
    return BlocBuilder<CAPIBloC, CAPIState>(
        // buildWhen: (previous, current) => !current.onlyTargetsWrappers,
        builder: (blocContext, state) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            key: FlutterContentApp.aNodeIsSelected &&
                    FlutterContentApp.selectedNode == entry.node
                ? FlutterContentApp.snippetBeingEdited!.selectedTreeNodeGK
                : null,
            margin: EdgeInsets.zero,
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            decoration: entry.node is DirectoryNode || entry.node is FileNode
                ? null
                : BoxDecoration(
                    color: boxColor,
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(
                        entry.node is GenericSingleChildNode ? 4 : 30)),
                  ),
            alignment: Alignment.center,
            child: Row(
              children: [
                if (entry.node is! GenericSingleChildNode &&
                    entry.node is! SnippetRootNode)
                  GestureDetector(
                    onTap: () {
                      _tappedNode();
                    },
                    onLongPress: () {
                      _longPressedNode(context, targetGK, entry.node);
                    },
                    child: Image.asset(
                      fco.asset('lib/assets/images/pub.dev.png'),
                      width: 16,
                    ),
                  ),
                Gap(8),
                // if (entry.node.logoSrc() != null) SizedBox(width: entry.node.logoSrc()!.contains('pub.dev') ? 6 : 0),
                _name(context, targetGK),
                Gap(8),
              ],
            ),
          ),
          if (entry.hasChildren)
            ExpandIcon(
              key: GlobalObjectKey(entry.node),
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
    });
  }

  Widget _name(context, targetGK) {
    return InkWell(
      key: targetGK,
      // key: entry.node == snippetBloc.state.selectedNode ? STreeNode.selectionGK : null,
      // onLongPress: () => _longPressedOrDoubleTapped(snippetBloc),
      onDoubleTap: () async {
        if (entry.node is! SnippetRootNode) return;

        fco.dismissAll();

        // instead of using the embedded snippet node, which has no child,
        // use the actual (STANDALONE) snippet itself
        // Assumption: actual snippet will be in versionCache
        SnippetInfoModel? snippetInfo = SnippetInfoModel.cachedSnippet((entry.node as SnippetRootNode).name);
        SnippetRootNode? snippet = await snippetInfo?.currentVersionFromCacheOrFB();

        if (snippet != null) {
          STreeNode.pushThenShowNamedSnippetWithNodeSelected(
            snippet.name,
            snippet,
            snippet.child ?? snippet,
            scName: scName,
          );
        }
      },
      onTap: () {
        _tappedNode();
      },
      onLongPress: () {
        _longPressedNode(context, targetGK, entry.node);
      },
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
    );
  }

  void _tappedNode() {
    if (onClipboard /* || entry.node is GenericSingleChildNode*/) return;
    // if (entry.node is TextSpanNode) {
    //   fco.logi('TextSpan cannot be selected (has no key property!)');
    //   return;
    // };

    if (FlutterContentApp.snippetBeingEdited!.aNodeIsSelected &&
        entry.node == FlutterContentApp.selectedNode) return;

    double savedOffset = NamedScrollController.scrollOffset(scName);

    if (!treeController.getExpansionState(entry.node)) {
      treeController.expand(entry.node);
    }

    // fco.dismiss(TREENODE_MENU_CALLOUT);

    bool thisWasAlreadySelected =
        (entry.node == FlutterContentApp.selectedNode);

    if (FlutterContentApp.snippetBeingEdited!.aNodeIsSelected &&
        thisWasAlreadySelected) {
      fco.hide("floating-clipboard");
      fco.dismiss(SELECTED_NODE_BORDER_CALLOUT);
      FlutterContentApp.capiBloc.add(CAPIEvent.clearNodeSelection(scName));
    } else if (!FlutterContentApp.snippetBeingEdited!.aNodeIsSelected ||
        !thisWasAlreadySelected) {
      if (fco.clipboard != null) {
        fco.unhide("floating-clipboard");
      }

      FlutterContentApp.capiBloc.add(CAPIEvent.selectNode(
        node: entry.node,
        // imageTC: tc,
        // selectedWidgetGK: GlobalKey(debugLabel: 'selectedWidgetGK'),
        // selectedTreeNodeGK: GlobalKey(debugLabel: 'selectedTreeNodeGK'),
      ));

      fco.afterMsDelayDo(
        100,
        () {
          EditablePage.removeAllNodeWidgetOverlays();
          fco.afterMsDelayDo(500, () {
            entry.node.showNodeWidgetOverlay();
          });
          //NamedScrollController.restoreOffsetTo(scName, savedOffset);
        },
        scrollControllers: NamedScrollController.allControllers(),
      );
    }
  }

  void _longPressedNode(context, targetGK, STreeNode node) {
    fco.showOverlay(
      calloutConfig: CalloutConfig(
        cId: 'node-actions',
        scrollControllerName: scName,
        initialCalloutW: 300,
        initialCalloutH: 200,
        initialTargetAlignment: Alignment.centerRight,
        initialCalloutAlignment: Alignment.centerLeft,
        arrowType: ArrowType.THIN,
        arrowColor: Colors.white,
        barrier: CalloutBarrier(),
      ),
      calloutContent: SnippetTreeAndPropertiesCalloutContents.nodeButtons(
          context, scName, node),
      targetGkF: () => targetGK,
    );

    double savedOffset = NamedScrollController.scrollOffset(scName);

    bool thisWasAlreadySelected =
        (entry.node == FlutterContentApp.selectedNode);

    // clear sel
    if (FlutterContentApp.snippetBeingEdited!.aNodeIsSelected) {
      fco.hide("floating-clipboard");
      fco.dismiss(SELECTED_NODE_BORDER_CALLOUT);
      FlutterContentApp.capiBloc.add(CAPIEvent.clearNodeSelection(scName));
      fco.afterNextBuildDo(() {
        FlutterContentApp.capiBloc.add(CAPIEvent.selectNode(node: entry.node));
      });
    } else {
      FlutterContentApp.capiBloc.add(CAPIEvent.selectNode(node: entry.node));
    }
    fco.afterNextBuildDo(() {
      fco.afterMsDelayDo(
        100,
        () {
          EditablePage.removeAllNodeWidgetOverlays();
          fco.afterMsDelayDo(500, () {
            entry.node.showNodeWidgetOverlay();
          });
          //NamedScrollController.restoreOffsetTo(scName, savedOffset);
        },
        scrollControllers: NamedScrollController.allControllers(),
      );
    });
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
    var selectedNode = FlutterContentApp.selectedNode;
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
    //   fco.logi("bad ${selectedNode.toString()}, parent: ${selectNodeParent?.toString()}");
    //   fco.logi("sensible parents: ${selectedNode.sensibleParents().toString()}");
    // }

    Color textColor = node == selectedNode ? Colors.black : Colors.grey;
    return Text(
      displayedNodeName,
      textScaler:
          TextScaler.linear(entry.node is GenericSingleChildNode ? .9 : 1.0),
      style: TextStyle(
        color: node is SnippetRootNode || node is GenericSingleChildNode
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
