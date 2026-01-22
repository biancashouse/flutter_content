import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart' hide Line;
import 'package:flutter_content/src/model/quill_target_model.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_button_font_family.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_target_pointer_type.dart';
import 'package:flutter_content/src/snippet/snodes/quill/widgets/help_icon_embed.dart';

import 'package:flutter_content/src/snippet/snodes/quill/widgets/timestamp_embed.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'quill_toolbar_toast.dart';

/// A Quill editor widget that shows a red border when focused and triggers
/// an `onChange` callback only when focus is lost and content has changed.
class FocusAwareQuillEditor extends HookWidget {
  final QuillTextNode parentSNode;
  final String uid;

  /// The initial content for the editor, as a JSON string.
  final String originalDeltaJsonString;

  /// A callback that fires when the editor loses focus and the content
  /// has been modified. The new content is provided as a JSON string.
  final Function(String, {bool forceRefresh}) onChange;

  // final VoidCallback? onEditWithToolbarBtnPressed;

  const FocusAwareQuillEditor({
    required this.parentSNode,
    required this.uid,
    required this.originalDeltaJsonString,
    required this.onChange,
    // required this.onEditWithToolbarBtnPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // 1. Set up state management with hooks.
    final hasFocus = useState(false);
    final isDirty = useState(false);
    final numEmbeds = useState<int>(0);
    final currSel = useState<TextSelection>(
      const TextSelection.collapsed(offset: 0),
    );
    // final changesSubscription = useState<>

    // 2. Initialize the controller and focus node. useMemoized ensures these
    //    are created only once for the lifecycle of the widget.
    final controller = useMemoized(() {
      try {
        final doc = Document.fromJson(jsonDecode(originalDeltaJsonString));

        return QuillController(
          document: doc,
          selection: const TextSelection.collapsed(offset: 0),
          onSelectionChanged: (sel) {
            currSel.value = sel;
            // fco.hide('quill-toolbar-${parentSNode.uid}');
            // fco.unhide('quill-toolbar-${parentSNode.uid}');
            // if (sel.isCollapsed) {
            // } else {
            //   fco.unhide('quill-toolbar-${parentSNode.uid}');
            // }
          },
        );
      } catch (e) {
        // Handle cases with invalid JSON.
        return QuillController.basic();
      }
    }, [originalDeltaJsonString]);

    final focusNode = useFocusNode();
    final scrollController = useScrollController();

    // 3. Set up listeners using useEffect. This runs once after the first build.
    useEffect(() {
      // Populate the initial state of embed UIDs
      // final deltaJson = jsonEncode(controller.document.toDelta().toJson());
      // numEmbeds.value = QuillTextNode.getTargetList(deltaJson).length;

      // Listener for text and selection changes.
      void textListener() {
        isDirty.value = true;

        // detect reduction in number of embed
        final deltaJson = jsonEncode(controller.document.toDelta().toJson());
        final newNumUids = QuillTextNode.getTargetList(deltaJson).length;
        final oldNumUids = numEmbeds.value;

        bool deletedAnEmbed = (newNumUids < oldNumUids);

        if (deletedAnEmbed) {
          numEmbeds.value = newNumUids;
          isDirty.value = false; // Reset the dirty flag.
          fco.hide('quill-toolbar-${uid}');
          onChange(deltaJson, forceRefresh: true);
        }
      }

      // Listener for focus changes.
      void focusListener() {
        hasFocus.value = focusNode.hasFocus;
        if (!focusNode.hasFocus) {
          fco.hide('quill-toolbar-${uid}');
          if (isDirty.value) {
            // Focus lost and content has changed: trigger the callback.
            final newJson = jsonEncode(controller.document.toDelta().toJson());
            onChange(newJson);
            isDirty.value = false; // Reset the dirty flag.
          }
        } else {
          fco.unhide('quill-toolbar-${uid}');
        }
      }

      controller.document.changes.listen((_) => textListener());
      focusNode.addListener(focusListener);

      // Cleanup: remove listeners when the widget is disposed.
      return () {
        // The document listener is managed by the controller, which will be
        // disposed, so we only need to remove our focus listener.
        focusNode.removeListener(focusListener);
      };
    }, [controller, focusNode]);

    // final linkStyle = DefaultStyles(
    //   link: const TextStyle(
    //     color: Colors.blue,
    //     decoration: TextDecoration.none,
    //   ),
    // );
    //
    // final quillIconTheme = QuillIconTheme(
    //   iconButtonSelectedData: IconButtonData(
    //     color: Colors.white, // Sets default color for all descendant icons
    //   ),
    //   iconButtonUnselectedData: IconButtonData(
    //     color: Colors.white60, // Sets default color for all descendant icons
    //   ),
    // );

    return GestureDetector(
      onTap: () {
        // This is the most reliable way to request focus.
        // It tells the parent FocusScope to make this focusNode the primary input target.
        if (!focusNode.hasFocus) FocusScope.of(context).requestFocus(focusNode);
      },
      child: Container(
        padding: const EdgeInsets.only(top: 4, left: 4, right: 30, bottom: 4),
        decoration: BoxDecoration(
          border: Border.all(
            color: hasFocus.value ? Colors.purpleAccent : Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: WrappedCallout(
          calloutConfig: CalloutConfig(
            cId: 'quill-toolbar-$uid',
            initialTargetAlignment: Alignment.topLeft,
            initialCalloutAlignment: Alignment.bottomLeft,
            initialCalloutW: 900,
            initialCalloutH: 90,
            decorationFillColors: ColorOrGradient.color(Colors.purpleAccent),
            decorationBorderThickness: 3,
            decorationBorderColors: ColorOrGradient.color(Colors.purpleAccent),
            showCloseButton: true,
            closeButtonColor: Colors.white,
            closeButtonPos: Offset.zero,
            contentTranslateY: -10,
          ),
          calloutBoxContentBuilderF: (_) => _toolbars(focusNode, controller),
          targetBuilderF: (_) =>
              _quillEditor(focusNode, scrollController, controller),
        ),
      ),
    );
  }

  Widget _toolbars(
    FocusNode focusNode,
    QuillController controller,
  ) => IconTheme(
    data: IconThemeData(
      color: Colors.white, // Sets default color for all descendant icons
    ),
    child: Padding(
      padding: const EdgeInsets.only(right: 50.0),
      child: QuillSimpleToolbar(
        controller: controller,
        config: QuillSimpleToolbarConfig(
          toolbarIconAlignment: WrapAlignment.start,
          showClipboardCopy: true,
          showClipboardPaste: true,
          // showColorButton: false,
          // showBackgroundColorButton: false,
          showSubscript: false,
          showSuperscript: false,
          showStrikeThrough: false,
          showListCheck: false,
          showInlineCode: false,
          showCodeBlock: false,
          showIndent: false,
          showLink: false,
          showSearchButton: false,
          customButtons: [
            _fontFamilyBtn(controller),
            // _bgColorBtn(controller),
            // _fgColorBtn(controller),
            // _linkBtn(controller),
            _helpIconBtn(controller),
          ],
          buttonOptions: QuillSimpleToolbarButtonOptions(
            base: QuillToolbarBaseButtonOptions(
              afterButtonPressed: () {
                final isDesktop = {
                  TargetPlatform.linux,
                  TargetPlatform.windows,
                  TargetPlatform.macOS,
                }.contains(defaultTargetPlatform);
                if (isDesktop) {
                  focusNode.requestFocus();
                }
              },
            ),
            linkStyle: QuillToolbarLinkStyleButtonOptions(
              validateLink: (link) {
                // Treats all links as valid. When launching the URL,
                // `https://` is prefixed if the link is incomplete (e.g., `google.com` → `https://google.com`)
                // however this happens only within the editor.
                return true;
              },
            ),
            fontFamily: QuillToolbarFontFamilyButtonOptions(
              items: {
                'merriweather': GoogleFonts.merriweather().fontFamily!,
                'hand-writing': GoogleFonts.damion().fontFamily!,
              },
            ),
          ),
        ),
      ),
    ),
  );

  QuillToolbarCustomButtonOptions _fontFamilyBtn(controller) =>
      QuillToolbarCustomButtonOptions(
        icon: PropertyButtonFontFamily(
          label: "fontFamily",
          originalFontFamily: controller
              .getSelectionStyle()
              .attributes['font']
              ?.value,
          menuBgColor: Colors.purpleAccent,
          onChangeF: (String? newFamily) {
            print('new family is $newFamily');
            if (newFamily != null)
              controller.formatSelection(
                Attribute.fromKeyValue(
                  Attribute.font.key,
                  newFamily,
                ),
              );
          },
        ),
      );

  // QuillToolbarCustomButtonOptions _bgColorBtnlorBtn(controller) =>
  //     QuillToolbarCustomButtonOptions(
  //       icon: const Icon(Icons.format_color_fill, color: Colors.black),
  //       onPressed: () {
  //         Color? selectedColor;
  //         if (_isToggledBackground(controller)) {
  //           selectedColor = fco.hexToColor(
  //             controller.getSelectionStyle().attributes['background']?.value,
  //           );
  //         }
  //         fco.showOverlay(
  //           calloutConfig: CalloutConfig(
  //             cId: 'color-picker',
  //             initialCalloutW: 320,
  //             initialCalloutH: 380,
  //             decorationFillColors: ColorOrGradient.color(Colors.purpleAccent),
  //             decorationBorderRadius: 16,
  //             targetPointerType: TargetPointerType.none(),
  //             barrier: CalloutBarrierConfig(opacity: 0.1),
  //             onDismissedF: () {},
  //           ),
  //           calloutContent: ColourPickerTool(
  //             originalColor: selectedColor ?? Colors.white,
  //             onColorPickedF: (Color? newColor) {
  //               if (newColor == null) {
  //                 controller.formatSelection(const BackgroundAttribute(null));
  //                 return;
  //               }
  //               var hex = fco.colorToHex(newColor);
  //               hex = '#$hex';
  //               controller.formatSelection(BackgroundAttribute(hex));
  //             },
  //           ),
  //         );
  //       },
  //     );

  // QuillToolbarCustomButtonOptions _fgColorBtnorBtn(controller) =>
  //     QuillToolbarCustomButtonOptions(
  //       icon: const Icon(Icons.color_lens, color: Colors.black),
  //       onPressed: () {
  //         Color? selectedColor;
  //         if (_isToggledColor(controller)) {
  //           selectedColor = fco.hexToColor(
  //             controller.getSelectionStyle().attributes['color']?.value,
  //           );
  //         }
  //         fco.showOverlay(
  //           calloutConfig: CalloutConfig(
  //             cId: 'color-picker',
  //             initialCalloutW: 320,
  //             initialCalloutH: 380,
  //             decorationFillColors: ColorOrGradient.color(Colors.purpleAccent),
  //             decorationBorderRadius: 16,
  //             targetPointerType: TargetPointerType.none(),
  //             barrier: CalloutBarrierConfig(opacity: 0.1),
  //           ),
  //           calloutContent: ColourPickerTool(
  //             originalColor: selectedColor ?? Colors.white,
  //             onColorPickedF: (Color? newColor) {
  //               if (newColor == null) {
  //                 controller.formatSelection(const ColorAttribute(null));
  //                 return;
  //               }
  //               var hex = fco.colorToHex(newColor);
  //               hex = '#$hex';
  //               controller.formatSelection(ColorAttribute(hex));
  //             },
  //           ),
  //         );
  //       },
  //     );

  // QuillToolbarCustomButtonOptions _linkBtn(controller) =>
  //     QuillToolbarCustomButtonOptions(
  //       icon: const Icon(Icons.link, color: Colors.black),
  //       onPressed: () {
  //         if (_isToggledColor(controller)) {
  //           fco.hexToColor(
  //             controller.getSelectionStyle().attributes['link']?.value,
  //           );
  //         }
  //         _showLinkDialog(controller);
  //       },
  //     );

  QuillToolbarCustomButtonOptions _helpIconBtn(controller) =>
      QuillToolbarCustomButtonOptions(
        icon: SizedBox(
          width: 30,
          child: Stack(
            children: [
              Icon(Icons.info_outline_rounded, size: 20),
              Align(
                alignment: AlignmentGeometry.topRight,
                child: Icon(Icons.add, size: 10, color: Colors.white),
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

          parentSNode.deltaJsonString = jsonEncode(
            controller.document.toDelta().toJson(),
          );

          var snippet = parentSNode.rootNodeOfSnippet();
          if (snippet != null) {
            fco.modelRepo.saveNewVersionOfSnippet(snippet);
          }
        },
      );

  QuillEditor _quillEditor(focusNode, scrollController, controller) =>
      QuillEditor(
        focusNode: focusNode,
        scrollController: scrollController,
        controller: controller,
        config: QuillEditorConfig(
          placeholder: 'Start writing your notes...',
          padding: const EdgeInsets.all(16),
          embedBuilders: [
            HelpIconEmbedBuilder(parentSNode: parentSNode),
            TimeStampEmbedBuilder(),
          ],
          onTapOutsideEnabled: false, // means must have a close box
        ),
      );

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

  // bool _isToggledColor(QuillController controller) {
  //   var attrs = controller.getSelectionStyle().attributes;
  //   return attrs.containsKey(Attribute.color.key);
  // }

  bool _isToggledBackground(QuillController controller) {
    var attrs = controller.getSelectionStyle().attributes;
    return attrs.containsKey(Attribute.background.key);
  }

  static const cid_linkEditor = 'link-editor';

  // void _showLinkDialogwLinkDialog(QuillController controller) {
  //   fco.registerKeystrokeHandler(cid_linkEditor, (KeyEvent event) {
  //     if (event.logicalKey == LogicalKeyboardKey.escape) {
  //       fco.dismiss(cid_linkEditor);
  //     }
  //     if (event.logicalKey == LogicalKeyboardKey.enter) {
  //       return true;
  //     }
  //     return false;
  //   });
  //   fco.showOverlay(
  //     calloutContent: Column(
  //       mainAxisSize: MainAxisSize.max,
  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         fco.purpleText('Create a link', fontSize: 24, family: 'Merriweather'),
  //         Container(
  //           padding: const EdgeInsets.symmetric(horizontal: 12),
  //           width: 480,
  //           height: 100,
  //           child: StringOrNumberEditor(
  //             inputType: String,
  //             prompt: () => 'page address',
  //             originalS: '',
  //             onTextChangedF: (String s) async {},
  //             onEscapedF: (_) {
  //               fco.dismiss(cid_linkEditor);
  //             },
  //             dontAutoFocus: false,
  //             onEditingCompleteF: (s) async {
  //               // if (!s.startsWith('http://')) return;
  //               String uri = s.replaceAll(' ', '-').toLowerCase();
  //               controller.formatSelection(LinkAttribute(uri));
  //               fco.dismiss(cid_linkEditor);
  //               return;
  //             },
  //           ),
  //         ),
  //       ],
  //     ),
  //     calloutConfig: CalloutConfig(
  //       cId: cid_linkEditor,
  //       // initialTargetAlignment: Alignment.bottomLeft,
  //       // initialCalloutAlignment: Alignment.topRight,
  //       // finalSeparation: 200,
  //       barrier: CalloutBarrierConfig(
  //         opacity: .5,
  //         onTappedF: () async {
  //           fco.dismiss(cid_linkEditor);
  //         },
  //       ),
  //       initialCalloutW: 500,
  //       initialCalloutH: 180,
  //       decorationBorderRadius: 12,
  //       decorationFillColors: ColorOrGradient.color(Colors.white),
  //
  //       onDismissedF: () {
  //         fco.removeKeystrokeHandler(cid_linkEditor);
  //       },
  //     ),
  //     // targetGkF: ()=> fco.authIconGK,
  //   );
  // }
}
