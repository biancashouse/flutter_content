// import 'package:flutter/material.dart';
// import 'package:flutter_content/flutter_content.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
//
// class ZoomerSamplePage extends HookWidget {
//   const ZoomerSamplePage({super.key});
//
//   // https://github.com/flutter/flutter/issues/25827
//   @override
//   Widget build(BuildContext context) {
//     final zoomer = useState<Zoomer>(Zoomer(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: Center(
//           child: Image.asset(
//             'assets/images/top-cat-gang.png',
//             scale: 1.0,
//             width: double.infinity,
//             height: double.infinity,
//             fit: BoxFit.contain,
//             alignment: Alignment.center,
//             // package: 'flutter_content',
//           ),
//         ),
//       ),
//     ));
//
//     return ContentUseful().isAndroid
//         ? FutureBuilder<double?>(
//         future: _whenNotZero(
//           Stream<double>.periodic(const Duration(milliseconds: 50),
//                   (_) => MediaQuery.of(context).size.width),
//         ),
//         builder: (BuildContext context, snapshot) {
//           if (snapshot.hasData && (snapshot.data ?? 0) > 0) {
//             return zoomer.value;
//           }
//           return const CircularProgressIndicator(
//             color: Colors.orange,
//           );
//         })
//         : zoomer.value;
//   }
//
// // https://github.com/flutter/flutter/issues/25827
//   Future<double?> _whenNotZero(Stream<double> source) async {
//     await for (double value in source) {
//       if (value > 0) {
//         return value;
//       }
//     }
//     return null;
//     // stream exited without a true value, maybe return an exception.
//   }
// }
