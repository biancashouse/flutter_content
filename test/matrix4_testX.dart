// import 'dart:io';
//
// import 'package:flutter_content/callout_api.dart';
// import 'package:flutter_content/src/bloc/capi_bloc.dart';
// import 'package:flutter_content/src/bloc/capi_event.dart';
// import 'package:flutter_content/src/bloc/capi_state.dart';
// import 'package:flutter_content/src/model/target_config.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:bloc_test/bloc_test.dart';
//
// class MockCAPIBloC extends MockBloc<CAPIEvent, CAPIState> implements CAPIBloC {}
//
// void main() {
//   targetConfigTests();
//   blocTests();
//   tweenTests();
// }
//
// void targetConfigTests() {
//   test('target pos % offset getter and setter', () async {
//     final iwName = 'widget-1';
//
//     final CAPIBloC = MockCAPIBloC();
//
//     CAPIState initialState = CAPIState(imageTargetListMap: {
//       "widget-1": [
//         TargetConfig(uid: 199, twName: "widget-1")
//           ..recordedM4list = [
//             1.253630242823337,
//             0.0,
//             0.0,
//             0.0,
//             0.0,
//             1.253630242823337,
//             0.0,
//             0.0,
//             0.0,
//             0.0,
//             1.253630242823337,
//             0.0,
//             -16.980986467566964,
//             -176.58559525604548,
//             0.0,
//             1.0,
//           ]
//           ..targetLocalPosLeftPc = 0.5
//           ..targetLocalPosTopPc = 0.75,
//       ]
//     });
//
//     whenListen(
//       CAPIBloC,
//       Stream.fromIterable([
//         initialState,
//       ]),
//       initialState: initialState,
//     );
//
//     // Assert that the initial state is correct.
//     expect(CAPIBloC.state, equals(initialState));
//
//     TargetConfig tc = CAPIBloC.state.imageTargetListMap["widget-1"]![0];
//     tc.init(CAPIBloC, GlobalKey(), FocusNode());
//
//     print(CAPIBloC.toString());
//
//     CAPIBloC.add(CAPIEvent.selectTarget(tc: tc));
//
//     // Assert that the stubbed stream is emitted.
//     // await expectLater(CAPIBloC.stream, emitsInOrder(<int>[0]));
//
//     // Assert that the current state is in sync with the stubbed stream.
//     expect(CAPIBloC.state, equals(initialState));
//
//     print(tc.recordedM4list);
//     print("scale     ${tc.getScale(testing: true)}");
//     print("translate ${tc.getTranslate(testing: true)}");
//
//     ImageWrapperManual capiWidgetWrapper = ImageWrapperManual(twName: "main", iwName: "widget", child: Container());
//
//     // Offset globalPos = tc.setTargetStackPosPc(globalPos);
//     //
//     // print("globalPos: ${globalPos.toString()}");
//     //
//     // Offset globalPos = targetGlobalFromPc(
//     //     ivGlobalPos: Offset(100, 100),
//     //     childLocalPosLeftPc: .5,
//     //     childLocalPosTopPc: .75,
//     //     ivScale: 1.0,
//     //     ivTranslate: Offset.zero,
//     //     ivChildMeasuredRect: Rect.fromLTWH(100, 100, 300, 200));
//     //
//     // print("globalPos: ${globalPos.toString()}");
//     //
//     // Offset pcPos = globalToPc(
//     //     globalPos: globalPos,
//     //     ivGlobalPos: Offset(100, 100),
//     //     ivScale: 1.0,
//     //     ivTranslate: Offset.zero,
//     //     ivChildMeasuredRect: Rect.fromLTWH(100, 100, 300, 200));
//     //
//     // expect(pcPos.dx, .5);
//     // expect(pcPos.dy, .75);
//
//     // final Animatable<double> chain = tween.chain(Tween<double>(begin: 0.50, end: 1.0));
//     // final AnimationController controller = AnimationController(
//     //   vsync: const TestVSync(),
//     // );
//     // expect(chain.evaluate(controller), 0.40);
//     // expect(chain, hasOneLineDescription);
//   });
// }
//
// void blocTests() {
//   // group('whenListen', () {
//   //   test("Let's mock the CCBloc's stream!", () {
//   //     // Create Mock Bloc Instance
//   //     final bloc = MockCCBloc();
//   //
//   //     // Stub the listen with a fake Stream
//   //     whenListen(bloc, Stream.fromIterable([0, 1, 2, 3]));
//   //
//   //     // Expect that the Mock Bloc instance emitted the stubbed Stream of
//   //     // states
//   //     expectLater(bloc.stream, emitsInOrder(<int>[0, 1, 2, 3]));
//   //   });
//   // });
//
//   // group('CCBloc', () {
//   //   blocTest<CCBloc, CCState>(
//   //     'emits [] when nothing is added',
//   //     build: () => CCBloc(),
//   //     expect: () => const <CCState>[],
//   //   );
//   //
//   //   blocTest<CCBloc, CCState>(
//   //     'emits [1] when initApp event rcvd',
//   //     build: () => CCBloc(),
//   //     act: (bloc) => bloc.add(
//   //       CCEvent.initApp(
//   //         initialValueJsonAssetPath: "callout-scripts/explain-config.json",
//   //         localTestingFilePaths: true,
//   //       ),
//   //     ),
//   //     expect: () => CCState(),
//   //   );
//   // });
// }
//
// void tweenTests() {
//   test('Can chain tweens', () {
//     final Tween<double> tween = Tween<double>(begin: 0.30, end: 0.50);
//     expect(tween, hasOneLineDescription);
//     final Animatable<double> chain = tween.chain(Tween<double>(begin: 0.50, end: 1.0));
//     final AnimationController controller = AnimationController(
//       vsync: const TestVSync(),
//     );
//     expect(chain.evaluate(controller), 0.40);
//     expect(chain, hasOneLineDescription);
//   });
//   test('Can animated tweens', () {
//     final Tween<double> tween = Tween<double>(begin: 0.30, end: 0.50);
//     final AnimationController controller = AnimationController(
//       vsync: const TestVSync(),
//     );
//     final Animation<double> animation = tween.animate(controller);
//     controller.value = 0.50;
//     expect(animation.value, 0.40);
//     expect(animation, hasOneLineDescription);
//     expect(animation.toStringDetails(), hasOneLineDescription);
//   });
//   test('SizeTween', () {
//     final SizeTween tween = SizeTween(begin: Size.zero, end: const Size(20.0, 30.0));
//     expect(tween.lerp(0.5), equals(const Size(10.0, 15.0)));
//     expect(tween, hasOneLineDescription);
//   });
//   test('IntTween', () {
//     final IntTween tween = IntTween(begin: 5, end: 9);
//     expect(tween.lerp(0.5), 7);
//     expect(tween.lerp(0.7), 8);
//   });
//   test('RectTween', () {
//     const Rect a = Rect.fromLTWH(5.0, 3.0, 7.0, 11.0);
//     const Rect b = Rect.fromLTWH(8.0, 12.0, 14.0, 18.0);
//     final RectTween tween = RectTween(begin: a, end: b);
//     expect(tween.lerp(0.5), equals(Rect.lerp(a, b, 0.5)));
//     expect(tween, hasOneLineDescription);
//   });
//   test('Matrix4Tween', () {
//     final Matrix4 a = Matrix4.identity();
//     final Matrix4 b = a.clone()
//       ..translate(6.0, -8.0, 0.0)
//       ..scale(0.5, 1.0, 5.0);
//     final Matrix4Tween tween = Matrix4Tween(begin: a, end: b);
//     expect(tween.lerp(0.0), equals(a));
//     expect(tween.lerp(1.0), equals(b));
//     expect(
//         tween.lerp(0.5),
//         equals(a.clone()
//           ..translate(3.0, -4.0, 0.0)
//           ..scale(0.75, 1.0, 3.0)));
//     final Matrix4 c = a.clone()..rotateZ(1.0);
//     final Matrix4Tween rotationTween = Matrix4Tween(begin: a, end: c);
//     expect(rotationTween.lerp(0.0), equals(a));
//     expect(rotationTween.lerp(1.0), equals(c));
//     expect(rotationTween.lerp(0.5).absoluteError(a.clone()..rotateZ(0.5)), moreOrLessEquals(0.0));
//   }, skip: Platform.isWindows); // floating point math not quite deterministic on Windows?
//   test('ConstantTween', () {
//     final ConstantTween<double> tween = ConstantTween<double>(100.0);
//     expect(tween.begin, 100.0);
//     expect(tween.end, 100.0);
//     expect(tween.lerp(0.0), 100.0);
//     expect(tween.lerp(0.5), 100.0);
//     expect(tween.lerp(1.0), 100.0);
//   });
// }
//
// // Offset targetGlobalFromPc({
// //   required Offset ivGlobalPos,
// //   required double childLocalPosLeftPc,
// //   required double childLocalPosTopPc,
// //   required double ivScale,
// //   required Offset ivTranslate,
// //   required Rect ivChildMeasuredRect,
// // }) {
// //   var globalPos = Offset(
// //     (childLocalPosLeftPc) * ivChildMeasuredRect.width * ivScale,
// //     (childLocalPosTopPc) * ivChildMeasuredRect.height * ivScale,
// //   )
// //       .translate(
// //         ivGlobalPos.dx,
// //         ivGlobalPos.dy,
// //       )
// //       .translate(
// //         ivTranslate.dx,
// //         ivTranslate.dy,
// //       );
// //   return globalPos;
// // }
//
// // Offset globalToPc({
// //   required Offset globalPos,
// //   required Offset ivGlobalPos,
// //   required double ivScale,
// //   required Offset ivTranslate,
// //   required Rect ivChildMeasuredRect,
// // }) {
// //   double childLocalPosTopPc = (ivGlobalPos.dy + ivTranslate.dy + ivChildMeasuredRect.top) / ivChildMeasuredRect.height * ivScale;
// //   double childLocalPosLeftPc = (ivGlobalPos.dx + ivTranslate.dx + ivChildMeasuredRect.left) / ivChildMeasuredRect.width * ivScale;
// //   return Offset(childLocalPosLeftPc, childLocalPosTopPc);
// // }
