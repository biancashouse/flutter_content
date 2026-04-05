import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_callout_button_UML.dart';

class DiagramStringPNode extends PNode {
  final ValueChanged<String?> onUmlChange;
  final Size calloutButtonSize;

  DiagramStringPNode({
    required this.onUmlChange,
    required this.calloutButtonSize,
    required super.snode,
    required super.name,
  });

  @override
  void revertToOriginalValue() {
    onUmlChange(null);
  }

  @override
  Widget toPropertyNodeContents(BuildContext context) {
    return PropertyButtonUML(
      diagramText: (super.snode as UMLImageNode).diagramText,
      label: super.name,
      calloutButtonSize: calloutButtonSize,
      propertyBtnGK: GlobalKey(debugLabel: ''),
      onChangeF: (newText) {
        onUmlChange(newText);
      },
    );
  }
}
