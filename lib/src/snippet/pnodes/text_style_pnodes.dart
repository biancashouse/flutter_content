import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/color_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/decimal_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_button_search_text_styles.dart';
import 'package:flutter_content/src/snippet/pnodes/enum_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_font_style.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_font_weight.dart';
import 'package:flutter_content/src/snippet/pnodes/font_family_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/fyi_pnodes.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/text_style_properties.dart';
import 'package:flutter_content/src/text_styles/style_name_editor.dart';

class TextStyleWithoutColorPNode /*Group*/ extends PNode /*Group*/ {
  final TextStyleProperties textStyleProperties;
  final TextStylePropertiesChangeCallback onGroupChange;

  TextStyleWithoutColorPNode /*Group*/ ({
    required super.name,
    required this.textStyleProperties,
    required this.onGroupChange,
    required super.snode,
    super.children = const [],
  }) {
    super.children = [
      TextStyleSearchPNode(
          snode: super.snode,
          name: 'TextStyle search',
          textStyleProps: textStyleProperties,
          onAnyTextStylePropertyChangeF: (newProps) {
            // textStyleProperties = newProps;
            // fco.forceRefresh();
            onGroupChange.call(newProps, false);
          }),
      if (snode is ButtonNode)
        FYIPNode(
            label: "about button text colour...",
            msg: "Button's f/g color defines\nthe button's text color",
            snode: snode,
            name: 'fyi'),
      if (snode is TabBarNode)
        FYIPNode(
            label: "about TabBar button text colour...",
            msg:
                "TabBar's selected and unselected\ncolors define the text color",
            snode: snode,
            name: 'fyi'),
      FontFamilyPNode(
        snode: super.snode,
        name: 'fontFamily',
        fontFamily: textStyleProperties.fontFamily,
        onFontFamilyChange: (newValue) {
          textStyleProperties.fontFamily = newValue;
          fco.forceRefresh();
          onGroupChange.call(textStyleProperties, true);
        },
      ),
      DecimalPNode(
        snode: super.snode,
        name: 'fontSize',
        decimalValue: textStyleProperties.fontSize,
        onDoubleChange: (newValue) {
          textStyleProperties.fontSize = newValue;
          onGroupChange.call(textStyleProperties, true);
        },
        calloutButtonSize: const Size(96, 30),
      ),
      EnumPNode<Material3TextSizeEnum?>(
        snode: super.snode,
        name: 'M3 textSize',
        valueIndex: textStyleProperties.fontSizeName?.index,
        onIndexChange: (newValue) {
          textStyleProperties.fontSizeName = Material3TextSizeEnum.of(newValue);
          onGroupChange.call(textStyleProperties, true);
        },
      ),
      EnumPNode<FontStyleEnum?>(
        snode: super.snode,
        name: 'fontStyle',
        valueIndex: textStyleProperties.fontStyle?.index,
        onIndexChange: (newValue) {
          textStyleProperties.fontStyle = FontStyleEnum.of(newValue);
          onGroupChange.call(textStyleProperties, true);
        },
      ),
      EnumPNode<FontWeightEnum?>(
        snode: super.snode,
        name: 'fontWeight',
        valueIndex: textStyleProperties.fontWeight?.index,
        onIndexChange: (newValue) {
          textStyleProperties.fontWeight = FontWeightEnum.of(newValue);
          onGroupChange.call(textStyleProperties, true);
        },
      ),
      DecimalPNode(
        snode: super.snode,
        name: 'lineHeight',
        decimalValue: textStyleProperties.lineHeight,
        onDoubleChange: (newValue) {
          textStyleProperties.lineHeight = newValue;
          onGroupChange.call(textStyleProperties, true);
        },
        calloutButtonSize: const Size(120, 30),
      ),
      DecimalPNode(
        snode: super.snode,
        name: 'letterSpacing',
        decimalValue: textStyleProperties.letterSpacing,
        onDoubleChange: (newValue) {
          textStyleProperties.letterSpacing = newValue;
          onGroupChange.call(textStyleProperties, true);
        },
        calloutButtonSize: const Size(140, 30),
      ),
      TextStyleSavePNode(
        snode: super.snode,
        name: 'save TextStyle',
        onGroupChange: onGroupChange,
      ),
    ];
  }

  @override
  String propertyLabel() {
    var textStyleName = fco.findTextStyleName(textStyleProperties);
    return textStyleName != null ? '$name: $textStyleName' : name;
  }
}

class TextStylePNode /*Group*/ extends TextStyleWithoutColorPNode /*Group*/ {
  TextStylePNode /*Group*/ ({
    required super.name,
    required super.textStyleProperties,
    required super.onGroupChange,
    required super.snode,
  }) {
    super.children?.insert(
        1, // after font family
        ColorPNode(
          snode: super.snode,
          name: 'color',
          color: textStyleProperties.color,
          onColorChange: (newValue) {
            textStyleProperties.color = newValue;
            onGroupChange.call(textStyleProperties, true);
          },
        ));
  }
}

class TextStyleSearchPNode extends PNode {
  TextStyleProperties textStyleProps;
  final ValueChanged<TextStyleProperties> onAnyTextStylePropertyChangeF;
  final Size calloutButtonSize;

  TextStyleSearchPNode /*Group*/ ({
    required this.textStyleProps,
    required this.onAnyTextStylePropertyChangeF,
    required super.snode,
    required super.name,
    super.tooltip,
    this.calloutButtonSize = const Size(48, 30),
  });

  @override
  void revertToOriginalValue() {
    onAnyTextStylePropertyChangeF.call(textStyleProps = TextStyleProperties());
  }

  @override
  Widget toPropertyNodeContents(BuildContext context) {
    ScrollControllerName? scName = EditablePage.maybeScrollControllerName(context);
    return PropertyButtonTextStyleNameSearch(
      cId: name,
      tooltip: tooltip,
      textStyle: textStyleProps,
      onHoveredF: (TextStyleProperties newProps) {
        if (newProps != textStyleProps) {
          onAnyTextStylePropertyChangeF.call(textStyleProps = newProps);
        }
      },
      onChangeF: (TextStyleProperties newProps) {
        snode.forcePropertyTreeRefresh(context);
        onAnyTextStylePropertyChangeF.call(textStyleProps = newProps);
      },
      calloutButtonSize: calloutButtonSize,
      scName: scName,
    );
  }
}

class TextStyleSavePNode extends PNode {
  final TextStylePropertiesChangeCallback onGroupChange;

  TextStyleSavePNode /*Group*/ ({
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
          // StyleNameSearchAnchor.of(context)
          //     ?.dismissSuggestionsOverlay();
          final tsName = teC.text;
          if (tsName.isNotEmpty) {
            TextStyleProperties? tsGroup = snode.textStyleProperties();
            if (tsGroup != null) {
              fco.namedTextStyles[tsName] = tsGroup.clone();
              await fco.modelRepo.saveAppInfo();
              fco.showToastBlueOnYellow(
                cId: 'saved-text-style',
                msg: "Text Style '$tsName' saved",
                removeAfterMs: 3500,
              );
              onGroupChange.call(tsGroup, false);
            }
          }
        },
        label: 'Save style as',
        tooltip: 'save text style as...',
      ),
    );
  }
}
