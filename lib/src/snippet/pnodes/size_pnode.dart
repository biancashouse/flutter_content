import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

import 'editors/property_callout_button_size.dart';

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
    return PropertyButtonSize(
      originalSize: (widthValue, heightValue),
      skipHelperText: true,
      label: 'size',
      onSizeChange: (newSize) {
        widthValue = newSize.$1;
        heightValue = newSize.$2;
        onSizeChange(newSize);
      },
      propertyBtnGK: GlobalKey(debugLabel: 'width'),
    );
  }

  // void _widthChanged(String s) {
  //   if (s.toLowerCase() == 'infinity') {
  //     onSizeChange.call((widthValue = 999999999, heightValue));
  //     return;
  //   }
  //   if (s.contains('/') && s.split('/').length == 2) {
  //     var split = s.split('/');
  //     double? part1 = double.tryParse(split[0]);
  //     double? part2 = double.tryParse(split[1]);
  //     if (part1 != null && part2 != null) {
  //       onSizeChange.call((widthValue = part1 / part2, part2));
  //     }
  //   } else {
  //     onSizeChange.call((widthValue = double.tryParse(s), heightValue));
  //   }
  // }
  //
  // void _heightChanged(String s) {
  //   if (s.toLowerCase() == 'infinity') {
  //     onSizeChange.call((widthValue, heightValue = 999999999));
  //     return;
  //   }
  //   if (s.contains('/') && s.split('/').length == 2) {
  //     var split = s.split('/');
  //     double? part1 = double.tryParse(split[0]);
  //     double? part2 = double.tryParse(split[1]);
  //     if (part1 != null && part2 != null) {
  //       onSizeChange.call((part2, heightValue = part1 / part2));
  //     }
  //   } else {
  //     onSizeChange.call((widthValue, heightValue = double.tryParse(s)));
  //   }
  // }
}
