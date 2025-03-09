// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/edge_insets_editor.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_button_bool.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_button_color.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_button_font_family.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_button_fs_browser.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_callout_button_T.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_alignment.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_arrow_type.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_boxfit.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_clip.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_cross_axis_alignment.dart';
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
import 'package:flutter_content/src/snippet/pnodes/groups/border_side_properties.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/text_style_properties.dart';
import 'package:flutter_content/src/text_styles/search_anchor.dart';
import 'package:flutter_content/src/text_styles/text_style_name_editor.dart';

import 'pnodes/editors/date_button.dart';
import 'pnodes/editors/date_range_button.dart';
import 'pnodes/editors/property_callout_button_UML.dart';
import 'pnodes/enums/enum_flex_fit.dart';
import 'pnodes/enums/mappable_enum_decoration.dart';
import 'pnodes/groups/button_style_properties.dart';
import 'pnodes/groups/outlined_border_properties.dart';
import 'snodes/upto6color_values.dart';

class PNode extends Node {
  final PropertyName name;
  final String? tooltip;
  final SNode snode;
  List<PNode>? children;
  bool expanded;

  PNode({
    required this.name,
    this.tooltip,
    required this.snode,
    this.children,
    this.expanded = false,
  });

  Widget toPropertyNodeContents(BuildContext context) {
    // not used in a property group node
    throw UnimplementedError();
  }

  void revertToOriginalValue() {}

  // selection always uses this gk
  static GlobalKey get selectedPropertyGK {
    if (_selectedPropertyGK.currentState == null) return _selectedPropertyGK;
    fco.logger.i(
        "_selectedPropertyGK in use: ${_selectedPropertyGK.currentWidget.runtimeType}");
    return GlobalKey(debugLabel: '_selectedPropertyGK was in use');
  }

  // static Callout get selectedPropertyWidget => _selectedPropertyWidget;

  // static set selectedPropertyWidget(Callout newObj) => _selectedPropertyWidget = newObj;

  // static late Callout _selectedPropertyWidget;
  static final GlobalKey _selectedPropertyGK =
      GlobalKey(debugLabel: "PTreeNode.selectionGK");
}

// class PNode/*Group*/ extends PNode {
//   List<PNode> children;
//
//   PNode/*Group*/({
//     required super.snode,
//     required super.name,
//     required this.children,
//   });
//
//   @override
//   void revertToOriginalValue() {
//     snode.refreshWithUpdate(() {
//       for (PNode pNode in children) {
//         pNode.revertToOriginalValue();
//       }
//     });
//   }
// }

class TextStyleWithoutColorPNode /*Group*/ extends PNode /*Group*/ {
  final TextStyleProperties textStyleProperties;
  final ValueChanged<TextStyleProperties> onGroupChange;

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
      ),
      if (snode is ButtonNode)
        FYIPNode(
            fyiMsg: "Button's f/g color defines\nthe button's text color",
            snode: snode,
            name: 'fyi'),
      if (snode is TabBarNode)
        FYIPNode(
            fyiMsg: "TabBar's selected and unselected\ncolors define the text color",
            snode: snode,
            name: 'fyi'),
      FontFamilyPNode(
        snode: super.snode,
        name: 'fontFamily',
        fontFamily: textStyleProperties.fontFamily,
        onFontFamilyChange: (newValue) {
          textStyleProperties.fontFamily = newValue;
          fco.forceRefresh();
          onGroupChange.call(textStyleProperties);
        },
      ),
      DecimalPNode(
        snode: super.snode,
        name: 'fontSize',
        decimalValue: textStyleProperties.fontSize,
        onDoubleChange: (newValue) {
          textStyleProperties.fontSize = newValue;
          onGroupChange.call(textStyleProperties);
        },
        calloutButtonSize: const Size(96, 30),
      ),
      EnumPNode<Material3TextSizeEnum?>(
        snode: super.snode,
        name: 'M3 textSize',
        valueIndex: textStyleProperties.fontSizeName?.index,
        onIndexChange: (newValue) {
          textStyleProperties.fontSizeName = Material3TextSizeEnum.of(newValue);
          onGroupChange.call(textStyleProperties);
        },
      ),
      EnumPNode<FontStyleEnum?>(
        snode: super.snode,
        name: 'fontStyle',
        valueIndex: textStyleProperties.fontStyle?.index,
        onIndexChange: (newValue) {
          textStyleProperties.fontStyle = FontStyleEnum.of(newValue);
          onGroupChange.call(textStyleProperties);
        },
      ),
      EnumPNode<FontWeightEnum?>(
        snode: super.snode,
        name: 'fontWeight',
        valueIndex: textStyleProperties.fontWeight?.index,
        onIndexChange: (newValue) {
          textStyleProperties.fontWeight = FontWeightEnum.of(newValue);
          onGroupChange.call(textStyleProperties);
        },
      ),
      DecimalPNode(
        snode: super.snode,
        name: 'lineHeight',
        decimalValue: textStyleProperties.lineHeight,
        onDoubleChange: (newValue) {
          textStyleProperties.lineHeight = newValue;
          onGroupChange.call(textStyleProperties);
        },
        calloutButtonSize: const Size(120, 30),
      ),
      DecimalPNode(
        snode: super.snode,
        name: 'letterSpacing',
        decimalValue: textStyleProperties.letterSpacing,
        onDoubleChange: (newValue) {
          textStyleProperties.letterSpacing = newValue;
          onGroupChange.call(textStyleProperties);
        },
        calloutButtonSize: const Size(140, 30),
      ),
      TextStyleSavePNode(
        snode: super.snode,
        name: 'save TextStyle',
      ),
    ];
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
          colorValue: textStyleProperties.colorValue,
          onColorIntChange: (newValue) {
            textStyleProperties.colorValue = newValue;
            onGroupChange.call(textStyleProperties);
          },
        ));
  }
}

class TextStyleSearchPNode extends PNode {
  TextStyleSearchPNode /*Group*/ ({
    required super.name,
    required super.snode,
  });

