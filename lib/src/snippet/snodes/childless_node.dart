import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

import 'fs_image_node.dart';

part 'childless_node.mapper.dart';

@MappableClass(discriminatorKey: 'cl', includeSubClasses: childlessSubClasses)
abstract class CL extends SNode with CLMappable {
  CL();
}
