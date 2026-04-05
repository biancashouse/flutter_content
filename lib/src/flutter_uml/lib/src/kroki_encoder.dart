import 'dart:convert';

import 'package:archive/archive.dart';

import 'diagram_type.dart';

/// Encodes diagram source text into a Kroki-compatible URL.
///
/// Kroki expects the diagram text to be zlib-deflated and base64url-encoded
/// before being appended to the URL path.
class KrokiEncoder {
  KrokiEncoder._();

  /// Encodes [source] using zlib deflate and base64url encoding,
  /// matching the Kroki URL specification.
  static String encode(String source) {
    final bytes = utf8.encode(source);
    final deflated = ZLibEncoder().encode(bytes);
    return base64UrlEncode(deflated);
  }

  /// Returns the Kroki SVG URL for the given [type] and [source].
  ///
  /// [baseUrl] should not have a trailing slash.
  /// Returns an empty string if [source] is empty.
  static String buildSvgUrl(String baseUrl, DiagramType type, String source) {
    if (source.isEmpty) return '';
    final encoded = encode(source);
    return '$baseUrl/${type.krokiId}/svg/$encoded';
  }
}
