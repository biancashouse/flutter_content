// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_content/flutter_content.dart';
// import 'package:flutter_content/src/bloc/capi_bloc.dart';
// import 'package:flutter_content/src/target_config/content/play_content_callout.dart';
// import 'package:flutter_content/src/model/model.dart';
//
//
// bool isShowingPointyCallout() => Callout.anyPresent([CAPI.ARROW_TYPE_CALLOUT.feature()]);
//
// void removePointyCallout() {
//   if (Callout.anyPresent([CAPI.ARROW_TYPE_CALLOUT.feature()])) {
//     debugPrint("removePointyCallout");
//     Callout.removeOverlay(CAPI.ARROW_TYPE_CALLOUT.feature(), true);
//   }
// }
//
// showPointyToolToast(
//   final TargetModel selectedTC,
//   final ScrollController? ancestorHScrollController,
//   final ScrollController? ancestorVScrollController,
// ) =>
//     WidgetToast(
//       gravity: Alignment.bottomCenter,
//       backgroundColor: Colors.purpleAccent,
//       feature: CAPI.ARROW_TYPE_CALLOUT.feature(),
//       contents: () => PointyTool(
//         selectedTC: selectedTC,
//         ancestorHScrollController: ancestorHScrollController,
//         ancestorVScrollController: ancestorVScrollController,
//       ),
//       width: Useful.scrW,
//       height: 116,
//       showCloseButton: true,
//       closeButtonColor: Colors.white,
//     ).show(
//       notUsingHydratedStorage: true,
//     );
//
// class PointyTool extends StatefulWidget {
//   final TargetModel selectedTC;
//   final ScrollController? ancestorHScrollController;
//   final ScrollController? ancestorVScrollController;
//
//   const PointyTool({
//     super.key,
//     required this.selectedTC,
//     this.ancestorHScrollController,
//     this.ancestorVScrollController,
//   });
//
//   @override
//   State<PointyTool> createState() => _PointyToolState();
// }
//
// class _PointyToolState extends State<PointyTool> {
//   late ArrowType _arrowType;
//   late bool _animate;
//
//   @override
//   void initState() {
//     super.initState();
//     _arrowType = widget.selectedTC.getArrowType();
//     _animate = widget.selectedTC.animateArrow;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // TargetModel? selectedTC = bloc.state.selectedTarget;
//     return Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             mainAxisSize: MainAxisSize.max,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Expanded(
//                 flex: 2,
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       ArrowType.NO_CONNECTOR,
//                       ArrowType.POINTY,
//                     ]
//                         .map((t) => Padding(
//                               padding: const EdgeInsets.all(3.0),
//                               child: _ArrowTypeOption(
//                                 arrowType: t,
//                                 arrowColor: widget.selectedTC.calloutColor(),
//                                 isActive: _arrowType == t,
//                                 onPressed: () {
//                                   setState(() => _arrowType = t);
//                                   widget.selectedTC.arrowType = t.index;
//                                   removeHelpContentEditorCallout();
//                                   Useful.afterMsDelayDo(250, () {
//                                     showHelpContentCallout(widget.selectedTC, true, widget.ancestorHScrollController, widget.ancestorVScrollController);
//                                   });
//                                 },
//                               ),
//                             ))
//                         .toList()),
//               ),
//               Expanded(
//                 flex: 3,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Expanded(
//                       child: Row(
//                           children: [
//                         ArrowType.VERY_THIN,
//                         ArrowType.THIN,
//                         ArrowType.MEDIUM,
//                         ArrowType.LARGE,
//                         ArrowType.HUGE,
//                       ]
//                               .map((t) => Padding(
//                                     padding: const EdgeInsets.all(3.0),
//                                     child: _ArrowTypeOption(
//                                       arrowType: t,
//                                       arrowColor: widget.selectedTC.calloutColor(),
//                                       isActive: _arrowType == t,
//                                       onPressed: () {
//                                         setState(() => _arrowType = t);
//                                         widget.selectedTC.arrowType = t.index;
//                                         removeHelpContentEditorCallout();
//                                         Useful.afterMsDelayDo(250, () {
//                                           showHelpContentCallout(
//                                               widget.selectedTC, true, widget.ancestorHScrollController, widget.ancestorVScrollController);
//                                         });
//                                       },
//                                     ),
//                                   ))
//                               .toList()),
//                     ),
//                     Expanded(
//                       child: Row(
//                           children: [
//                         ArrowType.VERY_THIN_REVERSED,
//                         ArrowType.THIN_REVERSED,
//                         ArrowType.MEDIUM_REVERSED,
//                         ArrowType.LARGE_REVERSED,
//                         ArrowType.HUGE_REVERSED,
//                       ]
//                               .map((t) => Padding(
//                                     padding: const EdgeInsets.all(3.0),
//                                     child: _ArrowTypeOption(
//                                       arrowType: t,
//                                       arrowColor: widget.selectedTC.calloutColor(),
//                                       isActive: _arrowType == t,
//                                       onPressed: () {
//                                         setState(() => _arrowType = t);
//                                         widget.selectedTC.arrowType = t.index;
//                                         removeHelpContentEditorCallout();
//                                         Useful.afterMsDelayDo(250, () {
//                                           showHelpContentCallout(
//                                               widget.selectedTC, true, widget.ancestorHScrollController, widget.ancestorVScrollController);
//                                         });
//                                       },
//                                     ),
//                                   ))
//                               .toList()),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 flex: 1,
//                 child: widget.selectedTC.arrowType == ArrowType.NO_CONNECTOR.index || widget.selectedTC.arrowType == ArrowType.POINTY.index
//                     ? Offstage()
//                     : OutlinedButton(
//                         style: OutlinedButton.styleFrom(backgroundColor: widget.selectedTC.animateArrow ? Colors.white : Colors.white60),
//                         child: SizedBox(
//                           width: 75,
//                           child: const Text(
//                             'animate',
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                         onPressed: () {
//                           setState(() => _animate = !_animate);
//                           widget.selectedTC.animateArrow = _animate;
//                           removeHelpContentEditorCallout();
//                           Useful.afterMsDelayDo(250, () {
//                             showHelpContentCallout(widget.selectedTC, true, widget.ancestorHScrollController, widget.ancestorVScrollController);
//                           });
//                         },
//                       ),
//               ),
//               SizedBox(
//                 width: 100,
//               ),
//             ],
//           );
//   }
// }
//
// class _ArrowTypeOption extends StatelessWidget {
//   final ArrowType arrowType;
//   final Color arrowColor;
//   final Function() onPressed;
//   final bool isActive;
//
//   const _ArrowTypeOption({
//     required this.arrowType,
//     required this.arrowColor,
//     required this.onPressed,
//     this.isActive = false,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     Color bgColor = arrowColor == Colors.white ? Colors.black26 : Colors.black12;
//     return Container(
//       width: 80,
//       height: 40,
//       color: isActive ? bgColor : Colors.white54,
//       child: InkWell(
//         onTap: onPressed,
//         child: arrowType == ArrowType.NO_CONNECTOR
//             ? Icon(Icons.rectangle_rounded, color: arrowColor)
//             : arrowType == ArrowType.POINTY
//                 ? Icon(Icons.messenger, color: arrowColor)
//                 : arrowType == ArrowType.VERY_THIN
//                     ? Icon(Icons.south_west, color: arrowColor, size: 15)
//                     : arrowType == ArrowType.VERY_THIN_REVERSED
//                         ? Icon(Icons.north_east, color: arrowColor, size: 15)
//                         : arrowType == ArrowType.THIN
//                             ? Icon(Icons.south_west, color: arrowColor, size: 20)
//                             : arrowType == ArrowType.THIN_REVERSED
//                                 ? Icon(Icons.north_east, color: arrowColor, size: 20)
//                                 : arrowType == ArrowType.MEDIUM
//                                     ? Icon(Icons.south_west, color: arrowColor, size: 25)
//                                     : arrowType == ArrowType.MEDIUM_REVERSED
//                                         ? Icon(Icons.north_east, color: arrowColor, size: 25)
//                                         : arrowType == ArrowType.LARGE
//                                             ? Icon(Icons.south_west, color: arrowColor, size: 35)
//                                             : arrowType == ArrowType.LARGE_REVERSED
//                                                 ? Icon(Icons.north_east, color: arrowColor, size: 35)
//                                                 : arrowType == ArrowType.HUGE
//                                                     ? Icon(Icons.south_west, color: arrowColor, size: 40)
//                                                     : Icon(Icons.north_east, color: arrowColor, size: 40),
//       ),
//     );
//   }
// }
