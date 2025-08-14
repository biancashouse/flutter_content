// ignore_for_file: constant_identifier_names

import 'package:dart_mappable/dart_mappable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_ui_storage/firebase_ui_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_content/flutter_content.dart';
import 'package:flutter_content/src/snippet/pnodes/decimal_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/enum_pnode.dart';
import 'package:flutter_content/src/snippet/pnodes/enums/enum_boxfit.dart';
import 'package:flutter_content/src/snippet/pnodes/fs_image_path_node.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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

  @JsonKey(includeFromJson: false, includeToJson: false)
  bool _mustReloadedAfter100Ms = true;

  // @JsonKey(includeFromJson: false, includeToJson: false)
  // Uint8List? cachedPngBytes;

  @override
  List<PNode> propertyNodes(BuildContext context, SNode? parentSNode) => [
        FSImagePathPNode(
          snode: this,
          name: 'image picker',
          stringValue: fsFullPath,
          onPathChange: (newValue) => refreshWithUpdate(context,() => fsFullPath =
              newValue ??
                  'gs://bh-apps.appspot.com/flutter-content-pkg/missing-image.png'),
          calloutButtonSize: const Size(280, 70),
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
              refreshWithUpdate(context,() => scale = newValue),
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

  @override
  Widget buildFlutterWidget(BuildContext context, SNode? parentNode) {
    try {
      setParent(parentNode); // propagating parents down from root
      //ScrollControllerName? scName = EditablePage.name(context);
      //possiblyHighlightSelectedNode(scName);

      // sometimes the image hasn't been loaded yet
      if (false && _mustReloadedAfter100Ms) {
        fco.afterMsDelayDo(100, () {
          fco.forceRefresh();
          _mustReloadedAfter100Ms = false;
        });
      }

      GlobalKey? gk;
      if (parentNode is! CarouselNode) {
        gk = createNodeWidgetGK();
      }

      Widget widget = StorageImage(
        key: gk,
        fit: fit?.flutterValue,
        width: width,
        height: height,
        scale: scale ?? 1.0,
        alignment: alignment?.flutterValue ?? Alignment.center,
        ref: FirebaseStorage.instance.ref(fsFullPath ??
            'gs://bh-apps.appspot.com/flutter-content-pkg/missing-image.png'),
      );
      return widget;
    } catch (e) {
      return Error(
          key: createNodeWidgetGK(),
          FLUTTER_TYPE,
          color: Colors.red,
          size: 16,
          errorMsg: e.toString());
    }
  }

  @override
  Widget? widgetLogo() => Image.asset(
    fco.asset('lib/assets/images/pub.dev.png'),
    width: 16,
  );

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
