import 'package:flutter/material.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_stack_fit.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class StackFitEditor extends HookWidget {
  final StackFitEnum? originalValue;
  final Function(StackFitEnum?) onChangedF;

  const StackFitEditor({required this.originalValue, required this.onChangedF, super.key});

  @override
  Widget build(BuildContext context) {
    final fit = useState<StackFitEnum?>(originalValue ?? StackFitEnum.loose);
    return SizedBox(
      width: 280,
      child: SegmentedButton<StackFitEnum?>(
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.white),
          foregroundColor: MaterialStatePropertyAll(Colors.purple),
          side: MaterialStatePropertyAll(BorderSide(color: Colors.purple)),
          visualDensity: VisualDensity(horizontal: -4, vertical: -4),
        ),
        segments: const <ButtonSegment<StackFitEnum?>>[
          ButtonSegment<StackFitEnum?>(
            value: StackFitEnum.loose,
            label: Offstage(),
          ),
          ButtonSegment<StackFitEnum?>(
            value: StackFitEnum.expand,
            label: Offstage(),
          ),
          ButtonSegment<StackFitEnum?>(
            value: StackFitEnum.passthrough,
            label: Offstage(),
          ),
        ],
        selected: <StackFitEnum?>{fit.value},
        onSelectionChanged: (Set<StackFitEnum?> newSelection) {
          // By default there is only a single segment that can be
          // selected at one time, so its value is always the first
          // item in the selected set.
          fit.value = newSelection.first;
          onChangedF(fit.value);
        },
      ),
    );
  }
}
