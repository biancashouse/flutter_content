import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_callout_button_T.dart';

class OffsetPNode extends PNode {
  double? topValue;
  double? leftValue;
  final ValueChanged<(double?, double?)> onOffsetChange;

  // final Offset calloutOffset;

  // NodePropertyButton_String? button;

  OffsetPNode({
    required this.topValue,
    required this.leftValue,
    required this.onOffsetChange,
    required super.name,
    required super.snode,
  });

  @override
  void revertToOriginalValue() {
    onOffsetChange((topValue = null, leftValue = null));
  }

  @override
  Widget toPropertyNodeContents(BuildContext context) {
    ScrollControllerName? scName = EditablePage.scName(context);
    return SizedBox(
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          PropertyButton<double>(
            originalText: topValue != null ? topValue.toString() : '',
            label: 'left',
            skipLabelText: true,
            skipHelperText: true,
            //inputType: double,
            calloutButtonSize: const Size(80, 20),
            calloutSize: const Size(120, 80),
            propertyBtnGK: GlobalKey(debugLabel: 'left'),
            onChangeF: (s) {
              if (s.toLowerCase() == 'infinity') {
                onOffsetChange.call((topValue = 999999999, leftValue));
                return;
              }
              if (s.contains('/') && s.split('/').length == 2) {
                var split = s.split('/');
                double? part1 = double.tryParse(split[0]);
                double? part2 = double.tryParse(split[1]);
                if (part1 != null && part2 != null) {
                  onOffsetChange.call((topValue = part1 / part2, part2));
                }
              } else {
                onOffsetChange.call((topValue = double.tryParse(s), leftValue));
              }
            },
            scName: scName,
          ),
          const SizedBox(width: 40, child: Text('x')),
          PropertyButton<double>(
            originalText: leftValue != null ? leftValue.toString() : '',
            label: 'top',
            skipLabelText: true,
            skipHelperText: true,
            //inputType: double,
            calloutButtonSize: const Size(80, 20),
            calloutSize: const Size(120, 80),
            // calloutOffset: calloutOffset,
            propertyBtnGK: GlobalKey(debugLabel: 'top'),
            onChangeF: (s) {
              if (s.toLowerCase() == 'infinity') {
                onOffsetChange.call((topValue, leftValue = 999999999));
                return;
              }
              if (s.contains('/') && s.split('/').length == 2) {
                var split = s.split('/');
                double? part1 = double.tryParse(split[0]);
                double? part2 = double.tryParse(split[1]);
                if (part1 != null && part2 != null) {
                  onOffsetChange.call((part2, leftValue = part1 / part2));
                }
              } else {
                onOffsetChange.call((topValue, leftValue = double.tryParse(s)));
              }
            },
            scName: scName,
          ),
        ],
      ),
    );
  }
}
