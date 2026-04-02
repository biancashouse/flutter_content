import 'package:flutter/material.dart';

enum WidgetCategory {
  layout('Layout', Color(0xFF90CAF9)),
  flex('Flex', Color(0xFFA5D6A7)),
  scroll('Scroll', Color(0xFF80DEEA)),
  stack('Stack', Color(0xFFFFCC80)),
  sliver('Slivers', Color(0xFFCE93D8)),
  text('Text', Color(0xFFF48FB1)),
  button('Button', Color(0xFFEF9A9A)),
  navigation('Navigation', Color(0xFFFFE082)),
  image('Image', Color(0xFF80CBC4)),
  media('Media', Color(0xFF9FA8DA)),
  content('Content', Color(0xFFBCAAA4)),
  snippet('Snippet', Color(0xFFB0BEC5));

  const WidgetCategory(this.displayName, this.color);

  final String displayName;
  final Color color;
}

class WidgetEntry {
  const WidgetEntry({
    required this.label,
    required this.type,
    required this.category,
    this.keywords = const [],
  });

  final String label;
  final Type type;
  final WidgetCategory category;
  final List<String> keywords;

  bool matches(String query) {
    if (query.isEmpty) return true;
    final q = query.toLowerCase();
    return label.toLowerCase().contains(q) ||
        keywords.any((k) => k.toLowerCase().contains(q));
  }
}
