import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/snodes/edgeinsets_node_value.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_button_number_T.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

enum EdgeInsetsInputModeEnum { all, symmetrical, only }

class EdgeInsetsPropertyEditor extends HookWidget {
  final String name;
  final EdgeInsetsValue originalValue;
  final ValueChanged<EdgeInsetsValue> onChangedF;

  const EdgeInsetsPropertyEditor({
    required this.name,
    required this.originalValue,
    required this.onChangedF,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ei = useState<EdgeInsetsValue>(originalValue);
    final inputMode = useState<EdgeInsetsInputModeEnum>(EdgeInsetsInputModeEnum.all);
    return SizedBox(
      width: 240,
      height: 180,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Useful.coloredText(name, color: Colors.white54),
          // const Gap(6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Useful.coloredText('all', color: Colors.white, fontSize: 10),
              Useful.coloredText('Symm.', color: Colors.white, fontSize: 10),
              Useful.coloredText('only', color: Colors.white, fontSize: 10),
            ],
          ),
          SegmentedButton<EdgeInsetsInputModeEnum>(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.white),
              foregroundColor: MaterialStatePropertyAll(Colors.purple),
              side: MaterialStatePropertyAll(BorderSide(color: Colors.purple)),
              visualDensity: VisualDensity(horizontal: -4, vertical: -4),
            ),
            segments: const <ButtonSegment<EdgeInsetsInputModeEnum>>[
              ButtonSegment<EdgeInsetsInputModeEnum>(
                value: EdgeInsetsInputModeEnum.all,
                label: Offstage(),
              ),
              ButtonSegment<EdgeInsetsInputModeEnum>(
                value: EdgeInsetsInputModeEnum.symmetrical,
                label: Offstage(),
              ),
              ButtonSegment<EdgeInsetsInputModeEnum>(
                value: EdgeInsetsInputModeEnum.only,
                label: Offstage(),
              ),
            ],
            selected: <EdgeInsetsInputModeEnum>{inputMode.value},
            onSelectionChanged: (Set<EdgeInsetsInputModeEnum> newInputMode) {
              // By default there is only a single segment that can be
              // selected at one time, so its value is always the first
              // item in the selected set.
              inputMode.value = newInputMode.first;
              // if (inputMode.value == EdgeInsetsInputModeEnum.all) {
              //   ei.value.left = ei.value.right = ei.value.bottom = ei.value.top;
              // } else if (inputMode.value == EdgeInsetsInputModeEnum.symmetrical) {
              //   ei.value.right = ei.value.left;
              //   ei.value.bottom = ei.value.top;
              // }
              // ei.value.bottom = ei.value.top;
              // onChangedF(value);
            },
          ),
          SizedBox(
            // color: Colors.white,
            width: 240,
            height: 100,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    // padding: EdgeInsets.all(10),
                    width: 100,
                    height: 40,
                    color: Colors.purple,
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: PropertyButtonNumber<double>(
                    originalValue: ei.value.top,
                    labelWidget: RichText(
                      text: TextSpan(text: 'top: ', style: TextStyle(color: Colors.white), children: [
                        TextSpan(
                          text: '${ei.value.top}',
                          style: const TextStyle(color: Colors.cyanAccent),
                        ),
                      ]),
                    ),
                    onChangedF: (s) {
                      double? newTop = double.tryParse(s);
                      if (newTop != null) {
                        if (inputMode.value == EdgeInsetsInputModeEnum.all) {
                          ei.value = EdgeInsetsValue(top: newTop, left: newTop, bottom: newTop, right: newTop);
                        } else if (inputMode.value == EdgeInsetsInputModeEnum.symmetrical) {
                          ei.value = EdgeInsetsValue(top: newTop, left: ei.value.left, bottom: newTop, right: ei.value.right);
                        } else {
                          ei.value = EdgeInsetsValue(top: newTop, left: ei.value.left, bottom: ei.value.bottom, right: ei.value.right);
                        }
                      }
                      onChangedF.call(ei.value);
                    },
                    alignment: Alignment.center,
                    buttonSize: const Size(50, 40),
                    editorSize: const Size(80, 60),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: PropertyButtonNumber<double>(
                    originalValue: ei.value.left,
                    labelWidget: RichText(
                      text: TextSpan(text: 'left: ', style: TextStyle(color: Colors.white), children: [
                        TextSpan(
                          text: '${ei.value.left}',
                          style: const TextStyle(color: Colors.cyanAccent),
                        ),
                      ]),
                    ),
                    onChangedF: (s) {
                      double? newLeft = double.tryParse(s);
                      if (newLeft != null) {
                        if (inputMode.value == EdgeInsetsInputModeEnum.all) {
                          ei.value = EdgeInsetsValue(top: newLeft, left: newLeft, bottom: newLeft, right: newLeft);
                        } else if (inputMode.value == EdgeInsetsInputModeEnum.symmetrical) {
                          ei.value = EdgeInsetsValue(top: ei.value.top, left: newLeft, bottom: ei.value.bottom, right: newLeft);
                        } else {
                          ei.value = EdgeInsetsValue(top: ei.value.top, left: newLeft, bottom: ei.value.bottom, right: ei.value.right);
                        }
                      }
                      onChangedF.call(ei.value);
                    },
                    alignment: Alignment.center,
                    buttonSize: const Size(50, 40),
                    editorSize: const Size(80, 60),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: PropertyButtonNumber<double>(
                    originalValue: ei.value.right,
                    labelWidget: RichText(
                      text: TextSpan(text: 'right: ', style: TextStyle(color: Colors.white), children: [
                        TextSpan(
                          text: '${ei.value.right}',
                          style: const TextStyle(color: Colors.cyanAccent),
                        ),
                      ]),
                    ),
                    onChangedF: (s) {
                      double? newRight = double.tryParse(s);
                      if (newRight != null) {
                        if (inputMode.value == EdgeInsetsInputModeEnum.all) {
                          ei.value = EdgeInsetsValue(top: newRight, left: newRight, bottom: newRight, right: newRight);
                        } else if (inputMode.value == EdgeInsetsInputModeEnum.symmetrical) {
                          ei.value = EdgeInsetsValue(top: ei.value.top, left: newRight, bottom: ei.value.bottom, right: newRight);
                        } else {
                          ei.value = EdgeInsetsValue(top: ei.value.top, left: ei.value.left, bottom: ei.value.bottom, right: newRight);
                        }
                      }
                      onChangedF.call(ei.value);
                    },
                    alignment: Alignment.center,
                    buttonSize: const Size(70, 40),
                    editorSize: const Size(80, 60),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: PropertyButtonNumber<double>(
                    originalValue: ei.value.bottom,
                    labelWidget: RichText(
                      text: TextSpan(text: 'bottom: ', style: TextStyle(color: Colors.white), children: [
                        TextSpan(
                          text: '${ei.value.bottom}',
                          style: const TextStyle(color: Colors.cyanAccent),
                        ),
                      ]),
                    ),
                    onChangedF: (s) {
                      double? newBottom = double.tryParse(s);
                      if (newBottom != null) {
                        // debugPrint(inputMode.name);
                        if (inputMode.value == EdgeInsetsInputModeEnum.all) {
                          ei.value = EdgeInsetsValue(top: newBottom, left: newBottom, bottom: newBottom, right: newBottom);
                        } else if (inputMode.value == EdgeInsetsInputModeEnum.symmetrical) {
                          ei.value = EdgeInsetsValue(top: newBottom, left: ei.value.left, bottom: newBottom, right: ei.value.right);
                        } else {
                          ei.value = EdgeInsetsValue(top: ei.value.top, left: ei.value.left, bottom: newBottom, right: ei.value.right);
                        }
                      }
                      onChangedF.call(ei.value);
                    },
                    alignment: Alignment.center,
                    buttonSize: const Size(90, 40),
                    editorSize: const Size(80, 60),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
