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
import 'package:flutter_content/src/snippet/pnodes/groups/border_side_group.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/text_style_group.dart';

import 'pnodes/editors/date_button.dart';
import 'pnodes/editors/date_range_button.dart';
import 'pnodes/enums/enum_flex_fit.dart';
import 'pnodes/enums/mappable_enum_decoration.dart';
import 'pnodes/groups/button_style_group.dart';
import 'pnodes/groups/outlined_border_group.dart';
import 'snodes/upto6color_values.dart';

abstract class PTreeNode extends Node {
  final PropertyName name;
  final String? tooltip;
  final STreeNode snode;

  PTreeNode({
    required this.name,
    this.tooltip,
    required this.snode,
  });

  Widget toPropertyNodeContents(BuildContext context) {
    // not used in a property group node
    throw UnimplementedError();
  }

  void revertToOriginalValue() {}

  // selection always uses this gk
  static GlobalKey get selectedPropertyGK {
    if (_selectedPropertyGK.currentState == null) return _selectedPropertyGK;
    fco.logi("_selectedPropertyGK in use: ${_selectedPropertyGK.currentWidget.runtimeType}");
    return GlobalKey(debugLabel: '_selectedPropertyGK was in use');
  }

  // static Callout get selectedPropertyWidget => _selectedPropertyWidget;

  // static set selectedPropertyWidget(Callout newObj) => _selectedPropertyWidget = newObj;

  // static late Callout _selectedPropertyWidget;
  static final GlobalKey _selectedPropertyGK = GlobalKey(debugLabel: "PTreeNode.selectionGK");
}

class PropertyGroup extends PTreeNode {
  List<PTreeNode> children;

  PropertyGroup({
    required super.snode,
    required super.name,
    required this.children,
  });

  @override
  void revertToOriginalValue() {
    snode.refreshWithUpdate(() {
      for (PTreeNode pNode in children) {
        pNode.revertToOriginalValue();
      }
    });
  }
}

class TextStylePropertyGroup extends PropertyGroup {
  TextStyleGroup? textStyleGroup;
  final ValueChanged<TextStyleGroup> onGroupChange;

