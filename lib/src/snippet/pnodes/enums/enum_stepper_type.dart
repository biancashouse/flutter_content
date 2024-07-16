import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_callouts/flutter_callouts.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

part 'enum_stepper_type.mapper.dart';

@MappableEnum()
enum StepperTypeEnum {
  horizontal(StepperType.horizontal),
  vertical(StepperType.vertical);

  const StepperTypeEnum(this.flutterValue);

  final StepperType flutterValue;

  String toSource() => 'StepperType.$name';

  static Widget propertyNodeContents({
    int? enumValueIndex,
    required STreeNode snode,
    required String label,
    ValueChanged<int?>? onChangedF,
  }) =>
      SizedBox(
        width: 280,
        height: 70,
        child: Column(
          children: [
            fco.coloredText('type:', color: Colors.white),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                fco.coloredText('horizontal', color: Colors.white),
                fco.coloredText('vertical', color: Colors.white),
              ],
            ),
            StepperTypeEditor(
              originalValue: StepperTypeEnum.of(enumValueIndex),
              onChangedF: (StepperTypeEnum? newValue) {
                onChangedF?.call(newValue?.index);
              },
            ),
          ],
        ),
      );

   Widget toMenuItem() => fco.coloredText(name, color: Colors.white);

  static StepperTypeEnum? of(int? index) => index != null ? StepperTypeEnum.values.elementAtOrNull(index) : null;
}

class StepperTypeEditor extends HookWidget {
  final StepperTypeEnum? originalValue;
  final Function(StepperTypeEnum?) onChangedF;

  const StepperTypeEditor({required this.originalValue, required this.onChangedF, super.key});

  @override
  Widget build(BuildContext context) {
    final type = useState<StepperTypeEnum?>(originalValue ?? StepperTypeEnum.horizontal);
    return SizedBox(
      width: 280,
      child: SegmentedButton<StepperTypeEnum?>(
        style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.white),
          foregroundColor: WidgetStatePropertyAll(Colors.purple),
          side: WidgetStatePropertyAll(BorderSide(color: Colors.purple)),
          visualDensity: VisualDensity(horizontal: -4, vertical: -4),
        ),
        segments: const <ButtonSegment<StepperTypeEnum?>>[
          ButtonSegment<StepperTypeEnum?>(
            value: StepperTypeEnum.horizontal,
            label: Offstage(),
          ),
          ButtonSegment<StepperTypeEnum?>(
            value: StepperTypeEnum.vertical,
            label: Offstage(),
          ),
        ],
        selected: <StepperTypeEnum?>{type.value},
        onSelectionChanged: (Set<StepperTypeEnum?> newSelection) {
          // By default there is only a single segment that can be
          // selected at one time, so its value is always the first
          // item in the selected set.
          type.value = newSelection.first;
          onChangedF(type.value);
        },
      ),
    );
  }
}
