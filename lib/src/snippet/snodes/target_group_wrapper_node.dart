import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

part 'target_group_wrapper_node.mapper.dart';

@MappableClass()
class TargetGroupWrapperNode extends SingleChildNode with TargetGroupWrapperNodeMappable {
  SnippetName name;

  TargetGroupWrapperNode({
    required this.name,
    super.child,
  });

  @override
  List<PTreeNode> createPropertiesList(BuildContext context) => [
        StringPropertyValueNode(
          snode: this,
          name: 'wrapper name',
          stringValue: name,
          onStringChange: (newValue) => refreshWithUpdate(() => name = newValue),
          calloutButtonSize: const Size(280, 70),
          calloutSize: const Size(280, 70),
        ),
      ];

  // @override
  // List<Widget> nodePropertyEditors(BuildContext context, {bool allowButtonCallouts = false}) => [
  //       NodePropertyButtonText(
  //           label: "Snppet Name",
  //           text: snippetName,
  //           calloutSize: const Size(600, 200),
  //           onChangeF: (s) {
  //             snippetName = s;
  //             bloc.add(const CAPIEvent.forceRefresh());
  //           }),
  //     ];

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    return TargetGroupWrapper(
      name: name,
      child: super.child?.toWidget(context, this) ??
          const Icon(
            Icons.question_mark,
            color: Colors.orangeAccent,
          ),
    );
    return child?.toWidget(context, this) ??
        const Icon(
          Icons.warning,
          color: Colors.red,
          size: 24,
        );
  }

  @override
  String toSource(BuildContext context) {
    return child?.toSource(context) ?? 'Icon(Icons.warning, color: Colors.red, size: 24,)';
  }

  @override
  String toString() => FLUTTER_TYPE;

  @override
  Widget? logoSrc() => const Icon(Icons.messenger);

  static const String FLUTTER_TYPE = "TargetGroupWrapper";
}
