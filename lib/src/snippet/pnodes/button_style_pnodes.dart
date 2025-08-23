import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/border_side_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/color_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/decimal_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_button_search_button_styles.dart';
import 'package:flutter_content/src/snippet/pnodes/enum_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_outlined_border.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/button_style_properties.dart';
import 'package:flutter_content/src/snippet/pnodes/text_style_pnodes.dart';
import 'package:flutter_content/src/text_styles/style_name_editor.dart';

class ButtonStylePNode /*Group*/ extends PNode /*Group*/ {
  ButtonStyleProperties buttonStyleGroup;
  final ButtonStylePropertiesChangeCallback onGroupChange;

  ButtonStylePNode /*Group*/ ({
    super.name = 'buttonStyle',
    required this.buttonStyleGroup,
    required this.onGroupChange,
    required super.snode,
    super.children = const [],
  }) {
    super.children = [
      ButtonStyleSearchPNode(
          snode: super.snode,
          name: 'ButtonStyle search',
          buttonStyleProps: buttonStyleGroup,
          onAnyButtonStylePropertyChangeF: (newProps) {
            // textStyleProperties = newProps;
            // fco.forceRefresh();
            onGroupChange.call(newProps, false);
          }),
      PNode /*Group*/ (
        snode: super.snode,
        name: 'colour',
        children: [
          ColorPNode(
            snode: super.snode,
            name: 'f/g color',
            color: buttonStyleGroup.fgColor,
            onColorChange: (newValue) {
              buttonStyleGroup.fgColor = newValue;
              onGroupChange.call(buttonStyleGroup, true);
            },
          ),
          ColorPNode(
            snode: super.snode,
            name: 'b/g color',
            color: buttonStyleGroup.bgColor,
            onColorChange: (newValue) {
              buttonStyleGroup.bgColor = newValue;
              onGroupChange.call(buttonStyleGroup, true);
            },
          ),
        ],
      ),
      // buttonStyle's textStyle: text color comes from button foregroundColor
      TextStyleWithoutColorPNode(
        name: 'textStyle',
        textStyleProperties: buttonStyleGroup.tsPropGroup,
        onGroupChange: (newTSGroup, refreshPTree) {
          buttonStyleGroup.tsPropGroup = newTSGroup.clone();
          onGroupChange.call(buttonStyleGroup, true);
        },
        snode: super.snode,
      ),
      // TextStylePropertyGroup(
      //   snode: super.snode,
      //   name: 'textStyle',
      //   textStyleProperties: buttonStyleGroup?.textStyle,
      //   onGroupChange: (newValue) {
      //     buttonStyleGroup ??= ButtonStyleGroup();
      //     buttonStyleGroup!.textStyle = newValue;
      //     onGroupChange.call(buttonStyleGroup!);
      //   },
      // ),
      EnumPNode<OutlinedBorderEnum?>(
        snode: super.snode,
        name: 'shape',
        valueIndex: buttonStyleGroup.shape?.index,
        onIndexChange: (newValue) {
          buttonStyleGroup.shape = OutlinedBorderEnum.of(newValue);
          onGroupChange.call(buttonStyleGroup, true);
        },
      ),
      BorderSidePNode /*Group*/ (
        snode: super.snode,
        name: 'side',
        borderSideGroup: buttonStyleGroup.side,
        onGroupChange: (newValue) {
          buttonStyleGroup.side = newValue;
          onGroupChange.call(buttonStyleGroup, true);
        },
      ),
      DecimalPNode(
        snode: super.snode,
        name: 'elevation',
        decimalValue: buttonStyleGroup.elevation,
        onDoubleChange: (newValue) {
          buttonStyleGroup.elevation = newValue;
          onGroupChange.call(buttonStyleGroup, true);
        },
        calloutButtonSize: const Size(80, 20),
      ),
      DecimalPNode(
        snode: super.snode,
        name: 'padding',
        decimalValue: buttonStyleGroup.padding,
        onDoubleChange: (newValue) {
          buttonStyleGroup.padding = newValue;
          onGroupChange.call(buttonStyleGroup, true);
        },
        calloutButtonSize: const Size(80, 20),
      ),
      DecimalPNode(
        snode: super.snode,
        name: 'radius',
        decimalValue: buttonStyleGroup.radius,
        onDoubleChange: (newValue) {
          buttonStyleGroup.radius = newValue;
          onGroupChange.call(buttonStyleGroup, true);
        },
        calloutButtonSize: const Size(80, 20),
      ),
      PNode /*Group*/ (
        snode: super.snode,
        name: 'size',
        children: [
          DecimalPNode(
            snode: super.snode,
            name: 'minWidth',
            decimalValue: buttonStyleGroup.minW,
            onDoubleChange: (newValue) {
              buttonStyleGroup.minW = newValue;
              onGroupChange.call(buttonStyleGroup, true);
            },
            calloutButtonSize: const Size(120, 20),
          ),
          DecimalPNode(
            snode: super.snode,
            name: 'minHeight',
            decimalValue: buttonStyleGroup.minH,
            onDoubleChange: (newValue) {
              buttonStyleGroup.minH = newValue;
              onGroupChange.call(buttonStyleGroup, true);
            },
            calloutButtonSize: const Size(120, 20),
          ),
          DecimalPNode(
            snode: super.snode,
            name: 'maxWidth',
            decimalValue: buttonStyleGroup.maxW,
            onDoubleChange: (newValue) {
              buttonStyleGroup.maxW = newValue;
              onGroupChange.call(buttonStyleGroup, true);
            },
            calloutButtonSize: const Size(120, 20),
          ),
          DecimalPNode(
            snode: super.snode,
            name: 'maxHeight',
            decimalValue: buttonStyleGroup.maxH,
            onDoubleChange: (newValue) {
              buttonStyleGroup.maxH = newValue;
              onGroupChange.call(buttonStyleGroup, true);
            },
            calloutButtonSize: const Size(120, 20),
          ),
          DecimalPNode(
            snode: super.snode,
            name: 'fixedWidth',
            decimalValue: buttonStyleGroup.fixedW,
            onDoubleChange: (newValue) {
              buttonStyleGroup.fixedW = newValue;
              onGroupChange.call(buttonStyleGroup, true);
            },
            calloutButtonSize: const Size(130, 20),
          ),
          DecimalPNode(
            snode: super.snode,
            name: 'fixedHeight',
            decimalValue: buttonStyleGroup.fixedH,
            onDoubleChange: (newValue) {
              buttonStyleGroup.fixedH = newValue;
              onGroupChange.call(buttonStyleGroup, true);
            },
            calloutButtonSize: const Size(130, 20),
          ),
        ],
      ),
      ButtonStyleSavePNode(
        snode: super.snode,
        name: 'save ButtonStyle',
        onGroupChange: onGroupChange,
      )
    ];
  }

