import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_callout_button_T.dart';

class SizePNode extends PNode {
  double? widthValue;
  double? heightValue;
  final ValueChanged<(double?, double?)> onSizeChange;

  // final Size calloutSize;

  // NodePropertyButton_String? button;

  SizePNode({
    required this.widthValue,
    required this.heightValue,
    required this.onSizeChange,
    required super.name,
    required super.snode,
  });

  @override
  void revertToOriginalValue() {
    onSizeChange((widthValue = null, heightValue = null));
  }

  @override
  Widget toPropertyNodeContents(BuildContext context) {
    ScrollControllerName? scName = EditablePage.maybeScrollControllerName(context);
    return SizedBox(
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          PropertyButton<double>(
            originalText: widthValue != null ? widthValue.toString() : '',
            label: 'width',
            skipHelperText: true,
            //inputType: double,
            calloutButtonSize: const Size(80, 20),
            calloutSize: const Size(80, 80),
            onChangeF: (s) {
              if (s.toLowerCase() == 'infinity') {
                onSizeChange.call((widthValue = 999999999, heightValue));
                return;
              }
              if (s.contains('/') && s.split('/').length == 2) {
                var split = s.split('/');
                double? part1 = double.tryParse(split[0]);
                double? part2 = double.tryParse(split[1]);
                if (part1 != null && part2 != null) {
                  onSizeChange.call((widthValue = part1 / part2, part2));
                }
              } else {
                onSizeChange
                    .call((widthValue = double.tryParse(s), heightValue));
              }
            },
            scName: scName,
            propertyBtnGK: GlobalKey(debugLabel: 'width'),
          ),
          const SizedBox(width: 40, child: Text('x')),
          PropertyButton<double>(
            originalText: heightValue != null ? heightValue.toString() : '',
            label: 'height',
            skipHelperText: true,
            //inputType: double,
            calloutButtonSize: const Size(80, 20),
            calloutSize: const Size(80, 80),
            // calloutSize: calloutSize,
            onChangeF: (s) {
              if (s.toLowerCase() == 'infinity') {
                onSizeChange.call((widthValue, heightValue = 999999999));
                return;
              }
              if (s.contains('/') && s.split('/').length == 2) {
                var split = s.split('/');
                double? part1 = double.tryParse(split[0]);
                double? part2 = double.tryParse(split[1]);
                if (part1 != null && part2 != null) {
                  onSizeChange.call((part2, heightValue = part1 / part2));
                }
              } else {
                onSizeChange
                    .call((widthValue, heightValue = double.tryParse(s)));
              }
            },
            scName: scName,
            propertyBtnGK: GlobalKey(debugLabel: 'height'),
          ),
        ],
      ),
    );
  }
}
