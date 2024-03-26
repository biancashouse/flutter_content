// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_ui_storage/firebase_ui_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_alignment.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_boxfit.dart';

part 'fs_image_node.mapper.dart';

@MappableClass()
class FSImageNode extends CL with FSImageNodeMappable {
  String fsFullPath;
  double? width;
  double? height;
  double? scale;
  BoxFitEnum? fit;
  AlignmentEnum? alignment;

  FSImageNode({
    this.fsFullPath = 'gs://flutter-content-2dc30.appspot.com/missing-image.PNG',
    this.fit,
    this.alignment,
    this.width,
    this.height,
    this.scale,
  });

  @override
  List<PTreeNode> createPropertiesList(BuildContext context) => [
    FSImagePathPropertyValueNode(
          snode: this,
          name: 'fullPath',
          stringValue: fsFullPath,
          onPathChange: (newValue) => refreshWithUpdate(() => fsFullPath = newValue ?? 'gs://flutter-content-2dc30.appspot.com/missing-image.PNG'),
          calloutButtonSize: const Size(280, 70),
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

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    setParent(parentNode);  // propagating parents down from root
    possiblyHighlightSelectedNode();
    return fsFullPath.isNotEmpty
        ? SizedBox(
            key: createNodeGK(),
            width: width,
            height: height,
            child: StorageImage(ref: FirebaseStorage.instance.ref(fsFullPath)),
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
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "Image.asset";
}
