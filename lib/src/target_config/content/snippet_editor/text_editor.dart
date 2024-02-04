import 'package:flutter/material.dart';

class SnippetTextEditor extends StatefulWidget {
  final String originalS;
  final ValueChanged<String> onTextChangedF;
  final TextStyle textStyle;
  final TextAlign textAlign;

  const SnippetTextEditor({
    required this.originalS,
    required this.textStyle,
    this.textAlign = TextAlign.left,
    required this.onTextChangedF,
    super.key,
  });

  @override
  State<SnippetTextEditor> createState() => _SnippetTextEditorState();
}

class _SnippetTextEditorState extends State<SnippetTextEditor> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller.text = "Initial text";
  }

  @override
  Widget build(BuildContext context) {
    return EditableText(
      controller: _controller,
      focusNode: _focusNode,
      cursorColor: Colors.blueAccent,
      backgroundCursorColor: Colors.orange,
      style: widget.textStyle,
      maxLines: null,
      expands: true,
      onChanged: (text) {
        print("Text changed to: $text");
      },
    );
  }
}
