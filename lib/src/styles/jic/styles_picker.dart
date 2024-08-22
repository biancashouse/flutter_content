// library text_style_editor;
//
// import 'package:flutter_content/src/bloc/capi_event.dart';
// import 'package:flutter_content/src/callout_text_editor.dart';
// import 'package:flutter_content/src/model/model.dart';
// import 'package:flutter_content/src/overlays/callouts/arrow_type.dart';
// import 'package:flutter_content/src/overlays/callouts/callout_o.dart';
// import 'package:flutter_content/src/styles/font_color_tool.dart';
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
// class StylesPicker extends StatefulWidget {
//   final TargetModel tc;
//   final ScrollController? ancestorHScrollController;
//   final ScrollController? ancestorVScrollController;
//
//   /// Editor's font families
//   final List<String> fonts;
//
//   final AnimateArrowFunc animateArrowF;
//   final ArrowTypeFunc arrowTypeF;
//
//   /// The text style
//   final TextStyleFunc textStyleF;
//
//   /// The text alignment
//   final TextAlignFunc textAlignF;
//
//   /// The inithial editor tool
//   final EditorToolbarAction initialTool;
//
//   /// Editor's palette colors
//   final List<Color> paletteColors;
//
//   final Function(ArrowType) onArrowTypePicked;
//
//   final Function(bool) onAnimateArrowToggled;
//
//   /// [onTextStyleEdited] will be called after [textStyle] prop has changed
//   final Function(TextStyle) onTextStyleEdited;
//
//   /// [onTextAlignEdited] will be called after [textAlingment] prop has changed
//   final Function(TextAlign) onTextAlignEdited;
//
//   /// [onToolbarActionChanged] will be called after editor's tool has changed
//   final Function(EditorToolbarAction)? onToolbarActionChanged;
//
//   /// [onToolbarActionChanged] will be called after editor's tool has changed
//   final Function(double) onTargetSizeEdited;
//
//   /// [onToolbarActionChanged] will be called after editor's tool has changed
//   final Function(double) onTargetScaleEdited;
//
//   /// Create a [StylesPicker] widget
//   ///
//   /// [fonts] list of font families that you want to use in editor.
//   /// [textStyle] initiate text style.
//   /// [textAlign] initiate text alignment.
//   ///
//   /// [onTextStyleEdited] callback will be called every time [textStyle] has changed.
//   /// [onTextAlignEdited] callback will be called every time [textAlign] has changed.
//   /// [onCpasLockTaggle] callback will be called every time caps lock has changed to off or on.
//   /// [onToolbarActionChanged] callback will be called every time editor's tool has changed.
//   const StylesPicker({
//     required this.tc,
//     required this.ancestorHScrollController,
//     required this.ancestorVScrollController,
//     required this.fonts,
//     required this.arrowTypeF,
//     required this.animateArrowF,
//     required this.textStyleF,
//     required this.textAlignF,
//     required this.paletteColors,
//     this.initialTool = EditorToolbarAction.arrowTypeTool,
//     required this.onArrowTypePicked,
//     required this.onAnimateArrowToggled,
//     required this.onTextStyleEdited,
//     required this.onTextAlignEdited,
//     required this.onTargetSizeEdited,
//     required this.onTargetScaleEdited,
//     this.onToolbarActionChanged,
//     // required this.minimise,
//     super.key,
//   });
//
//   @override
//   StylesPickerState createState() => StylesPickerState();
// }
//
// class StylesPickerState extends State<StylesPicker> {
//   late bool minimise;
//   late EditorToolbarAction _currentTool;
//
//   @override
//   void initState() {
//     _currentTool = widget.initialTool;
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
//           Toolbar(
//             this,
//             initialTool: _currentTool,
//             onToolSelect: (action) {
//               setState(() => _currentTool = action);
//               if (widget.onToolbarActionChanged != null) {
//                 widget.onToolbarActionChanged!(action);
//               }
//             },
//           ),
//           const Divider(),
//           Container(
//             child: SingleChildScrollView(
//               child: () {
//                 // Choice tools
//                 switch (_currentTool) {
//                   case EditorToolbarAction.targetTool:
//                     return TargetTool(
//                       targetRadius: widget.tc.radius,
//                       scale: widget.tc.transformScale,
//                       onTargetSizeChanged: (newRadius) {
//                         widget.onTargetSizeEdited(newRadius);
//                         setState(() {
//                         });
//                       },
//                       onScaleChanged: (newScale) {
//                         widget.onTargetScaleEdited(newScale);
//                         setState(() {
//                         });
//                       },
//                     );
//                    case EditorToolbarAction.fontFamilyTool:
//                     return FontFamilyTool(
//                       fonts: widget.fonts,
//                       selectedFont: widget.textStyleF().fontFamily,
//                       onSelectFont: (fontFamily) {
//                         setState(() {
//                           widget.onTextStyleEdited(widget.textStyleF().copyWith(
//                                 fontFamily: fontFamily,
//                                 // package: widget.tc.bloc.state.localTestingFilePaths ? null : 'callout_api',
//                               ));
//                         });
//                       },
//                     );
//                   case EditorToolbarAction.arrowTypeTool:
//                     return ArrowTypeTool(
//                       arrowType: widget.arrowTypeF(),
//                       textStyle: widget.textStyleF(),
//                       animate: widget.animateArrowF(),
//                       onTypePicked: (arrowType) {
//                         setState(() {
//                           widget.onArrowTypePicked(arrowType);
//                         });
//                       },
//                       onAnimateArrowToggled: (newBool) {
//                         setState(() {
//                           widget.onAnimateArrowToggled(newBool);
//                         });
//                       },
//                     );
//                   case EditorToolbarAction.fontOptionTool:
//                     return TextFormatTool(
//                       bold: widget.textStyleF().fontWeight == FontWeight.bold,
//                       italic: widget.textStyleF().fontStyle == FontStyle.italic,
//                       textAlign: widget.textAlignF(),
//                       onTextFormatEdited: (bold, italic) {
//                         setState(() {
//                           widget.onTextStyleEdited(widget.textStyleF().copyWith(
//                                 fontWeight: bold ? FontWeight.bold : FontWeight.normal,
//                                 fontStyle: italic ? FontStyle.italic : FontStyle.normal,
//                               ));
//                         });
//                       },
//                       onTextAlignEdited: (align) {
//                         setState(() {
//                           widget.onTextAlignEdited(align);
//                         });
//                       },
//                     );
//                   case EditorToolbarAction.fontSizeTool:
//                     return FontSizeTool(
//                       fontSize: widget.textStyleF().fontSize ?? 0,
//                       letterHeight: widget.textStyleF().height ?? 1.2,
//                       letterSpacing: widget.textStyleF().letterSpacing ?? 1,
//                       fontWeight: widget.textStyleF().fontWeight?.index ?? 3,
//                       onFontSizeEdited: (
//                         fontSize,
//                         letterSpacing,
//                         letterHeight,
//                         fontWeight,
//                       ) {
//                         setState(() {
//                           widget.onTextStyleEdited(widget.textStyleF().copyWith(
//                                 fontSize: fontSize,
//                                 height: letterHeight,
//                                 letterSpacing: letterSpacing,
//                                 fontWeight: FontWeight.values[fontWeight.toInt()],
//                               ));
//                         });
//                       },
//                     );
//                   case EditorToolbarAction.fontColorTool:
//                     return FontColorTool(
//                       activeColor: widget.textStyleF().color,
//                       colors: widget.paletteColors,
//                       onColorPicked: (color) {
//                         setState(() {
//                           widget.onTextStyleEdited(widget.textStyleF().copyWith(color: color));
//                         });
//                       },
//                     );
//                   case EditorToolbarAction.backgroundColorTool:
//                     return BackgroundColorTool(
//                         activeColor: widget.textStyleF().backgroundColor,
//                         colors: widget.paletteColors,
//                         onColorPicked: (color) {
//                           setState(() {
//                             widget.onTextStyleEdited(widget.textStyleF().copyWith(backgroundColor: color));
//                           });
//                         });
//                   default:
//                     return Container();
//                 }
//               }(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// void removeStylesCallout() => fco.removeOverlay(CAPI.STYLES_CALLOUT.feature(), true);
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
//       child: StylesPicker(
//         // key: parentState.tseGK,
//         tc: tc,
//         ancestorHScrollController: ancestorHScrollC,
//         ancestorVScrollController: ancestorVScrollC,
//         fonts: const [
//           'OpenSansBold',
//           "OpenSansExtraBold",
//           'OpenSans',
//           'Roboto',
//         ],
//         arrowTypeF: () => tc.getArrowType(),
//         animateArrowF: () => tc.animateArrow,
//         textStyleF: () => TextStyle(
//           fontSize: tc.fontSize,
//           color: tc.textColor(),
//           backgroundColor: tc.calloutColor(),
//           fontFamily: tc.fontFamily,
//           // package: tc.bloc.state.localTestingFilePaths ? null : 'callout_api',
//           letterSpacing: tc.letterSpacing,
//           height: tc.letterHeight,
//         ),
//         textAlignF: () => tc.textAlign(),
//         paletteColors: [
//           Colors.white,
//           Colors.black,
//           Colors.yellow,
//           Colors.orange,
//           Colors.blue,
//           Colors.blue[900]!,
//           Colors.green,
//           Colors.purple,
//           Colors.red,
//           Colors.brown,
//           Colors.cyanAccent,
//           Colors.pink[50]!,
//         ],
//         onArrowTypePicked: (ArrowType newAT) {
//           tc.arrowType = newAT.index;
//           fco.refreshOverlay(CAPI.STYLES_CALLOUT.feature(), () {});
//           // parentState.stylesCallout?.refresh(() {});
//           // rerender text editor callout
//           removeTextEditorCallout();
//           fco.afterMsDelayDo(250, () {
//             showTextEditorCallout(tc, ancestorHScrollC, ancestorVScrollC);
//           });
//         },
//         onAnimateArrowToggled: (bool newBool) {
//           tc.animateArrow = newBool;
//           // rerender text editor callout
//           fco.refreshOverlay(CAPI.STYLES_CALLOUT.feature(), () {});
//           removeTextEditorCallout();
//           fco.afterMsDelayDo(50, () {
//             showTextEditorCallout(tc, ancestorHScrollC, ancestorVScrollC);
//           });
//         },
//         onTextAlignEdited: (TextAlign newTA) {
//           tc.setTextAlign(newTA);
//           fco.refreshOverlay(CAPI.STYLES_CALLOUT.feature(), () {});
//         },
//         onTextStyleEdited: (TextStyle newTS) {
//           tc.setTextStyle(newTS);
//           fco.refreshOverlay(CAPI.STYLES_CALLOUT.feature(), () {});
//           fco.refreshOverlay(CAPI.TEXT_CALLOUT.feature(), () {});
//           // removeTextEditorCallout();
//           // fco.afterMsDelayDo(50, () {
//           //   showTextEditorCallout(tc, ancestorScrollC);
//           // });
//         },
//         onTargetSizeEdited: (double newPc) {
//           tc.bloc.add(CAPIEvent.changedTargetRadius(tc: tc, newRadius: newPc));
//         },
//         onTargetScaleEdited: (double newScale) {
//           tc.bloc.add(CAPIEvent.changedTargetScale(tc: tc, newScale: newScale));
//         },
//         onToolbarActionChanged: (EditorToolbarAction newTBA) {},
//         initialTool: EditorToolbarAction.backgroundColorTool,
//         // minimise: isMinimised,
//       ),
//     ),
//     initialCalloutPos: stylesCalloutInitialPos(),
//     ignoreCalloutResult: true,
//     arrowType: ArrowType.NONE,
//   ).show(
//     notUsingHydratedStorage: true,
//   );
// }
