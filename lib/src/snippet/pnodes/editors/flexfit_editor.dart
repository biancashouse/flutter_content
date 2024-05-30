import 'package:flutter/material.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_flex_fit.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FlexFitEditor extends HookWidget {
  final FlexFitEnum? originalValue;
  final Function(FlexFitEnum?) onChangedF;

  const FlexFitEditor({required this.originalValue, required this.onChangedF, super.key});

  @override
  Widget build(BuildContext context) {
    final fit = useState<FlexFitEnum?>(originalValue);
    return SegmentedButton<FlexFitEnum?>(
      style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.white),
        foregroundColor: WidgetStatePropertyAll(Colors.purple),
        side: WidgetStatePropertyAll(BorderSide(color: Colors.purple)),
        visualDensity: VisualDensity(horizontal: -4, vertical: -4),
      ),
      segments: const <ButtonSegment<FlexFitEnum?>>[
        ButtonSegment<FlexFitEnum?>(
          value: FlexFitEnum.tight,
          label: Text('tight'),
        ),
        ButtonSegment<FlexFitEnum?>(
          value: FlexFitEnum.loose,
          label: Text('loose'),
        ),
      ],
      selected: <FlexFitEnum?>{fit.value},
      onSelectionChanged: (Set<FlexFitEnum?> newSelection) {
        // By default there is only a single segment that can be
        // selected at one time, so its value is always the first
        // item in the selected set.
        fit.value = newSelection.first;
        onChangedF(fit.value);
      },
    );
  }
}
