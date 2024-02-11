import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_content/flutter_content.dart';

part 'childless_node.mapper.dart';

@MappableClass(discriminatorKey: 'cl', includeSubClasses: childlessSubClasses)
abstract class CL extends STreeNode with CLMappable {
  CL();
}
