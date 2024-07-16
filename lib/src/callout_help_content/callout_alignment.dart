// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_content/src/bloc/capi_bloc.dart';
// import 'package:flutter_content/src/bloc/capi_event.dart';
// import 'package:flutter_content/src/bloc/capi_state.dart';
//
// import 'package:flutter_content/flutter_content.dart';
// import 'package:flutter_content/src/model/model.dart';
//
// void showAlignmentCallout(
//   final GlobalKey btnGK,
//   final TargetModel tc,
//   final ScrollController? ancestorHScrollController,
//   final ScrollController? ancestorVScrollController,
// ) {
//   Callout(
//     cId: CAPI.TEXT_ALIGNMENT_CALLOUT.feature(),
//     hScrollController: ancestorHScrollController,
//     vScrollController: ancestorVScrollController,
//     targetGKF: () => btnGK,
//     contents: () => TextAlignmentTool(
//       tc: tc,
//       ancestorHScrollController: ancestorHScrollController,
//       ancestorVScrollController: ancestorVScrollController,
//     ),
//     initialCalloutAlignment: Alignment.centerRight,
//     initialTargetAlignment: Alignment.centerLeft,
//     separation: 30,
//     barrierOpacity: 0.1,
//     arrowColor: Colors.purpleAccent,
//     // arrowType: tc.getArrowType(),
//     // animate: tc.animateArrow,
//     modal: true,
//     width: 300,
//     height: 80,
//     draggable: true,
//     color: Colors.purpleAccent,
//     arrowType: ArrowType.POINTY,
//     roundedCorners: 16,
//     showCloseButton: true,
//     closeButtonColor: Colors.white,
//     scaleTarget: tc.transformScale,
//   ).show(notUsingHydratedStorage: true);
// }
//
// class TextAlignmentTool extends StatelessWidget {
//   final TargetModel tc;
//   final ScrollController? ancestorHScrollController;
//   final ScrollController? ancestorVScrollController;
//
//   const TextAlignmentTool({
//     super.key,
//     required this.tc,
//     this.ancestorHScrollController,
//     this.ancestorVScrollController,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CAPIBloc, CAPIState>(
//       builder: (context, state) {
//         TargetModel _tc = state.selectedTarget!;
//         TextAlign _textAlign = _tc.textAlign();
//         return Padding(
//             padding: const EdgeInsets.all(20),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 _TextAlignOptionBtn(
//                   icon: Icons.format_align_left,
//                   isHighlighted: _textAlign == TextAlign.left,
//                   onPressed: () {
//                     _tc.bloc.add(CAPIEvent.changedCalloutTextAlign(tc:_tc, newTextAlign: TextAlign.left));
//                   },
//                 ),
//                 _TextAlignOptionBtn(
//                   icon: Icons.format_align_center,
//                   isHighlighted: _textAlign == TextAlign.center,
//                   onPressed: () {
//                     _tc.bloc.add(CAPIEvent.changedCalloutTextAlign(tc:_tc, newTextAlign: TextAlign.center));
//                   },
//                 ),
//                 _TextAlignOptionBtn(
//                   icon: Icons.format_align_right,
//                   isHighlighted: _textAlign == TextAlign.right,
//                   onPressed: () {
//                     _tc.bloc.add(CAPIEvent.changedCalloutTextAlign(tc:_tc, newTextAlign: TextAlign.right));
//                   },
//                 ),
//                 _TextAlignOptionBtn(
//                   icon: Icons.format_align_justify,
//                   isHighlighted: _textAlign == TextAlign.justify,
//                   onPressed: () {
//                     _tc.bloc.add(CAPIEvent.changedCalloutTextAlign(tc:_tc, newTextAlign: TextAlign.justify));
//                   },
//                 ),
//                 SizedBox(
//                   width: 30,
//                 ),
//               ],
//             ));
//       },
//     );
//   }
// }
//
// class _TextAlignOptionBtn extends StatelessWidget {
//   final IconData icon;
//   final Function() onPressed;
//   final bool isHighlighted;
//
//   const _TextAlignOptionBtn({
//     required this.icon,
//     required this.onPressed,
//     this.isHighlighted = false,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       iconSize: 32,
//       icon: Icon(
//         icon,
//         color: isHighlighted ? Colors.white : Colors.white.withOpacity(.5),
//       ),
//       onPressed: onPressed,
//     );
//   }
// }
