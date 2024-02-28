import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/snodes/edgeinsets_node_value.dart';
import 'package:flutter_content/src/target_config/content/snippet_editor/node_properties/node_property_button_double.dart';
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
    final ei = useState<EdgeInsetsValue>(originalValue ?? EdgeInsetsValue());
    final inputMode = useState<EdgeInsetsInputModeEnum>(EdgeInsetsInputModeEnum.all);
    return SizedBox(
      width: 200,
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
          Container(
            // color: Colors.white,
            width: 200,
            height: 100,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: _tappableNumber(
                    ei.value.top,
                    'top',
                    (s) {
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
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: _tappableNumber(
                    ei.value.left,
                    'left',
                    (s) {
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
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: _tappableNumber(
                    ei.value.right,
                    'right',
                    (s) {
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
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: _tappableNumber(
                    ei.value.bottom,
                    'bottom',
                    (s) {
                      double? newBottom = double.tryParse(s);
                      if (newBottom != null) {
                        // print(inputMode.name);
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
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _tappableNumber(final double value, final String label, final ValueChanged<String> onChangedF) => SizedBox(
        width: 60,
        height: 40,
        child: Align(
          alignment: Alignment.center,
          child: NodePropertyEditor_Double(
            originalValue: value,
            onChangedF: onChangedF,
            alignment: Alignment.center,
            label: value.toString(),
            calloutButtonSize: const Size(60, 30),
          ),
        ),
      );
}

// class _Checkbox extends StatefulWidget {
//   final bool initialState;
//   final ValueChanged<bool> edgeInsetsSideChangedF;
//
//   _Checkbox({this.initialState = false, required this.edgeInsetsSideChangedF, super.key});
//
//   @override
//   State<_Checkbox> createState() => _CheckboxState();
// }
//
// class _CheckboxState extends State<_Checkbox> {
//   late bool isSelected;
//
//   @override
//   void initState() {
//     super.initState();
//     isSelected = initialState;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Color getColor(Set<MaterialState> states) {
//       const Set<MaterialState> interactiveStates = <MaterialState>{
//         MaterialState.pressed,
//         MaterialState.hovered,
//         MaterialState.focused,
//       };
//       if (states.any(interactiveStates.contains)) {
//         return Colors.orange;
//       }
//       return isSelected ? Colors.purple : Colors.purpleAccent;
//     }
//
//     return Checkbox(
//       value: isSelected,
//       checkColor: Colors.white,
//       fillColor: MaterialStateProperty.resolveWith(getColor),
//       onChanged: (bool? value) {
//         setState(() {
//           isSelected = value!;
//           edgeInsetsSideChangedF(isSelected);
//         });
//       },
//     );
//   }
// }
