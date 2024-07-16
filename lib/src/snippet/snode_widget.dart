import 'package:bh_shared/bh_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_callouts/flutter_callouts.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_event.dart';
import 'package:flutter_content/src/bloc/capi_state.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';
import 'package:gap/gap.dart';

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
    // if (entry.node is SnippetRootNode && entry.parent == null) {
    //   return const Offstage();
    // }

    // bool selected = FCO.capiBloc.selectedNode == entry.node;
    Color boxColor = FlutterContentApp.snippetBeingEdited!.nodeBeingDeleted ==
        entry.node
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
                    FlutterContentApp.selectedNode == entry.node ? FlutterContentApp
                    .snippetBeingEdited!.selectedTreeNodeGK : null,
                margin: EdgeInsets.zero,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: entry.node is DirectoryNode ||
                    entry.node is FileNode
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
                    if (entry.node.logoSrc() != null &&
                        entry.node is! GenericSingleChildNode) entry.node
                        .logoSrc()!,
                    // if (entry.node.logoSrc() != null) SizedBox(width: entry.node.logoSrc()!.contains('pub.dev') ? 6 : 0),
                    _name(context),
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

  Widget _name(context) {
    return InkWell(
      // key: entry.node == snippetBloc.state.selectedNode ? STreeNode.selectionGK : null,
      // onLongPress: () => _longPressedOrDoubleTapped(snippetBloc),
      onDoubleTap: () {
        if (entry.node is! SnippetRootNode) return;

        // change tree to snippet
        Callout.dismissAll();

        // instead of using the embedded snippet node, which has no child,
        // use the actual (STANDALONE) snippet itself
        // Assumption: actual snippet will be in versionCache
        SnippetRootNode snippet = fco.currentSnippet(
            (entry.node as SnippetRootNode).name)!;

        STreeNode.pushThenShowNamedSnippetWithNodeSelected(
          snippet.name,
          snippet,
          snippet.child ?? snippet,
        );
      },
      onTap: () {
        if (onClipboard /* || entry.node is GenericSingleChildNode*/) return;
        // if (entry.node is TextSpanNode) {
        //   debugPrint('TextSpan cannot be selected (has no key property!)');
        //   return;
        // };

        if (FlutterContentApp.snippetBeingEdited!.aNodeIsSelected &&
            entry.node == FlutterContentApp.selectedNode) return;

        if (!treeController.getExpansionState(entry.node)) {
          treeController.expand(entry.node);
        }

        Callout.dismiss(TREENODE_MENU_CALLOUT);

        bool thisWasAlreadySelected = (entry.node == FlutterContentApp.selectedNode);

        if (FlutterContentApp.snippetBeingEdited!.aNodeIsSelected &&
            thisWasAlreadySelected) {
          Callout.hide("floating-clipboard");
          Callout.dismiss(SELECTED_NODE_BORDER_CALLOUT);
          FlutterContentApp.capiBloc.add(const CAPIEvent.clearNodeSelection());
        } else if (!FlutterContentApp.snippetBeingEdited!.aNodeIsSelected ||
            !thisWasAlreadySelected) {
          if (fco.clipboard != null) {
            Callout.unhide("floating-clipboard");
          }
          FlutterContentApp.capiBloc.add(const CAPIEvent.clearNodeSelection());
          fco.afterNextBuildDo(() {
            // final List<PTreeNode> propertyNodes = entry.node.properties(context);
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
            FlutterContentApp.capiBloc.add(CAPIEvent.selectNode(
              node: entry.node,
              // imageTC: tc,
              // selectedWidgetGK: GlobalKey(debugLabel: 'selectedWidgetGK'),
              // selectedTreeNodeGK: GlobalKey(debugLabel: 'selectedTreeNodeGK'),
            ));
            fco.afterNextBuildDo(() {
              fco.currentPageState
                ?..removeAllNodeWidgetOverlays()
                ..showNodeWidgetOverlay(entry.node);
              // create selected node's properties tree
            });
          });
        }

        // removeNodePropertiesCallout();
        // if ((MediaQuery.of(context).size.width ?? 0) <= 1366) {
        //   fco.afterNextBuildDo(() {
        //     if (context.mounted) {
        //       showTreeNodeMenu(context, () => STreeNode.selectionGK);
        //     } else
        //       debugPrint("context fucked.");
        //   });
        // }

        // fco.afterNextBuildDo(() {
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
      //   FCO.capiBloc.add(CAPIEvent.selectNode(
      //     node: entry.node,
      //     nodeParent: entry.parent?.node,
      //     nodeRootIndex: treeController.nearestRootIndex(entry),
      //     showAdders: true,
      //     showProperties: true,
      //     // imageTC: tc,
      //   ));
      //   fco.afterNextBuildDo(() {
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
      // fco.afterNextBuildDo(() {
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
      //     cId: CAPI.SOURCE_CODE.index,
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
      //     width: FCO.scrW * .9,
      //     height: FCO.scrH * .8,
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
          Gap(6),
          _text(),
        ],
      )
      // : entry.node is FileNode
      // ? (entry.node as FileNode).toWidget(snippetBloc, context)
          : _text(),
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
  //     Callout.unhide("floating-clipboard");
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
    //   debugPrint("bad ${selectedNode.toString()}, parent: ${selectNodeParent?.toString()}");
    //   debugPrint("sensible parents: ${selectedNode.sensibleParents().toString()}");
    // }

    Color textColor = node == selectedNode ? Colors.black : Colors.grey;
    return Text(
      displayedNodeName,
      textScaler: TextScaler.linear(
          entry.node is GenericSingleChildNode ? .9 : 1.0),
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
//         Callout.dismiss('selected-panel-border-overlay');
//         FCO.capiBloc.add(const CAPIEvent.unhideAllTargetGroups());
//         FCO.capiBloc.add(const CAPIEvent.popSnippetBloc());
//         // removeNodePropertiesCallout();
//         Callout.dismiss(TREENODE_MENU_CALLOUT);
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
