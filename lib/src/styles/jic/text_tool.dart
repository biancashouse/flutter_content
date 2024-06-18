// import 'package:flutter_content/src/styles/option_button.dart';
// import 'package:flutter/material.dart';
//
// import '../../content.dart';
// import '../model/model.dart';
// import 'color_palette.dart';
// import 'font_size_tool.dart';
//
// class TextTool extends StatefulWidget {
//   final TargetModel tc;
//   final ScrollController? ancestorHScrollController;
//   final ScrollController? ancestorVScrollController;
//
//   const TextTool({
//     super.key,
//     required this.tc,
//     this.ancestorHScrollController,
//     this.ancestorVScrollController,
//     // required this.fontFamilies,
//     // required this.onSelectedFont,
//     // required this.onTextFormatEdited,
//     // required this.onTextAlignEdited,
//     // this.selectedFont,
//     // this.textAlign = TextAlign.left,
//     // this.bold = false,
//     // this.italic = false,
//     // required this.onFontSizeEdited,
//     // this.fontSize = 0,
//     // this.letterSpacing = 0,
//     // this.letterHeight = 0,
//     // this.fontWeight = 3,
//     // required this.colors,
//     // required this.onTextColorPicked,
//     // required this.onBgColorPicked,
//     // this.activeColor,
//   });
//
//   @override
//   _TextToolState createState() => _TextToolState();
// }
//
// class _TextToolState extends State<TextTool> {
//   late List<String> _fontFamilies;
//   late String _selectedFont;
//   late double _fontSize;
//   late double _letterSpacing;
//   late double _letterHeight;
//   late int _fontWeight;
//   late TextAlign _textAlign;
//   late bool _bold;
//   late bool _italic;
//
//   List<Color> paletteColors = [
//     Colors.white,
//     Colors.black,
//     Colors.yellow,
//     Colors.orange,
//     Colors.blue,
//     Colors.blue[900]!,
//     Colors.green,
//     Colors.purple,
//     Colors.red,
//     Colors.brown,
//     Colors.cyanAccent,
//     Colors.pink[50]!,
//   ];
//
//   @override
//   void initState() {
//     _fontFamilies = const [
//       'OpenSansBold',
//       "OpenSansExtraBold",
//       'OpenSans',
//       'Roboto',
//     ];
//     _selectedFont = widget.tc.fontFamily;
//     _fontSize = widget.tc.fontSize;
//     _letterSpacing = widget.tc.letterSpacing;
//     _letterHeight = widget.tc.letterHeight;
//     _fontWeight = widget.tc.fontWeight ?? 3;
//     _bold = widget.tc.textStyle().fontWeight == FontWeight.bold;
//     _italic = widget.tc.textStyle().fontStyle == FontStyle.italic;
//     _textAlign = widget.tc.textAlign();
//
//     super.initState();
//   }
//
//   TextStyle textStyleF() => TextStyle(
//         fontSize: widget.tc.fontSize,
//         color: widget.tc.textColor(),
//         backgroundColor: widget.tc.calloutColor(),
//         fontFamily: widget.tc.fontFamily,
//         // package: tc.bloc.state.localTestingFilePaths ? null : 'callout_api',
//         letterSpacing: widget.tc.letterSpacing,
//         height: widget.tc.letterHeight,
//       );
//
//   void onTextAlignEdited(TextAlign newTA) {
//     setState(() {
//       widget.tc.setTextAlign(newTA);
//     });
//   }
//
//   void onTextFormatEdited(bold, italic) {
//     setState(() {
//       onTextStyleEdited(textStyleF().copyWith(
//         fontWeight: bold ? FontWeight.bold : FontWeight.normal,
//         fontStyle: italic ? FontStyle.italic : FontStyle.normal,
//       ));
//     });
//   }
//
//   void onTextStyleEdited(TextStyle newTS) {
//     widget.tc.setTextStyle(newTS);
// // Callout.refreshOverlay(CAPI.STYLES_CALLOUT.feature(), () {});
// //     Callout.refreshOverlay(CAPI.HELP_CONTENT_TOOLBAR_CALLOUT.feature(), () {});
// // removeTextEditorCallout();
// // FC().afterMsDelayDo(50, () {
// //   showTextEditorCallout(tc, ancestorScrollC);
// // });
//   }
//
//   void onFontSizeEdited(
//     fontSize,
//     letterSpacing,
//     letterHeight,
//     fontWeight,
//   ) {
//     setState(() {
//       onTextStyleEdited(widget.tc.textStyle().copyWith(
//             fontSize: fontSize,
//             height: letterHeight,
//             letterSpacing: letterSpacing,
//             fontWeight: FontWeight.values[fontWeight.toInt()],
//           ));
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.purpleAccent,
//       padding: EdgeInsets.all(20),
//       child: Column(
//         children: [
//           // TextEditor(
//           //   feature: CAPI.HELP_CONTENT_CALLOUT,
//           //   originalS: originalS,
//           //   onChangedF: onTextChangedF,
//           //   prefixIcon: prefixIcon,
//           //   minHeight: minHeight,
//           //   focusNode: focusNode,
//           //   dontAutoFocus: dontAutoFocus,
//           //   bgColor: bgColor,
//           //   textStyleF: textStyleF,
//           //   textAlignF: textAlignF,
//           // ),
//           // FONT FAMILY
//           Wrap(
//             spacing: 20,
//             children: _fontFamilies
//                 .map<_FontFamily>(
//                   (family) => _FontFamily(
//                     family,
//                     isSelected: _selectedFont == family,
//                     onSelect: (selectedFont) {
//                       setState(() => _selectedFont = selectedFont);
//                       onTextStyleEdited(textStyleF().copyWith(
//                         fontFamily: family,
// // package: widget.tc.bloc.state.localTestingFilePaths ? null : 'callout_api',
//                       ));
//                     },
//                   ),
//                 )
//                 .toList(),
//           ),
//           // TEXT BOLD / ITALIC / ALIGNMENT
//           Container(
//             margin: const EdgeInsets.only(top: 24),
//             child: Row(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 _TextFormatEditor(
//                   bold: textStyleF().fontWeight == FontWeight.bold,
//                   italic: textStyleF().fontStyle == FontStyle.italic,
//                   onFormatEdited: onTextFormatEdited,
//                 ),
//                 const SizedBox(height: 24),
//                 _TextAlignEditor(
//                   textAlign: widget.tc.textAlign(),
//                   onTextAlignEdited: onTextAlignEdited,
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
//             child: Column(
//               children: [
//                 ResizeSlider(
//                   value: _fontSize,
//                   icon: Icons.format_size,
//                   onChange: (value) {
//                     _fontSize = value;
//                     onFontSizeEdited(_fontSize, _letterSpacing, _letterHeight, _fontWeight);
//                   },
//                 ),
//                 ResizeSlider(
//                   value: _letterHeight,
//                   icon: Icons.format_line_spacing,
//                   max: 10,
//                   onChange: (value) {
//                     _letterHeight = value;
//                     onFontSizeEdited(_fontSize, _letterSpacing, _letterHeight, _fontWeight);
//                   },
//                 ),
//                 ResizeSlider(
//                   value: _letterSpacing,
//                   icon: Icons.settings_ethernet,
//                   max: 10,
//                   onChange: (value) {
//                     _letterSpacing = value;
//                     onFontSizeEdited(_fontSize, _letterSpacing, _letterHeight, _fontWeight);
//                   },
//                 ),
//                 ResizeSlider(
//                   value: _fontWeight.toDouble(),
//                   icon: Icons.format_bold,
//                   max: 8,
//                   onChange: (value) {
//                     _fontWeight = value.toInt();
//                     onFontSizeEdited(_fontSize, _letterSpacing, _letterHeight, _fontWeight);
//                   },
//                 )
//               ],
//             ),
//           ),
//           ColorPalette(
//             activeColor: textStyleF().color,
//             onColorPicked: (color) {
//               setState(() {
//                 onTextStyleEdited(textStyleF().copyWith(color: color));
//               });
//             },
//             colors: paletteColors,
//             forBg: false,
//           ),
//           ColorPalette(
//             activeColor: textStyleF().backgroundColor,
//             onColorPicked: (color) {
//               setState(() {
//                 onTextStyleEdited(textStyleF().copyWith(backgroundColor: color));
//               });
//             },
//             colors: paletteColors,
//             forBg: true,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class _FontFamily extends StatelessWidget {
//   final String font;
//   final bool isSelected;
//   final Function(String) onSelect;
//
//   const _FontFamily(this.font, {required this.onSelect, this.isSelected = false});
//
//   @override
//   Widget build(BuildContext context) {
//     return OptionButton(
//       isActive: isSelected,
//       size: const Size(160, 45),
//       onPressed: () => onSelect(font),
//       child: Center(child: Text(font, style: TextStyle(fontFamily: font, color: Colors.white))),
//     );
//   }
// }
//
// class _TextFormatEditor extends StatefulWidget {
//   final Function(bool bold, bool italic) onFormatEdited;
//   final bool bold;
//   final bool italic;
//
//   const _TextFormatEditor({
//     required this.onFormatEdited,
//     this.bold = false,
//     this.italic = false,
//   });
//
//   @override
//   _TextFormatEditorState createState() => _TextFormatEditorState();
// }
//
// class _TextFormatEditorState extends State<_TextFormatEditor> {
//   late bool _bold;
//   late bool _italic;
//
//   @override
//   void initState() {
//     _bold = widget.bold;
//     _italic = widget.italic;
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         _TextFormatOption(
//           // title: 'BOLD',
//           icon: Icons.format_bold,
//           isActive: _bold,
//           onPressed: () {
//             setState(() => _bold = !_bold);
//             widget.onFormatEdited(_bold, _italic);
//           },
//         ),
//         SizedBox(
//           width: 20,
//           height: 20,
//         ),
//         _TextFormatOption(
//           // title: 'ITALIC',
//           icon: Icons.format_italic,
//           isActive: _italic,
//           onPressed: () {
//             setState(() => _italic = !_italic);
//             widget.onFormatEdited(_bold, _italic);
//           },
//         ),
//       ],
//     );
//   }
// }
//
// class _TextFormatOption extends StatelessWidget {
//   final String? title;
//   final IconData icon;
//   final Function() onPressed;
//   final bool isActive;
//
//   const _TextFormatOption({
//     this.title,
//     required this.icon,
//     required this.onPressed,
//     this.isActive = false,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         OptionButton(
//           isActive: isActive,
//           onPressed: onPressed,
//           child: Icon(
//             icon,
//             color: Colors.white,
//           ),
//         ),
//         if (title != null) const SizedBox(height: 12),
//         if (title != null) Text(title!),
//       ],
//     );
//   }
// }
//
// class _TextAlignEditor extends StatefulWidget {
//   final TextAlign textAlign;
//   final Function(TextAlign textAlign) onTextAlignEdited;
//
//   const _TextAlignEditor({
//     required this.onTextAlignEdited,
//     this.textAlign = TextAlign.left,
//   });
//
//   @override
//   _TextAlignEditorState createState() => _TextAlignEditorState();
// }
//
// class _TextAlignEditorState extends State<_TextAlignEditor> {
//   late TextAlign _textAlign;
//
//   @override
//   void initState() {
//     _textAlign = widget.textAlign;
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         _TextAlignOption(
//           icon: Icons.format_align_left,
//           isActive: _textAlign == TextAlign.left,
//           onPressed: () {
//             setState(() => _textAlign = TextAlign.left);
//             widget.onTextAlignEdited(_textAlign);
//           },
//         ),
//         _TextAlignOption(
//           icon: Icons.format_align_center,
//           isActive: _textAlign == TextAlign.center,
//           onPressed: () {
//             setState(() => _textAlign = TextAlign.center);
//             widget.onTextAlignEdited(_textAlign);
//           },
//         ),
//         _TextAlignOption(
//           icon: Icons.format_align_right,
//           isActive: _textAlign == TextAlign.right,
//           onPressed: () {
//             setState(() => _textAlign = TextAlign.right);
//             widget.onTextAlignEdited(_textAlign);
//           },
//         ),
//         _TextAlignOption(
//           icon: Icons.format_align_justify,
//           isActive: _textAlign == TextAlign.justify,
//           onPressed: () {
//             setState(() => _textAlign = TextAlign.justify);
//             widget.onTextAlignEdited(_textAlign);
//           },
//         ),
//       ],
//     );
//   }
// }
//
// class _TextAlignOption extends StatelessWidget {
//   final IconData icon;
//   final Function() onPressed;
//   final bool isActive;
//
//   const _TextAlignOption({
//     required this.icon,
//     required this.onPressed,
//     this.isActive = false,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       iconSize: 32,
//       icon: Icon(
//         icon,
//         color: isActive ? Colors.white : Colors.white.withOpacity(.5),
//       ),
//       onPressed: onPressed,
//     );
//   }
// }
