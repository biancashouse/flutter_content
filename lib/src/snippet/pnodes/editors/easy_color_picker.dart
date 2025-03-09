// // Copyright 2021 4inka
//
// // Redistribution and use in source and binary forms, with or without
// // modification, are permitted provided that the following conditions are met:
//
// // 1. Redistributions of source code must retain the above copyright notice,
// // this list of conditions and the following disclaimer.
//
// // 2. Redistributions in binary form must reproduce the above copyright
// // notice, this list of conditions and the following disclaimer in the
// // documentation and/or other materials provided with the distribution.
//
// // 3. Neither the name of the copyright holder nor the names of its contributors
// // may be used to endorse or promote products derived from this software without
// // specific prior written permission.
//
// // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// // AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// // WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
// // IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
// // INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
// // NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
// // PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
// // WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// // ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// // POSSIBILITY OF SUCH DAMAGE.
//
// library easy_color_picker;
//
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
//
// class EasyColorPicker extends HookWidget {
//   /// The current selected color from color picker
//   final Color selected;
//
//   /// Function that returns the current selected color clicked by user
//   final ValueChanged<Color?> onChanged;
//
//   final VoidCallback onCompleted;
//
//   /// The size for each color selector option
//   final double colorSelectorSize;
//
//   /// Border radius for each color selector
//   final double colorSelectorBorderRadius;
//
//   /// Margin to applied between options
//   final double optionsMargin;
//
//   /// Icon to be displayed on top of current select color option
//   final IconData selectedIcon;
//
//   /// Icon size for current selected color option
//   final double selectedIconSize;
//
//   /// Icon color for current selected color option
//   final Color selectedIconColor;
//
//   /// List of color to be displayed for selection
//   final List<Color> colors;
//
//   static const List<Color> defaultColors = [
//     Colors.white,
//     Colors.black,
//     Colors.grey,
//     Colors.deepPurple,
//     Colors.deepPurpleAccent,
//     Colors.purple,
//     Colors.purpleAccent,
//     Color.fromRGBO(255, 0, 255, 1),
//     Colors.pinkAccent,
//     Colors.pink,
//     Colors.redAccent,
//     Colors.orange,
//     Colors.brown,
//     // ecru - https://www.geeksforgeeks.org/shades-of-brown/
//     Color.fromRGBO(194, 178, 128, 1),
//     Colors.amberAccent,
//     Colors.yellowAccent,
//     Colors.green,
//     Colors.lime,
//     Colors.lightGreenAccent,
//     Colors.greenAccent,
//     Colors.lightBlueAccent,
//     Colors.cyan,
//     Colors.blue,
//     Colors.teal,
//   ];
//
//   /// Easy color picker widget
//   EasyColorPicker({
//     super.key,
//     required this.selected,
//     required this.onChanged,
//     required this.onCompleted,
//     this.colorSelectorBorderRadius = 5,
//     this.optionsMargin = 2,
//     this.colorSelectorSize = 30,
//     this.selectedIcon = Icons.check_rounded,
//     this.selectedIconSize = 20,
//     this.selectedIconColor = Colors.white,
//     this.colors = defaultColors,
//   }) : assert(colors.isNotEmpty, 'Color list cannot be empty');
//
//   @override
//   Widget build(BuildContext context) {
//     final _color = useState<Color>(selected);
//
//     return Column(
//       children: [
//         TextButton(
//           onPressed: () {
//             onChanged(Colors.transparent);
//           },
//           child: const Text('transparent'),
//         ),
//         Wrap(
//           alignment: WrapAlignment.center,
//           children: List.generate(colors.length, (index) {
//             Color tickColor = index != 0 ? selectedIconColor : Colors.black;
//             // fco.logger.i("tickColor: ${tickColor.value} (white is ${Colors.white.value}");
//             return Container(
//                 width: colorSelectorSize,
//                 margin: EdgeInsets.all(optionsMargin),
//                 child: AspectRatio(
//                     aspectRatio: 1,
//                     child: GestureDetector(
//                       child: Container(
//                           decoration: BoxDecoration(
//                             color: colors[index],
//                             border: Border.all(color: Colors.white),
//                             borderRadius: BorderRadius.circular(
//                                 colorSelectorBorderRadius),
//                           ),
//                           child: Visibility(
//                               visible:
//                               _color.value.value == colors[index].value,
//                               child: Icon(
//                                 selectedIcon,
//                                 size: selectedIconSize,
//                                 color: tickColor,
//                               ))),
//                       onTap: () {
//                         Color? newColor =
//                         (selected == colors[index]) ? null : colors[index];
//                         if (newColor != null) {
//                           onChanged(_color.value = newColor);
//                         }
//                       },
//                       onDoubleTap: () {
//                         Color? newColor =
//                         (selected == colors[index]) ? null : colors[index];
//                         onChanged(newColor);
//                         onCompleted();
//                       },
//                     )));
//           }),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: HuePicker(
//             initialColor: HSVColor.fromColor(_color.value),
//             onChanged: (color) {
//               onChanged(color.toColor());
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
