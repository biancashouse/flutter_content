// import 'package:flutter/material.dart';
// import 'package:flutter_content/flutter_content.dart';
// import 'package:flutter_content/src/target_config/content/features.dart';
// import 'package:flutter_content/src/target_config/content/snippet_editor/node_properties/decimal_editor.dart';
// import 'package:flutter_content/src/target_config/content/snippet_editor/node_properties/node_text_style.dart';
// import 'package:flutter_content/src/target_config/content/snippet_editor/node_properties/node_property_callout_button.dart';
// import 'package:flutter_content/src/target_config/content/snippet_editor/node_properties/string_editor.dart';
//
// class NodePropertyButtonStyleFontSize extends StatefulWidget {
//   final String label;
//   final NodeTextStyle? originalStyle;
//   final Function(NodeTextStyle) onChangeF;
//
//   const NodePropertyButtonStyleFontSize({required this.label, required this.originalStyle, required this.onChangeF, super.key});
//
//   @override
//   State<NodePropertyButtonStyleFontSize> createState() => _NodePropertyButtonStyleFontSizeState();
// }
//
// class _NodePropertyButtonStyleFontSizeState extends State<NodePropertyButtonStyleFontSize> {
//   late GlobalKey propertyBtnGK;
//   late List<TextStyle?> themeTextStyles;
//   late TextTheme theme;
//
//   @override
//   void initState() {
//     super.initState();
//     propertyBtnGK = GlobalKey();
//
//     String fontFamily = widget.originalStyle?.fontFamily ?? "Roboto";
//
//     theme = TextTheme(
//       displayLarge: TextStyle(fontFamily: fontFamily, color: Colors.black, decoration: TextDecoration.none),
//       displayMedium: TextStyle(fontFamily: fontFamily, color: Colors.black, decoration: TextDecoration.none),
//       displaySmall: TextStyle(fontFamily: fontFamily, color: Colors.black, decoration: TextDecoration.none),
//       headlineLarge: TextStyle(fontFamily: fontFamily, color: Colors.black, decoration: TextDecoration.none),
//       headlineMedium: TextStyle(fontFamily: fontFamily, color: Colors.black, decoration: TextDecoration.none),
//       headlineSmall: TextStyle(fontFamily: fontFamily, color: Colors.black, decoration: TextDecoration.none),
//       titleLarge: TextStyle(fontFamily: fontFamily, color: Colors.black, decoration: TextDecoration.none),
//       titleMedium: TextStyle(fontFamily: fontFamily, color: Colors.black, decoration: TextDecoration.none),
//       titleSmall: TextStyle(fontFamily: fontFamily, color: Colors.black, decoration: TextDecoration.none),
//       bodyLarge: TextStyle(fontFamily: fontFamily, color: Colors.black, decoration: TextDecoration.none),
//       bodyMedium: TextStyle(fontFamily: fontFamily, color: Colors.black, decoration: TextDecoration.none),
//       bodySmall: TextStyle(fontFamily: fontFamily, color: Colors.black, decoration: TextDecoration.none),
//       labelLarge: TextStyle(fontFamily: fontFamily, color: Colors.black, decoration: TextDecoration.none),
//       labelMedium: TextStyle(fontFamily: fontFamily, color: Colors.black, decoration: TextDecoration.none),
//       labelSmall: TextStyle(fontFamily: fontFamily, color: Colors.black, decoration: TextDecoration.none),
//     );
//
//     themeTextStyles = [
//       theme.displayLarge,
//       theme.displayMedium,
//       theme.displaySmall,
//       theme.headlineLarge,
//       theme.headlineMedium,
//       theme.headlineSmall,
//       theme.titleLarge,
//       theme.titleMedium,
//       theme.titleSmall,
//       theme.bodyLarge,
//       theme.bodyMedium,
//       theme.bodySmall,
//       theme.labelLarge,
//       theme.labelMedium,
//       theme.labelSmall
//     ];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Widget fontSizeLabel = widget.originalStyle?.fontSize != null
//         ? Text('style.fontSize: ${widget.originalStyle!.fontSize!.toStringAsFixed(2)}', style: const TextStyle(color: Colors.white))
//         : const Text('style.fontSize...', style: TextStyle(color: Colors.white));
//     return NodePropertyCalloutButton(
//       label: fontSizeLabel,
//       calloutContents: (ctx) {
//         return Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Center(
//             child: DecimalEditor(
//               label: 'font size',
//               helperText: 'px',
//               originalS: widget.originalStyle?.fontSize?.toStringAsFixed(2).toString() ?? '',
//               onChangedF: (s) {
//                 NodeTextStyle? style = widget.originalStyle;
//                 if (style != null) {
//                   style.fontSize = double.tryParse(s);
//                 } else {
//                   style = NodeTextStyle(fontSize: double.tryParse(s));
//                 }
//                 widget.onChangeF.call(style);
//               },
//               onDoneF: () {
//                 Useful.afterMsDelayDo(500, () {
//                   Callout.removeOverlay(NODE_PROPERTY_CALLOUT_BUTTON);
//                 });
//               },
//             ),
//           ),
//         );
//       },
//       calloutSize: const Size(140, 80),
//     );
//   }
// }
