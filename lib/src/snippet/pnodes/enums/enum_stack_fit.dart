import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/stackfit_editor.dart';

// const AlignmentEnum(this.flutterValue);
//
// final Alignment flutterValue;

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
            Useful.coloredText('fit:', color: Colors.white),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Useful.coloredText('loose', color: Colors.white),
                Useful.coloredText('expand', color: Colors.white),
                Useful.coloredText('passthrough', color: Colors.white),
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

   Widget toMenuItem() => Useful.coloredText(name, color: Colors.white);

  static StackFitEnum? of(int? index) => index != null ? StackFitEnum.values.elementAtOrNull(index) : null;
}
