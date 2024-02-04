import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FlutterTextEditor extends HookWidget {
  final String label;
  final String originalText;
  final String? helperText;
  final EdgeInsets? padding;
  final TextInputType textInputType;
  final int numLines;
  final bool skipLabelText;
  final bool skipHelperText;
  final Function(String) onChangedF;
  final VoidCallback? onDoneF;

  const FlutterTextEditor({
    required this.label,
    required this.originalText,
    this.skipLabelText = false,
    this.skipHelperText = false,
    this.helperText,
    this.padding,
    this.textInputType = TextInputType.multiline,
    this.numLines = 1,
    required this.onChangedF,
    this.onDoneF,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final teC = useTextEditingController(text: originalText ?? '');
    final focusNode = useFocusNode();

     focusNode.onKey = (node, event) {
      if ((textInputType == TextInputType.number || numLines == 1 || event.isShiftPressed) && event.isKeyPressed(LogicalKeyboardKey.enter)) {
        node.unfocus();
        onChangedF.call(teC.text);
        // Do something
        // Next 2 line needed If you don't want to update the text field with new line.
        onDoneF?.call();
        return KeyEventResult.handled;
      }
      if (event.isKeyPressed(LogicalKeyboardKey.escape)) {
        // Do something
        // Next 2 line needed If you don't want to update the text field with new line.
        node.unfocus();
        onChangedF.call(originalText);
        onDoneF?.call();
        return KeyEventResult.handled;
      }
      return KeyEventResult.ignored;
    };
    return Container(
      color: Colors.white,
      padding: padding ?? EdgeInsets.all(8),
      child: TextField(
        maxLines: numLines == 1 ? numLines : null,
        style: const TextStyle(fontSize: 16, fontFamily: 'monospace', color: Colors.black),
        controller: teC,
        keyboardType: textInputType,
        decoration: null,
        // decoration: InputDecoration(
        //   labelText: skipLabelText ? null : label,
        //   labelStyle: skipLabelText ? null : Useful.enclosureLabelTextStyle,
        //   helperText: skipHelperText ? null : helperText,
        //   // border: const OutlineInputBorder(),
        //   // isDense: true,
        // ),
        focusNode: focusNode,
        autofocus: false,
        onEditingComplete: () {
          onChangedF.call(teC.text);
          onDoneF?.call();
        },
        onChanged: (s) {
          if (textInputType == TextInputType.number && s.contains('.')) {
            teC.text = s.replaceAll('.', '');
          }
        },
        // onTap: () {
        //   focusNode.requestFocus();
        //   print('x');
        //   // var state = Callout.of(context);
        //   Callout.preventParentCalloutDrag(context);
        // },
        onTapOutside: (_) {
          onChangedF.call(teC.text);
          onDoneF?.call();
        },
      ),
    );
  }
}
