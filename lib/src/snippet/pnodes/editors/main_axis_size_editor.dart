import 'package:flutter/material.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_main_axis_size.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MainAxisSizeEditor extends HookWidget {
  final MainAxisSizeEnum? originalValue;
  final ValueChanged<MainAxisSizeEnum?> onChangedF;

  const MainAxisSizeEditor({required this.originalValue, required this.onChangedF, super.key});

  @override
  Widget build(BuildContext context) {
    final mas = useState<MainAxisSizeEnum?>(originalValue);
    return SegmentedButton<MainAxisSizeEnum?>(
      style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.white),
        foregroundColor: WidgetStatePropertyAll(Colors.purpleAccent),
        side: WidgetStatePropertyAll(BorderSide(color: Colors.purpleAccent)),
        visualDensity: VisualDensity(horizontal: -4, vertical: -4),
      ),
      segments: const <ButtonSegment<MainAxisSizeEnum?>>[
        ButtonSegment<MainAxisSizeEnum?>(
          value: MainAxisSizeEnum.min,
          label: Text('min'),
        ),
        ButtonSegment<MainAxisSizeEnum?>(
          value: MainAxisSizeEnum.max,
          label: Text('max'),
        ),
      ],
      selected: <MainAxisSizeEnum?>{mas.value},
      onSelectionChanged: (Set<MainAxisSizeEnum?> newSelection) {
        // By default there is only a single segment that can be
        // selected at one time, so its value is always the first
        // item in the selected set.
        mas.value = newSelection.first;
        onChangedF(mas.value);
      },
    );
  }
}
