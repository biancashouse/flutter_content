// import 'package:flutter/material.dart';
//
// import 'package:flutter_content/flutter_content.dart';
//
// class Page_Quill_Test extends StatelessWidget {
//   const Page_Quill_Test({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final uniqueTabBarName = DateTime.now().millisecondsSinceEpoch.toString();
//     SnippetBuilder sp = SnippetBuilder.fromNodes(
//       snippetRootNode: SnippetRootNode(
//         name: 'quill-test',
//         child: ScaffoldNode(
//           body: GenericSingleChildNode(
//             propertyName: 'body',
//             child: PlaceholderNode(),
//           ),
//         ),
//       ),
//
//       // snippetRootNode: SnippetRootNode(
//       //   name: 'we-create-flutter-apps-and-packages',
//       //   child: PlaceholderNode()
//       // ),
//       scName: null, //sC.name, because no scrolling used
//     );
//
//     return EditablePage(routePath: '/', key: GlobalKey(), child: sp);
//   }
// }
