
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_button_color.dart';

class ColorPNode extends PNode {
  int? colorValue;
  final ValueChanged<int?> onColorIntChange;
  final Size calloutButtonSize;

  ColorPNode({
    required this.colorValue,
    required this.onColorIntChange,
    required super.snode,
    required super.name,
    super.tooltip,
    this.calloutButtonSize = const Size(120, 24),
  });

  @override
  void revertToOriginalValue() {
    onColorIntChange.call(colorValue = null);
  }

  @override
  Widget toPropertyNodeContents(BuildContext context) {
    ScrollControllerName? scName = EditablePage.scName(context);
    return PropertyButtonColor(
      cId: name,
      label: name,
      tooltip: tooltip,
      originalColor: colorValue != null ? Color(colorValue!) : null,
      onChangeF: (Color? newColor) {
        if (newColor != null) {
          onColorIntChange.call(colorValue = newColor.value);
        }
      },
      calloutButtonSize: calloutButtonSize,
      scName: scName,
    );
  }
}
