import 'package:dart_mappable/dart_mappable.dart';

part 'upto6color_values.mapper.dart';

@MappableClass()
class UpTo6ColorValues with UpTo6ColorValuesMappable {
  int? color1Value;
  int? color2Value;
  int? color3Value;
  int? color4Value;
  int? color5Value;
  int? color6Value;

  UpTo6ColorValues({
    this.color1Value,
    this.color2Value,
    this.color3Value,
    this.color4Value,
    this.color5Value,
    this.color6Value,
  });


}
