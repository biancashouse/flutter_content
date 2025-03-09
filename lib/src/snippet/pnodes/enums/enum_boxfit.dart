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
      width:240, height:60,
  decoration: BoxDecoration(color: Colors.purple[700]), child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: _toMenuItem(),
  ),);

  Widget _toMenuItem() => switch (this) {
        BoxFitEnum.fill => fco.coloredText('$name - fill box by distorting aspect ratio', color: Colors.white),
        BoxFitEnum.contain => fco.coloredText(maxLines:2,'$name - as large as possible while still contained entirely within the box', color: Colors.white),
        BoxFitEnum.cover => fco.coloredText(maxLines:2,'$name - as small as possible while still covering the entire box', color: Colors.white),
        BoxFitEnum.fitWidth => fco.coloredText(maxLines:3,
            '$name - takes full width of parent; child overflows inside the parent vertically, maintaining the aspect ratio',
            color: Colors.white),
        BoxFitEnum.fitHeight => fco.coloredText(maxLines:3,
            '$name - takes full height of parent; child overflows inside the parent horizontally, maintaining the aspect ratio',
            color: Colors.white),
        BoxFitEnum.none => fco.coloredText(maxLines:3,
            '$name - aligns the child inside the parent (centred by default) and discards any portion that lies outside the bounds of the parent',
            color: Colors.white),
        BoxFitEnum.scaleDown => fco.coloredText(maxLines:3,
            '$name - Similar to none, scales down to fit inside the parent. Same as "contain": shrinks the child to fit inside the parent',
            color: Colors.white),
      };

  static Widget propertyNodeContents({
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
        calloutButtonSize: const Size(280, 80),
        calloutSize: Size(300, values.length * 80),
        scName: scName,
      );

  static BoxFitEnum? of(int? index) => index != null ? BoxFitEnum.values.elementAtOrNull(index) : null;
}
