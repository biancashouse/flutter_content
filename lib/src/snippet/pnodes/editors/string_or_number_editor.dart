import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../flutter_content.dart';

/// https://www.flutterbeads.com/multiline-textfield-in-flutter/
///
class StringOrNumberEditor extends StatefulWidget {
  final String Function()? prompt;
  final String Function()? inputDecorationLabel;
  final String originalS;
  final ValueChanged<String> onTextChangedF;
  final void Function(String) onEditingCompleteF;
  final void Function(String)? onEscapedF;
  final Widget? prefixIcon;

  // final bool expands;
  final int maxLines;
  final bool canExpand;
  final bool dontAutoFocus;
  final Color? bgColor;
  final InputDecoration? decoration;
  final bool isPassword;
  final String? passwordHelp;
  final Type inputType;
  final TextStyleF? textStyleF;
  final TextAlignF? textAlignF;

  const StringOrNumberEditor({
    this.prompt,
    this.inputDecorationLabel,
    required this.originalS,
    required this.onTextChangedF,
    required this.onEditingCompleteF,
    this.onEscapedF,
    this.prefixIcon,
    this.maxLines = 1,
    this.canExpand = false,
    required this.dontAutoFocus,
    this.bgColor,
    this.decoration,
    required this.inputType,
    this.isPassword = false,
    this.passwordHelp,
    this.textStyleF,
    this.textAlignF,
    super.key,
  });

  @override
  StringOrNumberEditorState createState() => StringOrNumberEditorState();
}

class StringOrNumberEditorState extends State<StringOrNumberEditor> {
  late TextEditingController _txtController;
  bool passwordVisible = false;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    // passwordVisible = true;

    _focusNode = FocusNode(
      onKeyEvent: (node, event) {
        final isEnterPressed = event.physicalKey == PhysicalKeyboardKey.enter;

        // We only want to act on the key press (down event), not the release.
        if (event is! KeyUpEvent) {
          final isShiftPressed = HardwareKeyboard.instance.physicalKeysPressed.any(
                (key) => <PhysicalKeyboardKey>{
              PhysicalKeyboardKey.shiftLeft,
              PhysicalKeyboardKey.shiftRight,
            }.contains(key),
          );

          // --- Core Logic ---

          // 1. Handle Shift + Enter for multi-line fields
          if (widget.maxLines > 1 && isEnterPressed && isShiftPressed) {
            // Let Flutter handle this to insert a newline. This works for down and repeat events.
            return KeyEventResult.ignored;
          }

          // 2. Handle Enter (without Shift) but ONLY on the initial key down.
          // This prevents repeated submissions if the user holds down the Enter key.
          if (isEnterPressed && !isShiftPressed && event is KeyDownEvent) {
            widget.onEditingCompleteF.call(_txtController.text);
            // We handled the event, stop further processing.
            return KeyEventResult.handled;
          }

          // 3. Handle Escape key, but again, only on the initial key down.
          if (event.physicalKey == PhysicalKeyboardKey.escape && event is KeyDownEvent) {
            widget.onEscapedF?.call(widget.originalS);
            return KeyEventResult.handled;
          }
        }

        // For any other key press (including repeats of normal characters), let Flutter handle it.
        return KeyEventResult.ignored;
      },
    );


