import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_callout_button_quill_text.dart';

class QuillTextPNode extends PNode {
  String deltaValue;
  final ValueChanged<String?> onDeltaChange;
  final Size calloutButtonSize;
  final double calloutWidth;
  final double calloutHeight;

  QuillTextPNode({
    required this.deltaValue,
    required this.onDeltaChange,
    required this.calloutButtonSize,
    required this.calloutWidth,
    required this.calloutHeight,
    required super.snode,
    required super.name,
  });

  @override
  void revertToOriginalValue() {
    onDeltaChange(null);
  }

  @override
  Widget toPropertyNodeContents(BuildContext context) {
    ScrollControllerName? scName = EditablePage.maybeScrollControllerName(context);
    // fco.logger.i('toPropertyNodeContents');
    return PropertyButtonQuillText(
      originalDelta: deltaValue,
      label: super.name,
      // textInputType: const TextInputType.numberWithOptions(decimal: true),
      calloutButtonSize: calloutButtonSize,
      propertyBtnGK: GlobalKey(),
      onChangeF: (s) {
        fco.dismiss('te');
        onDeltaChange(deltaValue = s);
      },
      scName: scName,
    );
  }
}
