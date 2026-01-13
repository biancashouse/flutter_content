import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/snodes/quill/widgets/help_icon_embed.dart';
import 'package:flutter_content/src/snippet/snodes/quill/widgets/timestamp_embed.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:go_router/go_router.dart';

// /// A lightweight, read-only viewer for Quill delta JSON content.
// class QuillViewer extends HookWidget {
//   final QuillTextNode parentSNode;
//
//   /// The Quill delta content to display, as a JSON string.
//
//   const QuillViewer({required this.parentSNode, super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     // useMemoized ensures the controller is created only once.
//     final controller = useMemoized(() {
//       try {
//         final doc = Document.fromJson(jsonDecode(parentSNode.deltaJsonString));
//         return QuillController(
//           document: doc,
//           selection: const TextSelection.collapsed(offset: 0),
//           readOnly: true,
//         );
//       } catch (e) {
//         // Return a basic controller if JSON is invalid.
//         return QuillController.basic();
//       }
//     }, [parentSNode]);
//
//     final linkStyle = DefaultStyles(
//       link: const TextStyle(
//         color: Colors.blue,
//         decoration: TextDecoration.none,
//       ),
//     );
//
//     print('QuillViewer.build');
//
//     return QuillEditor.basic(
//       controller: controller,
//       config: QuillEditorConfig(
//         // autoFocus: false,
//         // expands: false,
//         // padding: EdgeInsets.zero,
//         customStyles: linkStyle,
//         embedBuilders: [
//           HelpIconEmbedBuilder(parentSNode: parentSNode),
//           TimeStampEmbedBuilder(),
//         ],
//         onLaunchUrl: (String? url) {
//           if (url == null) return;
//           String newUrl = url.startsWith('https:///') ? url.substring(9) : url;
//           if (newUrl.startsWith('http')) {
//             launchUrl(Uri.parse(newUrl));
//           } else {
//             context.go(newUrl.startsWith('/') ? newUrl : '/$newUrl');
//           }
//         },
//       ),
//     );
//   }
// }

/// A lightweight, read-only viewer for Quill delta JSON content.
class QuillViewer extends HookWidget {
  /// The initial content for the editor, as a JSON string.
  final QuillTextNode parentSNode;

  const QuillViewer({required this.parentSNode, super.key});

  @override
  Widget build(BuildContext context) {
    // 2. Initialize the controller and focus node. useMemoized ensures these
    //    are created only once for the lifecycle of the widget.
    final focusNode = useFocusNode();
    final controller = useMemoized(() {
      try {
        final doc = Document.fromJson(jsonDecode(parentSNode.deltaJsonString));
        return QuillController(
          document: doc,
          selection: const TextSelection.collapsed(offset: 0),
          readOnly: true,
        );
      } catch (e) {
        // Handle cases with invalid JSON.
        return QuillController.basic();
      }
    }, [parentSNode.deltaJsonString]);

    // final focusNode = useFocusNode();

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
            border: Border.all(color: Colors.transparent, width: 2),
            borderRadius: BorderRadius.circular(4),
          ),
          child: QuillEditor.basic(
            controller: controller,
            focusNode: focusNode,
            config: QuillEditorConfig(
              customStyles: linkStyle,
              embedBuilders: [
                HelpIconEmbedBuilder(parentSNode: parentSNode),
                TimeStampEmbedBuilder(),
              ],
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
      ],
    );
  }
}
