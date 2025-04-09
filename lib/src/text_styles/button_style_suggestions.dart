import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

class ButtonStyleNameSuggestions extends StatelessWidget {
  final BuildContext anchorContext;
  final TextStyleName searchString;
  final List<ButtonStyleName> suggestions;
  final SuggestionSelectionCallback onSelectionF;
  final SuggestionSelectionCallback onHoverF;

  const ButtonStyleNameSuggestions({
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
              return suggestion.contains(searchString) ||
                  searchString.isEmpty;
            }).map((match) {
              return _suggestedButtonStyleNameWidget(match);
            }).toList(),
          ),
        ),
      ),
      // ),
    );
  }

  Widget _suggestedButtonStyleNameWidget(String suggestedButtonStyleName) {
    return MouseRegion(
      onHover: (_) {
        onHoverF(suggestedButtonStyleName);
      },

        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: TextButton(
            onPressed: () {
              onSelectionF(suggestedButtonStyleName);
            },
            style: fco.namedButtonStyles[suggestedButtonStyleName]?.toButtonStyle(anchorContext),
            child: Text(suggestedButtonStyleName),
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
