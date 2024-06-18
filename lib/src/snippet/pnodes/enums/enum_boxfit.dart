import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_button_enum.dart';

part 'enum_boxfit.mapper.dart';

@MappableEnum()
enum BoxFitEnum {
  fill(BoxFit.fill),
  contain(BoxFit.contain),
  cover(BoxFit.cover),
  fitWidth(BoxFit.fitWidth),
  fitHeight(BoxFit.fitHeight),
  none(BoxFit.none),
  scaleDown(BoxFit.scaleDown);

  const BoxFitEnum(this.flutterValue);

  final BoxFit flutterValue;

  List<Widget> get allItems => values.map((e) => e.toMenuItem()).toList();

  String toSource() => 'BoxFit.$name';

  Widget toMenuItem() => Container(
      width:280, height:60,
  decoration: BoxDecoration(color: Colors.purple[700]), child: _toMenuItem(),);

  Widget _toMenuItem() => switch (this) {
        BoxFitEnum.fill => FContent().coloredText('$name - fill box by distorting aspect ratio', color: Colors.white),
        BoxFitEnum.contain => FContent().coloredText(maxLines:2,'$name - as large as possible while still contained entirely within the box', color: Colors.white),
        BoxFitEnum.cover => FContent().coloredText(maxLines:2,'$name - as small as possible while still covering the entire box', color: Colors.white),
        BoxFitEnum.fitWidth => FContent().coloredText(maxLines:3,
            '$name - takes full width of parent; child overflows inside the parent vertically, maintaining the aspect ratio',
            color: Colors.white),
        BoxFitEnum.fitHeight => FContent().coloredText(maxLines:3,
            '$name - takes full height of parent; child overflows inside the parent horizontally, maintaining the aspect ratio',
            color: Colors.white),
        BoxFitEnum.none => FContent().coloredText(maxLines:3,
            '$name - aligns the child inside the parent (centred by default) and discards any portion that lies outside the bounds of the parent',
            color: Colors.white),
        BoxFitEnum.scaleDown => FContent().coloredText(maxLines:3,
            '$name - Similar to none, scales down to fit inside the parent. Same as "contain": shrinks the child to fit inside the parent',
            color: Colors.white),
      };

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
        calloutButtonSize: const Size(280, 80),
        calloutSize: Size(300, values.length * 80),
      );

  static BoxFitEnum? of(int? index) => index != null ? BoxFitEnum.values.elementAtOrNull(index) : null;
}
