import 'package:flutter/material.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_axis.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AxisEditor extends HookWidget {
  final AxisEnum? originalValue;
  final ValueChanged<AxisEnum?> onChangedF;

  const AxisEditor({required this.originalValue, required this.onChangedF, super.key});

  @override
  Widget build(BuildContext context) {
    final axis = useState<AxisEnum?>(originalValue);
    return SegmentedButton<AxisEnum?>(
      style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.white),
        foregroundColor: WidgetStatePropertyAll(Colors.purple),
        side: WidgetStatePropertyAll(BorderSide(color: Colors.purple)),
        visualDensity: VisualDensity(horizontal: -4, vertical: -4),
      ),
      segments: const <ButtonSegment<AxisEnum?>>[
        ButtonSegment<AxisEnum?>(
          value: AxisEnum.horizontal,
          label: Text('horizontal'),
        ),
        ButtonSegment<AxisEnum?>(
          value: AxisEnum.vertical,
          label: Text('vertical'),
        ),
      ],
      selected: <AxisEnum?>{axis.value},
      onSelectionChanged: (Set<AxisEnum?> newSelection) {
        // By default there is only a single segment that can be
        // selected at one time, so its value is always the first
        // item in the selected set.
        axis.value = newSelection.first;
        onChangedF(axis.value);
      },
    );
  }
}
