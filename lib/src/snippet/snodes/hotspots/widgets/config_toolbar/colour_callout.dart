import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';

import 'package:flutter_content/flutter_content.dart';

class TargetColourTool extends StatelessWidget {
  final CalloutConfigModel cc;
  final TargetModel tc;
  final Rect wrapperRect;
  final VoidCallback onParentBarrierTappedF;
  final ScrollControllerName? scName;
  final bool justPlaying;

  const TargetColourTool(
    this.cc,
    this.tc,
    this.wrapperRect,
    this.onParentBarrierTappedF, {
    this.scName,
    required this.justPlaying,
    super.key,
  });

  // late ArrowType _arrowType;
  CAPIBloC get bloc => fco.capiBloc;

  @override
  Widget build(BuildContext context) {
    void colorPicked(Color pickedColor) {
      tc.setCalloutColor(ColorModel.fromColor(pickedColor));
      tc.changed_saveRootSnippet();
      // STreeNode.hideAllTargetCovers();
      // STreeNode.showAllTargetCovers();
      // fco.refreshOverlay(tc.snippetName);
      // // bloc.add(CAPIEvent.TargetModelChanged(newTC: tc));
      // fco.afterNextBuildDo(() {
      //   widget.onParentBarrierTappedF.call();
      //   fco.refreshOverlay(tc.snippetName, f: () {});
      fco.dismiss('color-picker');
      CalloutConfigToolbar.closeThenReopenContentCallout(
        cc,
        tc,
        wrapperRect,
        scName,
      );
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
            color: tc.calloutFillColor!.flutterValue,
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

  static void show(
    CalloutConfigModel cc,
    TargetModel tc,
    Rect wrapperRect, {
    required VoidCallback onBarrierTappedF,
    ScrollControllerName? scName,
    required bool justPlaying,
  }) {
    GlobalKey? targetGK =
        // tc.single
        // ? FCO.getSingleTargetGk(tc.wName)
        // :
        fco.getTargetGk(tc.uid);

    fco.showOverlay(
      targetGkF: () => targetGK,
      calloutConfig: CalloutConfigModel(
        cId: 'color-picker',
        initialCalloutW: 320,
        initialCalloutH: 380,
        fillColor: ColorModel.purpleAccent(),
        borderRadius: 16,
        arrowType: ArrowTypeEnum.NONE,
        barrier: CalloutBarrierConfig(
          opacity: 0.1,
        ),
        notUsingHydratedStorage: true,
        scrollControllerName: scName,
      ),
      calloutContent: TargetColourTool(
        cc,
        tc,
        wrapperRect,
        onBarrierTappedF,
        scName: scName,
        justPlaying: justPlaying,
      ),
    );
  }

  static bool isShowing() => fco.anyPresent(["arrow-type"]);
}
