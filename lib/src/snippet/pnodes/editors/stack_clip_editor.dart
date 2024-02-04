import 'package:flutter/material.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_clip.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class StackClipEditor extends HookWidget {
  final ClipEnum? originalValue;
  final Function(ClipEnum?) onChangedF;

  const StackClipEditor({required this.originalValue, required this.onChangedF, super.key});

  @override
  Widget build(BuildContext context) {
    final clip = useState<ClipEnum?>(originalValue);

    return SizedBox(
      width: 300,
      child: SegmentedButton<ClipEnum?>(
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.white),
          foregroundColor: MaterialStatePropertyAll(Colors.purple),
          side: MaterialStatePropertyAll(BorderSide(color: Colors.purple)),
          visualDensity: VisualDensity(horizontal: -4, vertical: -4),
        ),
        segments: const <ButtonSegment<ClipEnum?>>[
          ButtonSegment<ClipEnum?>(
            value: ClipEnum.hardEdge,
            label: Offstage(),
          ),
          ButtonSegment<ClipEnum?>(
            value: ClipEnum.antiAlias,
            label: Offstage(),
          ),
          ButtonSegment<ClipEnum?>(
            value: ClipEnum.antiAliasWithSaveLayer,
            label: Offstage(),
          ),
        ],
        selected: <ClipEnum?>{clip.value},
        onSelectionChanged: (Set<ClipEnum?> newSelection) {
          // By default there is only a single segment that can be
          // selected at one time, so its value is always the first
          // item in the selected set.
          clip.value = newSelection.first;
          onChangedF(clip.value);
        },
      ),
    );
  }
}
