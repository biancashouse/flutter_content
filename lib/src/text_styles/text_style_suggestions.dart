import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

class TextStyleNameSuggestions extends StatelessWidget {
  final BuildContext anchorContext;
  final TextStyleName searchString;
  final List<TextStyleName> suggestions;
  final SuggestionSelectionCallback onSelectionF;
  final SuggestionSelectionCallback onHoverF;

  const TextStyleNameSuggestions({
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
        Container(
      decoration: BoxDecoration(
        color: Colors.pinkAccent,
        borderRadius: getBorderRadius(),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: getBorderRadius(),
        child: Column(
          children: suggestions.where((suggestion) {
            return suggestion.contains(searchString) ||
                searchString.isEmpty;
          }).map((match) {
            return _suggestedTextStyleNameWidget(match);
          }).toList(),
        ),
      ),
      // ),
    );
  }

  Widget _suggestedTextStyleNameWidget(String suggestedTextStyleName) {
    return MouseRegion(
      onHover: (_) {
        onHoverF(suggestedTextStyleName);
      },
      child: InkWell(
        onTap: () {
          onSelectionF(suggestedTextStyleName);
        },
        child: Text(
          suggestedTextStyleName,
          softWrap: false,
          style: fco.namedTextStyles[suggestedTextStyleName]
              ?.toTextStyle(anchorContext),
          overflow: TextOverflow.clip,
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
