// import 'package:flutter/material.dart';
// import 'package:flutter_content/flutter_content.dart';
// import 'package:hydrated_bloc/hydrated_bloc.dart';
//
// class HomePageCats extends StatefulWidget {
//   const HomePageCats({super.key});
//
//   @override
//   _HomePageCatsState createState() => _HomePageCatsState();
// }
//
// class _HomePageCatsState extends State<HomePageCats> {
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
//   }
//
//   Widget build(BuildContext context) {
//     bool signedInAsTrainer = HydratedBloc.storage.read("trainerIsSignedIn") ?? false;
//
//     return TransformableScaffold(
//       scaffoldBody: () => Center(
//           child: ListView(
//         controller: sc,
//         shrinkWrap: true,
//         children: [
//           // TargetWrapper(
//           //   name: 'flutter-logo',
//           //   initialCalloutAlignment: Alignment.centerRight,
//           //   initialTargetAlignment: Alignment.centerLeft,
//           //   child: const FlutterLogo(),
//           // ),
//           TargetGroupWrapper(
//             name: "cats",
//             child: assetPicWithFadeIn(
//               path: 'images/top-cat-gang.png',
//               padding: EdgeInsets.zero,
//               alignment: Alignment.center,
//               fit: BoxFit.fitHeight,
//             ),
//           ),
//           // IconButton(
//           //   onPressed: () {
//           //     Callout.showOverlay(
//           //       targetGkF: () => _lockIconGK,
//           //       calloutConfig: CalloutConfig(
//           //         feature: TRAINER_PASSWORD_CALLOUT,
//           //         initialTargetAlignment: Alignment.centerLeft,
//           //         initialCalloutAlignment: Alignment.centerRight,
//           //         finalSeparation: 50,
//           //         suppliedCalloutW: 240,
//           //         suppliedCalloutH: 150,
//           //         roundedCorners: 30,
//           //         color: Colors.white,
//           //         arrowType: ArrowType.POINTY,
//           //         barrier: CalloutBarrier(closeOnTapped: true),
//           //       ),
//           //       boxContentF: (_) => Column(
//           //         mainAxisSize: MainAxisSize.max,
//           //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           //         crossAxisAlignment: CrossAxisAlignment.center,
//           //         children: [
//           //           Useful.purpleText("Trainer Access", fontSize: 24, family: 'Merriweather'),
//           //           SizedBox(
//           //             width: 200,
//           //             height: 100,
//           //             child: TextEditor(
//           //               parentFeature: TRAINER_PASSWORD_CALLOUT,
//           //               prompt: 'password',
//           //               originalS: '',
//           //               onEditingCompleteF: (s) {
//           //                 if (s == "lakebeachocean") {
//           //                   Callout.removeOverlay(TRAINER_PASSWORD_CALLOUT);
//           //                   setState(() {
//           //                     HydratedBloc.storage.write("trainerIsSignedIn", true);
//           //                   });
//           //                 }
//           //               },
//           //               onTextChangedF: (s) {},
//           //               expands: false,
//           //               focusNode: FocusNode(),
//           //               dontAutoFocus: false,
//           //               isPassword: true,
//           //             ),
//           //           ),
//           //         ],
//           //       ),
//           //     );
//           //   },
//           //   icon: Icon(
//           //     key: _lockIconGK,
//           //     Icons.lock,
//           //     color: Colors.blueAccent,
//           //   ),
//           //   iconSize: 36,
//           //   tooltip: 'trainer login...',
//           // ),
//           Container(
//             height: 25,
//             color: Colors.blueAccent,
//           ),
//           SnippetPanel(pName: 'webview1'),
//           SnippetPanel(pName: 'test-29'),
//           Container(
//             height: 600,
//             color: Colors.blueAccent,
//           )
//         ],
//       )),
//       ancestorVScrollController: sc,
//     );
//   }
// }
