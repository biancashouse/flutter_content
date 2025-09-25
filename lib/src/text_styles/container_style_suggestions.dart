import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

class ContainerStyleNameSuggestions extends StatelessWidget {
  final BuildContext anchorContext;
  final TextStyleName searchString;
  final List<ContainerStyleName> suggestions;
  final SuggestionSelectionCallback onSelectionF;
  final SuggestionSelectionCallback onHoverF;

  const ContainerStyleNameSuggestions({
    required this.anchorContext,
    required this.searchString,
    required this.suggestions,
    required this.onSelectionF,
    required this.onHoverF,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return
        // TapRegion(
        // onTapInside: (e) {
        //   anchorState.editingSearchString = false;
        // },
        // onTapOutside: (e) {
        //   anchorState.editingSearchString = true;
        //   anchorState.dismissSuggestionsOverlay();
        // },
        // child:
        Container(height: 400,
      decoration: BoxDecoration(
        color: Colors.pinkAccent,
        borderRadius: getBorderRadius(),
      ),
      child: SingleChildScrollView(
        child: Material(
          color: Colors.transparent,
          borderRadius: getBorderRadius(),
          child: Column(
            children: (suggestions..sort()).where((suggestion) {
              return suggestion.contains(searchString) || searchString.isEmpty;
            }).map((match) {
              return _suggestedContainerStyleNameWidget(match);
            }).toList(),
          ),
        ),
      ),
      // ),
    );
  }

  Widget _suggestedContainerStyleNameWidget(String suggestedContainerStyleName) {
    ContainerStyleProperties? csProps = fco.namedContainerStyles[suggestedContainerStyleName];
    return csProps == null
    ? Icon(Icons.warning)
    : MouseRegion(
      onHover: (_) {
        onHoverF(suggestedContainerStyleName);
      },
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: GestureDetector(
          onTap: () {
            onSelectionF(suggestedContainerStyleName);
          },
          child: Container(
            decoration: csProps.decorationShapeEnum?.decorationShape.toDecoration(
              fillColorOrGradient: csProps.fillColors?.getColorOrGradient(),
              borderColorOrGradient: csProps.borderColors?.getColorOrGradient(),
              borderRadius: csProps.borderRadius,
              borderThickness: csProps.borderThickness,
              starPoints: csProps.starPoints,
            ),
            // decoration: ShapeDecoration(
            //   shape: outlinedBorderGroup!.outlinedBorderType!.toFlutterWidget(nodeSide: outlinedBorderGroup?.side, nodeRadius: borderRadius),
            //   color: fillColor1Value != null ? Color(fillColor1Value!) : null,
            // ),
            padding: csProps.padding?.toEdgeInsets(),
            margin: csProps.margin?.toEdgeInsets(),
            width: csProps.width,
            height: csProps.height,
            alignment: csProps.alignment?.alignment,
            child: Text(suggestedContainerStyleName),
          )

          ),
        ),
    );
  }

  BorderRadiusGeometry getBorderRadius() {
    double radius = 8;
    return BorderRadius.only(
      bottomLeft: Radius.circular(radius),
      bottomRight: Radius.circular(radius),
    );
  }
}
