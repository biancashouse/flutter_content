// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:developer' as developer;
import 'dart:math';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_state.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:universal_platform/universal_platform.dart';
import "package:yaml/yaml.dart";

import 'snippet/pnodes/enums/enum_material3_text_size.dart';

class Useful {
  // late SharedPreferences _prefs;
  // late LocalStoreHydrated _localStore;
  // final Map<String, OverlayManager> _oms = {};

  BuildContext? _cachedContext;
  late MediaQueryData _mqd;
  late _Responsive _responsive;

  Useful._();

  static final instance = Useful._();

  // static SharedPreferences get prefs => instance._prefs;

  //static LocalStoreHydrated get localStore => instance._localStore;

//   static OverlayManager get om {
//     OverlayManager? om = instance._oms["root"];
//     if (om == null) {
//       throw ('''
//
// You didn't call Useful.instance.initWithContext() !
// You'd normally do it like this:
//
//   @override
//   void didChangeDependencies() {
//     Useful.instance.initWithContext(context, force: true);
//     super.didChangeDependencies();
//   }
// ''');
//     } else {
//       return om;
//     }
//   }

  // static OverlayManager namedOM(String name) => instance._overlays[name]!;

  static BuildContext? get cachedContext => instance._cachedContext;

  static String asset(String name) {
    // only need to specify the asset pkg when used by a client project; i.e. not within the flutter_content project itself
    return FlutterContent.I.skipAssetPkgName ? name : 'packages/flutter_content/$name';
  }

  // must be called from a widget build
  void initWithContext(BuildContext context) {
    _responsive = _Responsive().init();
    if (cachedContext != null) return;
    _cachedContext = context;
    _mqd = MediaQuery.of(context);
    // if (!instance._oms.containsKey("root")) instance._oms["root"] = OverlayManager(Overlay.of(context, rootOverlay: true));
    afterNextBuildDo(() {
      _createOffstageOverlay(context);
    });
  }

  static GlobalKey? _offstageGK;
  static WidgetBuilder _builder = (context) => const Icon(Icons.warning);
  static OverlayEntry? _oe;

  // static WidgetBuilder get widgetBuilder => _builder;
  // static set widgetBuilder(WidgetBuilder newBuilder) => _builder = newBuilder;

