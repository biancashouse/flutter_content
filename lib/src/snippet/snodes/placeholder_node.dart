// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';

part 'placeholder_node.mapper.dart';

@MappableClass()
class PlaceholderNode extends ChildlessNode with PlaceholderNodeMappable {
  String? name;
  String? centredLabel;
  int? colorValue;
  double? width;
  double? height;

  PlaceholderNode({
    this.name,
    this.centredLabel,
    this.colorValue,
    this.width,
    this.height,
  });

  @override
  List<PTreeNode> createPropertiesList(BuildContext context) => [
        StringPropertyValueNode(
          snode: this,
          name: 'name',
          expands: false,
          numLines: 1,
          // skipHelperText: true,
          // skipLabelText: true,
          stringValue: name,
          onStringChange: (newValue) => refreshWithUpdate(() => name = newValue),
          calloutButtonSize: const Size(150, 20),
          calloutSize: const Size(150, 80),
        ),
        DecimalPropertyValueNode(
          snode: this,
          name: 'width',
          decimalValue: width,
          onDoubleChange: (newValue) => refreshWithUpdate(() => width = newValue),
          calloutButtonSize: const Size(80, 20),
        ),
        DecimalPropertyValueNode(
          snode: this,
          name: 'height',
          decimalValue: height,
          onDoubleChange: (newValue) => refreshWithUpdate(() => height = newValue),
          calloutButtonSize: const Size(80, 20),
        ),
      ];

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    setParent(parentNode);
    possiblyHighlightSelectedNode(context);
    Widget? childWidget;
    if (centredLabel?.isNotEmpty ?? false) {
      childWidget = Container(
          alignment: Alignment.center,
          color: colorValue != null ? Color(colorValue!) : null,
          child: Text(
            centredLabel!,
            textScaler: TextScaler.linear(3),
          ));
    }
    return Placeholder(
      key: nodeWidgetGK,
      fallbackWidth: width ?? 400,
      fallbackHeight: height ?? 400,
      child: childWidget,
    );
  }

  // @override
  // String toSource(BuildContext context) {
  //   return '''Placeholder(
  //       fallbackWidth: $width,
  //       fallbackHeight: $height,
  //       child: ${child?.toSource(context)},
  //     )''';
  // }

  // @override
  // List<Widget> nodePropertyEditors(BuildContext context, {bool allowButtonCallouts = false}) => [
  //       SizedBox(height: 10),
  //       NodePropertyButtonText(
  //           label: "placeholder name",
  //           text: name,
  //           calloutSize: const Size(600, 200),
  //           onChangeF: (s) {
  //             name = s;
  //             bloc.add(const CAPIEvent.forceRefresh());
  //           }),
  //       SizedBox(height: 10),
  //       NodePropertyButtonText(
  //           label: "default snippet name",
  //           text: defaultSnippetName,
  //           calloutSize: const Size(600, 200),
  //           onChangeF: (s) {
  //             defaultSnippetName = s;
  //             bloc.add(const CAPIEvent.forceRefresh());
  //           }),
  //       SizedBox(height: 10),
  //       Row(
  //         children: [
  //           SizedBox(
  //             width: 90,
  //             height: 40,
  //             child: DecimalEditor(
  //               label: 'width',
  //               originalS: width?.toString() ?? '',
  //               onChangedF: (newWidth) {
  //                 width = double.tryParse(newWidth);
  //                 bloc.add(const CAPIEvent.forceRefresh());
  //               },
  //             ),
  //           ),
  //           SizedBox(width: 10),
  //           SizedBox(
  //             width: 90,
  //             height: 40,
  //             child: DecimalEditor(
  //               label: 'height',
  //               originalS: height?.toString() ?? '',
  //               onChangedF: (newHeight) {
  //                 height = double.tryParse(newHeight);
  //                 bloc.add(const CAPIEvent.forceRefresh());
  //               },
  //             ),
  //           ),
  //         ],
  //       ),
  //     ];

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "Placeholder";
}
