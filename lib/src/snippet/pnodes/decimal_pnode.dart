import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_callout_button_T.dart';

class DecimalPNode extends PNode {
  double? decimalValue;
  final ValueChanged<double?> onDoubleChange;
  final bool viaButton;
  final Size calloutButtonSize;

  // final Size calloutSize;

  // NodePropertyButton_String? button;

  DecimalPNode({
    required this.decimalValue,
    required this.onDoubleChange,
    this.viaButton = false,
    required this.calloutButtonSize,
    // required this.calloutSize,
    required super.name,
    required super.snode,
  });

  @override
  void revertToOriginalValue() {
    onDoubleChange(decimalValue = null);
  }

  @override
  Widget toPropertyNodeContents(BuildContext context) {
    ScrollControllerName? scName = EditablePage.scName(context);
    return PropertyButton<double>(
      originalText: decimalValue != null ? decimalValue.toString() : '',
      label: super.name,
      skipHelperText: true,
      //inputType: double,
      calloutButtonSize: calloutButtonSize,
      calloutSize: const Size(120, 80),
      // calloutSize: calloutSize,
      propertyBtnGK: GlobalKey(debugLabel: 'decimal'),
      onChangeF: (s) {
        if (s.toLowerCase() == 'infinity') {
          onDoubleChange.call(decimalValue = 999999999);
          return;
        }
        if (s.contains('/') && s.split('/').length == 2) {
          var split = s.split('/');
          double? w = double.tryParse(split[0]);
          double? h = double.tryParse(split[1]);
          if (w != null && h != null) {
            onDoubleChange.call(decimalValue = w / h);
          }
        } else {
          onDoubleChange.call(decimalValue = double.tryParse(s));
        }
      },
      scName: scName,
    );
  }
}
