import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_content/flutter_content.dart';

part 'single_child_node.mapper.dart';

@MappableClass(discriminatorKey: 'sc', includeSubClasses: singleChildSubClasses)
abstract class SingleChildNode extends STreeNode with SingleChildNodeMappable {
  STreeNode? child;

  SingleChildNode({this.child});
}