  @override
  Widget toPropertyNodeContents(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 170,
      height: 60,
      padding: EdgeInsets.only(top: 10),
      child: StyleNameSearchAnchor(
        searchStringTEC: TextEditingController(
          text: fco.findTextStyleName(snode.textStyleProperties()!),
        ),
        suggestions: fco.namedTextStyles.keys.toList(),
        suggestionWidgetBuilderF: (context, suggestion) => Text(
          suggestion,
          softWrap: false,
          style: fco.namedTextStyles[suggestion]?.toTextStyle(context),
          overflow: TextOverflow.clip,
        ),
        onSelectionF: (selectedSuggestion) {
          // _updateProperty(selectedSuggestion);
          snode.refreshWithUpdate(() {
            var tsProps = fco.namedTextStyles[selectedSuggestion];
            snode.setTextStyleProperties(
                tsProps?.clone() ?? TextStyleProperties());
            snode.refreshPTreeC(context);
          });
        },
        debounceTimer: DebounceTimer(delayMs: 500),
        tooltipMsg: 'find a saved TextStyle',
      ),
    );
  }
}

class TextStyleSavePNode extends PNode {
  TextStyleSavePNode /*Group*/ ({
    required super.name,
    required super.snode,
  });

  @override
  Widget toPropertyNodeContents(BuildContext context) {
    TextEditingController teC = TextEditingController();
    return Container(
      color: Colors.white,
      width: 170,
      height: 60,
      padding: EdgeInsets.only(top: 10),
      child: StyleNameEditor(
        teC: teC,
        onChangeF: () {},
        onEditingCompleteF: () {
          // StyleNameSearchAnchor.of(context)
          //     ?.dismissSuggestionsOverlay();
          fco.dismissTopFeature();
        },
        label: 'Save as',
        tooltip: 'save text style as...',
      ),
    );
  }
}

class ButtonStylePNode /*Group*/ extends PNode /*Group*/ {
  ButtonStyleProperties buttonStyleGroup;
  final ValueChanged<ButtonStyleProperties> onGroupChange;

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
      ),
      PNode /*Group*/ (
        snode: super.snode,
        name: 'colour',
        children: [
          ColorPNode(
            snode: super.snode,
            name: 'f/g color',
            colorValue: buttonStyleGroup.fgColorValue,
            onColorIntChange: (newValue) {
              buttonStyleGroup.fgColorValue = newValue;
              onGroupChange.call(buttonStyleGroup);
            },
          ),
          ColorPNode(
            snode: super.snode,
            name: 'b/g color',
            colorValue: buttonStyleGroup.bgColorValue,
            onColorIntChange: (newValue) {
              buttonStyleGroup.bgColorValue = newValue;
              onGroupChange.call(buttonStyleGroup);
            },
          ),
        ],
      ),
      // buttonStyle's textStyle: text color comes from button foregroundColor
      TextStyleWithoutColorPNode(
        name: 'textStyle',
        textStyleProperties: buttonStyleGroup.tsPropGroup,
        onGroupChange: (newTSGroup) {
          buttonStyleGroup.tsPropGroup = newTSGroup.clone();
          // onGroupChange.call(buttonStyleGroup);
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
          onGroupChange.call(buttonStyleGroup);
        },
      ),
      BorderSidePNode /*Group*/ (
        snode: super.snode,
        name: 'side',
        borderSideGroup: buttonStyleGroup.side,
        onGroupChange: (newValue) {
          buttonStyleGroup.side = newValue;
          onGroupChange.call(buttonStyleGroup);
        },
      ),
      DecimalPNode(
        snode: super.snode,
        name: 'elevation',
        decimalValue: buttonStyleGroup.elevation,
        onDoubleChange: (newValue) {
          buttonStyleGroup.elevation = newValue;
          onGroupChange.call(buttonStyleGroup);
        },
        calloutButtonSize: const Size(80, 20),
      ),
      DecimalPNode(
        snode: super.snode,
        name: 'padding',
        decimalValue: buttonStyleGroup.padding,
        onDoubleChange: (newValue) {
          buttonStyleGroup.padding = newValue;
          onGroupChange.call(buttonStyleGroup);
        },
        calloutButtonSize: const Size(80, 20),
      ),
      DecimalPNode(
        snode: super.snode,
        name: 'radius',
        decimalValue: buttonStyleGroup.radius,
        onDoubleChange: (newValue) {
          buttonStyleGroup.radius = newValue;
          onGroupChange.call(buttonStyleGroup);
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
              onGroupChange.call(buttonStyleGroup);
            },
            calloutButtonSize: const Size(120, 20),
          ),
          DecimalPNode(
            snode: super.snode,
            name: 'minHeight',
            decimalValue: buttonStyleGroup.minH,
            onDoubleChange: (newValue) {
              buttonStyleGroup.minH = newValue;
              onGroupChange.call(buttonStyleGroup);
            },
            calloutButtonSize: const Size(120, 20),
          ),
          DecimalPNode(
            snode: super.snode,
            name: 'maxWidth',
            decimalValue: buttonStyleGroup.maxW,
            onDoubleChange: (newValue) {
              buttonStyleGroup.maxW = newValue;
              onGroupChange.call(buttonStyleGroup);
            },
            calloutButtonSize: const Size(120, 20),
          ),
          DecimalPNode(
            snode: super.snode,
            name: 'maxHeight',
            decimalValue: buttonStyleGroup.maxH,
            onDoubleChange: (newValue) {
              buttonStyleGroup.maxH = newValue;
              onGroupChange.call(buttonStyleGroup);
            },
            calloutButtonSize: const Size(120, 20),
          ),
          DecimalPNode(
            snode: super.snode,
            name: 'fixedWidth',
            decimalValue: buttonStyleGroup.fixedW,
            onDoubleChange: (newValue) {
              buttonStyleGroup.fixedW = newValue;
              onGroupChange.call(buttonStyleGroup);
            },
            calloutButtonSize: const Size(130, 20),
          ),
          DecimalPNode(
            snode: super.snode,
            name: 'fixedHeight',
            decimalValue: buttonStyleGroup.fixedH,
            onDoubleChange: (newValue) {
              buttonStyleGroup.fixedH = newValue;
              onGroupChange.call(buttonStyleGroup);
            },
            calloutButtonSize: const Size(130, 20),
          ),
          ButtonStyleSavePNode(
            snode: super.snode,
            name: 'save ButtonStyle',
          ),
        ],
      ),
    ];
  }
}

