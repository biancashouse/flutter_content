// import 'package:flutter/material.dart';
// import 'package:passwordfield/passwordfield.dart';

// class Password extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         FocusScope.of(context).unfocus();
//       },
//       child: Container(
//         width: 200, height: 60,
//         child: PasswordField(
//           backgroundColor: Colors.white,
//           controller: TextEditingController(text: ''),
//           errorMessage: 'required at least 1 letter and number 5+ chars',
//           // passwordConstraint: r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{5,}$',
//           passwordDecoration: PasswordDecoration(
//             inputPadding: const EdgeInsets.symmetric(horizontal: 10),
//             suffixIcon: const Icon(
//
//               color: Colors.grey,
//             ),
//             inputStyle: const TextStyle(
//                 fontSize: 24,
//                 color: Colors.blueAccent
//             ),
//           ),
//           hintText: 'Password',
//           onChanged: (s) {
//             print(s);
//           },
//           border: PasswordBorder(
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: BorderSide(width: 2, color: Colors.grey),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: BorderSide(width: 2, color: Colors.grey),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: BorderSide(width: 2, color: Colors.black),
//             ),
//             focusedErrorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: BorderSide(width: 2, color: Colors.red.shade200),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
