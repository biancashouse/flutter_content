import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/edge_insets_editor.dart';

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
