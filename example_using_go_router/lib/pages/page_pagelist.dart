// import 'package:flutter/material.dart';
// import 'package:flutter_content/flutter_content.dart';
// import 'package:go_router/go_router.dart';
//
// class Pages extends StatefulWidget {
//   const Pages({super.key});
//
//   @override
//   State<Pages> createState() => _PagesState();
// }
//
// class _PagesState extends State<Pages> {
//   @override
//   Widget build(BuildContext context) {
//
//     final scaffold = Scaffold(
//       appBar: AppBar(
//         title: Text('Available Pages in this web app'),
//       ),
//       body: ListView.builder(
//         padding: EdgeInsets.all(30),
//         itemCount: fco.pagePaths.length,
//         itemBuilder: (context, index) {
//           final label = fco.pagePaths[index];
//           return Row(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               TextButton(
//                 onPressed: () {
//                   context.go(label);
//                 },
//                 child: Text(label),
//               ),
//               IconButton(
//                 onPressed: () {},
//                 icon: Icon(
//                   Icons.delete,
//                   color: Colors.red,
//                 ),
//               )
//             ],
//           );
//         },
//       ),
//     );
//
//     return ValueListenableBuilder<bool>(
//       valueListenable: fco.canEditContent,
//       builder: (context, value, child) {
//         bool showPencil = !value;
//         return Stack(
//           children: [
//             scaffold,
//             if (showPencil)
//               Align(
//                   alignment: AlignmentEnum.topRight,
//                   child: IconButton(
//                     onPressed: () {
//                       // ask user to sign in as editor
//                       setState(() {
//                         EditablePage.of(context)?.editorPasswordDialog();
//                       });
//                     },
//                     icon: Icon(Icons.edit, color: Colors.white),
//                   )),
//           ],
//         );
//       },
//       child: scaffold,
//     );
//
//   }
// }
