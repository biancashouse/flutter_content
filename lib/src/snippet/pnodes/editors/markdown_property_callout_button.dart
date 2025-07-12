import 'package:flutter/material.dart';

import 'package:flutter_content/flutter_content.dart';

// import 'markdown_editor.dart';

class MarkdownPropertyButton extends StatelessWidget {
  final String originalMarkdown;
  final String? label;
  final bool expands;
  final Size calloutButtonSize;
  final Size calloutSize;
  final ValueNotifier<int>? notifier;
  final bool skipLabelText;
  final bool skipHelperText;
  final GlobalKey propertyBtnGK;
  final ValueChanged<String> onChangeF;
  final ScrollControllerName? scName;

  const MarkdownPropertyButton({
    required this.originalMarkdown,
    this.label,
    this.expands = false,
    required this.calloutButtonSize,
    required this.calloutSize,
    this.notifier,
    this.skipLabelText = false,
    this.skipHelperText = false,
    required this.onChangeF,
    required this.propertyBtnGK,
    required this.scName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext sfContext, StateSetter setState) {
        String editedText = originalMarkdown;
        // fco.logger.d('editedText: $editedText');
        // fco.logger.d('label: $label');
        Text textLabel() => skipLabelText
            ? fco.coloredText(editedText, color: Colors.white, fontWeight: FontWeight.bold)
            : editedText.isNotEmpty
            ? Text.rich(
                TextSpan(
                  text: '$label: ',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w100),
                  children: [
                    TextSpan(
                      text: editedText,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            : fco.coloredText('$label...', color: Colors.white, fontWeight: FontWeight.w100);
        Widget labelWidget = textLabel();
        // fco.logger.d('labelWidget: $labelWidget');
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              Scaffold.maybeOf(sfContext)?.openEndDrawer();
            },
            child: Container(
              // alignment: T != String ? Alignment.center : AlignmentEnum.centerLeft,
              alignment: Alignment.centerLeft,
              key: propertyBtnGK,
              // margin: const EdgeInsets.only(top: 8),
              width: calloutButtonSize.width,
              height: calloutButtonSize.height,
              // padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              // color: Colors.white70,
              // alignment: Alignment.center,
              child: labelWidget,
            ),
          ),
        );
      },
    );
  }

}
