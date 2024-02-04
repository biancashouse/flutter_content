import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/bloc/capi_bloc.dart';
import 'package:flutter_content/src/bloc/capi_event.dart';
import 'package:flutter_content/src/target_config/content/snippet_editor/node_properties/decimal_editor.dart';
import 'package:flutter_content/src/target_config/content/snippet_editor/node_properties/iframe.dart';
import 'package:flutter_content/src/target_config/content/snippet_editor/node_properties/node_property_button_text.dart';
import 'package:gap/gap.dart';

part 'gap_node.mapper.dart';

@MappableClass()
class GapNode extends ChildlessNode with GapNodeMappable {
  double gap;

  GapNode({
    required this.gap,
  });

  @override
  List<PTreeNode> createPropertiesList(BuildContext context) => [
        DecimalPropertyValueNode(
          snode: this,
          name: 'gap',
          decimalValue: gap,
          onDoubleChange: (newValue) => refreshWithUpdate(() => gap = newValue ?? 0),
          calloutButtonSize: const Size(60, 30),
        ),
      ];

  // @override
  // List<Widget> nodePropertyEditors(BuildContext context, {bool allowButtonCallouts = false}) => [
  //       NodePropertyButtonText(
  //           label: "snippet name",
  //           text: snippetName,
  //           calloutSize: const Size(600, 200),
  //           onChangeF: (s) {
  //             snippetName = s;
  //             bloc.add(const CAPIEvent.forceRefresh());
  //           }),
  //     ];

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    parent = parentNode; // propagating parents down from root
    possiblyHighlightSelectedNode(context);
    return Gap(
      key: nodeWidgetGK, gap,
      // crossAxisExtent: 10,
    );
  }

  @override
  String toSource(BuildContext context) {
    return '''Gap($gap)''';
  }

  @override
  String toString() => 'gap';

  @override
  Widget? logoSrc() => Row(children: [
        const Icon(Icons.link),
        hspacer(6),
      ]);

  static const String FLUTTER_TYPE = "Gap";
}
