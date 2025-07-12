import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

import 'markdown_toolbar.dart';

class MarkdownEditor extends StatefulWidget {
  final String originalMarkdown;
  final ValueChanged<String> onChangeF;

  const MarkdownEditor({
    required this.originalMarkdown,
    required this.onChangeF,
    super.key,
  });

  @override
  State<MarkdownEditor> createState() => _MarkdownEditorState();
}

class _MarkdownEditorState extends State<MarkdownEditor> {
  late TextEditingController _controller;
  late final FocusNode _focusNode;
  TextSelection _currentSelection = const TextSelection.collapsed(offset: 0);

  @override
  void initState() {
    _controller = TextEditingController(text: widget.originalMarkdown);
    _controller.addListener(() {
      if (widget.originalMarkdown != _controller.text) {
        widget.onChangeF(_controller.text);
        fco.afterNextBuildDo((){
          _currentSelection = _controller.selection;
        });
      }
    });
    _focusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    fco.afterNextBuildDo(() {
      if (mounted && _focusNode.hasFocus) {
        // Check if the widget is still mounted and has focus
        _controller.selection = _currentSelection;
        _focusNode.requestFocus();
      }
    });

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // Change the toolbar alignment
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          MarkdownToolbar(
            onChangeF: widget.onChangeF,
            // If you set useIncludedTextField to true, remove
            // a) the controller and focusNode fields below and
            // b) the TextField outside below widget
            useIncludedTextField: false,
            controller: _controller,
            focusNode: _focusNode,

            // Uncomment some of the options below to observe the changes. This list is not exhaustive
            collapsable: true,
            flipCollapseButtonIcon: true,
            // alignCollapseButtonEnd: true,
            // backgroundColor: Colors.lightBlue,
            // dropdownTextColor: Colors.red,
            // iconColor: Colors.white,
            // iconSize: 30,
            // borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            // width: 70,
            // height: 50,
            // spacing: 16.0,
            // runSpacing: 12.0,
            // alignment: WrapAlignment.start,
            // italicCharacter: '_',
            // bulletedListCharacter: '*',
            // horizontalRuleCharacter: '***',
            // hideImage: true,
            // hideCode: true,
            // linkTooltip: 'Add a link',
          ),
          const Divider(),
          TextField(
            controller: _controller,
            focusNode: _focusNode,
            minLines: 5,
            maxLines: null,
            decoration: const InputDecoration(
              hintText: 'Placeholder text',
              labelText: 'Label text',
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
