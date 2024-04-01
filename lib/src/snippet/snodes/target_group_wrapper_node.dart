import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/button_style_group.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/callout_config_group.dart';

part 'target_group_wrapper_node.mapper.dart';

@MappableClass()
class TargetGroupWrapperNode extends ButtonNode
    with TargetGroupWrapperNodeMappable {
  SnippetName name;

  List<TargetModel> targets;
  List<TargetModel> playList;

  TargetGroupWrapperNode({
    required this.name,
    this.targets = const [],
    this.playList = const [],
    super.child,
  });

  @override
  List<PTreeNode> createPropertiesList(BuildContext context) => [
        StringPropertyValueNode(
          snode: this,
          name: 'wrapper name',
          stringValue: name,
          onStringChange: (newValue) =>
              refreshWithUpdate(() => name = newValue),
          calloutButtonSize: const Size(280, 80),
          calloutSize: const Size(280, 80),
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
    setParent(parentNode);
    return name != 'name?'
        ? TargetsWrapper(
            parentNode: this,
            key: createNodeGK(),
            child: super.child?.toWidget(context, this) ??
                const Icon(
                  Icons.question_mark,
                  color: Colors.orangeAccent,
                ),
          )
        : const Row(
            children: [
              Text('wrapper must be assigned a name'),
              Icon(Icons.error, color: Colors.redAccent),
            ],
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
    return child?.toSource(context) ??
        'Icon(Icons.warning, color: Colors.red, size: 24,)';
  }

  @override
  String toString() => FLUTTER_TYPE;

  @override
  Widget? logoSrc() => const Icon(Icons.messenger);

  static const String FLUTTER_TYPE = "TargetGroupWrapper";
}
