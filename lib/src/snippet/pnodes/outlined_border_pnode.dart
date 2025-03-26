import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/border_side_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/enum_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_outlined_border.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/outlined_border_properties.dart';

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
