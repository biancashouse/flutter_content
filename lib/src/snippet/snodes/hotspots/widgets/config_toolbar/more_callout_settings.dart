import 'package:flutter/material.dart';

import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_button_bool.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_button_number_T.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/mappable_enum_decoration.dart';

class MoreCalloutConfigSettings extends StatefulWidget {
  final TargetModel tc;
  final Rect wrapperRect;
  final ScrollControllerName? scName;

  const MoreCalloutConfigSettings(
    this.tc,
    this.wrapperRect, {
    this.scName,
    super.key,
  });

  @override
  State<MoreCalloutConfigSettings> createState() =>
      _MoreCalloutConfigSettingsState();

  static show(
    final TargetModel tc,
    final Rect wrapperRect, {
    ScrollControllerName? scName,
    required final bool justPlaying,
  }) {
    GlobalKey? targetGK =
        // tc.single
        //     ? FCO.getSingleTargetGk(tc.wName)
        //     :
        fco.getTargetGk(tc.uid);

    fco.showOverlay(
        targetGkF: () => targetGK,
        calloutContent: MoreCalloutConfigSettings(
          tc,
          wrapperRect,
          scName: scName,
        ),
        calloutConfig: CalloutConfigModel(
          cId: "more-cc-settings",
          initialCalloutW: 200,
          initialCalloutH: 550,
          barrier: CalloutBarrierConfig(
            opacity: 0.1,
            // onTappedF: () async {
            //   // FlutterContentApp.capiBloc.add(CAPIEvent.TargetModelChanged(newTC: tc));
            //   fco.dismiss("more-cc-settings");
            //   removeSnippetContentCallout(tc.snippetName);
            //   FCO.parentTW(twName)?.zoomer?.resetTransform();
            //   FlutterContentApp.capiBloc.add(const CAPIEvent.unhideAllTargetGroups());
            //   // fco.afterNextBuildDo(() {
            //   //   showSnippetContentCallout(
            //   //     twName: twName,
            //   //     tc: tc,
            //   //     justPlaying: justPlaying,
            //   //   );
            //   // });
            // },
          ),
          fillColor: ColorModel.purpleAccent(),
          borderRadius: 16,
          arrowType: ArrowTypeEnum.NONE,
          notUsingHydratedStorage: true,
          scrollControllerName: scName,
        ));
  }

  static bool isShowing() => fco.anyPresent(["more-cc-settings"]);
}

class _MoreCalloutConfigSettingsState extends State<MoreCalloutConfigSettings> {
  TargetModel get tc => widget.tc;

  CAPIBloC get bloc => FlutterContentApp.capiBloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (tc.calloutDecorationShape != MappableDecorationShapeEnum.circle
            && tc.calloutDecorationShape != MappableDecorationShapeEnum.rectangle_dotted
            && tc.calloutDecorationShape != MappableDecorationShapeEnum.rounded_rectangle_dotted
            && tc.calloutDecorationShape != MappableDecorationShapeEnum.stadium
            && tc.calloutDecorationShape != MappableDecorationShapeEnum.star
        )
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('borderRadius: '),
            Align(
              alignment: Alignment.center,
              child: PropertyButtonNumber<double>(
                originalValue: tc.calloutBorderRadius,
                onChangedF: (newValue) {
                  tc.calloutBorderRadius = double.tryParse(newValue) ?? 0;
                  tc.changed_saveRootSnippet();
                  _refreshContentCallout();
                },
                alignment: Alignment.center,
                label: '${tc.calloutBorderRadius}',
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
              const Text('borderWidth: '),
              Align(
                alignment: Alignment.center,
                child: PropertyButtonNumber<double>(
                  originalValue: tc.calloutBorderThickness,
                  onChangedF: (newValue) {
                    tc.calloutBorderThickness = double.tryParse(newValue) ?? 0;
                    tc.changed_saveRootSnippet();
                    _refreshContentCallout();
                  },
                  alignment: Alignment.center,
                  label: '${tc.calloutBorderThickness}',
                  buttonSize: const Size(40, 30),
                  editorSize: const Size(60, 60),
                ),
              ),
            ]),
        if (tc.calloutDecorationShape == MappableDecorationShapeEnum.star)
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
                      tc.changed_saveRootSnippet();
                      _refreshContentCallout();
                    },
                    alignment: Alignment.center,
                    label: '${tc.starPoints ?? 7}',
                    buttonSize: const Size(40, 30),
                    editorSize: const Size(60, 60),
                  ),
                ),
              ]),
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
                  tc.changed_saveRootSnippet();
                  _refreshContentCallout();
                },
              ),
            ]),
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
                tc.changed_saveRootSnippet();
                _refreshContentCallout();
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
                tc.changed_saveRootSnippet();
                _refreshContentCallout();
              },
            ),
          ],
        ),
      ],
    ));
  }

  void _refreshContentCallout() {
    fco.dismiss("more-cc-settings");
    removeSnippetContentCallout(tc, skipOnDismiss: true);
    tc
        .targetsWrapperState()
        ?.zoomer
        ?.zoomImmediately(tc.transformScale, tc.transformScale);
    showSnippetContentCallout(
      tc: tc,
      wrapperRect: widget.wrapperRect,
      justPlaying: false,
      // widget.onParentBarrierTappedF,
      scName: widget.scName,
    );
    TargetsWrapper.showConfigToolbar(
      tc,
      widget.wrapperRect,
      widget.scName,
    );
  }
}
