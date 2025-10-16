import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

/// it's important to add the mixin, because callouts are animated
class PointerDemo extends StatefulWidget {
  const PointerDemo({super.key});

  @override
  State<PointerDemo> createState() => _PointerDemoState();
}

class _PointerDemoState extends State<PointerDemo> {
  final GlobalKey _gk = GlobalKey();
  late CalloutConfig _cc;
  late CalloutBarrierConfig _bc;

  // user can change callout properties even when a callout is already shown
  bool _showBarrier = false;

  // final bool _animateArrow = false;
  bool _showLineLabel = false;

  @override
  void initState() {
    super.initState();

    fco.afterNextBuildDo(() {
      // namedSC.jumpTo(150.0);
      // showOverlay requires a callout config + callout content + optionally, a target widget globalKey
      fco.showOverlay(
        calloutConfig: _cc = _createCalloutConfig(),
        calloutContent: _createCalloutContent(),
        targetGkF: () => _gk,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onTappedBarrier() {
    fco.showOverlay(
      calloutConfig: CalloutConfig(
        cId: 'tapped-barrier',
        scrollControllerName: null,
        elevation: 6,
      ),
      calloutContent: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.black),
              ),
              onPressed: () {
                fco.dismiss('some-callout-id');
                fco.dismiss('tapped-barrier');
              },
              child: const Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(
                  'You tapped the barrier.\n\n'
                  'The bool closeOnTap is false: gives you control over whether to allow user to close the callout.\n\n\n'
                  'Tap this button to remove this message callout and the yellow callout.',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// CalloutConfig objects are where you configure callouts and the way they point at their target.
  /// All params are shown, and many are commented out for this example callout.
  /// NOTE - a callout can be updated after it is created by updating properties and rebuilding it.
  CalloutConfig _createCalloutConfig() {
    _bc = CalloutBarrierConfig(
      cutoutPadding: fco.isWeb ? 20 : 10,
      excludeTargetFromBarrier: false,
      roundExclusion: false,
      closeOnTapped: false,
      onTappedF: _onTappedBarrier,
      color: Colors.grey,
      opacity: .9,
    );

    return CalloutConfig(
      cId: 'some-callout-id',
      // -- initial pos and animation ---------------------------------
      initialTargetAlignment: fco.isAndroid
          ? Alignment.topCenter
          : Alignment.centerLeft,
      initialCalloutAlignment: fco.isAndroid
          ? Alignment.bottomCenter
          : Alignment.centerRight,
      // initialCalloutPos:
      finalSeparation: 100,
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
      initialCalloutW: 280,
      // if not supplied, callout content widget gets measured
      initialCalloutH: 400,
      // if not supplied, callout content widget gets measured
      // borderRadius: 12,
      decorationBorderThickness: 3,
      decorationFillColors: ColorOrGradient.color(Colors.yellow[700]!),
      elevation: 10,
      // frameTarget: true,
      // -- optional close button and got it button -------------------
      // showGotitButton: true,
      // showCloseButton: true,
      // closeButtonColor:
      // closeButtonPos:
      // gotitAxis:
      // -- pointer -------------------------------------------------
      // arrowColor: Color.yellow(),
      targetPointerType: const TargetPointerType.thin_line(),
      animatePointer: false,
      lineLabel: _showLineLabel ? const Text('line label') : null,
      // frameTarget: true,
      // fromDelta: -20,
      // toDelta: -20,
      // lengthDeltaPc: ,
      // contentTranslateX: ,
      // contentTranslateY:
      // targetTranslateX:
      // targetTranslateY:
      scaleTarget: 1.0,
      // -- resizing -------------------------------------------------
      // resizeableH: true,
      // resizeableV: true,
      // -- dragging -------------------------------------------------
      // draggable: false,
      // draggableColor: Colors.green,
      // dragHandleHeight: ,
      scrollControllerName: null,
      // followScroll: false,
      barrier: _showBarrier ? _bc : null,
    );
  }

  Widget _createCalloutContent() => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Pointing out the icon widget.\n'),
        SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('show a barrier ?'),
              StatefulBuilder(
                builder: (context, setState) => Checkbox(
                  value: _cc.barrier != null,
                  onChanged: (_) {
                    setState(() => toggleShowBarrier());
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('show cutout ?'),
              StatefulBuilder(
                builder: (context, setState) => Checkbox(
                  value: _cc.barrier?.excludeTargetFromBarrier ?? false,
                  onChanged: (_) {
                    setState(() => toggleCutout());
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('round cutout ?'),
              StatefulBuilder(
                builder: (context, setState) => Checkbox(
                  value:
                      (_cc.barrier?.excludeTargetFromBarrier ?? false) &&
                      (_cc.barrier?.roundExclusion ?? false),
                  onChanged: (_) {
                    setState(() => toggleCutoutShape());
                  },
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: DropdownMenu<TargetPointerType>(
            initialSelection: _cc.targetPointerType,
            controller: TextEditingController(),
            requestFocusOnTap: true,
            inputDecorationTheme: const InputDecorationTheme(
              filled: true,
              contentPadding: EdgeInsets.all(20.0),
            ),
            label: const Text(
              'Pointer Type',
              style: TextStyle(color: Colors.blueGrey),
            ),
            onSelected: (TargetPointerType? newType) {
              if (newType == null) return;
              _changePointerType(newType);
            },
            dropdownMenuEntries: TargetPointerType.entries,
          ),
        ),
        if (_cc.targetPointerType != TargetPointerType.none &&
            _cc.targetPointerType != TargetPointerType.bubble)
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('animate arrow ?'),
                StatefulBuilder(
                  builder: (context, setState) => Checkbox(
                    value: _cc.animatePointer,
                    onChanged: (_) {
                      toggleAnimatedArrow();
                    },
                  ),
                ),
              ],
            ),
          ),
        if (_cc.targetPointerType != TargetPointerType.none &&
            _cc.targetPointerType != TargetPointerType.bubble)
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('show line label ?'),
                StatefulBuilder(
                  builder: (context, setState) => Checkbox(
                    value: _showLineLabel,
                    onChanged: (newVal) {
                      toggleLineLabel(newVal ?? false);
                    },
                  ),
                ),
              ],
            ),
          ),
      ],
    ),
  );

  void toggleShowBarrier() {
    setState(() {
      _showBarrier = !_showBarrier;
      _cc.barrier = _showBarrier ? _bc : null;
      fco.rebuild('some-callout-id');
    });
  }

  void toggleCutout() {
    setState(() {
      if (_cc.barrier != null) {
        _cc.barrier!.excludeTargetFromBarrier =
            !_cc.barrier!.excludeTargetFromBarrier;
        fco.rebuild('some-callout-id');
      }
    });
  }

  void toggleCutoutShape() {
    setState(() {
      if (_cc.barrier != null) {
        _cc.barrier!.roundExclusion = !_cc.barrier!.roundExclusion;
        fco.rebuild('some-callout-id');
      }
    });
  }

  void _changePointerType(TargetPointerType newType) {
    setState(() {
      _cc.targetPointerType = newType;
      fco.dismiss('some-callout-id');
      fco.showOverlay(
        calloutConfig: _cc,
        calloutContent: _createCalloutContent(),
        targetGkF: () => _gk,
      );
    });
  }

  void toggleAnimatedArrow() {
    setState(() {
      _cc.animatePointer = !(_cc.animatePointer ?? false);
      // because animate requires a controller created in its intState, we simply recreate the callout rather just rebuild
      // TODO may refine later
      fco.dismiss('some-callout-id');
      fco.showOverlay(
        calloutConfig: _cc,
        calloutContent: _createCalloutContent(),
        targetGkF: () => _gk,
      );
    });
  }

  void toggleLineLabel(bool newVal) {
    setState(() {
      _showLineLabel = newVal;
      fco.dismiss('some-callout-id');
      _cc.lineLabel = newVal ? const Text('line label') : null;
      fco.showOverlay(
        calloutConfig: _cc,
        calloutContent: _createCalloutContent(),
        targetGkF: () => _gk,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (_, _) {
        fco.dismissAll();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('flutter_callouts target pointer demo'),
        ),
        // give it extra height to show how scrolling can work with callouts
        // also notice we pass in the named scroll controller
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Text(
                'How your callout points to a target is highly configurable.\n\n'
                'Use the dropdown menu to try different ways.\n\n'
                'Drag the callout around to see how the callout keeps its pointer updated.',
                style: TextStyle(
                  color: Colors.green[900],
                  fontStyle: FontStyle.italic,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 200),
              Center(child: Icon(key: _gk, Icons.adb_rounded)),
            ],
          ),
        ),
        bottomSheet: Container(
          color: Colors.black,
          padding: const EdgeInsets.all(8),
          child: const Text(
            'demonstrating how callouts can point to their target',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
