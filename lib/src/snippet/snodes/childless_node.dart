import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/snodes/algc_node.dart';

import 'fs_image_node.dart';

part 'childless_node.mapper.dart';

@MappableClass(discriminatorKey: 'cl', includeSubClasses: childlessSubClasses)
abstract class CL extends STreeNode with CLMappable {
  CL();
}
