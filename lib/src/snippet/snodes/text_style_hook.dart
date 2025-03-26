// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_text_align.dart';

import '../pnodes/groups/text_style_properties.dart';

class TextStyleHook extends MappingHook {
  const TextStyleHook();

  @override
  Object? beforeDecode(Object? value) {
    return value ?? {'tsPropGroup': TextStyleProperties().toJson()};
  }
}