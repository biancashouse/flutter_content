// import 'package:flutter/material.dart';
// import 'package:flutter_content/src/api/app/callout_content_editable_page.dart';
// import 'package:go_router/go_router.dart';
//
// // same as GoRoute, with onExit to dismiss any callouts
// class CalloutContentEditablePageRoute extends GoRoute {
//   final GoRouterWidgetBuilder? builder;
//   final bool provideNamedScrollController;
//
//   CalloutContentEditablePageRoute({
//     required this.builder,
//     required super.path, // path is also the snippet name
//     this.provideNamedScrollController = false,
//     super.routes,
//   }) : super(
//           onExit: (BuildContext context, GoRouterState state) async {
//             return true;
//           },
//           builder: (BuildContext context, GoRouterState state) {
//             return FutureBuilder<void>(
//               future: Future.delayed(Duration.zero),
//               builder: (ctx, snap) {
//                 if (snap.connectionState != ConnectionState.done &&
//                     !snap.hasData) {
//                   return const CircularProgressIndicator();
//                 } else {
//                   String routePath = state.path ?? 'missing route path!';
//                   // fco.currentRoute = routePath;
//                   return CalloutContentEditablePage(
//                     key: GlobalKey(), // provides access to state later
//                     cid: routePath,
//                   );
//                 }
//               },
//             );
//           },
//         );
// }
