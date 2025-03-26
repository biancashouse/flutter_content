import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/date_button.dart';

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
