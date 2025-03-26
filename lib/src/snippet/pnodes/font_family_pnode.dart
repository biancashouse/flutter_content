import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_button_font_family.dart';

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
