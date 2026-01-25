import 'package:flutter/material.dart';

import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/model/quill_target_model.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_button_enum.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_button_number_T.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_target_pointer_type.dart';
import 'package:flutter_content/src/snippet/snodes/hotspots/widgets/hotspot_target_config_toolbar/colour_picker_tool.dart';
import 'package:flutter_content/src/snippet/snodes/hotspots/widgets/hotspot_target_config_toolbar/duration_callout.dart';
import 'package:flutter_content/src/snippet/snodes/quill/widgets/help_icon_embed.dart';

import 'more_callout_settings.dart';

// import 'more_callout_settings.dart';

class QuillTargetConfigToolbar extends StatelessWidget {
  final QuillTextNode parentNode;
  final QuillTargetModel Function() qtF;
  final void Function(QuillTargetModel)? onTargetConfigChange;
  final void Function(QuillTargetModel)? onTargetConfigRemove;
  final ScrollConfig? sc;
  final VoidCallback onCloseF;

  const QuillTargetConfigToolbar({
    required this.parentNode,
    required this.qtF,
    this.onTargetConfigChange,
    this.onTargetConfigRemove,
    required this.sc,
    required this.onCloseF,

    super.key,
  });

  static const CID = 'quill-callout-config-toolbar';

  static double CALLOUT_CONFIG_TOOLBAR_W = 500;

  static double CALLOUT_CONFIG_TOOLBAR_H = 60.0;

