import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_alignment.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_arrow_type.dart';
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
      return AlignmentEnum.propertyNodeContents(
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
      return ArrowTypeEnum.propertyNodeContents(
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

bool _sameType<T1, T2>() => T1 == T2;