class ButtonStyleSearchPNode extends PNode {
  ButtonStyleSearchPNode /*Group*/ ({
    required super.name,
    required super.snode,
  });

  @override
  Widget toPropertyNodeContents(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 170,
      height: 60,
      padding: EdgeInsets.only(top: 10),
      child: StyleNameSearchAnchor(
        searchStringTEC: TextEditingController(
            text: fco.findButtonStyleName(snode.buttonStyleProperties()!)),
        suggestions: fco.namedButtonStyles.keys.toList(),
        suggestionWidgetBuilderF: (context, suggestion) {
          late ButtonNode buttonNode;
          ButtonStyleProperties? bsPropsGroup =
              fco.namedButtonStyles[suggestion];
          TextNode buttonTextNode =
              TextNode(text: suggestion, tsPropGroup: TextStyleProperties());
          if (bsPropsGroup != null && snode is ElevatedButtonNode) {
            buttonNode = ElevatedButtonNode(
                bsPropsGroup: bsPropsGroup, child: buttonTextNode);
          } else if (bsPropsGroup != null && snode is OutlinedButtonNode) {
            buttonNode = OutlinedButtonNode(
                bsPropsGroup: bsPropsGroup, child: buttonTextNode);
          } else if (bsPropsGroup != null && snode is TextButtonNode) {
            buttonNode = TextButtonNode(
                bsPropsGroup: bsPropsGroup, child: buttonTextNode);
          } else if (bsPropsGroup != null && snode is FilledButtonNode) {
            buttonNode = FilledButtonNode(
                bsPropsGroup: bsPropsGroup, child: buttonTextNode);
          } else if (bsPropsGroup != null && snode is IconButtonNode) {
            buttonNode = IconButtonNode(
                bsPropsGroup: bsPropsGroup, child: buttonTextNode);
          } else if (bsPropsGroup != null && snode is MenuItemButtonNode) {
            buttonNode = MenuItemButtonNode(
                bsPropsGroup: bsPropsGroup, child: buttonTextNode);
          }
          return buttonNode.toWidget(context, null);
        },
        onSelectionF: (selectedSuggestion) {
          // _updateProperty(selectedSuggestion);
          snode.refreshWithUpdate(() {
            var bsProps = fco.namedButtonStyles[selectedSuggestion];
            snode.setButtonStyleProperties(bsProps?.clone() ??
                ButtonStyleProperties(tsPropGroup: TextStyleProperties()));
            snode.refreshPTreeC(context);
          });
        },
        debounceTimer: DebounceTimer(delayMs: 500),
        tooltipMsg: 'find a saved ButtonStyle',
      ),
    );
  }
}

class ButtonStyleSavePNode extends PNode {
  ButtonStyleSavePNode /*Group*/ ({
    required super.name,
    required super.snode,
  });

  @override
  Widget toPropertyNodeContents(BuildContext context) {
    TextEditingController teC = TextEditingController();
    return Container(
      color: Colors.white,
      width: 170,
      height: 60,
      padding: EdgeInsets.only(top: 10),
      child: StyleNameEditor(
        teC: teC,
        onChangeF: () {},
        onEditingCompleteF: () async {
          String bsName = teC.text;
          fco.namedButtonStyles[bsName] =
              snode.buttonStyleProperties()!.clone();
          fco.appInfo.buttonStyles = fco.namedButtonStyles;
          await fco.modelRepo.saveAppInfo();
          fco.showToast(
            calloutConfig: CalloutConfig(
              cId: "saved-button-style",
              gravity: Alignment.topCenter,
              fillColor: Colors.yellow,
              initialCalloutW: fco.scrW * .8,
              initialCalloutH: 40,
              scrollControllerName: null,
            ),
            calloutContent: Padding(
              padding: const EdgeInsets.all(10),
              child: fco.coloredText('Saved ButtonStyle as "$bsName".',
                  color: Colors.blueAccent),
            ),
            removeAfterMs: 2000,
          );
        },
        label: 'Save as',
        tooltip: 'save button style as...',
      ),
    );
  }
}

class OutlinedBorderPNode /*Group*/ extends PNode /*Group*/ {
  OutlinedBorderProperties? outlinedGroup;
  final ValueChanged<OutlinedBorderProperties> onGroupChange;

  OutlinedBorderPNode /*Group*/ ({
    required super.name,
    required this.outlinedGroup,
    required this.onGroupChange,
    required super.snode,
    super.children = const [],
  }) {
    super.children = [
      EnumPNode<OutlinedBorderEnum?>(
        snode: super.snode,
        name: outlinedGroup?.outlinedBorderType?.name ?? 'shape...',
        valueIndex: outlinedGroup?.outlinedBorderType?.index,
        onIndexChange: (newValue) {
          outlinedGroup ??= OutlinedBorderProperties();
          outlinedGroup!.outlinedBorderType = OutlinedBorderEnum.of(newValue);
          onGroupChange.call(outlinedGroup!);
        },
      ),
      BorderSidePNode /*Group*/ (
        snode: super.snode,
        name: 'side',
        borderSideGroup: outlinedGroup?.side,
        onGroupChange: (newValue) {
          outlinedGroup ??= OutlinedBorderProperties();
          outlinedGroup!.side = newValue;
          onGroupChange.call(outlinedGroup!);
        },
      ),
    ];
  }
}

