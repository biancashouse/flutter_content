import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

part 'multi_child_node.mapper.dart';

@MappableClass(discriminatorKey: 'mc', includeSubClasses: multiChildSubClasses)
abstract class MC extends STreeNode with MCMappable {
  List<STreeNode> children;

  MC({required this.children});
}
