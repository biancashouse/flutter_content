import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_quill/flutter_quill.dart';

import 'widgets/help_icon_embed.dart';
import 'widgets/timestamp_embed.dart';

class QuillEditorFocusAware extends HookWidget {
  final QuillTextNode parentSNode;

  /// A callback that fires when the editor loses focus and the content
  /// has been modified. The new content is provided as a JSON string.
  final ValueChanged<String> onChange;
  final VoidCallback? onEditWithToolbarBtnPressed;

  QuillEditorFocusAware({
    required this.parentSNode,
    required this.onChange,
    required this.onEditWithToolbarBtnPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final hasFocus1 = useState(false);
    final isDirty1 = useState(false);

    final controller1 = useMemoized(() {
      try {
        final doc = Document.fromJson(jsonDecode(parentSNode.deltaJsonString));
        return QuillController.basic(config: QuillControllerConfig())
          ..document = doc;
      } catch (e) {
        // Handle cases with invalid JSON.
        return QuillController.basic();
      }
    }, [parentSNode.deltaJsonString]);

    final focusNode1 = useFocusNode();

    final scrollController1 = useScrollController();

    useEffect(() {
      // Listener for text changes.
      void textListener() {
        if (!context.mounted) return;
        isDirty1.value = true;
      }

      // Listener for focus changes.
      void focusListener() {
        if (!context.mounted) return;
        hasFocus1.value = focusNode1.hasFocus;
        if (!focusNode1.hasFocus && isDirty1.value) {
          final newJson = jsonEncode(controller1.document.toDelta().toJson());
          onChange(newJson);
          isDirty1.value = false;
        }
      }

      controller1.document.changes.listen((_) => textListener());
      focusNode1.addListener(focusListener);

      // Cleanup: remove listeners when the widget is disposed.
      return () {
        // The document listener is managed by the controller, which will be
        // disposed, so we only need to remove our focus listener.
        focusNode1.removeListener(focusListener);
      };
    }, [controller1, focusNode1]);

    return Stack(
        children: [
          GestureDetector(
            onTap: () {
              // This is the most reliable way to request focus.
              // It tells the parent FocusScope to make this focusNode the primary input target.
              FocusScope.of(context).requestFocus(focusNode1);
            },
            child: Container(
              padding: const EdgeInsets.only(
                top: 4,
                left: 4,
                right: 30,
                bottom: 4,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: hasFocus1.value
                      ? Colors.purpleAccent
                      : Colors.transparent,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: QuillEditor(
                focusNode: focusNode1,
                scrollController: scrollController1,
                controller: controller1,
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
          if (hasFocus1.value)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                color: Colors.purple,
                width: 32,
                height: 60,
              ),
            ),
          if (hasFocus1.value)
            Positioned(
              top: 0,
              right: 4,
              child: SizedBox(
                width: 32,
                height: 32,
                child: Tooltip(
                  message: 'edit with toolbar visible',
                  child: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.more_vert_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          if (hasFocus1.value)
            Positioned(
              top: 30,
              right: 4,
              child: SizedBox(
                width: 32,
                height: 32,
                child: Tooltip(
                  message:
                      'Insert a help Button\nat the current cursor position',
                  child: InkWell(
                    onTap: () {
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
                      //       CustomBlockEmbed(
                      //         'quill-help-icon-button',
                      //         jsonEncode(qt.toMap()),
                      //       ),
                      //     ),
                      //     null,
                      //   );
                      //
                      //   parentSNode.deltaJsonString = jsonEncode(
                      //     controller.document.toDelta().toJson(),
                      //   );
                      //
                      //   var snippet = parentSNode.rootNodeOfSnippet();
                      //   if (snippet != null) {
                      //     fco.modelRepo.saveNewVersionOfSnippet(snippet);
                      //   }
                    },
                    // child: const Icon(Icons.comment, color: Colors.white),
                  ),
                ),
              ),
            ),
        ],
    );
  }
}