// class CalloutConfigPropertyGroup extends PropertyGroup {
//   CalloutConfigGroup? ccGroup;
//   final ValueChanged<CalloutConfigGroup> onGroupChange;
//
//   CalloutConfigPropertyGroup({
//     required super.name,
//     required this.ccGroup,
//     required this.onGroupChange,
//     required super.snode,
//     super.children = const [],
//   }) {
//     super.children = [
//       StringPNode(
//         snode: super.snode,
//         name: 'name',
//         stringValue: name,
//         options: FCO.snippetsMap.keys.toList(),
//         onStringChange: (newValue) {},
//         calloutButtonSize: const Size(280, 20),
//         calloutSize: const Size(280, 48),
//       ),
//       SnippetNamePNode(
//         stringValue: ccGroup?.contentSnippetName,
//         onStringChange: (newValue) {
//           ccGroup ??= CalloutConfigGroup();
//           ccGroup!.contentSnippetName = newValue;
//           onGroupChange.call(ccGroup!);
//         },
//         calloutButtonSize: const Size(280, 20),
//         calloutSize: const Size(280, 48),
//         snode: super.snode,
//         name: name,
//       ),
//       EnumPNode<AlignmentEnum?>(
//         snode: super.snode,
//         name: 'target alignment',
//         valueIndex: ccGroup?.targetAlignment?.index,
//         onIndexChange: (newValue) {
//           ccGroup ??= CalloutConfigGroup();
//           ccGroup!.targetAlignment = AlignmentEnum.of(newValue);
//           onGroupChange.call(ccGroup!);
//         },
//       ),
//       OffsetPNode(
//         topValue: ccGroup?.calloutPos?.dy,
//         leftValue: ccGroup?.calloutPos?.dx,
//         onOffsetChange: (newValue) {
//           ccGroup ??= CalloutConfigGroup();
//           ccGroup!.calloutPos = Offset(newValue.$1!, newValue.$2!);
//           onGroupChange.call(ccGroup!);
//         },
//         name: 'calloutPos',
//         snode: snode,
//       ),
//     ];
//   }
// }

class BorderSidePNode /*Group*/ extends PNode /*Group*/ {
  BorderSideProperties? borderSideGroup;
  final ValueChanged<BorderSideProperties> onGroupChange;

  BorderSidePNode /*Group*/ ({
    required super.name,
    required this.borderSideGroup,
    required this.onGroupChange,
    required super.snode,
    super.children = const [],
  }) {
    super.children = [
      DecimalPNode(
        snode: super.snode,
        name: 'width',
        decimalValue: borderSideGroup?.width,
        onDoubleChange: (newValue) {
          borderSideGroup ??= BorderSideProperties();
          borderSideGroup!.width = newValue;
          onGroupChange.call(borderSideGroup!);
        },
        calloutButtonSize: const Size(72, 30),
      ),
      ColorPNode(
        snode: super.snode,
        name: 'color',
        colorValue: borderSideGroup?.colorValue,
        onColorIntChange: (newValue) {
          borderSideGroup ??= BorderSideProperties();
          borderSideGroup!.colorValue = newValue;
          onGroupChange.call(borderSideGroup!);
        },
      ),
    ];
  }
}

class BoolPNode extends PNode {
  bool? boolValue;
  final ValueChanged<bool?> onBoolChange;

  BoolPNode({
    required this.boolValue,
    required this.onBoolChange,
    required super.name,
    required super.snode,
  });

  @override
  void revertToOriginalValue() {
    onBoolChange(boolValue = null);
  }

  @override
  Widget toPropertyNodeContents(BuildContext context) => PropertyEditorBool(
        name: super.name,
        boolValue: boolValue ?? false,
        onChanged: (newValue) {
          onBoolChange(boolValue = newValue);
        },
      );
}

// class SnippetRefPNode extends PTreeNode {
//   String? snippetName;
//   final ValueChanged<String> onNameChange;
//   final bool expands; // false means just a single line
//   final nameOnSeparateLine;
//   final Size calloutButtonSize;
//   final Size calloutSize;
//
//   SnippetRefPNode({
//     required this.snippetName,
//     required this.onNameChange,
//     this.expands = true,
//     this.nameOnSeparateLine = false,
//     required this.calloutButtonSize,
//     required this.calloutSize,
//     required super.snode,
//     required super.name,
//   });
//
//   @override
//   void revertToOriginalValue() {
//     onNameChange(snippetName = '');
//   }
//
//   // TODO no onChange etc yet
//   @override
//   Widget toPropertyNodeContents(BuildContext context) {
//     String displayedName = snippetName?.isNotEmpty ?? false
//         ? nameOnSeparateLine
//             ? '$name: \n$snippetName'
//             : '$name: $snippetName'
//         : '$name...';
//     // fco.logger.i('stringValue: $stringValue, displayedname: $displayedname');
//     // TODO use pushSnippet...
//     return NodePropertyCalloutButton(
//       cId: ,
//       notifier: ValueNotifier<int>(0),
//       labelWidget: Text(
//         displayedName,
//         style: const TextStyle(color: Colors.white),
//         softWrap: true,
//         maxLines: null,
//         // overflow: TextOverflow.ellipsis,
//       ),
//       calloutButtonSize: const Size(190, 40),
//       calloutContents: (ctx) {
//         return Container(); // TODO return a Snippet Tree
//       },
//       initialTargetAlignment: Alignment.topLeft,
//       initialCalloutAlignment: Alignment.topLeft,
//       draggable: false,
//       calloutSize: calloutSize,
//     );
//   }
// // NodePropertyButtonText(
// //   name: stringValue?.isNotEmpty ?? false ? '$name: $stringValue' : '$name...',
// //   text: stringValue,
// //   calloutSize: const Size(200, 100),
// //   onChangeF: (s) {
// //     onChange?.call(s);
// //   },
// // );
// }

