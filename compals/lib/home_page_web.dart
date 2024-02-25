// import 'package:flutter/material.dart';
// import 'package:flutter_content/flutter_content.dart';
// import 'package:hydrated_bloc/hydrated_bloc.dart';
// import 'package:passwordfield/passwordfield.dart';
//
// class HomePageWeb extends StatefulWidget {
//   const HomePageWeb({super.key});
//
//   @override
//   _HomePageWebState createState() => _HomePageWebState();
// }
//
// class _HomePageWebState extends State<HomePageWeb> with SingleTickerProviderStateMixin {
//   GlobalKey? _lockIconGK = GlobalKey(debugLabel: 'lock-icon'); //will go null after user tap bianca
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   // https://github.com/flutter/flutter/issues/25827
//   @override
//   Widget build(BuildContext context) {
//     Useful.instance.initWithContext(context);
//     return Useful.isAndroid ? _buildAndroid(context) : _build(context);
//   }
//
//   // wait for android to register screen size
//   Widget _buildAndroid(BuildContext context) => FutureBuilder<double?>(
//       future: _whenNotZero(
//         Stream<double>.periodic(const Duration(milliseconds: 50), (_) => MediaQuery.of(context).size.width),
//       ),
//       builder: (BuildContext context, snapshot) {
//         if (snapshot.hasData && (snapshot.data ?? 0) > 0) {
//           return _build(context);
//         }
//         return const CircularProgressIndicator(
//           color: Colors.orange,
//         );
//       });
//
//   // Widget _build(BuildContext context) {
//   //   return Scaffold(
//   //     backgroundColor: Colors.black,
//   //     body: C_SnippetPanel(sName: 'compals-home'),
//   //   );
//   // }
//
//   Widget _build(BuildContext context) {
//     bool signedInAsTrainer = HydratedBloc.storage.read("trainerIsSignedIn") ?? false;
//
//     return TransformableScaffold(
//       scaffoldBody: () => Scaffold(
//         backgroundColor: Colors.white,
//         body: Center(
//           child: Column(
//             children: [
//               Padding(
//                 padding: EdgeInsets.all(18),
//                 child: Row(
//                   children: [
//                     Expanded(
//                         flex: 11,
//                         child: Padding(
//                           padding: const EdgeInsets.all(28.0),
//                           child: AspectRatio(aspectRatio: 987 / 207, child: Image.asset('images/bridging-the-gap-logo.jpeg', fit: BoxFit.cover)),
//                         )),
//                     Expanded(flex: 2, child: AspectRatio(aspectRatio: 558 / 642, child: Image.asset('images/tramshed-map.png'))),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: SizedBox(
//                   //height: 70,
//                   child: Row(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       if (!signedInAsTrainer) C_SnippetPanel(sName: 'compals-home-menu'),
//                       if (signedInAsTrainer) Expanded(child: C_SnippetPanel(sName: 'compals-trainer-menu')),
//                       if (!signedInAsTrainer)
//                         IconButton(
//                           key: _lockIconGK,
//                           onPressed: () {
//                             Callout(
//                               feature: "TrainerPassword",
//                               targetGKF: () => _lockIconGK,
//                               contents: () => Column(
//                                 mainAxisSize: MainAxisSize.max,
//                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Useful.purpleText("Trainer Access", fontSize: 24, family: 'Merriweather'),
//                                   SizedBox(
//                                     width: 200,
//                                     height: 100,
//                                     child: TextEditor(
//                                       prompt: 'password',
//                                       originalS: '',
//                                       onTextChangedF: (s) {
//                                         if (s == "lakebeachocean") {
//                                           CalloutNew.removeOverlay("TrainerPassword");
//                                           setState(() {
//                                             HydratedBloc.storage.write("trainerIsSignedIn", true);
//                                           });
//                                         }
//                                       },
//                                       focusNode: FocusNode(),
//                                       dontAutoFocus: false,
//                                       isPassword: true,
//                                       expands: false,
//                                       onEditingCompleteF: (s) {
//                                         // if (s == "lakebeachocean") {
//                                         //   Useful.om.remove("TrainerPassword".hashCode);
//                                         //   setState(() {
//                                         //     HydratedBloc.storage.write("trainerIsSignedIn", true);
//                                         //   });
//                                         // }
//                                       },
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               initialTargetAlignment: Alignment.bottomLeft,
//                               initialCalloutAlignment: Alignment.topRight,
//                               separation: 150,
//                               barrierOpacity: .5,
//                               onBarrierTappedF: () async {
//                                 CalloutNew.removeOverlay("TrainerPassword");
//                               },
//                               widthF: () => 240,
//                               heightF: () => 150,
//                               roundedCorners: 12,
//                               color: Colors.white,
//                             ).show();
//                           },
//                           icon: Icon(
//                             Icons.lock,
//                             color: Colors.blueAccent,
//                           ),
//                           iconSize: 36,
//                           tooltip: 'trainer login...',
//                         ),
//                       // SizedBox(width: 250, height: 50, child: Password()),
//                     ],
//                   ),
//                 ),
//               ),
//               //Expanded(child: C_SnippetPanel(sName: 'compals-home')),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   _password() => PasswordField(
//         color: Colors.blue,
//         passwordConstraint: r'.*[@$#.*].*',
//         passwordDecoration: PasswordDecoration(),
//         hintText: 'must have special characters',
//         border: PasswordBorder(
//           border: OutlineInputBorder(
//             borderSide: BorderSide(
//               color: Colors.blue.shade100,
//             ),
//             borderRadius: BorderRadius.circular(12),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//               color: Colors.blue.shade100,
//             ),
//             borderRadius: BorderRadius.circular(12),
//           ),
//           focusedErrorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12),
//             borderSide: BorderSide(width: 2, color: Colors.red.shade200),
//           ),
//         ),
//         errorMessage: 'must contain special character either . * @ # \$',
//       );
//
// // https://github.com/flutter/flutter/issues/25827
//   Future<double?> _whenNotZero(Stream<double> source) async {
//     await for (double value in source) {
//       if (value > 0) {
//         return value;
//       }
//     }
//     // stream exited without a true value, maybe return an exception.
//   }
// }
