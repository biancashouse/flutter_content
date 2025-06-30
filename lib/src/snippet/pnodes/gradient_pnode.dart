import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_button_color.dart';
import 'package:flutter_content/src/snippet/snodes/upto6colors.dart';

class GradientPNode extends PNode {
  UpTo6Colors? colors;
  final void Function(UpTo6Colors?) onColorChange;

  GradientPNode({
    required this.colors,
    required this.onColorChange,
    required super.snode,
    required super.name,
  });

  @override
  void revertToOriginalValue() {
    onColorChange.call(colors = null);
  }

  @override
  Widget toPropertyNodeContents(BuildContext context) {
    ScrollControllerName? scName = EditablePage.maybeScrollControllerName(context);
    return Tooltip(
      message: name,
      child: SizedBox(
        width: 180,
        child: Column(
          children: [
            fco.coloredText(name, color: Colors.white),
            Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return PropertyButtonColor(
                          cId: '$name:1',
                          // key: GlobalKey(),
                          label: '',
                          originalColor: colors?.color1 != null
                              ? colors!.color1!.flutterValue
                              : null,
                          onChangeF: (Color? newColor) {
                            if (newColor != null) {
                              setState(() => onColorChange.call(
                                colors = UpTo6Colors(
                                  color1: ColorModel.fromColor(newColor),
                                  color2: colors?.color2,
                                  color3: colors?.color3,
                                  color4: colors?.color4,
                                  color5: colors?.color5,
                                  color6: colors?.color6,
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
                        originalColor: colors?.color2 != null
                            ? colors!.color2!.flutterValue
                            : null,
                        onChangeF: (Color? newColor) {
                          if (newColor != null) {
                            setState(() => onColorChange.call(
                              colors = UpTo6Colors(
                                color1: colors?.color1,
                                color2: ColorModel.fromColor(newColor),
                                color3: colors?.color3,
                                color4: colors?.color4,
                                color5: colors?.color5,
                                color6: colors?.color6,
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
                        originalColor: colors?.color3 != null
                            ? colors!.color3!.flutterValue
                            : null,
                        onChangeF: (Color? newColor) {
                          if (newColor != null) {
                            setState(() => onColorChange.call(
                              colors = UpTo6Colors(
                                color1: colors?.color1,
                                color2: colors?.color2,
                                color3: ColorModel.fromColor(newColor),
                                color4: colors?.color4,
                                color5: colors?.color5,
                                color6: colors?.color6,
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
                        originalColor: colors?.color4 != null
                            ? colors!.color4!.flutterValue
                            : null,
                        onChangeF: (Color? newColor) {
                          if (newColor != null) {
                            setState(() => onColorChange.call(
                              colors = UpTo6Colors(
                                color1: colors?.color1,
                                color2: colors?.color2,
                                color3: colors?.color3,
                                color4: ColorModel.fromColor(newColor),
                                color5: colors?.color5,
                                color6: colors?.color6,
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
                        originalColor: colors?.color5 != null
                            ? colors!.color5!.flutterValue
                            : null,
                        onChangeF: (Color? newColor) {
                          if (newColor != null) {
                            setState(() => onColorChange.call(
                              colors = UpTo6Colors(
                                color1: colors?.color1,
                                color2: colors?.color2,
                                color3: colors?.color3,
                                color4: colors?.color4,
                                color5: ColorModel.fromColor(newColor),
                                color6: colors?.color6,
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
                        originalColor: colors?.color6 != null
                            ? colors!.color6!.flutterValue
                            : null,
                        onChangeF: (Color? newColor) {
                          if (newColor != null) {
                            setState(() => onColorChange.call(
                              colors = UpTo6Colors(
                                color1: colors?.color1,
                                color2: colors?.color2,
                                color3: colors?.color3,
                                color4: colors?.color4,
                                color5: colors?.color5,
                                color6: ColorModel.fromColor(newColor),
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
          ],
        ),
      ),
    );
  }
}
