// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_alignment.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_corner.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_decoration.dart';

import '../pnodes/groups/outlined_border_group.dart';
import 'edgeinsets_node_value.dart';

part 'container_node.mapper.dart';

@MappableClass()
class ContainerNode extends SC with ContainerNodeMappable {
  int? fillColor1Value;
  int? fillColor2Value;
  int? fillColor3Value;
  int? fillColor4Value;
  int? fillColor5Value;
  int? fillColor6Value;
  EdgeInsetsValue? margin;
  EdgeInsetsValue? padding;
  double? width;
  double? height;
  AlignmentEnum? alignment;
  DecorationShapeEnum decoration;
  double? borderThickness;
  int? borderColor1Value;
  int? borderColor2Value;
  int? borderColor3Value;
  int? borderColor4Value;
  int? borderColor5Value;
  int? borderColor6Value;
  double? borderRadius;

  // star shape
  int? starPoints;

  // dotted or dashed
  int? dash;
  int? gap;

  // corner badge
  double? badgeWidth;
  double? badgeHeight;
  BadgePositionEnum? badgeCorner;
  String? badgeText;
  OutlinedBorderGroup? outlinedBorderGroup;

  ContainerNode({
    this.fillColor1Value,
    this.fillColor2Value,
    this.fillColor3Value,
    this.fillColor4Value,
    this.fillColor5Value,
    this.fillColor6Value,
    this.margin,
    this.padding,
    this.width,
    this.height,
    this.alignment,
    this.decoration = DecorationShapeEnum.rectangle,
    this.borderThickness,
    this.borderColor1Value,
    this.borderColor2Value,
    this.borderColor3Value,
    this.borderColor4Value,
    this.borderColor5Value,
    this.borderColor6Value,
    this.borderRadius,
    this.starPoints,
    this.dash,
    this.gap,
    this.badgeWidth,
    this.badgeHeight,
    this.badgeCorner,
    this.badgeText,
    this.outlinedBorderGroup,
    super.child,
  });

