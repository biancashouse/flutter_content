import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart' hide Line;
import 'package:flutter_content/src/snippet/snodes/quill/widgets/help_icon_embed.dart';

// import 'package:flutter_content/src/snippet/snodes/quill/widgets/quill_toolbar_callout.dart';
import 'package:flutter_content/src/snippet/snodes/quill/widgets/timestamp_embed.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_quill/flutter_quill.dart';

// import 'quill_toolbar_toast.dart';

/// A Quill editor widget that shows a red border when focused and triggers
/// an `onChange` callback only when focus is lost and content has changed.
class FocusAwareQuillEditor extends HookWidget {
  /// The initial content for the editor, as a JSON string.
  final QuillTextNode parentSNode;

  /// A callback that fires when the editor loses focus and the content
  /// has been modified. The new content is provided as a JSON string.
  final Function(String, {bool forceRefresh}) onChange;

  // final VoidCallback? onEditWithToolbarBtnPressed;

  const FocusAwareQuillEditor({
    required this.parentSNode,
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

    // 2. Initialize the controller and focus node. useMemoized ensures these
    //    are created only once for the lifecycle of the widget.
    final controller = useMemoized(() {
      try {
        final doc = Document.fromJson(jsonDecode(parentSNode.deltaJsonString));
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
    }, [parentSNode.deltaJsonString]);

    final focusNode = useFocusNode();
    final scrollController = useScrollController();

    // 3. Set up listeners using useEffect. This runs once after the first build.
    useEffect(() {
      // Populate the initial state of embed UIDs
      final deltaJson = jsonEncode(controller.document.toDelta().toJson());
      numEmbeds.value = QuillTextNode.getTargetList(deltaJson).length;

      // Listener for text changes.
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
          fco.hide('quill-toolbar-${parentSNode.uid}');
          onChange(deltaJson, forceRefresh: true);
        }
      }

      // Listener for focus changes.
      void focusListener() {
        hasFocus.value = focusNode.hasFocus;
        if (!focusNode.hasFocus) {
          fco.hide('quill-toolbar-${parentSNode.uid}');
          if (isDirty.value) {
            // Focus lost and content has changed: trigger the callback.
            final newJson = jsonEncode(controller.document.toDelta().toJson());
            // onChange(newJson);
            isDirty.value = false; // Reset the dirty flag.
          }
        } else {
          print('focused');
          // fco.showOverlay(
          //   calloutConfig: CalloutConfig(
          //     cId: 'quill-toolbar-toast',
          //     barrier: null,
          //     decorationFillColors: ColorOrGradient.color(Colors.purpleAccent),
          //     targetPointerType: TargetPointerType.none(),
          //     initialCalloutW: 72,
          //     initialCalloutH: 30,
          //     initialTargetAlignment: Alignment.topRight,
          //     initialCalloutAlignment: Alignment.bottomRight,
          //   ),
          //   calloutContent: Row(
          //     children: [
          //       SizedBox(
          //         width: 32,
          //         height: 32,
          //         child: Tooltip(
          //           message: 'edit with toolbar visible',
          //           child: InkWell(
          //             onTap: onEditWithToolbarBtnPressed,
          //             child: Icon(Icons.more_vert_rounded, color: Colors.white),
          //           ),
          //         ),
          //       ),
          //       SizedBox(
          //         width: 32,
          //         height: 32,
          //         child: Tooltip(
          //           message:
          //               'Insert a help Button\nat the current cursor position',
          //           child: InkWell(
          //             onTap: () => _insertAnInfoEmbed(controller, isDirty),
          //             child: const Icon(Icons.comment, color: Colors.white),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          //   targetGK: parentSNode.nodeWidgetGK,
          // );
          // fco.dismissAll();
          fco.unhide('quill-toolbar-${parentSNode.uid}');
          // QuillToolbarToast.show(
          //   quillTextNode: parentSNode,
          //   onChange: onChange,
          //   controller: controller,
          //   focusNode: FocusNode(),
          //   isDirty: isDirty,
          // );
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
            cId: 'quill-toolbar-${parentSNode.uid}',
            initialTargetAlignment: Alignment.topLeft,
            initialCalloutAlignment: Alignment.bottomLeft,
            initialCalloutW: fco.scrW - 50,
            initialCalloutH: 120,
            decorationFillColors: ColorOrGradient.color(Colors.black),
            decorationBorderThickness: 3,
            decorationBorderColors: ColorOrGradient.color(Colors.purpleAccent),
            elevation: 10,
          ),
          calloutBoxContentBuilderF: (_) => Wrap(
            children: [
              QuillToolbarHistoryButton(isUndo: true, controller: controller),
              QuillToolbarHistoryButton(isUndo: false, controller: controller),
              QuillToolbarToggleStyleButton(
                // options: QuillToolbarToggleStyleButtonOptions(
                //   afterButtonPressed: () {
                //     fco.afterMsDelayDo(100, (){
                //     FocusScope.of(context).requestFocus(focusNode);
                //     controller.updateSelection(currSel.value, ChangeSource.silent);
                //     print('selection is ${controller.selection}');
                //     });
                //   },
                // ),
                controller: controller,
                attribute: Attribute.bold,
              ),
              QuillToolbarToggleStyleButton(
                options: const QuillToolbarToggleStyleButtonOptions(),
                controller: controller,
                attribute: Attribute.italic,
              ),
              QuillToolbarToggleStyleButton(
                controller: controller,
                attribute: Attribute.underline,
              ),
              QuillToolbarClearFormatButton(controller: controller),

              const VerticalDivider(),
              QuillToolbarColorButton(
                controller: controller,
                isBackground: false,
              ),
              QuillToolbarColorButton(
                controller: controller,
                isBackground: true,
              ),
              const VerticalDivider(),
              QuillToolbarSelectHeaderStyleDropdownButton(
                controller: controller,
              ),
              const VerticalDivider(),
              QuillToolbarSelectLineHeightStyleDropdownButton(
                controller: controller,
              ),
              const VerticalDivider(),
              QuillToolbarToggleCheckListButton(controller: controller),
              QuillToolbarToggleStyleButton(
                controller: controller,
                attribute: Attribute.ol,
              ),
              QuillToolbarToggleStyleButton(
                controller: controller,
                attribute: Attribute.ul,
              ),
              QuillToolbarToggleStyleButton(
                controller: controller,
                attribute: Attribute.inlineCode,
              ),
              QuillToolbarToggleStyleButton(
                controller: controller,
                attribute: Attribute.blockQuote,
              ),
              QuillToolbarIndentButton(
                controller: controller,
                isIncrease: true,
              ),
              QuillToolbarIndentButton(
                controller: controller,
                isIncrease: false,
              ),
              const VerticalDivider(),
              QuillToolbarLinkStyleButton(controller: controller),
            ],
          ),
          targetBuilderF: (_) => QuillEditor(
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
            ),
          ),
        ),
      ),
    );
  }

  // void _insertAnInfoEmbed(
  //   QuillController controller,
  //   ValueNotifier<bool> isDirty,
  // ) {
  //   QuillTargetModel? qt = _createQuillTarget();
  //   if (qt == null) return;
  //
  //   // Get the current selection
  //   final index = controller.selection.baseOffset;
  //   final length = controller.selection.extentOffset - index;
  //
  //   // Insert a custom block with our key ('my-icon') and the icon's code
  //   controller.replaceText(
  //     index,
  //     length,
  //     BlockEmbed.custom(
  //       CustomBlockEmbed('quill-help-icon-button', jsonEncode(qt.toMap())),
  //     ),
  //     null,
  //   );
  //
  //   fco.afterNextBuildDo(() {
  //     fco.dismiss('quill-toolbar-toast');
  //   });
  //
  //   final newJson = jsonEncode(controller.document.toDelta().toJson());
  //   isDirty.value = false; // Reset the dirty flag.
  //   onChange(newJson, forceRefresh: true);
  // }
  //
  // QuillTargetModel? _createQuillTarget() {
  //   if (!fco.canEditContent()) return null;
  //
  //   TargetId newTargetId = DateTime.now().millisecondsSinceEpoch;
  //   return QuillTargetModel(
  //     uid: newTargetId,
  //     calloutDurationMs: 2000,
  //     calloutFillColors: UpTo6Colors(color1: ColorModel.white()),
  //     targetPointerTypeEnum: TargetPointerTypeEnum.WAVY,
  //   );
  // }
}
