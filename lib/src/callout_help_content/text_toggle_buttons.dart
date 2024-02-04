// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_content/src/bloc/capi_bloc.dart';
// import 'package:flutter_content/src/bloc/capi_event.dart';
// import 'package:flutter_content/src/bloc/capi_state.dart';
// import 'package:flutter_content/src/callout_help_content/callout_alignment.dart';
// import 'package:flutter_content/src/callout_help_content/callout_color.dart';
// import 'package:flutter_content/src/callout_help_content/callout_font_family.dart';
// import 'package:flutter_content/src/callout_help_content/callout_pointy.dart';
// import 'package:flutter_content/src/callout_help_content/callout_sizing.dart';
// import 'package:flutter_content/src/model/model.dart';
//
// enum TextToggleButton {
//   font_family,
//   italic,
//   alignment,
//   sizing,
//   colours,
// }
//
// class TextToggleButtons extends StatelessWidget {
//   final ScrollController? ancestorHScrollController;
//   final ScrollController? ancestorVScrollController;
//
//   const TextToggleButtons(this.ancestorHScrollController, this.ancestorVScrollController, {super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     GlobalKey _fontFamilyBtnGK = GlobalKey(debugLabel: "font-family");
//     GlobalKey _fontAlignmentBtnGK = GlobalKey(debugLabel: "alignment");
//     GlobalKey _fontSizeBtnGK = GlobalKey(debugLabel: "sizes");
//     GlobalKey _textColorsBtnGK = GlobalKey(debugLabel: "text-colour");
//     GlobalKey _pointyBtnGK = GlobalKey(debugLabel: "pointy");
//
//     return BlocBuilder<CAPIBloc, CAPIState>(
//       builder: (context, state) {
//         TargetConfig selectedTC = state.selectedTarget!;
//         bool bold = (selectedTC.fontWeightIndex ?? 0.0) >= FontWeight.bold.index;
//         bool italic = selectedTC.italic;
//         String textAlignment = selectedTC.textAlignment;
//         List<Widget> btns = [
//           Icon(key: _fontFamilyBtnGK, Icons.title, color: Colors.purpleAccent.withOpacity(.5)),
//           if (!italic) Icon(Icons.format_italic, color: Colors.purpleAccent.withOpacity(.5)),
//           if (italic) Icon(Icons.format_italic, color: Colors.purpleAccent),
//           if (textAlignment == 'l') Icon(key: _fontAlignmentBtnGK, Icons.format_align_left, color: Colors.purpleAccent),
//           if (textAlignment == 'r') Icon(key: _fontAlignmentBtnGK, Icons.format_align_right, color: Colors.purpleAccent),
//           if (textAlignment == 'c') Icon(key: _fontAlignmentBtnGK, Icons.format_align_center, color: Colors.purpleAccent),
//           if (textAlignment == 'j') Icon(key: _fontAlignmentBtnGK, Icons.format_align_justify, color: Colors.purpleAccent),
//           Icon(key: _fontSizeBtnGK, Icons.format_size, color: Colors.purpleAccent.withOpacity(.5)),
//           Icon(key: _textColorsBtnGK, Icons.color_lens, color: Colors.purpleAccent.withOpacity(.5)),
//         ];
//         return Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(16),
//               topRight: Radius.circular(16),
//             ),
//           ),
//           child: ToggleButtons(
//             direction: Axis.horizontal,
//             onPressed: (int index) {
//               switch (TextToggleButton.values[index]) {
//                 case TextToggleButton.font_family:
//                   showFontFamilyCallout(_fontFamilyBtnGK, selectedTC, ancestorHScrollController, ancestorVScrollController);
//                   break;
//                 case TextToggleButton.italic:
//                   bloc.add(
//                     CAPIEvent.changedCalloutTextStyle(tc: selectedTC,
//                         newTextStyle: selectedTC.textStyle().copyWith(
//                               fontStyle: italic ? FontStyle.normal : FontStyle.italic,
//                             )),
//                   );
//                   break;
//                 case TextToggleButton.alignment:
//                   showAlignmentCallout(_fontAlignmentBtnGK, selectedTC, ancestorHScrollController, ancestorVScrollController);
//                   break;
//                 case TextToggleButton.sizing:
//                   showSizingCallout(_fontSizeBtnGK, selectedTC, ancestorHScrollController, ancestorVScrollController);
//                   break;
//                 case TextToggleButton.colours:
//                   showColorCallout(_textColorsBtnGK, selectedTC, ancestorHScrollController, ancestorVScrollController);
//                   break;
//               }
//             },
//             // borderRadius: const BorderRadius.all(Radius.circular(8)),
//             borderWidth: 1,
//             borderColor: Colors.white54,
//             selectedBorderColor: Colors.purpleAccent,
//             selectedColor: Colors.purpleAccent,
//             color: Colors.white,
//             constraints: const BoxConstraints(
//               minHeight: 40.0,
//               minWidth: 40.0,
//             ),
//             isSelected: List.filled(TextToggleButton.values.length, false),
//             children: btns,
//           ),
//         );
//       },
//     );
//   }
// }
