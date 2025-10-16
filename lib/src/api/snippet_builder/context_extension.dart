import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_content/flutter_content.dart';

extension ContextExtension on BuildContext {
  /// show a tappable overlay for all widgets under this context
  void showSnippetNodeWidgetTappableOverlays() {
    // no need to de-register once set up
    fco.registerKeystrokeHandler('exit-Select-Widget-Mode', (KeyEvent event) {
      if (event.logicalKey == LogicalKeyboardKey.escape) {
        if (fco.capiBloc.state.inSelectWidgetMode()) {
          fco.capiBloc.add(CAPIEvent.exitSelectWidgetMode());
        }
      }
      return false;
    });

    List gksFound = [];

    // bool barrierApplied = false;
    void traverseAndMeasure(BuildContext el) {
      if ((fco.nodesByGK.containsKey(el.widget.key))) {
        // || (el.widget.key != null && gkSTreeNodeMap[el.widget.key]?.rootNodeOfSnippet() == FCO.targetSnippetBeingConfigured)) {
        GlobalKey gk = el.widget.key as GlobalKey;

        if (gksFound.contains(gk)) {
          print('duplicate found! ${el.runtimeType}');
        } else {
          gksFound.add(gk);
        }

        SNode? node = fco.nodesByGK[gk];
        // fco.logger.i("traverseAndMeasure: ${node.toString()}");
        if (node != null && node.canShowTappableNodeWidgetOverlay) {
          // if (node.rootNodeOfSnippet() == FCO.targetSnippetBeingConfigured) {
          // fco.logger.i("targetSnippetBeingConfigured: ${node.toString()}");
          // }
          // fco.logger.i('Rect? r = gk.globalPaintBounds...');
          // measure node
          Rect? r = gk.globalPaintBounds(
            skipWidthConstraintWarning: true,
            skipHeightConstraintWarning: true,
          );
          // if (node is PlaceholderNode) {
          //   fco.logger.i('PlaceholderNode');
          // }
          if (r != null) {
            // node.measuredRect = Rect.fromLTWH(r.left, r.top, r.width, r.height);
            r = fco.restrictRectToScreen(r);
            // fco.logger.i("========>  r restricted to ${r.toString()}");
            // fco.logger.i('${node.runtimeType.toString()} - size: (${r != null ? r.size.toString() : ""})');
            // node.setParent(parent);
            // parent = node;
            // fco.logger.i('_showNodeWidgetOverlay...');
            // removeAllNodeWidgetOverlays();
            // pass possible ancestor scrollcontroller to overlay
            node.showTappableNodeWidgetOverlay(
              el,
              scName: null,
            );
            // barrierApplied = true;
          }
        }
      }
      el.visitChildElements((innerEl) {
        traverseAndMeasure(innerEl);
      });
    }

    traverseAndMeasure(this); // root node overlay must have barrier
    // fco.showingNodeBoundaryOverlays = true;
    // fco.logger.i('traverseAndMeasure(context) finished.');
  }
}
