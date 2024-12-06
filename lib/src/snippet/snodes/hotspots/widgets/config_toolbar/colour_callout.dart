import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';

import 'package:flutter_content/flutter_content.dart';

class TargetColourTool extends StatelessWidget {
  final TargetModel tc;
  final Rect wrapperRect;
  final VoidCallback onParentBarrierTappedF;
  final String? scrollControllerName;
  final bool justPlaying;

  const TargetColourTool(
    this.tc,
    this.wrapperRect,
    this.onParentBarrierTappedF, {
    this.scrollControllerName,
    required this.justPlaying,
    super.key,
  });

  // late ArrowType _arrowType;
  CAPIBloC get bloc => FlutterContentApp.capiBloc;

  @override
  Widget build(BuildContext context) {
    void colorPicked(Color pickedColor) {
      tc.setCalloutColor(pickedColor);
      // STreeNode.hideAllTargetCovers();
      // STreeNode.showAllTargetCovers();
      // fco.refreshOverlay(tc.snippetName);
      // // bloc.add(CAPIEvent.TargetModelChanged(newTC: tc));
      // fco.afterNextBuildDo(() {
      //   widget.onParentBarrierTappedF.call();
      //   fco.refreshOverlay(tc.snippetName, f: () {});
      removeSnippetContentCallout(tc);
      tc
          .targetsWrapperState()
          ?.zoomer
          ?.zoomImmediately(tc.transformScale, tc.transformScale);
      tc.targetsWrapperState()?.refresh(() {
        showSnippetContentCallout(
          tc: tc,
          wrapperRect: wrapperRect,
          justPlaying: false,
          // widget.onParentBarrierTappedF,
          scrollControllerName: scrollControllerName,
        );
      });
    }

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () => colorPicked(Colors.black),
                child: fco.coloredText('black', color: Colors.white),
              ),
              TextButton(
                onPressed: () => colorPicked(Colors.transparent),
                child: const Text('transparent'),
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () => colorPicked(Colors.white),
                child: const Text('white'),
              ),
            ],
          ),
          ColorPicker(
            // Use the screenPickerColor as color.
            color: tc.calloutColor(),
            // Update the screenPickerColor using the callback.
            onColorChanged: (Color color) => colorPicked(color),
            // onCompleted: () => fco.dismiss(cId),
            width: 32,
            height: 32,
            borderRadius: 16,
            subheading: const Divider(height: 30),
          ),
        ],
      ),
    );
  }

  static show(
    final TargetModel tc,
    final Rect wrapperRect, {
    required VoidCallback onBarrierTappedF,
    final String? scrollControllerName,
    required final bool justPlaying,
  }) {
    GlobalKey? targetGK =
        // tc.single
        // ? FCO.getSingleTargetGk(tc.wName)
        // :
        fco.getTargetGk(tc.uid);

    fco.showOverlay(
      targetGkF: () => targetGK,
      calloutConfig: CalloutConfig(
        cId: 'color-picker',
        initialCalloutW: 320,
        initialCalloutH: 380,
        fillColor: Colors.purpleAccent,
        borderRadius: 16,
        arrowType: ArrowType.NONE,
        barrier: CalloutBarrier(
          opacity: 0.1,
        ),
        notUsingHydratedStorage: true,
      ),
      calloutContent: TargetColourTool(
        tc,
        wrapperRect,
        onBarrierTappedF,
        scrollControllerName: scrollControllerName,
        justPlaying: justPlaying,
      ),
    );
  }

  static bool isShowing() => fco.anyPresent(["arrow-type"]);
}
