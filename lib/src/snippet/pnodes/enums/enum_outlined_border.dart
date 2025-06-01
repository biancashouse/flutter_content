// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_callouts/flutter_callouts.dart';
// import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_button_enum.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/border_side_properties.dart';

import '../../../../flutter_content.dart' show fco;
import '../../snode.dart';

part 'enum_outlined_border.mapper.dart';

@MappableEnum()
enum OutlinedBorderEnum {
  beveledRectangleBorder(BeveledRectangleBorder()),
  circleBorder(CircleBorder()),
  continuousRectangleBorder(ContinuousRectangleBorder()),
  linearBorder(LinearBorder()),
  roundedRectangleBorder(RoundedRectangleBorder()),
  stadiumBorder(StadiumBorder()),
  starBorder(StarBorder());

  const OutlinedBorderEnum(this.flutterValue);

  final OutlinedBorder flutterValue;

  String toSource() => name;

  static Widget propertyNodeContents({
    int? enumValueIndex,
    required SNode snode,
    required String label,
    ValueChanged<int?>? onChangedF,
    required ScrollControllerName? scName,
  }) =>
      PropertyButtonEnum(
        label: enumValueIndex != null ? '' : label,
        menuItems: values.map((e) => e.toMenuItem()).toList(),
        originalEnumIndex: enumValueIndex,
        onChangeF: (newIndex) {
          // FCO.capiBloc.selectedNode?.hidePropertiesWhileDragging = false;
          onChangedF?.call(newIndex);
        },
        wrap: true,
        calloutButtonSize: const Size(200, 30),
        calloutSize: Size(256, values.length * 50),
        scName: scName,
      );

  OutlinedBorder toFlutterWidget({BorderSideProperties? nodeSide, double? nodeRadius}) {
    BorderSide side = (nodeSide != null) ? nodeSide.toBorderSide() : BorderSide.none;
    BorderRadius radius = (nodeRadius != null) ? BorderRadius.all(Radius.circular(nodeRadius)) : BorderRadius.zero;
    return switch (this) {
      OutlinedBorderEnum.beveledRectangleBorder => BeveledRectangleBorder(side: side, borderRadius: radius),
      OutlinedBorderEnum.circleBorder => CircleBorder(side: side),
      OutlinedBorderEnum.continuousRectangleBorder => ContinuousRectangleBorder(side: side, borderRadius: radius),
      OutlinedBorderEnum.linearBorder => LinearBorder(side: side),
      OutlinedBorderEnum.roundedRectangleBorder => RoundedRectangleBorder(side: side, borderRadius: radius),
      OutlinedBorderEnum.stadiumBorder => StadiumBorder(side: side),
      OutlinedBorderEnum.starBorder => StarBorder(side: side),
    };
  }

  Widget toMenuItem() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: fco.coloredText(
          name,
          color: Colors.white,
          fontSize: 14,
          fontFamily: 'RobotoMono',
          fontWeight: FontWeight.bold,
        ),
      );

  static OutlinedBorderEnum? of(int? index) => index != null ? OutlinedBorderEnum.values.elementAtOrNull(index) : null;
}
