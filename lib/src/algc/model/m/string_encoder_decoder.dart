mixin StringEncoderDecoder {
  String encodeString(String s, {int? commentIndex}) {
    if (containsUnicode(s)) {
      if (commentIndex != null) {
        // fco.logger.i("unicode detected in comment $commentIndex");
      }
      // fco.logger.i("unicode detected: $s".substring(0, min(s.length - 1, 60)));
    }
    return s
        .replaceAll("'", '`')
        .replaceAll('"', '`')
        .replaceAll(String.fromCharCode(8220), '`')
        .replaceAll(String.fromCharCode(8221), '`')
        .replaceAll(String.fromCharCode(8217), '`')
        .replaceAll(String.fromCharCode(8216), '`')
        .replaceAll(String.fromCharCode(9), '`9`')
        .replaceAll(String.fromCharCode(10), '`10`')
        .replaceAll(String.fromCharCode(13), '`13`')
        .replaceAll('\\n', '`10`');
  }

  String decodeString(String s) => s
      .replaceAll('`9`', '\t')
      .replaceAll('`10`', '\n')
      .replaceAll('`13`', '\n')
      .replaceAll('\\n', '\n');

  String removeDotsAndForceLowercase(String s) {
    if (s == 'anon' || s == 'samples') {
      return s;
    }
    String result;
    var parts = s.split('@');
    result = "${parts[0].replaceAll('.', '')}@${parts[1]}".toLowerCase();
    if (!result.contains('@gmail.com')) {
      result = s.toLowerCase();
    }
    return result;
  }

  bool containsUnicode(String text) {
    const int maxBits = 128;
    List<int> unicodeSymbols =
    text.codeUnits.where((ch) => ch > maxBits).toList();
    return unicodeSymbols.isNotEmpty;
  }
}
