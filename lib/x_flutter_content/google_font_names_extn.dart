import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/text_style_properties.dart';

extension GoogleFontNamesExtension on FlutterContentMixins {
  void loadGoogleFontNames(List<GoogleFontName> arr) => arr.addAll(const [
    'Roboto',
    'Roboto Mono',
    'Merriweather',
    'Merriweather Sans',
  ]);
}