  // @override
  @override
  Widget build(BuildContext context) {
    final color = qtF().bgColor();
    return SizedBox(
      width: QuillTargetConfigToolbar.CALLOUT_CONFIG_TOOLBAR_W,
      height: QuillTargetConfigToolbar.CALLOUT_CONFIG_TOOLBAR_H,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          toolbarVFlipIcon(),
          const VerticalDivider(color: Colors.white, width: 2),
          IconButton(
            tooltip: 'edit the callout show duration in ms...',
            icon: const Icon(Icons.timer, color: Colors.white),
            onPressed: () {
              showTargetDurationCallout(
                tc: qtF(),
                onTargetConfigChange: onTargetConfigChange,
              );
            },
          ),
          const VerticalDivider(color: Colors.white, width: 2),
          IconButton(
            tooltip: 'change the callout fill colour...',
            icon: Icon(Icons.palette_outlined, color: color),
            onPressed: () {
              showTargetColorTool(
                onColorPickedF: (Color? pickedColor) {
                  if (pickedColor != null) {
                    qtF().setCalloutFillColor(
                      ColorModel.fromColor(pickedColor),
                    );
                    CalloutConfig? contentCC = fco.findCalloutConfig(
                      'quill-target-${qtF().contentCId}',
                    );
                    contentCC?.decorationFillColors = ColorOrGradient.color(
                      pickedColor,
                    );
                    contentCC?.bubbleOrTargetPointerColor = pickedColor;
                    contentCC!.rebuild(() {});
                    onTargetConfigChange?.call(qtF());
                    fco.dismiss(QuillTargetConfigToolbar.CID);
                    qtF().showConfigToolbar(
                      parentNode: parentNode,
                      scrollConfig: sc,
                      onTargetConfigChange: (updatedTargetConfig) {
                        HelpIconEmbedBuilder.updateParentQuillTextNode(
                          updatedTargetConfig: updatedTargetConfig,
                          parentSNode: parentNode,
                        );
                      },
                    );
                  }
                  fco.dismiss('color-picker');
                },
              );
            },
          ),
          const VerticalDivider(color: Colors.white, width: 2),
          Tooltip(
            message: 'configure callout shape...',
            child: PropertyButtonEnum(
              label: "shape",
              skipShowingLabel: true,
              // passing label as the cId
              menuItems: DecorationShapeEnum.values
                  .map(
                    (e) => e.toMenuItem(
                      fillColors: qtF().calloutConfig?.decorationFillColors,
                    ),
                  )
                  .toList(),
              originalEnumIndex: qtF().calloutDecorationShapeEnum?.index,
              onChangeF: (newIndex) {
                fco.dismiss('shape');
                qtF().calloutDecorationShapeEnum =
                    DecorationShapeEnum.of(newIndex) ??
                    DecorationShapeEnum.rectangle;
                if (qtF().calloutDecorationShapeEnum ==
                    DecorationShapeEnum.rectangle) {
                  qtF().calloutBorderRadius = 0;
                }
                if (qtF().calloutDecorationShapeEnum ==
                    DecorationShapeEnum.star) {
                  qtF().targetPointerTypeEnum = TargetPointerTypeEnum.NONE;
                } else {
                  qtF().targetPointerTypeEnum = TargetPointerTypeEnum.WAVY;
                }
                qtF().calloutBorderColors = UpTo6Colors(
                  color1: ColorModel.grey(),
                );
                CalloutConfig? contentCC = fco.findCalloutConfig(
                  'quill-target-${qtF().contentCId}',
                );
                contentCC?.decorationShape =
                    qtF().calloutDecorationShapeEnum?.decorationShape;
                contentCC?.decorationBorderColors = qtF().calloutBorderColors
                    ?.getColorOrGradient();
                contentCC?.decorationBorderThickness =
                    qtF().calloutBorderThickness;
                contentCC?.decorationBorderRadius =
                    qtF().calloutBorderThickness;
                onTargetConfigChange?.call(qtF());
                contentCC!.rebuild(() {});
                fco.dismiss(QuillTargetConfigToolbar.CID, skipOnDismiss: true);
                qtF().showConfigToolbar(
                  parentNode: parentNode,
                  scrollConfig: sc,
                  onTargetConfigChange: onTargetConfigChange,
                  onTargetConfigRemove: onTargetConfigRemove,
                );
              },
              wrap: true,
              calloutButtonSize: const Size(70, 40),
              calloutSize: const Size(240, 220),
            ),
          ),
          // IconButton(
          //   tooltip: 'more callout settings...',
          //   icon: const Icon(Icons.more_vert, color: Colors.white),
          //   onPressed: () {
          //     MoreCalloutConfigSettings.show(
          //       tc: qtF(),
          //       parentNode: parentNode,
          //       justPlaying: false,
          //       onTargetConfigChange: onTargetConfigChange,
          //     );
          //   },
          // ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (qtF().calloutDecorationShapeEnum !=
                      DecorationShapeEnum.circle &&
                  qtF().calloutDecorationShapeEnum !=
                      DecorationShapeEnum.rectangle_dotted &&
                  qtF().calloutDecorationShapeEnum !=
                      DecorationShapeEnum.rounded_rectangle_dotted &&
                  qtF().calloutDecorationShapeEnum !=
                      DecorationShapeEnum.stadium &&
                  qtF().calloutDecorationShapeEnum != DecorationShapeEnum.star)
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('borderRadius: '),
                    Align(
                      alignment: Alignment.center,
                      child: PropertyButtonNumber<double>(
                        originalValue: qtF().calloutBorderRadius ?? 0.0,
                        onChangedF: (newValue) {
                          qtF().calloutBorderRadius =
                              double.tryParse(newValue) ?? 30;
                          qtF().calloutConfig!.decorationBorderRadius =
                              qtF().calloutBorderRadius;
                          print('save...');
                          onTargetConfigChange?.call(qtF());
                          fco.dismiss("more-cc-settings");
                          qtF().closeThenReopenConfigToolbar(
                            parentNode: parentNode,
                            sc: sc,
                            onTargetConfigChange: onTargetConfigChange,
                          );
                        },
                        alignment: Alignment.center,
                        label: '${qtF().calloutBorderRadius}',
                        buttonSize: const Size(40, 30),
                        editorSize: const Size(60, 60),
                      ),
                    ),
                  ],
                ),
              if (qtF().calloutDecorationShapeEnum !=
                      DecorationShapeEnum.rectangle_dotted &&
                  qtF().calloutDecorationShapeEnum !=
                      DecorationShapeEnum.rounded_rectangle_dotted)
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('borderWidth: '),
                    Align(
                      alignment: Alignment.center,
                      child: PropertyButtonNumber<double>(
                        originalValue: qtF().calloutBorderThickness ?? 2.0,
                        onChangedF: (newValue) {
                          qtF().calloutBorderThickness =
                              double.tryParse(newValue) ?? 0;
                          qtF().calloutConfig!.decorationBorderThickness =
                              qtF().calloutBorderThickness;
                          onTargetConfigChange?.call(qtF());
                          fco.dismiss("more-cc-settings");
                          qtF().closeThenReopenConfigToolbar(
                            parentNode: parentNode,
                            sc: sc,
                            onTargetConfigChange: onTargetConfigChange,
                          );
                        },
                        alignment: Alignment.center,
                        label: '${qtF().calloutBorderThickness}',
                        buttonSize: const Size(40, 30),
                        editorSize: const Size(60, 60),
                      ),
                    ),
                  ],
                ),
              if (qtF().calloutDecorationShapeEnum == DecorationShapeEnum.star)
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('star points: '),
                    Align(
                      alignment: Alignment.center,
                      child: PropertyButtonNumber<int>(
                        originalValue: qtF().starPoints ?? 7,
                        onChangedF: (String newValue) {
                          qtF().setCalloutStarPoints(int.tryParse(newValue));
                          onTargetConfigChange?.call(qtF());
                          fco.dismiss("more-cc-settings");
                          qtF().closeThenReopenConfigToolbar(
                            parentNode: parentNode,
                            sc: sc,
                            onTargetConfigChange: onTargetConfigChange,
                          );
                        },
                        alignment: Alignment.center,
                        label: '${qtF().starPoints ?? 7}',
                        buttonSize: const Size(40, 30),
                        editorSize: const Size(60, 60),
                      ),
                    ),
                  ],
                ),
            ],
          ),
          const VerticalDivider(color: Colors.white, width: 2),
          IconButton(
            tooltip: 'delete this target.',
            icon: const Icon(Icons.delete, color: Colors.orangeAccent),
            onPressed: () {
              onTargetConfigRemove?.call(qtF());
              // parentNode.targetGks.remove(qtF().contentCId);
              fco.hide(qtF().contentCId);
              fco.dismiss(QuillTargetConfigToolbar.CID);
              fco.forceRefresh();
            },
          ),
          const VerticalDivider(color: Colors.white, width: 2),
          IconButton(
            tooltip: 'close this toolbar',
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () {
              qtF().removeContentCallout();
              fco.dismiss(QuillTargetConfigToolbar.CID);
              fco.dismiss('quill-target-${qtF().contentCId}');
            },
          ),
          const VerticalDivider(color: Colors.white, width: 2),
          toolbarVFlipIcon(),
        ],
      ),
    );
  }

  Widget toolbarVFlipIcon() => IconButton(
    onPressed: () {
      final toolbarCC = fco.findCalloutConfig(QuillTargetConfigToolbar.CID);
      if (toolbarCC == null) return;
      // toggle top
      toolbarCC.top = (toolbarCC.top ?? 0.0) > 10 ? 10 : fco.scrH - 90;
      fco.refresh(QuillTargetConfigToolbar.CID);
    },
    icon: Icon(
      (fco.findCalloutConfig(QuillTargetConfigToolbar.CID)?.top ?? 0.0) <= 10
          ? Icons.arrow_downward
          : Icons.arrow_upward,
      color: Colors.white70,
    ),
  );

  void showTargetColorTool({required ColorPickedCallback onColorPickedF}) {
    // GlobalKey? targetGK = qtF().gk;

    fco.showOverlay(
      // targetGK: targetGK,
      calloutConfig: CalloutConfig(
        cId: 'color-picker',
        initialCalloutW: 320,
        initialCalloutH: 380,
        decorationFillColors: ColorOrGradient.color(Colors.purpleAccent),
        decorationBorderRadius: 16,
        targetPointerType: TargetPointerType.none(),
        barrier: CalloutBarrierConfig(opacity: 0.1),
      ),
      calloutContent: ColourPickerTool(
        originalColor:
            qtF().calloutFillColors?.color1?.flutterValue ?? Colors.white,
        onColorPickedF: onColorPickedF,
      ),
    );
  }
}
