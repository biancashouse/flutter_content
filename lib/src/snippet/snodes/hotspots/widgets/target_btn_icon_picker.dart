import 'package:flutter/material.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_flex_fit.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'enum_target_btn_icon.dart';

class TargetBtnIconPicker extends HookWidget {
  final TargetButtonIconEnum? originalValue;
  final Function(TargetButtonIconEnum?) onChangedF;

  const TargetBtnIconPicker({required this.originalValue, required this.onChangedF, super.key});

  @override
  Widget build(BuildContext context) {
    final btnIcon = useState<TargetButtonIconEnum?>(originalValue);
    return SegmentedButton<TargetButtonIconEnum?>(
      style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.white),
        foregroundColor: WidgetStatePropertyAll(Colors.purple),
        side: WidgetStatePropertyAll(BorderSide(color: Colors.purple)),
        visualDensity: VisualDensity(horizontal: -4, vertical: -4),
      ),
      segments: const <ButtonSegment<TargetButtonIconEnum?>>[
        ButtonSegment<TargetButtonIconEnum?>(
          value: TargetButtonIconEnum.question,
          label: Icon(Icons.question_mark),
        ),
        ButtonSegment<TargetButtonIconEnum?>(
          value: TargetButtonIconEnum.pin,
          label: Icon(Icons.pin),
        ),
        ButtonSegment<TargetButtonIconEnum?>(
          value: TargetButtonIconEnum.phone,
          label: Icon(Icons.phone),
        ),
        ButtonSegment<TargetButtonIconEnum?>(
          value: TargetButtonIconEnum.contact,
          label: Icon(Icons.email),
        ),
      ],
      selected: <TargetButtonIconEnum?>{btnIcon.value},
      onSelectionChanged: (Set<TargetButtonIconEnum?> newSelection) {
        // By default there is only a single segment that can be
        // selected at one time, so its value is always the first
        // item in the selected set.
        btnIcon.value = newSelection.first;
        onChangedF(btnIcon.value);
      },
    );
  }
}
