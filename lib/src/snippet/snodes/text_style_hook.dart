// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';

import '../pnodes/groups/text_style_properties.dart';

class TextStyleHook1 extends MappingHook {
  const TextStyleHook1();

  @override
  Object? beforeDecode(Object? value) {
    return value ?? {'tsPropGroup': TextStyleProperties().toJson()};
  }
}

class TextStyleHook2 extends MappingHook {
  const TextStyleHook2();

  @override
  Object? beforeDecode(Object? value) {
    return value ?? {'titleTextStyle': TextStyleProperties().toJson()};
  }
}