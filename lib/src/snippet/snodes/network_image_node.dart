// import 'package:dart_mappable/dart_mappable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_content/flutter_content.dart';
// import 'package:flutter_content/src/bloc/capi_event.dart';
// import 'package:flutter_content/src/target_config/content/snippet_editor/node_properties/node_property_button_text.dart';
//
// part 'network_image_node.mapper.dart';
//
// @MappableClass()
// class NetworkImageNode extends ChildlessNode with NetworkImageNodeMappable {
//   String src;
//   double? width;
//   double? height;
//   double scale;
//   NodeBoxFit? fit;
//   NodeAlignment alignment;
//
//   NetworkImageNode({
//     this.src = '',
//     this.fit,
//     this.alignment = NodeAlignment.center,
//     this.width,
//     this.height,
//     this.scale = 1.0,
//   });
//
//   @override
//   List<Widget> nodePropertyButtons(BuildContext context) => [
//       // NETWORK SRC
//       const SizedBox(height: 8),
//       NodePropertyButtonText(
//         label: "src",
//         text: src,
//         calloutSize: const Size(600, 60),
//         onChangeF: (s) {
//           src = s;
//           bloc.add(const CAPIEvent.forceRefresh());
//         },
//       ),
//     ];
//
//
//   @override
//   Widget toWidget(ThemeData themeData) {
//     return Image.asset(
//       src,
//       scale: scale,
//       width: width,
//       height: height,
//       fit: fit?.toWidget(),
//       alignment: alignment.toWidget(),
//     );
//   }
//
//   @override
//   String label() => FLUTTER_TYPE;
//
//   static const String FLUTTER_TYPE = "Image.network";
// }
