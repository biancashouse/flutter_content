// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_alignment.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_corner.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/mappable_enum_decoration.dart';
import 'package:flutter_content/src/snippet/snodes/upto6color_values.dart';

import '../pnodes/groups/outlined_border_group.dart';

part 'container_node.mapper.dart';

@MappableClass()
class ContainerNode extends SC with ContainerNodeMappable {
  UpTo6ColorValues? fillColorValues;
  EdgeInsetsValue? margin;
  EdgeInsetsValue? padding;
  double? width;
  double? height;
  AlignmentEnum? alignment;
  MappableDecorationShapeEnum decoration;
  double? borderThickness;
  UpTo6ColorValues? borderColorValues;
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
    this.fillColorValues,
    this.margin,
    this.padding,
    this.width,
    this.height,
    this.alignment,
    this.decoration = MappableDecorationShapeEnum.rectangle,
    this.borderThickness,
    this.borderColorValues,
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
  List<PTreeNode> properties(BuildContext context) {
    String paddingLabel = padding == null
        ? 'padding'
        : 'padding (${padding!.top},${padding!.left},${padding!.bottom},${padding!.right})';
    String marginLabel = margin == null
        ? 'margin'
        : 'margin (${margin!.top},${margin!.left},${margin!.bottom},${margin!.right})';

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
          fco.dismissTopFeature();
        }),
      ),
      PropertyGroup(
        snode: this,
        name: marginLabel,
        children: [
          EdgeInsetsPropertyValueNode(
            snode: this,
            name: 'margin',
            eiValue: margin,
            onEIChangedF: (newValue) =>
                refreshWithUpdate(() => margin = newValue),
          ),
        ],
      ),
      PropertyGroup(
        snode: this,
        name: paddingLabel,
        children: [
          EdgeInsetsPropertyValueNode(
            snode: this,
            name: 'padding',
            eiValue: padding,
            onEIChangedF: (newValue) =>
                refreshWithUpdate(() => padding = newValue),
          ),
        ],
      ),
      PropertyGroup(
        snode: this,
        name: 'decoration',
        children: [
          // SHAPE
          // FILL COLOR(s)
          GradientPropertyValueNode(
            snode: this,
            name: 'fill color(s)',
            colorValues: fillColorValues,
            onColorChange: (newValues) => refreshWithUpdate(() {
              fillColorValues = newValues;
              // var oes = fco.OEs;
              // for (var oe in oes) {
              //   fco.logi(oe.calloutConfig.feature);
              // }
              // fco.hide('easy-color-picker');
              // fco.hideOP('easy-color-picker');
            }),
          ),
          // FILL COLOR(s)
          GradientPropertyValueNode(
            snode: this,
            name: 'border color(s)',
            colorValues: borderColorValues,
            onColorChange: (newValues) => refreshWithUpdate(() {
              borderColorValues = newValues;
              // var oes = fco.OEs;
              // fco.hide('easy-color-picker');
              // fco.hideOP('easy-color-picker');
            }),
          ),
          EnumPropertyValueNode<MappableDecorationShapeEnum?>(
            snode: this,
            name: 'shape',
            valueIndex: decoration.index,
            onIndexChange: (newValue) => refreshWithUpdate(() => decoration =
                MappableDecorationShapeEnum.of(newValue) ??
                    MappableDecorationShapeEnum.rectangle),
          ),
          DecimalPropertyValueNode(
            snode: this,
            name: 'thickness',
            decimalValue: borderThickness,
            onDoubleChange: (newValue) =>
                refreshWithUpdate(() => borderThickness = newValue),
            calloutButtonSize: const Size(90, 20),
          ),
          DecimalPropertyValueNode(
            snode: this,
            name: 'radius',
            decimalValue: borderRadius,
            onDoubleChange: (newValue) =>
                refreshWithUpdate(() => borderRadius = newValue),
            calloutButtonSize: const Size(90, 20),
          ),
        ],
      ),
      EnumPropertyValueNode<AlignmentEnum?>(
        snode: this,
        name: 'alignment',
        valueIndex: alignment?.index,
        onIndexChange: (newValue) => refreshWithUpdate(
          () {
            alignment = AlignmentEnum.of(newValue);
          },
        ),
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
      return Container(
        key: createNodeGK(),
        decoration: decoration.toDecoration(
          fillColorValues: fillColorValues,
          borderColorValues: borderColorValues,
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
    } catch (e) {
      return Error(key: createNodeGK(), FLUTTER_TYPE, color: Colors.red, size: 32, errorMsg: e.toString());
    }
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
  //       //       labelStyle: FCO.enclosureLabelTextStyle,
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
