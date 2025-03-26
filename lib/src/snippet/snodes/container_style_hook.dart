// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/container_style_properties.dart';


class ContainerStyleHook extends MappingHook {
  const ContainerStyleHook();

  @override
  Object? beforeDecode(Object? value) {
    return value ?? {'csPropGroup': ContainerStyleProperties().toJson()};
  }
}