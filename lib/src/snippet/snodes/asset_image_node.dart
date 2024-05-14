// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_alignment.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_boxfit.dart';

part 'asset_image_node.mapper.dart';

@MappableClass()
class AssetImageNode extends CL with AssetImageNodeMappable {
  String name;
  double? width;
  double? height;
  double? scale;
  BoxFitEnum? fit;
  AlignmentEnum? alignment;

  // Color? color;
  // Animation<double>? opacity;
  // BlendMode? colorBlendMode;

  AssetImageNode({
    this.name = '',
    this.fit,
    this.alignment,
    this.width,
    this.height,
    this.scale,
    // this.color,
    // this.opacity,
    // this.blendMode,
  });

  @override
  List<PTreeNode> createPropertiesList(BuildContext context) => [
        StringPropertyValueNode(
          snode: this,
          name: 'name',
          stringValue: name,
          skipHelperText: true,
          onStringChange: (newValue) => refreshWithUpdate(() => name = newValue),
          calloutButtonSize: const Size(280, 70),
          calloutWidth: 400,
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
        DecimalPropertyValueNode(
          snode: this,
          name: 'scale',
          decimalValue: scale,
          onDoubleChange: (newValue) => refreshWithUpdate(() => scale = newValue),
          calloutButtonSize: const Size(80, 20),
        ),
        EnumPropertyValueNode<BoxFitEnum?>(
          snode: this,
          name: 'fit',
          valueIndex: fit?.index,
          onIndexChange: (newValue) => refreshWithUpdate(() => fit = BoxFitEnum.of(newValue)),
        ),
        EnumPropertyValueNode<AlignmentEnum?>(
          snode: this,
          name: 'alignment',
          valueIndex: alignment?.index,
          onIndexChange: (newValue) => refreshWithUpdate(() => alignment = AlignmentEnum.of(newValue)),
        ),
      ];

  // @override
  // List<Widget> nodePropertyEditors(BuildContext context, {bool allowButtonCallouts = false}) => [
  //       NodePropertyButtonText(
  //           label: "name",
  //           text: name,
  //           calloutSize: const Size(600, 100),
  //           onChangeF: (s) {
  //             name = s;
  //             bloc.add(const CAPIEvent.forceRefresh());
  //           }),
  //       const SizedBox(height: 10),
  //       Row(
  //         children: [
  //           SizedBox(
  //             width: 80,
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
  //           const SizedBox(width: 10),
  //           SizedBox(
  //             width: 80,
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
  //       const SizedBox(height: 10),
  //       SizedBox(
  //         width: 80,
  //         height: 40,
  //         child: DecimalEditor(
  //           label: 'scale',
  //           originalS: scale?.toString() ?? '',
  //           onChangedF: (newScale) {
  //             scale = double.tryParse(newScale);
  //             bloc.add(const CAPIEvent.forceRefresh());
  //           },
  //         ),
  //       ),
  //       NodePropertyButtonEnum(
  //         label: 'fit',
  //         menuItems: BoxFitEnum.values.map((e) => e.toMenuItem()).toList(),
  //         originalEnumIndex: fit?.index,
  //         onChangeF: (newOption) {
  //           fit = BoxFitEnum.values[newOption];
  //           bloc.add(const CAPIEvent.forceRefresh());
  //         },
  //         wrap: false,
  //         calloutSize: BoxFitEnum.calloutSize,
  //       ),
  //       NodePropertyButtonEnum(
  //         label: 'alignment',
  //         menuItems: AlignmentEnum.values.map((e) => e.toMenuItem()).toList(),
  //         originalEnumIndex: alignment.index,
  //         onChangeF: (newOption) {
  //           alignment = AlignmentEnum.values[newOption];
  //           bloc.add(const CAPIEvent.forceRefresh());
  //         },
  //         calloutSize: AlignmentEnum.calloutSize,
  //       ),
  //     ];

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    setParent(parentNode); // propagating parents down from root
    possiblyHighlightSelectedNode();
    return name.isNotEmpty
        ? SizedBox(
            key: createNodeGK(),
            width: width,
            height: height,
            child: Image.asset(
              name,
              scale: scale,
              width: width,
              height: height,
              fit: fit?.flutterValue,
              alignment: alignment?.flutterValue ?? Alignment.center,
              // package: 'flutter_content',
            ),
          )
        : Placeholder(
            key: createNodeGK(),
            color: Colors.purpleAccent,
            strokeWidth: 2.0,
            fallbackWidth: (width ?? 400) * (scale ?? 1.0),
            fallbackHeight: (height ?? 300) * (scale ?? 1.0),
          );
  }

  // @override
  // String toSource(BuildContext context) {
  //   return name.length > 0
  //       ? '''Image.asset(${name},
  //     scale: $scale,
  //     width: $width,
  //     height: $height,
  //     fit: ${fit?.toSource()},
  //     alignment: ${alignment.toSource()},
  //   )'''
  //       : '''Placeholder(
  //     color: Colors.purpleAccent,
  //     strokeWidth: 2.0,
  //     fallbackWidth: (width??400) * (scale ?? 1.0),
  //     fallbackHeight: (height??300) * (scale ?? 1.0),
  //   )''';
  // }

  @override
  List<Widget> menuAnchorWidgets_WrapWith(SnippetBloC snippetBloc, NodeAction action, bool? skipHeading) {
    return [
      ...super.menuAnchorWidgets_Heading(snippetBloc, action),
      menuItemButton("Carousel", snippetBloc, CarouselNode, action),
      menuItemButton("AspectRatio", snippetBloc, AspectRatioNode, action),
      ...super.menuAnchorWidgets_WrapWith(snippetBloc, action, true),
    ];
  }

  @override
  List<Type> wrapWithRecommendations() => [CarouselNode];

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "Image.asset";
}
