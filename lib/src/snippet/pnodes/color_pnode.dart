
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_button_color.dart';

class ColorPNode extends PNode {
  ColorModel? color;
  final ValueChanged<ColorModel?> onColorChange;
  final Size calloutButtonSize;

  ColorPNode({
    required this.color,
    required this.onColorChange,
    required super.snode,
    required super.name,
    super.tooltip,
    this.calloutButtonSize = const Size(120, 24),
  });

  @override
  void revertToOriginalValue() {
    onColorChange.call(color = null);
  }

  @override
  Widget toPropertyNodeContents(BuildContext context) {
    ScrollControllerName? scName = EditablePage.scName(context);
    return PropertyButtonColor(
      cId: name,
      label: name,
      tooltip: tooltip,
      originalColor: color?.flutterValue,
      onChangeF: (Color? newColor) {
        if (newColor != null) {
          onColorChange.call(color = ColorModel.fromColor(newColor));
        }
      },
      calloutButtonSize: calloutButtonSize,
      scName: scName,
    );
  }
}
