// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/button_style_properties.dart';

import '../pnodes/groups/text_style_properties.dart';

class ButtonStyleHook extends MappingHook {
  const ButtonStyleHook();

  @override
  Object? beforeDecode(Object? value) {
    return value ?? {'bsPropGroup': ButtonStyleProperties(tsPropGroup: TextStyleProperties()).toJson()};
  }
}