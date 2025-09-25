import 'package:flutter_content/flutter_content.dart';

extension ContainerStylesExtension on FlutterContentMixins {
  Map<ContainerStyleName, ContainerStyleProperties> cannedContainerStyles() => {
    // "yellowOnBlack": ContainerStyleProperties(
    //   tsPropGroup: TextStyleProperties(),
    //   fgColorValue: Colors.yellow.value,
    //   bgColorValue: Colors.black.value,
    //   padding: 10,
    //   elevation: 6,
    // ),
    // "blackOnWhite": ButtonStyleProperties(
    //   tsPropGroup: TextStyleProperties(),
    //   fgColorValue: Colors.black.value,
    //   bgColorValue: Colors.white.value,
    //   padding: 10,
    //   elevation: 6,
    // ),
  };

  ContainerStyleName? findContainerStyleName(AppInfoModel appInfo, ContainerStyleProperties props) {
    for (ContainerStyleName csName in appInfo.userContainerStyles.keys) {
      ContainerStyleProperties namedCSProps =
      appInfo.userContainerStyles[csName]!;
      if (namedCSProps == props) {
        return csName;
      }

      if (namedCSProps.outlinedBorderGroup != props.outlinedBorderGroup) {
        break;
      }

      if (namedCSProps.badgeWidth != props.badgeWidth) {
        break;
      }

      if (namedCSProps.badgeText != props.badgeText) {
        break;
      }

      if (namedCSProps.badgeHeight != props.badgeHeight) {
        break;
      }

      if (namedCSProps.badgeCorner != props.badgeCorner) {
        break;
      }

      if (namedCSProps.dash != props.dash) {
        break;
      }

      if (namedCSProps.starPoints != props.starPoints) {
        break;
      }

      if (namedCSProps.borderRadius != props.borderRadius) {
        break;
      }

      if (namedCSProps.borderColors?.color1 != props.borderColors?.color1) {
        break;
      }

      if (namedCSProps.borderColors?.color2 != props.borderColors?.color2) {
        break;
      }

      if (namedCSProps.borderColors?.color3 != props.borderColors?.color3) {
        break;
      }

      if (namedCSProps.borderColors?.color4 != props.borderColors?.color4) {
        break;
      }

      if (namedCSProps.borderColors?.color5 != props.borderColors?.color5) {
        break;
      }

      if (namedCSProps.borderColors?.color6 != props.borderColors?.color6) {
        break;
      }

      if (namedCSProps.borderThickness != props.borderThickness) {
        break;
      }

      if (namedCSProps.decorationShapeEnum != props.decorationShapeEnum) {
        break;
      }

      if (namedCSProps.height != props.height) {
        break;
      }

      if (namedCSProps.width != props.width) {
        break;
      }

      if (namedCSProps.alignment != props.alignment) {
        break;
      }

      if (namedCSProps.padding != props.padding) {
        break;
      }

      if (namedCSProps.margin != props.margin) {
        break;
      }

      if (namedCSProps.fillColors != props.fillColors) {
        break;
      }

      if (namedCSProps.gap != props.gap) {
        return csName;
      }
    }
    return null;
  }

}
