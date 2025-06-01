import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_button_enum.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_boxfit.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_clip.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_cross_axis_alignment.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_flex_fit.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_font_style.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_font_weight.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_main_axis_alignment.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_main_axis_size.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_outlined_border.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_stack_fit.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_stepper_type.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_text_align.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_text_direction.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_text_overflow.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/mappable_enum_decoration.dart';

class EnumPNode<T> extends PNode {
  int? valueIndex;
  final ValueChanged<int?> onIndexChange;

  EnumPNode({
    required this.valueIndex,
    required this.onIndexChange,
    required super.name,
    required super.snode,
  });

  @override
  void revertToOriginalValue() {
    onIndexChange(valueIndex = null);
  }

  @override
  Widget toPropertyNodeContents(BuildContext context) {
    ScrollControllerName? scName = EditablePage.scName(context);
    // just show name for null property value
    // if (value == null) return FCO.coloredText(name, color:Colors.white);
    // SnippetTemplate -------------
    if (_sameType<T, SnippetTemplateEnum?>()) {
      return SnippetTemplateEnum.propertyNodeContents(
        snode: snode,
        label: name,
        enumValueIndex: valueIndex,
        onChangedF: (newValueIndex) =>
            onIndexChange(valueIndex = newValueIndex),
        scName: scName,
      );
    }
    // BoxFit -------------
    if (_sameType<T, BoxFitEnum?>()) {
      return BoxFitEnum.propertyNodeContents(
        snode: snode,
        label: name,
        enumValueIndex: valueIndex,
        onChangedF: (newValueIndex) =>
            onIndexChange(valueIndex = newValueIndex),
        scName: scName,
      );
    }
    // Alignment -------------
    if (_sameType<T, AlignmentEnum?>()) {
      return propertyNodeContentsAlignment(
        snode: snode,
        label: name,
        enumValueIndex: valueIndex,
        onChangedF: (newValueIndex) =>
            onIndexChange(valueIndex = newValueIndex),
        scName: scName,
      );
    }
    // Alignment -------------
    if (_sameType<T, MappableDecorationShapeEnum?>()) {
      return MappableDecorationShapeEnum.propertyNodeContents(
        snode: snode,
        label: name,
        enumValueIndex: valueIndex,
        onChangedF: (newValueIndex) =>
            onIndexChange(valueIndex = newValueIndex),
        scName: scName,
      );
    }
    // ArrowType -------------
    if (_sameType<T, ArrowTypeEnum?>()) {
      return propertyNodeContentsArrowType(
        snode: snode,
        label: name,
        enumValueIndex: valueIndex,
        onChangedF: (newValueIndex) =>
            onIndexChange(valueIndex = newValueIndex),
        scName: scName,
      );
    }
    // Axis -------------
    if (_sameType<T, AxisEnum?>()) {
      return AxisEnum.propertyNodeContents(
        snode: snode,
        label: name,
        enumValueIndex: valueIndex,
        onChangedF: (newValueIndex) =>
            onIndexChange(valueIndex = newValueIndex),
      );
    }
    // Clip -------------
    if (_sameType<T, ClipEnum?>()) {
      return ClipEnum.propertyNodeContents(
          snode: snode,
          label: name,
          enumValueIndex: valueIndex,
          onChangedF: (newValueIndex) =>
              onIndexChange(valueIndex = newValueIndex));
    }
    // MainAxisAlignment -------------
    if (_sameType<T, MainAxisAlignmentEnum?>()) {
      return MainAxisAlignmentEnum.propertyNodeContents(
        snode: snode,
        label: name,
        enumValueIndex: valueIndex,
        onChangedF: (newValueIndex) =>
            onIndexChange(valueIndex = newValueIndex),
        scName: scName,
      );
    }
    // MainAxisSize -------------
    if (_sameType<T, MainAxisSizeEnum?>()) {
      return MainAxisSizeEnum.propertyNodeContents(
          snode: snode,
          label: name,
          enumValueIndex: valueIndex,
          onChangedF: (newValueIndex) =>
              onIndexChange(valueIndex = newValueIndex));
    }
    // CrossAxisAlignment -------------
    if (_sameType<T, CrossAxisAlignmentEnum?>()) {
      ScrollControllerName? scName = EditablePage.scName(context);
      return CrossAxisAlignmentEnum.propertyNodeContents(
        snode: snode,
        label: name,
        enumValueIndex: valueIndex,
        onChangedF: (newValueIndex) =>
            onIndexChange(valueIndex = newValueIndex),
        scName: scName,
      );
    }
    // FlexFit -------------
    if (_sameType<T, FlexFitEnum?>()) {
      return FlexFitEnum.propertyNodeContents(
          snode: snode,
          label: name,
          enumValueIndex: valueIndex,
          onChangedF: (newValueIndex) =>
              onIndexChange(valueIndex = newValueIndex));
    }
    // TextDirection -------------
    if (_sameType<T, TextDirectionEnum?>()) {
      return TextDirectionEnum.propertyNodeContents(
          snode: snode,
          label: name,
          enumValueIndex: valueIndex,
          onChangedF: (newValueIndex) =>
              onIndexChange(valueIndex = newValueIndex));
    }
    // FontStyle -------------
    if (_sameType<T, FontStyleEnum?>()) {
      return FontStyleEnum.propertyNodeContents(
        snode: snode,
        label: name,
        enumValueIndex: valueIndex,
        onChangedF: (newValueIndex) =>
            onIndexChange(valueIndex = newValueIndex),
        scName: scName,
      );
    }
    // FontWeight -------------
    if (_sameType<T, FontWeightEnum?>()) {
      return FontWeightEnum.propertyNodeContents(
        snode: snode,
        label: name,
        enumValueIndex: valueIndex,
        onChangedF: (newValueIndex) =>
            onIndexChange(valueIndex = newValueIndex),
        scName: scName,
      );
    }
    // Material3 Text Size -------------
    if (_sameType<T, Material3TextSizeEnum?>()) {
      return Material3TextSizeEnum.propertyNodeContents(
        snode: snode,
        label: name,
        themeData: Theme.of(context),
        enumValueIndex: valueIndex,
        onChangedF: (newValueIndex) =>
            onIndexChange(valueIndex = newValueIndex),
        scName: scName,
      );
    }
    // OutlinedBorder -------------
    if (_sameType<T, OutlinedBorderEnum?>()) {
      return OutlinedBorderEnum.propertyNodeContents(
        snode: snode,
        label: name,
        enumValueIndex: valueIndex,
        onChangedF: (newValueIndex) =>
            onIndexChange(valueIndex = newValueIndex),
        scName: scName,
      );
    }
    // StackFit -------------
    if (_sameType<T, StackFitEnum?>()) {
      return StackFitEnum.propertyNodeContents(
          snode: snode,
          label: name,
          enumValueIndex: valueIndex,
          onChangedF: (newValueIndex) =>
              onIndexChange(valueIndex = newValueIndex));
    }
    // StepperType -------------
    if (_sameType<T, StepperTypeEnum?>()) {
      return StepperTypeEnum.propertyNodeContents(
          snode: snode,
          label: name,
          enumValueIndex: valueIndex,
          onChangedF: (newValueIndex) =>
              onIndexChange(valueIndex = newValueIndex));
    }
    // TextAlign -------------
    if (_sameType<T, TextAlignEnum?>()) {
      return TextAlignEnum.propertyNodeContents(
        snode: snode,
        label: name,
        enumValueIndex: valueIndex,
        onChangedF: (newValueIndex) =>
            onIndexChange(valueIndex = newValueIndex),
        scName: scName,
      );
    }
    // TextDirection -------------
    if (_sameType<T, TextDirectionEnum?>()) {
      return TextDirectionEnum.propertyNodeContents(
          snode: snode,
          label: name,
          enumValueIndex: valueIndex,
          onChangedF: (newValueIndex) =>
              onIndexChange(valueIndex = newValueIndex));
    }
    // TextOverflow -------------
    if (_sameType<T, TextOverflowEnum?>()) {
      return TextOverflowEnum.propertyNodeContents(
        snode: snode,
        label: name,
        enumValueIndex: valueIndex,
        onChangedF: (newValueIndex) =>
            onIndexChange(valueIndex = newValueIndex),
        scName: scName,
      );
    }
    // T property not implemented yet
    return Error(
        key: GlobalKey(),
        T.runtimeType.toString(),
        color: Colors.red,
        size: 32,
        errorMsg: 'property not implemented yet');
  }
}

Widget propertyNodeContentsAlignment({
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

  Widget _toAlignmentMenuItem(AlignmentEnum ae) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            width: 8,
          ),
          Container(
            width: 30,
            height: 30,
            alignment: ae.flutterValue,
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

  Widget propertyNodeContentsArrowType({
    int? enumValueIndex,
    required SNode snode,
    required String label,
    ValueChanged<int?>? onChangedF,
    required ScrollControllerName? scName,
  }) =>
      PropertyButtonEnum(
        label: label,
        menuItems: ArrowTypeEnum.values.map((e) => _toArrowTypeMenuItem(e.name)).toList(),
        originalEnumIndex: enumValueIndex,
        onChangeF: (newIndex) {
          onChangedF?.call(newIndex);
        },
        wrap: true,
        calloutButtonSize: const Size(120, 80),
        calloutSize: Size(260, ArrowTypeEnum.values.length * 50),
        scName: scName,
      );

  Widget _toArrowTypeMenuItem(name) => fco.coloredText(name, color: Colors.white);

bool _sameType<T1, T2>() => T1 == T2;
