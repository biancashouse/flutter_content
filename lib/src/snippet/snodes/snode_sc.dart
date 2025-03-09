// import 'package:flutter/material.dart';
// import 'package:flutter_callouts/flutter_callouts.dart';
// import 'package:flutter_content/flutter_content.dart';
//
// class SNodeScrollController extends ScrollController {
//   final SNode node;
//   final Axis axis; // need axis for bubble pos translate
//
//   static final Map<SNode, SNodeScrollController> _instanceMap =
//   {};
//   static final Map<SNode, double> _scrollOffsetMap = {};
//
//   SNodeScrollController(this.node, this.axis, {super.initialScrollOffset, super.debugLabel}) {
//     _instanceMap
//       ..remove(node)
//       ..[node] = this;
//     fca.logi("new STreeNodeScrollController(${node.toString()})");
//     // onAttach() {
//     //   fca.logi('********************************** onAttach() - ${positions.length} positions' );
//     // }
//     _listenToOffset();
//     fca.logi(
//         "NamedScrollController(${node.toString}) listening for saving offset and refreshing callouts");
//   }
//
//   void _listenToOffset() {
//     // update map with new offset
//     addListener(() {
//       listener.call();
//     });
//   }
//
//   void listener() {
//     if (hasClients) {
//       _scrollOffsetMap[node] = offset;
//       fca.logi('NamedScrollController.listenToOffset: ${node.toString()}, $offset)');
//       fca.refreshAll();
//       fca.logi('NamedScrollController.listenToOffset: refreshAll');
//     }
//   }
//
//   static List<ScrollController> allControllers() =>
//       _instanceMap.values.toList();
//
//   static void restoreOffset(ScrollControllerName? scName) {
//     if (scName == null) return;
//     var sC = _instanceMap[scName];
//     if (sC == null) return;
//     double? so = _scrollOffsetMap[scName];
//     if (so != null && sC.hasClients && sC.offset != so) {
//       sC.jumpTo(so);
//     }
//   }
//
//   static void restoreOffsetTo(ScrollControllerName? scName, double scOffset) {
//     if (scName == null) return;
//     var sC = _instanceMap[scName];
//     if (sC?.hasClients ?? false) sC?.jumpTo(scOffset);
//   }
//
//   static double scrollOffset(ScrollControllerName? scName) =>
//       scName != null ? (_scrollOffsetMap[scName] ?? 0.0) : 0.0;
//
//   static double hScrollOffset(ScrollControllerName? scName) {
//     if (scName == null) return 0.0;
//     var sC = _instanceMap[scName];
//     double result =
//     sC != null && sC.axis == Axis.horizontal ? scrollOffset(scName) : 0.0;
//     // if (result != 0.0) fca.logi('hScrollOffset!=0');
//     return result;
//   }
//
//   static double vScrollOffset(ScrollControllerName? scName) {
//     if (scName == null) return 0.0;
//     var sC = _instanceMap[scName];
//     double result =
//     sC != null && sC.axis == Axis.vertical ? scrollOffset(scName) : 0.0;
//     // if (result != 0.0) fca.logi('vScrollOffset!=0');
//     return result;
//   }
// }
