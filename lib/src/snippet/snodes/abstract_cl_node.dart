import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

import 'abstract_scrollview_node.dart';

part 'abstract_cl_node.mapper.dart';

@MappableClass(discriminatorKey: 'DK:cl', includeSubClasses: childlessSubClasses,
  hook: PropertyRenameHook('cl', 'DK:cl'), // 'first_name' -> JSON key, 'firstName' -> Dart field name
)
abstract class CL extends SNode with CLMappable {
  CL();
}
