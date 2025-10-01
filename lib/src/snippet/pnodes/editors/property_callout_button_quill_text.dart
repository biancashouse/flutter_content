import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_quill/flutter_quill.dart';

import '../../snodes/hotspots/widgets/config_toolbar/colour_picker_tool.dart';

class PropertyButtonQuillText extends StatelessWidget {
  final String originalDelta;
  final String? label;
  final Size calloutButtonSize;
  final GlobalKey propertyBtnGK;
  final ValueChanged<String> onChangeF;
  final ScrollControllerName? scName;

  const PropertyButtonQuillText({
    required this.originalDelta,
    this.label,
    required this.calloutButtonSize,
    required this.onChangeF,
    required this.propertyBtnGK,
    required this.scName,
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>showQuillEditor(originalDelta, onChangeF, scName),
      child: fco.coloredText(
        'tap here to edit the Quill text',
        color: Colors.white,
      ),
    );
  }

  static void showQuillEditor(String originalDelta, ValueChanged<String> onChangeF, ScrollControllerName? scName) {
    final QuillController controller = QuillController.basic();
    controller.document = Document.fromJson(
      jsonDecode(originalDelta),
    );
    CalloutConfig teCC = CalloutConfig(
      cId: 'quill-te',
      scrollControllerName: scName,
      // containsTextField: true,
      barrier: CalloutBarrierConfig(
        opacity: .25,
        onTappedF: () {
          onChangeF(
            jsonEncode(controller.document.toDelta().toJson()),
          );
          fco.dismiss('quill-te');
        },
      ),
      decorationFillColors: ColorOrGradient.color(Colors.purpleAccent),
      targetPointerType: TargetPointerType.none(),
      initialCalloutW: min(1024,fco.scrW * .8),
      initialCalloutH: fco.scrH * .8,
      onDismissedF: () {
        print('wtf');
      },
      onAcceptedF: () {},
      resizeableH: true,
      resizeableV: true,
      onResizeF: (Size newSize) {},
      onDragF: (Offset newOffset) {},
      draggable: false,
      notUsingHydratedStorage: true,
    );
    Widget calloutContent = Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          QuillSimpleToolbar(
            controller: controller,
            config: QuillSimpleToolbarConfig(
              showColorButton: false,
              showBackgroundColorButton: false,
              showSubscript: false,
              showSuperscript: false,
              showStrikeThrough: false,
              customButtons: [
                QuillToolbarCustomButtonOptions(
                  icon: const Icon(
                    Icons.format_color_fill,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Color? selectedColor;
                    if (_isToggledBackground(controller)) {
                      selectedColor = fco.hexToColor(
                        controller
                            .getSelectionStyle()
                            .attributes['background']
                            ?.value,
                      );
                    }
                    fco.showOverlay(
                      calloutConfig: CalloutConfig(
                        cId: 'color-picker',
                        initialCalloutW: 320,
                        initialCalloutH: 380,
                        decorationFillColors: ColorOrGradient.color(
                          Colors.purpleAccent,
                        ),
                        decorationBorderRadius: 16,
                        targetPointerType: TargetPointerType.none(),
                        barrier: CalloutBarrierConfig(opacity: 0.1),
                        notUsingHydratedStorage: true,
                        scrollControllerName: scName,
                        onDismissedF: () {},
                      ),
                      calloutContent: ColourPickerTool(
                        originalColor: selectedColor ?? Colors.white,
                        onColorPickedF: (Color? newColor) {
                          if (newColor == null) {
                            controller.formatSelection(
                              const BackgroundAttribute(null),
                            );
                            return;
                          }
                          var hex = fco.colorToHex(newColor);
                          hex = '#$hex';
                          controller.formatSelection(
                            BackgroundAttribute(hex),
                          );
                        },
                      ),
                    );
                  },
                ),
                QuillToolbarCustomButtonOptions(
                  icon: const Icon(Icons.color_lens, color: Colors.black),
                  onPressed: () {
                    Color? selectedColor;
                    if (_isToggledColor(controller)) {
                      Color selectedColor = fco.hexToColor(
                        controller
                            .getSelectionStyle()
                            .attributes['color']
                            ?.value,
                      );
                    }
                    fco.showOverlay(
                      calloutConfig: CalloutConfig(
                        cId: 'color-picker',
                        initialCalloutW: 320,
                        initialCalloutH: 380,
                        decorationFillColors: ColorOrGradient.color(
                          Colors.purpleAccent,
                        ),
                        decorationBorderRadius: 16,
                        targetPointerType: TargetPointerType.none(),
                        barrier: CalloutBarrierConfig(opacity: 0.1),
                        notUsingHydratedStorage: true,
                        scrollControllerName: scName,
                      ),
                      calloutContent: ColourPickerTool(
                        originalColor: selectedColor ?? Colors.white,
                        onColorPickedF: (Color? newColor) {
                          if (newColor == null) {
                            controller.formatSelection(
                              const ColorAttribute(null),
                            );
                            return;
                          }
                          var hex = fco.colorToHex(newColor);
                          hex = '#$hex';
                          controller.formatSelection(
                            ColorAttribute(hex),
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: QuillEditor.basic(
              controller: controller,
              config: const QuillEditorConfig(),
            ),
          ),
        ],
      ),
    );
    fco.dismissAll();
    fco.showOverlay(
      calloutConfig: teCC,
      calloutContent: calloutContent,
      // targetGkF: () => propertyBtnGK,
    );
  }

  static bool _isToggledColor(controller) {
    var attrs = controller.getSelectionStyle().attributes;
    return attrs.containsKey(Attribute.color.key);
  }

  static bool _isToggledBackground(controller) {
    var attrs = controller.getSelectionStyle().attributes;
    return attrs.containsKey(Attribute.background.key);
  }
}
