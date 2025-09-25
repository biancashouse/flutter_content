import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_button_enum.dart';

// const AlignmentEnumModel(this.flutterValue);
//
// final Alignment flutterValue;

part 'enum_text_align.mapper.dart';

@MappableEnum()
enum TextAlignEnum   {
  left(TextAlign.left),
  right(TextAlign.right),
  center(TextAlign.center),
  justify(TextAlign.justify),
  start(TextAlign.start),
  end(TextAlign.end);

  const TextAlignEnum(this.flutterValue);

  final TextAlign? flutterValue;

  
  String toSource() => 'TextAlign.$name';

  static 
  Widget propertyNodeContents({
    int? enumValueIndex,
    required SNode snode,
    required String label,
    ValueChanged<int?>? onChangedF,
    required ScrollControllerName? scName,
  }) =>
      PropertyButtonEnum(
        label: label,
        menuItems: values.map((e) => e.toMenuItem()).toList(),
        originalEnumIndex: enumValueIndex,
        onChangeF: (newIndex) {
          onChangedF?.call(newIndex);
          
        },
        wrap: true,
        calloutButtonSize: const Size(90, 30),
        calloutSize: const Size(280, 80),
        scName: scName,
      );

  // @override
  // TextAlign? toWidget({ThemeData? themeData}) =>
  //     switch (this) {
  //       TextAlignEnum.left => TextAlign.left,
  //       TextAlignEnum.right => TextAlign.right,
  //       TextAlignEnum.center => TextAlign.center,
  //       TextAlignEnum.justify => TextAlign.justify,
  //       TextAlignEnum.start => TextAlign.start,
  //       TextAlignEnum.end => TextAlign.end,
  //     };

  Widget _toIcon() {
    return switch (this) {
      TextAlignEnum.left => fco.whiteIcon(Icons.format_align_left),
      TextAlignEnum.start => fco.whiteIcon(Icons.format_align_left),
      TextAlignEnum.center => fco.whiteIcon(Icons.format_align_center),
      TextAlignEnum.right => fco.whiteIcon(Icons.format_align_right),
      TextAlignEnum.end => fco.whiteIcon(Icons.format_align_right),
      TextAlignEnum.justify => fco.whiteIcon(Icons.format_align_justify),
    };
  }

  Widget toMenuItem() => _toIcon();

  static TextAlignEnum? of(int? index) => index != null ? TextAlignEnum.values.elementAtOrNull(index) : null;
}
