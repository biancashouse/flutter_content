// // ignore_for_file: camel_case_types
//
// import 'package:dart_mappable/dart_mappable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_content/flutter_content.dart';
// import 'package:flutter_content/src/snippet/pnodes/editors/property_button_enum.dart';
// import 'package:flutter_content/src/snippet/pnodes/enums/enum_main_axis_size.dart';
//
// part 'app_snippet_templates.mapper.dart';
//
// @MappableEnum()
// enum AppTemplateEnum {
//   filled_route_button,
//   splitview_with_2_images,
//   column_with_2_images,
//   splitview_with_2_snippets,
//   column_with_2_snippets;
//
//   Widget toMenuItem() => Useful.coloredText(_menuItem(), color: Colors.white);
//
//   String _menuItem() => switch (this) {
//   //
//     AppTemplateEnum.splitview_with_2_images => 'splitview with 2 images',
//   //
//     AppTemplateEnum.column_with_2_images => 'column with 2 images',
//   //
//     AppTemplateEnum.splitview_with_2_snippets => 'splitview with 2 snippets',
//   //
//     AppTemplateEnum.column_with_2_snippets => 'column with 2 snippets',
//     AppTemplateEnum.filled_route_button => 'filled navigation button',
//   };
//
//   SnippetRootNode snippet() => switch (this) {
//   //
//     AppTemplateEnum.splitview_with_2_images => SnippetRootNode(
//       name: AppTemplateEnum.splitview_with_2_images.name,
//       child: PlaceholderNode(),
//     ),
//   //
//     AppTemplateEnum.column_with_2_images => SnippetRootNode(
//       name: AppTemplateEnum.column_with_2_images.name,
//       child: ColumnNode(
//         mainAxisSize: MainAxisSizeEnum.max,
//         children: [
//           SizedBoxNode(
//             child: CenterNode(
//               child: AssetImageNode(name: 'assets/images/bridging-the-gap-logo.jpeg'),
//             ),
//           ),
//           SizedBoxNode(
//             child: CenterNode(
//               child: HotspotsNode(
//                 child: AssetImageNode(name: 'assets/images/top-cat-gang.png'),
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   //
//     AppTemplateEnum.splitview_with_2_snippets => SnippetRootNode(
//       name: AppTemplateEnum.splitview_with_2_snippets.name,
//       child: PlaceholderNode(),
//     ),
//
//   //
//     AppTemplateEnum.column_with_2_snippets => SnippetRootNode(
//       name: AppTemplateEnum.column_with_2_snippets.name,
//       child: PlaceholderNode(),
//     ),
//   //
//     AppTemplateEnum.filled_route_button => SnippetRootNode(
//       name: 'filled-button-snippet',
//       child: FilledButtonNode(
//         destinationRoutePathSnippetName: '/row-of-2-panels',
//         template: SnippetTemplateEnum,
//         child: TextNode(text: 'go to page: row of 2 panels'),
//       ),
//     ),
//   };
//
//   List<Widget> get allItems => values.map((e) => e.toMenuItem()).toList();
//
//   SnippetRootNode? clone() => snippet()
//     ..clone()
//     ..validateTree();
// }
