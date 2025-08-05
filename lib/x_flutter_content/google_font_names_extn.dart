import 'package:flutter_content/flutter_content.dart';

extension GoogleFontNamesExtension on FlutterContentMixins {
  void loadGoogleFontNames(List<GoogleFontName> arr) => arr.addAll(const [
    'Roboto',
    'Roboto Mono',
    'Merriweather',
    'Merriweather Sans',
  ]);
}