// class StringPNode extends PTreeNode {
//   String? stringValue;
//   final ValueChanged<String> onStringChange;
//   final bool expands; // false means just a single line
//   final bool skipLabelText;
//   final bool skipHelperText;
//   final nameOnSeparateLine;
//   final Size calloutButtonSize;
//   final Size calloutSize;
//   final int numLines;
//
//   StringPNode({
//     required this.stringValue,
//     required this.onStringChange,
//     this.expands = true,
//     this.skipLabelText = false,
//     this.skipHelperText = false,
//     this.nameOnSeparateLine = false,
//     required this.calloutButtonSize,
//     required this.calloutSize,
//     this.numLines = 1,
//     required super.snode,
//     required super.name,
//   });
//
//   @override
//   void revertToOriginalValue() {
//     onStringChange(stringValue = '');
//   }
//
//   @override
//   Widget toPropertyNodeContents(BuildContext context) {
//     String displayedName = stringValue?.isNotEmpty ?? false
//         ? nameOnSeparateLine
//             ? '$name: \n$stringValue'
//             : '$name: $stringValue'
//         : '$name...';
//     // fco.logger.i('stringValue: $stringValue, displayedname: $displayedname');
//     return NodePropertyCalloutButton(
//       labelWidget: Text(
//         displayedName,
//         style: const TextStyle(color: Colors.white),
//         softWrap: true,
//         maxLines: null,
//         // overflow: TextOverflow.ellipsis,
//       ),
//       calloutButtonSize: calloutButtonSize,
//       calloutContents: (ctx) {
//         return Container(
//             padding: const EdgeInsets.all(4),
//             child: FlutterTextEditorInsideCallout(
//               originalText: stringValue ?? '',
//               label: name,
//               onDoneF: (s) {
//                 if (stringValue != s) onStringChange.call(stringValue = s);
//                 fco.removeOverlay(NODE_PROPERTY_CALLOUT_BUTTON);
//               },
//               skipLabelText: skipLabelText,
//               skipHelperText: skipHelperText,
//               numLines: numLines,
//               // keyboardType: expands ? TextInputType.multiline : TextInputType.text,
//               // dontAutoFocus: false,
//               // // minHeight: 60,
//               // maxLines: expands ? null : 1,
//               // focusNode: FocusNode(),
//             )
//             // FlutterTextEditor(
//             //   name: name,
//             //   originalS: stringValue ?? "",
//             //   textInputType: TextInputType.text,
//             //   onChangedF: (s) {
//             //     onChange.call(s);
//             //
//             //   },
//             //   onDoneF: () {
//             //     fco.afterMsDelayDo(500, () {
//             //       fco.removeOverlay(NODE_PROPERTY_CALLOUT_BUTTON);
//             //     });
//             //   },
//             // ),
//             );
//       },
//       initialTargetAlignment: Alignment.topLeft,
//       initialCalloutAlignment: Alignment.topLeft,
//       draggable: false,
//       calloutSize: calloutSize,
//     );
//   }
// NodePropertyButtonText(
//   name: stringValue?.isNotEmpty ?? false ? '$name: $stringValue' : '$name...',
//   text: stringValue,
//   calloutSize: const Size(200, 100),
//   onChangeF: (s) {
//     onChange?.call(s);
//   },
// );

class FYIPNode extends PNode {
  final String fyiMsg;

  FYIPNode({
    required this.fyiMsg,
    required super.snode,
    required super.name,
  });

  @override
  Widget toPropertyNodeContents(BuildContext context) {
    return fco.coloredText(fyiMsg, color: Colors.yellow);
  }
}

class StringPNode extends PNode {
  String? stringValue;
  final ValueChanged<String?> onStringChange;
  final List<String>? options;
  final bool expands;
  final bool skipLabelText;
  final bool skipHelperText;
  final nameOnSeparateLine;
  final Size calloutButtonSize;
  final double calloutWidth;
  final int numLines;

  StringPNode({
    required this.stringValue,
    required this.onStringChange,
    this.options,
    this.expands = false,
    this.skipLabelText = false,
    this.skipHelperText = false,
    this.nameOnSeparateLine = false,
    required this.calloutButtonSize,
    required this.calloutWidth,
    this.numLines = 1,
    required super.snode,
    required super.name,
  });

  @override
  void revertToOriginalValue() {
    onStringChange(stringValue = null);
  }

  @override
  Widget toPropertyNodeContents(BuildContext context) {
    ScrollControllerName? scName = EditablePage.scName(context);
    // fco.logger.i('toPropertyNodeContents');
    return PropertyButton<String>(
      // originalText: (stringValue??'').isNotEmpty
      //     ? nameOnSeparateLine
      //     ? '$name: \n$stringValue'
      //     : '$name: $stringValue'
      //     : '$name...',
      originalText: stringValue ?? '',
      options: options,
      label: super.name,
      maxLines: numLines,
      expands: expands,
      skipLabelText: skipLabelText,
      skipHelperText: skipHelperText,
      // textInputType: const TextInputType.numberWithOptions(decimal: true),
      calloutButtonSize: calloutButtonSize,
      calloutSize: Size(calloutWidth, numLines * 28 + 52),
      // calloutSize: calloutSize,
      propertyBtnGK: GlobalKey(debugLabel: ''),
      onChangeF: (s) {
        fco.dismiss('matches');
        fco.dismiss('te');
        onStringChange(stringValue = s);
      },
      scName: scName,
    );
  }
}

class UMLStringPNode extends PNode {
  UMLRecord umlRecord;
  final ValueChanged<UMLRecord> onUmlChange;
  final ValueChanged<Size> onSized;
  final Size calloutButtonSize;

  UMLStringPNode({
    required this.umlRecord,
    required this.onUmlChange,
    required this.onSized,
    required this.calloutButtonSize,
    required super.snode,
    required super.name,
  });

  @override
  void revertToOriginalValue() {
    onUmlChange((
      text: null,
      encodedText: null,
      bytes: null,
      width: null,
      height: null
    ));
  }

  @override
  Widget toPropertyNodeContents(BuildContext context) {
    ScrollControllerName? scName = EditablePage.scName(context);
    return PropertyButtonUML(
      originalUMLRecord: umlRecord,
      label: super.name,
      calloutButtonSize: calloutButtonSize,
      propertyBtnGK: GlobalKey(debugLabel: ''),
      onChangeF: (newRecord) {
        onUmlChange(umlRecord = newRecord);
      },
      onSizedF: (newSize) => onSized(newSize),
      scName: scName,
    );
  }
}

// class SnippetNamePNode extends PTreeNode {
//   String? stringValue;
//   final ValueChanged<String> onStringChange;
//   final bool expands;
//   final bool skipLabelText;
//   final bool skipHelperText;
//   final nameOnSeparateLine;
//   final Size calloutButtonSize;
//   final double calloutWidth;
//   final int numLines;
//
//   SnippetNamePNode({
//     required this.stringValue,
//     required this.onStringChange,
//     this.expands = false,
//     this.skipLabelText = false,
//     this.skipHelperText = false,
//     this.nameOnSeparateLine = false,
//     required this.calloutButtonSize,
//     required this.calloutWidth,
//     this.numLines = 1,
//     required super.snode,
//     required super.name,
//   });
//
//   @override
//   void revertToOriginalValue() {
//     onStringChange(stringValue = '');
//   }
//
//   @override
//   Widget toPropertyNodeContents(BuildContext context) {
//     fco.logger.i('toPropertyNodeContents');
//     return PropertyButton<String>(
//         originalText: stringValue ?? '',
//         options: FCO.snippetInfoCache.keys.toList()..sort(),
//         label: super.name,
//         maxLines: numLines,
//         expands: expands,
//         skipLabelText: true,
//         skipHelperText: true,
//         // textInputType: const TextInputType.numberWithOptions(decimal: true),
//         calloutButtonSize: calloutButtonSize,
//         calloutSize: Size(calloutWidth, numLines * 28 + 52),
//         propertyBtnGK: GlobalKey(debugLabel: 'snippetName property'),
//         onChangeF: (s) {
//           fco.dismiss('matches');
//           fco.dismiss('te');
//           onStringChange(stringValue = s);
//         });
//   }
// }

