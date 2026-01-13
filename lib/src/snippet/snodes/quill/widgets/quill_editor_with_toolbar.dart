
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/model/quill_target_model.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_target_pointer_type.dart';
import 'package:flutter_content/src/snippet/snodes/hotspots/widgets/hotspot_target_config_toolbar/colour_picker_tool.dart';
import 'package:flutter_content/src/snippet/snodes/quill/widgets/timestamp_embed.dart';
import 'package:flutter_quill/flutter_quill.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

import 'help_icon_embed.dart'; // Import hooks

// ... other imports

// Convert from StatelessWidget to HookWidget
class QuillEditorWithToolbar extends HookWidget {
  final QuillTextNode quillTextNode;
  final ValueChanged<String> onChangeF;
  final QuillController controller;
  final FocusNode focusNode; // We only need the focusNode

  const QuillEditorWithToolbar({
    required this.quillTextNode,
    required this.onChangeF,
    required this.controller,
    required this.focusNode,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // This hook will rebuild the widget whenever the focusNode notifies its listeners.
    useListenable(focusNode);

    final linkStyle = DefaultStyles(/* ... */);

    return ListView(
      shrinkWrap: true,
      children: [
        if (false && focusNode.hasFocus)
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              decoration: BoxDecoration(color: Colors.purpleAccent),
              child: QuillSimpleToolbar(
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
                          selectedColor = fco.hexToColor(
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
                        if (_isToggledColor(controller)) {
                          fco.hexToColor(
                            controller
                                .getSelectionStyle()
                                .attributes['link']
                                ?.value,
                          );
                        }
                        _showLinkDialog(controller);
                      },
                    ),
                    QuillToolbarCustomButtonOptions(
                      icon: SizedBox(
                        width: 30,
                        child: Stack(
                          children: [
                            Icon(Icons.info_outline_rounded, size: 20),
                            Align(
                              alignment: AlignmentGeometry.topRight,
                              child: Icon(
                                Icons.add,
                                size: 10,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      tooltip: 'Insert a help Button',
                      onPressed: () {
                        QuillTargetModel? qt = _createQuillTarget();
                        if (qt == null) return;

                        // Get the current selection
                        final index = controller.selection.baseOffset;
                        final length = controller.selection.extentOffset - index;

                        // Insert a custom block with our key ('my-icon') and the icon's code
                        controller.replaceText(
                          index,
                          length,
                          BlockEmbed.custom(
                            CustomBlockEmbed(
                              'quill-help-icon-button',
                              jsonEncode(qt.toMap()),
                            ),
                          ),
                          null,
                        );

                        quillTextNode.deltaJsonString = jsonEncode(
                          controller.document.toDelta().toJson(),
                        );

                        var snippet = quillTextNode.rootNodeOfSnippet();
                        if (snippet != null) {
                          fco.modelRepo.saveNewVersionOfSnippet(snippet);
                        }
                      },
                    ),
                    // QuillToolbarCustomButtonOptions(
                    //   icon: const Icon(Icons.notes),
                    //   tooltip: 'add a note',
                    //   onPressed: () {
                    //     _addEditNote(controller);
                    //   },
                    // ),
                    QuillToolbarCustomButtonOptions(
                      icon: const Icon(Icons.access_time),
                      onPressed: () {
                        controller.document.insert(
                          controller.selection.extentOffset,
                          TimeStampEmbed(DateTime.now().toString()),
                        );

                        controller.updateSelection(
                          TextSelection.collapsed(
                            offset: controller.selection.extentOffset + 1,
                          ),
                          ChangeSource.local,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        QuillEditor.basic(
          controller: controller,
          focusNode: focusNode,
          config: QuillEditorConfig(
            embedBuilders: [
              HelpIconEmbedBuilder(parentSNode: quillTextNode),
              TimeStampEmbedBuilder(),
            ],
          ),
        ),
      ],
    );
  }

  QuillTargetModel? _createQuillTarget() {
    if (!fco.canEditContent()) return null;

    TargetId newTargetId = DateTime.now().millisecondsSinceEpoch;
    return QuillTargetModel(
      uid: newTargetId,
      calloutDurationMs: 2000,
      calloutFillColors: UpTo6Colors(color1: ColorModel.white()),
      targetPointerTypeEnum: TargetPointerTypeEnum.WAVY,
    );
  }

  bool _isToggledColor(QuillController controller) {
    var attrs = controller.getSelectionStyle().attributes;
    return attrs.containsKey(Attribute.color.key);
  }

  bool _isToggledBackground(QuillController controller) {
    var attrs = controller.getSelectionStyle().attributes;
    return attrs.containsKey(Attribute.background.key);
  }

  static const cid_linkEditor = 'link-editor';

  void _showLinkDialog(QuillController controller) {
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

        onDismissedF: () {
          fco.removeKeystrokeHandler(cid_linkEditor);
        },
      ),
      // targetGkF: ()=> fco.authIconGK,
    );
  }
}
