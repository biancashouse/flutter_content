import 'package:flutter/material.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_text_direction.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TextDirectionEditor extends HookWidget {
  final TextDirectionEnum? originalValue;
  final Function(TextDirectionEnum?) onChangedF;

  const TextDirectionEditor({required this.originalValue, required this.onChangedF, super.key});

  @override
  Widget build(BuildContext context) {
    final td = useState<TextDirectionEnum?>(originalValue);
    return SegmentedButton<TextDirectionEnum?>(
      style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.white),
        foregroundColor: WidgetStatePropertyAll(Colors.purple),
        side: WidgetStatePropertyAll(BorderSide(color: Colors.purple)),
        visualDensity: VisualDensity(horizontal: -4, vertical: -4),
      ),
      segments: const <ButtonSegment<TextDirectionEnum?>>[
        ButtonSegment<TextDirectionEnum?>(
          value: TextDirectionEnum.ltr,
          label: Text('ltr'),
        ),
        ButtonSegment<TextDirectionEnum?>(
          value: TextDirectionEnum.rtl,
          label: Text('rtl'),
        ),
      ],
      selected: <TextDirectionEnum?>{td.value},
      onSelectionChanged: (Set<TextDirectionEnum?> newSelection) {
        // By default there is only a single segment that can be
        // selected at one time, so its value is always the first
        // item in the selected set.
        td.value = newSelection.first;
        onChangedF(td.value);
      },
    );
  }
}
