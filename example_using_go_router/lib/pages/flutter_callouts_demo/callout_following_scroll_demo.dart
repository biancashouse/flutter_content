import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_callouts/flutter_callouts.dart';
import 'package:flutter_content/flutter_content.dart';

/// it's important to add the mixin, because callouts are animated
class ScrollingDemo extends StatefulWidget {
  const ScrollingDemo({super.key});

  @override
  State<ScrollingDemo> createState() => _ScrollingDemoState();
}

class _ScrollingDemoState extends State<ScrollingDemo> {
  final GlobalKey _blueIconGK = GlobalKey();
  final GlobalKey _redIconGK = GlobalKey();
  final GlobalKey _purpleIconGK = GlobalKey();
  final GlobalKey _pinkContainerGK = GlobalKey();
  final ScrollController sc = ScrollController();

  late CalloutConfig _cc1, _cc2;

  // user can change callout properties even when a callout is already shown
  bool followScroll1 = false;
  bool followScroll2 = false;
  bool didScroll = false;

  @override
  void initState() {
    super.initState();

    // catch scrolling so we can detect whether user has actually tried scrolling
    sc.addListener(() {
      if (sc.hasClients && sc.offset > 0) didScroll = true;
    });

    /// auto show a callout pointing at the FAB
    fco.afterNextBuildDo(() {
      // namedSC.jumpTo(150.0);
      // showOverlay requires a callout config + callout content + optionally, a target widget globalKey
      fco.showOverlay(
        calloutConfig: _cc1 = _createGreenCalloutConfig(),
        calloutContent: _createGreenContent(),
        targetGK: _blueIconGK,
      );
      fco.showOverlay(
        calloutConfig: _cc2 = _createYellowCalloutConfig(),
        calloutContent: _createYellowCalloutContent(),
        targetGK: _redIconGK,
        onReadyF: () {
          fco.showOverlay(
            calloutConfig: _createOrangeCalloutConfig(),
            calloutContent: _createOrangeCalloutContent(),
            targetGK: _purpleIconGK,
            callout2Follow: _cc2,
          );
        },
      );
      fco.showOverlay(
        calloutConfig: _createBlueCalloutConfig(),
        calloutContent: _createBlueContent(),
      );

      // dotted overlay test
        var borderRect = calcBorderRect();
        if (borderRect != null) {
          fco.showOverlay(
            skipOnScreenCheck: true,
            ensureLowestOverlay: true,
            calloutConfig: CalloutConfig(
              cId: 'dotted',
              initialCalloutW: borderRect.width,
              initialCalloutH: borderRect.height,
              initialCalloutPos: Offset(borderRect.left, borderRect.top),
              targetPointerType: TargetPointerType.none(),
              followScroll: true,
              decorationFillColors: ColorOrGradient.color(Colors.white10),
            ),
            calloutContent: Container(
              width: borderRect.width,
              height: borderRect.height,
              decoration: DottedDecoration(
                shape: Shape.box,
                dash: const <int>[6, 6],
                borderColor: Colors.black,
                strokeWidth: 3,
                fillColor: Colors.transparent,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'This is a callout with TargetPointerType.none(), '
                  'with initialCalloutPos set to the Rect of the '
                  'pink container that it covers.\n\n'
                  'Notice it follows scroll',
                ),
              ),
            ),
            targetGK: _pinkContainerGK,
          );
        }

      fco.showToast(
        gravity: Alignment.bottomCenter,
        msg: 'demonstrating dragging, resizing,\nand scrolling with callouts',
        textColor: Colors.white,
        fontSize: 16,
        fontStyle: FontStyle.italic,
        bgColor: Colors.black,
      );
      // if user hasn't scrolled in the next 5 secs, prompt to do so
      Timer(Duration(seconds: 5), () {
        if (!didScroll) {
          fco.showToast(
            gravity: Alignment.center,
            msg: 'scroll to see the callout pointer follow the target',
            textColor: Colors.yellow,
            bgColor: Colors.blue,
            removeAfterMs: 5000,
          );
        }
      });
    });
  }

  @override
  void dispose() {
    sc.dispose();
    super.dispose();
  }

  double get fontSize {
    double result = fco.scrW < 600 ? 12.0 : 24.0;
    return result;
  }

  /// CalloutConfig objects are where you configure callouts and the way they point at their target.
  /// All params are shown, and many are commented out for this example callout.
  /// NOTE - a callout can be updated after it is created by updating properties and rebuilding it.
  CalloutConfig _createGreenCalloutConfig() => CalloutConfig(
    cId: 'some-callout-id-1',
    // -- initial pos and animation ---------------------------------
    initialTargetAlignment: Alignment.topRight,
    initialCalloutAlignment: Alignment.bottomLeft,
    // initialCalloutPos:
    finalSeparation: 40,
    // fromDelta: 0.0,
    // toDelta : 0.0,
    // initialAnimatedPositionDurationMs:
    // -- optional barrier (when opacity > 0) ----------------------
    // barrier: CalloutBarrier(
    //   opacity: .5,
    //   onTappedF: () {
    //     Callout.dismiss("basic");
    //   },
    // ),
    // -- callout appearance ----------------------------------------
    initialCalloutW: 240,
    // if not supplied, callout content widget gets measured
    initialCalloutH: 150,
    // frameTarget: true,
    // -- optional close button and got it button -------------------
    // showGotitButton: true,
    // showCloseButton: true,
    // closeButtonColor:
    // closeButtonPos:
    // gotitAxis:
    // -- pointer -------------------------------------------------
    // arrowColor: Color.yellow(),
    targetPointerType: TargetPointerType.bubble(),
    bubbleOrTargetPointerColor: Colors.green[400],
    bubbleBorderRadius: 30,
    // targetPointerColor: Colors.yellow[700]!,
    // animatePointer: true,
    // lineLabel: Text('line label'),
    // fromDelta: -20,
    // toDelta: -20,
    // lengthDeltaPc: ,
    // contentTranslateX: ,
    // contentTranslateY:
    // targetTranslateX:
    // targetTranslateY:
    // scaleTarget: 1.0,
    // -- resizing -------------------------------------------------
    // resizeableH: true,
    // resizeableV: true,
    // -- dragging -------------------------------------------------
    // draggable: false,
    // draggableColor: Colors.green,
    // dragHandleHeight: ,
    followScroll: false,
  );

  CalloutConfig _createYellowCalloutConfig() => CalloutConfig(
    cId: 'some-callout-id-2',
    // -- initial pos and animation ---------------------------------
    initialCalloutAlignment: fco.isAndroid
        ? Alignment.bottomCenter
        : Alignment.centerRight,
    initialTargetAlignment: fco.isAndroid
        ? Alignment.topCenter
        : Alignment.centerLeft,
    // initialCalloutPos:
    finalSeparation: 60,
    initialCalloutW: 240,
    initialCalloutH: 120,
    // decorationBorderThickness: 3,
    decorationFillColors: ColorOrGradient.color(Colors.yellow[600]!),
    bubbleOrTargetPointerColor: Colors.yellow[600],
    // elevation: 10,
    targetPointerType: TargetPointerType.thin_line(),
    animatePointer: true,
    followScroll: false,
    resizeableH: true,
    resizeableV: true,
  );

  CalloutConfig _createOrangeCalloutConfig() => CalloutConfig(
    cId: 'some-callout-id-3',
    initialCalloutAlignment: Alignment.bottomCenter,
    initialTargetAlignment: Alignment.centerLeft,
    // initialCalloutPos:
    finalSeparation: 150,
    initialCalloutW: 240,
    initialCalloutH: 70,
    decorationBorderThickness: 3,
    decorationFillColors: ColorOrGradient.gradient([
      Colors.orange[300]!,
      Colors.deepOrangeAccent,
    ]),
    bubbleOrTargetPointerColor: Colors.orange[600],
    // elevation: 3,
    targetPointerType: TargetPointerType.thin_line(),
    followScroll: false,
  );

  CalloutConfig _createBlueCalloutConfig() => CalloutConfig(
    cId: 'some-callout-id-4',
    // abs pos bottom right of screen
    initialCalloutPos: Offset(fco.scrW - 350, fco.scrH - 260),
    // initialCalloutW: 300,
    // initialCalloutH: 160,
    targetPointerType: TargetPointerType.none(),
    followScroll: false,
    resizeableH: true,
    resizeableV: true,
  );

  Widget _createGreenContent() => IntrinsicHeight(
    child: Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('This is a "bubble" callout\npointing out the blue icon.\n'),
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('followScroll?'),
                StatefulBuilder(
                  builder: (context, setState) => Checkbox(
                    value: _cc1.followScroll,
                    onChanged: (_) {
                      setState(() => toggleFollowScroll1());
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  Widget _createBlueContent() => IntrinsicHeight(
    child: Container(
      padding: const EdgeInsets.all(18.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.black54, Colors.black],
        ),
      ),
      child: fco.coloredText(
        'This is a callout with no target pointer.\n'
        'It is rendered at an Absolute Position\n'
        'rather than being calculated from\n'
        ' a Target and Callout Alignment.\n\n'
        'It\'s still draggable and resizable.\n\n'
        'BTW - this callout\'s size is actually\n'
        'measured by the API, whereas the others\n'
        'have an explicit initialCalloutW and ...H.',
        color: Colors.white,
      ),
    ),
  );

  Widget _createYellowCalloutContent() => IntrinsicHeight(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Pointing out the red icon.'),
          SizedBox(height: 20.0),
          Center(
            child: Icon(
              key: _purpleIconGK,
              Icons.adb_rounded,
              color: Colors.purpleAccent,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('followScroll?'),
                StatefulBuilder(
                  builder: (context, setState) => Checkbox(
                    value: _cc2.followScroll,
                    onChanged: (_) {
                      setState(() => toggleFollowScroll2());
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  Widget _createOrangeCalloutContent() => IntrinsicHeight(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('Pointing out the purple icon\ninside another callout.\n'),
    ),
  );

  void toggleFollowScroll1() {
    setState(() {
      followScroll1 = !followScroll1;
      _cc1.followScroll = followScroll1;
      fco.rebuild('some-callout-id-1');
    });
  }

  void toggleFollowScroll2() {
    setState(() {
      followScroll2 = !followScroll2;
      _cc2.followScroll = followScroll2;
      fco.rebuild('some-callout-id-2');
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (_, _) {
        fco.dismissAll();
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'flutter_callouts scrolling demo',
              style: TextStyle(fontWeight: FontWeight.bold),
              textScaler: TextScaler.linear(1.4),
            ),
          ),
          // give it extra height to show how scrolling can work with callouts
          // also notice we pass in the named scroll controller
          body: SingleChildScrollView(
            controller: sc,
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Text(
                      'All these callouts have been configured to be draggable.\n\n'
                      'The yellow callout is also resizable, and its arrow animated.\n\n'
                      'When scrolling your UI, you can have the callout stay in place\n'
                      'of follow the scroll.\n\n'
                      'The configuration can be updated in real time. E.g. when you change the\n'
                      '"followScroll?" checkbox, the scroll behaviour changes.\n\n'
                      'Try dragging the yellow callout and scrolling the screen...',
                      style: TextStyle(
                        color: Colors.green[900],
                        fontStyle: FontStyle.italic,
                        fontSize: fontSize,
                      ),
                    ),
                  ),
                  SizedBox(height: 100.0),
                  Center(
                    child: Icon(
                      key: _redIconGK,
                      Icons.adb_rounded,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(height: 100.0),
                  Center(
                    child: Icon(
                      key: _blueIconGK,
                      Icons.adb_rounded,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 100.0),
                  Container(
                    key: _pinkContainerGK,
                    color: Colors.pink,
                    width: 300,
                    height: 1000,
                  ),
                  SizedBox(height: 500),
                ],
              ),
            ),
          ),
          // bottomSheet: Container(
          //   width: double.infinity,
          //   height: 70.0,
          //   color: Colors.black,
          //   padding: EdgeInsets.all(8),
          //   child: Text(
          //     'demonstrating dragging, resizing,\nand scrolling with callouts',
          //     style: TextStyle(color: Colors.white),
          //     textAlign: TextAlign.center,
          //   ),
          // ),
        ),
      ),
    );
  }

  Rect? calcBorderRect() {
    // var gkState = nodeWidgetGK?.currentState;
    // var gkCtx = nodeWidgetGK?.currentContext;
    Rect? r = _pinkContainerGK.globalPaintBounds(
      skipWidthConstraintWarning: true,
      skipHeightConstraintWarning: true,
    );

    // in case widget doesn't have a key (e.g. inlinespans)
    // r ??= (getParent() as SNode?)?.nodeWidgetGK?.globalPaintBounds(
    //   skipWidthConstraintWarning: true,
    //   skipHeightConstraintWarning: true,
    // );
    if (r != null) {
      Rect borderRect;
      // ensure has a width and height
      if (r.width < 1.0 || r.height < 1.0) {
        double w = max(r.width, 40);
        double h = max(r.height, 24);
        borderRect = Rect.fromLTWH(r.left, r.top, w, h);
      } else {
        borderRect = r;
      }

      return borderRect;
    }
    return null;
  }
}
