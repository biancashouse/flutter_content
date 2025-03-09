import 'package:flutter/material.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/button_style_properties.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/text_style_properties.dart';
import 'package:flutter_content/src/typedefs.dart';

Map<ButtonStyleName, ButtonStyleProperties> cannedButtonStyles() => {
      "yellowOnBlack": ButtonStyleProperties(
        tsPropGroup: TextStyleProperties(
          colorValue: Colors.yellow.value
        ),
        bgColorValue: Colors.black.value,
        padding: 10,
        elevation: 6,
      ),
      "blackOnWhite": ButtonStyleProperties(
        tsPropGroup: TextStyleProperties(),
        bgColorValue: Colors.white.value,
        padding: 10,
        elevation: 6,
      ),
    };
