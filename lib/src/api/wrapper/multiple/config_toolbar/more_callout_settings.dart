import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_decoration.dart';
import 'package:flutter_content/src/target_config/content/callout_snippet_content.dart';
import 'package:flutter_content/src/target_config/content/snippet_editor/node_properties/node_property_button_bool.dart';
import 'package:flutter_content/src/target_config/content/snippet_editor/node_properties/node_property_button_double.dart';
import 'package:flutter_content/src/target_config/content/snippet_editor/node_properties/node_property_button_number.dart';

class MoreCalloutConfigSettings extends StatefulWidget {
  final TargetsWrapperName twName;
  final TargetConfig tc;
  final ScrollController? ancestorHScrollController;
  final ScrollController? ancestorVScrollController;

  const MoreCalloutConfigSettings(
    this.twName,
    this.tc, {
    this.ancestorHScrollController,
    this.ancestorVScrollController,
    super.key,
  });

  @override
  State<MoreCalloutConfigSettings> createState() =>
      _MoreCalloutConfigSettingsState();

  static show(
    final TargetsWrapperName twName,
    final TargetConfig tc, {
    final ScrollController? ancestorHScrollController,
    final ScrollController? ancestorVScrollController,
    required final bool justPlaying,
  }) {
    GlobalKey? targetGK =
        // tc.single
        //     ? FC().getSingleTargetGk(tc.wName)
        //     :
        FC().getMultiTargetGk(tc.uid.toString());

    Callout.showOverlay(
        targetGkF: () => targetGK,
        boxContentF: (_) => MoreCalloutConfigSettings(
              twName,
              tc,
              ancestorHScrollController: ancestorHScrollController,
              ancestorVScrollController: ancestorVScrollController,
            ),
        calloutConfig: CalloutConfig(
          feature: CAPI.MORE_CALLOUT_CONFIG_SETTINGS.name,
          suppliedCalloutW: 200,
          suppliedCalloutH: 440,
          barrier: CalloutBarrier(
            opacity: 0.1,
            // onTappedF: () async {
            //   // FC().capiBloc.add(CAPIEvent.targetConfigChanged(newTC: tc));
            //   Callout.dismiss(CAPI.MORE_CALLOUT_CONFIG_SETTINGS.name);
            //   removeSnippetContentCallout(tc.snippetName);
            //   FC().parentTW(twName)?.zoomer?.resetTransform();
            //   FC().capiBloc.add(const CAPIEvent.unhideAllTargetGroups());
            //   // Useful.afterNextBuildDo(() {
            //   //   showSnippetContentCallout(
            //   //     twName: twName,
            //   //     tc: tc,
            //   //     justPlaying: justPlaying,
            //   //   );
            //   // });
            // },
          ),
          fillColor: Colors.purpleAccent,
          borderRadius: 16,
          arrowType: ArrowType.NO_CONNECTOR,
          notUsingHydratedStorage: true,
        ));
  }

  static bool isShowing() =>
      Callout.anyPresent([CAPI.MORE_CALLOUT_CONFIG_SETTINGS.name]);
}

class _MoreCalloutConfigSettingsState extends State<MoreCalloutConfigSettings> {
  TargetConfig get tc => widget.tc;

  CAPIBloC get bloc => FC().capiBloc;

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
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('borderRadius: '),
            SizedBox(
              width: 40,
              height: 40,
              child: Align(
                alignment: Alignment.center,
                child: NodePropertyEditor_Double(
                  originalValue: tc.calloutBorderRadius,
                  onChangedF: (newValue) {
                    tc.calloutBorderRadius = double.tryParse(newValue)??0;
                    _refreshContentCallout();
                  },
                  alignment: Alignment.center,
                  label: '${tc.calloutBorderRadius}',
                  calloutButtonSize: const Size(40, 30),
                ),
              ),
            ),
          ],
        ),
        Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('borderWidth: '),
              SizedBox(
                width: 40,
                height: 40,
                child: Align(
                  alignment: Alignment.center,
                  child: NodePropertyEditor_Number<double>(
                    originalValue: tc.calloutBorderThickness,
                    onChangedF: (newValue) {
                      tc.calloutBorderThickness = double.tryParse(newValue)??0;
                      _refreshContentCallout();
                    },
                    alignment: Alignment.center,
                    label: '${tc.calloutBorderThickness}',
                    calloutButtonSize: const Size(40, 30),
                  ),
                ),
              ),
            ]),
        if (tc.calloutDecorationShape == DecorationShapeEnum.star)
          Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('star points: '),
                SizedBox(
                  width: 40,
                  height: 40,
                  child: Align(
                    alignment: Alignment.center,
                    child: NodePropertyEditor_Number<int>(
                      originalValue: tc.starPoints ?? 7,
                      onChangedF: (newValue) {
                        tc.starPoints = int.tryParse(newValue) ?? 7;
                        _refreshContentCallout();
                      },
                      alignment: Alignment.center,
                      label: '${tc.starPoints}',
                      calloutButtonSize: const Size(40, 30),
                    ),
                  ),
                ),
              ]),
        Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('resizeableH: '),
              NodePropertyEditorBool(
                name: '',
                boolValue: tc.canResizeH,
                onChanged: (newValue) {
                  tc.canResizeH = newValue;
                  _refreshContentCallout();
                },
              ),
            ]),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('resizeable V: '),
            NodePropertyEditorBool(
              name: '',
              boolValue: tc.canResizeV,
              onChanged: (newValue) {
                tc.canResizeV = newValue;
                _refreshContentCallout();
              },
            ),
          ],
        ),
      ],
    ));
  }

  void _refreshContentCallout() {
    Callout.dismiss(CAPI.MORE_CALLOUT_CONFIG_SETTINGS.name);
    removeSnippetContentCallout(tc.snippetName);
    FC()
        .parentTW(widget.twName)
        ?.zoomer
        ?.zoomImmediately(tc.transformScale, tc.transformScale);
    showSnippetContentCallout(
      twName: widget.twName,
      tc: tc,
      justPlaying: false,
      // widget.onParentBarrierTappedF,
    );
  }
}
