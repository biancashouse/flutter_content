import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_callout_button_UML.dart';

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
    ScrollControllerName? scName = EditablePage.maybeScrollControllerName(context);
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
