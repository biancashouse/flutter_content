import 'package:flutter_content/flutter_content.dart';

/// To use the GoogleFonts.getFont() method in Flutter, the exact string
/// you need is the font family name as it appears on the Google Fonts website,
/// typically with the first letter capitalized.
extension GoogleFontNamesExtension on FlutterContentMixins {
  void loadGoogleFontNames(List<GoogleFontName> map) => map.addAll([
    'Merriweather',
    'Damion',
    'Roboto',
    'Archivo Black',
    'Poppins',
    'Courier Prime',
  ]);
}
