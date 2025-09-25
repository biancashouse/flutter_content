import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/bool_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/decimal_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/edge_insets_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_button_search_container_styles.dart';
import 'package:flutter_content/src/snippet/pnodes/enum_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_decoration_shape.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';
import 'package:flutter_content/src/snippet/pnodes/gradient_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/size_pnode.dart';
import 'package:flutter_content/src/text_styles/style_name_editor.dart';

class ContainerStylePNode /*Group*/ extends PNode /*Group*/ {
  final ContainerStyleProperties containerStyleProperties;
  final ContainerStylePropertiesChangeCallback onGroupChange;

  ContainerStylePNode /*Group*/ ({
    super.name = 'container style',
    required this.containerStyleProperties,
    required this.onGroupChange,
    required super.snode,
    super.children = const [],
  }) {
    String paddingLabel = containerStyleProperties.padding == null
        ? 'padding'
        : 'padding (${containerStyleProperties.padding!.top},${containerStyleProperties.padding!.left},${containerStyleProperties.padding!.bottom},${containerStyleProperties.padding!.right})';
    String marginLabel = containerStyleProperties.margin == null
        ? 'margin'
        : 'margin (${containerStyleProperties.margin!.top},${containerStyleProperties.margin!.left},${containerStyleProperties.margin!.bottom},${containerStyleProperties.margin!.right})';

    super.children = [
      ContainerStyleSearchPNode(
          snode: super.snode,
          name: 'Container style search',
          containerStyleProps: containerStyleProperties,
          onAnyContainerStylePropertyChangeF: (newProps) {
            // containerStyleGroup.fillColors = newProps.fillColors;
            // containerStyleGroup.borderColors = newProps.borderColors;
            onGroupChange.call(newProps, true);
            return;
          }),
      if (containerStyleProperties.width != null ||
          containerStyleProperties.height != null)
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
          widthValue: containerStyleProperties.width,
          heightValue: containerStyleProperties.height,
          onSizeChange: (newValues) {
            if (newValues.$1 != containerStyleProperties.width) {
              containerStyleProperties.width = newValues.$1;
            }
            if (newValues.$2 != containerStyleProperties.height) {
              containerStyleProperties.height = newValues.$2;
            }
            onGroupChange.call(containerStyleProperties, true);
          }),
      PNode /*Group*/ (
        snode: super.snode,
        name: marginLabel,
        children: [
          EdgeInsetsPNode(
              snode: super.snode,
              name: 'margin',
              eiValue: containerStyleProperties.margin,
              onEIChangedF: (newValue) {
                containerStyleProperties.margin = newValue;
                onGroupChange.call(containerStyleProperties, true);
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
              eiValue: containerStyleProperties.padding,
              onEIChangedF: (newValue) {
                containerStyleProperties.padding = newValue;
                onGroupChange.call(containerStyleProperties, true);
              }),
        ],
      ),
      PNode /*Group*/ (
        snode: super.snode,
        name: 'decoration',
        children: [
          // SHAPE
          // FILL COLOR(s)
          ColorOrGradientPNode(
              snode: super.snode,
              name: 'fill color(s)',
              colors: containerStyleProperties.fillColors,
              onColorChange: (newValues) {
                containerStyleProperties.fillColors = newValues;
                onGroupChange.call(containerStyleProperties, true);
              }),
          if (containerStyleProperties.fillColors?.isAGradient() ?? false)
            BoolPNode(
                snode: super.snode,
                name: 'radial Gradient ?',
                boolValue: containerStyleProperties.radialGradient,
                onBoolChange: (newValue) {
                  containerStyleProperties.radialGradient = newValue;
                  onGroupChange.call(containerStyleProperties, true);
                }), // BORDER COLOR(s)
          ColorOrGradientPNode(
              snode: super.snode,
              name: 'border color(s)',
              colors: containerStyleProperties.borderColors,
              onColorChange: (newValues) {
                containerStyleProperties.borderColors = newValues;
                onGroupChange.call(containerStyleProperties, true);
              }),
          EnumPNode<DecorationShapeEnum?>(
              snode: super.snode,
              name: 'shape',
              valueIndex: containerStyleProperties.decorationShapeEnum?.index,
              onIndexChange: (newValue) {
                containerStyleProperties.decorationShapeEnum =
                    DecorationShapeEnum.of(newValue) ??
                        DecorationShapeEnum.rectangle;
                onGroupChange.call(containerStyleProperties, true);
              }),
          DecimalPNode(
            snode: super.snode,
            name: 'thickness',
            decimalValue: containerStyleProperties.borderThickness,
            onDoubleChange: (newValue) {
              containerStyleProperties.borderThickness = newValue;
              onGroupChange.call(containerStyleProperties, true);
            },
            calloutButtonSize: const Size(90, 20),
          ),
          DecimalPNode(
            snode: super.snode,
            name: 'radius',
            decimalValue: containerStyleProperties.borderRadius,
            onDoubleChange: (newValue) {
              containerStyleProperties.borderRadius = newValue;
              onGroupChange.call(containerStyleProperties, true);
            },
            calloutButtonSize: const Size(90, 20),
          ),
        ],
      ),
      EnumPNode<AlignmentEnum?>(
        snode: super.snode,
        name: 'alignment',
        valueIndex: containerStyleProperties.alignment?.index,
        onIndexChange: (newValue) {
          containerStyleProperties.alignment = AlignmentEnum.of(newValue);
          onGroupChange.call(containerStyleProperties, true);
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
    var containerStyleName = fco.findContainerStyleName(fco.appInfo, containerStyleProperties);
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
              fco.showToast(
                textColor: Colors.blue,
                bgColor: Colors.yellow,
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
