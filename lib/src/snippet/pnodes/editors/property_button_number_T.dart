// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

/// show a button, but when pressed is replaced a an edit field.
/// On completion of the edit, reverts to a button.
class PropertyButtonNumber<T> extends HookWidget {
  final T originalValue;
  final ValueChanged<String> onChangedF;
  final Alignment alignment;
  final String? label;
  final Widget? labelWidget;
  final Size buttonSize;
  final Size editorSize;

  const PropertyButtonNumber({
    required this.originalValue,
    required this.onChangedF,
    this.alignment = Alignment.centerLeft,
    this.label,
    this.labelWidget,
    required this.buttonSize,
    required this.editorSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final showButton = useState<bool>(true);

    return !showButton.value ? _textField(showButton) : _button(showButton);
  }

  Widget _textField(ValueNotifier<bool> showButton) => Container(
        width: editorSize.width,
        height: editorSize.height,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ), // Adjust radius as needed
          color: Colors.white, // Set your desired background color
        ),
        child: StringOrNumberEditor(
          inputType: T,
          originalS: originalValue.toString(),
          onTextChangedF: (String value) {},
          onEditingCompleteF: (s) {
            showButton.value = true;
            if (originalValue.toString() != s) onChangedF(s);
          },
          dontAutoFocus: false,
        ),
        // child: NumberTextField<T>(
        //   originalText: ,
        //   onDoneF: (s) {
        //     showButton.value = true;
        //     if (originalValue.toString() != s) onChangedF(s);
        //   },
        // ),
      );

  Widget _button(ValueNotifier<bool> showButton) => GestureDetector(
        onTap: () {
          showButton.value = false;
        },
        child: Container(
          // margin: const EdgeInsets.only(top: 8),
          width: buttonSize.width,
          height: buttonSize.height,
          // padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          color: labelWidget != null ? null : Colors.white70,
          alignment: alignment,
          child: labelWidget ?? (label != null ? Text(label!) : const Offstage()),
        ),
      );
}
