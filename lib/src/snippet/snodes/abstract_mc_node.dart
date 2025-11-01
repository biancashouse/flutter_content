import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter_content/flutter_content.dart';

part 'abstract_mc_node.mapper.dart';

@MappableClass(discriminatorKey: 'DK:mc', includeSubClasses: multiChildSubClasses,
  hook: PropertyRenameHook('mc', 'DK:mc'), // 'first_name' -> JSON key, 'firstName' -> Dart field name
)
abstract class MC extends SNode with MCMappable {
  List<SNode> children;

  MC({required this.children});

  @override
  bool canRemove() => children.length < 2;

  @override
  bool canAppendAChild() => true;

}
