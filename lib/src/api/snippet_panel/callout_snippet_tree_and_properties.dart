import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/api/snippet_panel/callout_snippet_tree_and_properties_content.dart';
import 'package:flutter_content/src/bloc/capi_event.dart';
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
    w = min(MaterialSPA.capiBloc.state.snippetTreeCalloutW ?? 500, 600);
    return w > 0 ? w : 500;
  }

  double height() {
    double? h = HydratedBloc.storage.read("snippet-tree-callout-height");
    if (h != null) return h.abs();

    // if (root?.child == null) return 60;
// int numNodes = root != null ? bloc.state.snippetTreeC.countNodesInTree(root) : 0;
// double h = numNodes == 0 ? min(bloc.state.snippetTreeCalloutH ?? 400, 600) : numNodes * 60;
    h = min(MaterialSPA.capiBloc.state.snippetTreeCalloutH ?? 500, Useful.scrH - 50);
    return h > 0 ? h : 500;
  }

  return CalloutConfig(
    feature: MaterialSPA.rootNode!.name,
    // frameTarget: true,
    arrowType: ArrowType.NO_CONNECTOR,
    barrier: CalloutBarrier(
      opacity: .1,
      // closeOnTapped: false,
      // hideOnTapped: true,
    ),
    onDismissedF: onDismissedF,
// onHiddenF: () {
//   STreeNode.unhighlightSelectedNode();
//   FlutterContent().capiBloc.add(const CAPIEvent.unhideAllTargetGroups());
//   Callout.dismiss(TREENODE_MENU_CALLOUT);
//   MaterialAppWrapper.showAllPinkSnippetOverlays();
//   if (snippetBloc.state.canUndo()) {
//     FlutterContent().capiBloc.add(const CAPIEvent.saveModel());
//   }
// },
    suppliedCalloutW: width(),
    suppliedCalloutH: height(),
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
    onResize: (newSize) {
      // keep size in localstorage for future use
      HydratedBloc.storage.write("snippet-tree-callout-width", newSize.width);
      HydratedBloc.storage.write("snippet-tree-callout-height", newSize.height);
    },
    onDragStartedF: () {
      MaterialSPA.selectedNode?.hidePropertiesWhileDragging = true;
    },
    onDragEndedF: (_) {
      MaterialSPA.selectedNode?.hidePropertiesWhileDragging = false;
    },
  );
}

void showSnippetTreeAndPropertiesCallout({
  required TargetKeyFunc targetGKF,
  ScrollController? ancestorHScrollController,
  ScrollController? ancestorVScrollController,
  required VoidCallback onDismissedF,
  required STreeNode startingAtNode,
  required STreeNode selectedNode,
  // required STreeNode tappedNode,
  bool allowButtonCallouts = false,
}) async {
  SnippetRootNode? rootNode = MaterialSPA.rootNode;
  if (rootNode == null) return;

  // dismiss any pink border overlays
  Callout.dismissAll(exceptFeatures: [rootNode.name]);

  // if (rootNode == null) return;

  // to check for any change
  // String? originalTcS = tc != null ? jsonEncode(initialTC?.toJson()) : null;
  // EncodedSnippetJson originalSnippetJson = rootNode.toJson();
  // String? originalClipboardJson = MaterialSPA.capiBloc.state.jsonClipboard;
  // tree and properties callouts using snippetName.hashCode, and snippetName.hashCode+1 resp.

  CalloutConfig cc = snippetTreeCalloutConfig(onDismissedF);
  Callout.showOverlay(
    calloutConfig: cc,
    boxContentF: (_) {
      // debugPrint('+++++++++++++++++++++++++++++ re-build SnippetTreeCalloutContents');
      return SnippetTreeAndPropertiesCalloutContents(
          ancestorHScrollController: ancestorHScrollController,
          ancestorVScrollController: ancestorVScrollController,
          allowButtonCallouts: allowButtonCallouts,
      );
    },
    targetGkF: targetGKF,
  );
  // imm select a node
  STreeNode sel = selectedNode ?? startingAtNode;
  MaterialSPA.capiBloc.add(CAPIEvent.selectNode(
    node: sel,
    selectedTreeNodeGK: GlobalKey(debugLabel: 'selectedTreeNodeGK'),
// imageTC: tc,
  ));
  Useful.afterNextBuildDo(() {
    selectedNode.showNodeWidgetOverlay();
  });
}

// void _clearSelection() {
//   debugPrint("clear selection");
//   snippetBloc.add(const SnippetEvent.clearNodeSelection());
//   Callout.removeOverlay(SELECTED_NODE_BORDER_CALLOUT);
//   Callout.removeOverlay(TREENODE_MENU_CALLOUT);
//   Callout.removeOverlay(NODE_PROPERTY_CALLOUT_BUTTON);
//   // Useful.afterNextBuildDo(() {
//   //   refreshSnippetTreeCallout(snippetName);
//   // });
// }
