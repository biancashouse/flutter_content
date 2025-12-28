import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:go_router/go_router.dart';

/// A Quill editor widget that shows a red border when focused and triggers
/// an `onChange` callback only when focus is lost and content has changed.
class FocusAwareQuillEditor extends HookWidget {
  /// The initial content for the editor, as a JSON string.
  final String initialDeltaJson;

  /// A callback that fires when the editor loses focus and the content
  /// has been modified. The new content is provided as a JSON string.
  final ValueChanged<String> onChange;
  final VoidCallback? onEditWithToolbarBtnPressed;

  const FocusAwareQuillEditor({
    required this.initialDeltaJson,
    required this.onChange,
    required this.onEditWithToolbarBtnPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // 1. Set up state management with hooks.
    final hasFocus = useState(false);
    final isDirty = useState(false);

    // 2. Initialize the controller and focus node. useMemoized ensures these
    //    are created only once for the lifecycle of the widget.
    final controller = useMemoized(() {
      try {
        final doc = Document.fromJson(jsonDecode(initialDeltaJson));
        return QuillController(
          document: doc,
          selection: const TextSelection.collapsed(offset: 0),
        );
      } catch (e) {
        // Handle cases with invalid JSON.
        return QuillController.basic();
      }
    }, [initialDeltaJson]);

    final focusNode = useFocusNode();

    // 3. Set up listeners using useEffect. This runs once after the first build.
    useEffect(() {
      // Listener for text changes.
      void textListener() {
        isDirty.value = true;
      }

      // Listener for focus changes.
      void focusListener() {
        hasFocus.value = focusNode.hasFocus;
        if (!focusNode.hasFocus && isDirty.value) {
          // Focus lost and content has changed: trigger the callback.
          final newJson = jsonEncode(controller.document.toDelta().toJson());
          onChange(newJson);
          isDirty.value = false; // Reset the dirty flag.
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

    final linkStyle = DefaultStyles(
      link: const TextStyle(
        color: Colors.blue,
        decoration: TextDecoration.none,
      ),
    );

    // 4. Build the UI with a conditional border.
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            border: Border.all(
              color: hasFocus.value ? Colors.red : Colors.transparent,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: QuillEditor.basic(
            controller: controller,
            focusNode: focusNode,
            config: QuillEditorConfig(
              customStyles: linkStyle,
              onLaunchUrl: (String? url) {
                if (url == null) return;
                String newUrl = url.startsWith('https:///')
                    ? url.substring(9)
                    : url;
                if (newUrl.startsWith('http')) {
                  launchUrl(Uri.parse(newUrl));
                } else {
                  context.go(newUrl.startsWith('/') ? newUrl : '/$newUrl');
                }
              },
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: onEditWithToolbarBtnPressed,
            icon: Icon(Icons.menu),
            color: hasFocus.value ? Colors.red[50] : Colors.transparent,
            tooltip: 'edit with toolbar visible',
          ),
        ),
      ],
    );
  }
}

/// A lightweight, read-only viewer for Quill delta JSON content.
class QuillViewer extends HookWidget {
  /// The Quill delta content to display, as a JSON string.
  final String deltaJsonString;

  const QuillViewer({required this.deltaJsonString, super.key});

  @override
  Widget build(BuildContext context) {
    // useMemoized ensures the controller is created only once.
    final controller = useMemoized(() {
      try {
        final doc = Document.fromJson(jsonDecode(deltaJsonString));
        return QuillController(
          document: doc,
          selection: const TextSelection.collapsed(offset: 0),
          readOnly: true,
        );
      } catch (e) {
        // Return a basic controller if JSON is invalid.
        return QuillController.basic();
      }
    }, [deltaJsonString]);

    final linkStyle = DefaultStyles(
      link: const TextStyle(
        color: Colors.blue,
        decoration: TextDecoration.none,
      ),
    );

    return QuillEditor.basic(
      controller: controller,
      config: QuillEditorConfig(
        autoFocus: false,
        expands: false,
        padding: EdgeInsets.zero,
        customStyles: linkStyle,
        onLaunchUrl: (String? url) {
          if (url == null) return;
          String newUrl = url.startsWith('https:///') ? url.substring(9) : url;
          if (newUrl.startsWith('http')) {
            launchUrl(Uri.parse(newUrl));
          } else {
            context.go(newUrl.startsWith('/') ? newUrl : '/$newUrl');
          }
        },
      ),
    );
  }
}
