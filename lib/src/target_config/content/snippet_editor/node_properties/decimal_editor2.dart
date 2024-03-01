import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_content/src/useful.dart';

class DecimalEditor extends StatelessWidget {
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
    return Container(
      color: bgColor,
      width: w ?? 30,
      height: h,
      child: _TextField(
        originalS: originalS,
        label: label,
        helperText: helperText,
        textColor: textColor,
        bgColor: bgColor,
        onChangedF: onChangedF,
        onDoneF: onDoneF,
        fontSize: fontSize,
        w:w,
        h:h,
      ),
    );
  }
}

class _TextField extends StatefulWidget {
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

  const _TextField({
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
  });
  @override
  State<_TextField> createState() => _TextFieldState();
}

class _TextFieldState extends State<_TextField> {
  late TextEditingController teC;
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    teC = TextEditingController(text: widget.originalS ?? '');
    focusNode = FocusNode();
    focusNode.onKey = (node, event) {
      if (event.isKeyPressed(LogicalKeyboardKey.enter)) {
        node.unfocus();
        widget.onChangedF.call(teC.text);
        // Do something
        // Next 2 line needed If you don't want to update the text field with new line.
        return KeyEventResult.handled;
      }
      if (event.isKeyPressed(LogicalKeyboardKey.escape)) {
        // Do something
        // Next 2 line needed If you don't want to update the text field with new line.
        widget.onChangedF.call(widget.originalS??'');
        return KeyEventResult.handled;
      }
      return KeyEventResult.ignored;
    };

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.bgColor,
      width: widget.w ?? 30,
      height: widget.h,
      child: TextField(
        style: TextStyle(fontSize: widget.fontSize ?? 16, fontFamily: 'monospace', color: widget.textColor),
        controller: teC,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
        ],
        decoration: InputDecoration(
          isCollapsed: true,
          contentPadding: const EdgeInsets.all(9),
          labelText: widget.label,
          labelStyle: Useful.enclosureLabelTextStyle,
          helperText: widget.helperText,
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
        autofocus: false,
        onEditingComplete: () {
          widget.onDoneF?.call(teC.text);
        },
        onChanged: (s) {
          setState(() {
            widget.onChangedF.call(s);
          });
          // tc.bloc.add(
          //   CAPIEvent.forceRefresh(),
          // );
        },
      ),
    );
  }

}