  _createOffstageOverlay(BuildContext context) {
    Overlay.of(context).insert(_oe = OverlayEntry(
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

  static void afterNextBuildMeasureThenDo(
    final WidgetBuilder widgetBuilder,
    final ValueChanged<Size> fn, {
    final bool skipWidthConstraintWarning = false, // should be true if a width was supplied
    final bool skipHeightConstraintWarning = false, // should be true if a height was supplied
    final List<ScrollController>? scrollControllers,
  }) {
    Map<int, double> savedOffsets = {};
    if (scrollControllers != null && scrollControllers.isNotEmpty) {
      for (int i = 0; i < scrollControllers.length; i++) {
        ScrollController sc = scrollControllers[i];
        if (sc.positions.isNotEmpty) {
          savedOffsets[i] = sc.offset;
        }
      }
    }
    _offstageGK = GlobalKey(debugLabel: 'offstage-gk');
    _builder = widgetBuilder;
    _oe?.markNeedsBuild();
    SchedulerBinding.instance.addPostFrameCallback(
      (_) {
        if (savedOffsets.isNotEmpty) {
          for (int i in savedOffsets.keys) {
            scrollControllers![i].jumpTo(savedOffsets[i]!);
            // scrollControllers![i].animateTo(savedOffsets[i]!, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
          }
        }
        Size size = _measureOffstageWidget(skipWidthConstraintWarning, skipHeightConstraintWarning);
        if (size != Size.zero) fn.call(size);
      },
    );
  }

  // update config with measured size
  static Size _measureOffstageWidget(
    bool skipWidthConstraintWarning,
    bool skipHeightConstraintWarning,
  ) {
    if (_offstageGK != null) {
      Rect? rect = _offstageGK!.globalPaintBounds(
        skipWidthConstraintWarning: skipWidthConstraintWarning,
        skipHeightConstraintWarning: skipHeightConstraintWarning,
      ); //Measuring.findGlobalRect(_offstageGK!);
      if (rect != null) {
        print('_measureThenRenderCallout: width:${rect.width}, height:${rect.height}');
        return rect.size;
      }
    }
    return Size.zero;
  }

  // void createOM(BuildContext context, String name) {
  //   if (instance._oms.containsKey(name)) return;
  //   instance._oms[name] = OverlayManager(Overlay.of(context));
  //   if (instance._oms[name] == instance._oms["root"]) {
  //     print('@!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!@');
  //     print("Could not find Overlay $name using this context!");
  //     print('@!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!@');
  //   }
  // }

  // needs a context to get mediaquery, so gets set in the pqge builds [see getScreenSizeAndPossiblyNewOverlayManager()], but for now JIC, give default values

  static double get scrW => instance._mqd.size.width;

  static double get scrH => instance._mqd.size.height;

  // static double get keyboardHeight => instance._mqd.viewInsets.bottom;

  static double get kbdH {
    if (cachedContext == null || (!isIOS && !isAndroid)) return 0.0;
    FlutterView view = View.of(cachedContext!);
    final viewInsets = EdgeInsets.fromViewPadding(view.viewInsets, view.devicePixelRatio);
    return viewInsets.bottom;
  }

  static TextScaler get textScaler => instance._mqd.textScaler;

  static Orientation get orientation => instance._mqd.orientation;

  static bool get isPortrait => orientation == Orientation.portrait;

  static bool get isLandscape => orientation == Orientation.landscape;

  static double get shortestSide => instance._mqd.size.shortestSide;

  static double get longestSide => instance._mqd.size.longestSide;

  static bool get narrowWidth => instance._mqd.size.shortestSide < 600 && isPortrait;

  static bool get shortHeight => instance._mqd.size.shortestSide < 600 && isLandscape;

  // The equivalent of the "smallestWidth" qualifier on Android.
  static bool get usePhoneLayout => instance._mqd.size.shortestSide < 600;

  static bool get useTabletLayout => !kIsWeb && instance._mqd.size.shortestSide >= 600;

  static EdgeInsets get viewPadding => instance._mqd.viewPadding;

  static late PackageInfo _packageInfo;

  static String get actualVersion => _packageInfo.version;

  static String get actualBuildNumber => _packageInfo.buildNumber;

  static Future<bool> informUserOfNewVersion() async {
    _packageInfo = await PackageInfo.fromPlatform();
    // decide whether new version loaded
    String? storedVersionAndBuild = await HydratedBloc.storage.read("versionAndBuild");
    String latestVersionAndBuild = '$actualVersion-$actualBuildNumber';
    if (latestVersionAndBuild != (storedVersionAndBuild ?? '')) {
      await HydratedBloc.storage.write('versionAndBuild', latestVersionAndBuild);
      if (storedVersionAndBuild != null) return true;
    }
    return false;
  }

  static debug() {
    developer.log('queryData.size.width = $scrW');
    developer.log('queryData.size.height = $scrH');
    developer.log('queryData.orientation = ${orientation.name}');
  }

  static void afterNextBuildDo(VoidCallback fn, {List<ScrollController>? scrollControllers}) {
    Map<int, double> savedOffsets = {};
    if (scrollControllers != null && scrollControllers.isNotEmpty) {
      for (int i = 0; i < scrollControllers.length; i++) {
        ScrollController sc = scrollControllers[i];
        if (sc.positions.isNotEmpty) {
          savedOffsets[i] = sc.offset;
        }
      }
    }
    SchedulerBinding.instance.addPostFrameCallback(
      (_) {
        if (savedOffsets.isNotEmpty) {
          for (int i in savedOffsets.keys) {
            scrollControllers![i].jumpTo(savedOffsets[i]!);
            // scrollControllers![i].animateTo(savedOffsets[i]!, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
          }
        }
        fn.call();
      },
    );
  }

  // void _saveScrollOffsets() {
  //   if (editingPageState?.vScrollController.positions.isNotEmpty ?? false) {
  //     _vScrollControllerOffset = editingPageState?.vScrollController.offset;
  //   }
  //   if (editingPageState?.hScrollController.positions.isNotEmpty ?? false) {
  //     _hScrollControllerOffset = editingPageState?.hScrollController.offset;
  //   }
  //   if (editingPageState != null && editingPageState!.itemScrollController.hasClients) {
  //     commentsAutoScrollControllerOffset = editingPageState!.itemScrollController.offset;
  //   }
  // }
  //
  // void restoreScrollOffsetsAfterNextBuild() {
  //   _saveScrollOffsets();
  //   Useful.afterNextBuildDo(() {
  //     print('restoreScrollOffsetsAfterNextBuild');
  //     if (_vScrollControllerOffset != null && (editingPageState?.vScrollController.hasClients ?? false)) {
  //       editingPageState?.vScrollController.jumpTo(_vScrollControllerOffset!);
  //     }
  //     if (_hScrollControllerOffset != null && (editingPageState?.hScrollController.hasClients ?? false)) {
  //       editingPageState?.hScrollController.jumpTo(_hScrollControllerOffset!);
  //     }
  //     if (commentsAutoScrollControllerOffset != null && (editingPageState?.itemScrollController.hasClients ?? false)) {
  //       editingPageState?.itemScrollController.jumpTo(commentsAutoScrollControllerOffset!);
  //     }
  //   });
  // }

  // static void afterNextBuildPassGlobalKeyAndDo(GlobalKey gk, ValueChanged<GlobalKey> fn) => WidgetsBinding.instance.addPostFrameCallback(
  //       (_) {
  //         fn.call(gk);
  //       },
  //     );

  // static void afterNextBuildDoAsync(VoidCallback fn) => WidgetsBinding.instance.addPostFrameCallback(
  //       (_) async {
  //         fn.call();
  //       },
  //     );

  static Future afterMsDelayDo(int millis, VoidCallback fn) async => Future.delayed(Duration(milliseconds: millis), () {
        fn.call();
      });

  // static Future afterMsDelayDoAsync(int millis, VoidCallback fn) async => Future.delayed(Duration(milliseconds: millis), () async {
  //       fn.call();
  //     });

  static bool get isDesktopSized {
    return !isIOS && !isAndroid && scrW > 1023;
  }

  static bool get isWeb => kIsWeb;

  static bool get isAndroid => UniversalPlatform.isAndroid;

  static bool get isIOS => UniversalPlatform.isIOS;

  static bool get isMac => UniversalPlatform.isMacOS;

  static bool get isWindows => UniversalPlatform.isWindows;

  static bool get isFuchsia => UniversalPlatform.isFuchsia;

  static String? get deviceInfo => instance._responsive._deviceInfo;

  static PlatformEnum? get platform => instance._responsive._platform;

  static const double LARGEST_PHONE_WIDTH = 400.0;

  /// given a Rect, returns most appropriate alignment between target and callout within the wrapper
  /// NOTICE does not depend on callout size
  static Alignment calcTargetAlignmentWithinWrapper(Rect wrapperRect, final Rect targetRect) {
    // Rect? wrapperRect = findGlobalRect(widget.key as GlobalKey);

    Rect screenRect = Rect.fromLTWH(0, 0, Useful.scrW, Useful.scrH);
    wrapperRect = screenRect;
    Offset wrapperC = wrapperRect.center;
    Offset targetRectC = targetRect.center;
    double x = (targetRectC.dx - wrapperC.dx) / (wrapperRect.width / 2);
    double y = (targetRectC.dy - wrapperC.dy) / (wrapperRect.height / 2);
    // keep away from sides
    if (x < -0.75) {
      x = -1.0;
    } else if (x > 0.75) {
      x = 1.0;
    }
    if (y < -0.75) {
      y = -1.0;
    } else if (y > 0.75) {
      y = 1.0;
    }
    // print("$x, $y");
    return Alignment(x, y);
  }

  static Alignment calcTargetAlignmentWholeScreen(final Rect targetRect, double calloutW, double calloutH) {
    Rect screenRect = Rect.fromLTWH(0, 0, scrW, scrH);
    double T = targetRect.top;
    double L = targetRect.left;
    double B = screenRect.height - targetRect.bottom;
    double R = screenRect.width - targetRect.right;
    double spareAbove = T - calloutH;
    double spareBelow = B - calloutH;
    double spareOnLeft = L - calloutW;
    double spareOnRight = R - calloutW;
    double maxSpare = [spareAbove, spareBelow, spareOnLeft, spareOnRight].reduce(max);
    if (maxSpare == spareOnRight)
      return Alignment.centerRight;
    else if (maxSpare == spareOnLeft)
      return Alignment.centerLeft;
    else if (maxSpare == spareAbove)
      return Alignment.topCenter;
    else
      return Alignment.bottomCenter;
    // else if (maxSpare == spareBelow) return Alignment.topCenter;
    // bool calloutPossiblyOnLeft = L > calloutW;
    // bool calloutPossiblyOnRight = R > calloutW;
    // bool calloutPossiblyAbove = T > calloutH;
    // bool calloutPossiblyBelow = B > calloutH;
    // if (L > R) {
    //   bool onLeft = calloutPossiblyOnLeft;
    // } else {
    //   bool onRight = calloutPossiblyOnRight;
    // }
    // if (T > B) {
    //   bool above = calloutPossiblyAbove;
    // } else {
    //   bool below = calloutPossiblyBelow;
    // }
    // if ()
    //   if (calloutW < B) return Alignment.bottomCenter;
    // if (calloutW < T) return Alignment.topCenter;
    // if (calloutW < R) return Alignment.centerRight;
    // if (calloutW < L) return Alignment.centerLeft;
    //
    // return Alignment.center;
  }

  static Future<String> getPubspecYamlStringValue(final String name) async {
    final yamlString = await rootBundle.loadString('pubspec.yaml');
    final parsedYaml = loadYaml(yamlString);
    final String ver = parsedYaml[name];
    return ver;
  }

  static Offset? findGlobalPos(GlobalKey key) {
    BuildContext? cxt = key.currentContext;
    RenderObject? renderObject = cxt?.findRenderObject();
    return (renderObject as RenderBox).localToGlobal(Offset.zero);
  }

  static formattedDate(int ms) => DateFormat.yMMMd().format(DateTime.fromMillisecondsSinceEpoch(ms));

  static Text coloredText(
    String s, {
    double? fontSize,
    Color? color,
    String? fontFamily,
    double? letterSpacing,
    FontWeight? fontWeight,
    int? maxLines,
  }) =>
      Text(
        s,
        style: TextStyle(
          inherit: true,
          color: color,
          fontSize: fontSize,
          fontFamily: fontFamily,
          letterSpacing: letterSpacing,
          fontWeight: fontWeight,
        ),
        maxLines: maxLines,
        softWrap: (maxLines ?? 0) > 1,
        overflow: TextOverflow.ellipsis,
      );

  static Text purpleText(String s, {double? fontSize, String? family}) => Text(
        s,
        style: TextStyle(
          inherit: true,
          color: Colors.purple,
          fontSize: fontSize,
          fontFamily: family,
        ),
      );

  static TextStyle enclosureLabelTextStyle = const TextStyle(fontSize: 14, fontFamily: 'monospace', color: Colors.grey);

  static ButtonStyle buttonStyle(double fontSize) => TextButton.styleFrom(
        textStyle: TextStyle(fontSize: fontSize),
      );

  static Icon whiteIcon(IconData iconData) => Icon(iconData, color: Colors.white);

  static BoxDecoration rectangularBox({Color? color, double thickness = 1.0, double radius = 0.0}) {
    return BoxDecoration(
        color: color, border: Border.all(width: thickness), borderRadius: radius > 0 ? BorderRadius.all(Radius.circular(radius)) : null);
  }

  static Widget boxedText({String text = '', Color? color}) => Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.yellow[50],
          border: Border.all(width: 1),
        ),
        child: Text(text),
      );

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
        textStyle: fontSizeName?.flutterTextStyle(themeData: Theme.of(context)),
        fontSize: fontSize,
        fontStyle: fontStyle,
        fontWeight: fontWeight,
        height: lineHeight,
        letterSpacing: letterSpacing,
      );

