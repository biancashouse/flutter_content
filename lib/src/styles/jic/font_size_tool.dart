// import 'package:flutter/material.dart';
//
// class FontSizeTool extends StatelessWidget {
//   final double fontSize;
//   final double letterSpacing;
//   final double letterHeight;
//   final int fontWeight;
//   final Function(
//     double fontSize,
//     double letterSpacing,
//     double letterHeight,
//     double fontWeight,
//
//   const FontSizeTool({super.key,
//     this.fontSize = 0,
//     this.letterSpacing = 0,
//     this.letterHeight = 0,
//     this.fontWeight = 3,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     double _fontSize = fontSize;
//     double _letterSpacing = letterSpacing;
//     double _letterHeight = letterHeight;
//     double _fontWeight = fontWeight.toDouble();
//
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(16,0,16,0),
//       child: Column(
//         children: [
//           ResizeSlider(
//             value: _fontSize,
//             icon: Icons.format_size,
//             onChange: (value) {
//               _fontSize = value;
//               onFontSizeEdited(_fontSize, _letterSpacing, _letterHeight, _fontWeight);
//             },
//           ),
//           ResizeSlider(
//             value: _letterHeight,
//             icon: Icons.format_line_spacing,
//             max: 10,
//             onChange: (value) {
//               _letterHeight = value;
//               onFontSizeEdited(_fontSize, _letterSpacing, _letterHeight, _fontWeight);
//             },
//           ),
//           ResizeSlider(
//             value: _letterSpacing,
//             icon: Icons.settings_ethernet,
//             max: 10,
//             onChange: (value) {
//               _letterSpacing = value;
//               onFontSizeEdited(_fontSize, _letterSpacing, _letterHeight, _fontWeight);
//             },
//           ),
//           ResizeSlider(
//             value: _fontWeight,
//             icon: Icons.format_bold,
//             min: 0,
//             max: FontWeight.values.length-1,
//             divisions: FontWeight.values.length,
//             onChange: (value) {
//               _fontWeight = value;
//               onFontSizeEdited(_fontSize, _letterSpacing, _letterHeight, _fontWeight);
//             },
//           )
//         ],
//       ),
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
// //   final Function(double) onChange;
// //
// //   const ResizeSlider({
// //     required this.value,
// //     required this.icon,
// //     required this.onChange,
// //     this.min = 0,
// //     this.max = 100,
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
// //
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
// //                 widget.onChange(value);
// //               },
// //               min: widget.min!,
// //               max: widget.max!,
// //               divisions: widget.divisions,
// //             ),
// //           ),
// //         ),
// //         Text(_value.toStringAsFixed(1)),
// //       ],
// //     );
// //   }
// // }
