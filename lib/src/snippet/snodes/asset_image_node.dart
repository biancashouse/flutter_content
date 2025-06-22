// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/decimal_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/enum_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_alignment.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_boxfit.dart';
import 'package:flutter_content/src/snippet/pnodes/string_pnode.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset_image_node.mapper.dart';

@MappableClass()
class AssetImageNode extends CL with AssetImageNodeMappable {
  String? name;
  double? width;
  double? height;
  double scale;
  BoxFitEnum? fit;
  AlignmentEnum? alignment;

  // Color? color;
  // Animation<double>? opacity;
  // BlendMode? colorBlendMode;

  AssetImageNode({
    this.name,
    this.fit,
    this.alignment,
    this.width,
    this.height,
    this.scale = 1.0,
    // this.color,
    // this.opacity,
    // this.blendMode,
  });

  @JsonKey(includeFromJson: false, includeToJson: false)
  GlobalKey? _gk;

  @override
  List<PNode> properties(BuildContext context, SNode? parentSNode) => [
        StringPNode(
          snode: this,
          name: 'name',
          stringValue: name,
          skipHelperText: true,
          onStringChange: (newValue) =>
              refreshWithUpdate(context,() => name = newValue),
          calloutButtonSize: const Size(280, 70),
          calloutWidth: 400,
        ),
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
          name: 'scale',
          decimalValue: scale,
          onDoubleChange: (newValue) =>
              refreshWithUpdate(context,() => scale = newValue ?? 1.0),
          calloutButtonSize: const Size(80, 20),
        ),
        EnumPNode<BoxFitEnum?>(
          snode: this,
          name: 'fit',
          valueIndex: fit?.index,
          onIndexChange: (newValue) =>
              refreshWithUpdate(context,() => fit = BoxFitEnum.of(newValue)),
        ),
        EnumPNode<AlignmentEnum?>(
          snode: this,
          name: 'alignment',
          valueIndex: alignment?.index,
          onIndexChange: (newValue) =>
              refreshWithUpdate(context,() => alignment = AlignmentEnum.of(newValue)),
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
  Widget toWidget(BuildContext context, SNode? parentNode) {
    try {
      setParent(parentNode); // propagating parents down from root
      // ScrollControllerName? scName = EditablePage.name(context);
      // possiblyHighlightSelectedNode(scName);

      if (_gk == null) {
        _gk = createNodeWidgetGK();
        // fco.afterMsDelayDo(1000, () => fco.forceRefresh());
      }

      return name?.isNotEmpty ?? false
          ? LayoutBuilder(builder: (context, constraints) {
              double? w = width != null
                  ? width! * scale
                  : constraints.maxWidth != double.infinity
                      ? constraints.maxWidth * scale
                      : null;
              // double? h = height != null
              //     ? height! * scale
              //     : constraints.maxHeight != double.infinity
              //     ? constraints.maxHeight*scale
              //     : null;
              // fco.logger.i('Constrints: ${constraints.toString()}');
              return SizedBox(
                width: w,
                //height: h,
                child: Image.asset(
                  // key: parentNode?.nodeWidgetGK, // use parent key instead for image
                  name!,
                  // scale: scale,
                  fit: fit?.flutterValue,
                  alignment: alignment?.flutterValue ?? Alignment.center,
                  // package: 'flutter_content',
                  errorBuilder: (context, o, stackTrace) {
                    return Error(
                      key: _gk = createNodeWidgetGK(),
                      FLUTTER_TYPE,
                      color: Colors.red,
                      size: 18,
                      errorMsg: 'Missing: $name',
                    );
                  },
                ),
              );
            })
          : Placeholder(
              key: _gk,
              color: Colors.purpleAccent,
              strokeWidth: 2.0,
              fallbackWidth: (width ?? 400) * (scale),
              fallbackHeight: (height ?? 300) * (scale),
            );
    } catch (e) {
      return Error(
          key: _gk,
          FLUTTER_TYPE,
          color: Colors.red,
          size: 18,
          errorMsg: e.toString());
    }
  }

  // @override
  // Widget toWidget(BuildContext context, STreeNode? parentNode) {
  //   try {
  //     setParent(parentNode); // propagating parents down from root
  //     possiblyHighlightSelectedNode();
  //     return name?.isNotEmpty ?? false
  //             ? LayoutBuilder(
  //             key: createNodeGK(),
  //               builder: (context, constraints) {
  //                 double? w = width != null
  //                     ? width! * scale
  //                     : constraints.maxWidth != double.infinity
  //                     ? constraints.maxWidth*scale
  //                     : null;
  //                 double? h = height != null
  //                     ? height! * scale
  //                     : constraints.maxHeight != double.infinity
  //                     ? constraints.maxHeight*scale
  //                     : null;
  //               // fco.logger.i('Constrints: ${constraints.toString()}');
  //                 return SizedBox(
  //                   width: w,
  //                   height: h,
  //                     child: Image.asset(
  //                       name!,
  //                       // scale: scale,
  //                       fit: fit?.flutterValue,
  //                       alignment: alignment?.flutterValue ?? Alignment.center,
  //                       // package: 'flutter_content',
  //                     ),
  //                   );
  //               }
  //             )
  //             : Placeholder(
  //                 key: createNodeGK(),
  //                 color: Colors.purpleAccent,
  //                 strokeWidth: 2.0,
  //                 fallbackWidth: (width ?? 400) * (scale ?? 1.0),
  //                 fallbackHeight: (height ?? 300) * (scale ?? 1.0),
  //               );
  //   } catch (e) {
  //     fco.logger.e('', error:e);
  //     return const Column(
  //       children: [
  //         Text(FLUTTER_TYPE),
  //         fco.errorIcon(color: Colors.red, size: 32),
  //       ],
  //     );
  //   }
  // }

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
  List<Widget> menuAnchorWidgets_WrapWith(
    NodeAction action,
    bool? skipHeading,
    ScrollControllerName? scName,
  ) {
    return [
      ...super.menuAnchorWidgets_Heading(action, scName),
      menuItemButton("Carousel", CarouselNode, action, scName),
      menuItemButton("AspectRatio", AspectRatioNode, action, scName),
      ...super.menuAnchorWidgets_WrapWith(
        action,
        true,
        scName,
      ),
    ];
  }

  @override
  List<Type> wrapWithRecommendations() => [CarouselNode];

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "Image.asset";
}