  static final MIN_VISIBLE = 40.0;

  static (double, double) ensureOnScreen(Rect calloutRect) {
    double resultLeft = calloutRect.left;
    double resultTop = calloutRect.top;
    // adjust s.t entirely visible
    if (calloutRect.left > (Useful.scrW - MIN_VISIBLE)) {
      resultLeft = Useful.scrW - MIN_VISIBLE;
    }
    if (calloutRect.top > (Useful.scrH - MIN_VISIBLE - Useful.kbdH)) {
      resultTop = Useful.scrH - MIN_VISIBLE - Useful.kbdH;
    }
    if (calloutRect.right < MIN_VISIBLE) resultLeft = MIN_VISIBLE - calloutRect.width;
    if (calloutRect.bottom < MIN_VISIBLE) resultTop = MIN_VISIBLE - calloutRect.height;

    return (resultLeft, resultTop);
  }

  static (double, double) ensureOnScreenOLD(Rect calloutRect) {
    double startingCalloutLeft = calloutRect.left;
    double startingCalloutTop = calloutRect.top;
    double resultLeft = startingCalloutLeft;
    double resultTop = startingCalloutTop;
    // adjust s.t entirely visible
    if (startingCalloutLeft + calloutRect.width > Useful.scrW) {
      resultLeft = Useful.scrW - calloutRect.width;
    }
    if (startingCalloutTop + calloutRect.height > (Useful.scrH - Useful.kbdH)) {
      resultTop = Useful.scrH - calloutRect.height - Useful.kbdH;
    }
    if (startingCalloutLeft < 0) resultLeft = 0;
    if (startingCalloutTop < 0) resultTop = 0;

    return (resultLeft, resultTop);
  }
}

