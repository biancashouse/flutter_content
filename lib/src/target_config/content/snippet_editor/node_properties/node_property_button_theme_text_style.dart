// import 'package:flutter/material.dart';
// import 'package:flutter_content/src/target_config/content/snippet_editor/node_properties/node_property_callout_button.dart';
//
// import 'enums/enum_material3_text_size.dart';
//
// class NodePropertyButtonfontSizeName extends StatefulWidget {
//   final String label;
//   final Material3TextSizeEnum? originalName;
//   final Function(String) onChangeF;
//
//   const NodePropertyButtonfontSizeName(
//       {required this.label, this.originalName, required this.onChangeF, super.key});
//
//   @override
//   State<NodePropertyButtonfontSizeName> createState() => _NodePropertyButtonfontSizeNameState();
// }
//
// class _NodePropertyButtonfontSizeNameState extends State<NodePropertyButtonfontSizeName> {
//   late GlobalKey propertyBtnGK;
//   late TextTheme theme;
//
//   @override
//   void initState() {
//     super.initState();
//     propertyBtnGK = GlobalKey();
//
//     // theme = TextTheme(
//     //   displayL: TextStyle(
//     //     fontFamily: fontFamily,
//     //     color: Colors.black,
//     //     decoration: TextDecoration.none,
//     //   ),
//     //   displayMedium: TextStyle(
//     //     fontFamily: fontFamily,
//     //     color: Colors.black,
//     //     decoration: TextDecoration.none,
//     //   ),
//     //   displaySmall: TextStyle(
//     //     fontFamily: fontFamily,
//     //     color: Colors.black,
//     //     decoration: TextDecoration.none,
//     //   ),
//     //   headlineLarge: TextStyle(
//     //     fontFamily: fontFamily,
//     //     color: Colors.black,
//     //     decoration: TextDecoration.none,
//     //   ),
//     //   headlineMedium: TextStyle(
//     //     fontFamily: fontFamily,
//     //     color: Colors.black,
//     //     decoration: TextDecoration.none,
//     //   ),
//     //   headlineSmall: TextStyle(
//     //     fontFamily: fontFamily,
//     //     color: Colors.black,
//     //     decoration: TextDecoration.none,
//     //   ),
//     //   titleLarge: TextStyle(
//     //     fontFamily: fontFamily,
//     //     color: Colors.black,
//     //     decoration: TextDecoration.none,
//     //   ),
//     //   titleMedium: TextStyle(
//     //     fontFamily: fontFamily,
//     //     color: Colors.black,
//     //     decoration: TextDecoration.none,
//     //   ),
//     //   titleSmall: TextStyle(
//     //     fontFamily: fontFamily,
//     //     color: Colors.black,
//     //     decoration: TextDecoration.none,
//     //   ),
//     //   bodyLarge: TextStyle(
//     //     fontFamily: fontFamily,
//     //     color: Colors.black,
//     //     decoration: TextDecoration.none,
//     //   ),
//     //   bodyMedium: TextStyle(
//     //     fontFamily: fontFamily,
//     //     color: Colors.black,
//     //     decoration: TextDecoration.none,
//     //   ),
//     //   bodySmall: TextStyle(
//     //     fontFamily: fontFamily,
//     //     color: Colors.black,
//     //     decoration: TextDecoration.none,
//     //   ),
//     //   labelLarge: TextStyle(
//     //     fontFamily: fontFamily,
//     //     color: Colors.black,
//     //     decoration: TextDecoration.none,
//     //   ),
//     //   labelMedium: TextStyle(
//     //     fontFamily: fontFamily,
//     //     color: Colors.black,
//     //     decoration: TextDecoration.none,
//     //   ),
//     //   labelSmall: TextStyle(
//     //     fontFamily: fontFamily,
//     //     color: Colors.black,
//     //     decoration: TextDecoration.none,
//     //   ),
//     // );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     ThemeData? themeData = Theme.of(context);
//     // String fontFamily = widget.originalName?.flutterTextStyle(themeData:themeData)?.fontFamily ?? "Roboto";
//
//     Widget label = widget.originalName != null
//         ? Text('theme.textStyle: ${widget.originalName?.toMenuItem(themeData)}', style: const TextStyle(color: Colors.white))
//         : const Text('theme.textStyle...', style: TextStyle(color: Colors.white));
//     return NodePropertyCalloutButton(
//       label: label,
//       calloutContents: (ctx) {
//         return Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Center(
//             child: Container(),
//           ),
//         );
//       },
//       calloutSize: const Size(140, 80),
//     );
//   }
// }
