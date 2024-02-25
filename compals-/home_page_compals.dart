// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_content/flutter_content.dart';
// import 'package:hydrated_bloc/hydrated_bloc.dart';
//
// class HomePageWeb extends StatefulWidget {
//   const HomePageWeb({super.key});
//
//   @override
//   _HomePageWebState createState() => _HomePageWebState();
// }
//
// class _HomePageWebState extends State<HomePageWeb> with SingleTickerProviderStateMixin {
//   final GlobalKey _lockIconGK = GlobalKey(debugLabel: 'lock-icon'); //will go null after user tap bianca
//   late ValueNotifier<int> notifier;
//   ScrollController sc = ScrollController();
//   static const String TRAINER_PASSWORD_CALLOUT = 'trainer-passowrd';
//   static const String POINT_OUT_TRAINER_PASSWORD_CALLOUT = 'point-out-trainer-passowrd';
//
//   @override
//   void initState() {
//     super.initState();
//
//     notifier = ValueNotifier<int>(0);
//
//     Useful.afterNextBuildDo(() {
//       Callout.showOverlay(
//         calloutConfig: CalloutConfig(
//           feature: POINT_OUT_TRAINER_PASSWORD_CALLOUT,
//           suppliedCalloutW: 100,
//           suppliedCalloutH: 100,
//           color: Colors.white,
//           initialCalloutAlignment: Alignment.centerRight,
//           initialTargetAlignment: Alignment.centerLeft,
//           finalSeparation: 50,
//           roundedCorners: 16,
//           animate: true,
//           arrowColor: Colors.blue,
//           onResize: (newSize) => print("newSize: ${newSize.toString()}"),
//         ),
//         boxContentF: (builder) => Container(
//           width: 500,
//           height: 100,
//           padding: const EdgeInsets.all(18.0),
//           child: Useful.coloredText('Trainers\nSign in\nHere', color: Colors.black),
//         ),
//         targetGkF: () => _lockIconGK,
//         removeAfterMs: 2000,
//       );
//     });
//   }
//
//   // https://github.com/flutter/flutter/issues/25827
//   @override
//   Widget build(BuildContext context) {
//     // a 3s press of Esc enables the editMode FAB to appear on the screen
//     return MaterialAppWrapper.escKeyPressedZFor3Secs
//         ? Useful.isAndroid
//             ? _buildAndroid(context)
//             : _build(context)
//         : Useful.isAndroid
//             ? _buildAndroid(context)
//             : _build(context);
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
//   //     body: SnippetPanel(sName: 'compals-home'),
//   //   );
//   // }
//
//   // Widget _testWidget(BuildContext context) {
//   //   return Center(
//   //     child: Container(
//   //       width: 100,
//   //       height: 40,
//   //       color: Colors.cyan.shade50,
//   //       child: Callout.wrapTarget(
//   //         calloutConfig: CalloutConfig(
//   //           feature: 'OUTER',
//   //           color: Colors.white,
//   //           initialCalloutAlignment: Alignment.bottomRight,
//   //           initialTargetAlignment: Alignment.topLeft,
//   //           finalSeparation: 200,
//   //           roundedCorners: 16,
//   //           animate: true,
//   //           arrowColor: Colors.blue,
//   //           resizeableV: true,
//   //           resizeableH: true,
//   //           movedOrResizedNotifier: notifier,
//   //           barrier: CalloutBarrier(opacity: .1),
//   //         ),
//   //         calloutBoxContentBuilderF: (ctx) => SizedBox(
//   //             width: 200,
//   //             height: 100,
//   //             child: Container(
//   //               color: Colors.green,
//   //               child: Callout.wrapTarget(
//   //                 calloutConfig: CalloutConfig(
//   //                   feature: 'INNER',
//   //                   color: Colors.white,
//   //                   initialCalloutAlignment: Alignment.topRight,
//   //                   initialTargetAlignment: Alignment.bottomLeft,
//   //                   finalSeparation: 200,
//   //                   roundedCorners: 24,
//   //                   animate: true,
//   //                   arrowColor: Colors.brown,
//   //                   barrier: CalloutBarrier(opacity: .1),
//   //                 ),
//   //                 calloutBoxContentBuilderF: (ctx) => SizedBox(
//   //                     width: 50,
//   //                     height: 50,
//   //                     child: Container(
//   //                       color: Colors.brown,
//   //                     )),
//   //                 calloutTargetBuilderF: (ctx) => Builder(builder: (builderCtx) {
//   //                   return SizedBox(width: 80, height: 40,
//   //                     child: TextButton(
//   //                         onPressed: () {
//   //                           CalloutState? state = Callout.of(builderCtx);
//   //                           state?.toggle();
//   //                         },
//   //                         child: Text('Press Me...')),
//   //                   );
//   //                 }),
//   //                 targetChangedNotifier: notifier,
//   //               ),
//   //             )),
//   //         calloutTargetBuilderF: (ctx) => Builder(builder: (builderCtx) {
//   //           return SizedBox(width: 80, height: 40,
//   //             child: TextButton(
//   //                 onPressed: () {
//   //                   CalloutState? state = Callout.of(builderCtx);
//   //                   state?.toggle();
//   //                 },
//   //                 child: Text('Press Me...')),
//   //           );
//   //         }),
//   //       ),
//   //     ),
//   //   );
//   // }
//
//   Widget _build(BuildContext context) {
//     bool signedInAsTrainer = HydratedBloc.storage.read("trainerIsSignedIn") ?? false;
//
//     return TransformableScaffold(
//       scaffoldBody: () => Scaffold(
//         backgroundColor: Colors.white,
//         // press escape for 3s to trigger editmode dialogue
//         body: Center(
//           child: Column(
//             children: [
//               // Callout.wrapTarget(
//               //   calloutConfig: CalloutConfig(
//               //     feature: 'blah',
//               //     suppliedW: 100,
//               //     suppliedH: 100,
//               //     color: Colors.white,
//               //     initialCalloutAlignment: Alignment.bottomRight,
//               //     initialTargetAlignment: Alignment.topLeft,
//               //     finalSeparation: 200,
//               //     roundedCorners: 16,
//               //     animate: true,
//               //     arrowColor: Colors.blue,
//               //     onResize: (newSize) => print("newSize: ${newSize.toString()}"),
//               //   ),
//               //   calloutTargetBuilderF: (ctx) => Builder(builder: (builderCtx) {
//               //     return TextButton(
//               //         onPressed: () {
//               //           CalloutState? state = Callout.of(builderCtx);
//               //           state?.opController.show();
//               //         },
//               //         child: Text('Press Me...'));
//               //   }),
//               //   calloutBoxContentBuilderF: (ctx) => Container(
//               //     width: 200,
//               //     height: 180,
//               //     color: Colors.green,
//               //   ),
//               // ),
//               const Divider(),
//               Padding(
//                 padding: const EdgeInsets.all(0),
//                 child: Row(
//                   children: [
//                     Expanded(
//                         flex: 11,
//                         child: SingleTargetWrapper(
//                           name: 'bridging-the-gap',
//                           playButtonAlignment: const Alignment(0, 0),
//                           playButton: const Icon(
//                             Icons.info,
//                             size: 24,
//                           ),
//                           playButtonSize: Size(30, 30),
//                           child: Padding(
//                             padding: const EdgeInsets.all(28.0),
//                             child: AspectRatio(aspectRatio: 987 / 207, child: Image.asset('images/bridging-the-gap-logo.jpeg', fit: BoxFit.cover)),
//                           ),
//                         )),
//                     Expanded(flex: 2, child: AspectRatio(aspectRatio: 558 / 642, child: Image.asset('images/tramshed-map.png'))),
//                   ],
//                 ),
//               ),
//               const Divider(),
//               // target not in a listview
//               Expanded(
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: IconButton(
//                         onPressed: () {
//                           Callout.showOverlay(
//                             targetGkF: () => _lockIconGK,
//                             calloutConfig: CalloutConfig(
//                               feature: TRAINER_PASSWORD_CALLOUT,
//                               initialTargetAlignment: Alignment.centerLeft,
//                               initialCalloutAlignment: Alignment.centerRight,
//                               finalSeparation: 50,
//                               suppliedCalloutW: 240,
//                               suppliedCalloutH: 150,
//                               roundedCorners: 12,
//                               color: Colors.white,
//                               arrowType: ArrowType.POINTY,
//                               barrier: CalloutBarrier(closeOnTapped: true),
//                             ),
//                             boxContentF: (_) => Column(
//                               mainAxisSize: MainAxisSize.min,
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Useful.purpleText("Trainer Access", fontSize: 24, family: 'Merriweather'),
//                                 SizedBox(
//                                   width: 200,
//                                   height: 100,
//                                   child: TextEditor(
//                                     parentFeature: TRAINER_PASSWORD_CALLOUT,
//                                     prompt: 'password',
//                                     originalS: '',
//                                     onEditingCompleteF: (s) {
//                                       if (s == "lakebeachocean") {
//                                         Callout.dismiss(TRAINER_PASSWORD_CALLOUT);
//                                         setState(() {
//                                           HydratedBloc.storage.write("trainerIsSignedIn", true);
//                                         });
//                                       }
//                                     },
//                                     onTextChangedF: (s) {},
//                                     dontAutoFocus: false,
//                                     isPassword: true,
//                                     maxLines: 1,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                         icon: SizedBox(
//                           width: 36,
//                           child: Icon(
//                             key: _lockIconGK,
//                             Icons.lock,
//                             color: Colors.blueAccent,
//                           ),
//                         ),
//                         iconSize: 36,
//                         tooltip: 'trainer login...',
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: SizedBox(
//                   //height: 70,
//                   child: ListView(
//                     controller: sc,
//                     shrinkWrap: true,
//                     children: [
//                       // if (!signedInAsTrainer) SnippetPanel(sName: 'compals-home-menu'),
//                       if (signedInAsTrainer) Expanded(child: SnippetPanel(pName: 'compals-trainer-menu')),
//                       // Expanded(child: SnippetPanel(sName: 'stepper')),
//                       Container(
//                         width: 800, height: 00, color: Colors.green,
//                         // child:
//                         // TargetGroupWrapper(
//                         //   iwName: "cats",
//                         //   imageF: (context) => assetPicWithFadeIn(
//                         //     path: 'images/top-cat-gang.png',
//                         //     padding: EdgeInsets.zero,
//                         //     alignment: Alignment.center,
//                         //     fit: BoxFit.fitHeight,
//                         //   ),
//                         // ),
//                       ),
//                       //SnippetPanel(sName: 'snippet-1a'),
//                       SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Row(
//                           children: [
//                             if (false && !signedInAsTrainer) SnippetPanel(pName: 'webview1'),
//                             SizedBox(width: 40),
//                             if (false && !signedInAsTrainer) SnippetPanel(pName: 'webview2'),
//                           ],
//                         ),
//                       )
//                       // _testWidget(context),
//                       // IconButton(
//                       //   key: _lockIconGK,
//                       //   onPressed: () {
//                       //     Callout(
//                       //             feature: TRAINER_PASSWORD_CALLOUT,
//                       //             targetGKF: () => _lockIconGK,
//                       //             contents: () => Column(
//                       //                   mainAxisSize: MainAxisSize.max,
//                       //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       //                   crossAxisAlignment: CrossAxisAlignment.center,
//                       //                   children: [
//                       //                     Callout.wrapTarget(
//                       //                       calloutConfig: CalloutConfig(
//                       //                         feature: 'TEST',
//                       //                         color: Colors.white,
//                       //                         initialCalloutAlignment: Alignment.topRight,
//                       //                         initialTargetAlignment: Alignment.bottomLeft,
//                       //                         finalSeparation: 200,
//                       //                         roundedCorners: 24,
//                       //                         // animate: true,
//                       //                         arrowColor: Colors.brown,
//                       //                         barrier: CalloutBarrier(opacity: .1),
//                       //                       ),
//                       //                       calloutBoxContentBuilderF: (ctx) => SizedBox(
//                       //                           width: 50,
//                       //                           height: 50,
//                       //                           child: Container(
//                       //                             color: Colors.brown,
//                       //                           )),
//                       //                       calloutTargetBuilderF: (ctx) => Builder(builder: (builderCtx) {
//                       //                         return TextButton(
//                       //                             onPressed: () {
//                       //                               CalloutState? state = Callout.of(builderCtx);
//                       //                               state?.toggle();
//                       //                             },
//                       //                             child: Text('Press Me...'));
//                       //                       }),
//                       //                       targetChangedNotifier: notifier,
//                       //                     ),
//                       //                     Useful.purpleText("Trainer Access", fontSize: 24, family: 'Merriweather'),
//                       //                     SizedBox(
//                       //                       width: 200,
//                       //                       height: 100,
//                       //                       child: TextEditor(
//                       //                         parentFeature: TRAINER_PASSWORD_CALLOUT,
//                       //                         prompt: 'password',
//                       //                         originalS: '',
//                       //                         onEditingCompleteF: (s) {
//                       //                           if (s == "lakebeachocean") {
//                       //                             Callout.removeOverlay(TRAINER_PASSWORD_CALLOUT);
//                       //                             setState(() {
//                       //                               HydratedBloc.storage.write("trainerIsSignedIn", true);
//                       //                             });
//                       //                           }
//                       //                         },
//                       //                         onTextChangedF: (s) {},
//                       //                         expands: false,
//                       //                         focusNode: FocusNode(),
//                       //                         dontAutoFocus: false,
//                       //                         isPassword: true,
//                       //                       ),
//                       //                     ),
//                       //                   ],
//                       //                 ),
//                       //             initialTargetAlignment: Alignment.centerLeft,
//                       //             initialCalloutAlignment: Alignment.centerRight,
//                       //             separation: 50,
//                       //             barrierOpacity: .5,
//                       //             onBarrierTappedF: () async {
//                       //               Callout.removeOverlay(TRAINER_PASSWORD_CALLOUT);
//                       //             },
//                       //             width: 240,
//                       //             height: 150,
//                       //             roundedCorners: 12,
//                       //             color: Colors.white,
//                       //             arrowType: ArrowType.POINTY)
//                       //         .show(context: context);
//                       //   },
//                       //   icon: const Icon(
//                       //     Icons.lock,
//                       //     color: Colors.blueAccent,
//                       //   ),
//                       //   iconSize: 36,
//                       //   tooltip: 'trainer login...',
//                       // ),
//                       // SizedBox(width: 250, height: 50, child: Password()),
//                     ],
//                   ),
//                 ),
//               ),
//               //Expanded(child: SnippetPanel(sName: 'compals-home')),
//             ],
//           ),
//         ),
//       ),
//       ancestorVScrollController: sc,
//     );
//   }
//
//   // _password() => PasswordField(
//   //       color: Colors.blue,
//   //       passwordConstraint: r'.*[@$#.*].*',
//   //       passwordDecoration: PasswordDecoration(),
//   //       hintText: 'must have special characters',
//   //       border: PasswordBorder(
//   //         border: OutlineInputBorder(
//   //           borderSide: BorderSide(
//   //             color: Colors.blue.shade100,
//   //           ),
//   //           borderRadius: BorderRadius.circular(12),
//   //         ),
//   //         focusedBorder: OutlineInputBorder(
//   //           borderSide: BorderSide(
//   //             color: Colors.blue.shade100,
//   //           ),
//   //           borderRadius: BorderRadius.circular(12),
//   //         ),
//   //         focusedErrorBorder: OutlineInputBorder(
//   //           borderRadius: BorderRadius.circular(12),
//   //           borderSide: BorderSide(width: 2, color: Colors.red.shade200),
//   //         ),
//   //       ),
//   //       errorMessage: 'must contain special character either . * @ # \$',
//   //     );
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
//
// // class MeasureWidget extends StatefulWidget {
// //   const MeasureWidget({
// //     Key? key,
// //     required this.child,
// //     required this.measureRect,
// //     required this.boxConstraints,
// //   }) : super(key: key);
// //
// //   final Widget child;
// //   final ValueSetter<Rect?> measureRect;
// //   final BoxConstraints boxConstraints;
// //
// //   @override
// //   MeasureWidgetState createState() => MeasureWidgetState();
// // }
// //
// // class MeasureWidgetState extends State<MeasureWidget> {
// //   GlobalKey key = GlobalKey();
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     Useful.afterNextBuildDo(() {
// //       final Rect? rect = UIHelper.findGlobalRect(key);
// //       widget.measureRect.call(rect);
// //     });
// //   }
// //
// //   @override
// //   void dispose() {
// //     super.dispose();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Offstage(
// //       child: Center(
// //         child: Container(
// //           key: key,
// //           // constraints: widget.boxConstraints,
// //           child: widget.child,
// //         ),
// //       ),
// //     );
// //   }
// // }
