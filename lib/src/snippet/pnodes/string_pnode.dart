import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_callout_button_T.dart';

class StringPNode extends PNode {
  String? stringValue;
  final ValueChanged<String?> onStringChange;
  final List<String>? options;
  final bool expands;
  final bool skipLabelText;
  final bool skipHelperText;
  final nameOnSeparateLine;
  final Size calloutButtonSize;
  final double calloutWidth;
  final int numLines;

  StringPNode({
    required this.stringValue,
    required this.onStringChange,
    this.options,
    this.expands = false,
    this.skipLabelText = false,
    this.skipHelperText = false,
    this.nameOnSeparateLine = false,
    required this.calloutButtonSize,
    required this.calloutWidth,
    this.numLines = 1,
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
    return PropertyButton<String>(
      // originalText: (stringValue??'').isNotEmpty
      //     ? nameOnSeparateLine
      //     ? '$name: \n$stringValue'
      //     : '$name: $stringValue'
      //     : '$name...',
      originalText: stringValue ?? '',
      options: options,
      label: super.name,
      maxLines: numLines,
      expands: expands,
      skipLabelText: skipLabelText,
      skipHelperText: skipHelperText,
      // textInputType: const TextInputType.numberWithOptions(decimal: true),
      calloutButtonSize: calloutButtonSize,
      calloutSize: Size(calloutWidth, numLines * 28 + 52),
      // calloutSize: calloutSize,
      propertyBtnGK: GlobalKey(debugLabel: ''),
      onChangeF: (s) {
        fco.dismiss('matches');
        fco.dismiss('te');
        onStringChange(stringValue = s);
      },
      scName: scName,
    );
  }
}