  @override
  String propertyLabel() {
    var buttonStyleName = fco.findButtonStyleName(fco.appInfo, buttonStyleGroup);
    return buttonStyleName != null ? '$name: $buttonStyleName' : name;
  }
}

class ButtonStyleSearchPNode extends PNode {
  ButtonStyleProperties buttonStyleProps;
  final ValueChanged<ButtonStyleProperties> onAnyButtonStylePropertyChangeF;
  final Size calloutButtonSize;

  ButtonStyleSearchPNode /*Group*/ ({
    required this.buttonStyleProps,
    required this.onAnyButtonStylePropertyChangeF,
    required super.snode,
    required super.name,
    super.tooltip,
    this.calloutButtonSize = const Size(48, 30),
  });

  @override
  void revertToOriginalValue() {
    onAnyButtonStylePropertyChangeF.call(buttonStyleProps =
        ButtonStyleProperties(tsPropGroup: TextStyleProperties()));
  }

  @override
  Widget toPropertyNodeContents(BuildContext context) {
    ScrollControllerName? scName = EditablePage.maybeScrollControllerName(context);
    return PropertyButtonButtonStyleNameSearch(
      cId: name,
      tooltip: tooltip,
      buttonStyle: buttonStyleProps,
      onHoveredF: (ButtonStyleProperties newProps) {
        if (newProps != buttonStyleProps) {
          onAnyButtonStylePropertyChangeF.call(buttonStyleProps = newProps);
        }
      },
      onChangeF: (ButtonStyleProperties newProps) {
        snode.forcePropertyTreeRefresh(context);
        onAnyButtonStylePropertyChangeF.call(buttonStyleProps = newProps);
      },
      calloutButtonSize: calloutButtonSize,
      scName: scName,
    );
  }
}

class ButtonStyleSavePNode extends PNode {
  final ButtonStylePropertiesChangeCallback onGroupChange;

  ButtonStyleSavePNode /*Group*/ ({
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
          final bsName = teC.text;
          if (bsName.isNotEmpty) {
            ButtonStyleProperties? bsGroup = snode.buttonStyleProperties();
            if (bsGroup != null) {
              fco.namedButtonStyles[bsName] = bsGroup.clone();
              await fco.modelRepo.saveAppInfo();
              fco.showToastBlueOnYellow(
                cId: 'saved-button-style',
                msg: "Button Style '$bsName' saved",
                removeAfterMs: 3500,
              );
              onGroupChange.call(bsGroup, false);
            }
          }
        },
        label: 'Save style as',
        tooltip: 'save button style as...',
      ),
    );
  }
}
