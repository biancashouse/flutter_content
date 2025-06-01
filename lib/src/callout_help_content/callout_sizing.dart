// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_content/flutter_content.dart';
// import 'package:flutter_content/src/bloc/capi_bloc.dart';
// import 'package:flutter_content/src/bloc/capi_event.dart';
// import 'package:flutter_content/src/bloc/capi_state.dart';
//
// import '../model/model.dart';
//
// void showSizingCallout(
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
//     contents: () => TextSizingTool(
//       tc: tc,
//       ancestorHScrollController: ancestorHScrollController,
//       ancestorVScrollController: ancestorVScrollController,
//     ),
//     initialCalloutAlignment: AlignmentEnum.centerLeft,
//     initialTargetAlignment: AlignmentEnum.centerRight,
//     separation: 50,
//     barrierOpacity: 0.1,
//     arrowColor: Colors.purpleAccent,
//     // arrowType: tc.getArrowType(),
//     // animate: tc.animateArrow,
//     modal: true,
//     width: 400,
//     height: 270,
//     draggable: true,
//     color: Colors.purpleAccent,
//     arrowType: ArrowTypeEnum.POINTY,
//     roundedCorners: 16,
//     showCloseButton: true,
//     closeButtonColor: Colors.white,
//     scaleTarget: tc.transformScale,
//   ).show(notUsingHydratedStorage: true);
// }
//
// class TextSizingTool extends StatelessWidget {
//   final TargetModel tc;
//   final ScrollController? ancestorHScrollController;
//   final ScrollController? ancestorVScrollController;
//
//   const TextSizingTool({
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
//         double _fontSize = _tc.fontSize;
//         double _letterSpacing = _tc.letterSpacing;
//         double _letterHeight = _tc.letterHeight;
//         int _fontWeightIndex = _tc.fontWeightIndex ?? FontWeight.normal.index;
//         return Container(
//           padding: EdgeInsets.all(20),
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 30,
//               ),
//               ResizeSlider(
//                 value: _fontSize,
//                 icon: Icons.format_size,
//                 onChange: (value) {
//                   _tc.bloc.add(
//                     CAPIEvent.changedCalloutTextStyle(tc:_tc,
//                       newTextStyle: _tc.textStyle().copyWith(
//                             fontSize: value,
//                           ),
//                     ),
//                   );
//                 },
//               ),
//               ResizeSlider(
//                 value: _letterHeight,
//                 icon: Icons.format_line_spacing,
//                 min: 1.0,
//                 max: 1.5,
//                 onChange: (value) {
//                   _tc.bloc.add(CAPIEvent.changedCalloutTextStyle(tc:_tc,
//                     newTextStyle: _tc.textStyle().copyWith(
//                           height: value,
//                         ),
//                   ));
//                 },
//               ),
//               ResizeSlider(
//                 value: _letterSpacing,
//                 icon: Icons.settings_ethernet,
//                 max: 10,
//                 onChange: (value) {
//                   _tc.bloc.add(
//                     CAPIEvent.changedCalloutTextStyle(tc:_tc,
//                       newTextStyle: _tc.textStyle().copyWith(
//                             letterSpacing: value,
//                           ),
//                     ),
//                   );
//                 },
//               ),
//               ResizeSlider(
//                 value: _fontWeightIndex.toDouble(),
//                 icon: Icons.format_bold,
//                 min: FontWeight.normal.index.toDouble(),
//                 max: FontWeight.w900.index.toDouble(),
//                 divisions: 5,
//                 showValue: false,
//                 onChange: (value) {
//                   _tc.bloc.add(
//                     CAPIEvent.changedCalloutTextStyle(tc:_tc,
//                       newTextStyle: _tc.textStyle().copyWith(
//                             fontWeight: FontWeight.values[value.toInt()],
//                           ),
//                     ),
//                   );
//                 },
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
//
// // class ResizeSlider extends StatefulWidget {
// //   final double value;
// //   final double? min;
// //   final double? max;
// //   final int? divisions;
// //   final IconData icon;
// //   final bool showValue;
// //   final Function(double) onChange;
// //
// //   const ResizeSlider({
// //     required this.value,
// //     required this.icon,
// //     required this.onChange,
// //     this.min = 0,
// //     this.max = 100,
// //     this.showValue = true,
// //     this.divisions,
// //   });
// //
// //   @override
// //   _ResizeSliderState createState() => _ResizeSliderState();
// // }
// //
// // class _ResizeSliderState extends State<ResizeSlider> {
// //   late double _value;
// //
// //   @override
// //   void initState() {
// //     _value = widget.value;
// //     super.initState();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Row(
// //       children: [
// //         Icon(widget.icon),
// //         Expanded(
// //           child: SliderTheme(
// //             data: SliderThemeData(
// //               activeTrackColor: Theme.of(context).colorScheme.background,
// //               inactiveTrackColor: Theme.of(context).colorScheme.background,
// //               thumbColor: Theme.of(context).colorScheme.background,
// //               overlayColor: Theme.of(context).colorScheme.background.withValues(alpha:0.2),
// //               trackHeight: 2,
// //             ),
// //             child: Slider(
// //               value: _value,
// //               onChanged: (value) {
// //                 setState(() => _value = value);
// //
// //                   widget.onChange(value);
// //               },
// //               min: widget.min!,
// //               max: widget.max!,
// //               divisions: widget.divisions,
// //             ),
// //           ),
// //         ),
// //         if (widget.showValue) Text(_value.toStringAsFixed(1)),
// //       ],
// //     );
// //   }
// // }
