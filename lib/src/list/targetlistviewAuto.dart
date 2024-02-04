// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_content/src/bloc/capi_bloc.dart';
// import 'package:flutter_content/src/bloc/capi_event.dart';
// import 'package:flutter_content/src/callout_text_editor.dart';
// import 'package:flutter_content/src/styles/styles_picker.dart';
// import 'package:flutter_content/src/wrapper/buttons/copy_button.dart';
// import 'package:flutter_content/src/wrapper/buttons/play_button_auto.dart';
// import 'package:flutter_content/src/wrapper/image_wrapper.dart';
//
// import '../../content.dart';
// import '../model/model.dart';
// import '../wrapper/transformable_widget_wrapper.dart';
// import '../wrapper/widget_wrapper.dart';
//
// void refreshListViewCallout(final String name) => Callout.refreshOverlay(CAPI.TARGET_LISTVIEW_CALLOUT.feature(name), () {});
// //
// // void hideListViewCallout(final String name) => Useful.om.hideCalloutByFeature(CAPI.TARGET_LISTVIEW_CALLOUT.feature(name));
// //
// // void unhideListViewCallout(final String name) => Useful.om.unhideCalloutByFeature(CAPI.TARGET_LISTVIEW_CALLOUT.feature(name));
// //
// void removeListViewCallout(final String name) => Callout.removeOverlay(CAPI.TARGET_LISTVIEW_CALLOUT.feature(name), true);
//
// class CCTargetListViewContents extends StatelessWidget {
//   final ImageWrapperAutoState parent;
//
//   const CCTargetListViewContents(this.parent, {super.key});
//
//   static double targetListH(final ImageWrapperAutoState parent) => parent.bloc.state.imageTargets(parent.widget.name).length * 40;
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: <Widget>[
//         if (parent.bloc.state.imageTargetListMap.isNotEmpty)
//           SizedBox.fromSize(
//             size: Size(180, targetListH(parent)),
//             child: ReorderableListView(
//               onReorder: (int oldIndex, int newIndex) {
//                 ImageWrapperAutoState.hideAllTargets(bloc: parent.bloc, name: parent.widget.name);
//                 parent.bloc.add(CAPIEvent.changedOrder(name: parent.widget.name, oldIndex: oldIndex, newIndex: newIndex));
//                 Useful.afterNextBuildDo(() {
//                   Useful.afterMsDelayDo(200, () {
//                     ImageWrapperAutoState.showAllTargets(bloc: parent.bloc, name: parent.widget.name);
//                   });
//                 });
//               },
//               children: [
//                 // for (String name in state.imageTargetListMap.keys)
//                 for (int index = 0; index < (parent.bloc.state.imageTargetListMap[parent.widget.name]?.length ?? 0); index++)
//                   TargetItemView(
//                     key: UniqueKey(),
//                     parent,
//                     parent.bloc.state.imageTargetListMap[parent.widget.name]![index],
//                     index,
//                   ),
//               ],
//             ),
//           ),
//         Divider(
//           color: Colors.white,
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10),
//           child: PlayButton(parent),
//         ),
//         CopyButton(parent.widget.name),
//         // Spacer(),
//         // SuspendButton(parent.widget.name),
//       ],
//     );
//   }
// }
//
// class TargetItemView extends StatelessWidget {
//   final ImageWrapperAutoState parent;
//   final TargetConfig tc;
//   final int index;
//
//   const TargetItemView(this.parent, this.tc, this.index, {super.key});
//
//   static Widget indexAvatar(TargetConfig tc, int index, bool isNotSelected) {
//     Color selectedColor = tc.calloutColorValue == Colors.white.value ? Colors.grey : Colors.white;
//     return SizedBox(
//       width: 120,
//       height: 30,
//       child: Blink(
//         bgColor: Colors.yellowAccent,
//         dontAnimate: !isNotSelected,
//         child: Row(
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Expanded(
//               child: Container(
//                 decoration: ShapeDecoration(
//                   color: Color(tc.calloutColorValue ?? 128),
//                   shape: RoundedRectangleBorder(
//                     side: BorderSide(color: !isNotSelected ? selectedColor : Colors.grey, width: !isNotSelected ? 4 : 1),
//                     borderRadius: const BorderRadius.all(Radius.circular(8)),
//                   ),
//                 ),
//                 child: SizedBox(
//                   width: 160,
//                   child: Center(
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 4.0),
//                         child: Text(
//                           ' ${tc.calloutDurationMs} ',
//                           style: TextStyle(color: Color(tc.textColorValue ?? 128), fontSize: 14),
//                         ),
//                       )),
//                 ),
//               ),
//             ),
//             IconButton(
//               onPressed: () {
//                 CAPIBloc.showStartTimeCallout(tc);
//               },
//               icon: Icon(
//                 Icons.timer,
//                 color: Colors.white,
//               ),
//               iconSize: 24,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Dismissible(
//       direction: DismissDirection.horizontal,
//       key: UniqueKey(),
//       onDismissed: (_) async {
//         if (parent.bloc.state.aTargetIsSelected()) {
//           await clearSelection(parent, tappedTc: parent.bloc.state.selectedTarget!);
//         }
//         ImageWrapperAutoState.hideAllTargets(bloc: parent.bloc, name: parent.widget.name);
//         await Future.delayed(Duration(milliseconds: 300));
//         ImageWrapperAutoState.showAllTargets(bloc: parent.bloc, name: parent.widget.name);
//         tc.bloc.add(CAPIEvent.deleteTarget(tc: tc));
//         Useful.afterNextBuildDo(() {
//           if (!tc.bloc.state.aTargetIsSelected()) {
//             Useful.afterMsDelayDo(200, () {
//               ImageWrapperAutoState.showAllTargets(bloc: parent.bloc, name: parent.widget.name);
//             });
//           }
//         });
//       },
//       child: SizedBox(
//         child: InkWell(
//           onTap: () async {
//             if (tc.bloc.state.aTargetIsSelected()) {
//               // TransformableBodyWrapperState? swState = CAPIState.twGKMap[parent.widget.twName]?.currentState;
//               // swState?.resetTransform();
//               if (tc.uid != tc.bloc.state.selectedTarget!.uid) {
//                 // tapped a different item to selected one
//                 removeTextEditorCallout();
//                 await clearSelection(parent, tappedTc: tc);
//                 ImageWrapperAutoState.hideAllTargets(bloc: parent.bloc, name: parent.widget.name);
//                 tc.bloc.add(CAPIEvent.selectTarget(tc: tc));
//                 // Rect? rect = findGlobalRect(tc.gk());
//                 // if (rect != null) {
//                 //   Alignment ta = WidgetWrapper.calcTargetAlignment(rect);
//                 //   swState?.applyTransform(3.0, 3.0, ta);
//                 // }
//               } else {
//                 // tapped selected item - deselect
//                 await clearSelection(parent, tappedTc: tc);
//                 ImageWrapperAutoState.hideAllTargets(bloc: parent.bloc, name: parent.widget.name);
//                 await Future.delayed(Duration(milliseconds: 300));
//                 ImageWrapperAutoState.showAllTargets(bloc: parent.bloc, name: parent.widget.name);
//               }
//             } else {
//               // TransformableBodyWrapperState? swState = CAPIState.twGKMap[parent.widget.twName]?.currentState;
//               // Rect? rect = findGlobalRect(tc.gk());
//               // if (swState != null && rect != null) {
//               //   Alignment ta = WidgetWrapper.calcTargetAlignment(rect);
//               //   swState.applyTransform(3.0, 3.0, ta);
//               // }
//
//               tc.bloc.add(CAPIEvent.selectTarget(tc: tc));
//               ImageWrapperAutoState.hideAllTargets(
//                   bloc: parent.bloc, name: parent.widget.name, exception: tc);
//             }
//           },
//           onDoubleTap: () {
//             // showStartTimeCallout(tc, tc.focusNode, tc.gk);
//           },
//           child: Padding(
//             padding: const EdgeInsets.all(4.0),
//             child: TargetItemView.indexAvatar(tc, index, tc.bloc.state.targetIndex(tc) == index),
//           ),
//         ),
//       ),
//     );
//   }
//
//   static Future<void> clearSelection(final ImageWrapperAutoState parent, {required TargetConfig tappedTc}) async {
//     // Callout.removeOverlay(CAPI.ANY_TOAST.feature(), true);
//     removeTextEditorCallout();
//     removeStylesCallout();
//
//     // // for selected item, save (convert) current callout pos + transfrom matrix back to normal coords
//     TargetConfig selectedTc = parent.bloc.state.selectedTarget!;
//     //   parent.bloc.state.CC_TARGET_RADIUS(parent.widget.name),
//     //   parent.bloc.state.CC_TARGET_RADIUS(parent.widget.name),
//     // ));
//
//     selectedTc.bloc.add(CAPIEvent.clearSelection(name: tappedTc.twName));
//   }
// }
//
// const double TARGET_LISTVIEW_CALLOUT_W = kIsWeb ? 180 : 140;
//
// void createAndShowTargetListCallout(final ImageWrapperAutoState parent) {
//   // if (!state.imageTargetListMap.containsKey(name)) return;
//
//   double calloutH() {
//     double h = 300;
//     List<TargetConfig> list = parent.bloc.state.imageTargetListMap[parent.widget.name] ?? [];
//     h += list.length * 30;
//     // print("h(${bloc.state.selectedTargetIndex(widget.name)}) = $h");
//     return h;
//   }
//
//   Rect? ivRect = CAPIState.wwRect(parent.widget.name);
//
//   if (ivRect == null) return;
//
//   Offset targetListCalloutInitialPos = Offset(ivRect.right, ivRect.top - 40);
//
//   // Offset initialPos = stackMeasuredGlobalPos?.translate(-calloutW, stackMeasuredSize!.height - calloutH) ?? Offset.zero;
//   Callout(
//     feature: CAPI.TARGET_LISTVIEW_CALLOUT.feature(parent.widget.name),
//     color: Colors.transparent,
//     width: TARGET_LISTVIEW_CALLOUT_W,
//     height: calloutH(),
//     // resizeableV: true,
//     // dragHandle: const Icon(Icons.drag_indicator, color: Colors.grey,),
//     dragHandle: Container(
//       color: Colors.white12,
//       width: TARGET_LISTVIEW_CALLOUT_W,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Divider(
//             indent: 6,
//             endIndent: 6,
//             height: 10,
//             thickness: 2,
//             color: Colors.purpleAccent.withOpacity(.3),
//           ),
//           Divider(
//             indent: 6,
//             endIndent: 6,
//             height: 10,
//             thickness: 2,
//             color: Colors.purpleAccent.withOpacity(.3),
//           ),
//           Divider(
//             indent: 6,
//             endIndent: 6,
//             height: 10,
//             thickness: 2,
//             color: Colors.purpleAccent.withOpacity(.3),
//           ),
//           Divider(
//             indent: 6,
//             endIndent: 6,
//             height: 10,
//             thickness: 2,
//             color: Colors.purpleAccent.withOpacity(.3),
//           ),
//           Divider(
//             indent: 6,
//             endIndent: 6,
//             height: 10,
//             thickness: 2,
//             color: Colors.purpleAccent.withOpacity(.3),
//           ),
//         ],
//       ),
//     ),
//     dragHandleHeight: 50,
//     contents: () => Container(
//       padding: const EdgeInsets.all(12),
//       decoration: const ShapeDecoration(
//         color: Colors.purpleAccent,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(10)),
//           side: BorderSide(color: Colors.black12),
//         ),
//       ),
//       child: CCTargetListViewContents(parent),
//     ),
//     initialCalloutPos: targetListCalloutInitialPos,
//     ignoreCalloutResult: true,
//     arrowType: ArrowType.NO_CONNECTOR,
//     // onExpiredF: () {
//     //   // Useful.afterMsDelayDo(500, () {
//     //   //   createAndShowTargetListCallout(bloc);
//     //   // });
//     // },
//   ).show(
//     notUsingHydratedStorage: true,
//   );
// }