  TextStylePropertyGroup({
    required super.name,
    required this.textStyleGroup,
    required this.onGroupChange,
    required super.snode,
    super.children = const [],
  }) {
    super.children = [
      StringPropertyValueNode(
        snode: super.snode,
        name: 'namedTextStyle',
        nameOnSeparateLine: true,
        expands: true,
        stringValue: textStyleGroup?.namedTextStyle,
        options: fco.namedTextStyles.keys.toList(),
        onStringChange: (newValue) {
          textStyleGroup ??= TextStyleGroup();
          textStyleGroup!.namedTextStyle = newValue;
          onGroupChange.call(textStyleGroup!);
        },
        calloutButtonSize: const Size(280, 20),
        calloutWidth: 280,
      ),
      ColorPropertyValueNode(
        snode: super.snode,
        name: 'color',
        colorValue: textStyleGroup?.colorValue,
        onColorIntChange: (newValue) {
          textStyleGroup ??= TextStyleGroup();
          textStyleGroup!.colorValue = newValue;
          onGroupChange.call(textStyleGroup!);
        },
      ),
      FontFamilyPropertyValueNode(
        snode: super.snode,
        name: 'fontFamily',
        fontFamily: textStyleGroup?.fontFamily,
        onFontFamilyChange: (newValue) {
          textStyleGroup ??= TextStyleGroup();
          textStyleGroup!.fontFamily = newValue;
          fco.forceRefresh();
          onGroupChange.call(textStyleGroup!);
        },
      ),
      DecimalPropertyValueNode(
        snode: super.snode,
        name: 'fontSize',
        decimalValue: textStyleGroup?.fontSize,
        onDoubleChange: (newValue) {
          textStyleGroup ??= TextStyleGroup();
          textStyleGroup!.fontSize = newValue;
          onGroupChange.call(textStyleGroup!);
        },
        calloutButtonSize: const Size(96, 30),
      ),
      EnumPropertyValueNode<Material3TextSizeEnum?>(
        snode: super.snode,
        name: 'M3 textSize',
        valueIndex: textStyleGroup?.fontSizeName?.index,
        onIndexChange: (newValue) {
          textStyleGroup ??= TextStyleGroup();
          textStyleGroup!.fontSizeName = Material3TextSizeEnum.of(newValue);
          onGroupChange.call(textStyleGroup!);
        },
      ),
      EnumPropertyValueNode<FontStyleEnum?>(
        snode: super.snode,
        name: 'fontStyle',
        valueIndex: textStyleGroup?.fontStyle?.index,
        onIndexChange: (newValue) {
          textStyleGroup ??= TextStyleGroup();
          textStyleGroup!.fontStyle = FontStyleEnum.of(newValue);
          onGroupChange.call(textStyleGroup!);
        },
      ),
      EnumPropertyValueNode<FontWeightEnum?>(
        snode: super.snode,
        name: 'fontWeight',
        valueIndex: textStyleGroup?.fontWeight?.index,
        onIndexChange: (newValue) {
          textStyleGroup ??= TextStyleGroup();
          textStyleGroup!.fontWeight = FontWeightEnum.of(newValue);
          onGroupChange.call(textStyleGroup!);
        },
      ),
      DecimalPropertyValueNode(
        snode: super.snode,
        name: 'lineHeight',
        decimalValue: textStyleGroup?.lineHeight,
        onDoubleChange: (newValue) {
          textStyleGroup ??= TextStyleGroup();
          textStyleGroup!.lineHeight = newValue;
          onGroupChange.call(textStyleGroup!);
        },
        calloutButtonSize: const Size(120, 30),
      ),
      DecimalPropertyValueNode(
        snode: super.snode,
        name: 'letterSpacing',
        decimalValue: textStyleGroup?.letterSpacing,
        onDoubleChange: (newValue) {
          textStyleGroup ??= TextStyleGroup();
          textStyleGroup!.letterSpacing = newValue;
          onGroupChange.call(textStyleGroup!);
        },
        calloutButtonSize: const Size(140, 30),
      ),
    ];
  }

// List<PTreeNode> get children => [
//       FontFamilyPropertyValueNode(
//         name: 'fontFamily',
//         fontFamily: textStyleGroup?.fontFamily,
//         onChange: (newValue) {
//           textStyleGroup ??= TextStyleGroup();
//           textStyleGroup!.fontFamily = newValue;
//           onChange.call(textStyleGroup!);
//         },
//       ),
//       DecimalPropertyValueNode(
//         name: 'fontSize',
//         decimalValue: textStyleGroup?.fontSize,
//         onChange: (newValue) {
//           textStyleGroup ??= TextStyleGroup();
//           textStyleGroup!.fontSize = newValue;
//         },
//       ),
//       EnumPropertyValueNode<Material3TextSizeEnum?>(
//         name: 'M3 textSize',
//         valueIndex: textStyleGroup?.fontSizeName?.index,
//         onChange: (newValue) {
//           textStyleGroup ??= TextStyleGroup();
//           textStyleGroup!.fontSizeName = Material3TextSizeEnum.of(newValue);
//         },
//       ),
//       EnumPropertyValueNode<FontStyleEnum?>(
//         name: 'fontStyle',
//         valueIndex: textStyleGroup?.fontStyle?.index,
//         onChange: (newValue) {
//           textStyleGroup ??= TextStyleGroup();
//           textStyleGroup!.fontStyle = FontStyleEnum.of(newValue);
//         },
//       ),
//       EnumPropertyValueNode<FontWeightEnum?>(
//         name: 'fontStyle',
//         valueIndex: textStyleGroup?.fontWeight?.index,
//         onChange: (newValue) {
//           textStyleGroup ??= TextStyleGroup();
//           textStyleGroup!.fontWeight = FontWeightEnum.of(newValue);
//         },
//       ),
//       DecimalPropertyValueNode(
//         name: 'lineHeight',
//         decimalValue: textStyleGroup?.lineHeight,
//         onChange: (newValue) {
//           textStyleGroup ??= TextStyleGroup();
//           textStyleGroup!.lineHeight = newValue;
//         },
//       ),
//       DecimalPropertyValueNode(
//         name: 'letterSpacing',
//         decimalValue: textStyleGroup?.letterSpacing,
//         onChange: (newValue) {
//           textStyleGroup ??= TextStyleGroup();
//           textStyleGroup!.letterSpacing = newValue;
//         },
//       ),
//       ColorPropertyValueNode(
//         name: 'color',
//         colorValue: textStyleGroup?.colorValue,
//         onChange: (newValue) {
//           textStyleGroup ??= TextStyleGroup();
//           textStyleGroup!.colorValue = newValue;
//         },
//       ),
//     ];
}

