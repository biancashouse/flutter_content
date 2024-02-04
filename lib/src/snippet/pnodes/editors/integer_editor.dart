// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_content/src/useful.dart';
//
// class IntegerEditor extends StatefulWidget {
//   final String? originalS;
//   final String label;
//   final String? helperText;
//   final Color textColor;
//   final Function(String) onChangedF;
//   final VoidCallback? onDoneF;
//
//   const IntegerEditor({
//     this.originalS,
//     required this.label,
//     this.helperText,
//     required this.onChangedF,
//     this.onDoneF,
//     this.textColor = Colors.black,
//     super.key,
//   });
//
//   @override
//   State<IntegerEditor> createState() => _IntegerEditorState();
// }
//
// class _IntegerEditorState extends State<IntegerEditor> {
//   late TextEditingController teC;
//
//   @override
//   void initState() {
//     super.initState();
//     teC = TextEditingController(text: widget.originalS ?? '');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       style: TextStyle(fontSize: 16, fontFamily: 'monospace', color: widget.textColor),
//       controller: teC,
//       keyboardType: TextInputType.number,
//       inputFormatters:<TextInputFormatter>[FilteringTextInputFormatter.digitsOnly], // Only numbers can be entered
//       decoration: InputDecoration(
//         labelText: widget.label,
//         labelStyle: Useful.enclosureLabelTextStyle,
//         helperText: widget.helperText,
//         border: const OutlineInputBorder(),
//         isDense: false,
//       ),
//       //focusNode: focusNode,
//       autofocus: true,
//       onEditingComplete: () => widget.onDoneF?.call(),
//       onChanged: (s) {
//         setState(() {
//           widget.onChangedF.call(s);
//         });
//         // tc.bloc.add(
//         //   CAPIEvent.forceRefresh(),
//         // );
//       },
//     );
//   }
// }
