import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_content/src/useful.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DecimalEditor extends HookWidget {
  final String? originalS;
  final String? label;
  final String? helperText;
  final Color textColor;
  final Color? bgColor;
  final double? fontSize;
  final double? w;
  final double? h;
  final ValueChanged<String> onChangedF;
  final ValueChanged<String>? onDoneF;

  const DecimalEditor({
    this.originalS,
    this.label,
    this.helperText,
    required this.onChangedF,
    this.onDoneF,
    this.textColor = Colors.black,
    this.bgColor,
    this.fontSize,
    this.w,
    this.h,
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    final teC = useTextEditingController(text: originalS ?? '');
    final focusNode = useFocusNode();
    focusNode.onKey = (node, event) {
      if (event.isKeyPressed(LogicalKeyboardKey.enter)) {
        node.unfocus();
        onChangedF.call(teC.text);
        // Do something
        // Next 2 line needed If you don't want to update the text field with new line.
        return KeyEventResult.handled;
      }
      if (event.isKeyPressed(LogicalKeyboardKey.escape)) {
        // Do something
        // Next 2 line needed If you don't want to update the text field with new line.
        onChangedF.call(originalS??'');
        return KeyEventResult.handled;
      }
      return KeyEventResult.ignored;
    };

    return Container(
      color: bgColor,
       child: TextField(
        style: TextStyle(fontSize: fontSize ?? 16, fontFamily: 'monospace', color: textColor),
        controller: teC,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
        ],
        decoration: InputDecoration(
          isCollapsed: true,
          contentPadding: const EdgeInsets.all(9),
          labelText: label,
          labelStyle: Useful.enclosureLabelTextStyle,
          helperText: helperText,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.yellow,
              width: 3.0,
              style: BorderStyle.solid,
            ),
          ),
          isDense: false,
        ),
        focusNode: focusNode,
        autofocus: true,
        onEditingComplete: () {
          onDoneF?.call(teC.text);
        },
        onChanged: (s) {
            onChangedF.call(s);
          // tc.bloc.add(
          //   CAPIEvent.forceRefresh(),
          // );
        },
      ),
    );
  }
}
