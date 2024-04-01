// import 'package:flutter/material.dart';
// import 'package:flutter_content/src/callout_help_content/callout_color.dart';
// import 'package:flutter_content/src/callout_help_content/callout_font_family.dart';
// import 'package:flutter_content/src/model/model.dart';
// import 'package:flutter_content/src/styles/toolbar_action.dart';
//
// import 'option_button.dart';
//
// class TextToolbar extends StatefulWidget {
//   final TargetModel tc;
//   final ScrollController? ancestorHScrollController;
//   final ScrollController? ancestorVScrollController;
//
//   const TextToolbar(this.tc, this.ancestorHScrollController, this.ancestorVScrollController, {super.key});
//
//   @override
//   _TextToolbarState createState() => _TextToolbarState();
// }
//
// class _TextToolbarState extends State<TextToolbar> {
//   EditorToolbarAction? _selectedAction;
//   GlobalKey _fontFamilyBtnGK = GlobalKey();
//   GlobalKey _fontStyleBtnGK = GlobalKey();
//   GlobalKey _fontSizeBtnGK = GlobalKey();
//   GlobalKey _textColorBtnGK = GlobalKey();
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.purpleAccent,
//       height: 60,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//             OptionButton(
//               key: _fontFamilyBtnGK,
//               isActive: _selectedAction == EditorToolbarAction.fontFamilyTool,
//               child: const Icon(
//                 Icons.title,
//                 color: Colors.white,
//               ),
//               onPressed: () {
//                 setState(() => _selectedAction = EditorToolbarAction.fontFamilyTool);
//                 showFontFamilyCallout(_fontFamilyBtnGK, widget.tc, widget.ancestorHScrollController, widget.ancestorVScrollController);
//               },
//             ),
//             OptionButton(
//               key: _fontStyleBtnGK,
//               isActive: _selectedAction == EditorToolbarAction.fontOptionTool,
//               child: const Icon(
//                 Icons.strikethrough_s,
//                 color: Colors.white,
//               ),
//               onPressed: () {
//                 setState(() => _selectedAction = EditorToolbarAction.fontOptionTool);
//               },
//             ),
//             OptionButton(
//               key: _fontSizeBtnGK,
//               isActive: _selectedAction == EditorToolbarAction.fontSizeTool,
//               child: const Icon(
//                 Icons.format_size,
//                 color: Colors.white,
//               ),
//               onPressed: () {
//                 setState(() => _selectedAction = EditorToolbarAction.fontSizeTool);
//               },
//             ),
//             OptionButton(
//               key: _textColorBtnGK,
//               isActive: _selectedAction == EditorToolbarAction.fontColorTool,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Icon(
//                     Icons.format_color_text,
//                     color: Colors.white,
//                   ),
//                   const Icon(
//                     Icons.format_color_fill,
//                     color: Colors.white,
//                   ),
//                 ],
//               ),
//               size: Size(60,45),
//               onPressed: () {
//                 setState(() => _selectedAction = EditorToolbarAction.fontColorTool);
//                 showColorCallout(_textColorBtnGK, widget.tc, widget.ancestorHScrollController, widget.ancestorVScrollController);
//               },
//             ),
//         ],
//       ),
//     );
//   }
// }
