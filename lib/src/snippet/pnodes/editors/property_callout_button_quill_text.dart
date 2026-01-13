import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/snodes/quill/widgets/quill_editor_with_toolbar_callout.dart';

class PropertyButtonQuillText extends StatelessWidget {
  final QuillTextNode parentNode;
  final String originalDelta;
  final String? label;
  final Size calloutButtonSize;
  final GlobalKey propertyBtnGK;
  final ValueChanged<String> onChangeF;

  const PropertyButtonQuillText({
    required this.parentNode,
    required this.originalDelta,
    this.label,
    required this.calloutButtonSize,
    required this.onChangeF,
    required this.propertyBtnGK,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          showQuillEditorOverlay(quillTextNode: parentNode, onChangeF: onChangeF),
      child: fco.coloredText(
        'tap here to edit the Quill text',
        color: Colors.white,
      ),
    );
  }
}
