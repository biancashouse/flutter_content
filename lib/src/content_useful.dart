// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_callouts/flutter_callouts.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:google_fonts/google_fonts.dart';

mixin ContentUseful {

  static GlobalKey? _offstageGK;
  static WidgetBuilder _builder = (context) => const Icon(Icons.warning);

  // static WidgetBuilder get widgetBuilder => _builder;
  // static set widgetBuilder(WidgetBuilder newBuilder) => _builder = newBuilder;

  _createOffstageOverlay(BuildContext context) {
    Overlay.of(context).insert(OverlayEntry(
        builder: (BuildContext ctx) => Offstage(
          child: Material(
            color: Colors.transparent,
            child: Center(
              child: Container(
                key: _offstageGK,
                child: _builder(context),
              ),
            ),
          ),
        )));
  }
  
  // update config with measured size
  // static Size _measureOffstageWidget(
  //     bool skipWidthConstraintWarning,
  //     bool skipHeightConstraintWarning,
  //     ) {
  //   if (_offstageGK != null) {
  //     Rect? rect = _offstageGK!.globalPaintBounds(
  //       skipWidthConstraintWarning: skipWidthConstraintWarning,
  //       skipHeightConstraintWarning: skipHeightConstraintWarning,
  //     ); //Measuring.findGlobalRect(_offstageGK!);
  //     if (rect != null) {
  //       debugPrint(
  //           '_measureThenRenderCallout: width:${rect.width}, height:${rect.height}');
  //       return rect.size;
  //     }
  //   }
  //   return Size.zero;
  // }

//   /// given a Rect, returns most appropriate alignment between target and callout within the wrapper
//   /// NOTICE does not depend on callout size
//   static Alignment calcTargetAlignmentWithinWrapper(
//       Rect wrapperRect, final Rect targetRect) {
//     // Rect? wrapperRect = findGlobalRect(widget.key as GlobalKey);
//
//     Rect screenRect = Rect.fromLTWH(0, 0, FC().scrW, FC().scrH);
//     wrapperRect = screenRect;
//     Offset wrapperC = wrapperRect.center;
//     Offset targetRectC = targetRect.center;
//     double x = (targetRectC.dx - wrapperC.dx) / (wrapperRect.width / 2);
//     double y = (targetRectC.dy - wrapperC.dy) / (wrapperRect.height / 2);
//     // keep away from sides
//     if (x < -0.75) {
//       x = -1.0;
//     } else if (x > 0.75) {
//       x = 1.0;
//     }
//     if (y < -0.75) {
//       y = -1.0;
//     } else if (y > 0.75) {
//       y = 1.0;
//     }
//     // debugPrint("$x, $y");
//     return Alignment(x, y);
//   }
//
//   static Alignment calcTargetAlignmentWholeScreen(
//       final Rect targetRect, double calloutW, double calloutH) {
//     Rect screenRect = Rect.fromLTWH(0, 0, scrW, scrH);
//     double T = targetRect.top;
//     double L = targetRect.left;
//     double B = screenRect.height - targetRect.bottom;
//     double R = screenRect.width - targetRect.right;
//     double spareAbove = T - calloutH;
//     double spareBelow = B - calloutH;
//     double spareOnLeft = L - calloutW;
//     double spareOnRight = R - calloutW;
//     double maxSpare =
//     [spareAbove, spareBelow, spareOnLeft, spareOnRight].reduce(max);
//     if (maxSpare == spareOnRight) {
//       return Alignment.centerRight;
//     } else if (maxSpare == spareOnLeft)
//       return Alignment.centerLeft;
//     else if (maxSpare == spareAbove)
//       return Alignment.topCenter;
//     else
//       return Alignment.bottomCenter;
//     // else if (maxSpare == spareBelow) return Alignment.topCenter;
//     // bool calloutPossiblyOnLeft = L > calloutW;
//     // bool calloutPossiblyOnRight = R > calloutW;
//     // bool calloutPossiblyAbove = T > calloutH;
//     // bool calloutPossiblyBelow = B > calloutH;
//     // if (L > R) {
//     //   bool onLeft = calloutPossiblyOnLeft;
//     // } else {
//     //   bool onRight = calloutPossiblyOnRight;
//     // }
//     // if (T > B) {
//     //   bool above = calloutPossiblyAbove;
//     // } else {
//     //   bool below = calloutPossiblyBelow;
//     // }
//     // if ()
//     //   if (calloutW < B) return Alignment.bottomCenter;
//     // if (calloutW < T) return Alignment.topCenter;
//     // if (calloutW < R) return Alignment.centerRight;
//     // if (calloutW < L) return Alignment.centerLeft;
//     //
//     // return Alignment.center;
//   }
//
//   static Offset? findGlobalPos(GlobalKey key) {
//     BuildContext? cxt = key.currentContext;
//     RenderObject? renderObject = cxt?.findRenderObject();
//     return (renderObject as RenderBox).localToGlobal(Offset.zero);
//   }
//
//   // static formattedDate(int ms) => DateFormat.yMMMd().format(DateTime.fromMillisecondsSinceEpoch(ms));
//   static formattedDate(int ms) =>
//       DateFormat('H:mm, d.MMM').format(DateTime.fromMillisecondsSinceEpoch(ms));
//
//   static Text coloredText(
//       String s, {
//         double? fontSize,
//         Color? color,
//         String? fontFamily,
//         double? letterSpacing,
//         FontWeight? fontWeight,
//         int? maxLines,
//       }) =>
//       Text(
//         s,
//         style: TextStyle(
//           inherit: true,
//           color: color,
//           fontSize: fontSize,
//           fontFamily: fontFamily,
//           letterSpacing: letterSpacing,
//           fontWeight: fontWeight,
//         ),
//         maxLines: maxLines,
//         softWrap: (maxLines ?? 0) > 1,
//         overflow: TextOverflow.ellipsis,
//       );
//
//   static Text purpleText(String s, {double? fontSize, String? family}) => Text(
//     s,
//     style: TextStyle(
//       inherit: true,
//       color: Colors.purple,
//       fontSize: fontSize,
//       fontFamily: family,
//     ),
//   );
//
//   static TextStyle enclosureLabelTextStyle = const TextStyle(
//       fontSize: 14, fontFamily: 'monospace', color: Colors.grey);
//
//   static ButtonStyle buttonStyle(double fontSize) => TextButton.styleFrom(
//     textStyle: TextStyle(fontSize: fontSize),
//   );
//
//   static Icon whiteIcon(IconData iconData) =>
//       Icon(iconData, color: Colors.white);
//
//   static BoxDecoration rectangularBox(
//       {Color? color, double thickness = 1.0, double radius = 0.0}) {
//     return BoxDecoration(
//         color: color,
//         border: Border.all(width: thickness),
//         borderRadius:
//         radius > 0 ? BorderRadius.all(Radius.circular(radius)) : null);
//   }
//
//   static Widget boxedText({String text = '', Color? color}) => Container(
//     padding: const EdgeInsets.all(8),
//     decoration: BoxDecoration(
//       color: Colors.yellow[50],
//       border: Border.all(width: 1),
//     ),
//     child: Text(text),
//   );
//
//   static (double, double) ensureOnScreen(
//       Rect calloutRect, double minVisibleH, double minVisibleV) {
//     double resultLeft = calloutRect.left;
//     double resultTop = calloutRect.top;
//     // adjust s.t entirely visible
//     if (calloutRect.left > (FC().scrW - minVisibleH)) {
//       resultLeft = FC().scrW - minVisibleH;
//     }
//     if (calloutRect.top > (FC().scrH - minVisibleV - FC().kbdH)) {
//       resultTop = FC().scrH - minVisibleV - FC().kbdH;
//     }
//     if (calloutRect.right < minVisibleH)
//       resultLeft = minVisibleH - calloutRect.width;
//     if (calloutRect.bottom < minVisibleV)
//       resultTop = minVisibleV - calloutRect.height;
//
//     return (resultLeft, resultTop);
//   }
//
//   static Rect restrictRectToScreen(Rect rect) {
//     // Clamp left and top to screen bounds
//     final left = max(rect.left, 0.0);
//     final top = max(rect.top, 0.0);
//
//     // Clamp right and bottom to prevent going off-screen
//     final right = min(rect.right, scrW);
//     final bottom = min(rect.bottom, scrH);
//
//     // Ensure width and height remain positive (might be 0 if completely off-screen)
//     final width = max(0.0, right - left);
//     final height = max(0.0, bottom - top);
//
//     return Rect.fromLTWH(left, top, width, height);
//   }
//
//   static String removeNonNumeric(s) => s.replaceAll(RegExp(r"\D"), "");
//
// // compare appInfo versionAndBuild with this app's yaml values
// // static Future<bool> possiblyInformUserOfNewVersion() async {
// //   String appsVersionAndBuildNum = await FC().versionAndBuild;
// //   String? storedVersionAndBuild = FC().appInfo.versionAndBuildNum ?? '';
// //   if (appsVersionAndBuildNum != storedVersionAndBuild) {
// //     FC().appInfo.versionAndBuildNum = appsVersionAndBuildNum;
// //     if (false) FC().modelRepo.saveAppInfo();
// //     return true;
// //   }
// //   return false;
// // }
//
// // static (double, double) ensureOnScreenOLD(Rect calloutRect) {
// //   double startingCalloutLeft = calloutRect.left;
// //   double startingCalloutTop = calloutRect.top;
// //   double resultLeft = startingCalloutLeft;
// //   double resultTop = startingCalloutTop;
// //   // adjust s.t entirely visible
// //   if (startingCalloutLeft + calloutRect.width > FC().scrW) {
// //     resultLeft = FC().scrW - calloutRect.width;
// //   }
// //   if (startingCalloutTop + calloutRect.height > (FC().scrH - FC().kbdH)) {
// //     resultTop = FC().scrH - calloutRect.height - FC().kbdH;
// //   }
// //   if (startingCalloutLeft < 0) resultLeft = 0;
// //   if (startingCalloutTop < 0) resultTop = 0;
// //
// //   return (resultLeft, resultTop);
// // }
// }
//
// enum PlatformEnum { android, ios, web, windows, osx, fuchsia, linux }
//
// class _Responsive {
//   static final _Responsive instance = _Responsive._();
//   String? _deviceInfo;
//   PlatformEnum? _platform;
//
// // private, named constructor
//   _Responsive._();
//
//   factory _Responsive() => instance;
//
//   _Responsive init() {
//     if (_deviceInfo == null) {
//       try {
//         if (kIsWeb) {
//           instance._deviceInfo = 'web browser';
//           instance._platform = PlatformEnum.web;
//         } else if (UniversalPlatform.isAndroid) {
//           DeviceInfoPlugin().androidInfo.then((info) {
//             instance._deviceInfo =
//                 info.brand; //'${info.manufacturer} ${info.model}';
//             instance._platform = PlatformEnum.android;
//           });
//         } else if (UniversalPlatform.isIOS) {
//           DeviceInfoPlugin().iosInfo.then((info) {
//             instance._deviceInfo = info.model; //'${info.model}';
//             instance._platform = PlatformEnum.ios;
//           });
//         } else if (UniversalPlatform.isWindows) {
//           instance._deviceInfo = 'Windows';
//           instance._platform = PlatformEnum.windows;
//         }
//       } on Exception {
//         instance._deviceInfo = 'not-android-nor-ios-nor-windows';
//       }
//     }
//     return instance;
//   }
//
// // static var o, w, h;
// // static void mq(BuildContext theCtx) {
// //   o = MediaQuery.of(theCtx).orientation;
// //   w = MediaQuery.of(theCtx).size.width;
// //   h = MediaQuery.of(theCtx).size.height;
// // }
// //
// // static double maxW(BuildContext ctx, int maxPixels) {
// //   mq(ctx);
// //   return min(w, maxPixels.toDouble());
// // }
// //
// // static double screenW(BuildContext ctx) {
// //   mq(ctx);
// //   return w;
// // }
// //
// // static double screenH(BuildContext ctx) {
// //   mq(ctx);
// //   return h;
// // }
//
// // static Size screenSize(BuildContext ctx) => MediaQuery.of(ctx).size;
//
// // static bool isCloseToTopOrBottom(Offset position, Size screenSize) {
// //   return position.dy <= 88.0 || (screenSize.height - position.dy) <= 88.0;
// // }
// //
// // static bool isOnTopHalfOfScreen(Offset position, Size screenSize) {
// //   return position.dy < (screenSize.height / 2.0);
// // }
// //
// // static bool isOnLeftHalfOfScreen(Offset position, Size screenSize) {
// //   return position.dx < (screenSize.width / 2.0);
// // }
//
// //  static bool isCloseToTopOrBottom(BuildContext ctx, Offset position) {
// //    return position.dy <= 88.0 || (screenH(ctx) - position.dy) <= 88.0;
// //  }
// //
// //  static bool isOnTopHalfOfScreen(BuildContext ctx, Offset position) {
// //    return position.dy < (screenH(ctx) / 2.0);
// //  }
// //
// //  bool isOnLeftHalfOfScreen(BuildContext ctx, Offset position) {
// //    return position.dx < (screenW(ctx) / 2.0);
// //  }
//
// // // Determine if we should use mobile layout or not. The
// // // number 600 here is a common breakpoint for a typical
// // // 7-inch tablet.
// //   static bool usePhoneLayout(BuildContext theCtx) {
// //     // The equivalent of the "smallestWidth" qualifier on Android.
// //     var shortestSide = MediaQuery.of(theCtx).size.shortestSide;
// //     return shortestSide < 600;
// //   }
//
// // static bool narrowWidth(BuildContext theCtx) {
// //   var q = MediaQuery.of(theCtx);
// //   var shortestSide = q.size.shortestSide;
// //   return shortestSide < 600 && q.orientation == Orientation.portrait;
// // }
// //
// // static bool shortHeight(BuildContext theCtx) {
// //   var q = MediaQuery.of(theCtx);
// //   var shortestSide = q.size.shortestSide;
// //   return shortestSide < 600 && q.orientation == Orientation.landscape;
// // }
//
// // Determine if we should use mobile layout or not. The
// // number 600 here is a common breakpoint for a typical
// // 7-inch tablet.
// //   static bool usePhoneLayout(BuildContext theCtx) {
// //     // The equivalent of the "smallestWidth" qualifier on Android.
// //     var shortestSide = MediaQuery.of(theCtx).size.shortestSide;
// //     return shortestSide < 600;
// //   }
// //
// //   static bool useTabletLayout(BuildContext theCtx) {
// //     var shortestSide = MediaQuery.of(theCtx).size.shortestSide;
// //     return !kIsWeb && shortestSide >= 600;
// //   }
//
// // //------------------------------------------------------------------------------------------
// }
//
// extension ExtendedOffset on Offset {
//   String toFlooredString() {
//     return '(${dx.floor()}, ${dy.floor()})';
//   }
// }
//
// bool _alreadyGaveGlobalPosAndSizeWarning = false;
//
// extension GlobalKeyExtension on GlobalKey {
//   (Offset?, Size?) globalPosAndSize() {
//     Rect? r = globalPaintBounds();
//     return (r?.topLeft, r?.size);
//   }
//
//   Rect? globalPaintBounds(
//       {bool skipWidthConstraintWarning = true,
//         bool skipHeightConstraintWarning = true}) {
//     var cw = currentWidget;
//     var cc = currentContext;
//     final renderObject = cc?.findRenderObject();
//     final translation = renderObject?.getTransformTo(null).getTranslation();
//     Rect? paintBounds;
//     try {
//       paintBounds = renderObject?.paintBounds;
//     } catch (e) {
//       debugPrint('paintBounds = renderObject?.paintBounds - ${e.toString()}');
//     }
//     // possibly warn about the target having an infinite width
//     if (!_alreadyGaveGlobalPosAndSizeWarning &&
//         !skipWidthConstraintWarning &&
//         !skipHeightConstraintWarning &&
//         (paintBounds?.width == FC().scrW ||
//             paintBounds?.height == FC().scrH)) {
//       _alreadyGaveGlobalPosAndSizeWarning = true;
//       Callout.showOverlay(
//         boxContentF: (BuildContext context) {
//           return Column(
//             children: [
//               FC().coloredText('Warning - Target Size Constraint',
//                   color: Colors.red),
//               Text(
//                 paintBounds?.width == FC().scrW
//                     ? "\nThe width of your callout target is the same as the window width.\n"
//                     "This might indicate that your target has an unbounded width constraint.\n"
//                     "This occurs, for example, when your target is a child of a ListView.\n\n"
//                     "If this is intentional, add 'skipContraintWarning:true' as an arg\n\n"
//                     "  to constructor Callout.wrapTarget\n\n"
//                     "  or to calls to Callout.showOverlay()\n\n"
//                     "Context: ${cc.toString()}"
//                     : "\nThe hwight of your callout target is the same as the window hwight.\n"
//                     "This might indicate that your target has an unbounded hwight constraint.\n"
//                     "If this height is intentional, add 'skipContraintWarning:true' as an arg\n\n"
//                     "  to constructor Callout.wrapTarget\n\n"
//                     "  or to calls to Callout.showOverlay()\n\n"
//                     "Context: ${cc.toString()}",
//               ),
//               TextButton(
//                 onPressed: () {
//                   Callout.removeParentCallout(context);
//                 },
//                 child: const Text('Close'),
//               ),
//             ],
//           );
//         },
//         calloutConfig: CalloutConfig(
//           feature: 'globalPaintBounds error',
//           draggable: false,
//           suppliedCalloutW: FC().scrW * .7,
//           suppliedCalloutH: 400,
//           fillColor: Colors.white,
//         ),
//       );
//     }
//     if (translation != null && paintBounds != null) {
//       final offset = Offset(translation.x, translation.y);
//       return paintBounds.shift(offset);
//     } else {
//       return null;
//     }
//   }

  static TextStyle googleFontTextStyle(
      context, {
        required String fontFamily,
        Color? color,
        double? fontSize,
        Material3TextSizeEnum? fontSizeName,
        FontStyle? fontStyle,
        FontWeight? fontWeight,
        double? lineHeight,
        double? letterSpacing,
      }) =>
      GoogleFonts.getFont(
        fontFamily,
        color: color,
        textStyle: fontSizeName?.materialTextStyle(themeData: Theme.of(context)),
        fontSize: fontSize,
        fontStyle: fontStyle,
        fontWeight: fontWeight,
        height: lineHeight,
        letterSpacing: letterSpacing,
      );

}

