import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

part 'hotspots_node.mapper.dart';

@MappableClass()
class HotspotsNode extends SC with HotspotsNodeMappable {
  double? aspectRatio;

  // every drag end of a cover or play btn updates the aspect ratio
  double? width;
  double? height;
  double borderRadius;
  List<TargetModel> targets;
  List<TargetModel> playList;

  HotspotsNode({
    this.aspectRatio,
    this.width,
    this.height,
    this.borderRadius = 0,
    this.targets = const [],
    this.playList = const [],
    super.child,
  });

  @override
  List<PTreeNode> properties(BuildContext context) => [
        DecimalPropertyValueNode(
          snode: this,
          name: 'width',
          decimalValue: width,
          onDoubleChange: (newValue) =>
              refreshWithUpdate(() => width = newValue),
          calloutButtonSize: const Size(80, 20),
        ),
    DecimalPropertyValueNode(
      snode: this,
      name: 'height',
      decimalValue: height,
      onDoubleChange: (newValue) =>
          refreshWithUpdate(() => height = newValue),
      calloutButtonSize: const Size(80, 20),
    ),
    DecimalPropertyValueNode(
      snode: this,
      name: 'borderRadius',
      decimalValue: borderRadius,
      onDoubleChange: (newValue) =>
          refreshWithUpdate(() => borderRadius = newValue??0.0),
      calloutButtonSize: const Size(80, 20),
    ),
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
    EditablePageState? eps = EditablePage.of(context);
    setParent(parentNode);
    return eps != null
    ? ClipRRect(borderRadius: BorderRadius.circular(borderRadius),
      child: SizedBox(
        width: width,
        height: height,
        child: TargetsWrapper(
          enterEditModeF: eps.enterEditMode,
          exitEditModeF: eps.exitEditMode,
          parentNode: this,
          key: createNodeGK(),
          scrollControllerName: EditablePage.name(context),
          child: super.child?.toWidget(context, this) ?? const Placeholder(),
        ),
      ),
    )
    : Error(
        key: createNodeGK(),
        FLUTTER_TYPE,
        color: Colors.red, size: 32, errorMsg: "unable to find EditablePage.of(context)!");
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
