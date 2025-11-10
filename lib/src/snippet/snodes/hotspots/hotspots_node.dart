import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/decimal_pnode.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hotspots_node.mapper.dart';

@MappableClass()
class TargetsWrapperNode extends SC with TargetsWrapperNodeMappable {
  double? aspectRatio;

  // every drag end of a cover or play btn updates the aspect ratio
  double borderRadius;
  List<TargetModel> targets;
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<TargetModel> playList;

  TargetsWrapperNode({
    this.aspectRatio,
    this.borderRadius = 0,
    this.targets = const [],
    this.playList = const [],
    super.child,
  });

  @override
  List<PNode> propertyNodes(BuildContext context, SNode? parentSNode) => [
    DecimalPNode(
      snode: this,
      name: 'aspectRatio',
      decimalValue: aspectRatio,
      onDoubleChange: (newValue) =>
          refreshWithUpdate(context, () => aspectRatio = newValue ?? 0.0),
      calloutButtonSize: const Size(130, 20),
    ),
    DecimalPNode(
      snode: this,
      name: 'borderRadius',
      decimalValue: borderRadius,
      onDoubleChange: (newValue) =>
          refreshWithUpdate(context, () => borderRadius = newValue ?? 0.0),
      calloutButtonSize: const Size(130, 20),
    ),
   ];

  @override
  Widget buildFlutterWidget(BuildContext context, SNode? parentNode) {
    EditablePageState? eps = EditablePage.of(context);
    setParent(parentNode);
    return eps != null
        ? ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: TargetsWrapper(
                parentNode: this,
                key: createNodeWidgetGK(),
                childNode: child,
            ),
          )
        : Error(
            key: createNodeWidgetGK(),
            FLUTTER_TYPE,
            color: Colors.red,
            size: 16,
            errorMsg: "unable to find EditablePage.of(context)!",
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
  bool canRemove() => targets.isEmpty;

  @override
  Widget? widgetLogo() =>
      Image.asset(fco.asset('lib/assets/images/pub.dev.png'), width: 16);

  @override
  String toString() => FLUTTER_TYPE;

  // @override
  // Widget? logoSrc() => const Icon(Icons.messenger);

  static const String FLUTTER_TYPE = "Hotspots";
}
