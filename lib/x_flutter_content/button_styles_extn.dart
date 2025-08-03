import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/button_style_properties.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/text_style_properties.dart';

extension ButtonStylesExtension on FlutterContentMixins {
  Map<ButtonStyleName, ButtonStyleProperties> cannedButtonStyles() => {
    "yellowOnBlack": ButtonStyleProperties(
      tsPropGroup: TextStyleProperties(),
      fgColor: ColorModel.yellow(),
      bgColor: ColorModel.black(),
      padding: 10,
      elevation: 6,
    ),
    "blackOnWhite": ButtonStyleProperties(
      tsPropGroup: TextStyleProperties(),
      fgColor: ColorModel.black(),
      bgColor: ColorModel.white(),
      padding: 10,
      elevation: 6,
    ),
  };

  ButtonStyleName? findButtonStyleName(AppInfoModel appInfop, ButtonStyleProperties props) {
    for (ButtonStyleName bsName in appInfo.userButtonStyles.keys) {
      ButtonStyleProperties namedBSProps = appInfo.userButtonStyles[bsName]!;
      if (namedBSProps.bgColor == props.bgColor &&
          namedBSProps.fgColor == props.fgColor &&
          namedBSProps.tsPropGroup == props.tsPropGroup &&
          namedBSProps.elevation == props.elevation &&
          namedBSProps.padding == props.padding &&
          namedBSProps.shape == props.shape &&
          namedBSProps.fixedH == props.fixedH &&
          namedBSProps.fixedW == props.fixedW &&
          namedBSProps.maxH == props.maxH &&
          namedBSProps.maxW == props.maxW &&
          namedBSProps.minH == props.minW &&
          namedBSProps.maxH == props.maxW &&
          namedBSProps.radius == props.radius &&
          namedBSProps.side?.color == props.side?.color &&
          namedBSProps.side?.width == props.side?.width) {
        return bsName;
      }
    }
    return null;
  }

}