class ButtonStylePropertyGroup extends PropertyGroup {
  ButtonStyleGroup? buttonStyleGroup;
  final ValueChanged<ButtonStyleGroup> onGroupChange;

  ButtonStylePropertyGroup({
    super.name = 'buttonStyle',
    required this.buttonStyleGroup,
    required this.onGroupChange,
    required super.snode,
    super.children = const [],
  }) {
    super.children = [
      StringPropertyValueNode(
        snode: super.snode,
        name: 'namedButtonStyle',
        nameOnSeparateLine: true,
        expands: true,
        stringValue: buttonStyleGroup?.namedButtonStyle,
        options: fco.namedButtonStyles.keys.toList(),
        onStringChange: (newValue) {
          buttonStyleGroup ??=ButtonStyleGroup();
          buttonStyleGroup!.namedButtonStyle = newValue;
          onGroupChange.call(buttonStyleGroup!);
        },
        calloutButtonSize: const Size(280, 20),
        calloutWidth: 280,
      ),
      PropertyGroup(
        snode: super.snode,
        name: 'colour',
        children: [
          ColorPropertyValueNode(
            snode: super.snode,
            name: 'f/g color',
            colorValue: buttonStyleGroup?.fgColorValue,
            onColorIntChange: (newValue) {
              buttonStyleGroup ??= ButtonStyleGroup();
              buttonStyleGroup!.fgColorValue = newValue;
              onGroupChange.call(buttonStyleGroup!);
            },
          ),
          ColorPropertyValueNode(
            snode: super.snode,
            name: 'b/g color',
            colorValue: buttonStyleGroup?.bgColorValue,
            onColorIntChange: (newValue) {
              buttonStyleGroup ??= ButtonStyleGroup();
              buttonStyleGroup!.bgColorValue = newValue;
              onGroupChange.call(buttonStyleGroup!);
            },
          ),
        ],
      ),
      // TextStylePropertyGroup(
      //   snode: super.snode,
      //   name: 'textStyle',
      //   textStyleGroup: buttonStyleGroup?.textStyle,
      //   onGroupChange: (newValue) {
      //     buttonStyleGroup ??= ButtonStyleGroup();
      //     buttonStyleGroup!.textStyle = newValue;
      //     onGroupChange.call(buttonStyleGroup!);
      //   },
      // ),
      EnumPropertyValueNode<OutlinedBorderEnum?>(
        snode: super.snode,
        name: 'shape',
        valueIndex: buttonStyleGroup?.shape?.index,
        onIndexChange: (newValue) {
          buttonStyleGroup ??= ButtonStyleGroup();
          buttonStyleGroup!.shape = OutlinedBorderEnum.of(newValue);
          onGroupChange.call(buttonStyleGroup!);
        },
      ),
      BorderSidePropertyGroup(
        snode: super.snode,
        name: 'side',
        borderSideGroup: buttonStyleGroup?.side,
        onGroupChange: (newValue) {
          buttonStyleGroup ??= ButtonStyleGroup();
          buttonStyleGroup!.side = newValue;
          onGroupChange.call(buttonStyleGroup!);
        },
      ),
      DecimalPropertyValueNode(
        snode: super.snode,
        name: 'elevation',
        decimalValue: buttonStyleGroup?.elevation,
        onDoubleChange: (newValue) {
          buttonStyleGroup ??= ButtonStyleGroup();
          buttonStyleGroup!.elevation = newValue;
          onGroupChange.call(buttonStyleGroup!);
        },
        calloutButtonSize: const Size(80, 20),
      ),
      DecimalPropertyValueNode(
        snode: super.snode,
        name: 'padding',
        decimalValue: buttonStyleGroup?.padding,
        onDoubleChange: (newValue) {
          buttonStyleGroup ??= ButtonStyleGroup();
          buttonStyleGroup!.padding = newValue;
          onGroupChange.call(buttonStyleGroup!);
        },
        calloutButtonSize: const Size(80, 20),
      ),
      DecimalPropertyValueNode(
        snode: super.snode,
        name: 'radius',
        decimalValue: buttonStyleGroup?.radius,
        onDoubleChange: (newValue) {
          buttonStyleGroup ??= ButtonStyleGroup();
          buttonStyleGroup!.radius = newValue;
          onGroupChange.call(buttonStyleGroup!);
        },
        calloutButtonSize: const Size(80, 20),
      ),
      PropertyGroup(
        snode: super.snode,
        name: 'size',
        children: [
          DecimalPropertyValueNode(
            snode: super.snode,
            name: 'minWidth',
            decimalValue: buttonStyleGroup?.minW,
            onDoubleChange: (newValue) {
              buttonStyleGroup ??= ButtonStyleGroup();
              buttonStyleGroup!.minW = newValue;
              onGroupChange.call(buttonStyleGroup!);
            },
            calloutButtonSize: const Size(80, 20),
          ),
          DecimalPropertyValueNode(
            snode: super.snode,
            name: 'minHeight',
            decimalValue: buttonStyleGroup?.minH,
            onDoubleChange: (newValue) {
              buttonStyleGroup ??= ButtonStyleGroup();
              buttonStyleGroup!.minH = newValue;
              onGroupChange.call(buttonStyleGroup!);
            },
            calloutButtonSize: const Size(80, 20),
          ),
          DecimalPropertyValueNode(
            snode: super.snode,
            name: 'maxWidth',
            decimalValue: buttonStyleGroup?.maxW,
            onDoubleChange: (newValue) {
              buttonStyleGroup ??= ButtonStyleGroup();
              buttonStyleGroup!.maxW = newValue;
              onGroupChange.call(buttonStyleGroup!);
            },
            calloutButtonSize: const Size(80, 20),
          ),
          DecimalPropertyValueNode(
            snode: super.snode,
            name: 'maxHeight',
            decimalValue: buttonStyleGroup?.maxH,
            onDoubleChange: (newValue) {
              buttonStyleGroup ??= ButtonStyleGroup();
              buttonStyleGroup!.maxH = newValue;
              onGroupChange.call(buttonStyleGroup!);
            },
            calloutButtonSize: const Size(80, 20),
          ),
        ],
      ),
    ];
  }
}

