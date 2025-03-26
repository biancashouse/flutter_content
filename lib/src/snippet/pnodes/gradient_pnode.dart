import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_button_color.dart';
import 'package:flutter_content/src/snippet/snodes/upto6color_values.dart';

class GradientPNode extends PNode {
  UpTo6ColorValues? colorValues;
  final void Function(UpTo6ColorValues?) onColorChange;

  GradientPNode({
    required this.colorValues,
    required this.onColorChange,
    required super.snode,
    required super.name,
  });

  @override
  void revertToOriginalValue() {
    onColorChange.call(colorValues = null);
  }

  @override
  Widget toPropertyNodeContents(BuildContext context) {
    ScrollControllerName? scName = EditablePage.scName(context);
    return Tooltip(
      message: name,
      child: SizedBox(
        width: 180,
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return PropertyButtonColor(
                      cId: '$name:1',
                      // key: GlobalKey(),
                      label: '',
                      originalColor: colorValues?.color1Value != null
                          ? Color(colorValues!.color1Value!)
                          : null,
                      onChangeF: (Color? newColor) {
                        if (newColor != null) {
                          setState(() => onColorChange.call(
                            colorValues = UpTo6ColorValues(
                              color1Value: newColor.value,
                              color2Value: colorValues?.color2Value,
                              color3Value: colorValues?.color3Value,
                              color4Value: colorValues?.color4Value,
                              color5Value: colorValues?.color5Value,
                              color6Value: colorValues?.color6Value,
                            ),
                          ));
                        }
                      },
                      scName: scName,
                      calloutButtonSize: const Size(24, 24),
                    );
                  }),
              StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return PropertyButtonColor(
                    cId: '$name:2',
                    label: '',
                    originalColor: colorValues?.color2Value != null
                        ? Color(colorValues!.color2Value!)
                        : null,
                    onChangeF: (Color? newColor) {
                      if (newColor != null) {
                        setState(() => onColorChange.call(
                          colorValues = UpTo6ColorValues(
                            color1Value: colorValues?.color1Value,
                            color2Value: newColor.value,
                            color3Value: colorValues?.color3Value,
                            color4Value: colorValues?.color4Value,
                            color5Value: colorValues?.color5Value,
                            color6Value: colorValues?.color6Value,
                          ),
                        ));
                      }
                    },
                    scName: scName,
                    calloutButtonSize: const Size(24, 24),
                  );
                },
              ),
              StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return PropertyButtonColor(
                    cId: '$name:3',
                    label: '',
                    originalColor: colorValues?.color3Value != null
                        ? Color(colorValues!.color3Value!)
                        : null,
                    onChangeF: (Color? newColor) {
                      if (newColor != null) {
                        setState(() => onColorChange.call(
                          colorValues = UpTo6ColorValues(
                            color1Value: colorValues?.color1Value,
                            color2Value: colorValues?.color2Value,
                            color3Value: newColor.value,
                            color4Value: colorValues?.color4Value,
                            color5Value: colorValues?.color5Value,
                            color6Value: colorValues?.color6Value,
                          ),
                        ));
                      }
                    },
                    scName: scName,
                    calloutButtonSize: const Size(24, 24),
                  );
                },
              ),
              StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return PropertyButtonColor(
                    cId: '$name:4',
                    label: '',
                    originalColor: colorValues?.color4Value != null
                        ? Color(colorValues!.color4Value!)
                        : null,
                    onChangeF: (Color? newColor) {
                      if (newColor != null) {
                        setState(() => onColorChange.call(
                          colorValues = UpTo6ColorValues(
                            color1Value: colorValues?.color1Value,
                            color2Value: colorValues?.color2Value,
                            color3Value: colorValues?.color3Value,
                            color4Value: newColor.value,
                            color5Value: colorValues?.color5Value,
                            color6Value: colorValues?.color6Value,
                          ),
                        ));
                      }
                    },
                    scName: scName,
                    calloutButtonSize: const Size(24, 24),
                  );
                },
              ),
              StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return PropertyButtonColor(
                    cId: '$name:5',
                    label: '',
                    originalColor: colorValues?.color5Value != null
                        ? Color(colorValues!.color5Value!)
                        : null,
                    onChangeF: (Color? newColor) {
                      if (newColor != null) {
                        setState(() => onColorChange.call(
                          colorValues = UpTo6ColorValues(
                            color1Value: colorValues?.color1Value,
                            color2Value: colorValues?.color2Value,
                            color3Value: colorValues?.color3Value,
                            color4Value: colorValues?.color4Value,
                            color5Value: newColor.value,
                            color6Value: colorValues?.color6Value,
                          ),
                        ));
                      }
                    },
                    scName: scName,
                    calloutButtonSize: const Size(24, 24),
                  );
                },
              ),
              StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return PropertyButtonColor(
                    cId: '$name:6',
                    label: '',
                    originalColor: colorValues?.color6Value != null
                        ? Color(colorValues!.color6Value!)
                        : null,
                    onChangeF: (Color? newColor) {
                      if (newColor != null) {
                        setState(() => onColorChange.call(
                          colorValues = UpTo6ColorValues(
                            color1Value: colorValues?.color1Value,
                            color2Value: colorValues?.color2Value,
                            color3Value: colorValues?.color3Value,
                            color4Value: colorValues?.color4Value,
                            color5Value: colorValues?.color5Value,
                            color6Value: newColor.value,
                          ),
                        ));
                      }
                    },
                    scName: scName,
                    calloutButtonSize: const Size(24, 24),
                  );
                },
              ),
            ]),
      ),
    );
  }
}
