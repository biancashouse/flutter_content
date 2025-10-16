import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      onTap: () => showQuillEditor(originalDelta, onChangeF, scName),
      child: fco.coloredText(
        'tap here to edit the Quill text',
        color: Colors.white,
      ),
    );
  }

  static void showQuillEditor(
    String originalDelta,
    ValueChanged<String> onChangeF,
    ScrollControllerName? scName,
  ) {
    final QuillController controller = QuillController.basic();
    controller.document = Document.fromJson(jsonDecode(originalDelta));
    CalloutConfig teCC = CalloutConfig(
      cId: 'quill-te',
      scrollControllerName: scName,
      // containsTextField: true,
      barrier: CalloutBarrierConfig(
        opacity: .25,
        onTappedF: () {
          onChangeF(jsonEncode(controller.document.toDelta().toJson()));
          fco.dismiss('quill-te');
        },
      ),
      decorationFillColors: ColorOrGradient.color(Colors.purpleAccent),
      targetPointerType: TargetPointerType.none(),
      initialCalloutW: min(1024, fco.scrW * .8),
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
              showLink: false,
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
                          controller.formatSelection(BackgroundAttribute(hex));
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
                          controller.formatSelection(ColorAttribute(hex));
                        },
                      ),
                    );
                  },
                ),
                QuillToolbarCustomButtonOptions(
                  icon: const Icon(Icons.link, color: Colors.black),
                  onPressed: () {
                    Color? selectedColor;
                    if (_isToggledColor(controller)) {
                      Color selectedColor = fco.hexToColor(
                        controller
                            .getSelectionStyle()
                            .attributes['link']
                            ?.value,
                      );
                    }
                    showLinkDialog(controller, scName);
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

  static const cid_linkEditor = 'link-editor';

  static void showLinkDialog(controller, scName) {
    fco.registerKeystrokeHandler(cid_linkEditor, (KeyEvent event) {
      if (event.logicalKey == LogicalKeyboardKey.escape) {
        fco.dismiss(cid_linkEditor);
      }
      if (event.logicalKey == LogicalKeyboardKey.enter) {
        return true;
      }
      return false;
    });
    fco.showOverlay(
      calloutContent: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          fco.purpleText('Create a link', fontSize: 24, family: 'Merriweather'),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            width: 480,
            height: 100,
            child: StringOrNumberEditor(
              inputType: String,
              prompt: () => 'page address',
              originalS: '',
              onTextChangedF: (String s) async {},
              onEscapedF: (_) {
                fco.dismiss(cid_linkEditor);
              },
              dontAutoFocus: false,
              onEditingCompleteF: (s) async {
                // if (!s.startsWith('http://')) return;
                String uri = s.replaceAll(' ', '-').toLowerCase();
                controller.formatSelection(LinkAttribute(uri));
                fco.dismiss(cid_linkEditor);
                return;
              },
            ),
          ),
        ],
      ),
      calloutConfig: CalloutConfig(
        cId: cid_linkEditor,
        // initialTargetAlignment: Alignment.bottomLeft,
        // initialCalloutAlignment: Alignment.topRight,
        // finalSeparation: 200,
        barrier: CalloutBarrierConfig(
          opacity: .5,
          onTappedF: () async {
            fco.dismiss(cid_linkEditor);
          },
        ),
        initialCalloutW: 500,
        initialCalloutH: 180,
        decorationBorderRadius: 12,
        decorationFillColors: ColorOrGradient.color(Colors.white),
        scrollControllerName: scName,
        onDismissedF: () {
          fco.removeKeystrokeHandler(cid_linkEditor);
        },
      ),
      // targetGkF: ()=> fco.authIconGK,
    );
  }
}
