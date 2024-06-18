

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter_content/src/typedefs.dart';

part 'upto6color_values.mapper.dart';

@MappableClass()
class UpTo6ColorValues with UpTo6ColorValuesMappable {
  ColorValue? color1Value;
  ColorValue? color2Value;
  ColorValue? color3Value;
  ColorValue? color4Value;
  ColorValue? color5Value;
  ColorValue? color6Value;

  UpTo6ColorValues({
    this.color1Value,
    this.color2Value,
    this.color3Value,
    this.color4Value,
    this.color5Value,
    this.color6Value,
  });


}
