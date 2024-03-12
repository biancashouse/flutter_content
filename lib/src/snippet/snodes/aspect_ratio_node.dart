// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

part 'aspect_ratio_node.mapper.dart';

@MappableClass()
class AspectRatioNode extends SC with AspectRatioNodeMappable {
  double aspectRatio;

  AspectRatioNode({
    this.aspectRatio = 1.0,
    super.child,
  });

  @override
  List<PTreeNode> createPropertiesList(BuildContext context) => [
        DecimalPropertyValueNode(
          snode: this,
          name: 'aspectRatio',
          decimalValue: aspectRatio,
          onDoubleChange: (newValue) => refreshWithUpdate(() => aspectRatio = newValue ?? 1.0),
          calloutButtonSize: const Size(140, 30),
        ),
      ];

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    try {
      setParent(parentNode);
      possiblyHighlightSelectedNode();
      return AspectRatio(
        key: createNodeGK(),
        aspectRatio: aspectRatio,
        child: child?.toWidget(context, this),
      );
    } catch (e) {
      debugPrint('cannot render $FLUTTER_TYPE!');
    }
    return const Icon(Icons.error, color: Colors.redAccent);
  }

  @override
  String toSource(BuildContext context) {
    return '''AspectRatio(
        width: $aspectRatio,
        child: ${child?.toSource(context)},
      )''';
  }

  // @override
  // List<Widget> nodePropertyEditors(BuildContext context, {bool allowButtonCallouts = false}) => [
  //       // SizedBox(height: 10),
  //       // NodePropertyButtonText(
  //       //     label: "aspectRatio",
  //       //     text: aspectRatio.toString(),
  //       //     calloutSize: const Size(600, 200),
  //       //     onChangeF: (s) {
  //       //       if (s.contains('/') && s.split('/').length == 2) {
  //       //         var split = s.split('/');
  //       //         double? w = double.tryParse(split[0]) ?? 1.0;
  //       //         double? h = double.tryParse(split[1]) ?? 1.0;
  //       //         aspectRatio = w / h;
  //       //       } else
  //       //         aspectRatio = double.tryParse(s) ?? 1.0;
  //       //       bloc.add(const CAPIEvent.forceRefresh());
  //       //     }),
  //       // // SizedBox(width: 90, height: 40,
  //       // //   child: DecimalEditor(
  //       // //     label: 'aspectRatio',
  //       // //     originalS: aspectRatio.toString() ?? '',
  //       // //     onChangedF: (newAR) {
  //       // //       aspectRatio = double.tryParse(newAR) ?? 1.0;
  //       // //       bloc.add(const CAPIEvent.forceRefresh());
  //       // //     },
  //       // //   ),
  //       // // ),
  //     ];

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "AspectRatio";
}
