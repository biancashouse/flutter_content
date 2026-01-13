import 'package:flutter/material.dart';

import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/model/quill_target_model.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_button_bool.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_button_number_T.dart';

class MoreCalloutConfigSettings extends StatelessWidget {
  final QuillTargetModel tc;
  final QuillTextNode parentNode;
  final void Function(QuillTargetModel)? onTargetConfigChange;
  final ScrollConfig? sc;

  const MoreCalloutConfigSettings({
    required this.tc,
    required this.parentNode,
    this.onTargetConfigChange,
    this.sc,
    super.key,
  });
  
  static void show({
    required QuillTargetModel tc,
    required QuillTextNode parentNode,
    required bool justPlaying,
    void Function(QuillTargetModel)? onTargetConfigChange,
  }) {
    // GlobalKey? targetGK = tc.gk;

    fco.showOverlay(
      // targetGK: targetGK,
      calloutContent: MoreCalloutConfigSettings(tc: tc, parentNode: parentNode),
      calloutConfig: CalloutConfig(
        cId: "more-cc-settings",
        initialCalloutW: 200,
        initialCalloutH: 550,
        barrier: CalloutBarrierConfig(
          opacity: 0.1,
          // onTappedF: () async {
          //   // fco.capiBloc.add(CAPIEvent.TargetModelChanged(newTC: tc));
          //   fco.dismiss("more-cc-settings");
          //   removeSnippetContentCallout(tc.snippetName);
          //   FCO.parentTW(twName)?.zoomer?.resetTransform();
          //   fco.capiBloc.add(const CAPIEvent.unhideAllTargetGroups());
          //   // fco.afterNextBuildDo(() {
          //   //   showSnippetContentCallout(
          //   //     twName: twName,
          //   //     tc: tc,
          //   //     justPlaying: justPlaying,
          //   //   );
          //   // });
          // },
        ),
        decorationFillColors: ColorOrGradient.color(Colors.purpleAccent),
        decorationBorderRadius: 16,
        targetPointerType: TargetPointerType.none(),
      ),
    );
  }

  static bool isShowing() => fco.anyPresent(["more-cc-settings"]);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (tc.calloutDecorationShapeEnum != DecorationShapeEnum.circle &&
              tc.calloutDecorationShapeEnum !=
                  DecorationShapeEnum.rectangle_dotted &&
              tc.calloutDecorationShapeEnum !=
                  DecorationShapeEnum.rounded_rectangle_dotted &&
              tc.calloutDecorationShapeEnum != DecorationShapeEnum.stadium &&
              tc.calloutDecorationShapeEnum != DecorationShapeEnum.star)
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('borderRadius: '),
                Align(
                  alignment: Alignment.center,
                  child: PropertyButtonNumber<double>(
                    originalValue: tc.calloutBorderRadius??0.0,
                    onChangedF: (newValue) {
                      tc.calloutBorderRadius = double.tryParse(newValue) ?? 30;
                      tc.calloutConfig!.decorationBorderRadius = tc.calloutBorderRadius;
                      print('save...');
                      onTargetConfigChange?.call(tc);
                      fco.dismiss("more-cc-settings");
                      tc.closeThenReopenConfigToolbar(
                        parentNode: parentNode,
                        sc: sc,
                        onTargetConfigChange: onTargetConfigChange,
                      );
                    },
                    alignment: Alignment.center,
                    label: '${tc.calloutBorderRadius}',
                    buttonSize: const Size(40, 30),
                    editorSize: const Size(60, 60),
                  ),
                ),
              ],
            ),
          if (tc.calloutDecorationShapeEnum !=
              DecorationShapeEnum.rectangle_dotted &&
              tc.calloutDecorationShapeEnum !=
                  DecorationShapeEnum.rounded_rectangle_dotted)
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('borderWidth: '),
                Align(
                  alignment: Alignment.center,
                  child: PropertyButtonNumber<double>(
                    originalValue: tc.calloutBorderThickness??2.0,
                    onChangedF: (newValue) {
                      tc.calloutBorderThickness =
                          double.tryParse(newValue) ?? 0;
                      tc.calloutConfig!.decorationBorderThickness = tc.calloutBorderThickness;
                      onTargetConfigChange?.call(tc);
                      fco.dismiss("more-cc-settings");
                      tc.closeThenReopenConfigToolbar(
                        parentNode: parentNode,
                        sc: sc,
                        onTargetConfigChange: onTargetConfigChange,

                      );
                    },
                    alignment: Alignment.center,
                    label: '${tc.calloutBorderThickness}',
                    buttonSize: const Size(40, 30),
                    editorSize: const Size(60, 60),
                  ),
                ),
              ],
            ),
          if (tc.calloutDecorationShapeEnum == DecorationShapeEnum.star)
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('star points: '),
                Align(
                  alignment: Alignment.center,
                  child: PropertyButtonNumber<int>(
                    originalValue: tc.starPoints ?? 7,
                    onChangedF: (String newValue) {
                      tc.setCalloutStarPoints(int.tryParse(newValue));
                      onTargetConfigChange?.call(tc);
                      fco.dismiss("more-cc-settings");
                      tc.closeThenReopenConfigToolbar(
                        parentNode: parentNode,
                        sc: sc,
                        onTargetConfigChange: onTargetConfigChange,

                      );
                    },
                    alignment: Alignment.center,
                    label: '${tc.starPoints ?? 7}',
                    buttonSize: const Size(40, 30),
                    editorSize: const Size(60, 60),
                  ),
                ),
              ],
            ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('resizeableH: '),
              PropertyEditorBool(
                name: '',
                boolValue: tc.canResizeH,
                onChanged: (newValue) {
                  tc.canResizeH = newValue;
                  onTargetConfigChange?.call(tc);
                  fco.dismiss("more-cc-settings");
                  tc.closeThenReopenConfigToolbar(
                    parentNode: parentNode,
                    sc: sc,
                    onTargetConfigChange: onTargetConfigChange,

                  );
                },
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('resizeable V: '),
              PropertyEditorBool(
                name: '',
                boolValue: tc.canResizeV,
                onChanged: (newValue) {
                  tc.canResizeV = newValue;
                  onTargetConfigChange?.call(tc);
                  fco.dismiss("more-cc-settings");
                  tc.closeThenReopenConfigToolbar(
                    parentNode: parentNode,
                    sc: sc,
                    onTargetConfigChange: onTargetConfigChange,

                  );
                },
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('follow scroll?'),
              PropertyEditorBool(
                name: '',
                boolValue: tc.followScroll,
                onChanged: (newValue) {
                  tc.followScroll = newValue;
                  onTargetConfigChange?.call(tc);
                  fco.dismiss("more-cc-settings");
                  tc.closeThenReopenConfigToolbar(
                    parentNode: parentNode,
                    sc: sc,
                    onTargetConfigChange: onTargetConfigChange,

                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
