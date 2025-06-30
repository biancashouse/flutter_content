import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/bool_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/decimal_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/edge_insets_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_button_search_container_styles.dart';
import 'package:flutter_content/src/snippet/pnodes/enum_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/mappable_enum_decoration.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';
import 'package:flutter_content/src/snippet/pnodes/gradient_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/container_style_properties.dart';
import 'package:flutter_content/src/snippet/pnodes/size_pnode.dart';
import 'package:flutter_content/src/text_styles/style_name_editor.dart';

class ContainerStylePNode /*Group*/ extends PNode /*Group*/ {
  final ContainerStyleProperties containerStyleGroup;
  final ContainerStylePropertiesChangeCallback onGroupChange;

  ContainerStylePNode /*Group*/ ({
    super.name = 'container style',
    required this.containerStyleGroup,
    required this.onGroupChange,
    required super.snode,
    super.children = const [],
  }) {
    String paddingLabel = containerStyleGroup.padding == null
        ? 'padding'
        : 'padding (${containerStyleGroup.padding!.top},${containerStyleGroup.padding!.left},${containerStyleGroup.padding!.bottom},${containerStyleGroup.padding!.right})';
    String marginLabel = containerStyleGroup.margin == null
        ? 'margin'
        : 'margin (${containerStyleGroup.margin!.top},${containerStyleGroup.margin!.left},${containerStyleGroup.margin!.bottom},${containerStyleGroup.margin!.right})';

    super.children = [
      ContainerStyleSearchPNode(
          snode: super.snode,
          name: 'Container style search',
          containerStyleProps: containerStyleGroup,
          onAnyContainerStylePropertyChangeF: (newProps) {
            // containerStyleGroup.fillColors = newProps.fillColors;
            // containerStyleGroup.borderColors = newProps.borderColors;
            onGroupChange.call(newProps, true);
            return;
            // textStyleProperties = newProps;
            // fco.forceRefresh();
            containerStyleGroup
              ..fillColors = newProps.fillColors
              ..margin = newProps.margin
              ..padding = newProps.padding
              ..width = newProps.width
              ..height = newProps.height
              ..alignment = newProps.alignment
              ..decoration = newProps.decoration
              ..borderThickness = newProps.borderThickness
              ..borderColors = newProps.borderColors
              ..borderRadius = newProps.borderRadius
              ..starPoints = newProps.starPoints
              ..dash = newProps.dash
              ..gap = newProps.gap
              ..badgeCorner = newProps.badgeCorner
              ..badgeHeight = newProps.badgeHeight
              ..badgeText = newProps.badgeText
              ..badgeWidth = newProps.badgeWidth
              ..outlinedBorderGroup = newProps.outlinedBorderGroup;
            onGroupChange.call(containerStyleGroup, true);
          }),
      if (containerStyleGroup.width != null ||
          containerStyleGroup.height != null)
        FYIPNode(
            label: "about constraints...",
            msg:
                "If you find the width or\nheight being ignored,\ntap this button",
            webLink: 'https://docs.flutter.dev/ui/layout/constraints',
            snode: snode,
            name: 'fyi'),
      SizePNode(
          snode: super.snode,
          name: 'size',
          widthValue: containerStyleGroup.width,
          heightValue: containerStyleGroup.height,
          onSizeChange: (newValues) {
            if (newValues.$1 != containerStyleGroup.width) {
              containerStyleGroup.width = newValues.$1;
            }
            if (newValues.$2 != containerStyleGroup.height) {
              containerStyleGroup.height = newValues.$2;
            }
            onGroupChange.call(containerStyleGroup, true);
          }),
      PNode /*Group*/ (
        snode: super.snode,
        name: marginLabel,
        children: [
          EdgeInsetsPNode(
              snode: super.snode,
              name: 'margin',
              eiValue: containerStyleGroup.margin,
              onEIChangedF: (newValue) {
                containerStyleGroup.margin = newValue;
                onGroupChange.call(containerStyleGroup, true);
              }),
        ],
      ),
      PNode /*Group*/ (
        snode: super.snode,
        name: paddingLabel,
        children: [
          EdgeInsetsPNode(
              snode: super.snode,
              name: 'padding',
              eiValue: containerStyleGroup.padding,
              onEIChangedF: (newValue) {
                containerStyleGroup.padding = newValue;
                onGroupChange.call(containerStyleGroup, true);
              }),
        ],
      ),
      PNode /*Group*/ (
        snode: super.snode,
        name: 'decoration',
        children: [
          // SHAPE
          // FILL COLOR(s)
          GradientPNode(
              snode: super.snode,
              name: 'fill color(s)',
              colors: containerStyleGroup.fillColors,
              onColorChange: (newValues) {
                containerStyleGroup.fillColors = newValues;
                onGroupChange.call(containerStyleGroup, true);
              }),
          if (containerStyleGroup.fillColors?.isAGradient() ?? false)
            BoolPNode(
                snode: super.snode,
                name: 'radial Gradient ?',
                boolValue: containerStyleGroup.radialGradient,
                onBoolChange: (newValue) {
                  containerStyleGroup.radialGradient = newValue;
                  onGroupChange.call(containerStyleGroup, true);
                }), // BORDER COLOR(s)
          GradientPNode(
              snode: super.snode,
              name: 'border color(s)',
              colors: containerStyleGroup.borderColors,
              onColorChange: (newValues) {
                containerStyleGroup.borderColors = newValues;
                onGroupChange.call(containerStyleGroup, true);
              }),
          EnumPNode<MappableDecorationShapeEnum?>(
              snode: super.snode,
              name: 'shape',
              valueIndex: containerStyleGroup.decoration.index,
              onIndexChange: (newValue) {
                containerStyleGroup.decoration =
                    MappableDecorationShapeEnum.of(newValue) ??
                        MappableDecorationShapeEnum.rectangle;
                onGroupChange.call(containerStyleGroup, true);
              }),
          DecimalPNode(
            snode: super.snode,
            name: 'thickness',
            decimalValue: containerStyleGroup.borderThickness,
            onDoubleChange: (newValue) {
              containerStyleGroup.borderThickness = newValue;
              onGroupChange.call(containerStyleGroup, true);
            },
            calloutButtonSize: const Size(90, 20),
          ),
          DecimalPNode(
            snode: super.snode,
            name: 'radius',
            decimalValue: containerStyleGroup.borderRadius,
            onDoubleChange: (newValue) {
              containerStyleGroup.borderRadius = newValue;
              onGroupChange.call(containerStyleGroup, true);
            },
            calloutButtonSize: const Size(90, 20),
          ),
        ],
      ),
      EnumPNode<AlignmentEnum?>(
        snode: super.snode,
        name: 'alignment',
        valueIndex: containerStyleGroup.alignment?.index,
        onIndexChange: (newValue) {
          containerStyleGroup.alignment = AlignmentEnum.of(newValue);
          onGroupChange.call(containerStyleGroup, true);
        },
      ),
      ContainerStyleSavePNode(
        snode: super.snode,
        name: 'save Container style',
        onGroupChange: onGroupChange,
      )
    ];
  }

