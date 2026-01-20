import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/model/quill_target_model.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_target_pointer_type.dart';
import 'package:flutter_content/src/snippet/snodes/quill/widgets/quill_align_button.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;

/// Custom toolbar that uses the buttons of [`flutter_quill`](https://pub.dev/packages/flutter_quill).
///
/// See also: [Custom toolbar](https://github.com/singerdmx/flutter-quill/blob/master/doc/custom_toolbar.md).
class QuillToolbarToast extends StatelessWidget {
  final QuillTextNode quillTextNode;
  final Function(String, {bool forceRefresh}) onChangeF;
  final QuillController controller;
  final FocusNode focusNode; // We only need the focusNode
  final ValueNotifier<bool> isDirty;

  const QuillToolbarToast({
    required this.quillTextNode,
    required this.onChangeF,
    required this.controller,
    required this.focusNode,
    required this.isDirty,
    super.key,
  });

  static void show({
    required QuillTextNode quillTextNode,
    required Function(String, {bool forceRefresh}) onChange,
    required QuillController controller,
    required FocusNode focusNode, // We only need the focusNode
    required ValueNotifier<bool> isDirty,
  }) {
    fco.showToastOverlay(
      skipAnimation: true,
      calloutConfig: CalloutConfig(
        gravity: Alignment.topLeft,
        cId: 'quill-toolbar-toast',
        initialCalloutW: fco.scrW - 50,
        initialCalloutH: 120,
        decorationFillColors: ColorOrGradient.color(Colors.black),
        decorationBorderThickness: 3,
        decorationBorderColors: ColorOrGradient.color(Colors.purpleAccent),
        elevation: 10,
      ),
      calloutContent: QuillToolbarToast(
        quillTextNode: quillTextNode,
        onChangeF: onChange,
        controller: controller,
        focusNode: focusNode,
        isDirty: isDirty,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final purpleIconTheme = QuillIconTheme(
      iconButtonUnselectedData: IconButtonData(
        iconSize: 20,
        disabledColor: Colors.white30,
        color: Colors.purple,
      ),
    );

    final purpleHistoryButtonOptions = QuillToolbarHistoryButtonOptions(
      iconTheme: purpleIconTheme,
    );

    final purpleToggleStyleButtonOptions = QuillToolbarToggleStyleButtonOptions(
      iconTheme: purpleIconTheme,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          width: fco.scrW - 50,
          child: Wrap(
            runAlignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              QuillToolbarHistoryButton(
                isUndo: true,
                controller: controller,
                options: purpleHistoryButtonOptions,
              ),
              QuillToolbarHistoryButton(
                isUndo: false,
                controller: controller,
                options: purpleHistoryButtonOptions,
              ),
              // QuillToolbarFontFamilyButton(
              //   options: QuillToolbarFontFamilyButtonOptions(
              //     iconTheme: purpleIconTheme,
              //   ),
              //   controller: controller,
              // ),
              QuillToolbarToggleStyleButton(
                options: purpleToggleStyleButtonOptions,
                controller: controller,
                attribute: Attribute.bold,
              ),
              QuillToolbarToggleStyleButton(
                options: purpleToggleStyleButtonOptions,
                controller: controller,
                attribute: Attribute.italic,
              ),
              QuillToolbarToggleStyleButton(
                controller: controller,
                attribute: Attribute.underline,
                options: purpleToggleStyleButtonOptions,
              ),
              QuillToolbarClearFormatButton(
                controller: controller,
                options: QuillToolbarClearFormatButtonOptions(
                  iconTheme: purpleIconTheme,
                ),
              ),
              const VerticalDivider(),
              QuillToolbarSelectAlignmentButtons(
                controller: controller,
                options: QuillToolbarSelectAlignmentButtonOptions(
                  iconTheme: purpleIconTheme,
                ),
              ), // QuillToolbarImageButton(controller: controller),
              // QuillToolbarCameraButton(controller: controller),
              // QuillToolbarVideoButton(controller: controller),
            ],
          ),
        ),
        SizedBox(
          width: fco.scrW - 50,
          child: Wrap(
            children: [
              QuillToolbarColorButton(
                controller: controller,
                isBackground: false,
                options: QuillToolbarColorButtonOptions(
                  iconTheme: purpleIconTheme,
                ),
              ),
              QuillToolbarColorButton(
                controller: controller,
                isBackground: true,
                options: QuillToolbarColorButtonOptions(
                  iconTheme: purpleIconTheme,
                ),
              ),
              const VerticalDivider(),
              QuillToolbarFontFamilyButton(
                baseOptions: QuillToolbarBaseButtonOptions(
                  afterButtonPressed: () {
                    final isDesktop = {
                      TargetPlatform.linux,
                      TargetPlatform.windows,
                      TargetPlatform.macOS
                    }.contains(defaultTargetPlatform);
                    if (isDesktop) {
                      focusNode.requestFocus();
                    }
                  },
                ),
                options: QuillToolbarFontFamilyButtonOptions(
                    items: {
                      'merriweather': GoogleFonts.merriweather().fontFamily!,
                      'hand-writing': GoogleFonts.damion().fontFamily!,
                    }
                ),
                controller: controller,
              ),
              const VerticalDivider(),
              QuillToolbarSelectHeaderStyleDropdownButton(
                controller: controller,
                options: QuillToolbarSelectHeaderStyleDropdownButtonOptions(
                  iconTheme: purpleIconTheme,
                ),
              ),
              const VerticalDivider(),
              QuillToolbarSelectLineHeightStyleDropdownButton(
                controller: controller,
                options: QuillToolbarSelectLineHeightStyleDropdownButtonOptions(
                  iconTheme: purpleIconTheme,
                ),
              ),
              const VerticalDivider(),
              QuillToolbarToggleCheckListButton(
                controller: controller,
                options: QuillToolbarToggleCheckListButtonOptions(
                  iconTheme: purpleIconTheme,
                ),
              ),
              QuillToolbarToggleStyleButton(
                controller: controller,
                attribute: Attribute.ol,
                options: purpleToggleStyleButtonOptions,
              ),
              QuillToolbarToggleStyleButton(
                controller: controller,
                attribute: Attribute.ul,
                options: purpleToggleStyleButtonOptions,
              ),
              QuillToolbarToggleStyleButton(
                controller: controller,
                attribute: Attribute.inlineCode,
                options: purpleToggleStyleButtonOptions,
              ),
              QuillToolbarToggleStyleButton(
                controller: controller,
                attribute: Attribute.blockQuote,
                options: purpleToggleStyleButtonOptions,
              ),
              QuillToolbarIndentButton(
                controller: controller,
                isIncrease: true,
                options: QuillToolbarIndentButtonOptions(
                  iconTheme: purpleIconTheme,
                ),
              ),
              QuillToolbarIndentButton(
                controller: controller,
                isIncrease: false,
                options: QuillToolbarIndentButtonOptions(
                  iconTheme: purpleIconTheme,
                ),
              ),
              const VerticalDivider(),
              QuillToolbarLinkStyleButton(
                controller: controller,
                options: QuillToolbarLinkStyleButtonOptions(
                  iconTheme: purpleIconTheme,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: fco.scrW - 50,
          child: Wrap(
            children: [
              SizedBox(
                width: 32,
                height: 32,
                child: Tooltip(
                  message:
                      'Insert a help Button\nat the current cursor position',
                  child: InkWell(
                    onTap: () => _insertAnInfoEmbed(controller, isDirty),
                    child: const Icon(Icons.comment, color: Colors.white),
                  ),
                ),
              ),
              const VerticalDivider(),
              SizedBox(
                width: 32,
                height: 32,
                child: Tooltip(
                  message:
                  'Font Family',
                  child: InkWell(
                    onTap: () {
                      final fontAttribute = FontAttribute('Courier');
                      controller.formatSelection(fontAttribute);
                      },
                    child: const Icon(Icons.brush, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _insertAnInfoEmbed(
    QuillController controller,
    ValueNotifier<bool> isDirty,
  ) {
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
        CustomBlockEmbed('quill-help-icon-button', jsonEncode(qt.toMap())),
      ),
      null,
    );

    fco.afterNextBuildDo(() {
      fco.dismiss('quill-popup-buttons');
    });

    final newJson = jsonEncode(controller.document.toDelta().toJson());
    isDirty.value = false; // Reset the dirty flag.
    onChangeF(newJson, forceRefresh: true);
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
}
