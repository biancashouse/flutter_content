import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_content/flutter_content.dart';

/// https://www.flutterbeads.com/multiline-textfield-in-flutter/
///
class TextEditor extends StatefulWidget {
  final Feature? parentFeature; // only if called as a result of Callout.showOverlay()
  final String? prompt;
  final String originalS;
  final ValueChanged<String> onTextChangedF;
  final void Function(String) onEditingCompleteF;
  final Widget? prefixIcon;

  // final bool expands;
  final int maxLines;
  final bool canExpand;
  final bool dontAutoFocus;
  final Color? bgColor;
  final InputDecoration? decoration;
  final bool isPassword;
  final Type? inputType;
  final TextStyleF? textStyleF;
  final TextAlignF? textAlignF;

  const TextEditor({
    this.parentFeature,
    this.prompt,
    required this.originalS,
    required this.onTextChangedF,
    required this.onEditingCompleteF,
    this.prefixIcon,
    this.maxLines = 1,
    this.canExpand = false,
    required this.dontAutoFocus,
    this.bgColor,
    this.decoration,
    this.inputType = String,
    this.isPassword = false,
    this.textStyleF,
    this.textAlignF,
    super.key,
  });

  @override
  TextEditorState createState() => TextEditorState();
}

class TextEditorState extends State<TextEditor> {
  late TextEditingController _txtController;
  bool passwordVisible = false;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    // passwordVisible = true;

    _focusNode = FocusNode(
      onKeyEvent: (node, event) {
        final enterPressedWithoutShift = event is KeyDownEvent &&
            event.physicalKey == PhysicalKeyboardKey.enter &&
            !HardwareKeyboard.instance.physicalKeysPressed.any(
              (key) => <PhysicalKeyboardKey>{
                PhysicalKeyboardKey.shiftLeft,
                PhysicalKeyboardKey.shiftRight,
              }.contains(key),
            );

        final enterPressedWithShift = event is KeyDownEvent &&
            event.physicalKey == PhysicalKeyboardKey.enter &&
            HardwareKeyboard.instance.physicalKeysPressed.any(
              (key) => <PhysicalKeyboardKey>{
                PhysicalKeyboardKey.shiftLeft,
                PhysicalKeyboardKey.shiftRight,
              }.contains(key),
            );

        // final digitPressed = event is KeyDownEvent &&
        //     event.physicalKey == PhysicalKeyboardKey.enter &&
        //     HardwareKeyboard.instance.physicalKeysPressed.any(
        //       (key) => <PhysicalKeyboardKey>{
        //         PhysicalKeyboardKey.digit0,
        //         PhysicalKeyboardKey.digit1,
        //         PhysicalKeyboardKey.digit2,
        //         PhysicalKeyboardKey.digit3,
        //         PhysicalKeyboardKey.digit4,
        //         PhysicalKeyboardKey.digit5,
        //         PhysicalKeyboardKey.digit6,
        //         PhysicalKeyboardKey.digit7,
        //         PhysicalKeyboardKey.digit8,
        //         PhysicalKeyboardKey.digit9,
        //         PhysicalKeyboardKey.slash,
        //         if (widget.inputType == double) PhysicalKeyboardKey.period,
        //       }.contains(key),
        //     );

        // when maxLines != 1, shift-enter accepts text
        if ((widget.maxLines > 1 && enterPressedWithShift) || (widget.maxLines < 2 && (enterPressedWithShift || enterPressedWithoutShift))) {
          widget.onEditingCompleteF.call(_txtController.text);
          CalloutState? state = Callout.of(context);
          if (state != null) {
            state.hideOP();
          } else {
            Callout.dismiss(widget.parentFeature!);
          }
          return KeyEventResult.handled;
        }

        // esc key
        if (event.physicalKey == PhysicalKeyboardKey.escape) {
          widget.onEditingCompleteF(widget.originalS);
          CalloutState? state = Callout.of(context);
          if (state != null) {
            state.hideOP();
          } else {
            Callout.dismiss(widget.parentFeature!);
          }
          return KeyEventResult.handled;
        }

        // Disable holding enter
        if (event is KeyRepeatEvent) {
          return KeyEventResult.handled;
        }

        // just ignore anything else
        return KeyEventResult.ignored;
      },
    );

    _txtController = TextEditingController();
    _txtController.text = widget.originalS;
    if (!widget.dontAutoFocus) {
      Useful.afterNextBuildDo(() {
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
    Widget? prefixWidget;
    if (widget.prefixIcon != null && (widget.prompt?.isNotEmpty ?? false)) {
      prefixWidget = Row(
        children: [
          widget.prefixIcon!,
          Useful.coloredText(
            widget.prompt!,
            color: Colors.purpleAccent,
            fontSize: 14,
          ),
        ],
      );
    } else if (widget.prefixIcon != null) {
      prefixWidget = widget.prefixIcon!;
    }
    if (widget.prompt?.isNotEmpty ?? false) {
      prefixWidget = Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Useful.coloredText(widget.prompt!, color: Colors.purpleAccent),
      );
    }

    TextInputType keyboardType = widget.isPassword ? TextInputType.visiblePassword : TextInputType.multiline;

    if (!kIsWeb && widget.inputType == int) {
      keyboardType = TextInputType.number;
    } else if (!kIsWeb && widget.inputType == double) {
      keyboardType = const TextInputType.numberWithOptions(decimal: true);
    }

    return TextField(
      controller: _txtController,
      focusNode: _focusNode,
      keyboardType: keyboardType,
      maxLines: widget.isPassword ? 1 : widget.maxLines == 1  ? null : widget.maxLines,
      expands: false,
      // expands: widget.expands,
      // let key handler decide whether enter completes or appends newline
      inputFormatters: [
        if (widget.inputType == double) FilteringTextInputFormatter.allow(RegExp(r'^[\d/.]*$')),
        if (widget.inputType == int) FilteringTextInputFormatter.allow(RegExp(r'^[\d]*$')),
        if (!widget.canExpand)
          TextInputFormatter.withFunction((oldValue, newValue) {
            int newLines = newValue.text.split('\n').length;
            if (newLines > widget.maxLines) {
              return oldValue;
            } else {
              return newValue;
            }
          }),
      ],
      decoration: widget.isPassword
          ? InputDecoration(
              border: const UnderlineInputBorder(),
              //hintText: "Password",
              labelText: _txtController.text.isEmpty ? "Password" : '',
              labelStyle: Useful.enclosureLabelTextStyle,
              helperText: "Forgot password ?\nContact Ian on 0404 950 122\n",
              helperStyle: const TextStyle(color: Colors.green),
              suffixIcon: IconButton(
                icon: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off),
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
              labelText: widget.prompt,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black26),
              ),
            ),
      autofocus: !widget.dontAutoFocus,
      obscureText: widget.isPassword && !passwordVisible,
      style: widget.textStyleF != null
          ? (widget.textStyleF!).call()
          : TextStyle(fontSize: 18, fontFamily: 'monospace', letterSpacing: 2, color: Colors.blue[900]),
      textAlign: widget.textAlignF != null ? (widget.textAlignF!).call() : TextAlign.left,
      textAlignVertical: TextAlignVertical.top,
      onTap: () {
        // debugPrint("TextField tapped");
        // widget.focusNode.requestFocus();
      },
      onChanged: (s) {
        widget.onTextChangedF.call(s);
      },
      onTapOutside: (_) {
        _focusNode.unfocus();
        Callout.allowParentCalloutDrag(context);
      },
      autocorrect: false,
      enableInteractiveSelection: true,
      scrollPadding: const EdgeInsets.all(10),
    );
    // );
  }
}
