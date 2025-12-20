import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/editors/property_callout_button.dart';
import 'package:flutter_content/src/text_styles/container_style_search_anchor.dart';

class PropertyButtonContainerStyleNameSearch extends StatelessWidget {
  final CalloutId cId;
  final String? tooltip;
  final ContainerStyleProperties containerStyle;
  final ValueChanged<ContainerStyleProperties> onHoveredF;
  final ValueChanged<ContainerStyleProperties> onChangeF;
  final Size calloutButtonSize;
  

  const PropertyButtonContainerStyleNameSearch({
    required this.cId,
    this.tooltip,
    required this.containerStyle,
    required this.onHoveredF,
    required this.onChangeF,
    required this.calloutButtonSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
       return PropertyCalloutButton(
      cId: cId,
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
      initialCalloutAlignment: Alignment.center,
      initialTargetAlignment: Alignment.center,
      calloutContents: (ctx) {
        ContainerStyleNameSearchAnchor anchor = fco.containerStyleNameAnchor ??
            ContainerStyleNameSearchAnchor(
              parentCId: cId,
              buttonStyle: containerStyle,
              onHoveredF: (selectedSuggestion) {
                ContainerStyleProperties csProps =
                    fco.namedContainerStyles[selectedSuggestion]?.clone() ??
                        ContainerStyleProperties();
                onHoveredF(csProps);
              },
              onSelectionF: (selectedSuggestion) {
                ContainerStyleProperties csProps =
                        fco.namedContainerStyles[selectedSuggestion]
                        ?.clone() ?? ContainerStyleProperties()
                ;
                // if (!tsProps.same(originalTextStyle)) {
                //   fco.logger.d('PropertyButtonTextStyleNameSearch.onChange()');
                onChangeF(csProps);
                // }
                // snode.refreshWithUpdate(context,() {
                //   snode.setTextStyleProperties(
                //       tsProps?.clone() ?? TextStyleProperties());
                //   snode.refreshPTreeC(context);
                // });
              },
              debouncer: Debouncer(delayMs: 200),
              tooltipMsg: 'find a saved Container style',
            );
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: anchor,
        );
      },
      calloutSize: const Size(320, 60),
      // notifier: ValueNotifier<int>(0),
    );
  }
}