class DecimalPNode extends PNode {
  double? decimalValue;
  final ValueChanged<double?> onDoubleChange;
  final bool viaButton;
  final Size calloutButtonSize;

  // final Size calloutSize;

  // NodePropertyButton_String? button;

  DecimalPNode({
    required this.decimalValue,
    required this.onDoubleChange,
    this.viaButton = false,
    required this.calloutButtonSize,
    // required this.calloutSize,
    required super.name,
    required super.snode,
  });

  @override
  void revertToOriginalValue() {
    onDoubleChange(decimalValue = null);
  }

  @override
  Widget toPropertyNodeContents(BuildContext context) {
    ScrollControllerName? scName = EditablePage.scName(context);
    return PropertyButton<double>(
      originalText: decimalValue != null ? decimalValue.toString() : '',
      label: super.name,
      skipHelperText: true,
      //inputType: double,
      calloutButtonSize: calloutButtonSize,
      calloutSize: const Size(120, 80),
      // calloutSize: calloutSize,
      propertyBtnGK: GlobalKey(debugLabel: 'decimal'),
      onChangeF: (s) {
        if (s.toLowerCase() == 'infinity') {
          onDoubleChange.call(decimalValue = 999999999);
          return;
        }
        if (s.contains('/') && s.split('/').length == 2) {
          var split = s.split('/');
          double? w = double.tryParse(split[0]);
          double? h = double.tryParse(split[1]);
          if (w != null && h != null) {
            onDoubleChange.call(decimalValue = w / h);
          }
        } else {
          onDoubleChange.call(decimalValue = double.tryParse(s));
        }
      },
      scName: scName,
    );
  }
}

class SizePNode extends PNode {
  double? widthValue;
  double? heightValue;
  final ValueChanged<(double?, double?)> onSizeChange;

  // final Size calloutSize;

  // NodePropertyButton_String? button;

  SizePNode({
    required this.widthValue,
    required this.heightValue,
    required this.onSizeChange,
    required super.name,
    required super.snode,
  });

  @override
  void revertToOriginalValue() {
    onSizeChange((widthValue = null, heightValue = null));
  }

  @override
  Widget toPropertyNodeContents(BuildContext context) {
    ScrollControllerName? scName = EditablePage.scName(context);
    return SizedBox(
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          PropertyButton<double>(
            originalText: widthValue != null ? widthValue.toString() : '',
            label: 'width',
            skipHelperText: true,
            //inputType: double,
            calloutButtonSize: const Size(80, 20),
            calloutSize: const Size(80, 80),
            onChangeF: (s) {
              if (s.toLowerCase() == 'infinity') {
                onSizeChange.call((widthValue = 999999999, heightValue));
                return;
              }
              if (s.contains('/') && s.split('/').length == 2) {
                var split = s.split('/');
                double? part1 = double.tryParse(split[0]);
                double? part2 = double.tryParse(split[1]);
                if (part1 != null && part2 != null) {
                  onSizeChange.call((widthValue = part1 / part2, part2));
                }
              } else {
                onSizeChange
                    .call((widthValue = double.tryParse(s), heightValue));
              }
            },
            scName: scName,
            propertyBtnGK: GlobalKey(debugLabel: 'width'),
          ),
          const SizedBox(width: 40, child: Text('x')),
          PropertyButton<double>(
            originalText: heightValue != null ? heightValue.toString() : '',
            label: 'height',
            skipHelperText: true,
            //inputType: double,
            calloutButtonSize: const Size(80, 20),
            calloutSize: const Size(80, 80),
            // calloutSize: calloutSize,
            onChangeF: (s) {
              if (s.toLowerCase() == 'infinity') {
                onSizeChange.call((widthValue, heightValue = 999999999));
                return;
              }
              if (s.contains('/') && s.split('/').length == 2) {
                var split = s.split('/');
                double? part1 = double.tryParse(split[0]);
                double? part2 = double.tryParse(split[1]);
                if (part1 != null && part2 != null) {
                  onSizeChange.call((part2, heightValue = part1 / part2));
                }
              } else {
                onSizeChange
                    .call((widthValue, heightValue = double.tryParse(s)));
              }
            },
            scName: scName,
            propertyBtnGK: GlobalKey(debugLabel: 'height'),
          ),
        ],
      ),
    );
  }
}

class OffsetPNode extends PNode {
  double? topValue;
  double? leftValue;
  final ValueChanged<(double?, double?)> onOffsetChange;

  // final Offset calloutOffset;

  // NodePropertyButton_String? button;

  OffsetPNode({
    required this.topValue,
    required this.leftValue,
    required this.onOffsetChange,
    required super.name,
    required super.snode,
  });

  @override
  void revertToOriginalValue() {
    onOffsetChange((topValue = null, leftValue = null));
  }

