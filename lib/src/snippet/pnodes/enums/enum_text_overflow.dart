import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_button_enum.dart';

// const AlignmentEnum(this.flutterValue);
//
// final Alignment flutterValue;

part 'enum_text_overflow.mapper.dart';

@MappableEnum()
enum TextOverflowEnum  {
  /// Clip the overflowing text to fix its container.
  clip(TextOverflow.clip),

  /// Fade the overflowing text to transparent.
  fade(TextOverflow.fade),

  /// Use an ellipsis to indicate that the text has overflowed.
  ellipsis(TextOverflow.ellipsis),

  /// Render overflowing text outside of its container.
  visible(TextOverflow.visible);

  const TextOverflowEnum(this.flutterValue);

  final TextOverflow flutterValue;

  String toSource() => 'TextOverflow.$name';

  static Widget propertyNodeContents({
    int? enumValueIndex,
    required STreeNode snode,
    required String label,
    ValueChanged<int?>? onChangedF,
  }) =>
      PropertyButtonEnum(
        label: label,
        menuItems: values.map((e) => e.toMenuItem()).toList(),
        originalEnumIndex: enumValueIndex,
        onChangeF: (newIndex) {
          onChangedF?.call(newIndex);
          
        },
        wrap: true,
        calloutButtonSize: const Size(110, 30),
        calloutSize: const Size(240, 60),
      );

  // @override
  // TextOverflow toWidget({ThemeData? themeData}) {
  //   return switch (this) {
  //     TextOverflowEnum.clip => TextOverflow.clip,
  //     TextOverflowEnum.fade => TextOverflow.fade,
  //     TextOverflowEnum.ellipsis => TextOverflow.ellipsis,
  //     TextOverflowEnum.visible => TextOverflow.visible,
  //   };
  // }

  Widget toMenuItem() => FContent().coloredText(name, color: Colors.white);

  static TextOverflowEnum? of(int? index) => index != null ? TextOverflowEnum.values.elementAtOrNull(index) : null;
}
