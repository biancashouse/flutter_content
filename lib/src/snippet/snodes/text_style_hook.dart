// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';

import '../pnodes/groups/text_style_properties.dart';

class TextStyleHook extends MappingHook {
  const TextStyleHook();

  @override
  Object? beforeDecode(Object? value) {
    return value ?? {'tsPropGroup': TextStyleProperties().toJson()};
  }
}