// class Measuring {
//   Measuring._();
//
//   static Rect? findGlobalRect(GlobalKey key) {
//     final RenderObject? renderObject = key.currentContext?.findRenderObject();
//
//     if (renderObject == null) {
//       return null;
//     }
//
//     if (renderObject is RenderBox) {
//       final Offset globalOffset = renderObject.localToGlobal(Offset.zero);
//
//       Rect bounds = renderObject.paintBounds;
//       bounds = bounds.translate(globalOffset.dx, globalOffset.dy);
//       return bounds;
//     } else {
//       Rect bounds = renderObject.paintBounds;
//       var translation = renderObject.getTransformTo(null).getTranslation();
//       bounds = bounds.translate(translation.x, translation.y);
//       return bounds;
//     }
//   }
//
// static Future<Rect> measureWidgetRect({
//   required BuildContext context,
//   required Widget widget,
//   required BoxConstraints boxConstraints,
// }) {
//   final Completer<Rect> completer = Completer<Rect>();
//   OverlayEntry? entry;
//   entry = OverlayEntry(builder: (BuildContext ctx) {
//     debugPrint(Theme.of(context).platform);
//     return Material(
//       child: MeasureWidget(
//         boxConstraints: boxConstraints,
//         measureRect: (Rect? rect) {
//           entry?.remove();
//           completer.complete(rect);
//         },
//         child: widget,
//       ),
//     );
//   });
//
//   Overlay.of(context).insert(entry);
//   return completer.future;
// }
// }