class OutlinedBorderPropertyGroup extends PropertyGroup {
  OutlinedBorderGroup? outlinedGroup;
  final ValueChanged<OutlinedBorderGroup> onGroupChange;

  OutlinedBorderPropertyGroup({
    required super.name,
    required this.outlinedGroup,
    required this.onGroupChange,
    required super.snode,
    super.children = const [],
  }) {
    super.children = [
      EnumPropertyValueNode<OutlinedBorderEnum?>(
        snode: super.snode,
        name: outlinedGroup?.outlinedBorderType?.name ?? 'shape...',
        valueIndex: outlinedGroup?.outlinedBorderType?.index,
        onIndexChange: (newValue) {
          outlinedGroup ??= OutlinedBorderGroup();
          outlinedGroup!.outlinedBorderType = OutlinedBorderEnum.of(newValue);
          onGroupChange.call(outlinedGroup!);
        },
      ),
      BorderSidePropertyGroup(
        snode: super.snode,
        name: 'side',
        borderSideGroup: outlinedGroup?.side,
        onGroupChange: (newValue) {
          outlinedGroup ??= OutlinedBorderGroup();
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
//       StringPropertyValueNode(
//         snode: super.snode,
//         name: 'name',
//         stringValue: name,
//         options: FCO.snippetsMap.keys.toList(),
//         onStringChange: (newValue) {},
//         calloutButtonSize: const Size(280, 20),
//         calloutSize: const Size(280, 48),
//       ),
//       SnippetNamePropertyValueNode(
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
//       EnumPropertyValueNode<AlignmentEnum?>(
//         snode: super.snode,
//         name: 'target alignment',
//         valueIndex: ccGroup?.targetAlignment?.index,
//         onIndexChange: (newValue) {
//           ccGroup ??= CalloutConfigGroup();
//           ccGroup!.targetAlignment = AlignmentEnum.of(newValue);
//           onGroupChange.call(ccGroup!);
//         },
//       ),
//       OffsetPropertyValueNode(
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

class BorderSidePropertyGroup extends PropertyGroup {
  BorderSideGroup? borderSideGroup;
  final ValueChanged<BorderSideGroup> onGroupChange;

  BorderSidePropertyGroup({
    required super.name,
    required this.borderSideGroup,
    required this.onGroupChange,
    required super.snode,
    super.children = const [],
  }) {
    super.children = [
      DecimalPropertyValueNode(
        snode: super.snode,
        name: 'width',
        decimalValue: borderSideGroup?.width,
        onDoubleChange: (newValue) {
          borderSideGroup ??= BorderSideGroup();
          borderSideGroup!.width = newValue;
          onGroupChange.call(borderSideGroup!);
        },
        calloutButtonSize: const Size(72, 30),
      ),
      ColorPropertyValueNode(
        snode: super.snode,
        name: 'color',
        colorValue: borderSideGroup?.colorValue,
        onColorIntChange: (newValue) {
          borderSideGroup ??= BorderSideGroup();
          borderSideGroup!.colorValue = newValue;
          onGroupChange.call(borderSideGroup!);
        },
      ),
    ];
  }
}

class BoolPropertyValueNode extends PTreeNode {
  bool? boolValue;
  final ValueChanged<bool?> onBoolChange;

  BoolPropertyValueNode({
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

// class SnippetRefPropertyValueNode extends PTreeNode {
//   String? snippetName;
//   final ValueChanged<String> onNameChange;
//   final bool expands; // false means just a single line
//   final nameOnSeparateLine;
//   final Size calloutButtonSize;
//   final Size calloutSize;
//
//   SnippetRefPropertyValueNode({
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
//     // fco.logi('stringValue: $stringValue, displayedname: $displayedname');
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

// class StringPropertyValueNode extends PTreeNode {
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
//   StringPropertyValueNode({
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
//     // fco.logi('stringValue: $stringValue, displayedname: $displayedname');
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

class StringPropertyValueNode extends PTreeNode {
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

  StringPropertyValueNode({
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
    // fco.logi('toPropertyNodeContents');
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
        });
  }
}

// class SnippetNamePropertyValueNode extends PTreeNode {
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
//   SnippetNamePropertyValueNode({
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
//     fco.logi('toPropertyNodeContents');
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

class DecimalPropertyValueNode extends PTreeNode {
  double? decimalValue;
  final ValueChanged<double?> onDoubleChange;
  final bool viaButton;
  final Size calloutButtonSize;

  // final Size calloutSize;

  // NodePropertyButton_String? button;

  DecimalPropertyValueNode({
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
  Widget toPropertyNodeContents(BuildContext context) => PropertyButton<double>(
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
      );
}

class SizePropertyValueNode extends PTreeNode {
  double? widthValue;
  double? heightValue;
  final ValueChanged<(double?, double?)> onSizeChange;

  // final Size calloutSize;

  // NodePropertyButton_String? button;

  SizePropertyValueNode({
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
  Widget toPropertyNodeContents(BuildContext context) => SizedBox(
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
                  onSizeChange.call((widthValue = double.tryParse(s), heightValue));
                }
              },
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
                  onSizeChange.call((widthValue, heightValue = double.tryParse(s)));
                }
              },
              propertyBtnGK: GlobalKey(debugLabel: 'height'),
            ),
          ],
        ),
      );
}

class OffsetPropertyValueNode extends PTreeNode {
  double? topValue;
  double? leftValue;
  final ValueChanged<(double?, double?)> onOffsetChange;

  // final Offset calloutOffset;

  // NodePropertyButton_String? button;

  OffsetPropertyValueNode({
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
  Widget toPropertyNodeContents(BuildContext context) => SizedBox(
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
            ),
          ],
        ),
      );
}

class IntPropertyValueNode extends PTreeNode {
  int? intValue;
  final ValueChanged<int?> onIntChange;
  final bool viaButton;
  final Size calloutButtonSize;

  // final Size calloutSize;

  IntPropertyValueNode({
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
  Widget toPropertyNodeContents(BuildContext context) => PropertyButton<int>(
      originalText: intValue != null ? intValue.toString() : '',
      label: super.name,
      skipHelperText: true,
      calloutButtonSize: calloutButtonSize,
      calloutSize: const Size(120, 100),
      propertyBtnGK: GlobalKey(debugLabel: 'int'),
      onChangeF: (s) {
        onIntChange.call(intValue = int.tryParse(s));
      });
}

class DatePropertyValueNode extends PTreeNode {
  int? dtValue;
  final ValueChanged<int?> onDateChange;

  DatePropertyValueNode({
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

class DateRangePropertyValueNode extends PTreeNode {
  int? fromValue;
  int? untilValue;
  final ValueChanged<DateRange?> onRangeChange;

  DateRangePropertyValueNode({
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
  Widget toPropertyNodeContents(BuildContext context) => DateRangeButton(
        from: fromValue,
        until: untilValue,
        onChangeF: (DateRange range) {
          fromValue = range.from;
          untilValue = range.until;
          onRangeChange.call(range);
        },
      );
}

class ColorPropertyValueNode extends PTreeNode {
  int? colorValue;
  final ValueChanged<int?> onColorIntChange;
  final Size calloutButtonSize;

  ColorPropertyValueNode({
    required this.colorValue,
    required this.onColorIntChange,
    required super.snode,
    required super.name,
    super.tooltip,
    this.calloutButtonSize = const Size(120, 20),
  });

  @override
  void revertToOriginalValue() {
    onColorIntChange.call(colorValue = null);
  }

  @override
  Widget toPropertyNodeContents(BuildContext context) => PropertyButtonColor(
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
      );
}

class GradientPropertyValueNode extends PTreeNode {
  UpTo6ColorValues? colorValues;
  final void Function(UpTo6ColorValues?) onColorChange;

  GradientPropertyValueNode({
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
    return Tooltip(
      message: name,
      child: SizedBox(
        width: 180,
        child: Row(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
            return PropertyButtonColor(
              cId: '$name:1',
              // key: GlobalKey(),
              label: '',
              originalColor: colorValues?.color1Value != null ? Color(colorValues!.color1Value!) : null,
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
              calloutButtonSize: const Size(24, 24),
            );
          }),
          StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return PropertyButtonColor(
                cId: '$name:2',
                label: '',
                originalColor: colorValues?.color2Value != null ? Color(colorValues!.color2Value!) : null,
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
                calloutButtonSize: const Size(24, 24),
              );
            },
          ),
          StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return PropertyButtonColor(
                cId: '$name:3',
                label: '',
                originalColor: colorValues?.color3Value != null ? Color(colorValues!.color3Value!) : null,
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
                calloutButtonSize: const Size(24, 24),
              );
            },
          ),
          StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return PropertyButtonColor(
                cId: '$name:4',
                label: '',
                originalColor: colorValues?.color4Value != null ? Color(colorValues!.color4Value!) : null,
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
                calloutButtonSize: const Size(24, 24),
              );
            },
          ),
          StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return PropertyButtonColor(
                cId: '$name:5',
                label: '',
                originalColor: colorValues?.color5Value != null ? Color(colorValues!.color5Value!) : null,
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
                calloutButtonSize: const Size(24, 24),
              );
            },
          ),
          StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return PropertyButtonColor(
                cId: '$name:6',
                label: '',
                originalColor: colorValues?.color6Value != null ? Color(colorValues!.color6Value!) : null,
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
                calloutButtonSize: const Size(24, 24),
              );
            },
          ),
        ]),
      ),
    );
  }
}