  @override
  String propertyLabel() {
    var containerStyleName = fco.findContainerStyleName(containerStyleGroup);
    return containerStyleName != null ? '$name: $containerStyleName' : name;
  }
}

class ContainerStyleSearchPNode extends PNode {
  final ContainerStyleProperties containerStyleProps;
  final ValueChanged<ContainerStyleProperties>
      onAnyContainerStylePropertyChangeF;
  final Size calloutButtonSize;

  ContainerStyleSearchPNode /*Group*/ ({
    required this.containerStyleProps,
    required this.onAnyContainerStylePropertyChangeF,
    required super.snode,
    required super.name,
    super.tooltip,
    this.calloutButtonSize = const Size(48, 30),
  });

  @override
  void revertToOriginalValue() {
    onAnyContainerStylePropertyChangeF
        .call(ContainerStyleProperties());
  }

  @override
  Widget toPropertyNodeContents(BuildContext context) {
    ScrollControllerName? scName = EditablePage.maybeScrollControllerName(context);
    return PropertyButtonContainerStyleNameSearch(
      cId: name,
      tooltip: tooltip,
      containerStyle: containerStyleProps,
      onHoveredF: (ContainerStyleProperties newProps) {
        // if (newProps != containerStyleProps) {
          onAnyContainerStylePropertyChangeF.call(newProps);
          snode.forcePropertyTreeRefresh(context);
        // }
      },
      onChangeF: (ContainerStyleProperties newProps) {
        onAnyContainerStylePropertyChangeF.call(newProps);
        snode.forcePropertyTreeRefresh(context);
      },
      calloutButtonSize: calloutButtonSize,
      scName: scName,
    );
  }
}

class ContainerStyleSavePNode extends PNode {
  final ContainerStylePropertiesChangeCallback onGroupChange;

  ContainerStyleSavePNode /*Group*/ ({
    required super.name,
    required super.snode,
    required this.onGroupChange,
  });

  @override
  Widget toPropertyNodeContents(BuildContext context) {
    TextEditingController teC = TextEditingController();
    return Container(
      color: Colors.white,
      width: 170,
      height: 50,
      // padding: EdgeInsets.only(top: 10),
      child: StyleNameEditor(
        teC: teC,
        focusNode: FocusNode(),
        onChangeF: (s) {},
        onEditingCompleteF: () async {
          final csName = teC.text;
          if (csName.isNotEmpty) {
            ContainerStyleProperties? csGroup =
                snode.containerStyleProperties();
            if (csGroup != null) {
              fco.namedContainerStyles[csName] = csGroup.clone();
              await fco.modelRepo.saveAppInfo();
              fco.showToastBlueOnYellow(
                cId: 'saved-container-style',
                msg: "Container Style '$csName' saved",
                removeAfterMs: 3500,
              );
              onGroupChange.call(csGroup, false);
            }
          }
        },
        label: 'Save style as',
        tooltip: 'save Container style as...',
      ),
    );
  }
}
