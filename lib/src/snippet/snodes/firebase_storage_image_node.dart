// // ignore_for_file: constant_identifier_names
//
// import 'package:dart_mappable/dart_mappable.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:firebase_ui_storage/firebase_ui_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_content/flutter_content.dart';
// import 'package:flutter_content/src/snippet/pnodes/enums/enum_alignment.dart';
// import 'package:flutter_content/src/snippet/pnodes/enums/enum_boxfit.dart';
//
// part 'firebase_storage_image_node.mapper.dart';
//
// @MappableClass()
// class FirebaseStorageImageNode extends CL with FirebaseStorageImageNodeMappable {
//   String name;
//   String fsUrl;
//   double? width;
//   double? height;
//   BoxFitEnum? fit;
//   AlignmentEnum? alignment;
//
//   FirebaseStorageImageNode({
//     this.name = '',
//     this.fsUrl = 'gs://flutter-content-demo.appspot.com/missing-image.PNG',
//     this.fit,
//     this.alignment,
//     this.width,
//     this.height,
//   });
//
//   @override
//   List<PNode> properties(BuildContext context, SNode? parentSNode) => [
//         StringPNode(
//           snode: this,
//           name: 'name',
//           stringValue: name,
//           skipHelperText: true,
//           onStringChange: (newValue) =>
//               refreshWithUpdate(context,() => name = newValue ?? ''),
//           calloutButtonSize: const Size(280, 70),
//           calloutWidth: 400,
//         ),
//         StringPNode(
//           snode: this,
//           name: 'fsUrl',
//           stringValue: fsUrl,
//           skipHelperText: true,
//           onStringChange: (newValue) =>
//               refreshWithUpdate(context,() => name = newValue ?? ''),
//           calloutButtonSize: const Size(280, 70),
//           calloutWidth: 400,
//         ),
//         DecimalPNode(
//           snode: this,
//           name: 'width',
//           decimalValue: width,
//           onDoubleChange: (newValue) =>
//               refreshWithUpdate(context,() => width = newValue),
//           calloutButtonSize: const Size(80, 20),
//         ),
//         DecimalPNode(
//           snode: this,
//           name: 'height',
//           decimalValue: height,
//           onDoubleChange: (newValue) =>
//               refreshWithUpdate(context,() => height = newValue),
//           calloutButtonSize: const Size(80, 20),
//         ),
//         EnumPNode<BoxFitEnum?>(
//           snode: this,
//           name: 'fit',
//           valueIndex: fit?.index,
//           onIndexChange: (newValue) =>
//               refreshWithUpdate(context,() => fit = BoxFitEnum.of(newValue)),
//         ),
//         EnumPNode<AlignmentEnum?>(
//           snode: this,
//           name: 'alignment',
//           valueIndex: alignment?.index,
//           onIndexChange: (newValue) =>
//               refreshWithUpdate(context,() => alignment = AlignmentEnum.of(newValue)),
//         ),
//       ];
//
//   @override
//   Widget toWidget(BuildContext context, SNode? parentNode) {
//     if (fco.usingFBStorage) return Error(
//         key: createNodeWidgetGK(),
//         FLUTTER_TYPE,
//         color: Colors.red,
//         size: 16,
//         errorMsg: 'FirebaseStorage usage not specified in main()');
//
//     try {
//       setParent(parentNode); // propagating parents down from root
//       //ScrollControllerName? scName = EditablePage.name(context);
//       //possiblyHighlightSelectedNode(scName);
//       // final storageRef = FirebaseStorage.instance.ref();
//       // final imagesRef = storageRef.child(fsUrl);
//
//       return StorageGridView(
//         key: createNodeWidgetGK(),
//         ref: FirebaseStorage.instance.ref('/some-folder'),
//         loadingBuilder: (context) {
//           return const Center(
//             child: Text('Loading...'),
//           );
//         },
//         itemBuilder: (context, ref) {
//           fco.logger.d('item: ref:${ref.fullPath}');
//           return AspectRatio(
//             aspectRatio: 1,
//             child: StorageImage(ref: ref),
//           );
//         },
//       );
//
//       // return fsUrl.isNotEmpty
//       //     ? SizedBox(
//       //         key: createNodeWidgetGK(),
//       //         width: width,
//       //         height: height,
//       //         child: fetchImage(fsUrl),
//       //       )
//       //     : Placeholder(
//       //         key: createNodeWidgetGK(),
//       //         color: Colors.purpleAccent,
//       //         strokeWidth: 2.0,
//       //         fallbackWidth: width ?? 400,
//       //         fallbackHeight: height ?? 300,
//       //       );
//     } catch (e) {
//       return Error(
//           key: createNodeWidgetGK(),
//           FLUTTER_TYPE,
//           color: Colors.red,
//           size: 16,
//           errorMsg: e.toString());
//     }
//   }
//
//   // Widget fetchImage(String url) => Center(
//   //       child: Image(
//   //         width: width,
//   //         height: height,
//   //         fit: fit?.flutterValue,
//   //         alignment: alignment?.flutterValue ?? Alignment.center,
//   //         image: FirebaseImageProvider(
//   //           FirebaseUrl(url),
//   //           // Specify CacheOptions to control file fetching and caching behavior.
//   //           options: const CacheOptions(
//   //             // Always fetch the latest file from the server and do not cache the file.
//   //             // default is Source.cacheServer which will fetch try to fetch the image from the cache and then hit server if the image not found in the cache.
//   //             source: Source.server,
//   //             // Check if the image is updated on the server or not, if updated then download the latest image otherwise use the cached image.
//   //             // Will only be used if the options.source is Source.cacheServer
//   //             checkForMetadataChange: true,
//   //           ),
//   //           // Use this to save files in desired directory in system's temporary directory
//   //           // Optional. default is "flutter_cached_image"
//   //           subDir: "custom_cache_directory",
//   //         ),
//   //         errorBuilder: (context, error, stackTrace) {
//   //           // [ImageNotFoundException] will be thrown if image does not exist on server.
//   //           if (error is ImageNotFoundException) {
//   //             // Handle ImageNotFoundException and show a user-friendly message.
//   //             return const Text('Image not found on Cloud Storage.');
//   //           } else {
//   //             // Handle other errors.
//   //             return Text('Error loading image: $error');
//   //           }
//   //         },
//   //         // The loading progress may not be accurate as Firebase Storage API
//   //         // does not provide a stream of bytes downloaded. The progress updates only at the start and end of the loading process.
//   //         loadingBuilder: (_, Widget child, ImageChunkEvent? loadingProgress) {
//   //           if (loadingProgress == null) {
//   //             // Show the loaded image if loading is complete.
//   //             return child;
//   //           } else {
//   //             // Show a loading indicator with progress information.
//   //             return CircularProgressIndicator(
//   //               value: loadingProgress.expectedTotalBytes != null
//   //                   ? loadingProgress.cumulativeBytesLoaded /
//   //                       (loadingProgress.expectedTotalBytes ?? 1)
//   //                   : null,
//   //             );
//   //           }
//   //         },
//   //       ),
//   //     );
//
//   @override
//   String toString() => FLUTTER_TYPE;
//
// @override
// Widget? logoSrc() => Image.asset(
//   fco.asset('lib/assets/images/pub.dev.png'),
//   width: 16,
// );
//
//   static const String FLUTTER_TYPE = "FS Image";
// }
