import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter_content/flutter_content.dart';

part 'single_child_node.mapper.dart';

@MappableClass(discriminatorKey: 'sc', includeSubClasses: singleChildSubClasses)
abstract class SC extends SNode with SCMappable {
  SNode? child;

  SC({this.child});
}
