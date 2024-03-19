import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/target_config/content/snippet_editor/node_properties/decimal_editor.dart';
import 'package:flutter_content/src/target_config/content/snippet_editor/node_properties/node_property_callout_button.dart';

class NodePropertyButtonDecimal extends StatelessWidget {
  final String? label;
  final Widget? labelWidget;
  final String? helperText;
  final String? originalValue;
  final Function(String) onChangeF;
  final Size calloutSize;

  const NodePropertyButtonDecimal({
    this.label,
    this.labelWidget,
    this.helperText,
    required this.originalValue,
    required this.onChangeF,
    required this.calloutSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) => NodePropertyCalloutButton(
        label: label,
        labelWidget: labelWidget,
        calloutButtonSize: const Size(72, 36),
        calloutContents: (ctx) {
          return Center(
            child: DecimalEditor(
              // label: originalValue != null
              //     ? (label != null ? '$label: $originalValue': originalValue)
              //     : null,
              helperText: helperText,
              originalS: originalValue?.toString() ?? '',
              onChangedF: (s) {
                onChangeF.call(s);
              },
              onDoneF: (s) {
                Useful.afterMsDelayDo(500, () {
                  Callout.dismiss(NODE_PROPERTY_CALLOUT_BUTTON);
                });
              },
            ),
          );
        },
        calloutSize: calloutSize,
    notifier: ValueNotifier<int>(0),
      );
}
