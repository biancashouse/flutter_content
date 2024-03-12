// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_content/flutter_content.dart';
// import 'package:flutter_content/src/api/snippet_panel/callout_snippet_tree.dart';
// import 'package:flutter_content/src/bloc/capi_event.dart';
// import 'package:flutter_content/src/bloc/capi_state.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
//
// class PanelChips extends HookWidget {
//   const PanelChips({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final selection = useState<int?>(null);
//
//     MaterialAppWrapperState? parentMAState() => MaterialAppWrapper.of(context);
//     List<PanelName> panelNames = CAPIState.panelGkMap.keys.toList();
//     List<Widget> _panelChips() {
//       List<Widget> panelChips = [];
//       if (panelNames.isNotEmpty) {
//         for (int i = 0; i < CAPIState.panelGkMap.keys.length; i++) {
//           var map = CAPIState.snippetPlacementMap[panelNames[i]];
//           panelChips.add(
//             GestureDetector(
//               onLongPress: () {
//                 selection.value = i;
//                 Callout.dismiss('selected-panel-border-overlay');
//                 SnippetBloC? snippetBeingEdited = CAPIBloC.snippetBeingEdited;
//                 if (snippetBeingEdited != null) {
//                   _removeSnippetCallout(snippetBeingEdited);
//                 }
//                 _showPanelBorderOverlay(panelNames[i], context);
//                 _showSnippetCallout(panelNames[i], context);
//               },
//               child: ChoiceChip(
//                 label: Text.rich(TextSpan(children: [
//                   TextSpan(text: '${panelNames[i]} [ '),
//                   TextSpan(text: '${CAPIState.snippetPlacementMap[panelNames[i]]}', style: const TextStyle(color: Colors.purple)),
//                   const TextSpan(text: ' ]'),
//                 ])),
//                 selected: selection.value == i,
//                 onSelected: (bool selected) {
//                   Callout.dismiss('selected-panel-border-overlay');
//                   SnippetBloC? snippetBeingEdited = CAPIBloC.snippetBeingEdited;
//                   if (snippetBeingEdited != null) {
//                     _removeSnippetCallout(snippetBeingEdited);
//                   }
//                   if (selected) {
//                     _showPanelBorderOverlay(panelNames[i], context);
//                     selection.value = selected ? i : null;
//                   }
//                 },
//               ),
//             ),
//           );
//         }
//       }
//       return panelChips;
//     }
//
//     return BlocBuilder<CAPIBloC, CAPIState>(
//       builder: (context, state) {
//         return Material(
//           color: Colors.purple,
//           child: Row(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: _panelChips(),
//           ),
//         );
//       },
//     );
//   }
//
//   _showPanelBorderOverlay(String panelName, context) {
//     Callout.dismiss('selected-panel-border-overlay');
//     MaterialAppWrapperState? parentMAState() => MaterialAppWrapper.of(context);
//     Rect? rect = CAPIState.panelGkMap[panelName]?.globalPaintBounds(
//         // skipWidthConstraintWarning: skipWidthConstraintWarning,
//         // skipHeightConstraintWarning: skipHeightConstraintWarning,
//         ); //Measuring.findGlobalRect(_offstageGK!);
//     if (rect != null) {
//       const int BORDER = 3;
//       double borderLeft = max(rect.left - 3, 0);
//       double borderTop = max(rect.top - 3, 0);
//       double borderRight = min(Useful.scrW, rect.right + BORDER * 2);
//       double borderBottom = min(Useful.scrH, rect.bottom + BORDER * 2);
//       Rect borderRect = Rect.fromLTRB(borderLeft, borderTop, borderRight, borderBottom);
//       debugPrint("Callout.showOverlay('selected-panel-border-overlay')");
//       Callout.showOverlay(
//         boxContentF: (context) => Container(
//           width: rect.width,
//           height: rect.height,
//           decoration: BoxDecoration(
//             color: Colors.transparent,
//             border: Border.all(width: 2, color: Colors.purpleAccent, style: BorderStyle.solid),
//           ),
//         ),
//         calloutConfig: CalloutConfig(
//           feature: 'selected-panel-border-overlay',
//           suppliedCalloutW: borderRect.width,
//           suppliedCalloutH: borderRect.height,
//           initialCalloutPos: borderRect.topLeft,
//           color: Colors.purple.withOpacity(.1),
//           arrowType: ArrowType.NO_CONNECTOR,
//           draggable: false,
//         ),
//         targetGkF: () => CAPIState.panelGkMap[panelName],
//       );
//     }
//   }
//
//   _showSnippetCallout(String panelName, context) {
//     SnippetBloC? snippetBeingEdited = CAPIBloC.snippetBeingEdited;
//     if (Callout.anyPresent([snippetBeingEdited?.rootNode?.name ?? ''])) return;
//     MaterialAppWrapperState? parentMAState() => MaterialAppWrapper.of(context);
//     hideAllSingleTargetBtns();
//     // FlutterContent().capiBloc.add(const CAPIEvent.hideAllTargetGroupBtns());
//     // FlutterContent().capiBloc.add(const CAPIEvent.hideTargetGroupsExcept());
//     String? snippetName = CAPIState.snippetPlacementMap[panelName];
//     if (snippetName != null) {
//       FlutterContent().capiBloc.add(CAPIEvent.pushSnippetBloc(snippetName: snippetName));
//       Useful.afterNextBuildDo(() {
//         SnippetBloC? snippetBeingEdited = CAPIBloC.snippetBeingEdited;
//         if (snippetBeingEdited != null) {
//           showSnippetTreeCallout(
//             snippetBloc: snippetBeingEdited,
//             targetGKF: () => CAPIState.panelGkMap[panelName],
//             onDismissedF: () {
//               // CAPIState.snippetStateMap[snippetBloc.snippetName] = snippetBloc.state;
//               STreeNode.unhighlightSelectedNode();
//               Callout.dismiss('selected-panel-border-overlay');
//               FlutterContent().capiBloc.add(const CAPIEvent.unhideAllTargetGroups());
//               FlutterContent().capiBloc.add(const CAPIEvent.popSnippetBloc());
//               // removeNodePropertiesCallout();
//               Callout.dismiss(TREENODE_MENU_CALLOUT);
//               MaterialAppWrapperState.removeAllNodeWidgetOverlays();
//               if (snippetBeingEdited.state.canUndo()) {
//                 FlutterContent().capiBloc.add(const CAPIEvent.saveModel());
//               }
//             },
//           );
//         }
//       });
//     }
//   }
//
//   _removeSnippetCallout(SnippetBloC snippetBeingEdited) {
//     // CAPIState.snippetStateMap[snippetBeingEdited.snippetName] = snippetBeingEdited.state;
//     STreeNode.unhighlightSelectedNode();
//     Callout.dismiss('selected-panel-border-overlay');
//     FlutterContent().capiBloc.add(const CAPIEvent.unhideAllTargetGroups());
//     FlutterContent().capiBloc.add(const CAPIEvent.popSnippetBloc());
//     Callout.dismiss(snippetBeingEdited.rootNode?.name ?? "snippet name ?!");
//     // removeNodePropertiesCallout();
//     Callout.dismiss(TREENODE_MENU_CALLOUT);
//     if (snippetBeingEdited.state.canUndo()) {
//       FlutterContent().capiBloc.add(const CAPIEvent.saveModel());
//     }
//   }
// }