  @override
  List<PTreeNode> createPropertiesList(BuildContext context) {
    return [
      SizePropertyValueNode(
        snode: this,
        name: 'size',
        widthValue: width,
        heightValue: height,
        onSizeChange: (newValues) => refreshWithUpdate(() {
          if (newValues.$1 != width) {
            width = newValues.$1;
          }
          if (newValues.$2 != height) {
            height = newValues.$2;
          }
        }),
      ),
      PropertyGroup(
        snode: this,
        name: 'margin',
        children: [
          EdgeInsetsPropertyValueNode(
            snode: this,
            name: 'margin',
            eiValue: margin,
            onEIChangedF: (newValue) => refreshWithUpdate(() => margin = newValue),
          ),
        ],
      ),
      PropertyGroup(
        snode: this,
        name: 'padding',
        children: [
          EdgeInsetsPropertyValueNode(
            snode: this,
            name: 'padding',
            eiValue: padding,
            onEIChangedF: (newValue) => refreshWithUpdate(() => padding = newValue),
          ),
        ],
      ),
      EnumPropertyValueNode<AlignmentEnum?>(
        snode: this,
        name: 'alignment',
        valueIndex: alignment?.index,
        onIndexChange: (newValue) => refreshWithUpdate(() => alignment = AlignmentEnum.of(newValue)),
      ),
      PropertyGroup(
        snode: this,
        name: 'decoration',
        children: [
          // SHAPE
          EnumPropertyValueNode<DecorationShapeEnum?>(
            snode: this,
            name: 'decoration',
            valueIndex: decoration.index,
            onIndexChange: (newValue) => refreshWithUpdate(() => decoration = DecorationShapeEnum.of(newValue) ?? DecorationShapeEnum.rectangle),
          ),
          // FILL COLOR(s)
          GradientPropertyValueNode(
            snode: this,
            name: 'fill color(s)',
            color1Value: fillColor1Value,
            color2Value: fillColor2Value,
            color3Value: fillColor3Value,
            color4Value: fillColor4Value,
            color5Value: fillColor5Value,
            color6Value: fillColor6Value,
            onColorChange: (newValue1, newValue2, newValue3, newValue4, newValue5, newValue6) => refreshWithUpdate(() {
              fillColor1Value = newValue1;
              fillColor2Value = newValue2;
              fillColor3Value = newValue3;
              fillColor4Value = newValue4;
              fillColor5Value = newValue5;
              fillColor6Value = newValue6;
            }),
          ),
          // FILL COLOR(s)
          GradientPropertyValueNode(
            snode: this,
            name: 'border color(s)',
            color1Value: borderColor1Value,
            color2Value: borderColor2Value,
            color3Value: borderColor3Value,
            color4Value: borderColor4Value,
            color5Value: borderColor5Value,
            color6Value: borderColor6Value,
            onColorChange: (newValue1, newValue2, newValue3, newValue4, newValue5, newValue6) => refreshWithUpdate(() {
              borderColor1Value = newValue1;
              borderColor2Value = newValue2;
              borderColor3Value = newValue3;
              borderColor4Value = newValue4;
              borderColor5Value = newValue5;
              borderColor6Value = newValue6;
            }),
          ),
          DecimalPropertyValueNode(
            snode: this,
            name: 'thickness',
            decimalValue: borderThickness,
            onDoubleChange: (newValue) => refreshWithUpdate(() => borderThickness = newValue),
            calloutButtonSize: const Size(90, 20),
          ),
          DecimalPropertyValueNode(
            snode: this,
            name: 'radius',
            decimalValue: borderRadius,
            onDoubleChange: (newValue) => refreshWithUpdate(() => borderRadius = newValue),
            calloutButtonSize: const Size(90, 20),
          ),
        ],
      ),
      // PropertyGroup(
      //   snode: this,
      //   name: 'border properties',
      //   children: [
      //     DecimalPropertyValueNode(
      //       snode: this,
      //       name: 'thickness',
      //       decimalValue: borderThickness,
      //       onDoubleChange: (newValue) => refreshWithUpdate(() => borderThickness = newValue),
      //       calloutButtonSize: const Size(90, 30),
      //     ),
      //     ColorPropertyValueNode(
      //       snode: this,
      //       name: 'color',
      //       colorValue: borderColorValue,
      //       onColorIntChange: (newValue) => refreshWithUpdate(() => borderColorValue = newValue),
      //     ),
      //     DecimalPropertyValueNode(
      //       snode: this,
      //       name: 'radius',
      //       decimalValue: borderRadius,
      //       onDoubleChange: (newValue) => refreshWithUpdate(() {
      //         borderRadius = newValue;
      //         if ((borderRadius ?? 0.0) > 0.0 && (borderThickness ?? 0.0) == 0.0) {
      //           borderThickness = 1.0;
      //         }
      //       }),
      //       calloutButtonSize: const Size(70, 30),
      //     ),
      //     OutlinedBorderPropertyGroup(
      //       snode: this,
      //       name: 'OutlinedBorder...',
      //       outlinedGroup: outlinedBorderGroup,
      //       onGroupChange: (newValue) => refreshWithUpdate(() => outlinedBorderGroup = newValue),
      //     ),
      //   ],
      // ),
    ];
  }

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    setParent(parentNode);
    possiblyHighlightSelectedNode();
    try {
      // OutlinedBorder? oBorder;
      // if (outlinedBorderGroup != null) {
      //   oBorder = outlinedBorderGroup?.toOutlinedBorder(
      //     radius: borderRadius,
      //   );
      // }
      if (true || outlinedBorderGroup?.outlinedBorderType != null && outlinedBorderGroup?.side != null) {
        return Container(
          key: createNodeGK(),
          decoration: decoration.toDecoration(
            fillColor1: fillColor1Value != null ? Color(fillColor1Value!) : null,
            fillColor2: fillColor2Value != null ? Color(fillColor2Value!) : null,
            fillColor3: fillColor3Value != null ? Color(fillColor3Value!) : null,
            fillColor4: fillColor4Value != null ? Color(fillColor4Value!) : null,
            fillColor5: fillColor5Value != null ? Color(fillColor5Value!) : null,
            fillColor6: fillColor6Value != null ? Color(fillColor6Value!) : null,
            borderColor1: borderColor1Value != null ? Color(borderColor1Value!) : null,
            borderColor2: borderColor2Value != null ? Color(borderColor2Value!) : null,
            borderColor3: borderColor3Value != null ? Color(borderColor3Value!) : null,
            borderColor4: borderColor4Value != null ? Color(borderColor4Value!) : null,
            borderColor5: borderColor5Value != null ? Color(borderColor5Value!) : null,
            borderColor6: borderColor6Value != null ? Color(borderColor6Value!) : null,
            borderRadius: borderRadius,
            thickness: borderThickness,
            starPoints: starPoints,
          ),
          // decoration: ShapeDecoration(
          //   shape: outlinedBorderGroup!.outlinedBorderType!.toFlutterWidget(nodeSide: outlinedBorderGroup?.side, nodeRadius: borderRadius),
          //   color: fillColor1Value != null ? Color(fillColor1Value!) : null,
          // ),
          padding: padding?.toEdgeInsets(),
          margin: margin?.toEdgeInsets(),
          width: width,
          height: height,
          alignment: alignment?.flutterValue,
          child: child?.toWidget(context, this),
        );
      } else {
        return Container(
          key: createNodeGK(),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: fillColor1Value != null ? Color(fillColor1Value!) : null,
            border: borderThickness != null || borderColor1Value != null
                ? Border.all(width: borderThickness ?? 1.0, color: Color(borderColor1Value ?? Colors.black.value))
                : null,
            borderRadius: BorderRadius.circular(borderRadius ?? 0),
          ),
          padding: padding?.toEdgeInsets(),
          margin: margin?.toEdgeInsets(),
          width: width,
          height: height,
          alignment: alignment?.flutterValue,
          child: child?.toWidget(context, this),
        );
      }
    } catch (e) {
      debugPrint('cannot render $FLUTTER_TYPE!');
    }
    return const Icon(Icons.error, color: Colors.redAccent);
  }

  @override
  String toSource(BuildContext context) => '';

  // {
  //   String paddingEI = (paddingTop && !paddingLeft && paddingBottom && !paddingRight)
  //       ? 'EdgeInsets.symmetric(vertical: $padding)'
  //       : (!paddingTop && paddingLeft && !paddingBottom && paddingRight)
  //           ? 'EdgeInsets.symmetric(horizontal: $padding)'
  //           : (paddingTop && paddingLeft && paddingBottom && paddingRight)
  //               ? 'EdgeInsets.all($padding)'
  //               : '''EdgeInsets.only(
  //     top: ${paddingTop ? padding : 0.0},
  //     left: ${paddingLeft ? padding : 0.0},
  //     bottom: ${paddingBottom ? padding : 0.0},
  //     right: ${paddingRight ? padding : 0.0},
  //   )''';
  //   String marginEI = (marginTop && !marginLeft && marginBottom && !marginRight)
  //       ? 'EdgeInsets.symmetric(vertical: $margin)'
  //       : (!marginTop && marginLeft && !marginBottom && marginRight)
  //           ? 'EdgeInsets.symmetric(horizontal: $margin)'
  //           : (marginTop && marginLeft && marginBottom && marginRight)
  //               ? 'EdgeInsets.all($margin)'
  //               : '''EdgeInsets.only(
  //     top: ${marginTop ? margin : 0.0},
  //     left: ${marginLeft ? margin : 0.0},
  //     bottom: ${marginBottom ? margin : 0.0},
  //     right: ${marginRight ? margin : 0.0},
  //   )''';
  //   String border = borderThickness != null || borderColorValue != null
  //       ? '''Border.all(
  //         width: ${borderThickness ?? 1.0},
  //         color: Color(${borderColorValue ?? Colors.black.value})
  //   )'''
  //       : 'null';
  //   String containerColor = colorValue != null ? 'Color(${colorValue!})' : 'null';
  //
  //   return '''Container(
  //     decoration: BoxDecoration(
  //       color: $containerColor,
  //       border: $border,
  //       borderRadius: BorderRadius.circular(${borderRadius ?? 0}),
  //     ),
  //     padding: ${paddingEI},
  //     margin: ${marginEI},
  //     width: ${width},
  //     height: ${height},
  //     alignment: ${alignment?.toSource()},
  //     child: ${child?.toSource(context)},
  //   )''';
  // }

  // @override
  // List<Widget> nodePropertyEditors(BuildContext context, {bool allowButtonCallouts = false}) => [
  //       // Row(
  //       //   mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       //   children: [
  //       //     NodePropertyButtonEdgeInsetsEditor(
  //       //       label: 'margin',
  //       //       originalValue: margin,
  //       //       originalValueTop: marginTop,
  //       //       originalValueLeft: marginLeft,
  //       //       originalValueBottom: marginBottom,
  //       //       originalValueRight: marginRight,
  //       //       calloutSize: const Size(200, 160),
  //       //       onChangedF: (
  //       //         newMarginValue,
  //       //         top,
  //       //         left,
  //       //         bottom,
  //       //         right,
  //       //       ) {
  //       //         margin = newMarginValue;
  //       //         marginTop = top;
  //       //         marginLeft = left;
  //       //         marginBottom = bottom;
  //       //         marginRight = right;
  //       //         bloc.add(const const CAPIEvent.forceRefresh());
  //       //       },
  //       //     ),
  //       //     NodePropertyButtonEdgeInsetsEditor(
  //       //       label: 'padding',
  //       //       originalValue: padding,
  //       //       originalValueTop: paddingTop,
  //       //       originalValueLeft: paddingLeft,
  //       //       originalValueBottom: paddingBottom,
  //       //       originalValueRight: paddingRight,
  //       //       calloutSize: const Size(200, 160),
  //       //       onChangedF: (
  //       //         newPaddingValue,
  //       //         top,
  //       //         left,
  //       //         bottom,
  //       //         right,
  //       //       ) {
  //       //         padding = newPaddingValue;
  //       //         paddingTop = top;
  //       //         paddingLeft = left;
  //       //         paddingBottom = bottom;
  //       //         paddingRight = right;
  //       //         bloc.add(const const CAPIEvent.forceRefresh());
  //       //       },
  //       //     )
  //       //   ],
  //       // ),
  //       // // NodePropertyButtonString(
  //       // //   label: 'padding',
  //       // //   originalValue: padding?.toString(),
  //       // //   calloutSize: const Size(140, 80),
  //       // //   onChangeF: (newPadding) {
  //       // //     padding = double.tryParse(newPadding) ?? 0.0;
  //       // //     bloc.add(const const CAPIEvent.forceRefresh());
  //       // //   },
  //       // // ),
  //       // const SizedBox(height: 10),
  //       // Row(
  //       //   mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       //   children: [
  //       //     SizedBox(
  //       //       width: 80,
  //       //       height: 40,
  //       //       child: DecimalEditor(
  //       //         label: 'width',
  //       //         originalS: width?.toString() ?? '',
  //       //         onChangedF: (newWidth) {
  //       //           width = double.tryParse(newWidth);
  //       //           bloc.add(const const CAPIEvent.forceRefresh());
  //       //         },
  //       //       ),
  //       //     ),
  //       //     SizedBox(
  //       //       width: 80,
  //       //       height: 40,
  //       //       child: DecimalEditor(
  //       //         label: 'height',
  //       //         originalS: height?.toString() ?? '',
  //       //         onChangedF: (newHeight) {
  //       //           height = double.tryParse(newHeight);
  //       //           bloc.add(const const CAPIEvent.forceRefresh());
  //       //         },
  //       //       ),
  //       //     ),
  //       //   ],
  //       // ),
  //       // // NodePropertyButtonString(
  //       // //   label: 'width',
  //       // //   originalValue: width?.toString(),
  //       // //   calloutSize: const Size(140, 80),
  //       // //   onChangeF: (newWidth) {
  //       // //     width = double.tryParse(newWidth);
  //       // //     bloc.add(const const CAPIEvent.forceRefresh());
  //       // //   },
  //       // // ),
  //       // // NodePropertyButtonString(
  //       // //   label: 'height',
  //       // //   originalValue: height?.toString(),
  //       // //   calloutSize: const Size(140, 80),
  //       // //   onChangeF: (newHeight) {
  //       // //     height = double.tryParse(newHeight);
  //       // //     bloc.add(const const CAPIEvent.forceRefresh());
  //       // //   },
  //       // // ),
  //       // Row(
  //       //   mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       //   children: [
  //       //     NodePropertyButtonRadioMenu(
  //       //       label: 'alignment',
  //       //       menuItems: AlignmentEnum.values.map((e) => e.toMenuItem()).toList(),
  //       //       originalOption: alignment?.index,
  //       //       onChangeF: (newOption) {
  //       //         alignment = AlignmentEnum.values[newOption];
  //       //         bloc.add(const const CAPIEvent.forceRefresh());
  //       //       },
  //       //       calloutSize: AlignmentEnum.calloutSize,
  //       //     ),
  //       //     NodePropertyButtonColor(
  //       //       label: "color",
  //       //       originalColor: colorValue != null ? Color(colorValue!) : null,
  //       //       onChangeF: (newColor) {
  //       //         colorValue = newColor?.value;
  //       //         bloc.add(const const CAPIEvent.forceRefresh());
  //       //       },
  //       //     ),
  //       //   ],
  //       // ),
  //       // const SizedBox(height: 10),
  //       // SizedBox(
  //       //   width: 300,
  //       //   // height: 40,
  //       //   child: InputDecorator(
  //       //     decoration: InputDecoration(
  //       //       labelText: 'border',
  //       //       labelStyle: Useful.enclosureLabelTextStyle,
  //       //       border: const OutlineInputBorder(),
  //       //       // isDense: false,
  //       //     ),
  //       //     child: Row(
  //       //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       //       children: [
  //       //         SizedBox(
  //       //           width: 90,
  //       //           height: 40,
  //       //           child: DecimalEditor(
  //       //             label: 'thickness',
  //       //             originalS: borderThickness?.toString() ?? '',
  //       //             onChangedF: (newValue) {
  //       //               borderThickness = double.tryParse(newValue);
  //       //               bloc.add(const const CAPIEvent.forceRefresh());
  //       //             },
  //       //           ),
  //       //         ),
  //       //         SizedBox(
  //       //           width: 70,
  //       //           height: 40,
  //       //           child: DecimalEditor(
  //       //             label: 'radius',
  //       //             originalS: borderRadius?.toString() ?? '',
  //       //             onChangedF: (newValue) {
  //       //               borderRadius = double.tryParse(newValue);
  //       //               bloc.add(const const CAPIEvent.forceRefresh());
  //       //             },
  //       //           ),
  //       //         ),
  //       //         Container(
  //       //           color: Colors.purple,
  //       //           padding: const EdgeInsets.all(5.0),
  //       //           child: NodePropertyButtonColor(
  //       //             label: "color",
  //       //             originalColor: borderColorValue != null ? Color(borderColorValue!) : null,
  //       //             onChangeF: (newColor) {
  //       //               borderColorValue = newColor?.value;
  //       //               bloc.add(const const CAPIEvent.forceRefresh());
  //       //             },
  //       //           ),
  //       //         ),
  //       //       ],
  //       //     ),
  //       //   ),
  //       // ),
  //     ];

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "Container";
}
