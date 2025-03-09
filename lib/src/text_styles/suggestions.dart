import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/text_styles/search_anchor.dart';

class TextStyleNameSuggestions extends StatelessWidget {
  final StyleNameSearchAnchorState anchorState;
  final List<TextStyleName> suggestions;
  final SuggestionSelectionCallback onSelectionF;
  final SuggestionSelectionCallback onHoverF;
  final Widget Function(BuildContext context, String suggestion) suggestionWidgetBuilderF;

  const TextStyleNameSuggestions({
    required this.anchorState,
    required this.suggestions,
    required this.onSelectionF,
    required this.onHoverF,
    required this.suggestionWidgetBuilderF,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TapRegion(
      onTapInside: (e) {
        anchorState.editingSearchString = false;
      },
      onTapOutside: (e) {
        anchorState.editingSearchString = true;
        anchorState.dismissSuggestionsOverlay();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.pinkAccent,
          borderRadius: getBorderRadius(),
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: getBorderRadius(),
          child: Column(
            children: suggestions.where((suggestion) {
              return suggestion.contains(anchorState.widget.searchStringTEC.text) ||
                  anchorState.widget.searchStringTEC.text.isEmpty;
            }).map((match) {
              return _suggestTextStyleNameWidget(match);
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _suggestTextStyleNameWidget(String suggestedTextStyleName) {
    return MouseRegion(
      onHover: (_){

        onHoverF(suggestedTextStyleName);
      },
      child: InkWell(
        onTap: () {
          anchorState.dismissSuggestionsOverlay();
          onSelectionF(suggestedTextStyleName);
        },
        child: Text(
          suggestedTextStyleName,
          softWrap: false,
          style: fco.namedTextStyles[suggestedTextStyleName]
              ?.toTextStyle(anchorState.context),
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