    _txtController = TextEditingController();
    _txtController.text = widget.originalS;
    if (!widget.dontAutoFocus) {
      fco.afterNextBuildDo(() {
        _focusNode.requestFocus();
      });
    } else {
      _focusNode.unfocus();
    }
  }

  @override
  void dispose() {
    _txtController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Widget? prefixWidget;
    // if (widget.prefixIcon != null &&
    //     (widget.prompt?.call().isNotEmpty ?? false)) {
    //   prefixWidget = Row(
    //     children: [
    //       widget.prefixIcon!,
    //       FCA.coloredText(
    //         widget.prompt!.call(),
    //         color: Colors.purpleAccent,
    //         fontSize: 14,
    //       ),
    //     ],
    //   );
    // } else if (widget.prefixIcon != null) {
    //   prefixWidget = widget.prefixIcon!;
    // }
    // if (widget.prompt?.call().isNotEmpty ?? false) {
    //   prefixWidget = Padding(
    //     padding: const EdgeInsets.only(top: 8.0),
    //     child: FCA.coloredText(widget.prompt!.call(), color: Colors.purpleAccent),
    //   );
    // }

    // TextInputType keyboardType = widget.isPassword
    //     ? TextInputType.visiblePassword
    //     : TextInputType.multiline;

    // if (!kIsWeb && widget.inputType == int) {
    //   keyboardType = TextInputType.number;
    // } else if (!kIsWeb && widget.inputType == double) {
    //   keyboardType = const TextInputType.numberWithOptions(decimal: true);
    // }

    InputDecoration inputDecoration = widget.isPassword
        ? InputDecoration(
      // border: const,
      //hintText: "Password",
      labelText: _txtController.text.isEmpty ? "Password" : '',
      // labelStyle: Useful.enclosureLabelTextStyle,
      labelStyle: const TextStyle(
          fontSize: 10, fontFamily: 'monospace', color: Colors.grey),
      // floatingLabelStyle: const TextStyle(fontSize: 18, fontFamily: 'monospace', color: Colors.grey),
      helperText: widget.passwordHelp,
      helperStyle: const TextStyle(color: Colors.green),
      suffixIcon: IconButton(
        icon: Icon(
            passwordVisible ? Icons.visibility : Icons.visibility_off),
        onPressed: () {
          setState(
                () {
              passwordVisible = !passwordVisible;
            },
          );
        },
      ),
      // contentPadding: const EdgeInsets.all(TextEditor.CONTENT_PADDING),
      alignLabelWithHint: true,
      filled: false,
    )
        : InputDecoration(
      labelText: widget.inputDecorationLabel?.call(),
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black26),
      ),
    );

    var inputFormatters = [
      if (widget.inputType == double)
        FilteringTextInputFormatter.allow(RegExp(r'^[\d/.]*$')),
      if (widget.inputType == int)
        FilteringTextInputFormatter.allow(RegExp(r'^[\d]*$')),
      if (!widget.canExpand)
        TextInputFormatter.withFunction((oldValue, newValue) {
          int newLines = newValue.text.split('\n').length;
          if (newLines > widget.maxLines) {
            return oldValue;
          } else {
            return newValue;
          }
        }),
    ];

    // Type T = widget.inputType;
    // bool isAString =  (sameType<widget.inputType, String>());

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 2),
      alignment:
      widget.inputType == String ? Alignment.centerLeft : Alignment.center,
      child: widget.inputType == String
          ? _stringTextField(inputFormatters, inputDecoration)
          : _numberTextField(inputFormatters, inputDecoration),
    );
  }

  Widget _stringTextField(inputFormatters, inputDecoration) => FocusScope(
    canRequestFocus: true,
    child: TextField(
      controller: _txtController,
      maxLines: widget.isPassword
          ? 1
          : widget.maxLines == 1
          ? null
          : widget.maxLines,
      expands: false,
      // expands: widget.expands,
      // let key handler decide whether enter completes or appends newline
      inputFormatters: inputFormatters,
      decoration: inputDecoration,
      focusNode: _focusNode,
      autofocus: !widget.dontAutoFocus,
      obscureText: widget.isPassword && !passwordVisible,
      style: widget.textStyleF != null
          ? (widget.textStyleF!).call()
          : TextStyle(
          fontSize: 18,
          fontFamily: 'monospace',
          letterSpacing: 2,
          color: Colors.blue[900]),
      textAlign: widget.textAlignF != null
          ? (widget.textAlignF!).call()
          : TextAlign.left,
      textAlignVertical: TextAlignVertical.top,
      onTap: () {
        // fca.logger.i("TextField tapped");
        // widget.focusNode.requestFocus();
      },
      onChanged: (s) {
        widget.onTextChangedF.call(s);
      },
      onTapOutside: (_) {
        _focusNode.unfocus();
        fco.allowParentCalloutDrag(context);
      },
      autocorrect: false,
      enableInteractiveSelection: true,
      scrollPadding: const EdgeInsets.all(10),
    ),
  );

  Widget _numberTextField(inputFormatters, inputDecoration) => FocusScope(
    canRequestFocus: true,
    child: TextField(
      maxLines: 1,
      style: const TextStyle(
          fontSize: 16, fontFamily: 'monospace', color: Colors.black),
      controller: _txtController,
      inputFormatters: inputFormatters,
      decoration: inputDecoration,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      autofocus: true,
      onEditingComplete: () {
        widget.onEditingCompleteF.call(_txtController.text);
      },
      onTapOutside: (_) {
        widget.onEditingCompleteF.call(_txtController.text);
      },
    ),
  );
}