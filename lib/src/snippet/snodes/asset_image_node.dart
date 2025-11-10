// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/measuring/size_aware_widget.dart';
import 'package:flutter_content/src/snippet/pnodes/decimal_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/enum_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_boxfit.dart';
import 'package:flutter_content/src/snippet/pnodes/string_pnode.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset_image_node.mapper.dart';

@MappableClass(hook: PropertyRenameHook('name', 'assetPath'))
class AssetImageNode extends CL with AssetImageNodeMappable {
  String? assetPath;
  double scale;
  BoxFitEnum? fit;
  AlignmentEnum? alignment;

  // Color? color;
  // Animation<double>? opacity;
  // BlendMode? colorBlendMode;

  AssetImageNode({
    this.assetPath,
    this.fit,
    this.alignment,
    this.scale = 1.0,
    // this.color,
    // this.opacity,
    // this.blendMode,
  });

  @JsonKey(includeFromJson: false, includeToJson: false)
  GlobalKey? _gk;

  @override
  List<PNode> propertyNodes(BuildContext context, SNode? parentSNode) => [
    StringPNode(
      snode: this,
      name: 'assetPath',
      stringValue: assetPath,
      skipHelperText: true,
      onStringChange: (newValue) =>
          refreshWithUpdate(context, () => assetPath = newValue),
      calloutButtonSize: const Size(280, 70),
      calloutWidth: 400,
    ),
    DecimalPNode(
      snode: this,
      name: 'scale',
      decimalValue: scale,
      onDoubleChange: (newValue) =>
          refreshWithUpdate(context, () => scale = newValue ?? 1.0),
      calloutButtonSize: const Size(80, 20),
    ),
    EnumPNode<BoxFitEnum?>(
      snode: this,
      name: 'fit',
      valueIndex: fit?.index,
      onIndexChange: (newValue) =>
          refreshWithUpdate(context, () => fit = BoxFitEnum.of(newValue)),
    ),
    EnumPNode<AlignmentEnum?>(
      snode: this,
      name: 'alignment',
      valueIndex: alignment?.index,
      onIndexChange: (newValue) => refreshWithUpdate(
        context,
        () => alignment = AlignmentEnum.of(newValue),
      ),
    ),
  ];

  @override
  Widget buildFlutterWidget(BuildContext context, SNode? parentNode) {
    try {
      setParent(parentNode); // propagating parents down from root
      // ScrollControllerName? scName = EditablePage.name(context);
      // possiblyHighlightSelectedNode(scName);

      _gk ??= createNodeWidgetGK();

      return assetPath?.isNotEmpty ?? false
          ? SizeAwareWidget.asset(
              key: _gk,
              // use parent key instead for image
              onSizeAvailable: (size) {},
              assetPath: assetPath!,
              scale: scale,
              fit: fit?.flutterValue,
              alignment: alignment?.alignment ?? Alignment.center,
              errorBuilder: (context, o, stackTrace) {
                return Error(
                  key: _gk = createNodeWidgetGK(),
                  FLUTTER_TYPE,
                  color: Colors.red,
                  size: 18,
                  errorMsg: 'Missing: $assetPath',
                );
              },
            )
          : Placeholder(
              key: _gk,
              color: Colors.purpleAccent,
              strokeWidth: 2.0,
            );
    } catch (e) {
      return Error(
        key: _gk,
        FLUTTER_TYPE,
        color: Colors.red,
        size: 18,
        errorMsg: e.toString(),
      );
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
    BuildContext context,
    NodeAction action,
    bool? skipHeading,
    ScrollControllerName? scName,
  ) {
    return [
      ...super.menuAnchorWidgets_Heading(context, action, scName),
      menuItemButton(context, "Carousel", CarouselNode, action, scName),
      menuItemButton(context, "AspectRatio", AspectRatioNode, action, scName),
      ...super.menuAnchorWidgets_WrapWith(context, action, true, scName),
    ];
  }

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "Image.asset";
}
