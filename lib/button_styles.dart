import 'package:flutter/material.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/button_style_properties.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/text_style_properties.dart';
import 'package:flutter_content/src/typedefs.dart';

import 'flutter_content.dart';

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
