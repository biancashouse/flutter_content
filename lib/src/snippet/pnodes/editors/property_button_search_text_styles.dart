import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_callout_button.dart';
import 'package:flutter_content/src/text_styles/text_style_search_anchor.dart';

class PropertyButtonTextStyleNameSearch extends StatelessWidget {
  final CalloutId cId;
  final String? tooltip;
  final TextStyleProperties textStyle;
  final ValueChanged<TextStyleProperties> onHoveredF;
  final ValueChanged<TextStyleProperties> onChangeF;
  final Size calloutButtonSize;
  final ScrollControllerName? scName;

  const PropertyButtonTextStyleNameSearch({
    required this.cId,
    this.tooltip,
    required this.textStyle,
    required this.onHoveredF,
    required this.onChangeF,
    required this.calloutButtonSize,
    required this.scName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // var textStyleName = fco.findTextStyleName(textStyle);

    // Widget labelWidget = textStyleName != null
    //     ? fco.coloredText('style name: $textStyleName', color: Colors.white)
    //     : Text('style search...',
    //         style: const TextStyle(
    //           color: Colors.white,
    //         ));
    return PropertyCalloutButton(
      cId: cId,
      scName: scName,
      labelWidget: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 1,
            style: BorderStyle.solid, // You can change the style here
          ),
            borderRadius: BorderRadius.all(Radius.circular(4))
        ),
        child: Icon(Icons.search, color: Colors.grey,),
      ),
      tooltip: tooltip,
      calloutButtonSize: calloutButtonSize,
      calloutButtonColor: Colors.white,
      menuBgColor: Colors.white,
      initialCalloutAlignment: AlignmentEnum.center,
      initialTargetAlignment: AlignmentEnum.center,
      calloutContents: (ctx) {
        TextStyleNameSearchAnchor anchor = fco.textStyleNameAnchor ??
            TextStyleNameSearchAnchor(
              parentCId: cId,
              textStyle: textStyle,
              onHoveredF: (selectedSuggestion) {
                TextStyleProperties tsProps =
                    fco.namedTextStyles[selectedSuggestion]?.clone() ??
                        TextStyleProperties();
                onHoveredF(tsProps);
              },
              onSelectionF: (selectedSuggestion) {
                TextStyleProperties tsProps =
                    fco.namedTextStyles[selectedSuggestion]?.clone() ??
                        TextStyleProperties();
                // if (!tsProps.same(originalTextStyle)) {
                //   fco.logger.d('PropertyButtonTextStyleNameSearch.onChange()');
                onChangeF(tsProps);
                // }
                // snode.refreshWithUpdate(context,() {
                //   snode.setTextStyleProperties(
                //       tsProps?.clone() ?? TextStyleProperties());
                //   snode.refreshPTreeC(context);
                // });
              },
              debounceTimer: DebounceTimer(delayMs: 200),
              tooltipMsg: 'find a saved TextStyle',
            );
        return anchor;
      },
      calloutSize: const Size(320, 40),
      // notifier: ValueNotifier<int>(0),
    );
  }
}
