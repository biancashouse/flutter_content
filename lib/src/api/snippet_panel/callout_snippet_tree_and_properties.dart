import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_callouts/flutter_callouts.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/api/snippet_panel/callout_snippet_tree_and_properties_content.dart';
import 'package:flutter_content/src/bloc/capi_event.dart';
import 'package:flutter_content/src/snippet/snodes/hotspots/widgets/config_toolbar/callout_config_toolbar.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

// void removeSnippetTreeCallout(String snippetName) => Callout.removeOverlay(snippetName);
//
// void hideSnippetTreeCallout(String snippetName) => Callout.hideOverlay(snippetName);
//
// void unhideSnippetTreeCallout(String snippetName) => Callout.unhideOverlay(snippetName);
//
// void refreshSnippetTreeCallout(String snippetName) => Callout.refreshOverlay(snippetName);

CalloutConfig snippetTreeCalloutConfig(VoidCallback onDismissedF) {
  double width() {
    double? w = HydratedBloc.storage.read("snippet-tree-callout-width");
    if (w != null) return w.abs();

    // if (root?.child == null) return 190;
    w = min(FlutterContentApp.capiBloc.state.snippetTreeCalloutW ?? 500, 600);
    return w > 0 ? w : 500;
  }

  double height() {
    double? h = HydratedBloc.storage.read("snippet-tree-callout-height");
    if (h != null) return h.abs();

    // if (root?.child == null) return 60;
// int numNodes = root != null ? bloc.state.snippetTreeC.countNodesInTree(root) : 0;
// double h = numNodes == 0 ? min(bloc.state.snippetTreeCalloutH ?? 400, 600) : numNodes * 60;
    h = min(FlutterContentApp.capiBloc.state.snippetTreeCalloutH ?? 500,
        fco.scrH - 50);
    return h > 0 ? h : 500;
  }

  return CalloutConfig(
    cId: FlutterContentApp.snippetBeingEdited!.rootNode.name,
    // frameTarget: true,
    arrowType: ArrowType.NONE,
    barrier: CalloutBarrier(
      opacity: .1,
      // closeOnTapped: false,
      // hideOnTapped: true,
    ),
    onDismissedF: onDismissedF,
// onHiddenF: () {
//   STreeNode.unhighlightSelectedNode();
//   FCO.capiBloc.add(const CAPIEvent.unhideAllTargetGroups());
//   Callout.dismiss(TREENODE_MENU_CALLOUT);
//   MaterialAppWrapper.showAllPinkSnippetOverlays();
//   if (snippetBloc.state.canUndo()) {
//     FCO.capiBloc.add(const CAPIEvent.saveModel());
//   }
// },
    initialCalloutW: width(),
    initialCalloutH: height(),
//calloutH ?? 500,
// barrierOpacity: .1,
// arrowType: ArrowType.POINTY,
// color: Colors.purpleAccent.shade100,
    borderRadius: 16,
// initialCalloutPos: bloc.state.snippetTreeCalloutInitialPos,
    finalSeparation: 40,
// onBarrierTappedF: () async {
//   // also check whether any snippet change
//   var newSnippetMap = CAPIBloc.getSnippetJsonsFromTree(bloc.state.snippetTreeC);
//   bool changeOccurred = true || !mapEquals(originalSnippetMap, newSnippetMap) || originalClipboardJson != bloc.state.jsonClipboard;
//   bloc.add(CAPIEvent.hideSnippetTree(save: changeOccurred));
//   removeSnippetTreeCallout(snippetName);
//   onClosedF.call();
// },
// draggable: false,
    dragHandleHeight: 40,
    resizeableH: true,
    resizeableV: true,
    onResizeF: (newSize) {
      // keep size in localstorage for future use
      HydratedBloc.storage.write("snippet-tree-callout-width", newSize.width);
      HydratedBloc.storage.write("snippet-tree-callout-height", newSize.height);
    },
    onDragStartedF: () {
      FlutterContentApp.selectedNode?.hidePropertiesWhileDragging = true;
    },
    onDragEndedF: (_) {
      FlutterContentApp.selectedNode?.hidePropertiesWhileDragging = false;
    },
  );
}

void showSnippetTreeAndPropertiesCallout({
  required TargetKeyFunc targetGKF,
  String? scrollControllerName,
  required VoidCallback onDismissedF,
  required STreeNode startingAtNode,
  required STreeNode selectedNode,
  // required STreeNode tappedNode,
  bool allowButtonCallouts = false,
  TargetModel? targetBeingConfigured,
}) async {
  SnippetRootNode? rootNode = FlutterContentApp.snippetBeingEdited?.rootNode;
  if (rootNode == null) return;

  // dismiss any pink border overlays
  Callout.dismissAll(exceptFeatures: [
      rootNode.name,
      CalloutConfigToolbar.CID,
      targetBeingConfigured?.contentCId ?? 'n/a'
      ]);

  // if (rootNode == null) return;

  // to check for any change
  // String? originalTcS = tc != null ? jsonEncode(initialTC?.toJson()) : null;
  // EncodedSnippetJson originalSnippetJson = rootNode.toJson();
  // String? originalClipboardJson = FlutterContentApp.capiBloc.state.jsonClipboard;
  // tree and properties callouts using snippetName.hashCode, and snippetName.hashCode+1 resp.

  CalloutConfig cc = snippetTreeCalloutConfig(onDismissedF);
  fca.showOverlay(
    calloutConfig: cc,
    calloutContent: SnippetTreeAndPropertiesCalloutContents(
      scrollControllerName:   scrollControllerName,
      allowButtonCallouts: allowButtonCallouts,
    ),
    targetGkF: targetGKF,
  );
  // imm select a node
  STreeNode sel = selectedNode ?? startingAtNode;
  FlutterContentApp.capiBloc.add(CAPIEvent.selectNode(
    node: sel,
    //selectedTreeNodeGK: GlobalKey(debugLabel: 'selectedTreeNodeGK'),
// imageTC: tc,
  ));
  fco.afterNextBuildDo(() {
    selectedNode.showNodeWidgetOverlay();
  });
}

// void _clearSelection() {
//   debugPrint("clear selection");
//   snippetBloc.add(const SnippetEvent.clearNodeSelection());
//   Callout.removeOverlay(SELECTED_NODE_BORDER_CALLOUT);
//   Callout.removeOverlay(TREENODE_MENU_CALLOUT);
//   Callout.removeOverlay(NODE_PROPERTY_CALLOUT_BUTTON);
//   // fco.afterNextBuildDo(() {
//   //   refreshSnippetTreeCallout(snippetName);
//   // });
// }
