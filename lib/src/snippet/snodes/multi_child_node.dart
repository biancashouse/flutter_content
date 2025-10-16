import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter_content/flutter_content.dart';

part 'multi_child_node.mapper.dart';

@MappableClass(discriminatorKey: 'mc', includeSubClasses: multiChildSubClasses)
abstract class MC extends SNode with MCMappable {
  List<SNode> children;

  MC({required this.children});

  @override
  bool canRemove() => children.length < 2;

  @override
  bool canAppendAChild() => true;

}
