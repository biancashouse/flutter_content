import 'package:flutter/material.dart';

import 'package:flutter_content/flutter_content.dart';

import 'markdown_msv.dart';

class PropertyButtonMarkdown extends StatelessWidget {
  final String originalMarkdown;
  final String? label;
  final Size calloutButtonSize;
  final ValueChanged<String> onChangeF;

  const PropertyButtonMarkdown({
    required this.originalMarkdown,
    this.label,
    required this.calloutButtonSize,
    required this.onChangeF,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  InkWell(
            onTap: () {
              CalloutConfig teCC = CalloutConfig(
                cId: 'markdown-te',
                scrollControllerName: null,
                // containsTextField: true,
                barrier: CalloutBarrierConfig(
                    opacity: .25,
                    onTappedF: () {
                      fco.dismiss('markdown-te');
                    }),
                decorationFillColors: ColorOrGradient.color(Colors.purpleAccent),
                initialCalloutW: fco.scrW * .8,
                initialCalloutH: fco.scrH * .8,
                onDismissedF: () {},
                onAcceptedF: () {},
                resizeableH: true,
                resizeableV: true,
                onResizeF: (Size newSize) {},
                onDragF: (Offset newOffset) {},
                draggable: false,
                notUsingHydratedStorage: true,
              );

              Widget calloutContent = MarkdownMSV(
                originalMD: originalMarkdown,
                onChangeF: onChangeF,
              );

              fco.showOverlay(
                calloutConfig: teCC,
                calloutContent: calloutContent,
              );
            },
            child: fco.coloredText('tap here to edit the markdown', color: Colors.white),
            // child: Container(
            //   alignment: Alignment.topLeft,
            //   key: widget.propertyBtnGK,
            //   width: widget.calloutButtonSize.width,
            //   height: widget.calloutButtonSize.height,
            //   child: labelWidget,
            // ),
          );
  }
}