import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/button_style_group.dart';
import 'package:flutter_content/src/snippet/pnodes/groups/callout_config_group.dart';

part 'hotspots_node.mapper.dart';

@MappableClass()
class HotspotsNode extends SC with HotspotsNodeMappable {
  // SnippetName name;

  List<TargetModel> targets;
  List<TargetModel> playList;

  HotspotsNode({
    // required this.name,
    this.targets = const [],
    this.playList = const [],
    super.child,
  });

  @override
  List<PTreeNode> properties(BuildContext context) => [
        // StringPropertyValueNode(
        //   snode: this,
        //   name: 'wrapper name',
        //   stringValue: name,
        //   onStringChange: (newValue) =>
        //       refreshWithUpdate(() => name = newValue),
        //   calloutButtonSize: const Size(280, 80),
        //   calloutSize: const Size(280, 80),
        // ),
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
    return child != null
        ? TargetsWrapper(
            parentNode: this,
            key: createNodeGK(),
            child: super.child?.toWidget(context, this) ??
                const Icon(
                  Icons.question_mark,
                  color: Colors.orangeAccent,
                ),
          )
        : TargetsWrapper(
            parentNode: this,
            key: createNodeGK(),
            );
  }

  @override
  String toSource(BuildContext context) {
    return child?.toSource(context) ??
        'Icon(Icons.warning, color: Colors.red, size: 24,)';
  }

  TargetModel? findTarget(TargetId uid) {
    return targets.where((tc) => tc.uid == uid).firstOrNull;
  }

  @override
  bool canBeDeleted() => targets.isEmpty;

  @override
  String toString() => FLUTTER_TYPE;

  @override
  Widget? logoSrc() => const Icon(Icons.messenger);

  static const String FLUTTER_TYPE = "Hotspots";
}