  @override
  Widget toPropertyNodeContents(BuildContext context) {
    ScrollControllerName? scName = EditablePage.scName(context);
    return SizedBox(
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          PropertyButton<double>(
            originalText: topValue != null ? topValue.toString() : '',
            label: 'left',
            skipLabelText: true,
            skipHelperText: true,
            //inputType: double,
            calloutButtonSize: const Size(80, 20),
            calloutSize: const Size(120, 80),
            propertyBtnGK: GlobalKey(debugLabel: 'left'),
            onChangeF: (s) {
              if (s.toLowerCase() == 'infinity') {
                onOffsetChange.call((topValue = 999999999, leftValue));
                return;
              }
              if (s.contains('/') && s.split('/').length == 2) {
                var split = s.split('/');
                double? part1 = double.tryParse(split[0]);
                double? part2 = double.tryParse(split[1]);
                if (part1 != null && part2 != null) {
                  onOffsetChange.call((topValue = part1 / part2, part2));
                }
              } else {
                onOffsetChange.call((topValue = double.tryParse(s), leftValue));
              }
            },
            scName: scName,
          ),
          const SizedBox(width: 40, child: Text('x')),
          PropertyButton<double>(
            originalText: leftValue != null ? leftValue.toString() : '',
            label: 'top',
            skipLabelText: true,
            skipHelperText: true,
            //inputType: double,
            calloutButtonSize: const Size(80, 20),
            calloutSize: const Size(120, 80),
            // calloutOffset: calloutOffset,
            propertyBtnGK: GlobalKey(debugLabel: 'top'),
            onChangeF: (s) {
              if (s.toLowerCase() == 'infinity') {
                onOffsetChange.call((topValue, leftValue = 999999999));
                return;
              }
              if (s.contains('/') && s.split('/').length == 2) {
                var split = s.split('/');
                double? part1 = double.tryParse(split[0]);
                double? part2 = double.tryParse(split[1]);
                if (part1 != null && part2 != null) {
                  onOffsetChange.call((part2, leftValue = part1 / part2));
                }
              } else {
                onOffsetChange.call((topValue, leftValue = double.tryParse(s)));
              }
            },
            scName: scName,
          ),
        ],
      ),
    );
  }
}

class IntPNode extends PNode {
  int? intValue;
  final ValueChanged<int?> onIntChange;
  final bool viaButton;
  final Size calloutButtonSize;

  // final Size calloutSize;

  IntPNode({
    required this.intValue,
    required this.onIntChange,
    required super.snode,
    required super.name,
    this.viaButton = false,
    required this.calloutButtonSize,
    // required this.calloutSize,
  });

  @override
  void revertToOriginalValue() {
    onIntChange(intValue = null);
  }

  @override
  Widget toPropertyNodeContents(BuildContext context) {
    ScrollControllerName? scName = EditablePage.scName(context);
    return PropertyButton<int>(
      originalText: intValue != null ? intValue.toString() : '',
      label: super.name,
      skipHelperText: true,
      calloutButtonSize: calloutButtonSize,
      calloutSize: const Size(120, 100),
      propertyBtnGK: GlobalKey(debugLabel: 'int'),
      onChangeF: (s) {
        onIntChange.call(intValue = int.tryParse(s));
      },
      scName: scName,
    );
  }
}

class DatePNode extends PNode {
  int? dtValue;
  final ValueChanged<int?> onDateChange;

  DatePNode({
    required this.dtValue,
    required this.onDateChange,
    required super.snode,
    required super.name,
  });

  @override
  void revertToOriginalValue() {
    onDateChange(dtValue = null);
  }

  @override
  Widget toPropertyNodeContents(BuildContext context) => DateButton(
        title: super.name,
        originalDtValue: dtValue,
        onChangeF: (int? newDT) {
          onDateChange.call(dtValue = newDT);
        },
      );
}

class DateRangePNode extends PNode {
  int? fromValue;
  int? untilValue;
  final ValueChanged<DateRange?> onRangeChange;

  DateRangePNode({
    required this.fromValue,
    required this.untilValue,
    required this.onRangeChange,
    required super.snode,
    required super.name,
  });

  @override
  void revertToOriginalValue() {
    onRangeChange(null);
  }

  @override
  Widget toPropertyNodeContents(BuildContext context) {
    ScrollControllerName? scName = EditablePage.scName(context);
    return DateRangeButton(
      from: fromValue,
      until: untilValue,
      onChangeF: (DateRange range) {
        fromValue = range.from;
        untilValue = range.until;
        onRangeChange.call(range);
      },
      scName: scName,
    );
  }
}

class ColorPNode extends PNode {
  int? colorValue;
  final ValueChanged<int?> onColorIntChange;
  final Size calloutButtonSize;

  ColorPNode({
    required this.colorValue,
    required this.onColorIntChange,
    required super.snode,
    required super.name,
    super.tooltip,
    this.calloutButtonSize = const Size(120, 24),
  });

  @override
  void revertToOriginalValue() {
    onColorIntChange.call(colorValue = null);
  }

  @override
  Widget toPropertyNodeContents(BuildContext context) {
    ScrollControllerName? scName = EditablePage.scName(context);
    return PropertyButtonColor(
      cId: name,
      label: name,
      tooltip: tooltip,
      originalColor: colorValue != null ? Color(colorValue!) : null,
      onChangeF: (Color? newColor) {
        if (newColor != null) {
          onColorIntChange.call(colorValue = newColor.value);
        }
      },
      calloutButtonSize: calloutButtonSize,
      scName: scName,
    );
  }
}

class GradientPNode extends PNode {
  UpTo6ColorValues? colorValues;
  final void Function(UpTo6ColorValues?) onColorChange;

  GradientPNode({
    required this.colorValues,
    required this.onColorChange,
    required super.snode,
    required super.name,
  });

  @override
  void revertToOriginalValue() {
    onColorChange.call(colorValues = null);
  }

