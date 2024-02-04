import 'package:flutter/material.dart';
import 'package:flutter_content/src/useful.dart';

class StringEditor extends StatefulWidget {
  final String? originalS;
  final String label;
  final String? helperText;
  final Color textColor;
  final Function(String) onChangedF;
  final VoidCallback? onDoneF;

  const StringEditor({
    this.originalS,
    required this.label,
    this.helperText,
    required this.onChangedF,
    this.onDoneF,
    this.textColor = Colors.black,
    super.key,
  });

  @override
  State<StringEditor> createState() => _StringEditorState();
}

class _StringEditorState extends State<StringEditor> {
  late TextEditingController teC;

  @override
  void initState() {
    super.initState();
    teC = TextEditingController(text: widget.originalS ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontSize: 16, fontFamily: 'monospace', color: widget.textColor),
      controller: teC,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: Useful.enclosureLabelTextStyle,
        helperText: widget.helperText,
        border: const OutlineInputBorder(),
        isDense: false,
      ),
      //focusNode: focusNode,
      autofocus: true,
      onEditingComplete: () => widget.onDoneF?.call(),
      onChanged: (s) {
        setState(() {
          widget.onChangedF.call(s);
        });
        // tc.bloc.add(
        //   CAPIEvent.forceRefresh(),
        // );
      },
    );
  }
}
