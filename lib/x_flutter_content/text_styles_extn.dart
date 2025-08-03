import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/text_style_properties.dart';

extension TextStylesExtension on FlutterContentMixins {
  Map<TextStyleName, TextStyleProperties> cannedTextStyles() => {
    "white14":
    TextStyleProperties(color: ColorModel.white(), fontSize: 14),
    "white18":
    TextStyleProperties(color: ColorModel.white(), fontSize: 18),
    "white24":
    TextStyleProperties(color: ColorModel.white(), fontSize: 24),
    "white28":
    TextStyleProperties(color: ColorModel.white(), fontSize: 28),
    "white30":
    TextStyleProperties(color: ColorModel.white(), fontSize: 30),
    "white36":
    TextStyleProperties(color: ColorModel.white(), fontSize: 36),
    "black14":
    TextStyleProperties(color: ColorModel.black(), fontSize: 14),
    "black18":
    TextStyleProperties(color: ColorModel.black(), fontSize: 18),
    "black24":
    TextStyleProperties(color: ColorModel.black(), fontSize: 24),
    "black28":
    TextStyleProperties(color: ColorModel.black(), fontSize: 28),
    "black30":
    TextStyleProperties(color: ColorModel.black(), fontSize: 30),
    "black36":
    TextStyleProperties(color: ColorModel.black(), fontSize: 36),
    "blue14":
    TextStyleProperties(color: ColorModel.blue(), fontSize: 14),
    "blue18":
    TextStyleProperties(color: ColorModel.blue(), fontSize: 18),
    "blue24":
    TextStyleProperties(color: ColorModel.blue(), fontSize: 24),
    "blue28":
    TextStyleProperties(color: ColorModel.blue(), fontSize: 28),
    "blue30":
    TextStyleProperties(color: ColorModel.blue(), fontSize: 30),
    "blue36":
    TextStyleProperties(color: ColorModel.blue(), fontSize: 36),
  };

  /// inspect the named text styles for a match, and return the name of that matching style
  TextStyleName? findTextStyleName(AppInfoModel appInfo, TextStyleProperties props) {
    for (TextStyleName tsName in appInfo.userTextStyles.keys) {
      TextStyleProperties namedTSProps = appInfo.userTextStyles[tsName]!;
      if (namedTSProps.color == props.color &&
          namedTSProps.fontWeight == props.fontWeight &&
          namedTSProps.fontSize == props.fontSize &&
          namedTSProps.fontSizeName == props.fontSizeName &&
          namedTSProps.fontFamily == props.fontFamily &&
          namedTSProps.fontStyle == props.fontStyle &&
          namedTSProps.letterSpacing == props.letterSpacing &&
          namedTSProps.lineHeight == props.lineHeight) {
        return tsName;
      }
    }
    return null;
  }
}