enum PlatformEnum { android, ios, web, windows, osx, fuchsia, linux }

class _Responsive {
  static final _Responsive instance = _Responsive._();
  String? _deviceInfo;
  PlatformEnum? _platform;

// private, named constructor
  _Responsive._();

  factory _Responsive() => instance;

  _Responsive init() {
    if (_deviceInfo == null) {
      try {
        if (kIsWeb) {
          instance._deviceInfo = 'web browser';
          instance._platform = PlatformEnum.web;
        } else if (UniversalPlatform.isAndroid) {
          DeviceInfoPlugin().androidInfo.then((info) {
            instance._deviceInfo = info.brand; //'${info.manufacturer} ${info.model}';
            instance._platform = PlatformEnum.android;
          });
        } else if (UniversalPlatform.isIOS) {
          DeviceInfoPlugin().iosInfo.then((info) {
            instance._deviceInfo = info.model; //'${info.model}';
            instance._platform = PlatformEnum.ios;
          });
        } else if (UniversalPlatform.isWindows) {
          instance._deviceInfo = 'Windows';
          instance._platform = PlatformEnum.windows;
        }
      } on Exception {
        instance._deviceInfo = 'not-android-nor-ios-nor-windows';
      }
    }
    return instance;
  }

// static var o, w, h;
// static void mq(BuildContext theCtx) {
//   o = MediaQuery.of(theCtx).orientation;
//   w = MediaQuery.of(theCtx).size.width;
//   h = MediaQuery.of(theCtx).size.height;
// }
//
// static double maxW(BuildContext ctx, int maxPixels) {
//   mq(ctx);
//   return min(w, maxPixels.toDouble());
// }
//
// static double screenW(BuildContext ctx) {
//   mq(ctx);
//   return w;
// }
//
// static double screenH(BuildContext ctx) {
//   mq(ctx);
//   return h;
// }

// static Size screenSize(BuildContext ctx) => MediaQuery.of(ctx).size;

// static bool isCloseToTopOrBottom(Offset position, Size screenSize) {
//   return position.dy <= 88.0 || (screenSize.height - position.dy) <= 88.0;
// }
//
// static bool isOnTopHalfOfScreen(Offset position, Size screenSize) {
//   return position.dy < (screenSize.height / 2.0);
// }
//
// static bool isOnLeftHalfOfScreen(Offset position, Size screenSize) {
//   return position.dx < (screenSize.width / 2.0);
// }

//  static bool isCloseToTopOrBottom(BuildContext ctx, Offset position) {
//    return position.dy <= 88.0 || (screenH(ctx) - position.dy) <= 88.0;
//  }
//
//  static bool isOnTopHalfOfScreen(BuildContext ctx, Offset position) {
//    return position.dy < (screenH(ctx) / 2.0);
//  }
//
//  bool isOnLeftHalfOfScreen(BuildContext ctx, Offset position) {
//    return position.dx < (screenW(ctx) / 2.0);
//  }

// // Determine if we should use mobile layout or not. The
// // number 600 here is a common breakpoint for a typical
// // 7-inch tablet.
//   static bool usePhoneLayout(BuildContext theCtx) {
//     // The equivalent of the "smallestWidth" qualifier on Android.
//     var shortestSide = MediaQuery.of(theCtx).size.shortestSide;
//     return shortestSide < 600;
//   }

// static bool narrowWidth(BuildContext theCtx) {
//   var q = MediaQuery.of(theCtx);
//   var shortestSide = q.size.shortestSide;
//   return shortestSide < 600 && q.orientation == Orientation.portrait;
// }
//
// static bool shortHeight(BuildContext theCtx) {
//   var q = MediaQuery.of(theCtx);
//   var shortestSide = q.size.shortestSide;
//   return shortestSide < 600 && q.orientation == Orientation.landscape;
// }

// Determine if we should use mobile layout or not. The
// number 600 here is a common breakpoint for a typical
// 7-inch tablet.
//   static bool usePhoneLayout(BuildContext theCtx) {
//     // The equivalent of the "smallestWidth" qualifier on Android.
//     var shortestSide = MediaQuery.of(theCtx).size.shortestSide;
//     return shortestSide < 600;
//   }
//
//   static bool useTabletLayout(BuildContext theCtx) {
//     var shortestSide = MediaQuery.of(theCtx).size.shortestSide;
//     return !kIsWeb && shortestSide >= 600;
//   }

// //------------------------------------------------------------------------------------------
}

