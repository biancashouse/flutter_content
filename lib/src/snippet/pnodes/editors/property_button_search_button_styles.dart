import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_callout_button.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/button_style_properties.dart';
import 'package:flutter_content/src/text_styles/button_style_search_anchor.dart';

class PropertyButtonButtonStyleNameSearch extends StatelessWidget {
  final CalloutId cId;
  final String? tooltip;
  final ButtonStyleProperties buttonStyle;
  final ValueChanged<ButtonStyleProperties> onHoveredF;
  final ValueChanged<ButtonStyleProperties> onChangeF;
  final Size calloutButtonSize;
  final ScrollControllerName? scName;

  const PropertyButtonButtonStyleNameSearch({
    required this.cId,
    this.tooltip,
    required this.buttonStyle,
    required this.onHoveredF,
    required this.onChangeF,
    required this.calloutButtonSize,
    required this.scName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // void propagateChangeAndClose(TextStyleProperties? newName) {
    //   onChangeF(newName);
    //   fco.dismiss(cId);
    // }

    // var buttonStyleName = fco.findButtonStyleName(buttonStyle);

    // Widget labelWidget = buttonStyleName != null
    //     ? fco.coloredText('style name: $buttonStyleName', color: Colors.white)
    //     : fco.coloredText('style search...', color: Colors.white);
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
        ButtonStyleNameSearchAnchor anchor = fco.buttonStyleNameAnchor ??
            ButtonStyleNameSearchAnchor(
              parentCId: cId,
              buttonStyle: buttonStyle,
              onHoveredF: (selectedSuggestion) {
                ButtonStyleProperties bsProps =
                    fco.namedButtonStyles[selectedSuggestion]?.clone() ??
                        ButtonStyleProperties(tsPropGroup: TextStyleProperties());
                onHoveredF(bsProps);
              },
              onSelectionF: (selectedSuggestion) {
                ButtonStyleProperties bsProps =
                    fco.namedButtonStyles[selectedSuggestion]?.clone() ??
                        ButtonStyleProperties(tsPropGroup: TextStyleProperties());
                // if (!tsProps.same(originalTextStyle)) {
                //   fco.logger.d('PropertyButtonTextStyleNameSearch.onChange()');
                onChangeF(bsProps);
                // }
                // snode.refreshWithUpdate(context,() {
                //   snode.setTextStyleProperties(
                //       tsProps?.clone() ?? TextStyleProperties());
                //   snode.refreshPTreeC(context);
                // });
              },
              debounceTimer: DebounceTimer(delayMs: 200),
              tooltipMsg: 'find a saved ButtonStyle',
            );
        return anchor;
      },
      calloutSize: const Size(320, 40),
      notifier: ValueNotifier<int>(0),
    );
  }
}
