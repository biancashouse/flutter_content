import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_content/flutter_content.dart';

part 'multi_child_node.mapper.dart';

@MappableClass(discriminatorKey: 'mc', includeSubClasses: multiChildSubClasses)
abstract class MultiChildNode extends STreeNode with MultiChildNodeMappable {
  List<STreeNode> children;

  MultiChildNode({required this.children});
}