class FSImagePathPropertyValueNode extends PTreeNode {
  String? stringValue;
  final ValueChanged<String?> onPathChange;
  final Size calloutButtonSize;

  FSImagePathPropertyValueNode({
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
  Widget toPropertyNodeContents(BuildContext context) => PropertyButtonFSBrowser(
        label: name,
        tooltip: tooltip,
        originalFSPath: stringValue,
        onChangeF: (String? newPath) {
          if (newPath != null) {
            onPathChange.call(stringValue = newPath);
          }
        },
        calloutButtonSize: calloutButtonSize,
      );
}

class FontFamilyPropertyValueNode extends PTreeNode {
  String? fontFamily;
  final ValueChanged<String?> onFontFamilyChange;

  FontFamilyPropertyValueNode({
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
  Widget toPropertyNodeContents(BuildContext context) => PropertyButtonFontFamily(
        label: "fontFamily",
        originalFontFamily: fontFamily,
        menuBgColor: Colors.purpleAccent,
        onChangeF: (String? newFamily) {
          if (newFamily != null) {
            onFontFamilyChange.call(fontFamily = newFamily);
          }
        },
      );
}

class EdgeInsetsPropertyValueNode extends PTreeNode {
  EdgeInsetsValue? eiValue;
  final ValueChanged<EdgeInsetsValue> onEIChangedF;

  EdgeInsetsPropertyValueNode({
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

class EnumPropertyValueNode<T> extends PTreeNode {
  int? valueIndex;
  final ValueChanged<int?> onIndexChange;

  EnumPropertyValueNode({
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
    // just show name for null property value
    // if (value == null) return FCO.coloredText(name, color:Colors.white);
    // SnippetTemplate -------------
    if (_sameType<T, SnippetTemplateEnum?>()) {
      return SnippetTemplateEnum.propertyNodeContents(
          snode: snode, label: name, enumValueIndex: valueIndex, onChangedF: (newValueIndex) => onIndexChange(valueIndex = newValueIndex));
    }
    // BoxFit -------------
    if (_sameType<T, BoxFitEnum?>()) {
      return BoxFitEnum.propertyNodeContents(
          snode: snode, label: name, enumValueIndex: valueIndex, onChangedF: (newValueIndex) => onIndexChange(valueIndex = newValueIndex));
    }
    // Alignment -------------
    if (_sameType<T, AlignmentEnum?>()) {
      return AlignmentEnum.propertyNodeContents(
          snode: snode, label: name, enumValueIndex: valueIndex, onChangedF: (newValueIndex) => onIndexChange(valueIndex = newValueIndex));
    }
    // Alignment -------------
    if (_sameType<T, MappableDecorationShapeEnum?>()) {
      return MappableDecorationShapeEnum.propertyNodeContents(
        snode: snode,
        label: name,
        enumValueIndex: valueIndex,
        onChangedF: (newValueIndex) => onIndexChange(valueIndex = newValueIndex),
      );
    }
    // ArrowType -------------
    if (_sameType<T, ArrowTypeEnum?>()) {
      return ArrowTypeEnum.propertyNodeContents(
          snode: snode, label: name, enumValueIndex: valueIndex, onChangedF: (newValueIndex) => onIndexChange(valueIndex = newValueIndex));
    }
    // Axis -------------
    if (_sameType<T, AxisEnum?>()) {
      return AxisEnum.propertyNodeContents(
          snode: snode, label: name, enumValueIndex: valueIndex, onChangedF: (newValueIndex) => onIndexChange(valueIndex = newValueIndex));
    }
    // Clip -------------
    if (_sameType<T, ClipEnum?>()) {
      return ClipEnum.propertyNodeContents(
          snode: snode, label: name, enumValueIndex: valueIndex, onChangedF: (newValueIndex) => onIndexChange(valueIndex = newValueIndex));
    }
    // MainAxisAlignment -------------
    if (_sameType<T, MainAxisAlignmentEnum?>()) {
      return MainAxisAlignmentEnum.propertyNodeContents(
          snode: snode, label: name, enumValueIndex: valueIndex, onChangedF: (newValueIndex) => onIndexChange(valueIndex = newValueIndex));
    }
    // MainAxisSize -------------
    if (_sameType<T, MainAxisSizeEnum?>()) {
      return MainAxisSizeEnum.propertyNodeContents(
          snode: snode, label: name, enumValueIndex: valueIndex, onChangedF: (newValueIndex) => onIndexChange(valueIndex = newValueIndex));
    }
    // CrossAxisAlignment -------------
    if (_sameType<T, CrossAxisAlignmentEnum?>()) {
      return CrossAxisAlignmentEnum.propertyNodeContents(
          snode: snode, label: name, enumValueIndex: valueIndex, onChangedF: (newValueIndex) => onIndexChange(valueIndex = newValueIndex));
    }
    // FlexFit -------------
    if (_sameType<T, FlexFitEnum?>()) {
      return FlexFitEnum.propertyNodeContents(
          snode: snode, label: name, enumValueIndex: valueIndex, onChangedF: (newValueIndex) => onIndexChange(valueIndex = newValueIndex));
    }
    // TextDirection -------------
    if (_sameType<T, TextDirectionEnum?>()) {
      return TextDirectionEnum.propertyNodeContents(
          snode: snode, label: name, enumValueIndex: valueIndex, onChangedF: (newValueIndex) => onIndexChange(valueIndex = newValueIndex));
    }
    // FontStyle -------------
    if (_sameType<T, FontStyleEnum?>()) {
      return FontStyleEnum.propertyNodeContents(
          snode: snode, label: name, enumValueIndex: valueIndex, onChangedF: (newValueIndex) => onIndexChange(valueIndex = newValueIndex));
    }
    // FontWeight -------------
    if (_sameType<T, FontWeightEnum?>()) {
      return FontWeightEnum.propertyNodeContents(
          snode: snode, label: name, enumValueIndex: valueIndex, onChangedF: (newValueIndex) => onIndexChange(valueIndex = newValueIndex));
    }
    // Material3 Text Size -------------
    if (_sameType<T, Material3TextSizeEnum?>()) {
      return Material3TextSizeEnum.propertyNodeContents(
          snode: snode,
          label: name,
          themeData: Theme.of(context),
          enumValueIndex: valueIndex,
          onChangedF: (newValueIndex) => onIndexChange(valueIndex = newValueIndex));
    }
    // OutlinedBorder -------------
    if (_sameType<T, OutlinedBorderEnum?>()) {
      return OutlinedBorderEnum.propertyNodeContents(
          snode: snode, label: name, enumValueIndex: valueIndex, onChangedF: (newValueIndex) => onIndexChange(valueIndex = newValueIndex));
    }
    // StackFit -------------
    if (_sameType<T, StackFitEnum?>()) {
      return StackFitEnum.propertyNodeContents(
          snode: snode, label: name, enumValueIndex: valueIndex, onChangedF: (newValueIndex) => onIndexChange(valueIndex = newValueIndex));
    }
    // StepperType -------------
    if (_sameType<T, StepperTypeEnum?>()) {
      return StepperTypeEnum.propertyNodeContents(
          snode: snode, label: name, enumValueIndex: valueIndex, onChangedF: (newValueIndex) => onIndexChange(valueIndex = newValueIndex));
    }
    // TextAlign -------------
    if (_sameType<T, TextAlignEnum?>()) {
      return TextAlignEnum.propertyNodeContents(
          snode: snode, label: name, enumValueIndex: valueIndex, onChangedF: (newValueIndex) => onIndexChange(valueIndex = newValueIndex));
    }
    // TextDirection -------------
    if (_sameType<T, TextDirectionEnum?>()) {
      return TextDirectionEnum.propertyNodeContents(
          snode: snode, label: name, enumValueIndex: valueIndex, onChangedF: (newValueIndex) => onIndexChange(valueIndex = newValueIndex));
    }
    // TextOverflow -------------
    if (_sameType<T, TextOverflowEnum?>()) {
      return TextOverflowEnum.propertyNodeContents(
          snode: snode, label: name, enumValueIndex: valueIndex, onChangedF: (newValueIndex) => onIndexChange(valueIndex = newValueIndex));
    }
    // T property not implemented yet
    return fco.errorIcon(Colors.blue);
  }

}
bool _sameType<T1, T2>() => T1 == T2;