  @override
  Widget toPropertyNodeContents(BuildContext context) {
    ScrollControllerName? scName = EditablePage.scName(context);
    return Tooltip(
      message: name,
      child: SizedBox(
        width: 180,
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return PropertyButtonColor(
                  cId: '$name:1',
                  // key: GlobalKey(),
                  label: '',
                  originalColor: colorValues?.color1Value != null
                      ? Color(colorValues!.color1Value!)
                      : null,
                  onChangeF: (Color? newColor) {
                    if (newColor != null) {
                      setState(() => onColorChange.call(
                            colorValues = UpTo6ColorValues(
                              color1Value: newColor.value,
                              color2Value: colorValues?.color2Value,
                              color3Value: colorValues?.color3Value,
                              color4Value: colorValues?.color4Value,
                              color5Value: colorValues?.color5Value,
                              color6Value: colorValues?.color6Value,
                            ),
                          ));
                    }
                  },
                  scName: scName,
                  calloutButtonSize: const Size(24, 24),
                );
              }),
              StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return PropertyButtonColor(
                    cId: '$name:2',
                    label: '',
                    originalColor: colorValues?.color2Value != null
                        ? Color(colorValues!.color2Value!)
                        : null,
                    onChangeF: (Color? newColor) {
                      if (newColor != null) {
                        setState(() => onColorChange.call(
                              colorValues = UpTo6ColorValues(
                                color1Value: colorValues?.color1Value,
                                color2Value: newColor.value,
                                color3Value: colorValues?.color3Value,
                                color4Value: colorValues?.color4Value,
                                color5Value: colorValues?.color5Value,
                                color6Value: colorValues?.color6Value,
                              ),
                            ));
                      }
                    },
                    scName: scName,
                    calloutButtonSize: const Size(24, 24),
                  );
                },
              ),
              StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return PropertyButtonColor(
                    cId: '$name:3',
                    label: '',
                    originalColor: colorValues?.color3Value != null
                        ? Color(colorValues!.color3Value!)
                        : null,
                    onChangeF: (Color? newColor) {
                      if (newColor != null) {
                        setState(() => onColorChange.call(
                              colorValues = UpTo6ColorValues(
                                color1Value: colorValues?.color1Value,
                                color2Value: colorValues?.color2Value,
                                color3Value: newColor.value,
                                color4Value: colorValues?.color4Value,
                                color5Value: colorValues?.color5Value,
                                color6Value: colorValues?.color6Value,
                              ),
                            ));
                      }
                    },
                    scName: scName,
                    calloutButtonSize: const Size(24, 24),
                  );
                },
              ),
              StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return PropertyButtonColor(
                    cId: '$name:4',
                    label: '',
                    originalColor: colorValues?.color4Value != null
                        ? Color(colorValues!.color4Value!)
                        : null,
                    onChangeF: (Color? newColor) {
                      if (newColor != null) {
                        setState(() => onColorChange.call(
                              colorValues = UpTo6ColorValues(
                                color1Value: colorValues?.color1Value,
                                color2Value: colorValues?.color2Value,
                                color3Value: colorValues?.color3Value,
                                color4Value: newColor.value,
                                color5Value: colorValues?.color5Value,
                                color6Value: colorValues?.color6Value,
                              ),
                            ));
                      }
                    },
                    scName: scName,
                    calloutButtonSize: const Size(24, 24),
                  );
                },
              ),
              StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return PropertyButtonColor(
                    cId: '$name:5',
                    label: '',
                    originalColor: colorValues?.color5Value != null
                        ? Color(colorValues!.color5Value!)
                        : null,
                    onChangeF: (Color? newColor) {
                      if (newColor != null) {
                        setState(() => onColorChange.call(
                              colorValues = UpTo6ColorValues(
                                color1Value: colorValues?.color1Value,
                                color2Value: colorValues?.color2Value,
                                color3Value: colorValues?.color3Value,
                                color4Value: colorValues?.color4Value,
                                color5Value: newColor.value,
                                color6Value: colorValues?.color6Value,
                              ),
                            ));
                      }
                    },
                    scName: scName,
                    calloutButtonSize: const Size(24, 24),
                  );
                },
              ),
              StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return PropertyButtonColor(
                    cId: '$name:6',
                    label: '',
                    originalColor: colorValues?.color6Value != null
                        ? Color(colorValues!.color6Value!)
                        : null,
                    onChangeF: (Color? newColor) {
                      if (newColor != null) {
                        setState(() => onColorChange.call(
                              colorValues = UpTo6ColorValues(
                                color1Value: colorValues?.color1Value,
                                color2Value: colorValues?.color2Value,
                                color3Value: colorValues?.color3Value,
                                color4Value: colorValues?.color4Value,
                                color5Value: colorValues?.color5Value,
                                color6Value: newColor.value,
                              ),
                            ));
                      }
                    },
                    scName: scName,
                    calloutButtonSize: const Size(24, 24),
                  );
                },
              ),
            ]),
      ),
    );
  }
}

class FSImagePathPNode extends PNode {
  String? stringValue;
  final ValueChanged<String?> onPathChange;
  final Size calloutButtonSize;

  FSImagePathPNode({
    required this.stringValue,
    required this.onPathChange,
    required super.snode,
    required super.name,
    super.tooltip,
    this.calloutButtonSize = const Size(120, 20),
  });

  @override
  void revertToOriginalValue() {
    onPathChange.call(stringValue = null);
  }

  @override
  Widget toPropertyNodeContents(BuildContext context) {
    ScrollControllerName? scName = EditablePage.scName(context);
    return PropertyButtonFSBrowser(
      label: name,
      tooltip: tooltip,
      originalFSPath: stringValue,
      onChangeF: (String? newPath) {
        if (newPath != null) {
          onPathChange.call(stringValue = newPath);
        }
      },
      scName: scName,
      calloutButtonSize: calloutButtonSize,
    );
  }
}

class FontFamilyPNode extends PNode {
  String? fontFamily;
  final ValueChanged<String?> onFontFamilyChange;

  FontFamilyPNode({
    required this.fontFamily,
    required this.onFontFamilyChange,
    required super.snode,
    required super.name,
  });

  @override
  void revertToOriginalValue() {
    onFontFamilyChange(fontFamily = null);
  }

  @override
  Widget toPropertyNodeContents(BuildContext context) {
    ScrollControllerName? scName = EditablePage.scName(context);
    return PropertyButtonFontFamily(
      label: "fontFamily",
      originalFontFamily: fontFamily,
      menuBgColor: Colors.purpleAccent,
      onChangeF: (String? newFamily) {
        if (newFamily != null) {
          onFontFamilyChange.call(fontFamily = newFamily);
        }
      },
      scName: scName,
    );
  }
}

class EdgeInsetsPNode extends PNode {
  EdgeInsetsValue? eiValue;
  final ValueChanged<EdgeInsetsValue> onEIChangedF;

  EdgeInsetsPNode({
    required super.name,
    required this.eiValue,
    required this.onEIChangedF,
    required super.snode,
  });

  @override
  void revertToOriginalValue() {
    onEIChangedF(eiValue = EdgeInsetsValue());
  }

  @override
  Widget toPropertyNodeContents(BuildContext context) {
    return EdgeInsetsPropertyEditor(
      name: name,
      originalValue: eiValue ?? EdgeInsetsValue(),
      onChangedF: (EdgeInsetsValue newEIV) {
        onEIChangedF.call(eiValue = newEIV);
      },
    );
  }
}

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
