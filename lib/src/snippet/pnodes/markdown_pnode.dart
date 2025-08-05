import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'editors/property_callout_button_markdown.dart';

class MarkdownPNode extends PNode {
  String? stringValue;
  final ValueChanged<String?> onStringChange;
  final Size calloutButtonSize;
  final double calloutWidth;
  final double calloutHeight;

  MarkdownPNode({
    required this.stringValue,
    required this.onStringChange,
    required this.calloutButtonSize,
    required this.calloutWidth,
    required this.calloutHeight,
    required super.snode,
    required super.name,
  });

  @override
  void revertToOriginalValue() {
    onStringChange(stringValue = null);
  }

  @override
  Widget toPropertyNodeContents(BuildContext context) {
    ScrollControllerName? scName = EditablePage.maybeScrollControllerName(context);
    // fco.logger.i('toPropertyNodeContents');
    return PropertyButtonMarkdown(
      originalMarkdown: stringValue ?? '',
      label: super.name,
      // textInputType: const TextInputType.numberWithOptions(decimal: true),
      calloutButtonSize: calloutButtonSize,
      propertyBtnGK: GlobalKey(debugLabel: 'markdown'),
      onChangeF: (s) {
        fco.dismiss('te');
        onStringChange(stringValue = s);
      },
      scName: scName,
    );
  }
}