extension ExtendedOffset on Offset {
  String toFlooredString() {
    return '(${dx.floor()}, ${dy.floor()})';
  }
}

bool _alreadyGaveGlobalPosAndSizeWarning = false;

extension GlobalKeyExtension on GlobalKey {
  (Offset?, Size?) globalPosAndSize() {
    Rect? r = globalPaintBounds();
    return (r?.topLeft, r?.size);
  }

  Rect? globalPaintBounds({bool skipWidthConstraintWarning = true, bool skipHeightConstraintWarning = true}) {
    var cc = currentWidget;
    final renderObject = currentContext?.findRenderObject();
    final translation = renderObject?.getTransformTo(null).getTranslation();
    // possibly warn about the target having an infinite width
    final paintBounds = renderObject?.paintBounds;
    if (!_alreadyGaveGlobalPosAndSizeWarning &&
        !skipWidthConstraintWarning &&
        !skipHeightConstraintWarning &&
        (paintBounds?.width == Useful.scrW || paintBounds?.height == Useful.scrH)) {
      _alreadyGaveGlobalPosAndSizeWarning = true;
      Callout.showOverlay(
        boxContentF: (BuildContext context) {
          return Column(
            children: [
              Useful.coloredText('Warning - Target Size Constraint', color: Colors.red),
              Text(
                paintBounds?.width == Useful.scrW
                    ? "\nThe width of your callout target is the same as the window width.\n"
                        "This might indicate that your target has an unbounded width constraint.\n"
                        "This occurs, for example, when your target is a child of a ListView.\n\n"
                        "If this is intentional, add 'skipContraintWarning:true' as an arg\n\n"
                        "  to constructor Callout.wrapTarget\n\n"
                        "  or to calls to Callout.showOverlay()\n\n"
                        "Context: ${cc.toString()}"
                    : "\nThe hwight of your callout target is the same as the window hwight.\n"
                        "This might indicate that your target has an unbounded hwight constraint.\n"
                        "If this height is intentional, add 'skipContraintWarning:true' as an arg\n\n"
                        "  to constructor Callout.wrapTarget\n\n"
                        "  or to calls to Callout.showOverlay()\n\n"
                        "Context: ${cc.toString()}",
              ),
              TextButton(
                onPressed: () {
                  Callout.removeParentCallout(context);
                },
                child: const Text('Close'),
              ),
            ],
          );
        },
        calloutConfig: CalloutConfig(
          feature: 'globalPaintBounds error',
          draggable: false,
          suppliedCalloutW: Useful.scrW * .7,
          suppliedCalloutH: 400,
          color: Colors.white,
        ),
      );
    }
    if (translation != null && paintBounds != null) {
      final offset = Offset(translation.x, translation.y);
      return paintBounds.shift(offset);
    } else {
      return null;
    }
  }
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
//     print(Theme.of(context).platform);
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
