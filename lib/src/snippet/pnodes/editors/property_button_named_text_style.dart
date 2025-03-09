// import 'package:flutter/material.dart';
// import 'package:flutter_content/flutter_content.dart';
// import 'package:flutter_content/src/snippet/pnodes/editors/property_callout_button.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class PropertyButtonNamedTextStyle extends StatefulWidget {
//   final String? originalNamedStyle;
//   final Color menuBgColor;
//   final Function(String?) onChangeF;
//   final ScrollControllerName? scName;
//
//   const PropertyButtonNamedTextStyle({
//     required this.originalNamedStyle,
//     required this.menuBgColor,
//     required this.onChangeF,
//     required this.scName,
//     super.key,
//   });
//
//   @override
//   State<PropertyButtonNamedTextStyle> createState() =>
//       _PropertyButtonNamedTextStyleState();
// }
//
// class _PropertyButtonNamedTextStyleState
//     extends State<PropertyButtonNamedTextStyle> {
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
//       widget.originalNamedStyle != null ? widget.originalNamedStyle! : '...',
//       color: Colors.white,
//     );
//     return PropertyCalloutButton(
//       cId: 'named-text-style',
//       scName: widget.scName,
//       notifier: ValueNotifier<int>(0),
//       labelWidget: namedStyleLabel,
//       calloutButtonSize: const Size(200, 40),
//       menuBgColor: widget.menuBgColor,
//       calloutContents: (ctx) {
//         return IntrinsicWidth(
//           child: SingleChildScrollView(
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 mainAxisSize: MainAxisSize.max,
//                 children: fco.namedTextStyles.keys.map((textStyleName) {
//                   return RadioListTile<String>(
//                     fillColor:
//                         WidgetStatePropertyAll<Color?>(widget.menuBgColor),
//                     dense: true,
//                     value: textStyleName,
//                     groupValue: widget.originalNamedStyle,
//                     // tileColor: Colors.purpleAccent,
//                     title: Text(
//                       textStyleName,
//                       softWrap: false,
//                       style: fco.namedTextStyles[textStyleName]
//                           ?.toTextStyle(context),
//                       overflow: TextOverflow.clip,
//                     ),
//                     toggleable: true,
//                     onChanged: (newTextStyleName) {
//                       widget.onChangeF.call(newTextStyleName);
//                       fco.dismiss('named-text-style');
//                       // fco.afterMsDelayDo(500, () {
//                       //   fco.dismiss(NODE_PROPERTY_CALLOUT_BUTTON);
//                       // });
//                     },
//                   );
//                 }).toList()),
//           ),
//         );
//       },
//       calloutSize: Size(240, 700),
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
