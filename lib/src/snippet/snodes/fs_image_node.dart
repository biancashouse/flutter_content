// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_ui_storage/firebase_ui_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_alignment.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_boxfit.dart';

part 'fs_image_node.mapper.dart';

@MappableClass()
class FSImageNode extends CL with FSImageNodeMappable {
  String? fsFullPath;
  double? width;
  double? height;
  double? scale;
  BoxFitEnum? fit;
  AlignmentEnum? alignment;

  FSImageNode({
    this.fsFullPath,
    this.fit,
    this.alignment,
    this.width,
    this.height,
    this.scale,
  });

  @override
  List<PTreeNode> properties(BuildContext context) => [
        FSImagePathPropertyValueNode(
          snode: this,
          name: 'fullPath',
          stringValue: fsFullPath,
          onPathChange: (newValue) => refreshWithUpdate(() => fsFullPath =
              newValue ??
                  'gs://bh-apps.appspot.com/flutter-content-pkg/missing-image.png'),
          calloutButtonSize: const Size(280, 70),
        ),
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
          name: 'scale',
          decimalValue: scale,
          onDoubleChange: (newValue) =>
              refreshWithUpdate(() => scale = newValue),
          calloutButtonSize: const Size(80, 20),
        ),
        EnumPropertyValueNode<BoxFitEnum?>(
          snode: this,
          name: 'fit',
          valueIndex: fit?.index,
          onIndexChange: (newValue) =>
              refreshWithUpdate(() => fit = BoxFitEnum.of(newValue)),
        ),
        EnumPropertyValueNode<AlignmentEnum?>(
          snode: this,
          name: 'alignment',
          valueIndex: alignment?.index,
          onIndexChange: (newValue) =>
              refreshWithUpdate(() => alignment = AlignmentEnum.of(newValue)),
        ),
      ];

  @override
  Widget toWidget(BuildContext context, STreeNode? parentNode) {
    try {
      setParent(parentNode); // propagating parents down from root
      possiblyHighlightSelectedNode();
      Widget widget = StorageImage(
            fit: fit?.flutterValue,
            width: width,
            height: height,
            scale: scale??1.0,
            alignment: alignment?.flutterValue ?? Alignment.center,
            ref: FirebaseStorage.instance.ref(fsFullPath ?? 'gs://bh-apps.appspot.com/flutter-content-pkg/missing-image.png'),
          );
      return widget;
    } catch (e) {
      print(e);
      return const Column(
        children: [
          Text(FLUTTER_TYPE),
          Icon(Icons.error_outline, color: Colors.red, size: 32),
        ],
      );
    }
  }

  @override
  String toString() => FLUTTER_TYPE;

  static const String FLUTTER_TYPE = "FB Storage Image";
}

/// /// A [GridView.builder] that automatically handles paginated loading from
/// [FirebaseStorage].
///
/// Example usage:
///
/// ```dart
/// class MyGridView extends StatelessWidget {
///  const MyGridView({super.key});
///
///  @override
///  Widget build(BuildContext context) {
///    return StorageGridView(
///      ref: FirebaseStorage.instance.ref('list'),
///      itemBuilder: (context, ref) {
///        return Card(
///          child: Center(
///            child: FutureBuilder(
///              future: ref.getData(),
///              builder: (context, snapshot) {
///                if (snapshot.hasError) {
///                  return Text(snapshot.error.toString());
///                }
///                if (snapshot.hasData) {
///                  return Text(utf8.decode(snapshot.data!));
///                }
///
///                return const CircularProgressIndicator();
///              },
///            ),
///          ),
///        );
///      },
///    );
///  }
///}
/// ```
