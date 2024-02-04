import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/text_direction_editor.dart';

// const AlignmentEnum(this.flutterValue);
//
// final Alignment flutterValue;

part 'enum_text_direction.mapper.dart';

@MappableEnum()
enum TextDirectionEnum   {
  rtl(TextDirection.rtl),
  ltr(TextDirection.ltr);

  const TextDirectionEnum(this.flutterValue);

  final TextDirection flutterValue;

  
  String toSource() => 'TextDirection.$name';

  // @override
  // TextDirection toWidget({ThemeData? themeData}) {
  //   return switch (this) {
  //     TextDirectionEnum.rtl => TextDirection.rtl,
  //     TextDirectionEnum.ltr => TextDirection.ltr,
  //   };
  // }

  static
  Widget propertyNodeContents({
    int? enumValueIndex,
    required STreeNode snode,
    required String label,
    ValueChanged<int?>? onChangedF,
  }) =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextDirectionEditor(
          originalValue: enumValueIndex != null ? TextDirectionEnum.of(enumValueIndex) : null,
          onChangedF: (TextDirectionEnum? newValue) {onChangedF?.call(newValue?.index);},
        ),
      );

  Widget toMenuItem() => Useful.coloredText(name, color: Colors.white);

  static TextDirectionEnum? of(int? index) => index != null ? TextDirectionEnum.values.elementAtOrNull(index) : null;

}
