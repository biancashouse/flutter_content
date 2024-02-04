// import 'dart:async';
// import 'dart:collection';
//
// import 'package:flutter/material.dart';
//
// class CPIReasonStack {
//   static final CPIReasonStack instance = CPIReasonStack._(Queue<String>());
//   Queue<String> queue;
//
//   // private, named constructor
//   CPIReasonStack._(this.queue);
//
//   factory CPIReasonStack.singleton() => instance;
//
//   void push(String theReason) => queue.addFirst(theReason);
//   String pop() => queue.removeFirst();
//   int get length => queue.length;
// }
//
//
//   void showCircularProgressIndicator(bool theBool, {required String reason}) {
//     OverlayEntry? _cpiOverlay;
//     Timer? _cpiTimer;
//     if (theBool) {
//       Timer? _cpiTimer;
//       remove(CAPI.CPI.name, true);
//       _cpiOverlay = OverlayEntry(
//         builder: (BuildContext overlayContext) {
//           return Center(
//             child: SizedBox(
//               child: Useful.isAndroid
//                   ? const CircularProgressIndicator(strokeWidth: 50.0, color: Colors.green)
//                   : const CupertinoActivityIndicator(
//                       radius: 50,
//                     ),
//               width: 100,
//               height: 100,
//             ),
//           );
//         },
//         opaque: false,
//       );
//       Overlay.of(Useful.cachedContext!).insert(_cpiOverlay!);
//       CPIReasonStack.singleton().push(reason);
//       // jic hide never called, set timeout at 10s
//       if (_cpiTimer?.isActive ?? false) _cpiTimer?.cancel();
//       _cpiTimer = Timer(const Duration(seconds: 10), () {
//         if (CPIReasonStack.singleton().length > 0) {
//           CPIReasonStack.singleton().pop();
//           if (CPIReasonStack.singleton().length == 0 && _cpiOverlay != null) _cpiOverlay?.remove();
//         }
//       });
//     } else {
//       _cpiTimer?.cancel();
//       if (CPIReasonStack.singleton().length > 0) {
//         CPIReasonStack.singleton().pop();
//         if (CPIReasonStack.singleton().length == 0 && _cpiOverlay != null) _cpiOverlay?.remove();
//       }
//     }
//   }
