// import 'package:flutter/material.dart';
// import 'package:flutter_content/flutter_content.dart';
// import 'package:flutter_content/src/snippet/pnodes/editors/property_callout_button.dart';
// import 'package:flutter_content/src/snippet/pnodes/editors/property_callout_button_T.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class PropertyButtonTextStyleName extends StatefulWidget {
//   final String? originalName;
//   final Color? menuBgColor;
//   final Function(String?) onChangeF;
//   final ScrollControllerName? scName;
//
//   const PropertyButtonTextStyleName({
//     required this.originalName,
//     this.menuBgColor,
//     required this.onChangeF,
//     required this.scName,
//     super.key,
//   });
//
//   @override
//   State<PropertyButtonTextStyleName> createState() =>
//       _PropertyButtonTextStyleNameState();
// }
//
// class _PropertyButtonTextStyleNameState
//     extends State<PropertyButtonTextStyleName> {
//   late GlobalKey propertyBtnGK;
//
//   @override
//   void initState() {
//     super.initState();
//     propertyBtnGK = GlobalKey();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Widget namedStyleLabel = fco.coloredText(
//       widget.originalName != null ? widget.originalName! : '...',
//       color: Colors.white,
//       fontSize: 14,
//     );
//     CalloutConfig config = CalloutConfigModel(
//       cId: 'named-text-style',
//       initialCalloutW: calloutSize.width,
//       initialCalloutH: calloutSize.height,
//       arrowType: ArrowTypeEnum.NONE,
//       // arrowColor: Colors.blueAccent,
//       fillColor: menuBgColor,
//       //alwaysReCalcSize: true,
//       initialTargetAlignment: initialTargetAlignment ?? Alignment.center,
//       initialCalloutAlignment: initialCalloutAlignment ?? Alignment.center,
//       draggable: draggable ?? true,
//       onDragStartedF: () {
//         // FCO.capiBloc.selectedNode?.hidePropertiesWhileDragging = true;
//       },
//       onDragEndedF: (_) {
//         // FCO.capiBloc.selectedNode?.hidePropertiesWhileDragging = false;
//       },
//       movedOrResizedNotifier: notifier,
//       barrier: CalloutBarrierConfig(
//         opacity: .1,
//         onTappedF: () async {
//           // FCO.capiBloc.selectedNode?.hidePropertiesWhileDragging = false;
//           fco.dismiss(cId);
//         },
//       ),
//       containsTextField: true,
//       resizeableH: true,
//       resizeableV: true,
//       borderRadius: 16,
//       onDismissedF: onDismissedF,
//       scrollControllerName: widget.scName,
//     );
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: WrappedCallout(
//         calloutConfig: config,
//         calloutBoxSnippetBuilderF: (ctx) => calloutContents(ctx),
//         targetChangedNotifier: ValueNotifier<int>(0),
//         targetBuilderF: (ctx) => GestureDetector(
//           onTap: (){
//             fco.unhideParentCallout(ctx, animateSeparation: false);
//           },
//           child: Container(
//             // key: propertyBtnGK,
//             // margin: const EdgeInsets.only(top: 8),
//             width: calloutButtonSize.width,
//             height: calloutButtonSize.height,
//             // padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//             color: Colors.purpleAccent,
//             alignment: alignment,
//             child: labelWidget ?? (label != null ? fco.coloredText(label!, color: Colors.white, ) : const Offstage()),
//           ),
//         ),
//       ),
//       PropertyCalloutButton(
//         cId: 'named-text-style',
//         scName: widget.scName,
//         notifier: ValueNotifier<int>(0),
//         labelWidget: namedStyleLabel,
//         alignment: Alignment.center,
//         calloutButtonSize: const Size(100, 40),
//         menuBgColor: widget.menuBgColor ?? Colors.purple,
//         // calloutContents: (ctx) {
//         //   return IntrinsicWidth(
//         //     child: SingleChildScrollView(
//         //       child:
//         //       PropertyButton<String>(
//         //         // originalText: (stringValue??'').isNotEmpty
//         //         //     ? nameOnSeparateLine
//         //         //     ? '$name: \n$stringValue'
//         //         //     : '$name: $stringValue'
//         //         //     : '$name...',
//         //         originalText: widget.originalName != null ? widget.originalName! : '...',
//         //         options: fco.namedTextStyles.keys.toList(),
//         //         label: 'textStyle',
//         //         maxLines: 10,
//         //         expands: true,
//         //         skipLabelText: false,
//         //         skipHelperText: false,
//         //         // textInputType: const TextInputType.numberWithOptions(decimal: true),
//         //         calloutButtonSize: const Size(100, 40),
//         //         calloutSize: const Size(240, 700),
//         //         // calloutSize: calloutSize,
//         //         propertyBtnGK: GlobalKey(debugLabel: ''),
//         //         onChangeF: (s) {
//         //           fco.dismiss('matches');
//         //           fco.dismiss('te');
//         //           widget.onChangeF(s);
//         //         },
//         //         scName: widget.scName,
//         //       ),
//         //       // Column(
//         //       //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         //       //     mainAxisSize: MainAxisSize.max,
//         //       //     children: fco.namedTextStyles.keys.map((textStyleName) {
//         //       //       return RadioListTile<String>(
//         //       //         fillColor:
//         //       //             WidgetStatePropertyAll<Color?>(widget.menuBgColor),
//         //       //         dense: true,
//         //       //         value: textStyleName,
//         //       //         groupValue: widget.originalName,
//         //       //         // tileColor: Colors.purpleAccent,
//         //       //         title: Text(
//         //       //           textStyleName,
//         //       //           softWrap: false,
//         //       //           style: fco.namedTextStyles[textStyleName]
//         //       //               ?.toTextStyle(context),
//         //       //           overflow: TextOverflow.clip,
//         //       //         ),
//         //       //         toggleable: true,
//         //       //         onChanged: (newTextStyleName) {
//         //       //           widget.onChangeF.call(newTextStyleName);
//         //       //           fco.dismiss('named-text-style');
//         //       //           // fco.afterMsDelayDo(500, () {
//         //       //           //   fco.dismiss(NODE_PROPERTY_CALLOUT_BUTTON);
//         //       //           // });
//         //       //         },
//         //       //       );
//         //       //     }).toList()),
//         //     ),
//         //   );
//         // },
//         calloutSize: Size(240, 700),
//       ),
//     );
//   }
//
//   TextStyle googleFontTextStyle(
//     context, {
//     required String fontFamily,
//     Color? color,
//     double? fontSize,
//     Material3TextSizeEnum? fontSizeName,
//     FontStyle? fontStyle,
//     FontWeight? fontWeight,
//     double? lineHeight,
//     double? letterSpacing,
//   }) =>
//       GoogleFonts.getFont(
//         fontFamily,
//         color: color,
//         textStyle:
//             fontSizeName?.materialTextStyle(themeData: Theme.of(context)),
//         fontSize: fontSize,
//         fontStyle: fontStyle,
//         fontWeight: fontWeight,
//         height: lineHeight,
//         letterSpacing: letterSpacing,
//       );
// }
