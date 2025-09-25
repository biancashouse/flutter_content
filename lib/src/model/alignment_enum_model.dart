import 'dart:collection';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

import '../snippet/pnodes/editors/property_button_enum.dart';

part 'alignment_enum_model.mapper.dart';

@MappableEnum()
enum AlignmentEnum   {
  topLeft(Alignment.topLeft),
  topCenter(Alignment.topCenter),
  topRight(Alignment.topRight),
  centerLeft(Alignment.centerLeft),
  center(Alignment.center),
  centerRight(Alignment.centerRight),
  bottomLeft(Alignment.bottomLeft),
  bottomCenter(Alignment.bottomCenter),
  bottomRight(Alignment.bottomRight);

  const AlignmentEnum(this.alignment);

  final Alignment alignment;

  AlignmentEnum get oppositeAlignment => switch (this) {
    AlignmentEnum.topLeft => AlignmentEnum.bottomRight,
    AlignmentEnum.topCenter => AlignmentEnum.bottomCenter,
    AlignmentEnum.topRight => AlignmentEnum.bottomLeft,
    AlignmentEnum.centerLeft => AlignmentEnum.centerRight,
    AlignmentEnum.center => AlignmentEnum.center,
    AlignmentEnum.centerRight => AlignmentEnum.centerLeft,
    AlignmentEnum.bottomLeft => AlignmentEnum.topRight,
    AlignmentEnum.bottomCenter => AlignmentEnum.topCenter,
    AlignmentEnum.bottomRight => AlignmentEnum.topLeft,
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
        menuItems: AlignmentEnum.values.map((e) => _toAlignmentMenuItem(e)).toList(),
        originalEnumIndex: enumValueIndex,
        onChangeF: (newIndex) {
          onChangedF?.call(newIndex);
        },
        wrap: true,
        calloutButtonSize: const Size(120, 40),
        calloutSize: const Size(240, 200),
        scName: scName,
      );

  static Widget _toAlignmentMenuItem(AlignmentEnum ae) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      const SizedBox(
        width: 8,
      ),
      Container(
        width: 30,
        height: 30,
        alignment: ae.alignment,
        decoration: const ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
        ),
        child: Container(
          width: 10,
          height: 10,
          color: Colors.white,
        ),
      ),
      const SizedBox(
        width: 8,
      ),
    ],
  );

  // used by example app
  static final List<GravityEntry> entries = UnmodifiableListView<GravityEntry>(
    values.map<GravityEntry>(
          (AlignmentEnum gravity) => GravityEntry(
        value: gravity,
        label: gravity.name,
        // enabled: color.label != 'Grey',
        // style: MenuItemButton.styleFrom(foregroundColor: color.color),
      ),
    ),
  );

  String toSource() => 'Alignment.$name';

  static AlignmentEnum? of(int? index) => index != null ? AlignmentEnum.values.elementAtOrNull(index) : null;

  static AlignmentEnum fromAlignment(Alignment al) => switch (al) {
    Alignment.topLeft => AlignmentEnum.topLeft,
    Alignment.topCenter => AlignmentEnum.topCenter,
    Alignment.topRight => AlignmentEnum.topRight,
    Alignment.centerLeft => AlignmentEnum.centerLeft,
    Alignment.center => AlignmentEnum.center,
    Alignment.centerRight => AlignmentEnum.centerRight,
    Alignment.bottomLeft => AlignmentEnum.bottomLeft,
    Alignment.bottomCenter => AlignmentEnum.bottomCenter,
    Alignment.bottomRight => AlignmentEnum.bottomRight,
    Alignment() => AlignmentEnum.center,
  };
}

typedef GravityEntry = DropdownMenuEntry<AlignmentEnum>;

