// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/flutter_text_editor.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// show a button, but when pressed is replaced a an edit field.
/// On completion of the edit, reverts to a button.
class NodePropertyEditor_Number<T> extends HookWidget {
  final T originalValue;
  final ValueChanged<String> onChangedF;
  final Alignment alignment;
  final String? label;
  final Widget? labelWidget;
  final Size calloutButtonSize;

  const NodePropertyEditor_Number({
    required this.originalValue,
    required this.onChangedF,
    this.alignment = Alignment.centerLeft,
    this.label,
    this.labelWidget,
    required this.calloutButtonSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final showButton = useState<bool>(true);
    var inputType = TextInputType.numberWithOptions(decimal:originalValue is double?);

    return !showButton.value
        ? FlutterTextEditor(
            originalText: originalValue.toString(),
            label: label ?? '',
            onDoneF: (s) {
              showButton.value = true;
              if (originalValue.toString() != s) onChangedF(s);
            },
            skipLabelText: true,
            skipHelperText: true,
            textInputType: inputType,
          )
        : GestureDetector(
            onTap: () {
              showButton.value = false;
            },
            child: Container(
              // margin: const EdgeInsets.only(top: 8),
              width: calloutButtonSize.width,
              height: calloutButtonSize.height,
              // padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              color: labelWidget != null ? null : Colors.white70,
              alignment: alignment,
              child: labelWidget ?? (label != null ? Text(label!) : const Offstage()),
            ),
          );
  }
}
