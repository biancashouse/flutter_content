// library text_style_editor;
//
// import 'package:flutter_content/src/bloc/capi_event.dart';
// import 'package:flutter_content/src/callout_text_editor.dart';
// import 'package:flutter_content/src/model/model.dart';
// import 'package:flutter_content/src/overlays/callouts/arrow_type.dart';
// import 'package:flutter_content/src/overlays/callouts/callout_o.dart';
// import 'package:flutter_content/src/styles/callout_toolbar.dart';
// import 'package:flutter_content/src/styles/font_color_tool.dart';
// import 'package:flutter_content/src/styles/number_input.dart';
// import 'package:flutter_content/src/styles/target_tool.dart';
// import 'package:flutter_content/src/content_useful.dart';
// import 'package:flutter/material.dart';
//
// import 'background_color_tool.dart';
// import 'font_family_tool.dart';
// import 'font_size_tool.dart';
// import 'pointy_tool.dart';
// import 'text_format_tool.dart';
// import 'toolbar.dart';
// import 'toolbar_action.dart';
//
// export 'toolbar_action.dart';
//
//
// /// Text style editor
// /// A flutter widget that edit text style and text alignment
// ///
// /// You can pass your text style or alignment to the widget
// /// and then get the edited text style
// class StylesPicker2 extends StatefulWidget {
//   final TargetModel tc;
//   final ScrollController? ancestorHScrollController;
//   final ScrollController? ancestorVScrollController;
//
//   /// Create a [StylesPicker2] widget
//   ///
//   /// [fontFamilies] list of font families that you want to use in editor.
//   /// [textStyle] initiate text style.
//   /// [textAlign] initiate text alignment.
//   ///
//   /// [onTextStyleEdited] callback will be called every time [textStyle] has changed.
//   /// [onTextAlignEdited] callback will be called every time [textAlign] has changed.
//   /// [onCpasLockTaggle] callback will be called every time caps lock has changed to off or on.
//   /// [onToolbarActionChanged] callback will be called every time editor's tool has changed.
//   const StylesPicker2({
//     required this.tc,
//     required this.ancestorHScrollController,
//     required this.ancestorVScrollController,
//     this.onToolbarActionChanged,
//     // required this.minimise,
//     super.key,
//   });
//
//   @override
//   StylesPicker2State createState() => StylesPicker2State();
// }
//
// class StylesPicker2State extends State<StylesPicker2> {
//   bool isImageCallout = false;
//
//
//   @override
//   void setState(VoidCallback fn) {
//     super.setState(() {
//       fn.call();
//     });
//   }
//
//   @override
//   void initState() {
//     // minimise = widget.minimise;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTextStyle(
//       style: TextStyle(color: Colors.white),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           CalloutToolbar(
//             widget.tc,
//             this,
//           ),
//         ],
//       ),
//     );
//   }
//
// }
//
// void removeStylesCallout() => Callout.removeOverlay(CAPI.STYLES_CALLOUT.feature(), true);
//
// const double MAXIMISED_STYLE_CALLOUT_W = 400;
// const double MAXIMISED_STYLE_CALLOUT_H = 300;
//
// Offset stylesCalloutInitialPos() => Offset(FCO.scrW - MAXIMISED_STYLE_CALLOUT_W, FCO.scrH - MAXIMISED_STYLE_CALLOUT_H);
//
// void showStylesCallout(final TargetModel tc, final ScrollController? ancestorHScrollC, final ScrollController? ancestorVScrollC) {
//   Callout(
//     cId: CAPI.STYLES_CALLOUT.feature(),
//     color: Colors.transparent,
//     width: MAXIMISED_STYLE_CALLOUT_W,
//     height: MAXIMISED_STYLE_CALLOUT_H,
//     contents: () => Container(
//       padding: const EdgeInsets.all(12),
//       decoration: const ShapeDecoration(
//         color: Colors.purpleAccent,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(10)),
//           side: BorderSide(color: Colors.black12),
//         ),
//       ),
//       child: StylesPicker2(
//         // key: parentState.tseGK,
//         tc: tc,
//         ancestorHScrollController: ancestorHScrollC,
//         ancestorVScrollController: ancestorVScrollC,
//         // initialTool: EditorToolbarAction.backgroundColorTool,
//       ),
//     ),
//     initialCalloutPos: stylesCalloutInitialPos(),
//     ignoreCalloutResult: true,
//     arrowType: ArrowType.NONE,
//   ).show(
//     notUsingHydratedStorage: true,
//   );
//
// }
