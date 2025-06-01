// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// 
// import 'package:flutter_content/flutter_content.dart';
//
// class InputEa extends StatefulWidget {
//   final ValueChanged<String> onValidEmailF;
//
//   const InputEa({required this.onValidEmailF, super.key});
//
//   @override
//   _InputEaState createState() => _InputEaState();
// }
//
// class _InputEaState extends State<InputEa> {
//   FocusNode? _focusNode;
//   late TextEditingController _eaController;
//
//   @override
//   void initState() {
//     super.initState();
//     _focusNode = FocusNode();
//     _eaController = TextEditingController();
//     fco.afterNextBuildDo(() {
//       Future.delayed(Duration.zero, () {
//         _focusNode?.requestFocus();
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     _focusNode?.dispose();
//     _eaController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 400,
//       height: 200,
//       color: Colors.white,
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(18.0),
//             child: TextField(
//               enabled: true,
//               controller: _eaController,
//               onSubmitted: (s) {
//                 if (kIsWeb) _verifyButtonPressed();
//               },
//               onChanged: (s) {
//                 //showGmailSignInButton = (s.endsWith('@gmail.com'));
//                 setState(() {});
//               },
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: 'Your Email Address please',
//               ),
//               autofocus: true,
//               focusNode: _focusNode,
//               maxLines: 1,
//               style: TextStyle(
//                   fontSize: 18,
//                   fontFamily: 'monospace',
//                   color: _eaController!.text.isEmpty ||
//                       fco.emailIsValid(_eaController!.text)
//                       ? Colors.blue[900]
//                       : Colors.red,
//                   fontWeight: _eaController!.text.isEmpty ||
//                       fco.emailIsValid(_eaController!.text)
//                       ? FontWeight.w400
//                       : FontWeight.w900,
//                   background: fco.whiteBgPaint),
//             ),
//           ),
//           //fco.gap(20),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: ElevatedButton(
//               style: fco.raisedButtonStyle(
//                 padding: EdgeInsets.symmetric(horizontal: 20.0),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(24.0)),
//                 elevation: fco.emailIsValid(_eaController!.text) ? 10 : 2,
//                 backgroundColor: fco.emailIsValid(_eaController!.text)
//                     ? Colors.yellow
//                     : Colors.white,
//               ),
//               child: Text(
//                 'submit',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     fontSize: 14,
//                     color: fco.emailIsValid(_eaController.text)
//                         ? Colors.green
//                         : Colors.grey.withValues(alpha:.8)),
//               ),
//               onPressed: () {
//                 _verifyButtonPressed();
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Future<void> _verifyButtonPressed() async {
//     // gmail shortcut
//     // if (!_eaController.text.contains('@'))
//     //   _eaController.text = '${_eaController.text}@gmail.com';
//     if (fco.emailIsValid(_eaController.text)) {
//       widget.onValidEmailF(_eaController.text);
//     } else {
//       fco.showToast(
//         calloutConfig: CalloutConfigModel(
//           cId: 'not-a-valid-ea',
//           fillColor: Colors.red,
//           gravity: AlignmentEnum.topCenter,
//           initialCalloutW: 450,
//           initialCalloutH: 50,
//         ),
//         calloutContent: fco.coloredText("Please enter a valid email address",
//             color: Colors.yellow),
//         removeAfterMs: 2000,
//       );
//     }
//   }
//
// }