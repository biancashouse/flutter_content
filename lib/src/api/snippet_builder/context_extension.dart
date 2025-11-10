import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_content/flutter_content.dart';
// import 'package:flutter_content/src/api/editable_page/widget_inspector.dart';

extension ContextExtension on BuildContext {
  // void showSnippetNodeWidgetTappableOverlays(scName) {
  //   // no need to de-register once set up
  //   fco.registerKeystrokeHandler('exit-Select-Widget-Mode', (KeyEvent event) {
  //     if (event.logicalKey == LogicalKeyboardKey.escape) {
  //       if (fco.capiBloc.state.inNodeSelectionMode()) {
  //         fco.capiBloc.add(CAPIEvent.exitNodeSelectionMode());
  //       }
  //     }
  //     return false;
  //   });
  //
  //   List gksFound = [];
  //
  //   // bool barrierApplied = false;
  //   void traverseAndMeasure(BuildContext el) {
  //     if ((fco.nodesByGK.containsKey(el.widget.key))) {
  //       // || (el.widget.key != null && gkSTreeNodeMap[el.widget.key]?.rootNodeOfSnippet() == FCO.targetSnippetBeingConfigured)) {
  //       GlobalKey gk = el.widget.key as GlobalKey;
  //
  //       if (gksFound.contains(gk)) {
  //         print('duplicate found! ${el.runtimeType}');
  //       } else {
  //         gksFound.add(gk);
  //       }
  //
  //       SNode? node = fco.nodesByGK[gk];
  //       // fco.logger.i("traverseAndMeasure: ${node.toString()}");
  //       if (node != null && node.canShowTappableNodeWidgetOverlay) {
  //         node.showTappableNodeWidgetOverlay(scName: scName);
  //         // barrierApplied = true;
  //         // }
  //       }
  //     }
  //     el.visitChildElements((innerEl) {
  //       traverseAndMeasure(innerEl);
  //     });
  //   }
  //
  //   traverseAndMeasure(this); // root node overlay must have barrier
  //   // fco.showingNodeBoundaryOverlays = true;
  //   // fco.logger.i('traverseAndMeasure(context) finished.');
  // }

  /// build list of widgets under this context that are nodes
  /// each will have a stack position
  // void traverseSnippetNodes(
  //   List<NodeRenderData> nodeBorderRects,
  // ) {
  //   // no need to de-register once set up
  //
  //   List gksFound = [];
  //
  //   // bool barrierApplied = false;
  //   void traverseAndMeasure(BuildContext el) {
  //     if ((fco.nodesByGK.containsKey(el.widget.key))) {
  //       GlobalKey gk = el.widget.key as GlobalKey;
  //
  //       if (gksFound.contains(gk)) {
  //         print('duplicate found! ${el.runtimeType}');
  //       } else {
  //         gksFound.add(gk);
  //       }
  //
  //       SNode? node = fco.nodesByGK[gk];
  //       // fco.logger.i("traverseAndMeasure: ${node.toString()}");
  //       if (node != null && node.canShowTappableNodeWidgetOverlay) {
  //          Widget? nodeBorderWidget = node.buildTappableNodeWidgetRect();
  //         if (nodeBorderWidget != null) {
  //           nodeBorderRects.add(nodeBorderWidget);
  //         }
  //       }
  //     }
  //     el.visitChildElements((innerEl) {
  //       traverseAndMeasure(innerEl);
  //     });
  //   }
  //
  //   traverseAndMeasure(this); // root node overlay must have barrier
  //   // fco.showingNodeBoundaryOverlays = true;
  //   // fco.logger.i('traverseAndMeasure(context) finished.');
  // }
}
