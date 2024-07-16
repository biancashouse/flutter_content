import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

Size calculateTextSize({
  required String text,
  required TextStyle style,
  required int numLines,
  double textScaleFactor = 1.0,
}) {
  final TextPainter textPainter = TextPainter(
    text: TextSpan(text: text.replaceAll("`10`", "\n"), style: style),
    textDirection: TextDirection.ltr,
    textScaler: fco.textScaler,
    maxLines: 6,
  )..layout(minWidth: 0, maxWidth: double.infinity);

  return numLines > 1 ? Size(textPainter.size.width, textPainter.size.height) : textPainter.size;
}
