import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/text_styles/suggestions.dart';
import 'package:flutter_content/src/text_styles/text_style_name_editor.dart';

class StyleNameSearchAnchor extends StatefulWidget {
  final TextEditingController searchStringTEC;
  final List<TextStyleName> suggestions;
  final Widget Function(BuildContext context, String suggestion) suggestionWidgetBuilderF;
  final TextStyleNameChangeCallback onSelectionF;
  final DebounceTimer debounceTimer;
  final String tooltipMsg;

  const StyleNameSearchAnchor({
    required this.searchStringTEC,
    required this.suggestions,
    required this.suggestionWidgetBuilderF,
    required this.onSelectionF,
    required this.debounceTimer,
    required this.tooltipMsg,
    super.key,
  });

  static StyleNameSearchAnchorState? of(BuildContext context) {
    if (!context.mounted) {
      fco.logger.i('context not mounted!');
    }
    var result =
        context.findAncestorStateOfType<StyleNameSearchAnchorState>();
    if (result == null) {
      fco.logger.i('SearchAnchor not found!');
    }
    return result;
  }

  @override
  // ignore: no_logic_in_create_state
  State<StyleNameSearchAnchor> createState() =>
      StyleNameSearchAnchorState();
}

class StyleNameSearchAnchorState extends State<StyleNameSearchAnchor> {
  final layerLink = LayerLink();
  OverlayEntry? entry;

  bool editingSearchString = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    dismissSuggestionsOverlay();
  }

  @override
  Widget build(BuildContext context) {
    return TapRegion(
      onTapInside: (e) {
        showSuggestionsOverlay();
      },
      // onTapOutside: (e) {
      //   dismissSuggestionsOverlay();
      // },
      child: CompositedTransformTarget(
        link: layerLink,
        child: StyleNameEditor(
          teC: widget.searchStringTEC,
          onChangeF: () {
            dismissSuggestionsOverlay();
            showSuggestionsOverlay();
          },
          onEditingCompleteF: (){

          },
          label: 'Search',
          tooltip: widget.tooltipMsg,
        ),
      ),
    );
  }

  void showSuggestionsOverlay() {
    if (entry == null) {
      final renderBox = context.findRenderObject() as RenderBox;
      final offset = renderBox.localToGlobal(Offset.zero);
      entry = OverlayEntry(builder: (_) {
        return Positioned(
          left: offset.dx,
          top: offset.dy + renderBox.size.height + 16,
          width: renderBox.size.width,
          child: CompositedTransformFollower(
            link: layerLink,
            showWhenUnlinked: false,
            offset: Offset(0, renderBox.size.height),
            child: TextStyleNameSuggestions(
              anchorState: this,
              suggestions: widget.suggestions,
              suggestionWidgetBuilderF: widget.suggestionWidgetBuilderF,
              onHoverF: (suggestedTextStyleName) {
                widget.debounceTimer.run(() {
                  setState(() {
                    widget.onSelectionF(suggestedTextStyleName);
                  });
                });
              },
              onSelectionF: (suggestedTextStyleName) {
                setState(() {
                  widget.searchStringTEC.text = suggestedTextStyleName;
                  widget.onSelectionF(suggestedTextStyleName);
                });
              },
            ),
          ),
        );
      });
      Overlay.of(context).insert(entry!);
    }
  }

  void dismissSuggestionsOverlay() {
    if (entry != null) {
      entry!.remove();
      entry = null;
    }
  }

  bool get isShowingSuggestionsOverlay => entry != null;
}
