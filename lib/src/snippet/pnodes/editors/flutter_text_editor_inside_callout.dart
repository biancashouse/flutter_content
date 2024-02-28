// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_content/flutter_content.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
//
// class FlutterTextEditorInsideCallout extends HookWidget {
//   final String label;
//   final String originalText;
//   final String? helperText;
//   final EdgeInsets? padding;
//   final TextInputType textInputType;
//   final int numLines;
//   final bool skipLabelText;
//   final bool skipHelperText;
//   final ValueChanged<String> onDoneF;
//
//   const FlutterTextEditorInsideCallout({
//     required this.label,
//     required this.originalText,
//     this.skipLabelText = false,
//     this.skipHelperText = false,
//     this.helperText,
//     this.padding,
//     this.textInputType = TextInputType.multiline,
//     this.numLines = 1,
//     required this.onDoneF,
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     CalloutConfig? calloutConfig = Callout.findParentCalloutConfig(context);
//
//     if (calloutConfig == null) {
//       return Icon(Icons.warning, color: Colors.blueAccent);
//     }
//
//     useEffect(() {
//       // This function will be called once when the widget is first built.
//       // Simulating initState behavior here.
//       print('FlutterTextEditor initialized');
//       calloutConfig.teC ??= TextEditingController();
//       calloutConfig.focusNode ??= FocusNode();
//       return () {
//         // Clean-up function (optional) called when the widget is disposed.
//         print('FlutterTextEditor disposed');
//       };
//     }, []);
//
//     final focusTest = useFocusNode(
//         canRequestFocus: true,
//         onKeyEvent: (node, event) {
//           if ((textInputType == TextInputType.number || numLines == 1 || HardwareKeyboard.instance.isShiftPressed) &&
//               HardwareKeyboard.instance.isLogicalKeyPressed(LogicalKeyboardKey.enter)) {
//             node.unfocus();
//             onDoneF.call(calloutConfig.teC!.text);
//             return KeyEventResult.handled;
//           }
//           if (HardwareKeyboard.instance.isLogicalKeyPressed(LogicalKeyboardKey.escape)) {
//             // Do something
//             // Next 2 line needed If you don't want to update the text field with new line.
//             node.unfocus();
//             onDoneF.call(originalText);
//             return KeyEventResult.handled;
//           }
//           return KeyEventResult.ignored;
//         });
//
//     calloutConfig.teC?.text = originalText;
//
//     // calloutConfig.focusNode!.onKeyEvent = (node, event) {
//     //   print('calloutConfig.focusNode!.onKeyEvent');
//     //   if ((textInputType == TextInputType.number || numLines == 1 || HardwareKeyboard.instance.isShiftPressed) &&
//     //       HardwareKeyboard.instance.isLogicalKeyPressed(LogicalKeyboardKey.enter)) {
//     //     node.unfocus();
//     //     // onDoneF.call(calloutConfig.teC!.text);
//     //     return KeyEventResult.handled;
//     //   }
//     //   if (HardwareKeyboard.instance.isLogicalKeyPressed(LogicalKeyboardKey.escape)) {
//     //     // Do something
//     //     // Next 2 line needed If you don't want to update the text field with new line.
//     //     node.unfocus();
//     //     onDoneF.call(originalText);
//     //     return KeyEventResult.handled;
//     //   }
//     //   return KeyEventResult.ignored;
//     // };
//
//     return Container(
//       color: Colors.white,
//       padding: padding ?? EdgeInsets.all(8),
//       child: TextField(
//         maxLines: numLines == 1 ? numLines : null,
//         style: const TextStyle(fontSize: 16, fontFamily: 'monospace', color: Colors.black),
//         controller: calloutConfig.teC,
//         keyboardType: textInputType,
//         decoration: null,
//         // decoration: InputDecoration(
//         //   labelText: skipLabelText ? null : label,
//         //   labelStyle: skipLabelText ? null : Useful.enclosureLabelTextStyle,
//         //   helperText: skipHelperText ? null : helperText,
//         //   // border: const OutlineInputBorder(),
//         //   // isDense: true,
//         // ),
//         focusNode: focusTest,
//         //calloutConfig.focusNode!,
//         autofocus: false,
//         onEditingComplete: () {
//           onDoneF.call(calloutConfig.teC!.text);
//         },
//         onChanged: (s) {
//           if (textInputType == TextInputType.number && s.contains('.')) {
//             calloutConfig.teC!.text = s.replaceAll('.', '');
//           }
//         },
//         onTap: () {
//           // if (calloutConfig.focusNode?.canRequestFocus??false) {
//           //   calloutConfig.focusNode!.requestFocus();
//           // }
//           print('x');
//           // var state = Callout.of(context);
//           // Callout.preventParentCalloutDrag(context);
//         },
//         onTapOutside: (_) {
//           onDoneF.call(calloutConfig.teC!.text);
//         },
//       ),
//     );
//   }
// }
