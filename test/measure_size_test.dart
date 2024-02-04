// import 'dart:async';
//
// import 'package:flutter_content/src/overlays/callouts/offstage_measuring_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_test/flutter_test.dart';
//
// void main() {
//   setUp(() async {
//     final openSansBold = rootBundle.load('google_fonts/OpenSans-Bold.ttf');
//     final openSansExtraBold = rootBundle.load('google_fonts/OpenSans-ExtraBold.ttf');
//     final fontLoader = FontLoader('OpenSans')
//       ..addFont(openSansBold)
//       ..addFont(openSansExtraBold);
//     await fontLoader.load();
//   });
//
//   testWidgets('shouldFindAllListViewItems', (WidgetTester tester) async {
//     Future<Size> measureWidgetSize({
//       required BuildContext context,
//       required Widget widget,
//     }) async {
//       Completer<Size> completer = Completer();
//       OverlayEntry? entry;
//       entry = OverlayEntry(builder: (BuildContext ctx) {
//         return Material(
//           child: OffstageMeasuringWidget(
//             onSized: (size) {
//               entry?.remove();
//               completer.complete(size);
//             },
//             child: widget,
//           ),
//         );
//       });
//       Overlay.of(context).insert(entry);
//       return completer.future;
//     }
//
//     GlobalKey gk = GlobalKey();
//
//     await tester.pumpWidget(MaterialApp(
//       home: Container(
//         key: gk,
//         width: 100,
//         height: 300,
//       ),
//     ));
//
//     final container = find.byKey(gk);
//     expect(container, findsOneWidget);
//
//     BuildContext context = tester.element(container);
//
//     Size calloutSize = await measureWidgetSize(
//         context: context,
//         widget: Container(
//           width: 100,
//           height: 300,
//         ));
//
//     await tester.pumpAndSettle(const Duration(seconds: 1));
//
//     print("size: ${calloutSize.toString()}");
//   });
// }
