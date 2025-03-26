import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/decimal_pnode.dart';

part 'hotspots_node.mapper.dart';

@MappableClass()
class TargetsWrapperNode extends SC with TargetsWrapperNodeMappable {
  double? aspectRatio;

  // every drag end of a cover or play btn updates the aspect ratio
  double? width;
  double? height;
  double borderRadius;
  List<TargetModel> targets;
  List<TargetModel> playList;

  TargetsWrapperNode({
    this.aspectRatio,
    this.width,
    this.height,
    this.borderRadius = 0,
    this.targets = const [],
    this.playList = const [],
    super.child,
  });

  @override
  List<PNode> properties(BuildContext context, SNode? parentSNode) => [
        DecimalPNode(
          snode: this,
          name: 'width',
          decimalValue: width,
          onDoubleChange: (newValue) =>
              refreshWithUpdate(context,() => width = newValue),
          calloutButtonSize: const Size(80, 20),
        ),
    DecimalPNode(
      snode: this,
      name: 'height',
      decimalValue: height,
      onDoubleChange: (newValue) =>
          refreshWithUpdate(context,() => height = newValue),
      calloutButtonSize: const Size(80, 20),
    ),
    DecimalPNode(
      snode: this,
      name: 'borderRadius',
      decimalValue: borderRadius,
      onDoubleChange: (newValue) =>
          refreshWithUpdate(context,() => borderRadius = newValue??0.0),
      calloutButtonSize: const Size(80, 20),
    ),
        // StringPNode(
        //   snode: this,
        //   name: 'wrapper name',
        //   stringValue: name,
        //   onStringChange: (newValue) =>
        //       refreshWithUpdate(context,() => name = newValue),
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
  Widget toWidget(BuildContext context, SNode? parentNode, {bool showTriangle = false}) {
    EditablePageState? eps = EditablePage.of(context);
    setParent(parentNode);
    return eps != null
    ? ClipRRect(borderRadius: BorderRadius.circular(borderRadius),
      child: SizedBox(
        width: width,
        height: height,
        child: TargetsWrapper(
          parentNode: this,
          key: createNodeWidgetGK(),
          scName: EditablePage.scName(context),
          child: super.child?.toWidget(context, this) ?? const Placeholder(),
        ),
      ),
    )
    : Error(
        key: createNodeWidgetGK(),
        FLUTTER_TYPE,
        color: Colors.red, size: 16, errorMsg: "unable to find EditablePage.of(context)!");
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

  // @override
  // Widget? logoSrc() => const Icon(Icons.messenger);

  static const String FLUTTER_TYPE = "Hotspots";
}
