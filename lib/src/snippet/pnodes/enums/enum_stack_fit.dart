import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

part 'enum_stack_fit.mapper.dart';

@MappableEnum()
enum StackFitEnum {
  loose(StackFit.loose),
  expand(StackFit.expand),
  passthrough(StackFit.passthrough);

  const StackFitEnum(this.flutterValue);

  final StackFit flutterValue;

  String toSource() => 'StackFit.$name';

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
            fco.coloredText('fit:', color: Colors.white),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                fco.coloredText('loose', color: Colors.white),
                fco.coloredText('expand', color: Colors.white),
                fco.coloredText('passthrough', color: Colors.white),
              ],
            ),
            StackFitEditor(
              originalValue: StackFitEnum.of(enumValueIndex),
              onChangedF: (StackFitEnum? newValue) {
                onChangedF?.call(newValue?.index);
              },
            ),
          ],
        ),
      );

   Widget toMenuItem() => fco.coloredText(name, color: Colors.white);

  static StackFitEnum? of(int? index) => index != null ? StackFitEnum.values.elementAtOrNull(index) : null;
}

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
          backgroundColor: WidgetStatePropertyAll(Colors.white),
          foregroundColor: WidgetStatePropertyAll(Colors.purple),
          side: WidgetStatePropertyAll(BorderSide(color: Colors.purple)),
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
