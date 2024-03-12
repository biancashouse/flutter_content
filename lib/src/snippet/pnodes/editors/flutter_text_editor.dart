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
  final ValueChanged<String> onDoneF;

  const FlutterTextEditor({
    required this.label,
    required this.originalText,
    this.skipLabelText = false,
    this.skipHelperText = false,
    this.helperText,
    this.padding,
    this.textInputType = TextInputType.multiline,
    this.numLines = 1,
    required this.onDoneF,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final teC = useTextEditingController(text: originalText);

    final focusTest = useFocusNode(
        canRequestFocus: true,
        onKeyEvent: (node, event) {
          if ((textInputType == TextInputType.number || numLines == 1 || HardwareKeyboard.instance.isShiftPressed) &&
              HardwareKeyboard.instance.isLogicalKeyPressed(LogicalKeyboardKey.enter)) {
            node.unfocus();
            onDoneF.call(teC.text);
            return KeyEventResult.handled;
          }
          if (HardwareKeyboard.instance.isLogicalKeyPressed(LogicalKeyboardKey.escape)) {
            // Do something
            // Next 2 line needed If you don't want to update the text field with new line.
            node.unfocus();
            FC().skipEditModeEscape = true;
            onDoneF.call(originalText);
            return KeyEventResult.handled;
          }
          return KeyEventResult.ignored;
        });

    return Container(
      color: Colors.white,
      padding: padding ?? const EdgeInsets.all(8),
      child: FocusScope(
        canRequestFocus: true,
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
          focusNode: focusTest,
          autofocus: true,
          onEditingComplete: () {
            onDoneF.call(teC.text);
          },
          onChanged: (s) {
            if (textInputType == TextInputType.number && s.contains('.')) {
              teC.text = s.replaceAll('.', '');
            }
          },
          onTapOutside: (_) {
            onDoneF.call(teC.text);
          },
        ),
      ),
    );
  }
}
